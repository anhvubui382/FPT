package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import models.AttendanceRecord;

public class AttendanceRecordDAO extends DBContext {

    public AttendanceRecordDAO() {
        super();
    }

    public List<AttendanceRecord> selectAttendanceRecordsByTeacherID(int teacherID, String startDate, String endDate) {
        List<AttendanceRecord> records = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = super.getConnection();
            String query = "SELECT * FROM Attendance WHERE TeacherID = ? AND Date BETWEEN ? AND ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, teacherID);
            preparedStatement.setString(2, startDate);
            preparedStatement.setString(3, endDate);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setAttendanceID(resultSet.getInt("AttendanceID"));
                record.setTeacherID(resultSet.getInt("TeacherID"));
                record.setStudentID(resultSet.getInt("StudentID"));
                record.setCourseName(resultSet.getString("CourseName"));
                record.setClassName(resultSet.getString("ClassName"));
                record.setSlot(resultSet.getInt("Slot"));
                record.setDate(resultSet.getDate("Date"));
                record.setIsPresent(resultSet.getInt("IsPresent"));

                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return records;
    }

    public List<AttendanceRecord> selectAttendanceRecordsByTeacherIDAndDateRange(int teacherID, String startDate, String endDate) {
        List<AttendanceRecord> records = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        System.out.println("check DAO: ");
        try {
            connection = super.getConnection();
            String query = "SELECT DISTINCT Date, CourseName, ClassName, Slot FROM Attendance WHERE TeacherID = ? AND Date BETWEEN ? AND ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, teacherID);
            preparedStatement.setString(2, startDate);
            preparedStatement.setString(3, endDate);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setDate(resultSet.getDate("Date"));
                record.setCourseName(resultSet.getString("CourseName"));
                record.setClassName(resultSet.getString("ClassName"));
                record.setSlot(resultSet.getInt("Slot"));

                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return records;
    }

    public List<AttendanceRecord> getAttendanceRecordsBySlotAndDate(String className, String date, int slot) {
        List<AttendanceRecord> records = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = super.getConnection();
            String query = "SELECT A.CourseName, A.StudentID, S.StudentName "
                    + "FROM Attendance A "
                    + "INNER JOIN Students S ON A.StudentID = S.StudentID "
                    + "WHERE A.Slot = ? AND A.ClassName = ? AND A.Date = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, slot);
            preparedStatement.setString(2, className);
            preparedStatement.setString(3, date);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setStudentID(resultSet.getInt("StudentID"));
                record.setStudentName(resultSet.getString("StudentName"));
                record.setCourseName(resultSet.getString("CourseName"));
                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return records;
    }

    public void insertAttendanceRecords(int teacherID, int startStudentID, int endStudentID, String courseName, String className, String slot, String date) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = super.getConnection();
            String query = "INSERT INTO Attendance (TeacherID, StudentID, CourseName, ClassName, Slot, Date) "
                    + "SELECT ?, StudentID, ?, ?, ?, ? "
                    + "FROM Students "
                    + "WHERE StudentID BETWEEN ? AND ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, teacherID);
            preparedStatement.setString(2, courseName);
            preparedStatement.setString(3, className);
            preparedStatement.setString(4, slot);
            preparedStatement.setString(5, date);
            preparedStatement.setInt(6, startStudentID);
            preparedStatement.setInt(7, endStudentID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void updateIsPresent(int teacherID, int studentID, String courseName, String className, int slot, String date, int isPresent) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = super.getConnection();
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            System.out.println("Check isPresent in DAO: " + studentID + ", " + courseName + ", " + className + ", " + slot + ", " + date + ", " + isPresent);

            String query = "UPDATE Attendance "
                    + "SET IsPresent = ? "
                    + "WHERE TeacherID = ? "
                    + "AND StudentID = ? "
                    + "AND CourseName = ? "
                    + "AND ClassName = ? "
                    + "AND Slot = ? "
                    + "AND Date = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, isPresent);
            preparedStatement.setInt(2, teacherID);
            preparedStatement.setInt(3, studentID);
            preparedStatement.setString(4, courseName);
            preparedStatement.setString(5, className);
            preparedStatement.setInt(6, slot);
            preparedStatement.setString(7, date);

            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated);

            if (rowsUpdated == 1) {
                // Commit giao dịch nếu cập nhật thành công
                connection.commit();
                System.out.println("Update successful.");
            } else {
                // Rollback giao dịch nếu có lỗi
                connection.rollback();
                System.out.println("Update failed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                // Rollback giao dịch nếu có lỗi
                connection.rollback();
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
        } finally {

        }
    }

    public List<AttendanceRecord> selectAttendanceRecordsByTeacherIdAndDate(int teacherId, String date) {
        List<AttendanceRecord> records = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = super.getConnection();
            String query = "SELECT DISTINCT Date, CourseName, ClassName, Slot FROM Attendance WHERE TeacherID = ? AND Date = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, teacherId);
            preparedStatement.setString(2, date);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AttendanceRecord record = new AttendanceRecord();

                record.setCourseName(resultSet.getString("CourseName"));
                record.setClassName(resultSet.getString("ClassName"));
                record.setSlot(resultSet.getInt("Slot"));
                record.setDate(resultSet.getDate("Date"));

                records.add(record);
                System.out.println("CourseName: " + record.getCourseName());
                System.out.println("ClassName: " + record.getClassName());
                System.out.println("Slot: " + record.getSlot());
                System.out.println("Date: " + record.getDate());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return records;
    }

    public List<AttendanceRecord> selectAttendanceRecordsByStudentIDAndCourseName(int studentID, String courseName) {
        List<AttendanceRecord> records = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = super.getConnection();
            String query = "SELECT * FROM Attendance WHERE StudentID = ? AND CourseName = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, studentID);
            preparedStatement.setString(2, courseName);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setAttendanceID(resultSet.getInt("AttendanceID"));
                record.setTeacherID(resultSet.getInt("TeacherID"));
                record.setStudentID(resultSet.getInt("StudentID"));
                record.setCourseName(resultSet.getString("CourseName"));
                record.setClassName(resultSet.getString("ClassName"));
                record.setSlot(resultSet.getInt("Slot"));
                record.setDate(resultSet.getDate("Date"));
                int isPresent = resultSet.getInt("IsPresent");
                if (resultSet.wasNull()) {

                    record.setIsPresent(-1);
                } else {
                    record.setIsPresent(isPresent);
                }

                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return records;
    }

    public List<String> getTeacherCourses(int teacherID) {
        List<String> courses = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = super.getConnection();
            String query = "SELECT DISTINCT CourseName FROM Attendance WHERE TeacherID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, teacherID);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String courseName = resultSet.getString("CourseName");
                courses.add(courseName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return courses;
    }

    public List<AttendanceRecord> selectAttendanceRecordsWithPercentage(int teacherID, String courseName) {
        List<AttendanceRecord> records = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = super.getConnection();
            String query = "SELECT A.StudentID, S.StudentName, A.CourseName, "
                    + "SUM(CASE WHEN A.IsPresent = 0 THEN 1 ELSE 0 END) AS CountIsZero, "
                    + "COUNT(*) AS TotalRecords, "
                    + "(SUM(CASE WHEN A.IsPresent = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ZeroPercentage "
                    + "FROM Attendance A "
                    + "JOIN Students S ON A.StudentID = S.StudentID "
                    + "WHERE A.TeacherID = ? AND A.CourseName = ? "
                    + "GROUP BY A.StudentID, S.StudentName, A.CourseName";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, teacherID);
            preparedStatement.setString(2, courseName);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setStudentID(resultSet.getInt("StudentID"));
                record.setStudentName(resultSet.getString("StudentName"));
                record.setCourseName(resultSet.getString("CourseName"));
                record.setCountIsZero(resultSet.getInt("CountIsZero"));
                record.setTotalRecords(resultSet.getInt("TotalRecords"));
                double zeroPercentage = resultSet.getDouble("ZeroPercentage");
                long roundedPercentage = Math.round(zeroPercentage); // Làm tròn thành số nguyên
                record.setZeroPercentage(roundedPercentage);
                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return records;
    }

}

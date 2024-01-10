package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Student;

public class StudentDAO extends DBContext {

    public StudentDAO() {
        super();
    }

    public Integer checkLoginStudent(String email, String password) {
        Integer studentId = -1; // Giá trị mặc định là -1 (để đánh dấu đăng nhập không thành công)
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT StudentID FROM Students WHERE Email = ? AND Password = ?")) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    studentId = resultSet.getInt("StudentID"); // Lấy student_id nếu đăng nhập thành công
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentId; // Trả về giá trị student_id nếu đăng nhập thành công, hoặc -1 nếu đăng nhập không thành công
    }

    public List<Student> selectAllStudents() {
        List<Student> students = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = super.getConnection();
            String query = "SELECT * FROM Students";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Student student = new Student();
                student.setStudentID(resultSet.getInt("StudentID"));
                student.setStudentName(resultSet.getString("StudentName"));
                student.setEmail(resultSet.getString("Email"));
                student.setPassword(resultSet.getString("Password"));
                student.setGender(resultSet.getString("Gender"));
                student.setMobilePhone(resultSet.getString("MobilePhone"));

                students.add(student);
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

        return students;
    }

    public List<String> getStudentCourses(int studentID) {
        List<String> courses = new ArrayList();

        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT CourseName FROM Attendance WHERE StudentID = ?")) {
            preparedStatement.setInt(1, studentID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String courseName = resultSet.getString("CourseName");
                    System.out.println("CourseName: " + courseName);
                    courses.add(courseName);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }

    public Student getStudentById(int studentID) {
        Student student = null;
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Students WHERE StudentID = ?")) {
            preparedStatement.setInt(1, studentID);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    student = new Student();
                    student.setStudentID(resultSet.getInt("StudentID"));
                    student.setStudentName(resultSet.getString("StudentName"));
                    student.setEmail(resultSet.getString("Email"));
                    student.setPassword(resultSet.getString("Password"));
                    student.setGender(resultSet.getString("Gender"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    public Student getStudentProfile(int studentId) {
        Student student = null;
        boolean success = false; // Biến cờ để kiểm tra kết quả của truy vấn

        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM Students WHERE StudentID = ?")) {
            preparedStatement.setInt(1, studentId);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int studentID = resultSet.getInt("StudentID");
                    String studentName = resultSet.getString("StudentName");
                    String email = resultSet.getString("Email");
                    String password = resultSet.getString("Password");
                    String gender = resultSet.getString("Gender");
                    String mobilePhone = resultSet.getString("MobilePhone");

                    student = new Student(studentID, studentName, email, password, gender, mobilePhone);

                    // Đánh dấu truy vấn thành công
                    success = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Kiểm tra kết quả truy vấn
        if (!success) {
            System.out.println("Không có dữ liệu sinh viên với ID: " + studentId);
        } else {
            // In thông tin sinh viên ra console
            System.out.println("StudentID: " + student.getStudentID());
            System.out.println("StudentName: " + student.getStudentName());
            System.out.println("Email: " + student.getEmail());
            System.out.println("Password: " + student.getPassword());
            System.out.println("Gender: " + student.getGender());
            System.out.println("MobilePhone: " + student.getMobilePhone());
            // In các trường thông tin khác nếu cần
        }

        return student;
    }

    public boolean updateStudentProfile(int studentID, String studentName, String mobilePhone, String gender) {
        boolean success = false;
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false); // Bắt đầu giao dịch
            System.out.println("check update profile: ");
            String query = "UPDATE Students "
                    + "SET StudentName = ?, MobilePhone = ?, Gender = ? "
                    + "WHERE StudentID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, studentName);
            preparedStatement.setString(2, mobilePhone);
            preparedStatement.setString(3, gender);
            preparedStatement.setInt(4, studentID);

            int rowsUpdated = preparedStatement.executeUpdate();

            if (rowsUpdated == 1) {
                // Commit giao dịch nếu cập nhật thành công
                connection.commit();
                success = true;
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
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true); // Đặt lại chế độ tự động commit
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    public boolean updateStudentPassword(int studentID, String newPassword) {
        boolean success = false;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        System.out.println("Update pass DAO");
        try {
            connection = getConnection();
            connection.setAutoCommit(false); // Bắt đầu giao dịch

            String query = "UPDATE Students "
                    + "SET Password = ? "
                    + "WHERE StudentID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newPassword);
            preparedStatement.setInt(2, studentID);

            int rowsUpdated = preparedStatement.executeUpdate();

            if (rowsUpdated == 1) {
                // Commit giao dịch nếu cập nhật thành công
                connection.commit();
                success = true;
                System.out.println("Password update successful.");
            } else {
                // Rollback giao dịch nếu có lỗi
                connection.rollback();
                System.out.println("Password update failed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                // Rollback giao dịch nếu có lỗi
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true); // Đặt lại chế độ tự động commit
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    
    public boolean insertStudent(Student student) {
        boolean success = false; // Biến cờ để kiểm tra kết quả của truy vấn

        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO Students (StudentName, Email, Password, Gender, MobilePhone) VALUES (?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, student.getStudentName());
            preparedStatement.setString(2, student.getEmail());
            preparedStatement.setString(3, student.getPassword());
            preparedStatement.setString(4, student.getGender());
            preparedStatement.setString(5, student.getMobilePhone());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Thêm mới sinh viên thành công
                success = true;
                System.out.println("Thêm mới sinh viên thành công.");
            } else {
                System.out.println("Thêm mới sinh viên không thành công.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

   public int checkCurrentPassword(int studentID, String isCurrentPassword) {
    boolean isCorrect = false; // Biến cờ để kiểm tra kết quả kiểm tra mật khẩu hiện tại

    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(
                 "SELECT 1 FROM Students WHERE StudentID = ? AND Password = ?")) {
        preparedStatement.setInt(1, studentID);
        preparedStatement.setString(2, isCurrentPassword);

        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            isCorrect = resultSet.next(); // Nếu có kết quả, mật khẩu hiện tại là đúng
            System.out.println("current password correct");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return isCorrect ? 1 : 0; // Trả về 1 nếu đúng, ngược lại trả về 0
}


}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAO.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Staff;

public class StaffDAO extends DBContext {

    public StaffDAO() {
        super();
    }

    public Staff checkLogin(String email, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Staff staff = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM Staff WHERE Email = ? AND Password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("ID");
                String fullName = rs.getString("FullName");
                Date dateOfBirth = rs.getDate("Date_of_Birth");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                String department = rs.getString("Department");
                int role = rs.getInt("Role");

                staff = new Staff(id, fullName, dateOfBirth, gender, email, phone, address, department, role, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }

        return staff;
    }

    public List<Staff> selectTeachers() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Staff> teachers = new ArrayList<>();

        try {
            conn = getConnection();
            String sql = "SELECT * FROM Staff WHERE Role = 2";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ID");
                String fullName = rs.getString("FullName");
                Date dateOfBirth = rs.getDate("Date_of_Birth");
                String gender = rs.getString("Gender");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                String department = rs.getString("Department");
                int role = rs.getInt("Role");
                String password = rs.getString("Password");

                Staff teacher = new Staff(id, fullName, dateOfBirth, gender, email, phone, address, department, role, password);
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }

        return teachers;
    }

    public List<Staff> selectStudents() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Staff> students = new ArrayList<>();

        try {
            conn = getConnection();
            String sql = "SELECT * FROM Staff WHERE Role = 3";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ID");
                String fullName = rs.getString("FullName");
                Date dateOfBirth = rs.getDate("Date_of_Birth");
                String gender = rs.getString("Gender");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                String department = rs.getString("Department");
                int role = rs.getInt("Role");
                String password = rs.getString("Password");

                Staff student = new Staff(id, fullName, dateOfBirth, gender, email, phone, address, department, role, password);
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }

        return students;
    }

    public List<Staff> searchTeachersByFullName(String fullName) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Staff> teachers = new ArrayList<>();

        try {
            conn = getConnection();
            String sql = "SELECT * FROM Staff WHERE Role = 3 AND FullName LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + fullName + "%"); // Sử dụng toán tử LIKE để tìm kiếm tên đầy đủ
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ID");
                String teacherFullName = rs.getString("FullName");
                Date dateOfBirth = rs.getDate("Date_of_Birth");
                String gender = rs.getString("Gender");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                String department = rs.getString("Department");
                int role = rs.getInt("Role");
                String password = rs.getString("Password");

                Staff teacher = new Staff(id, teacherFullName, dateOfBirth, gender, email, phone, address, department, role, password);
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng tài nguyên, kết nối sau khi sử dụng
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return teachers;
    }

    public Staff selectById(int staffID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Staff teacher = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM Staff WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, staffID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("ID");
                String fullName = rs.getString("FullName");
                Date dateOfBirth = rs.getDate("Date_of_Birth");
                String gender = rs.getString("Gender");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                String department = rs.getString("Department");
                int role = rs.getInt("Role");
                String password = rs.getString("Password");

                teacher = new Staff(id, fullName, dateOfBirth, gender, email, phone, address, department, role, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }

        return teacher;
    }

    public boolean deleteById(int staffID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            conn = getConnection();
            String sql = "DELETE FROM Staff WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, staffID);

            // Thực hiện lệnh SQL để xóa
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("delete thanh cong");
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }

        return success;
    }

    public boolean updateStudent(int staffID, String fullName, Date dateOfBirth, String gender, String email, String phone, String address, String department) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            conn = getConnection();
            String sql = "UPDATE Staff SET FullName=?, Date_of_Birth=?, Gender=?, Email=?, Phone=?, Address=?, Department=? WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setDate(2, dateOfBirth);
            pstmt.setString(3, gender);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, address);
            pstmt.setString(7, department);
            pstmt.setInt(8, staffID);

            // Thực hiện lệnh SQL để cập nhật
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Cập nhật thành công
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }

        return success;
    }

    public boolean addStudent(String fullName, Date dateOfBirth, String gender, String email, String password, String phone, String address, String department) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "INSERT INTO Staff (FullName, Date_of_Birth, Gender, Email, Password, Phone, Address, Department, Role) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setDate(2, dateOfBirth);
            pstmt.setString(3, gender);
            pstmt.setString(4, email);
            pstmt.setString(5, password);
            pstmt.setString(6, phone);
            pstmt.setString(7, address);
            pstmt.setString(8, department);
            pstmt.setInt(9, 3); // Assuming 'Role' is set to 0 for students

            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Đóng kết nối và tài nguyên

        }
    }

    public boolean updateStudentPassword(int staffID, String newPassword) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            conn = getConnection();
            String sql = "UPDATE Staff SET Password = ? WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPassword);
            pstmt.setInt(2, staffID);

            // Thực hiện lệnh SQL để cập nhật mật khẩu
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Cập nhật mật khẩu thành công
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
            // Trong trường hợp này, bạn cần đảm bảo rằng bạn đóng kết nối và tài nguyên ở đây
        }

        return success;
    }

    public int checkCurrentPassword(int studentID, String isCurrentPassword) {
        boolean isCorrect = false; // Biến cờ để kiểm tra kết quả kiểm tra mật khẩu hiện tại

        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT 1 FROM Staff WHERE ID = ? AND Password = ?")) {
            preparedStatement.setInt(1, studentID);
            preparedStatement.setString(2, isCurrentPassword);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                isCorrect = resultSet.next(); // Nếu có kết quả, mật khẩu hiện tại là đúng

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isCorrect ? 1 : 0; // Trả về 1 nếu đúng, ngược lại trả về 0
    }

    public List<Staff> selectByDepartment(String department) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Staff> staffList = new ArrayList<>();

        try {
            conn = getConnection();
            String sql = "SELECT * FROM Staff WHERE Department = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, department);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ID");
                String fullName = rs.getString("FullName");
                Date dateOfBirth = rs.getDate("Date_of_Birth");
                String gender = rs.getString("Gender");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                int role = rs.getInt("Role");
                String password = rs.getString("Password");

                Staff staff = new Staff(id, fullName, dateOfBirth, gender, email, phone, address, department, role, password);
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng tài nguyên, kết nối sau khi sử dụng
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return staffList;
    }

  public List<Staff> selectStudentsWithStatus2() {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    List<Staff> students = new ArrayList<>();

    try {
        conn = getConnection();
        String sql = "SELECT s.*, r.status, r.request_type\n"
                + "FROM staff s\n"
                + "LEFT JOIN studentRequest r ON s.ID = r.Staff_ID\n"
                + "WHERE s.Role = 3 AND r.status = 1;";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("ID");
            String fullName = rs.getString("FullName");
            Date dateOfBirth = rs.getDate("Date_of_Birth");
            String gender = rs.getString("Gender");
            String email = rs.getString("Email");
            String phone = rs.getString("Phone");
            String address = rs.getString("Address");
            String department = rs.getString("Department");
            int role = rs.getInt("Role");
            String password = rs.getString("Password");
            int status = rs.getInt("status");
            int requestType = rs.getInt("request_type");

            Staff student = new Staff(id, fullName, dateOfBirth, gender, email, phone, address, department, role, password, status, requestType);
            
            students.add(student);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Đóng tài nguyên
    }

    return students;
}


}

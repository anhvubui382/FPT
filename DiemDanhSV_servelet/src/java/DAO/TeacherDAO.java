package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TeacherDAO extends DBContext {

    public TeacherDAO() {
        super();
    }

    public Integer checkLoginTeacher(String email, String password) {
        Integer teacherId = null; // Giá trị mặc định là null (để đánh dấu đăng nhập không thành công)
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT TeacherID FROM Teachers WHERE Email = ? AND Password = ?")) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    teacherId = resultSet.getInt("TeacherID"); // Lấy teacher_id nếu đăng nhập thành công
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacherId; // Trả về giá trị teacher_id nếu đăng nhập thành công, hoặc null nếu đăng nhập không thành công
    }

}

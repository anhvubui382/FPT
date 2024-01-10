package DAO;
import DAO.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO extends DBContext {

    public AdminDAO() {
        super();
    }

    public Integer checkAdminLogin(String email, String password) {
        Integer adminId = null; // Giá trị mặc định là null (để đánh dấu đăng nhập không thành công)
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT AdminId FROM Admin WHERE Email = ? AND Password = ?")) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    adminId = resultSet.getInt("AdminId"); // Lấy adminId nếu đăng nhập thành công
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminId; // Trả về giá trị adminId nếu đăng nhập thành công, hoặc null nếu đăng nhập không thành công
    }
}

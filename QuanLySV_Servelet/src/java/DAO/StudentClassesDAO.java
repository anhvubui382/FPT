package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.StudentClasses;

public class StudentClassesDAO extends DBContext {

    public StudentClassesDAO() {
        super();
    }

    public List<StudentClasses> getAllByClassCode(String classCode) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<StudentClasses> studentClasses = new ArrayList<>();
        String query = "SELECT * FROM StudentClasses WHERE Class_Code = ?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, classCode);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                StudentClasses studentClass = new StudentClasses();
                studentClass.setId(rs.getInt("ID"));
                studentClass.setStudentId(rs.getInt("Student_ID"));
                studentClass.setClassName(rs.getString("Class_Name"));
                studentClass.setClassCode(rs.getString("Class_Code"));

                studentClasses.add(studentClass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return studentClasses;
    }
    
    private void closeResources(Connection conn, PreparedStatement pstmt, ResultSet rs) {
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
}

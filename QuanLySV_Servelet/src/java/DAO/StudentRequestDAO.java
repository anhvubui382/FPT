package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.StudentRequest;

public class StudentRequestDAO extends DBContext {

    public StudentRequestDAO() {
        super();
    }

    public List<StudentRequest> getAllStudentRequests() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<StudentRequest> studentRequests = new ArrayList<>();

        try {
            conn = getConnection();
            String sql = "SELECT * FROM StudentRequest";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                StudentRequest studentRequest = new StudentRequest();
                studentRequest.setId(rs.getInt("ID"));
                studentRequest.setStaffId(rs.getInt("Staff_ID"));
                studentRequest.setRequestType(rs.getString("Request_Type"));
                studentRequest.setReason(rs.getString("Reason"));
                studentRequest.setSubmissionDate(rs.getDate("Submission_Date"));
                studentRequest.setStatus(rs.getInt("Status"));

                studentRequests.add(studentRequest);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return studentRequests;
    }

    public void insertStudentRequest(StudentRequest studentRequest) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "INSERT INTO StudentRequest (Staff_ID, Request_Type, Reason, Submission_Date, Status) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, studentRequest.getStaffId());
            pstmt.setString(2, studentRequest.getRequestType());
            pstmt.setString(3, studentRequest.getReason());
            pstmt.setDate(4, new java.sql.Date(studentRequest.getSubmissionDate().getTime()));
            pstmt.setInt(5, 0);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, null);
        }
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

    public void updateStudentRequestStatus(int requestId, int newStatus) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "UPDATE StudentRequest SET Status = ? WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, newStatus);
            pstmt.setInt(2, requestId);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, null);
        }
    }
public List<StudentRequest> selectRequestsByStaffId(int staffId) {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    List<StudentRequest> studentRequests = new ArrayList<>();

    try {
        conn = getConnection();
        String sql = "SELECT * FROM StudentRequest WHERE Staff_ID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, staffId);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            StudentRequest studentRequest = new StudentRequest();
            studentRequest.setId(rs.getInt("ID"));
            studentRequest.setStaffId(rs.getInt("Staff_ID"));
            studentRequest.setRequestType(rs.getString("Request_Type"));
            studentRequest.setReason(rs.getString("Reason"));
            studentRequest.setSubmissionDate(rs.getDate("Submission_Date"));
            studentRequest.setStatus(rs.getInt("Status"));

            studentRequests.add(studentRequest);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources(conn, pstmt, rs);
    }

    return studentRequests;
}


}

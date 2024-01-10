/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AttendanceRecordDAO;
import DAO.TeacherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import models.AttendanceRecord;

/**
 *
 * @author asus
 */
public class teacherScheduleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet teacherScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet teacherScheduleController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int teacherId = (int) session.getAttribute("teacher_id");
        Date currentDate = new Date();
        System.out.println("check tid: " + teacherId);
        // Chuyển đổi Date thành chuỗi ngày tháng (nếu cần)
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(currentDate);
        System.out.println("check date: " + date);
         AttendanceRecordDAO attendanceRecordDAO = new AttendanceRecordDAO();
        List<AttendanceRecord> attendanceRecords = attendanceRecordDAO.selectAttendanceRecordsByTeacherIdAndDate(teacherId, date);

        // Đặt danh sách bản ghi vào request với tên "attendanceRecords"
        request.setAttribute("attendanceRecords", attendanceRecords);
        request.getRequestDispatcher("teacherSchedule.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Integer teacher_id = (Integer) session.getAttribute("teacher_id");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        System.out.println("Check: " + startDate);
        // Lưu danh sách vào request để sử dụng trong trang JSP
        AttendanceRecordDAO attendanceRecordDAO = new AttendanceRecordDAO();
        List<AttendanceRecord> attendanceRecords = attendanceRecordDAO.selectAttendanceRecordsByTeacherIDAndDateRange(teacher_id, startDate, endDate);
        request.setAttribute("attendanceRecords", attendanceRecords);
        request.getRequestDispatcher("teacherSchedule.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AttendanceRecordDAO;
import DAO.TeacherDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import models.AttendanceRecord;

/**
 *
 * @author asus
 */
public class getPercentAttendanceController extends HttpServlet {

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
            out.println("<title>Servlet getPercentAttendanceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getPercentAttendanceController at " + request.getContextPath() + "</h1>");
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
        String courseName = request.getParameter("course");
        AttendanceRecordDAO attendanceRecordDAO = new AttendanceRecordDAO();
        List<AttendanceRecord> attendanceRecords = attendanceRecordDAO.selectAttendanceRecordsWithPercentage(teacherId, courseName);
     AttendanceRecordDAO teacherDAO = new AttendanceRecordDAO();
        List<String> teacherCourses = teacherDAO.getTeacherCourses(teacherId);
        for (String course : teacherCourses) {
            System.out.println(course);
        }
        // Lưu danh sách môn học vào request attribute
        request.setAttribute("teacherCourses", teacherCourses);

        // Lưu danh sách này vào request attribute
        request.setAttribute("attendanceRecords", attendanceRecords);
        for (AttendanceRecord record : attendanceRecords) {
            System.out.println("Student Name: " + record.getStudentName());
            System.out.println("Course Name: " + record.getCourseName());
            System.out.println("Count Is Zero: " + record.getCountIsZero());
            System.out.println("Total Records: " + record.getTotalRecords());
            System.out.println("Zero Percentage: " + record.getZeroPercentage());
        }

        // Chuyển hướng đến trang JSP để hiển thị danh sách điểm danh
        RequestDispatcher dispatcher = request.getRequestDispatcher("teacherAttendancePercent.jsp");
        dispatcher.forward(request, response);
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

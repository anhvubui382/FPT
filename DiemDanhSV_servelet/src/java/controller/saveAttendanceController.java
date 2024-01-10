/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AttendanceRecordDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author asus
 */
public class saveAttendanceController extends HttpServlet {

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
            out.println("<title>Servlet saveAttendanceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet saveAttendanceController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        Map<String, String[]> parameterMap = request.getParameterMap();

        List<String> studentIDs = new ArrayList<>();
        List<Integer> isPresentValues = new ArrayList<>();
        // Trong một servlet khác
        HttpSession session = request.getSession();
        int slot = (int) session.getAttribute("slot");
        System.out.println("check Slot: " + slot);
        String className = (String) session.getAttribute("className");
        String courseName = (String) session.getAttribute("courseName");
        String date = (String) session.getAttribute("date");
        int teacherId = (int) session.getAttribute("teacher_id");

        // Trong một servlet khác
        System.out.println("check className: " + className);
        // Duyệt qua các tham số của request
        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            String paramName = entry.getKey();
            String[] paramValues = entry.getValue();

            // Kiểm tra xem tham số có tiền tố "attendance_" hay không
            if (paramName.startsWith("attendance_")) {
                String studentId = paramName.replace("attendance_", "");
                String isPresent = paramValues[0];
                // Thêm studentId vào danh sách studentIDs
                studentIDs.add(studentId);

                // Thêm isPresent vào danh sách isPresentValues
                int isPresentInt = Integer.parseInt(isPresent);
                isPresentValues.add(isPresentInt);

                // In thông tin để kiểm tra
                System.out.println("Student ID: " + studentId);
                System.out.println("Is Present: " + isPresentInt);
            }
        }

        AttendanceRecordDAO attendanceRecordDAO = new AttendanceRecordDAO();

        for (int i = 0; i < studentIDs.size(); i++) {
            String studentID = studentIDs.get(i);
            int isPresent = isPresentValues.get(i);
            System.out.println("student ID insert: " + studentID + ","+isPresent);
            attendanceRecordDAO.updateIsPresent(teacherId, Integer.parseInt(studentID), courseName, className, slot, date, isPresent);
        }
        response.sendRedirect("teacherSchedule");
        // Sau khi cập nhật xong, bạn có thể thực hiện các hành động khác, chẳng hạn chuyển hướng hoặc thông báo cho người dùng
       
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

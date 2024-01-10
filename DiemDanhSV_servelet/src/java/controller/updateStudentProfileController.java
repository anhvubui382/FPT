/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import models.Student;

/**
 *
 * @author asus
 */
public class updateStudentProfileController extends HttpServlet {

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
            out.println("<title>Servlet updateStudentProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateStudentProfileController at " + request.getContextPath() + "</h1>");
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
        int studentId = (int) session.getAttribute("student_id");

        // Gọi hàm getStudentProfile từ StudentDAO để lấy thông tin hồ sơ
        StudentDAO studentDAO = new StudentDAO();
        Student student = studentDAO.getStudentProfile(studentId);
        // Đặt đối tượng Student vào thuộc tính của request để sử dụng trong JSP
        request.setAttribute("student", student);

        // Chuyển hướng đến trang JSP hiển thị thông tin hồ sơ sinh viên
        request.getRequestDispatcher("updateStudentProfile.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // Trong phần doPost của servlet
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int studentId = (int) session.getAttribute("student_id");

        String studentName = request.getParameter("studentName");
        String mobilePhone = request.getParameter("mobilePhone");
        String gender = request.getParameter("gender");
        StudentDAO studentDAO = new StudentDAO();

        // Tạo danh sách để lưu trữ các thông báo lỗi cho từng trường
        List<String> errors = new ArrayList<>();

        // Tiến hành cập nhật thông tin và chuyển hướng hoặc hiển thị thông báo
        boolean updateSuccess = studentDAO.updateStudentProfile(studentId, studentName, mobilePhone, gender);
        response.sendRedirect("getStudentProfile");
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

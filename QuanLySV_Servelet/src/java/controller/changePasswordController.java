/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StaffDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author asus
 */
public class changePasswordController extends HttpServlet {

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
            out.println("<title>Servlet changePasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changePasswordController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int studentId = (int) session.getAttribute("staffId");
        String currentPassword = request.getParameter("currentPassword");
        System.out.println("check pass: " + currentPassword);
        String newPassword = request.getParameter("newPassword");

        StaffDAO studentDAO = new StaffDAO();
        
        int isCurrentPasswordValid = studentDAO.checkCurrentPassword(studentId, currentPassword);
        System.out.println("Check cp: " + isCurrentPasswordValid);
        if (isCurrentPasswordValid == 0) {
            System.out.println("cp 1: " + isCurrentPasswordValid);
            System.out.println("MK sai");
            // Xử lý lỗi, hiển thị thông báo trên trang changePassword.jsp
            request.setAttribute("currentPasswordError", "Mật khẩu cũ không đúng");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        } else if (isCurrentPasswordValid == 1) {

            // Nếu mật khẩu hiện tại hợp lệ, tiến hành cập nhật
            studentDAO.updateStudentPassword(studentId, newPassword);
            System.out.println("MK dung");
            request.setAttribute("updatePasswordSuccess", "Cập nhật mật khẩu thành công.");
//            request.getRequestDispatcher("getStudentProfile").forward(request, response);
            request.getRequestDispatcher("studentHome.jsp").forward(request, response);
        }

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

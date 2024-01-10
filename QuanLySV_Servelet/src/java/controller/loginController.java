/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StaffDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import models.Staff;

/**
 *
 * @author asus
 */
public class loginController extends HttpServlet {

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
            out.println("<title>Servlet loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
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
         session.setAttribute("staffId", null); 
            session.setAttribute("username", null);
             RequestDispatcher dispatcher = request.getRequestDispatcher("/trangChu.jsp");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("Check login: " + email + password);
        StaffDAO staffDAO = new StaffDAO();
        Staff staff = staffDAO.checkLogin(email, password);
        HttpSession session = request.getSession();
         session.setAttribute("staffId", null);
            session.setAttribute("username", null);
         session.setAttribute("fullname", null);
        if (staff != null) {
            // Đăng nhập thành công
            int role = staff.getRole();
           
            
            // Lưu thông tin người dùng vào session
            session.setAttribute("staffId", staff.getId());
            session.setAttribute("username", staff.getEmail());
            session.setAttribute("fullname", staff.getFullName());
            // Kiểm tra và thông báo vai trò
            if (role == 1) {
                
                session.setAttribute("role", "admin");
                response.sendRedirect("adminHome.jsp");
            } else if (role == 2) {
                // Teacher
                session.setAttribute("role", "teacher");
            } else if (role == 3) {
                // Student
                session.setAttribute("role", "student");
                response.sendRedirect("studentHome.jsp");
            }

        } else {
             request.setAttribute("message", "Login failed. Please check your information.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
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

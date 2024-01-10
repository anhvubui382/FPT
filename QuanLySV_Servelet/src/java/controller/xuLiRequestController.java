/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StudentRequestDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import models.StudentRequest;

/**
 *
 * @author asus
 */
public class xuLiRequestController extends HttpServlet {

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
            out.println("<title>Servlet xuLiRequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet xuLiRequestController at " + request.getContextPath() + "</h1>");
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

        StudentRequestDAO studentRequestDAO = new StudentRequestDAO();
        HttpSession session = request.getSession();
        int staffId = (int) session.getAttribute("staffId");

        // Gọi phương thức getAllStudentRequests để lấy danh sách các đơn
        List<StudentRequest> studentRequests = studentRequestDAO.selectRequestsByStaffId(staffId);

        // Đưa danh sách đơn vào request attribute để sử dụng trong JSP
        request.setAttribute("studentRequests", studentRequests);

        RequestDispatcher dispatcher = request.getRequestDispatcher("studentViewRequest.jsp");
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
        String requestId = request.getParameter("requestId");
        String newStatus = request.getParameter("status");
        int requestIdInt = Integer.parseInt(requestId);
        int newStatusInt = Integer.parseInt(newStatus);
        // Now you can use the status value as needed, for example, calling the update method

        StudentRequestDAO studentRequestDAO = new StudentRequestDAO();
        studentRequestDAO.updateStudentRequestStatus(requestIdInt, newStatusInt);
        response.sendRedirect("studentRequest");
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

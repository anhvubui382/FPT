/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StaffDAO;
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
public class studentRequestController extends HttpServlet {

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
            out.println("<title>Servlet studentRequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet studentRequestController at " + request.getContextPath() + "</h1>");
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
        System.out.println("check doGet studentRequest");
        String don = request.getParameter("don");
        String reason = request.getParameter("reason");
        StudentRequestDAO studentRequestDAO = new StudentRequestDAO();
        HttpSession session = request.getSession();
        int staffId = (int) session.getAttribute("staffId");

        // Gọi phương thức getAllStudentRequests để lấy danh sách các đơn
        List<StudentRequest> studentRequests = studentRequestDAO.getAllStudentRequests();

        // Đưa danh sách đơn vào request attribute để sử dụng trong JSP
        request.setAttribute("studentRequests", studentRequests);

        RequestDispatcher dispatcher = request.getRequestDispatcher("showAllStudentRequest.jsp");
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
        System.out.println("do POST request");
        String don = request.getParameter("don"); // Lấy giá trị của trường select
        String reason = request.getParameter("reason");
        java.sql.Date submissionDate = new java.sql.Date(new java.util.Date().getTime());

        HttpSession session = request.getSession();

        int staffId = (int) session.getAttribute("staffId");

        StudentRequest studentRequest = new StudentRequest();
        studentRequest.setStaffId(staffId);
        studentRequest.setRequestType(don);
        studentRequest.setReason(reason);
        studentRequest.setSubmissionDate(submissionDate);

        StudentRequestDAO studentRequestDAO = new StudentRequestDAO();
        studentRequestDAO.insertStudentRequest(studentRequest);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studentRequest.jsp");
        dispatcher.forward(request, response);
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

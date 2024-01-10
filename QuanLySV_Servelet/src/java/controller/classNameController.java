/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StaffDAO;
import DAO.StudentClassesDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import models.Staff;
import models.StudentClasses;

/**
 *
 * @author asus
 */
public class classNameController extends HttpServlet {

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
            out.println("<title>Servlet classNameController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet classNameController at " + request.getContextPath() + "</h1>");
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
        String major = request.getParameter("department");
        System.out.println("check GET className: " + major);
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

        String major = request.getParameter("department");
        System.out.println("check POST className: " + major);
        StaffDAO staffDAO = new StaffDAO();

        // Gọi phương thức selectByDepartment để lấy danh sách staff trong department
        List<Staff> staffList = staffDAO.selectByDepartment(major);
        for (Staff staff : staffList) {
            System.out.println("ID: " + staff.getId());
            System.out.println("Full Name: " + staff.getFullName());
            System.out.println("Date of Birth: " + staff.getDateOfBirth());
            System.out.println("Gender: " + staff.getGender());
            System.out.println("Email: " + staff.getEmail());
            System.out.println("Phone: " + staff.getPhone());
            System.out.println("Address: " + staff.getAddress());
            System.out.println("Department: " + staff.getDepartment());
            System.out.println("Role: " + staff.getRole());
            System.out.println("Password: " + staff.getPassword());
            System.out.println("--------------------");
        }
        // Lưu danh sách staff vào request để sử dụng trong JSP
        request.setAttribute("staffList", staffList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("adminClassHome.jsp");
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

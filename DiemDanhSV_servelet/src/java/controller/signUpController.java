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
public class signUpController extends HttpServlet {

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
            out.println("<title>Servlet signUpController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signUpController at " + request.getContextPath() + "</h1>");
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
        String studentName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String mobilePhone = request.getParameter("mobilePhone");
        System.out.println("check sign up");
        List<String> validationErrors = new ArrayList<>();

        if (!isNameValid(studentName)) {
            System.out.println("sai ten");
            validationErrors.add("Name is invalid. It should be at least 5 characters and contain only letters and spaces.");
        }
        if (!isEmailValid(email)) {
            System.out.println("sai email");
            validationErrors.add("Email is invalid. It must start with a letter, have at least 6 characters before '@fpt.edu.vn'.");
        }
        if (!isMobilePhoneValid(mobilePhone)) {
            System.out.println("sai phone");
            validationErrors.add("Mobile phone is invalid. It should have at least 10 digits and contain only numbers.");
        }
        HttpSession session = request.getSession();
        session.setAttribute("validationErrors", new ArrayList<String>());
        if (validationErrors.isEmpty()) {
            // All input is valid; you can proceed with signup
            // Call your StudentDAO or service to add the new student

            // Example:
            Student newStudent = new Student();
            newStudent.setStudentName(studentName);
            newStudent.setEmail(email);
            newStudent.setPassword(password);
            newStudent.setGender(gender);
            newStudent.setMobilePhone(mobilePhone);

            StudentDAO studentDAO = new StudentDAO();
            boolean insertSuccess = studentDAO.insertStudent(newStudent);

            if (insertSuccess) {
                // Successfully added the student
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // Failed to add the student
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
            }
        } else {
            // Input is not valid; store validation errors in session and redirect to the signup page

            session.setAttribute("validationErrors", validationErrors);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);

        }
    }

    public static boolean isNameValid(String name) {
        return name != null && name.length() >= 5 && name.matches("^[a-zA-Z\\s]*$");
    }

    // Kiểm tra MobilePhone: ít nhất 10 số, không chứa chữ hoặc ký tự đặc biệt
    public static boolean isMobilePhoneValid(String mobilePhone) {
        return mobilePhone != null && mobilePhone.length() >= 10 && mobilePhone.matches("^[0-9]*$");
    }

    // Kiểm tra Email: phải chứa "@fpt.edu.vn"
    public static boolean isEmailValid(String email) {
        if (email != null) {
            // Use a regular expression to validate the email
            // It must start with a letter, have at least 6 characters before "@fpt.edu.vn"
            return email.matches("^[a-zA-Z].{5,}@fpt.edu.vn");
        }
        return false;
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

package controller;

import DAO.AdminDAO;
import DAO.StudentDAO;
import DAO.TeacherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class loginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use the following sample code. */
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if ("student".equals(role)) {
            StudentDAO studentDAO = new StudentDAO();
            Integer student_id = studentDAO.checkLoginStudent(email, password);
            if (student_id != -1) {
                System.out.println("Student login is valid: " + student_id);
                HttpSession session = request.getSession();
                session.setAttribute("student_id", student_id);
                response.sendRedirect("getStudentProfile");
            } else {
                System.out.println("Student login failed");
                request.getSession().setAttribute("roleError", "Login failed. Please check email, password or your role");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if ("teacher".equals(role)) {
            TeacherDAO teacherDAO = new TeacherDAO();
            Integer teacher_id = teacherDAO.checkLoginTeacher(email, password);
            if (teacher_id != null) {
                System.out.println("Teacher login is valid: " + teacher_id);
                HttpSession session = request.getSession();
                session.setAttribute("teacher_id", teacher_id);
                response.sendRedirect("teacherSchedule");
            } else {
                System.out.println("Teacher login failed");
                request.getSession().setAttribute("roleError", "Login failed. Please check email, password or your role");

                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if ("admin".equals(role)) {
            AdminDAO adminDAO = new AdminDAO();
            Integer admin_id = adminDAO.checkAdminLogin(email, password);
            if (admin_id != null) {
                System.out.println("Admin login is valid: " + admin_id);
                HttpSession session = request.getSession();
                session.setAttribute("admin_id", admin_id);
                response.sendRedirect("adminDashboard"); // Điều hướng đến trang dashboard của admin
            } else {
                System.out.println("Admin login failed");
                request.setAttribute("loginFailedMessage", "Đăng nhập không thành công. Vui lòng kiểm tra email và mật khẩu.");
                // Redirect lại trang login.jsp
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            System.out.println("Role not recognized");
            request.getSession().setAttribute("roleError", "Vui lòng chọn đúng vai trò (student, teacher, hoặc admin).");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

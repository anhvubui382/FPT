<%-- 
    Document   : adminClassHome
    Created on : Nov 8, 2023, 7:17:26 PM
    Author     : asus
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

        </style>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div >


            <div style="margin-left: 350px; margin-top: 50px">
                <form action="className" method="POST">
                    <h1>List Teacher, Student By Major</h1>
                    <select id="department" name="department" required>
                        <option selected disabled>Select Major</option>
                        <option value="Software Engineering">Software Engineering</option>
                        <option value="Marketing">Marketing</option>
                        <option value="MC">MC</option>
                    </select>
                    <button type="submit">Search</button>
                </form>
                <h1>Teachers </h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Department</th>
                    </tr>
                    <c:forEach items="${staffList}" var="teacher">
                        <c:if test="${teacher.role == 2}">
                            <tr>
                                <td>${teacher.id}</td>
                                <td>${teacher.fullName}</td>
                                <td>${teacher.email}</td>
                                <td>${teacher.phone}</td>
                                <td>${teacher.department}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>

                <h1>Students</h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Department</th>
                    </tr>
                    <c:forEach items="${staffList}" var="student">
                        <c:if test="${student.role == 3}">
                            <tr>
                                <td>${student.id}</td>
                                <td>${student.fullName}</td>
                                <td>${student.email}</td>
                                <td>${student.phone}</td>
                                <td>${student.department}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>

            </div>
        </div>
    </body>
</html>

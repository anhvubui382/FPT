<%-- 
    Document   : checkStatus
    Created on : Nov 10, 2023, 1:30:21 AM
    Author     : asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div >
            <div style="margin-left: 350px; margin-top: 50px">
                
              
                
                <h1>Đơn Miễn Điểm Danh
                                    </h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Major</th>
                    </tr>
                    <c:forEach var="staff" items="${students}">
                        <c:if test="${staff.request_Type == 1}">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.fullName}</td>
                                <td>${staff.dateOfBirth}</td>
                                <td>${staff.gender}</td>
                                <td>${staff.email}</td>
                                <td>${staff.phone}</td>
                                <td>${staff.address}</td>
                                <td>${staff.department}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
                
               
                
                
                <h1>Đơn Xin Nhập Học Trở Lại</h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Major</th>
                    </tr>
                    <c:forEach var="staff" items="${students}">
                        <c:if test="${staff.request_Type == 2}">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.fullName}</td>
                                <td>${staff.dateOfBirth}</td>
                                <td>${staff.gender}</td>
                                <td>${staff.email}</td>
                                <td>${staff.phone}</td>
                                <td>${staff.address}</td>
                                <td>${staff.department}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
                
                
                
                
                <h1>Đơn Rút Tiền)</h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Major</th>
                    </tr>
                    <c:forEach var="staff" items="${students}">
                        <c:if test="${staff.request_Type == 3}">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.fullName}</td>
                                <td>${staff.dateOfBirth}</td>
                                <td>${staff.gender}</td>
                                <td>${staff.email}</td>
                                <td>${staff.phone}</td>
                                <td>${staff.address}</td>
                                <td>${staff.department}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
                
                
                
                <h1>Đơn Đề Nghị Hoàn Tiền</h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Major</th>
                    </tr>
                    <c:forEach var="staff" items="${students}">
                        <c:if test="${staff.request_Type == 4}">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.fullName}</td>
                                <td>${staff.dateOfBirth}</td>
                                <td>${staff.gender}</td>
                                <td>${staff.email}</td>
                                <td>${staff.phone}</td>
                                <td>${staff.address}</td>
                                <td>${staff.department}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
                
                
                
                
                <h1>Đơn Đăng Ký Thi Cải Thiện Điểm</h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Major</th>
                    </tr>
                    <c:forEach var="staff" items="${students}">
                        <c:if test="${staff.request_Type == 5}">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.fullName}</td>
                                <td>${staff.dateOfBirth}</td>
                                <td>${staff.gender}</td>
                                <td>${staff.email}</td>
                                <td>${staff.phone}</td>
                                <td>${staff.address}</td>
                                <td>${staff.department}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
            </div>     
        </div>
    </body>
</html>

<%-- 
    Document   : showAllStudentRequest
    Created on : Nov 8, 2023, 7:32:09 PM
    Author     : asus
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Đây là liên kết đến tệp CSS của Tailwind CSS -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="sidebar.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:350px; margin-top: 50px; margin-right: 40px">
            <div class="container mx-auto">
                <table class="w-full bg-white shadow-lg rounded-lg">
                    <tr class="bg-blue-500 text-white">
                        <th class="px-4 py-2">ID</th>
                        <th class="px-4 py-2">Staff ID</th>
                        <th class="px-4 py-2">Request Type</th>
                        <th class="px-4 py-2">Reason</th>
                        <th class="px-4 py-2">Submission Date</th>
                        <th class="px-4 py-2">Status</th>
                    </tr>

                    <c:forEach items="${studentRequests}" var="studentRequest">
                        <tr class="text-center">
                            <td class="px-4 py-2">${studentRequest.id}</td>
                            <td class="px-4 py-2">${studentRequest.staffId}</td>
                            <td class="px-4 py-2"> <c:choose>
                                    <c:when test="${studentRequest.requestType == '1'}">
                                        Đơn Miễn Điểm Danh
                                    </c:when>
                                    <c:when test="${studentRequest.requestType == '2'}">
                                        Đơn Xin Nhập Học Trở Lại
                                    </c:when>
                                    <c:when test="${studentRequest.requestType == '3'}">
                                        Đơn Rút Tiền
                                    </c:when>
                                    <c:when test="${studentRequest.requestType == '4'}">
                                        Đơn Đề Nghị Hoàn Tiền
                                    </c:when>
                                    <c:when test="${studentRequest.requestType == '5'}">
                                        Đơn Đăng Ký Thi Cải Thiện Điểm
                                    </c:when>

                                </c:choose></td>
                            <td class="px-4 py-2">${studentRequest.reason}</td>
                            <td class="px-4 py-2">${studentRequest.submissionDate}</td>
                            <td class="px-4 py-2">
                                <c:choose>
                                    <c:when test="${studentRequest.status != 0}">
                                        <span style="color: blue; font-weight: bold;">Done</span>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="flex space-x-4">
                                            <form action="xuLiRequest" method="post">
                                                <input type="hidden" name="requestId" value="${studentRequest.id}" />
                                                <input type="hidden" name="status" value="1" />
                                                <button type="submit" class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded">Approved</button>
                                            </form>
                                            <form action="xuLiRequest" method="post">
                                                <input type="hidden" name="requestId" value="${studentRequest.id}" />
                                                <input type="hidden" name="status" value="2" />
                                                <button type="submit" class="bg-red-500 hover-bg-red-600 text-white px-4 py-2 rounded">Rejected</button>
                                            </form>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Đây là liên kết đến tệp CSS của Tailwind CSS -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
  .table th, .table td {
    width: 150px; /* Điều chỉnh theo nhu cầu */
    text-align: center; /* Căn giữa nội dung trong cột */
  }
</style>
    </head>
    <body>
        <%@include file="header.jsp" %>


        <div class="w3-main" style="margin-left:300pxl; margin-top: 30px">
            <div class="container mx-auto">
                <table class="w-full bg-white shadow-lg rounded-lg">
                    <tr class="bg-blue-500 text-white">
                        <th class="px-4 py-2">Request ID</th>
                        <th class="px-4 py-2">Request Type</th>
                        <th class="px-4 py-2">Reason</th>
                        <th class="px-4 py-2">Submission Date</th>
                        <th class="px-4 py-2">Status</th>
                    </tr>

                    <c:forEach items="${studentRequests}" var="studentRequest">
                        <tr class="text-center">
                            <td class="px-4 py-2">${studentRequest.id}</td>
                            <td class="px-4 py-2">
                                <c:choose>
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
                                    <c:otherwise>
                                        Unknown Request Type
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td class="px-4 py-2">${studentRequest.reason}</td>
                            <td class="px-4 py-2">${studentRequest.submissionDate}</td>
                            <td class="px-4 py-2">
                                <c:choose>
                                    <c:when test="${studentRequest.status == 0}">
                                        <span class="border-2 border-gray-400 rounded-full px-3 py-1 bg-gray-200">Not Yet</span>
                                    </c:when>
                                    <c:when test="${studentRequest.status == 1}">
                                        <span class="border-2 border-green-400 rounded-full px-3 py-1 bg-green-200">Approved</span>
                                    </c:when>
                                    <c:when test="${studentRequest.status == 2}">
                                        <span class="border-2 border-red-400 rounded-full px-3 py-1 bg-red-200">Rejected</span>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>

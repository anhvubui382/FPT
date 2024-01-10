<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="models.Staff" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <!-- Đây là liên kết đến tệp CSS của Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <div class="bg-white rounded-lg shadow-md p-6">
            <h1 class="text-3xl font-semibold mb-4">Student Profile</h1>
            <c:forEach items="${studentList}" var="student">
                <div class="mb-4">
                    <div class="text-lg font-semibold">Full Name: <span class="text-gray-700"><%= student.getFullName() %></span></div>
                    <div class="text-lg font-semibold">Date of Birth: <span class="text-gray-700"><%= student.getDateOfBirth() %></span></div>
                    <div class="text-lg font-semibold">Gender: <span class="text-gray-700"><%= student.getGender() %></span></div>
                    <div class="text-lg font-semibold">Email: <span class="text-blue-500"><%= student.getEmail() %></span></div>
                    <div class="text-lg font-semibold">Phone: <span class="text-gray-700"><%= student.getPhone() %></span></div>
                    <div class="text-lg font-semibold">Address: <span class="text-gray-700"><%= student.getAddress() %></span></div>
                    <div class="text-lg font-semibold">Department: <span class="text-gray-700"><%= student.getDepartment() %></span></div>
                    <div class="text-lg font-semibold">Role: <span class="text-gray-700"><%= student.getRole() %></span></div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

</html>

</html>

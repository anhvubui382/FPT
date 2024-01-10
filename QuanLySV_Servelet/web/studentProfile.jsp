<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <!-- Liên kết đến tệp CSS của Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container mx-auto p-4">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h1 class="text-3xl font-semibold mb-4">Student Profile</h1>
        <div class="mb-4" id="viewProfile">
            <div class="text-lg font-semibold">Full Name: <span class="text-gray-700"><c:out value="${staff.fullName}" /></span></div>
            <div class="text-lg font-semibold">Date of Birth: <span class="text-gray-700"><c:out value="${staff.dateOfBirth}" /></span></div>
            <div class="text-lg font-semibold">Gender: <span class="text-gray-700"><c:out value="${staff.gender}" /></span></div>
            <div class="text-lg font-semibold">Email: <span class="text-blue-500"><c:out value="${staff.email}" /></span></div>
            <div class="text-lg font-semibold">Phone: <span class="text-gray-700"><c:out value="${staff.phone}" /></span></div>
            <div class="text-lg font-semibold">Address: <span class="text-gray-700"><c:out value="${staff.address}" /></span></div>
            <div class="text-lg font-semibold">Major: <span class="text-gray-700"><c:out value="${staff.department}" /></span></div>
          
        </div>
       
    </div>
</div>

</body>
</html>

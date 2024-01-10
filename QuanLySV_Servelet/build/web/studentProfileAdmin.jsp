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
    <%@ include file="sidebar.jsp" %>
    <div class="container mx-auto p-4" style="margin-left: 350px">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h1 class="text-3xl font-semibold mb-4">Student Profile</h1>
        <div class="mb-4" id="viewProfile">
           <div class="text-lg font-semibold">Full Name: <span class="text-gray-700"><c:out value="${staff.fullName}" /></span></div>
            <div class="text-lg font-semibold">Date of Birth: <span class="text-gray-700"><c:out value="${staff.dateOfBirth}" /></span></div>
            <div class="text-lg font-semibold">Gender: <span class="text-gray-700"><c:out value="${staff.gender}" /></span></div>
            <div class="text-lg font-semibold">Email: <span class="text-blue-500"><c:out value="${staff.email}" /></span></div>
            <div class="text-lg font-semibold">Phone: <span class="text-gray-700"><c:out value="${staff.phone}" /></span></div>
            <div class="text-lg font-semibold">Address: <span class="text-gray-700"><c:out value="${staff.address}" /></span></div>
            <div class="text-lg font-semibold">Department: <span class="text-gray-700"><c:out value="${staff.department}" /></span></div>
            <div class="text-lg font-semibold">Role: <span class="text-gray-700"><c:out value="${staff.role}" /></span></div>
           <button onclick="editProfile()">Change Profile</button>
        </div>
        <div class="mb-4" id="editProfile" style="display: none;">
            <!-- Form to edit profile -->
            <form action="updateProfile" method="post">
                <!-- Include input fields for editing profile -->
                <!-- Example: -->
                <!-- <input type="text" name="fullName" value="<c:out value='${staff.fullName}' />"> -->
                <button type="submit">Save</button>
                <button onclick="cancelEdit()">Cancel</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>

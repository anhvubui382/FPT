<%-- 
    Document   : trangChu
    Created on : Nov 9, 2023, 7:29:02 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    <%@include file="header.jsp" %>

    <!-- Banner Background -->
    <div class="bg-cover bg-center h-64" style="background-image: url('your-image.jpg');">
        <div class="container mx-auto flex items-center justify-center h-full">
            <h1 class="text-4xl text-white font-extrabold">Welcome to Our Website</h1>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container mx-auto mt-10 text-center">
        <h2 class="text-3xl font-semibold">Discover Our Services</h2>
        <p class="text-lg text-gray-600 mt-4">We have the best services for you.</p>
    </div>

    <!-- Footer -->
    <footer class="bg-gray-200 py-4">
        <div class="container mx-auto text-center">
            <p class="text-gray-600">© 2023 Your Company. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>

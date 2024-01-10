<%-- 
    Document   : studentHome
    Created on : Nov 9, 2023, 7:51:46 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Home</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-200">
        <%@include file="header.jsp" %>


        <main class="container mx-auto py-4">
            <% 
    String fullname = (String) session.getAttribute("fullname");

    if (fullname != null) {
            %>
            <p>Welcome, <%= fullname %>!</p>
            <% } %>


            <div class="bg-white rounded-lg shadow-md p-4 mb-4">
                <h3 class="text-lg font-semibold mb-2"><a href="studentRequest.jsp">Send Request</a></h3>
                <h3 class="text-lg font-semibold mb-2"><a href="xuLiRequest">View Request</a></h3>

            </div>

            <div class="bg-white rounded-lg shadow-md p-4">
                <h3 class="text-lg font-semibold">Your Information</h3>
                <ul class="list-disc ml-6">
                    <li>Name: [Student Name]</li>
                    <li>Student ID: [Student ID]</li>
                    <li>Email: [Student Email]</li>
                    <!-- Add more student information here -->
                </ul>
            </div>
        </main>
    </body>
</html>


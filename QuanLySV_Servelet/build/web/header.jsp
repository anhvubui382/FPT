<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .dropdown-toggle.btn.btn-primary {
                display: flex;
                align-items: center;
                padding: 0.5rem 1rem;
                margin: 0;
            }
            .dropdown-menu {
                right: 0;
            }
        </style>
    </head>
    <body>
        <nav class="bg-blue-500 p-4">
            <div class="container mx-auto flex justify-between items-center">
                <a href="studentHome.jsp" class="text-white text-2xl font-bold">Trong Vu</a>
                <div class="space-x-4">
                    <a href="studentHome.jsp" class="text-white">Home</a>
                    <a href="#" class="text-white">About</a>
                    <a href="#" class="text-white">Services</a>
                    <a href="#" class="text-white">Contact</a>
                    <%
                    String username = (String) session.getAttribute("username");

                    if (username == null) {
                    %>
                        <button class="text-white border-2 border-blue-600 rounded-full px-4 py-2" onclick="location.href='login.jsp'">Login</button>
                    <%
                    } else {
                    %>
                        <div class="dropdown">
                            <button class="btn btn-primary" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%= username %>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <!-- Add dropdown menu items here, e.g., Profile, Settings, Logout -->
                                <a class="dropdown-item" href="studentProfile">Profile</a>
                                <a class="dropdown-item" href="changePassword.jsp">Change Password</a>
                                <a class="dropdown-item" href="login">Logout</a>
                            </div>
                        </div>
                    <%
                    } %>
                </div>
            </div>
        </nav>
    </body>
</html>

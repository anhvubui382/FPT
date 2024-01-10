<%-- 
    Document   : sidebar
    Created on : Nov 8, 2023, 11:32:38 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style>
            body,h1,h2,h3,h4,h5 {
                font-family: "Raleway", sans-serif
            }
        </style>

    </head>
    <body>
        <%
        // Lấy giá trị email từ session
        String email = (String) session.getAttribute("username");
        %>

        <!-- Sidebar/menu -->

      <nav class="w3-sidebar w3-bar-block w3-animate-left w3-text-white w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-size: 20px;font-weight:bold; background-color: #170d33" id="mySidebar">
    <h3 class="w3-padding-64 w3-center"><b> </b></h3>
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">
        <i class="fas fa-times"></i> CLOSE
    </a>
    <a href="teacherManage" onclick="w3_close()" class="w3-bar-item w3-button">
        <i class="fas fa-chalkboard-teacher"></i> Teacher
    </a>
    <a href="studentManage" onclick="w3_close()" class="w3-bar-item w3-button">
        <i class="fas fa-user-graduate"></i> Student
    </a>
    <a href="studentRequest" onclick="w3_close()" class="w3-bar-item w3-button">
        <i class="fas fa-envelope"></i> Student Request
    </a>
    <a href="adminClassHome.jsp" onclick="w3_close()" class="w3-bar-item w3-button">
        <i class="fas fa-envelope"></i> Major
    </a>
    <a href="checkStatus" onclick="w3_close()" class="w3-bar-item w3-button">
        <i class="fas fa-envelope"></i> Status
    </a>
</nav>



    </body>
</html>

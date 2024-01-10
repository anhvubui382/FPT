<%-- 
    Document   : studentProfile
    Created on : Nov 1, 2023, 5:21:51 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            html,
            body,
            h1,
            h2,
            h3,
            h4,
            h5 {
                font-family: "RobotoDraft", "Roboto", sans-serif;
                margin: 0;
                padding: 0;
            }

            body {
                background-color: white;
                /* Màu nền trắng */
                border-left: 1px solid black;
                /* Đường kẻ màu đen ngăn cách giữa sidebar và phần còn lại */
            }

            .w3-bar-block .w3-bar-item {
                padding: 16px
            }

            .empty-area {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                display: flex;
                justify-content: flex-start;
                align-items: flex-start;
                padding: 16px;
            }
            .first-column {
                font-weight: bold;
            }
            .empty-area h1 {
                font-size: 36px;
                color: orange;
            }

            .order_search {
                border-radius: 5px;
            }

            /* Đổi màu viền cho input và select */
            input,
            select {
                border: 2px solid gray;
            }

            /* Đổi màu nền cho thẻ th và thẻ td trong bảng */
            table {
                margin-top: 20px;
                border-collapse: collapse;
                width: 100%;
            }

            table,
            th,
            td {
                border: 1px solid #ddd;
            }

            th,
            td {
                padding: 10px;
                text-align: left;
                width: 200px;
            }

            th {
                background-color: gray;
                color: white;
                font-weight: bold;
                /* Đậm hơn */
            }

            tr:nth-child(odd) {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #e6e6e6;
            }


            td {
                text-align: center; /* Căn giữa theo chiều ngang */
                vertical-align: middle; /* Căn giữa theo chiều dọc */
            }
            th{
                text-align: center; /* Căn giữa theo chiều ngang */
                vertical-align: middle; /* Căn giữa theo chiều dọc */
            }
            .slot-cell-td {
                border: 3px solid #007bff; /* Đường viền màu xanh primary */
                border-radius: 10px; /* Góc bo */
                padding: -5px -5px;
                background-color: #007bff;
                color: white;
            }
            .date-cell-td {
                border: 3px solid red; /* Đường viền màu xanh primary */
                border-radius: 10px; /* Góc bo */
                padding:3px;
                background-color: red;
                color: white;
            }
            .container {
                position: relative;
                top: 50px; /* Dịch chuyển container xuống phía dưới 50px */
                margin-right: 60px; /* Dịch chuyển container sang phải 60px */
            }
        </style>
    </head>
    <body>
        <nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index:3;width:320px; margin-top: -45px"
             id="mySidebar">
            <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom w3-large">
                <img src="https://www.w3schools.com/images/w3schools.png" style="width:60%;">
            </a>
           
           <a href="getAttendance" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align">
            Attendance Report <i class="w3-padding fa fa-pencil"></i>
        </a>
        <a href="getStudentProfile" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align">
            Profile <i class="w3-padding fa fa-pencil"></i>
        </a>
        <a href="updateStudentProfile" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align">
            Update Profile <i class="w3-padding fa fa-pencil"></i>
        </a>
        <a href="changePassword" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align">
            Change Password <i class="w3-padding fa fa-pencil"></i>
        </a>
        </nav>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h2>Student Profile</h2>
                        </div>
                        <div class="card-body">
                            <p>Student ID: ${student.studentID}</p>
                            <p>Name: ${student.studentName}</p>
                            <p>Email: ${student.email}</p>
                            <p>Password: ${student.password}</p>
                            <p>Gender: ${student.gender}</p>
                            <p>Mobile Phone: ${student.mobilePhone}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

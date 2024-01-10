<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Attendance Percentage</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html, body, h1, h2, h3, h4, h5 {
                font-family: "RobotoDraft", "Roboto", sans-serif;
                margin: 0;
                padding: 0;
            }

            body {
                background-color: white;
                border-left: 1px solid black;
            }

            .w3-bar-block .w3-bar-item {
                padding: 16px;
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

            .empty-area h1 {
                font-size: 36px;
                color: orange;
            }

            .order_search {
                border-radius: 5px;
            }

            input, select {
                border: 2px solid gray;
            }

            table {
                margin-top: 20px;
                border-collapse: collapse;
                width: 100%;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: center; /* Canh giữa nội dung */
            }

            th {
                background-color: gray;
                color: white;
                font-weight: bold;
                width: 10%; /* Độ rộng của cột */
                font-size: 16px;
            }

            tr:nth-child(odd) {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #e6e6e6;
            }

            tr.shipped {
                border-left: 4px solid #00FF00;
            }

            tr.new-order {
                border-left: 4px solid #0000FF;
            }

            tr.cancelled {
                border-left: 4px solid #FF1493;
            }

            tr.rejected {
                border-left: 4px solid #FF0000;
            }

            table {
                margin-top: 20px;
                border-collapse: collapse;
                width: 150%;
            }

            th {
                width: 10%; /* Đã giảm chiều rộng của tất cả các cột xuống 10% */
                font-size: 16px;
            }
            td {
                width: 10%; /* Đã giảm chiều rộng của tất cả các cột xuống 10% */
                font-size: 16px;
                text-align: center;
            }

            .middle-sidebar {
                position: fixed;
                width: 200px;
                height: 100%;
                background-color: #333;
                color: white;
                margin-left: 220px;
                padding-top: 100px;
            }

            .middle-sidebar a {
                padding: 16px 15px;
                text-decoration: none;
                font-size: 18px;
                color: white;
                display: block;
            }

            .middle-sidebar a:hover {
                background-color: #ddd;
                color: black;
            }

            .slot-cell-td {
                border: 3px solid #007bff;
                border-radius: 10px;
                padding: -5px -5px;
                background-color: #007bff;
                color: white;
            }

            .attendance-date {
                border: 3px solid #FFCCCC;
                border-radius: 10px;
                padding: -5px -5px;
                background-color: red;
                color: white;
            }
        </style>
    </head>
    <body>
        <nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index: 3; width: 220px;" id="mySidebar">
            <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom w3-large">
                <img src="https://www.w3schools.com/images/w3schools.png" style="width: 60%;">
            </a>
            <a href="teacherSchedule" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align"
               >Timetable
            </a>
            <a href="teacherGetCourse" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align"
               >Get Attendance Percent
            </a>

        </nav>

        <!-- Middle Sidebar -->
        <div class="middle-sidebar w3-sidebar w3-bar-block w3-collapse w3-light-gray w3-animate-left w3-card">    
            <c:forEach var="course" items="${teacherCourses}">
                <a style="color: black" href="getPercentAttendance?course=${course}">${course}</a>
            </c:forEach>
        </div>



        <div style="margin-left: 400px;" class="empty-area">
            <div style="margin-left: 60px;">

                <h1>Attendance Percentage</h1>

                <table>
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Course Name</th>
                            <th>Numbers Absent</th>
                            <th>Total Slot</th>
                            <th>Percentage Absent(%)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${attendanceRecords}" var="record">
                            <tr>
                                <td>${record.studentName}</td>
                                <td>${record.courseName}</td>
                                <td>${record.countIsZero}</td>
                                <td>${record.totalRecords}</td>
                                <td style="font-weight: bolder;color: ${record.zeroPercentage > 20 ? 'red' : 'green'}">${record.zeroPercentage}%</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

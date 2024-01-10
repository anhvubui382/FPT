<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Schedule Information</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                font-size: 18px;
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
        </style>
    </head>
    <body>
        <!-- Side Navigation -->
        <nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index:3;width:320px;"
             id="mySidebar">
            <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom w3-large">
                <img src="https://www.w3schools.com/images/w3schools.png" style="width:60%;">
            </a>
           <a href="teacherSchedule" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align"
               >Timetable
                   </a>
            <a href="teacherGetCourse" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align"
               >Get Attendance Percent
                   </a>
        </nav>

        <!-- Empty Area for "ORDER MANAGEMENT" Title -->
        <div style="margin-left: 340px;" class="empty-area">
            <div style="margin-left: 60px;">
                <h1 style="margin-left: 100px"><strong>Take Attendance</strong></h1>

                <table style="margin-left: 70px">
                    <tr>

                        <th>Student Name</th>

                        <th  style="width: 500px;">Attendance</th>
                    </tr>
                    <form action="saveAttendance" method="post">
                        <c:forEach items="${attendanceList}" var="record">
                            <tr>
                                <td>${record.studentName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${record.isPresent == null}">
                                            <div style="display: flex; align-items: center;">
                                                <span style="margin: 0 30px;">&nbsp;</span>
                                                <input type="checkbox" name="attendance_${record.studentID}" value="0" >
                                                <p style="color: red; font-weight: bold">Absent</p>
                                                <span style="margin: 0 70px;">&nbsp;</span>
                                                <input type="checkbox" name="attendance_${record.studentID}" value="1">
                                                <p style="color: #33cc00; font-weight: bold">Present</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            ${record.isPresent == 1 ? 'Present' : 'Absent'}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                </table>
                <div style="margin-left: 45px">
                    <button type="submit" style="border-radius:5px;  background-color: #33cc00; color: white;margin: 15px; padding: 5px; width: 30%;font-size: 20px; margin-left:100px">Submit</button>
                    <button style="border-radius:5px;  background-color: #ff6633; color: white;margin: 15px; padding: 5px; width: 30%;font-size: 20px; margin-left:100px"><a href="teacherSchedule.jsp">Cancel</a></button>

                </div>
                </form>
            </div>



        </div>
    </body>
</html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>STUDENT PAGE</title>
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
                <h1><strong>TEACHER'S TIMETABLE</strong></h1>
                <div>
                    <form action="teacherSchedule" method="POST">
                        <input type="date" name="start_date">
                        <input type="date" name="end_date">
                        <button type="submit">Search</button>
                    </form>

                </div>

                <table>
                    <tr>
                        <th>Date</th>
                        <th>Course Name</th>
                        <th>Class Name</th>
                        <th>Slot</th>
                        <th>Take Attendance</th>
                    </tr>
                    <c:forEach items="${attendanceRecords}" var="record">
                        <tr>
                            <td><p class="date-cell-td">${record.date}</p></td>

                            <td style="font: bold; font-size: 20px">${record.courseName}</td>
                            <td  style="font: bold; font-size: 20px">${record.className}</td>
                            <td ><c:choose>
                                    <c:when test="${record.slot == 1}">
                                        <p class="slot-cell-td">7:30:00 - 9:30:00</p>
                                    </c:when>
                                    <c:when test="${record.slot == 2}">
                                        <p class="slot-cell-td">10:00:00 - 12:20:00</p>
                                    </c:when>
                                    <c:when test="${record.slot == 3}">
                                        <p class="slot-cell-td">12:50:00 - 15:10:00</p>
                                    </c:when>
                                    <c:when test="${record.slot == 4}">
                                        <p class="slot-cell-td">15:20:00 - 17:40:00</p>
                                    </c:when>
                                    <c:when test="${record.slot == 5}">
                                        <p class="slot-cell-td">18:00:00 - 20:20:00</p>
                                    </c:when>
                                    <c:otherwise>
                                        Unknown Slot
                                    </c:otherwise>
                                </c:choose></td>
                            <td><a href="takeAttendance?id=${record.slot}&className=${record.className}&date=${record.date}"><strong>Take</strong></a></td>

                        </tr>
                    </c:forEach>
                </table>



            </div>



        </div>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>
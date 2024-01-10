
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

        tr.shipped {
            border-left: 4px solid #00FF00;
            /* Xanh lá */
        }

        tr.new-order {
            border-left: 4px solid #0000FF;
            /* Xanh dương */
        }

        tr.cancelled {
            border-left: 4px solid #FF1493;
            /* Màu hồng đất */
        }

        tr.rejected {
            border-left: 4px solid #FF0000;
            /* Màu đỏ đậm */
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
        <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu"
            class="w3-bar-item w3-button w3-hide-large w3-large">
            Close <i class="fa fa-remove"></i>
        </a>
         <a href="teacherGetCourse" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align"
               >Get Attendance Percent<i
                    class="w3-padding fa fa-pencil"></i></a>

        <div style="position: absolute; bottom: 0; left: 16px;">
            <p style="margin-bottom: -15px;">Bui Anh Vu</p> <!-- Tên khách hàng -->
            <p>anhvubui382@gmail.com</p> <!-- Địa chỉ email -->
        </div>
    </nav>

    
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>

</html>
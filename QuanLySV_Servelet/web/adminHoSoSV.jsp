<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ho So Sinh Vien</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.15/tailwind.min.css">
    <style>
        body,h1,h2,h3,h4,h5 {
            font-family: "Raleway", sans-serif;
        }
        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #3498db; /* Màu nền của ảnh */
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .profile-image img {
            max-width: 100%;
            max-height: 100%;
            border-radius: 50%;
        }
        .profile-heading {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
        }
        .profile-subheading {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .profile-info {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            margin-left: 60px;
        }
        .profile-info-title {
            width: 150px; /* Độ rộng cố định cho tiêu đề */
            display: inline-block; /* Hiển thị trên cùng một dòng */
            font-weight: bold;
            margin-right: 20px;
        }
    </style>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">
    <%@include file="sidebar.jsp" %>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px">
        <div class="max-w-4xl mx-auto p-8 bg-white mt-16 rounded shadow-md">
            <h1 class="profile-heading">Hồ Sơ Sinh Viên</h1>

            <!-- Hình ảnh cá nhân của sinh viên -->
            <div class="mb-4 flex justify-center">
                <div class="profile-image">
                    <img src="path_to_image_1.jpg" alt="Hình ảnh sinh viên 1">
                </div>
                <div class="profile-image ml-4">
                    <img src="path_to_image_2.jpg" alt="Hình ảnh sinh viên 2">
                </div>
            </div>

            <!-- Thông tin cá nhân của sinh viên -->
            <div class="mb-4">
                <h2 class="profile-subheading">Thông Tin Cá Nhân</h2>
                <p class="profile-info">
                    <span class="profile-info-title">Họ và Tên:</span> Sinh Viên A
                </p>
                <p class="profile-info">
                    <span class="profile-info-title">Ngày Sinh:</span> 01/01/2000
                </p>
                <p class="profile-info">
                    <span class="profile-info-title">Giới Tính:</span> Nam
                </p>
                <p class="profile-info">
                    <span class="profile-info-title">Email:</span> sinhVienA@example.com
                </p>
                <p class="profile-info">
                    <span class="profile-info-title">Số Điện Thoại:</span> 0123456789
                </p>
                <p class="profile-info">
                    <span class="profile-info-title">Địa Chỉ:</span> 123 Đường ABC, Quận XYZ
                </p>
                <p class="profile-info">
                    <span class="profile-info-title">Khoa:</span> Khoa ABC
                </p>
            </div>

            <!-- Danh sách các lớp học -->
            <div>
                <h2 class="profile-subheading">Danh Sách Lớp Học</h2>
                <ul>
                    <li class="profile-info">Lớp 1: Mã Lớp 1</li>
                    <li class="profile-info">Lớp 2: Mã Lớp 2</li>
                    <!-- Thêm các lớp học khác ở đây -->
                </ul>
            </div>
        </div>
    </div>
</body>
</html>

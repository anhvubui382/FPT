<%-- 
    Document   : studentRequest
    Created on : Nov 8, 2023, 4:58:02 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.16/dist/tailwind.min.css" rel="stylesheet">
        <title>Gửi Đơn</title>
        <style>
            .fixed-top-bar {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                background-color: #374151; /* Màu nền của thanh bar */
                color: white; /* Màu chữ của thanh bar */
                padding: 0.5rem 1rem; /* Khoảng cách nội dung trong thanh bar */
            }
        </style>
    </head>
    <body class="bg-gray-100 p-8">
        <!-- Navbar -->
        <%@include file="header.jsp" %>
        
        <div class="max-w-xl mx-auto mt-16 bg-white p-6 rounded-md shadow-md">
            <h1 class="text-2xl font-semibold mb-4 text-center">Gửi Đơn Cho Nhà Trường</h1>
            <p class="text-sm text-gray-600">
                <b>Send an application to Academic Administration dept (Gửi đơn cho Phòng quản lý đào tạo)</b>
                <br> Lưu ý: V/v gửi đơn/email đến các phòng ban
                <br> Bộ phận xử lý đơn sẽ trả lời đơn/email của sinh viên trong vòng 48h (trừ đơn rút tiền, đơn phúc tra, chuyển cơ sở...).
                <br> Để hạn chế SPAM, sẽ giãn thời gian trả lời đơn/email có tính chất SPAM theo nguyên tắc: Khi sinh viên gửi N đơn/email (N>1) cho cùng một yêu cầu thì thời gian trả lời trong vòng Nx48h.
                <br> Vì vậy sinh viên cần cân nhắc trước khi gửi đơn/email với cùng một nội dung để nhận được trả lời/giải quyết nhanh nhất theo quy định.
            </p>
            <form action="studentRequest" method="POST" class="mt-6">
                <div class="mb-4">
                    <label for="select" class="block text-gray-700 font-bold mb-2">Chọn Loại Đơn</label>
                    <select id="select" name="don" class="w-full p-2 border rounded-md">
                        <option disabled selected>Choose Application Type</option>
                        <option value="1">Đơn Miễn Điểm Danh</option>
                        <option value="2">Đơn Xin Nhập Học Trở Lại</option>
                        <option value="3">Đơn Rút Tiền</option>
                        <option value="4">Đơn Đề Nghị Hoàn Tiền</option>
                        <option value="5">Đơn Đăng Ký Thi Cải Thiện Điểm</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label for="reason" class="block text-gray-700 font-bold mb-2">Lý Do</label>
                    <textarea id="reason" name="reason" class="w-full p-2 border rounded-md"></textarea>
                </div>
                <div class="mb-4">
                    <label for="reason" class="block text-gray-700 font-bold mb-2">File</label>
                    <input type="file">
                </div>
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-md w-full">Gửi</button>
            </form>
        </div>
    </body>
</html>

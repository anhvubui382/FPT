<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            }

            .container {
                position: relative;
                top: 50px;
                margin-right: 60px;
            }

            .error-message {
                color: red;
                font-size: 12px;
                display: flex;
                align-items: center;
            }

        </style>
    </head>
    <body>
        <nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index:3;width:320px; margin-top: -45px" id="mySidebar">
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
                            <h2>Update Profile</h2>
                        </div>

                        <div class="card-body">
                            <form action="updateStudentProfile" method="post">
                                <div class="form-group">
                                    <label for="studentName">Name:</label>
                                    <input type="text" class="form-control" name="studentName" id="studentName" value="${student.studentName}">
                                    <span id="nameError" class="error-message"></span>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" name="email" id="email" value="${student.email}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender:</label>
                                    <select class="form-control" name="gender" id="gender">
                                        <option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="mobilePhone">Mobile Phone:</label>
                                    <input type="text" class="form-control" name="mobilePhone" id="mobilePhone" value="${student.mobilePhone}">
                                    <span id="phoneError" class="error-message"></span>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary" onclick="return validateForm();">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var name = document.getElementById("studentName").value;
                var phone = document.getElementById("mobilePhone").value;

                var nameError = document.getElementById("nameError");
                var phoneError = document.getElementById("phoneError");

                nameError.innerText = "";
                phoneError.innerText = "";

                var valid = true;

                if (name.length === 0 || name.length > 255) {
                    nameError.innerText = "Tên không hợp lệ. Tên không được để trống và phải có ít hơn 255 ký tự.";
                    valid = false;
                } else if (!isNameValid(name)) {
                    nameError.innerText = "Tên không được chứa số và ký tự đặc biệt.";
                    valid = false;
                }

                if (!isPhoneNumberValid(phone)) {
                    phoneError.innerText = "Số điện thoại không hợp lệ. Số điện thoại phải đúng định dạng của Việt Nam.";
                    valid = false;
                }

                return valid;
            }

            function isNameValid(name) {
                // Sử dụng biểu thức chính quy để kiểm tra tên không chứa số và ký tự đặc biệt
                return /^[a-zA-Z\s]*$/.test(name);
            }

            function isPhoneNumberValid(phoneNumber) {
                return /^(0|84)[0-9]{8,9}$/.test(phoneNumber);
            }
        </script>
    </body>
</html>

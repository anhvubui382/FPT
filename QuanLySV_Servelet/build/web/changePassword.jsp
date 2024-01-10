<%-- 
    Document   : changePassword
    Created on : Nov 1, 2023, 5:21:51 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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



            .container {
                position: relative;
                top: 50px;

            }
            .error-message{
                color: red;
            }
        </style>
    </head>
    <body>

        <% String currentPasswordError = (String) request.getSession().getAttribute("currentPasswordError"); %>
        <% String confirmPasswordError = (String) request.getSession().getAttribute("confirmPasswordError"); %>
        <% String newPasswordError = (String) request.getSession().getAttribute("newPasswordError"); %>


        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h2>Change Password</h2>

                        </div>

                        <div class="card-body">                           

                            <form action="changePassword" method="post">
                                <div class="form-group">
                                    <% if (currentPasswordError != null) { %>
                                    <div class="error-message">
                                        <%= currentPasswordError %>
                                    </div>
                                    <% } %>
                                    <label for="currentPassword">Current Password:</label>
                                    <input type="password" class="form-control" name="currentPassword" id="currentPassword">
                                </div>

                                <div class="form-group">
                                    <label for="newPassword">New Password:</label>
                                    <input type="password" class="form-control" name="newPassword" id="newPassword">
                                    <div id="newPasswordError" class="error-message"></div> <!-- Thêm id ở đây -->
                                    <% if (newPasswordError != null) { %>
                                    <div class="error-message">
                                        <%= newPasswordError %>
                                    </div>
                                    <% } %>
                                </div>


                                <div class="form-group">
                                    <label for="confirmPassword">Confirm New Password:</label>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
                                    <div id="confirmPasswordError" class="error-message"></div>
                                    <% if (confirmPasswordError != null) { %>
                                    <div class="error-message">
                                        <%= confirmPasswordError %>
                                    </div>
                                    <% } %>
                                </div>

                                <div class="text-center mt-3">
                                    <button type="button" class="btn btn-primary"><a href="studentHome.jsp">Back to Home</a></button>
                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var newPasswordInput = document.getElementById("newPassword");
                var newPasswordError = document.getElementById("newPasswordError");

                newPasswordInput.addEventListener("blur", function () {
                    validateNewPassword(newPasswordInput.value);
                });

                function validateNewPassword(password) {
                    var passwordRegex = /^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/;
                    if (!passwordRegex.test(password)) {
                        newPasswordError.innerText = "Mật khẩu mới phải có ít nhất 8 ký tự, ít nhất 1 số và ít nhất 1 ký tự đặc biệt.";
                    } else {
                        newPasswordError.innerText = "";
                    }
                }
            });

            document.addEventListener("DOMContentLoaded", function () {
                var confirmPasswordInput = document.getElementById("confirmPassword");
                var confirmPasswordError = document.getElementById("confirmPasswordError");
                var newPasswordInput = document.getElementById("newPassword");

                confirmPasswordInput.addEventListener("blur", function () {
                    validateConfirmPassword(newPasswordInput.value, confirmPasswordInput.value);
                });

                function validateConfirmPassword(newPassword, confirmPassword) {
                    if (newPassword !== confirmPassword) {
                        confirmPasswordError.innerText = "Mật khẩu xác nhận không khớp với mật khẩu mới.";
                    } else {
                        confirmPasswordError.innerText = "";
                    }
                }
            });
        </script>
    </body>
</html>

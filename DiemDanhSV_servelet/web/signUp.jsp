<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>

        <!-- Bootstrap 4 CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Font Awesome CDN -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">

        <!-- Custom styles -->
        <style>
            @import url('https://fonts.googleapis.com/css?family=Numans');

            html, body {
                background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }

            .container {
                height: 100%;
                align-content: center;
            }

            .card {
                height: auto;
                margin-top: auto;
                margin-bottom: auto;
                width: 400px;
                background-color: rgba(0, 0, 0, 0.5) !important;
            }

            .card-header h3 {
                color: white;
            }

            .input-group form-group {
                color: white;
            }

            .input-group-prepend span {
                width: 50px;
                background-color: #FFC312;
                color: black;
                border: 0 !important;
            }

            input:focus {
                outline: 0 0 0 0 !important;
                box-shadow: 0 0 0 0 !important;
            }

            .remember {
                color: white;
            }

            .remember input {
                width: 20px;
                height: 20px;
                margin-left: 15px;
                margin-right: 5px;
            }

            .sign-up_btn {
                color: black;
                background-color: #FFC312;
                width: 100px;
            }

            .sign-up_btn:hover {
                color: black;
                background-color: white;
            }

            .error-message {
                color: red; /* Set the text color to red */
                margin-top: 15px;
                margin-bottom: -15px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <h3>Sign Up</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty validationErrors}">
                            <div class="error-messages" style="color: red; margin-top: -30px; margin-bottom: 20px">
                                <c:forEach items="${validationErrors}" var="error">
                                    <c:out value="${error}"/>
                                    <br>
                                </c:forEach>
                            </div>
                        </c:if>

                        <form action="signUp" method="POST">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" name="name" placeholder="Name">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input type="text" class="form-control" name="email" placeholder="Email">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-mobile"></i></span>
                                </div>
                                <input type="text" class="form-control" name="mobilePhone" placeholder="Mobile Phone">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
                                </div>
                                <select name="gender" class="form-control">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>

                                </select>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Sign Up" class="btn float-right sign-up_btn">
                            </div>
                        </form>
                    </div>
                    <div class="card-footer" style="margin-top: -20px">
                        <div class="d-flex justify-content-center">
                            <a href="login.jsp">Already have an account? Sign In</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

<%-- adminTeacherHome.jsp --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Teacher Home</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css" rel="stylesheet">

        <style>
            body,h1,h2,h3,h4,h5 {
                font-family: "Raleway", sans-serif
            }

        </style>
    </head>
    <body>
    <body class="w3-light-grey w3-content" style="max-width:1600px">

        <%@include file="sidebar.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px">

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Department</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="teacher" items="${teachers}">
                        <tr>
                            <td>${teacher.id}</td>
                            <td>${teacher.fullName}</td>
                            <td>${teacher.dateOfBirth}</td>
                            <td>${teacher.gender}</td>
                            <td>${teacher.email}</td>
                            <td>${teacher.phone}</td>
                            <td>${teacher.address}</td>
                            <td>${teacher.department}</td>
                            <td><a href="editTeacher?id="${teacher.id}">Edit</a></td>
                            <td><a href="url">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table><div class="w3-main" style="margin-left: 100px; margin-right: 100px">

                <h2>Add New Teacher</h2>

                <form class="needs-validation" novalidate>
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" required>
                        <div class="invalid-feedback">
                            Please provide a full name.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth</label>
                        <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                        <div class="invalid-feedback">
                            Please provide a valid date of birth.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select class="form-control" id="gender" name="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a gender.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                        <div class="invalid-feedback">
                            Please provide a valid email address.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required>
                        <div class="invalid-feedback">
                            Please provide a valid phone number.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                        <div class="invalid-feedback">
                            Please provide an address.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="department">Department</label>
                        <input type="text" class="form-control" id="department" name="department" required>
                        <div class="invalid-feedback">
                            Please provide a department.
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Add Teacher</button>
                </form>

            </div>
        </div>

        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }

            // Modal Image Gallery
            function onClick(element) {
                document.getElementById("img01").src = element.src;
                document.getElementById("modal01").style.display = "block";
                var captionText = document.getElementById("caption");
                captionText.innerHTML = element.alt;
            }

        </script>


    </body>

    <!-- Thêm các thông tin khác hoặc chức năng tại đây -->
</body>
</html>

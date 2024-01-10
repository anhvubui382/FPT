<%-- adminTeacherHome.jsp --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student Information</title>
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



        <div class="w3-main" style="margin-left: 400px; margin-right: 100px">
            <h2>Edit Student</h2>
            <form method="POST" action="editStudent" class="needs-validation" novalidate>
                 <div class="form-group">
                    <label for="MSSV">MSSV</label>
                    <input type="text" class="form-control" id="fullName" name="id" required value="${student.id}" readonly> 
                    <div class="invalid-feedback">
                        Please provide a full name.
                    </div>
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required value="${student.fullName}">
                    <div class="invalid-feedback">
                        Please provide a full name.
                    </div>
                </div>

                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth</label>
                    <input type="date" class "form-control" id="dateOfBirth" name="dateOfBirth" required value="${student.dateOfBirth}">
                    <div class="invalid-feedback">
                        Please provide a valid date of birth.
                    </div>
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender" required>
                        <option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
                    </select>
                    <div class="invalid-feedback">
                        Please select a gender.
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required value="${student.email}">
                    <div class="invalid-feedback">
                        Please provide a valid email address.
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required value="${student.phone}">
                    <div class="invalid-feedback">
                        Please provide a valid phone number.
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" required value="${student.address}">
                    <div class="invalid-feedback">
                        Please provide an address.
                    </div>
                </div>

                <div class="form-group">
                    <label for="department">Department</label>
                    <input type="text" class="form-control" id="department" name="department" required value="${student.department}">
                    <div class="invalid-feedback">
                        Please provide a department.
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Update Student</button>
            </form>
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

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Student Home</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css" rel="stylesheet>

    <style>
        body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif
        }
    </style>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">
    <%@include file="sidebar.jsp" %>
   
    
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:350px; margin-top: 50px">
        <form action="searchByName" method="POST">
             Search By Name: <input type="text" name="searchByName"> <button type="submit">Search</button>
        </form>
       
        <table class="min-w-full">
            <thead>
                <tr>
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">Full Name</th>
                    <th class="px-4 py-2">Date of Birth</th>
                    <th class="px-4 py-2">Gender</th>
                    <th class="px-4 py-2">Email</th>
                    <th class="px-4 py-2">Phone</th>
                    <th class="px-4 py-2">Address</th>
                    <th class="px-4 py-2">Department</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="teacher" items="${students}">
                    <tr>
                        <td class="px-4 py-2">${teacher.id}</td>
                        <td class="px-4 py-2">${teacher.fullName}</td>
                        <td class="px-4 py-2">${teacher.dateOfBirth}</td>
                        <td class="px-4 py-2">${teacher.gender}</td>
                        <td class="px-4 py-2">${teacher.email}</td>
                        <td class="px-4 py-2">${teacher.phone}</td>
                        <td class="px-4 py-2">${teacher.address}</td>

                        <td class="px-4 py-2">
                            <a href="editStudent?id=${teacher.id}" class="text-blue-600 hover:underline">Edit</a>
                            <a href="deleteStudent?id=${teacher.id}" class="text-red-600 hover:underline ml-2">Delete</a>
                            <a href="studentProfile?id=${teacher.id}" class="text-red-600 hover:underline ml-2">View</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="w3-main" style="margin-left: 100px; margin-right: 100px">

            <h2>Add New Student</h2>

            <form action="addStudent" method="GET" class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                    <div class="invalid-feedback">
                        Please provide a full name.
                    </div>
                    <div id="fullNameError" class="error-message"></div>
                </div>

                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth</label>
                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                    <div class="invalid-feedback">
                        Please provide a valid date of birth.
                    </div>
                    <div id="dateOfBirthError" class="error-message"></div>
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
                    <div id="emailError" class="error-message" style="color: red;"></div>
                </div>

                <div class="form-group">
                    <label for="email">Password</label>
                    <input type="email" class="form-control" id="password" name="password" required>
                    <div class="invalid-feedback">
                        Please provide a valid password address.
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
                    <label for="department">Major</label>
                    <select id="department" name="department" required>
                        <option value="" selected disabled>Select Major</option>
                        <option value="Software Engineering">Software Engineering</option>
                        <option value="Marketing">Marketing</option>
                        <option value="MC">MC</option>
                    </select>
                   
                    <div class="invalid-feedback">
                        Please provide a department.
                    </div>
                </div>

                <button type="submit" class="btn btn-primary" onclick="return validateForm();">Add Student</button>
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

        function validateFullName(fullName) {
            if (!/^[A-Za-z\s]+$/.test(fullName)) {
                document.getElementById("fullNameError").innerText = "Tên không được chứa số hoặc ký tự đặc biệt.";
                document.getElementById("fullNameError").style.color = "red";
                return false;
            } else {
                document.getElementById("fullNameError").innerText = "";
                return true;
            }
        }

        function validateDateOfBirth(dateOfBirth) {
            var currentDate = new Date();
            var inputDate = new Date(dateOfBirth);
            var sixteenYearsAgo = new Date(currentDate);
            sixteenYearsAgo.setFullYear(currentDate.getFullYear() - 16);

            if (inputDate > sixteenYearsAgo) {
                document.getElementById("dateOfBirthError").innerText = "Ngày sinh không được thấp hơn 16 năm kể từ ngày đăng ký.";
                document.getElementById("dateOfBirthError").style.color = "red";
                return false;
            } else {
                document.getElementById("dateOfBirthError").innerText = "";
                return true;
            }
        }

        function validateEmail(email) {
            if (!email.endsWith("@fpt.edu.vn")) {
                document.getElementById("emailError").innerText = "Email phải kết thúc bằng @fpt.edu.vn.";
                document.getElementById("emailError").style.color = "red";
                return false;
            } else {
                document.getElementById("emailError").innerText = "";
                return true;
            }
        }

        function validatePhone(phone) {
            // Thực hiện kiểm tra số điện thoại nếu cần
            // ...
        }

        function validateAddress(address) {
            // Thực hiện kiểm tra địa chỉ nếu cần
            // ...
        }

        function validateDepartment(department) {
            // Thực hiện kiểm tra khoa/department nếu cần
            // ...
        }

        function validateForm() {
            var isValid = true;

            isValid = validateFullName(document.getElementById("fullName").value) && isValid;
            isValid = validateDateOfBirth(document.getElementById("dateOfBirth").value) && isValid;
            isValid = validateEmail(document.getElementById("email").value) && isValid;

            // Thực hiện kiểm tra các trường nhập dữ liệu khác nếu cần
            // ...

            return isValid;
        }
    </script>
</body>
</html>

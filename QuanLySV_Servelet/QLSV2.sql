-- Tạo cơ sở dữ liệu
CREATE DATABASE StudentManagement2;

-- Sử dụng cơ sở dữ liệu
USE StudentManagement2
CREATE TABLE Staff (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(50), 
    Date_of_Birth DATE,
    Gender NVARCHAR(10),
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
	Password NVARCHAR(20),
    Address NVARCHAR(255),
    Department NVARCHAR(100),
    Role INT
);
GO

-- Tạo bảng "Courses"
CREATE TABLE Courses (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Course_Name NVARCHAR(100),
    Course_Code NVARCHAR(20) UNIQUE
);
GO

-- Tạo bảng "Enrollments"
CREATE TABLE Enrollments (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Staff_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
     FOREIGN KEY (Staff_ID) REFERENCES Staff(ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(ID)
);
-- Tạo bảng "StudentClasses" để lưu trữ thông tin về học sinh và lớp học
CREATE TABLE StudentClasses (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_ID INT,
    Class_Name NVARCHAR(100), -- Tên của lớp học
    Class_Code NVARCHAR(20), -- Mã của lớp học (nếu cần)
    FOREIGN KEY (Student_ID) REFERENCES Staff(ID) ON DELETE CASCADE
);

-- Tạo bảng "StaffSemesters" để lưu trữ thông tin về kỳ học của nhân viên
CREATE TABLE StaffSemesters (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Staff_ID INT, -- Tham chiếu đến nhân viên
    Semester_Name NVARCHAR(100), -- Tên kỳ học
   FOREIGN KEY (Staff_ID) REFERENCES Staff(ID) ON DELETE CASCADE
);
CREATE TABLE StudentRequest(
		ID INT IDENTITY(1,1) PRIMARY KEY,
		Staff_ID INT,
		Request_Type INT,
		Reason VARCHAR(100),
		Submission_Date DAte,
		Status INT,
		FOREIGN KEY (Staff_ID) REFERENCES Staff(ID) ON DELETE CASCADE,
  );
-- Chèn dữ liệu cho admin (role 1)
INSERT INTO Staff (FullName, Date_of_Birth, Gender, Email, Phone, Address, Department, Role)
VALUES ('Admin', '1990-01-01', 'Male', 'admin@fpt.edu.vn', '1234567890', 'Admin Address', 'Admin Department', 1);

-- Chèn dữ liệu cho 3 giáo viên (role 2)
INSERT INTO Staff (FullName, Date_of_Birth, Gender, Email, Phone, Address, Department, Role)
VALUES
    ('Teacher1', '1985-03-15', 'Male', 'teacher1@fpt.edu.vn', '1234567891', 'Teacher1 Address', 'Software Engineering', 2),
    ('Teacher2', '1986-05-20', 'Femle', 'teacher2@fpt.edu.vn', '1234567892', 'Teacher2 Address', 'Marketing', 2),
    ('Teacher3', '1987-07-25', 'Male', 'teacher3@fpt.edu.vn', '1234567893', 'Teacher3 Address', 'MC', 2);

-- Chèn dữ liệu cho 6 học sinh (role 3)
INSERT INTO Staff (FullName, Date_of_Birth, Gender, Email, Phone, Address, Department, Role)
VALUES
    ('Student1', '1998-10-10', 'Male', 'trongvu@fpt.edu.vn', '1234567894', 'Student1 Address', 'Software Engineering', 3),
    ('Student2', '1999-11-11', 'Femle', 'student22@fpt.edu.vn', '1234567895', 'Student2 Address', 'Software Engineering', 3),
    ('Student3', '2000-12-12', 'Male', 'studen2t3@fpt.edu.vn', '1234567896', 'Student3 Address', 'Marketing', 3),
    ('Student4', '2001-01-01', 'Femle', 'studen2t4@fpt.edu.vn', '1234567897', 'Student4 Address', 'Marketing', 3),
    ('Student5', '2002-02-02', 'Male', 'student52@fpt.edu.vn', '1234567898', 'Student5 Address', 'Software Engineering', 3),
    ('Student6', '2003-03-03', 'Femle', 'student62@fpt.edu.vn', '1234567899', 'Student6 Address', 'MC', 3);


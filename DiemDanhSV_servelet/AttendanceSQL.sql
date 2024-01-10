
CREATE DATABASE AttendanceRP
GO
Use AttendanceRP
GO
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY  IDENTITY(1,1),
    TeacherName VARCHAR(50),
	Email VARCHAR(100),
	Password VARCHAR(100),
	Gender VARCHAR(10)
);
	
-- Tạo bảng cho thông tin sinh viên
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    StudentName VARCHAR(50),
	Email VARCHAR(100),
	Password VARCHAR(100),
	Gender VARCHAR(10),
	MobilePhone VARCHAR(20)
);

-- Tạo bảng cho danh sách điểm danh
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    TeacherID INT,
    StudentID INT,
    CourseName VARCHAR(50),
    ClassName VARCHAR(50),
    Slot INT,
    Date DATE,
    IsPresent INT NULL  -- Sử dụng kiểu dữ liệu BIT thay vì BOOLEAN
);
CREATE TABLE admin (
    admin_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);
INSERT INTO admin (username, password, email)
VALUES ('admin_username', 'admin_password', 'admin@gmail.com');

INSERT INTO Teachers (TeacherName, Email, Password, Gender)
VALUES
    ('Teacher1', 'teacher1@gmail.com', '1', 'Male'),
    ('Teacher2', 'teacher2@gmail.com', 'password2', 'Female');
-- Thêm dữ liệu vào bảng "Teachers"
INSERT INTO Students (StudentName, Email, Password, Gender, MobilePhone)
VALUES
    ('Student1', 'student1@email.com', 'password1', 'Male', '123-456-7890'),
    ('Student2', 'student2@email.com', 'password2', 'Female', '987-654-3210'),
    ('Student3', 'student3@email.com', 'password3', 'Male', '555-555-5555'),
    ('Student4', 'student4@email.com', 'password4', 'Female', '999-999-9999'),
    ('Student5', 'student5@email.com', 'password5', 'Male', '111-222-3333');


-- Phần 4: Lịch học cho giáo viên 1 (PDJ) ở Class A, Slot 1, trong vòng 6 ngày
-- Thêm 5 học sinh (StudentID từ 1 đến 5) và giữ nguyên 15 học sinh còn lại
-- Đặt cột IsPresent thành NULL cho tất cả bản ghi
INSERT INTO Attendance (TeacherID, StudentID, CourseName, ClassName, Slot, Date, IsPresent)
SELECT
    1,  -- TeacherID của giáo viên 1
    StudentID, 
    'JPD113', 
    'Class A', 
    1,  -- Slot 1
    DATEADD(DAY, Number, '2023-11-01'),  -- Ngày từ 2023-11-01 đến 2023-11-06
    1  -- Sử dụng 1 để đánh dấu học sinh có mặt
FROM (
    SELECT TOP 5 StudentID  -- Chỉ thêm 5 học sinh từ 1 đến 5
    FROM Students
    WHERE StudentID BETWEEN 1 AND 5
) AS StudentList, (
    SELECT TOP 6 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS Number
    FROM master.dbo.spt_values
) AS DayNumbers;

-- Phần 3: Lịch học cho giáo viên 1 (DBI) ở Class A, Slot 2, trong vòng 6 ngày
-- Thêm 5 học sinh (StudentID từ 1 đến 5) và giữ nguyên 15 học sinh còn lại
INSERT INTO Attendance (TeacherID, StudentID, CourseName, ClassName, Slot, Date, IsPresent)
SELECT
    1,  -- TeacherID của giáo viên 1
    StudentID, 
    'DBI', 
    'Class B', 
    2,  -- Slot 2
    DATEADD(DAY, Number, '2023-11-01'),  -- Ngày từ 2023-11-01 đến 2023-11-06
    1  -- Sử dụng 1 để đánh dấu học sinh có mặt
FROM (
    SELECT TOP 5 StudentID  -- Chỉ thêm 5 học sinh từ 1 đến 5
    FROM Students
    WHERE StudentID BETWEEN 1 AND 5
) AS StudentList, (
    SELECT TOP 6 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS Number
    FROM master.dbo.spt_values
) AS DayNumbers;


-- Phần 4: Lịch học cho giáo viên 1 (PDJ) ở Class A, Slot 1, trong vòng 6 ngày
-- Thêm 5 học sinh (StudentID từ 1 đến 5) và giữ nguyên 15 học sinh còn lại
-- Đặt cột IsPresent thành NULL cho tất cả bản ghi
INSERT INTO Attendance (TeacherID, StudentID, CourseName, ClassName, Slot, Date, IsPresent)
SELECT
    2,  -- TeacherID của giáo viên 1
    StudentID, 
    'PRJ', 
    'Class C', 
    3, 
    DATEADD(DAY, Number, '2023-11-01'),  -- Ngày từ 2023-11-01 đến 2023-11-06
    1  -- Sử dụng 1 để đánh dấu học sinh có mặt
FROM (
    SELECT TOP 5 StudentID  -- Chỉ thêm 5 học sinh từ 1 đến 5
    FROM Students
    WHERE StudentID BETWEEN 1 AND 5
) AS StudentList, (
    SELECT TOP 6 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS Number
    FROM master.dbo.spt_values
) AS DayNumbers;

-- Đặt cột IsPresent thành NULL cho tất cả bản ghi
INSERT INTO Attendance (TeacherID, StudentID, CourseName, ClassName, Slot, Date, IsPresent)
SELECT
    2,  -- TeacherID của giáo viên 1
    StudentID, 
    'MAD', 
    'Class D', 
    4,  -- Slot 1
    DATEADD(DAY, Number, '2023-11-01'),  -- Ngày từ 2023-11-01 đến 2023-11-06
    1  -- Sử dụng 1 để đánh dấu học sinh có mặt
FROM (
    SELECT TOP 5 StudentID  -- Chỉ thêm 5 học sinh từ 1 đến 5
    FROM Students
    WHERE StudentID BETWEEN 1 AND 5
) AS StudentList, (
    SELECT TOP 6 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS Number
    FROM master.dbo.spt_values
) AS DayNumbers;

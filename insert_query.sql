DROP DATABASE IF EXISTS school_ai_test;
CREATE DATABASE school_ai_test;
USE school_ai_test;

-- ======================
-- CLASSES
-- ======================
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(10),
    section VARCHAR(5),
    class_teacher_id INT
);

-- ======================
-- STUDENTS
-- ======================
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    admission_date DATE,
    class_id INT
);

-- ======================
-- TEACHERS
-- ======================
CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    subject_specialization VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2)
);

-- ======================
-- SUBJECTS
-- ======================
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(50)
);

-- ======================
-- TEACHER SUBJECT
-- ======================
CREATE TABLE teacher_subject (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    subject_id INT
);

-- ======================
-- STUDENT SUBJECT
-- ======================
CREATE TABLE student_subject (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT
);

-- ======================
-- EXAMS
-- ======================
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_name VARCHAR(50),
    exam_date DATE
);

-- ======================
-- MARKS
-- ======================
CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    exam_id INT,
    marks INT
);

-- ======================
-- ATTENDANCE
-- ======================
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    date DATE,
    status VARCHAR(10)
);

-- ======================
-- FEES
-- ======================
CREATE TABLE fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    status VARCHAR(20)
);

-- ======================
-- LIBRARY BOOKS
-- ======================
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    available_copies INT
);

-- ======================
-- BOOK BORROW
-- ======================
CREATE TABLE borrow (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE
);

-- ======================
-- INSERT CLASSES
-- ======================
INSERT INTO classes (class_name, section) VALUES
('10','A'),
('10','B'),
('9','A'),
('8','A');

-- ======================
-- INSERT TEACHERS
-- ======================
INSERT INTO teachers (first_name,last_name,subject_specialization,hire_date,salary) VALUES
('Rahul','Sharma','Math','2018-06-01',50000),
('Priya','Singh','Science','2019-07-01',52000),
('Amit','Verma','English','2020-01-15',48000),
('Neha','Gupta','History','2017-03-12',55000);

-- ======================
-- INSERT SUBJECTS
-- ======================
INSERT INTO subjects (subject_name) VALUES
('Math'),
('Science'),
('English'),
('History'),
('Computer');

-- ======================
-- INSERT STUDENTS
-- ======================
INSERT INTO students (first_name,last_name,gender,dob,admission_date,class_id) VALUES
('Ravi','Kumar','Male','2008-03-10','2021-04-01',1),
('Anjali','Singh','Female','2008-07-20','2021-04-01',1),
('Arjun','Yadav','Male','2007-11-02','2020-04-01',2),
('Sneha','Patel','Female','2009-01-15','2022-04-01',3),
('Karan','Mehta','Male','2009-05-22','2022-04-01',4);

-- ======================
-- INSERT EXAMS
-- ======================
INSERT INTO exams (exam_name,exam_date) VALUES
('Midterm','2024-09-15'),
('Final','2025-03-10');

-- ======================
-- INSERT MARKS
-- ======================
INSERT INTO marks (student_id,subject_id,exam_id,marks) VALUES
(1,1,1,85),
(1,2,1,78),
(2,1,1,92),
(2,2,1,88),
(3,1,1,67),
(3,2,1,74),
(4,1,1,90),
(5,1,1,60);

-- ======================
-- INSERT FEES
-- ======================
INSERT INTO fees (student_id,amount,payment_date,status) VALUES
(1,20000,'2024-04-10','Paid'),
(2,20000,'2024-04-11','Paid'),
(3,20000,NULL,'Pending'),
(4,20000,'2024-04-15','Paid'),
(5,20000,NULL,'Pending');

-- ======================
-- INSERT BOOKS
-- ======================
INSERT INTO books (title,author,category,available_copies) VALUES
('Mathematics Basics','R.K Sharma','Education',5),
('Science World','A.P Singh','Education',3),
('English Grammar','Wren & Martin','Education',4);

-- ======================
-- INSERT BORROW
-- ======================
INSERT INTO borrow (student_id,book_id,borrow_date,return_date) VALUES
(1,1,'2025-01-10',NULL),
(2,2,'2025-01-12','2025-01-20'),
(3,3,'2025-02-01',NULL);

-- ======================
-- SAMPLE ATTENDANCE
-- ======================
INSERT INTO attendance (student_id,date,status) VALUES
(1,'2025-03-01','Present'),
(2,'2025-03-01','Present'),
(3,'2025-03-01','Absent'),
(4,'2025-03-01','Present'),
(5,'2025-03-01','Absent');
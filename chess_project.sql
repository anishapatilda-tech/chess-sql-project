create database V134;
USE V134;
CREATE TABLE STUDENTS (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(30),
    state VARCHAR(30),
    marks INT,
    grade CHAR(1),
    admission_year INT
);

INSERT INTO STUDENTS VALUES
(1, 'Rahul Sharma', 20, 'Mumbai', 'Maharashtra', 85, 'A', 2022),
(2, 'Priya Patel', 19, 'Ahmedabad', 'Gujarat', 92, 'A', 2023),
(3, 'Amit Kumar', 21, 'Delhi', 'Delhi', 78, 'B', 2021),
(4, 'Sneha Singh', 20, 'Pune', 'Maharashtra', 88, 'A', 2022),
(5, 'Vikash Yadav', 22, 'Patna', 'Bihar', 65, 'C', 2020),
(6, 'Anjali Gupta', 19, 'Jaipur', 'Rajasthan', 91, 'A', 2023),
(7, 'Rohit Verma', 20, 'Lucknow', 'Uttar Pradesh', 76, 'B', 2022),
(8, 'Kavya Nair', 18, 'Kochi', 'Kerala', 94, 'A', 2024),
(9, 'Arjun Reddy', 21, 'Hyderabad', 'Telangana', 82, 'A', 2021),
(10, 'Meera Joshi', 19, 'Mumbai', 'Maharashtra', 79, 'B', 2023);

CREATE TABLE COURSES (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department VARCHAR(30),
    credits INT,
    fee INT
);

INSERT INTO COURSES VALUES
(101, 'Computer Science', 'Engineering', 4, 150000),
(102, 'Electronics', 'Engineering', 4, 140000),
(103, 'Mechanical', 'Engineering', 4, 135000),
(104, 'Commerce', 'Commerce', 3, 45000),
(105, 'Arts', 'Arts', 3, 35000),
(106, 'Medicine', 'Medical', 5, 500000),
(107, 'Law', 'Law', 3, 75000);

CREATE TABLE ENROLLMENTS (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    semester INT,
    FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id),
    FOREIGN KEY (course_id) REFERENCES COURSES(course_id)
);

INSERT INTO ENROLLMENTS VALUES
(1, 1, 101, '2022-07-15', 1),
(2, 2, 101, '2023-07-15', 1),
(3, 3, 102, '2021-07-15', 3),
(4, 4, 103, '2022-07-15', 1),
(5, 5, 104, '2020-07-15', 5),
(6, 6, 105, '2023-07-15', 1),
(7, 7, 106, '2022-07-15', 1),
(8, 8, 101, '2024-07-15', 1),
(9, 9, 102, '2021-07-15', 3),
(10, 10, 104, '2023-07-15', 1);

select * from students s inner join enrollments e on s.student_id=e.student_id;
select s.name ,s.marks,s.grade,e.enrollment_date,e.semester from students s inner join enrollments e on s.student_id=e.student_id;
select s.name ,s.marks,s.grade,e.enrollment_date,e.semester from students s inner join enrollments e  using(student_id);
select * from enrollments e inner join students s on e.student_id=s.student_id inner join courses c on e.course_id=c.course_id; 
select * from enrollments e inner join students s using (student_id) inner join courses c using (course_id); 

select * from enrollments e right join students s using (student_id) right join courses c using (course_id); 
select s.name,c.name,c.fee,e.enrollment_date from enrollments e inner join students s using (student_id) inner join courses c using (course_id); 


select * from enrollments e left join students s on e.student_id=s.student_id left join courses c on e.course_id=c.course_id; 

select s.name ,s.marks,s.grade,s.admission_year,c.course_name,e.enrollment_date  from enrollments e inner join students s on s.student_id=e.student_id inner join courses c on c.course_id=e.course_id;

select s.name ,s.marks,s.grade,s.admission_year,c.course_name,c.fee,e.enrollment_date  from enrollments e inner join students s on s.student_id=e.student_id inner join courses c on c.course_id=e.course_id where c.department="Engineering";

select s.name ,s.marks,s.grade,s.admission_year,c.course_name,c.fee,e.enrollment_date  from enrollments e inner join students s on s.student_id=e.student_id inner join courses c on c.course_id=e.course_id where s.state="Maharashtra";

select s.name ,c.department,e.enrollment_date  from enrollments e inner join students s on s.student_id=e.student_id inner join courses c on c.course_id=e.course_id where s.admission_year="2023";

select s.name ,s.admission_year,c.course_name  from enrollments e inner join students s on s.student_id=e.student_id inner join courses c on c.course_id=e.course_id
union
select s.name ,s.admission_year,c.course_name  from enrollments e inner join students s on s.student_id=e.student_id inner join courses c on c.course_id=e.course_id;
































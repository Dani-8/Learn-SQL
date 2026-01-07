-- Day 5

/*
Today we are going to learn about SQL JOINs.
SQL JOINs are used to extract data from different tables
using one common column between them.

Example:
We can join a Students table and a Courses table
using a common column like student_id.
*/

/*
There are mainly four types of SQL JOINs:
INNER JOIN, LEFT JOIN, RIGHT JOIN, & UNION.
*/

-- ====================================================


-- ====================================================

show databases;     -- List all databases to see what exists

create database student_db;   -- Create a new database for student tables

use student_db;               -- Switch to the new database
-- -------------------------------------------------------------------------------


/*
Create the 'students' table in student_db.
This table will store basic info about each student.
*/
create table students (
  student_id int, name varchar(50), grade varchar(10), age int
);

-- Add sample data to the 'students' table
insert into students values
(1, 'Jason', '10', 15),
(2, 'Emily', '10', 15),
(3, 'Michael', '11', 16),
(4, 'Sarah', '11', 16),
(5, 'Daniel', '12', 17),
(6, 'Olivia', '12', 17),
(7, 'David', '10', 14),
(8, 'Sophia', '10', 14),
(9, 'James', '11', 16),
(10, 'Emma', '11', 16),
(11, 'Noah', '12', 17),
(12, 'Ava', '12', 17),
(13, 'Lucas', '10', 15),
(14, 'Mia', '10', 15),
(15, 'Ethan', '11', 16),
(16, 'Isabella', '11', 16),
(17, 'Logan', '12', 17),
(18, 'Charlotte', '12', 17),
(19, 'Benjamin', '10', 14),
(20, 'Amelia', '10', 14);



/*
Create the 'student_activities' table in student_db.
This table will track different activities for each student.
*/
create table student_activities (
  activity_id int, student_id int, 
  activity_type varchar(20), activity_name varchar(50), 
  year_term varchar(10)
);

-- Add sample data to the 'student_activities' table
insert into student_activities values
(1, 1, 'club', 'Science Club', '2024'),
(2, 1, 'course', 'Math Olympiad', '2024'),
(3, 2, 'club', 'Drama Club', '2024'),
(4, 3, 'exam', 'Midterm', '2024'),
(5, 4, 'course', 'Physics Lab', '2024'),
(6, 5, 'club', 'Robotics', '2024'),
(7, 5, 'exam', 'Final', '2024'),
(8, 7, 'club', 'Basketball', '2024'),
(9, 8, 'club', 'Music', '2024'),
(10, 10, 'exam', 'Midterm', '2024'),
(11, 12, 'course', 'Chemistry Lab', '2024'),
(12, 13, 'club', 'Art Club', '2024'),
(13, 15, 'exam', 'Final', '2024'),
(14, 17, 'club', 'Debate', '2024'),
(15, 18, 'course', 'Biology Lab', '2024'),
(16, 21, 'club', 'Chess Club', '2024'),
(17, 22, 'exam', 'Midterm', '2024'),
(18, 1, 'club', 'Astronomy', '2024'),
(19, 3, 'course', 'Advanced Math', '2024'),
(20, 9, 'club', 'Football', '2024');




show tables;

select * from students;
select * from student_activities;

/*
INNER JOIN:
Returns only the rows that have matching values
in both tables.
*/

-- Find all students and their activities, but only if they have an activity.
select s.student_id, s.name, a.activity_name, a.activity_type 
from students as s inner join student_activities as a
on s.student_id = a.student_id 
order by student_id asc;


-- Find all students, and show their activities if they have any.
select s.student_id, s.name, a.activity_name, a.activity_type
from students s
left join student_activities a
on s.student_id = a.student_id;


-- Find all activities, and show the student who did them if they exist.
select s.student_id, s.name, a.activity_name, a.activity_type
from students s
right join student_activities a
on s.student_id = a.student_id;



-- Show all students and all activities, matching if possible.
SELECT s.student_id, s.name, a.activity_name, a.activity_type
FROM students s
LEFT JOIN student_activities a
ON s.student_id = a.student_id

UNION

SELECT s.student_id, s.name, a.activity_name, a.activity_type
FROM students s
RIGHT JOIN student_activities a
ON s.student_id = a.student_id;





















/*
Now we are going to import the ClassicModels database in MySQL Workbench.

Steps:
1. Download classicmodels.sql as a ZIP from this link:
   https://gist.github.com/dronavallisaikrishna/aa569525a7dbce32cc2465beb2138a7d?utm_source=chatgpt.com
   → Save to Downloads and extract the SQL file
2. Open MySQL Workbench and connect
3. (Optional) Create a clean database:
   CREATE DATABASE classicmodels;
   USE classicmodels;
4. File → Open SQL Script → Select classicmodels.sql → ⚡ Execute
5. Refresh Schemas → classicmodels with tables appears

That’s it 👍
*/













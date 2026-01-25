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

show databases;               -- List all databases to see what exists

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

-- ==================================================================== 

-- ==================================================================== 

/*
INNER JOIN:
Returns only records that exist in BOTH tables.
*/


-- Why this query: to show students who have at least one activity.
-- Why INNER JOIN: students without activities are excluded.
select s.student_id, s.name, a.activity_name
from students s 
inner join student_activities a
on s.student_id = a.student_id;
-- ----------------------------------------------------------------------------

/*
LEFT JOIN:
Returns ALL students, even if they have no activities.
*/


-- Why this query: to identify students who are not involved in any activity.
-- Why LEFT JOIN: students are the main table, so we include all of them.
select s.student_id, s.name, a.activity_name
from students s
left join
student_activities a
on s.student_id = a.student_id
where a.activity_name is null;

-- Why this query: to count how many students are not involved in any activity.
-- Why LEFT JOIN: students are the main table, so we include all of them.
select count(*) as no_activity_name
from students s
left join
student_activities a
on s.student_id = a.student_id
where a.activity_name is null;
-- ----------------------------------------------------------------------------

/*
RIGHT JOIN:
Returns ALL activities, even if the student does not exist.
*/


-- Why this query: to find activities that are not linked to any student.
-- Why RIGHT JOIN: activities are the main table, so we include all of them.
select s.student_id, s.name, a.activity_name
from students s
right join student_activities a
on s.student_id = a.student_id
where s.name is null;

-- Why this query: to list all activities with the number of students in each
-- RIGHT JOIN ensures all activities are included, even if no students
select a.activity_name, count(a.activity_name) as activity_count, count(s.student_id) as student_count 
from students s
right join student_activities a
on s.student_id = a.student_id
group by activity_name
order by student_count desc;
-- ------------------------------------------------------------------------

/*
FULL OUTER JOIN (using UNION):
Returns ALL students and ALL activities, matched if possible.
*/

-- Why this query: to see everything from both tables in one result.
-- Why UNION of LEFT and RIGHT JOIN: MySQL Workbench does not support FULL JOIN directly.
select s.name, a.activity_name
from students s
left join student_activities a
on s.student_id = a.student_id

union

select s.name, a.activity_name
from students s
right join student_activities a
on s.student_id = a.student_id;


-- Why this query: to find all "unlinked" records in both tables
-- UNION combines students with no activities and activities with no students
select s.student_id, s.name, 'No Activity' as info
from students s
left join student_activities a
on s.student_id = a.student_id
where a.activity_id is null

union

select a.activity_id, a.activity_name, 'No Student' as info
from students s
right join student_activities a
on s.student_id = a.student_id
where s.student_id is null;
-- ------------------------------------------------------------------------

select * from students;
select * from student_activities;

-- ------------------------------------------------------------------------

-- MORE EXAMPLES FOR PRACTICE!!!


-- INNER JOIN + CLOSURE:


-- Why this query: find students who participate a lot
-- Why INNER JOIN: only students with activities included
select s.student_id, s.name, count(a.activity_id) as total_activities
from students s
inner join student_activities a 
on s.student_id = a.student_id
group by s.student_id, s.name
having count(a.activity_name) > 1;

-- LEFT JOIN + HAVING:


-- Why this query: find students not involved in any activity
-- Why LEFT JOIN: keep all students
select s.student_id, s.name, count(a.activity_id) as total_activities
from students s
left join student_activities a
on s.student_id = a.student_id
group by s.student_id, s.name
having count(a.activity_id) = 0;

-- RIGHT JOIN + HAVING:


-- Why this query: find orphan activities
-- Why RIGHT JOIN: keep all activities
select a.activity_id, a.activity_name, count(s.student_id) as total_student
from students s
right join student_activities a
on s.student_id = a.student_id
group by a.activity_id, a.activity_name
having count(s.student_id) = 0;

-- UNION + HAVING:


-- Why this query: see all students and all activities in one result
-- Why UNION: combine students w/ activities and activities w/o students
select s.name, a.activity_name
from students s
left join student_activities a
on s.student_id = a.student_id
group by s.name, a.activity_name

union

select s.name, a.activity_name
from students s
right join student_activities a
on s.student_id = a.student_id
group by s.name, a.activity_name;





-- 🎉 End of Day 5:
-- You learned how to join tables using INNER, LEFT, RIGHT, and UNION.
-- You also used JOINs with GROUP BY and HAVING to analyze data.
-- This is a major step toward writing real-world SQL queries.
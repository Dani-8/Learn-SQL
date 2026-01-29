-- Day 6

/*
Today we are going to learn about SQL SUBQUERIES.
Subqueries are queries nested inside another query, used to perform operations in multiple steps.

Example:
We can find employees whose salary is above the company average
by first calculating the average using a subquery.
*/

/*
Subqueries can be used with:
SELECT, INSERT, UPDATE, DELETE
and often with aggregate functions like AVG, MAX, MIN.
*/

-- ===========================================================================
-- ===========================================================================
-- ===========================================================================


show databases;   				-- List all databases to see available ones

use new_sql;      				-- Switch to the database where we'll work

show tables;      				-- Check if any tables exist in the database

/*
Create the 'employees_subqueries' table.
This table will store employee information for practicing subqueries.
*/
create table employees_subqueries (
	Emp_id int primary key,
    Name varchar(50),
    Age int,
    Gender char(1),
    DOJ date,
    City varchar(25),
    Salary int
);

-- Insert sample employee data into the table
insert into employees_subqueries values
(1, 'Alice', 25, 'F', '2020-01-15', 'New York', 50000),
(2, 'Bob', 30, 'M', '2019-03-22', 'Chicago', 60000),
(3, 'Charlie', 28, 'M', '2021-07-10', 'Boston', 55000),
(4, 'Diana', 35, 'F', '2018-11-05', 'Los Angeles', 75000),
(5, 'Edward', 40, 'M', '2016-06-18', 'Seattle', 90000),
(6, 'Fiona', 27, 'F', '2022-02-01', 'Chicago', 52000),
(7, 'George', 32, 'M', '2017-09-14', 'Boston', 68000),
(8, 'Hannah', 29, 'F', '2020-12-20', 'Seattle', 61000),
(9, 'Ian', 26, 'M', '2021-03-11', 'New York', 58000),
(10, 'Julia', 31, 'F', '2019-08-09', 'Los Angeles', 70000),
(11, 'Kevin', 33, 'M', '2018-05-30', 'Chicago', 64000),
(12, 'Laura', 24, 'F', '2022-01-12', 'Boston', 54000),
(13, 'Michael', 36, 'M', '2016-10-25', 'Seattle', 88000),
(14, 'Nina', 28, 'F', '2020-04-19', 'New York', 59000),
(15, 'Oscar', 27, 'M', '2021-06-22', 'Los Angeles', 62000),
(16, 'Paula', 29, 'F', '2019-09-15', 'Chicago', 63000),
(17, 'Quentin', 34, 'M', '2017-11-03', 'Boston', 71000),
(18, 'Rachel', 25, 'F', '2022-03-28', 'Seattle', 56000),
(19, 'Steven', 38, 'M', '2015-07-17', 'New York', 95000),
(20, 'Tina', 26, 'F', '2021-12-05', 'Los Angeles', 57000),
(21, 'Victor', 31, 'M', '2018-08-21', 'Chicago', 67000),
(22, 'Wendy', 30, 'F', '2019-05-10', 'Boston', 60000),
(23, 'Xavier', 29, 'M', '2020-02-14', 'Seattle', 61000),
(24, 'Yvonne', 32, 'F', '2017-03-30', 'New York', 72000),
(19, 'Daniel', 21, 'M', '2021-07-08', 'Chicago', 95000),
(25, 'Zach', 35, 'M', '2016-06-12', 'Los Angeles', 80000);


-- Check the inserted employee records
select * from employees_subqueries;

-- -------------------------------------------------------- 
-- ------------------- SUBQUERY PRACTICE -----------------
-- -------------------------------------------------------- 

/*
1. Question:
Get all employees whose salary is above the average salary.
Subquery (inner query) calculates the average salary, outer query selects employees above it.
*/
select * from employees_subqueries
where salary > (
	select avg(salary) from employees_subqueries
);



/*
2. Question:
Find employees who joined after the youngest employee in the company.
Subquery (inner query) finds the earliest date of joining, outer query compares DOJ.
*/
select * from employees_subqueries
where doj > (
	select min(doj) from employees_subqueries
);



/*
3. Question:
Get employees whose salary is higher than the salary of 'Bob'.
First, check Bob's salary, then select employees earning more than him.
*/
select * from employees_subqueries
where name = "Bob";								 -- Verify Bob's salary

select * from employees_subqueries
where salary > (
	select salary
    from employees_subqueries
    where name = "Bob"
);



/*
4. Question:
Find the employee(s) who has the maximum salary.
Subquery finds the max salary, outer query selects the matching employee(s).
*/
select * from employees_subqueries
where salary = (
	select max(salary) from employees_subqueries
);



/*
5. Question:
Find employees who work in a city where the average salary is more than 60,000.
Subquery calculates average salary per city; outer query selects employees in those cities.
*/
select city from employees_subqueries
group by city
having avg(salary) > 60000;

select * from employees_subqueries
where city in (
    select city from employees_subqueries
    group by city
    having avg(salary) > 60000
);



/*
6. Question:
Get employees whose salary is higher than everyone in Boston.
Subquery finds the max salary in Boston; outer query selects employees earning more than that.
*/
select max(salary) from employees_subqueries
where city = "Boston";
    
select * from employees_subqueries
where salary > (
	select max(salary) from employees_subqueries
    where city = "Boston"
);

-- =======================================================================

-- ------------ ADVANCED SUBQUERIES (INSERT/UPDATE/DELETE) ---------------

-- =======================================================================

/*
1. Question:
Insert all employees whose salary is above the overall average into a new table.
Use CREATE TABLE LIKE to copy structure, then INSERT with subquery.
*/

-- CREATE TABLE
create table high_salary_emp like employees_subqueries;

-- INSERT VALUES
insert into high_salary_emp
select * from employees_subqueries
where salary > (
	select avg(salary) from employees_subqueries
);

-- CHECK THE NEW TABLE
select * from high_salary_emp;



/*
2. Update employees' salary by 10% if below company average.
Subquery calculates average, outer query increases salary for eligible employees.

Safe update mode is disabled temporarily to allow the operation.
*/

select * from employees_subqueries;                       -- CHECK CURRENT SALARY

SET SQL_SAFE_UPDATES = 0;                                 -- Disable safe updates temporarily (MySQL Workbench is overprotective) 

update employees_subqueries set salary = salary * 1.1
where salary < (
	select avg_salary from (
		select avg(salary) as avg_salary
        from employees_subqueries
    ) t
);

SET SQL_SAFE_UPDATES = 1;                                 -- Re-enable safe updates


select * from employees_subqueries;                       -- VERIFY UPDATED SALARIES


/*
3. Question:
Delete employees whose salary is below the minimum salary is another table.
Use subquery to find the average, outer query deletes employees earning less.

Safe update mode is disabled temporarily to allow deletion.
*/

select avg(salary) from employees_subqueries;             -- FIRST CHECK THE AVERAGE SALARY

select * from employees_subqueries
where salary < (
	select avg(salary) from employees_subqueries          -- PREVIEW EMPLOYEES TO BE DELETE
);


SET SQL_SAFE_UPDATES = 0;                                 -- DISABLE SAFE UPDATES

delete from employees_subqueries
where salary < (
	select avg_salary from ( 							  -- NOW RUN THIS QUREY TO DELETE THEM.
		select avg(salary) as avg_salary from employees_subqueries
	) t
);

SET SQL_SAFE_UPDATES = 1;                                 -- RE-ENABLE SAFE UPDATES


select * from employees_subqueries;                       -- VERIFY THE REMAINING EMPLOYEES








-- 🎉 End of Day 6:
-- You practiced using subqueries for SELECT, INSERT, UPDATE, and DELETE.
-- You learned how to use subqueries with aggregate functions and in conditional operations.
-- This is a major step toward writing more dynamic and powerful SQL queries.
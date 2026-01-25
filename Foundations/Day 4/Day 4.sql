/*
	Today in Day 4: 
    We are gonna learn about 2 SQL statements of clauses, which are
    GROUP BY & HAVING
*/


-- 1- GROUP BY:
/* GROUP BY groups rows with the same values in specified columns, 
usually used with aggregate functions (COUNT, SUM, AVG) to summarize data. */

-- Syntax:
-- Groups rows by department and calculates total salary per department
/*
select department_id, sum(salary)
from employees
group by department_id;
*/


-- Let's code now...

show databases;
use new_sql;
show tables;

-- Now first create a new table...
create table employess (
    emp_id int primary key,
    emp_name varchar(30),
    age int,
    gender char(1),
    doj date,
    dept varchar(20),
    city varchar(15),
    salary float
);


show tables;             -- Check if the table is created
describe employess;      -- Describe the table


-- Now insert the data into the new table...
insert into employess (emp_id, emp_name, age, gender, doj, dept, city, salary) values
(101, 'John', 28, 'M', '2021-03-15', 'IT', 'New York', 55000),
(102, 'Emma', 26, 'F', '2022-01-10', 'HR', 'London', 42000),
(103, 'Michael', 32, 'M', '2019-07-21', 'Finance', 'New York', 68000),
(104, 'Sophia', 29, 'F', '2020-11-05', 'IT', 'Berlin', 60000),
(105, 'David', 35, 'M', '2018-06-18', 'Sales', 'London', 48000),
(106, 'Olivia', 27, 'F', '2021-09-12', 'HR', 'Berlin', 45000),
(107, 'Daniel', 31, 'M', '2019-04-09', 'IT', 'New York', 72000),
(108, 'Isabella', 24, 'F', '2023-02-01', 'Marketing', 'Paris', 40000),
(109, 'James', 38, 'M', '2017-08-25', 'Finance', 'London', 75000),
(110, 'Mia', 30, 'F', '2020-10-14', 'IT', 'Berlin', 65000),
(111, 'Lucas', 34, 'M', '2018-12-03', 'Sales', 'Paris', 52000),
(112, 'Charlotte', 25, 'F', '2022-06-20', 'Marketing', 'New York', 43000),
(113, 'Benjamin', 41, 'M', '2016-05-30', 'Finance', 'Berlin', 82000),
(114, 'Amelia', 28, 'F', '2021-01-19', 'HR', 'Paris', 46000),
(115, 'Ethan', 36, 'M', '2019-09-11', 'IT', 'London', 70000),
(116, 'Harper', 33, 'F', '2018-03-27', 'Sales', 'New York', 51000),
(117, 'Noah', 29, 'M', '2020-07-08', 'Marketing', 'Berlin', 48000),
(118, 'Ella', 31, 'F', '2019-02-16', 'Finance', 'Paris', 67000),
(119, 'William', 26, 'M', '2022-08-22', 'IT', 'London', 58000),
(120, 'Ava', 35, 'F', '2017-11-04', 'HR', 'New York', 54000);


describe employess;
select * from employess;

-- Let's say if I wanna get distinct cities from the table..
select distinct city from employess;

-- Total departments from the table..
select distinct dept from employess;

-- Let's find the average age of the employees in the table
select avg(age) from employess;


-- Now find the average age from each department
-- Now we use GROUP BY clause
select dept, round(avg(age), 1) as average_age from employess
group by dept;


-- Now let's find the total salary of each department...
select dept, sum(salary) as total_salary from employess
group by dept;


-- Now let's find the total number of employees in each city
select city, count(emp_id) as total_emp from employess
group by city
order by total_emp desc;


-- Now let's find the total number of employees who joined in each year
select year(doj) as year, count(emp_id) as total_emps_join from employess
group by year 
order by total_emps_join desc;



-- =========================================================================
-- =========================================================================
-- =========================================================================



/*
So far, we have used a single table with GROUP BY.
Now it's time to level up:
We will use 2 tables and explore JOIN functions between them.
*/

-- Now create a new table:
create table sales (
    product_id int,
    sell_price float,
    quantity int,
    state varchar(20)
);

-- Insert some data:
insert into sales (product_id, sell_price, quantity, state) values
(121, 500, 10, 'New York'),
(123, 300, 5, 'New York'),
(121, 500, 8, 'London'),
(123, 300, 12, 'London'),
(121, 500, 15, 'Berlin'),
(123, 300, 7, 'Berlin'),
(121, 500, 6, 'Paris'),
(123, 300, 9, 'Paris'),
(121, 500, 11, 'New York'),
(123, 300, 14, 'London');

-- Check the data in the table:
select * from sales;


/*
Let's calculate the revenue of the products we have.
Revenue is: sell_price * total quantity sold
*/
select product_id, sum(sell_price * quantity) as revenue from sales
group by product_id;


-- Create product_cost table to store cost price of products
create table product_cost (
    product_id int,
    cost_price float
);

-- Insert sample data for the 2 products
insert into product_cost (product_id, cost_price) values
(121, 350),
(123, 200);

-- Check the data in the table:
select * from product_cost;




/*
Now let's level up and use 2 tables: sales and product_cost.

We want to find out the profit for each product.
Profit is calculated as:
((sell_price - cost_price) * quantity) for each sale.
This shows how JOIN can combine information from multiple tables.
*/


select c.product_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit
from sales as s inner join product_cost as c
where s.product_id = c.product_id
group by c.product_id;


/*
In this query, we use table aliases to make the SQL shorter and easier to read:
- 's' is an alias for the sales table
- 'c' is an alias for the product_cost table

Instead of writing sales.product_id or product_cost.cost_price every time,
we can just write s.product_id or c.cost_price.
This makes queries cleaner, especially when joining multiple tables.
*/




-- ======================================================================
-- ======================================================================
-- ======================================================================
-- ======================================================================
-- ======================================================================


-- 2- HAVING:
/* HAVING is used to filter groups created by GROUP BY,
similar to WHERE but for aggregated data. */

-- Syntax:
-- Groups rows by department, calculates total salary per department,
-- and filters to show only departments with total salary > 100000
/*
SELECT department_id, SUM(salary) AS Total_Salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;
*/


select * from employess;


/*
Let's find the average salary of each department.
We will use GROUP BY to calculate the average per department,
and HAVING to show only those departments where the average salary is greater than 50000.
*/
select dept, round(avg(salary), 1) as average_salary from employess
group by dept
having average_salary > 50000;


/*
This query calculates the total salary for each city using GROUP BY.
We use HAVING to filter groups where the total salary is less than 250000.
*/
select city, sum(salary) as total_salary from employess
group by city
having total_salary < 250000;


/*
Find total employees per department and show only departments with more than 3 employees.
*/
select dept, count(emp_id) as total_emp from employess
group by dept
having total_emp > 3;


/*
Count employees per city, excluding Berlin,
and show only cities with more than 3 employees.
*/
select city, count(emp_id) as emp_count from employess
where city != "Berlin"
group by city
having emp_count > 3;


/*
Find departments where the average salary is greater than 50000.
Shows total employees and average salary per department.
*/
select dept, count(emp_id) as emp_count, avg(salary) as average_salary
from employess
group by dept
having avg(salary) > 50000;






-- 🎉 End of Day 4:
-- You learned how to group data using GROUP BY,
-- filter grouped results using HAVING,
-- and combine multiple tables using JOINs.
-- This is a huge step toward writing real-world SQL queries.

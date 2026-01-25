-- Show all databases available in the MySQL server
-- This helps to see which databases already exist
show databases;

-- Select the 'world' database so we can run queries on its tables
use world;

-- Show all tables present inside the selected database
show tables;

-- Select and display all rows and columns from the city table
-- Using * means "all columns"
select * from city;

-- Describe the structure of the city table
-- This shows column names, data types, and other details
describe city;

-- Create a new database for SQL practice
-- This database will be used for learning and testing queries
create database new_sql;

-- Show databases again to confirm the new database is created
show databases;

-- Select the newly created database to start working in it
use new_sql;




-- Create a table named emp_details to store employee information
-- Each column represents a specific detail about an employee
create table emp_details (
    name varchar(25),   -- Stores employee name (text up to 25 characters)
    age int,            -- Stores employee age (number)
    sex char(1),        -- Stores gender as a single character (M/F)
    doj date,           -- Stores Date of Joining
    city varchar(15),   -- Stores city name
    salary float        -- Stores employee salary
);

-- Describe the emp_details table
-- This helps to verify columns, data types, and structure
describe emp_details;




-- Insert initial employee records into emp_details table
-- This adds sample data so we can practice queries on it
insert into emp_details (name, age, sex, doj, city, salary)
values
('Alice', 30, 'F', '2021-05-01', 'New York', 50000.00),
('Bob', 25, 'M', '2020-08-15', 'Los Angeles', 45000.00),
('Charlie', 35, 'M', '2019-01-20', 'Chicago', 55000.00);

-- Display all records to confirm data was inserted successfully
select * from emp_details;


-- Add more employees in the table emp_details
-- This shows how multiple insert operations can be done
insert into emp_details (name, age, sex, doj, city, salary)
values
('David', 40, 'M', '2018-06-10', 'Miami', 60000.00),
('Eva', 28, 'F', '2022-01-15', 'San Francisco', 48000.00);

-- Display all records again after inserting more data
select * from emp_details;





-- 🎉 Congrats! You’ve completed Day 1.
-- Today you learned the basics: creating databases, tables, inserting data, 
-- and running your first queries like SELECT * and DESCRIBE.
-- Tomorrow, we’ll explore filtering, counting, and aggregating data.

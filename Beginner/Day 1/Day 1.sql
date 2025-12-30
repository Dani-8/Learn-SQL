show databases;
use world;
show tables;

select * from city;
describe city;

create database new_sql;
show databases;

CREATE TABLE emp_details (
    name VARCHAR(25),
    age INT,
    sex CHAR(1),
    doj DATE,
    city VARCHAR(15),
    salary float
);

describe emp_details;

INSERT INTO emp_details (name, age, sex, doj, city, salary)
VALUES
('Alice', 30, 'F', '2021-05-01', 'New York', 50000.00),
('Bob', 25, 'M', '2020-08-15', 'Los Angeles', 45000.00),
('Charlie', 35, 'M', '2019-01-20', 'Chicago', 55000.00);

select * from emp_details;


-- add more emps in the table emp_details...

INSERT INTO emp_details (name, age, sex, doj, city, salary)
VALUES
('David', 40, 'M', '2018-06-10', 'Miami', 60000.00),
('Eva', 28, 'F', '2022-01-15', 'San Francisco', 48000.00);


select * from emp_details;

select distinct city from emp_details;



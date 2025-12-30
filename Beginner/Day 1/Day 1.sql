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

-- If you wanna count how many emps are in the table you can use count() function.... 
select count(name) from emp_details;
-- OUTPUT: count(name) as column name and value 5 (total emps)

/* now count(name) is readable so you can give a name to column as you want 
by using alias (SQL provides)*/

select count(name) as total_emps from emp_details;
-- OUTPUT: total_emps as column name and value 5 (total emps)



/* Now suppose if you want to get the total SUM of salary,
You can use function SUM() */

select SUM(salary) as total_salaries_of_emps from emp_details;
-- OUTPUT: total_salaries_of_emps as column name and value 258000 (Sum of Salaries)

/* Now if you want Average Salary you can use AVG() instead of SUM() */

select AVG(salary) as average_salary_of_emp from emp_details;
-- OUTPUT: average_salary_of_emp as column name and value 51600 (Average Salary)

/* Now if you want to select specific columns from table by using the column name */

select name, age, salary from emp_details;
-- OUTPUT: name, age, salary columns in result

/* Now if you want filter your table based on specific condition 
You can use WHERE close */

select * from emp_details where age > 30;
-- OUTPUT: It will give me output where the emp age is greater than 30


/* Now if you want to filter ony Female emps 
You can also use WHERE close */

select name, age, sex, salary from emp_details where sex = "F";
-- OUTPUT: It will show me in the table data of female emp 


/* Now if you want to find the details of the emps with multiple conditions 
and all conditions should be true in this case, you can use AND operator */ 

select * from emp_details where age >= 30 and sex = "M";
-- OUTPUT: All the emps data whos age is greater than 30 and sex is Male


/* Now if you want to find the details of the emps who belong to New York or Chicago
in this case, You can use OR operator */

select * from emp_details where city = "New York" or city =  "Chicago";
-- OUTPUT: You can see all the emps who belong to "New York" or "Chicago" 


/* Now there is another to write this smae query by using IN operator */

select * from emp_details where city in ("New York", "Miami"); -- You will get same output
-- OUTPUT: You can see all the emps who belong to "New York" or "Miami" 


select * from emp_details; -- You can run this to check the table data again for next query...


/* Now you will use BETWEEN operator that select the values wiht in the given range,
the values can be Numbers, Text, Dates */

/* Now suppose if you want to find the emps whos DOJ(Date of Join) was between 
"2015/1/1" & "2020/12/31" */

select * from emp_details where doj between "2015/1/1" and "2020/12/31";


/* Now if you want to find the total salary of employees of each sex,
you can use GROUP BY along with SUM() function */

select sex, sum(salary) as total_salary from emp_details group by sex;
-- OUTPUT: Shows total salary of employees for each sex

/*Now same thing but also count emps of each sex */
select sex, sum(salary) as total_salary, count(sex) as total_emp from emp_details group by sex;
-- OUTPUT: Shows total salary & total count of employees for each sex



/* Now if you want to sort the result to accending or descending order in this case,
You can use ORDER BY clause with the keywords 
ASC for ascending order(this order is default by SQL) & DESC for descending order. */

select * from emp_details order by salary;
-- OUTPUT: Shows all the records in accending order of thier salary(which is default) 

select * from emp_details order by salary desc;
-- OUTPUT: Shows all the records in descending order of thier salary 



/* Now let's see the basic operation by using the SELECT statement */

-- For Addition

select (10 + 20) as addition;
-- OUTPUT: 30

-- For Subtraction

select (50 - 20) as subtraction;
-- OUTPUT: 30


/* For repeating a character multiple times, repeat() takes 2 values inside () 
1- a character that need to repeat, 2- a number how many times it should repeat */

select repeat("@", 10);
-- OUTPUT: @@@@@@@@@@



-- If you want to convert text/string into uppercase or lowercase

-- For UPPERCASE
select upper("learning") as uppercase;
-- OUTPUT: LEARNING

-- For lowercase
select lower("LEARNING") as lowercase;
-- OUTPUT: learning

-- For lowercase using lcase
select lcase("LEARNING") as lowercase;
-- OUTPUT: learning same result


-- For checking length of a string, length() will count how many characters are in the string

select length("learning") as total_length;
-- OUTPUT: 8

-- You can use character_length() or char_length() for same results

select character_length("learning") as total_length;
-- OUTPUT: 8

select char_length("learning") as total_length;
-- OUTPUT: 8


-- For adding 2 or more string/text or anything together you can use concat()
select concat("I'm ", "learning ", "SQL");
-- OUTPUT: I'm learning SQL




-- Now lets explore a few date & time function

-- If you want to display the current date
select curdate();
-- OUTPUT: 2025-12-30 today's date

-- If you want to extract day from date value
select day(curdate());
-- OUTPUT: 30

-- If you want to display the current date & time
select now();
-- OUTPUT: 2025-12-30 22:19:04






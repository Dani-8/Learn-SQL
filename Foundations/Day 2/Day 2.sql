show databases;          -- Check databases first to select the new_sql that we made
use new_sql;             -- Select the database to work in

select * from emp_details; -- Check the table data before running queries


-- Show distinct cities from emp_details
-- DISTINCT is used to remove duplicate city names and show each city only once
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
select sum(salary) as total_salaries_of_emps from emp_details;
-- OUTPUT: total_salaries_of_emps as column name and value 258000 (Sum of Salaries)


/* Now if you want Average Salary you can use AVG() instead of SUM() */
select avg(salary) as average_salary_of_emp from emp_details;
-- OUTPUT: average_salary_of_emp as column name and value 51600 (Average Salary)


/* Now if you want to select specific columns from table by using the column name */
select name, age, salary from emp_details;
-- OUTPUT: name, age, salary columns in result


/* Now if you want filter your table based on specific condition 
You can use WHERE clause */
select * from emp_details where age > 30;
-- OUTPUT: It will give me output where the emp age is greater than 30


/* Now if you want to filter only Female emps 
You can also use WHERE clause */
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


/* Now there is another way to write this same query by using IN operator */
select * from emp_details where city in ("New York", "Miami"); -- You will get same output
-- OUTPUT: You can see all the emps who belong to "New York" or "Miami" 






-- ✅ Well done! Day 2 is complete.
-- You practiced filtering data with WHERE, AND, OR, and IN operators.
-- You also learned counting, summing, and averaging data using COUNT(), SUM(), and AVG().
-- Tomorrow, we’ll dive into GROUP BY, ORDER BY, and string & date functions.


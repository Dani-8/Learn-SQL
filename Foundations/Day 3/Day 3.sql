show databases;          -- Check databases first to select the new_sql that we made
use new_sql;             -- Select the database to work in

select * from emp_details; -- Check the table data before running queries



/* Now you will use BETWEEN operator that selects the values within the given range,
the values can be Numbers, Text, Dates */

/* Now suppose if you want to find the emps whose DOJ(Date of Join) was between 
"2015/1/1" & "2020/12/31" */
select * from emp_details where doj between "2015/1/1" and "2020/12/31";



/* Now if you want to find the total salary of employees of each sex,
you can use GROUP BY along with SUM() function */
select sex, sum(salary) as total_salary from emp_details group by sex;
-- OUTPUT: Shows total salary of employees for each sex


/* Now same thing but also count emps of each sex */
select sex, sum(salary) as total_salary, count(sex) as total_emp from emp_details group by sex;
-- OUTPUT: Shows total salary & total count of employees for each sex




/* Now if you want to sort the result to ascending or descending order in this case,
You can use ORDER BY clause with the keywords 
ASC for ascending order(this order is default by SQL) & DESC for descending order. */
select * from emp_details order by salary;
-- OUTPUT: Shows all the records in ascending order of their salary(which is default) 


select * from emp_details order by salary desc;
-- OUTPUT: Shows all the records in descending order of their salary 



-- ==================================================================== 
-- ==================================================================== 
-- ==================================================================== 



/* Now let's see the basic operation by using the SELECT statement */

/* For Addition */
select (10 + 20) as addition;
-- OUTPUT: 30

/* For Subtraction */
select (50 - 20) as subtraction;
-- OUTPUT: 30

/* For repeating a character multiple times, repeat() takes 2 values inside () 
1- a character that needs to repeat, 2- a number how many times it should repeat */
select repeat("@", 10);
-- OUTPUT: @@@@@@@@@@



-- If you want to convert text/string into uppercase or lowercase

/* For UPPERCASE */
select upper("learning") as uppercase;
-- OUTPUT: LEARNING

/* For lowercase */
select lower("LEARNING") as lowercase;
-- OUTPUT: learning

/* For lowercase using lcase */
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

-- For reverse the string
select reverse("Leaarning");
-- OUTPUT: gninraaeL

-- For replacing something from a string
select replace("I'm learning python", "python", "SQL");
-- OUTPUT: I'm learning SQL




/* Let's see some trims function, 
trim() removes spaces from string,
ltrim() removes spaces from left side,
rtrim() removes spaces from right side */

select length("     learning           ");
-- OUTPUT: 24  reason counting spaces as well

select length(ltrim("     learning           "));
-- OUTPUT: 19  reason remove spaces from left side

select length(rtrim("     learning           "));
-- OUTPUT: 13  reason remove spaces from right side




/* Now if you want to find the position of a substring in a string,
you can use the POSITION() function */
select position('function' in "I'm using position function in SQL!!!");
-- OUTPUT: Shows the position of the first occurrence of the word 'function' in the given string




/* Now if you want to find the ascii value of a character, 
you can use the ascii() function */
select ascii('a') as ascii_a;
-- OUTPUT: shows ascii value of character 'a' as 97

select ascii('5') as ascii_5;
-- OUTPUT: shows ascii value of character '5' as 53

select ascii('z') as ascii_z;
-- OUTPUT: shows ascii value of character 'z' as 122





-- Now let's explore a few date & time functions

-- If you want to display the current date
select curdate();
-- OUTPUT: 2025-12-30 today's date

-- If you want to extract day from date value
select day(curdate());
-- OUTPUT: 30

-- If you want to display the current date & time
select now();
-- OUTPUT: 2025-12-30 22:19:04





-- You can use these functions in table records as well....
select name, char_length(name) from emp_details;
-- OUTPUT: Emp name with the length of their name

select name, age, concat(name, " ", age) as name_age from emp_details;
-- OUTPUT: Emp name and age in separate columns and concat both and show it in one column

select reverse(name) as reverse_name from emp_details;
-- OUTPUT: All the names of emps reversed

select name, position("a" in name) as pos_a_in_name from emp_details;
-- OUTPUT: Shows the position of first occurrence of 'a' in each employee's name







-- 🎯 Awesome! Day 3 finished.
-- Today you explored GROUP BY, ORDER BY, and advanced functions like CONCAT(), REVERSE(), TRIM(), POSITION(), ASCII(), and date/time functions.
-- You now have a strong foundation to write and analyze queries in SQL.
-- Keep practicing and experimenting with your emp_details table to get even better!



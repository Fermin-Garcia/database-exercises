USE employees;
SHOW TABLES;

-- Two ways to explore a table is DESCRIBE AND EXPLAIN	
EXPLAIN employees;
/* 
question 6: whic table contains a numeric tyoe column?
answer: emp_no 

question 7: which tables do you think contain a string type column? 
answer : first_name, last_name

question 8: which table do you think contains a date type column?
answer: birth_date, and hire_date

question 9: what is the relationship between employees and department ? 
answer: dept_emp table is the relationship between Employees and department

question 10: show the sql that was created the dept_manager
ANSWER: SHOW CREATE TABLE dept_manager;

*/

SHOW CREATE TABLE dept_manager;
explain departments;
explain employees;
explain dept_emp;


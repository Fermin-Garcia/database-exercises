use employees;
explain employees;

/* Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. */


select dept_no as "Department Number" , e.hire_date as "Start Date",  to_date as "End Date",
if (to_date > now(),1,0) as "Current Employee"


from dept_emp
join employees as e using(emp_no)


limit 100;

-- just keep swiming 


/* Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name. */


select concat(first_name , ' ' ,last_name) as "Employee's Name",
case
when substring(last_name,1,1) in ('a', 'b', 'c','d','e','f','g','h') then  "A-H"
when substring(last_name,1,1) in ('i', 'j', 'k','l','m','n','o','p','q') then 'I-Q'
when substring(last_name,1,1) in ('r', 's', 't','u','v','w','x','y','z')  then "R-Z"

end as 'Alpha Group'
from employees

limit 100;

/* How many employees (current or previous) were born in each decade? */

select 
count(if(substring(birth_date,3,2) like '5%', 50,null)) as " Bron in 50's",
count(if(substring(birth_date,3,2) like '6%', 60,null)) as " Bron in 60's"

from employees


limit 100; 

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

select 
case
when dept_name in ('research', 'development') then 'R&D'
when dept_name in ('sales', 'marketing') then 'Sales & Marketing'
when dept_name in ('Production', 'Quality Management') then 'Prod & QM'
else dept_name
end as dept_group,
round(avg(salary),2) 
from salaries as s
join dept_emp as e using(emp_no)
join departments as d using(dept_no)

where s.to_date > now() 
group by dept_name

limit 100;





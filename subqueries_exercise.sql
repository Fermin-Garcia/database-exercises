use employees;

-- question  1 with metal notes 

-- code to produce sing value 
select hire_date
from employees 
where emp_no = 101010 ;
-- ------------------------------

select concat(first_name, " ", last_name) as 'Employee Name ', hire_date as "Date Hired"
from employees
join dept_emp as de using(emp_no)
where hire_date 
like 
(select hire_date
from employees 
where emp_no = 101010)
and de.to_date > now()
limit 100;

-- question 2 

-- write a query that find the title of all the current employees  with the first name aamod

(select  
distinct first_name
from employees 
where first_name like 'aamod');
-- Ends here 

explain titles;

select title as "All Titles Held by Aamod (current)"
from employees as e
right join titles as t using (emp_no)
where 
(select  
distinct first_name
from employees 
where first_name like 'aamod') = e.first_name and to_date > now()
limit 100;

-- number 3 

-- write a query that shows how many people are no longer working for the comapny 
-- 91479

select concat(e.first_name, " " ,e.last_name) as "She doesn't even go here"
from dept_emp
join employees as e using(emp_no)
where to_date < now()
;
-- number 4 
-- the name of the female managers are as followed:
/*
Isamu	Legleitner
Karsten	Sigstam
Leon	DasSarma
Hilary	Kambil*/


select concat(first_name ,' ', last_name) as "Manager's Name"
from dept_manager
join employees as e using(emp_no)
where to_date > now() and gender like '%f'

limit 100; 

-- number 5 below:

select concat(first_name, ' ', last_name) as "Employee's Name", salary
from salaries
left join employees as e using (emp_no)
where to_date > now() and 
(select avg(salary)
from salaries
)
limit 100;


-- number 6 below:

select round(stddev(salary)) as "standard divation "
from salaries 
where to_date > now()

limit 100;

-- don't quote me on this one 


 


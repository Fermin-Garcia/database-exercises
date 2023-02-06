use employees;

-- example below 

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

-- example above 
explain employees;

explain departments;
explain employees;
explain dept_manager;

select  *
from dept_manager
where to_date > now(); 

select emp_no, e.first_name, e.last_name
from employees as e
join dept_manager using (emp_no);


-- Number 1: below 

select concat(e.first_name,' ', e.last_name) as dept_manager,
dept_name
from dept_manager as dm
left join employees as e 
using(emp_no)
left join departments as d 
using(dept_no)
where dm.to_date > now();

-- Number 2: below 

select concat(e.first_name,' ', e.last_name) as dept_manager,
dept_name
from dept_manager as dm
left join employees as e 
using(emp_no)
left join departments as d 
using(dept_no)
where dm.to_date > now() and e.gender = 'F';

-- Number 3: below 

select dept_name as "Department Name", concat(e.first_name,' ', e.last_name) as "Deparment Manager"
from dept_manager as dm
left join departments as d 
using(dept_no)
left join employees as e 
using(emp_no)
where dm.to_date > now() and e.gender = 'F';

-- Number 4 below:

select t.title AS 'Title',
count(Title) AS 'Count'
from titles as t
left join dept_emp using(emp_no)
join departments using(dept_no)
where t.to_date like '%9999%'
group by Title;

-- number 5 below :

explain employees;
explain salaries;

select d.dept_name as "Department", concat(e.first_name, " ", e.last_name) as 'Managers Name',  salary
from employees as e 
left join dept_manager as dm using (emp_no)
left join salaries as s using(emp_no)
right join departments as d using(dept_no)
where dm.to_date > now() and s.to_date > now()
limit 100; 
-- number 6 below:
-- number of current employees in each department

select distinct dept_no, dept_name, count(dept_name)
from dept_emp as de
join departments as d using(dept_no)
where de.to_date > now()
group by dept_no
limit 100;

-- number 7 below:
-- what dept has the highest salary
select d.dept_name, avg(salary)
from salaries as s
right join dept_emp as de using(emp_no)
left join departments as d using(dept_no)
where s.to_date > now() and de.to_date > now()
group by dept_name
limit 100;

-- number 8 below:
-- who is the highest paid employee in marketing department?

select emp_no , concat(e.first_name, ' ', last_name) as emp_name, max(salary)
from salaries as s
join dept_emp as de using(emp_no)
left join employees as e using(emp_no)
left join departments as d  using (dept_no)
where de.to_date > now() and d.dept_name like '%arketing'
group by emp_no
limit 100;

-- number 9 below 
select dept_name, e.first_name, e.last_name, salary
from dept_manager as dm
join employees as e using(emp_no)
left join salaries as s using (emp_no) 
right join departments as d using(dept_no)
where dm.to_date > now() and s.to_date > now()


limit 100; 

-- number 10 below

select dept_name, round(avg(salary),0)
from salaries as s 
join dept_emp as de using (emp_no)
right join departments as d using (dept_no)
where s.to_date > now() and de.to_date > now()
group by dept_name
limit 100;

use oneil_2110;
/*
Create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read. 

*/

use oneil_2110;
create temporary table employees_with_department 

select first_name, last_name, dept_name
from employees.dept_emp as de
join employees.departments as d using(dept_no)
join employees.employees as e using (emp_no)
where de.to_date > now()
limit 100

; 

alter table employees_with_department
add full_name varchar(100);


update employees_with_department
set full_name = concat(first_name, ' ',last_name);

select *
from employees_with_department
limit 100;

alter table employees_with_department
drop column (first_name, last_name);

-- concat first_name and last_name in the begining

use oneil_2110;

create temporary table payment_table as 
select concat(s.first_name, ' ', s.last_name) as "Staff Name",
	   concat(c.first_name, ' ', c.last_name) as "customer's Name",
amount, rental_id, payment_date
from sakila.payment
join sakila.staff as s using(staff_id)
join sakila.customer as c using (customer_id)
;

alter table payment_table 
modify column amount decimal;

select * from payment_table;

explain payment_table;





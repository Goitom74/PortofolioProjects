-- Subqueries

select *
from employee_demographics
where employee_id in 
					(select employee_id
                    from employee_salary
                    where dept_id = 1)
;                    


select first_name, salary,
(select AVG(salary)
from employee_salary) AS avg_salary
from employee_salary;


select *
from
(select gender, avg(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
Group by gender) as agg_table;


select gender, avg(`max(age)`)
from
(select gender, avg(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
Group by gender) as agg_table
group by gender
;

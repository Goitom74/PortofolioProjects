select gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
ON dem.employee_id = sal.employee_id
group by gender;

select dem.first_name, dem.last_name, gender,avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
ON dem.employee_id = sal.employee_id;

select dem.first_name, dem.last_name, gender, sum(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
ON dem.employee_id = sal.employee_id;


select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics dem
join employee_salary sal
ON dem.employee_id = sal.employee_id;


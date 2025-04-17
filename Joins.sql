-- Joins

select *
From employee_demographics;

Select *
From employee_salary;

select *
From employee_demographics
inner join employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id
;
    
 -- Outer Joins
 
 select dem.employee_id, age, occupation
From employee_demographics AS dem
inner join employee_salary AS sal
ON dem.employee_id = sal.employee_id
;

select *
From employee_demographics AS dem
Left join employee_salary AS sal
ON dem.employee_id = sal.employee_id
;


select *
From employee_demographics AS dem
Right join employee_salary AS sal
ON dem.employee_id = sal.employee_id
;


-- Joining multiplr tables together

select *
From employee_demographics AS dem
Inner join employee_salary AS sal
ON dem.employee_id = sal.employee_id
;


select *
From employee_demographics AS dem
Inner join employee_salary AS sal
ON dem.employee_id = sal.employee_id
Inner join parks_departments pd
on sal.dept_id = pd.department_id
;
Select *
from parks_departments;


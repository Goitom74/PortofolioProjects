-- common table expression (CTEs)
-- CTE and subqueries give similar results but clarity and simplicity in statements in CTE are better tahn in subqueries

with CTE_Example as 
(select gender, avg(salary) avg_sal, MAX(salary) Max_sal, MIN(salary) MIN_sal, Count(salary) Count_sal
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
select *
from CTE_Example
;

-- Temporary tables

Create temporary table temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);
select *
from temp_table;

insert into temp_table
values('goitom','teklay','rush hour' 'bad boys');
select *
from temp_table;

-- creating temp-table from existing table

create temporary table salary_over_50k
select *
from employee_salary
where salary > 50000;
select *
from salary_over_50k;

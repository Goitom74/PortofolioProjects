Delimiter $$
CREATE PROCEDURE Parks_and_recreation.new_procedure()
BEGIN
select *
from employee_salary
where salary >= 50000;
select *
from employee_salary
where salary >= 10000;
END $$
Delimiter ;

Delimiter $$
CREATE PROCEDURE Parks_and_recreation.new_procedure2(employee_id int)
BEGIN
select*
from employee_salary
where employee_id = dept_id
;
END $$
Delimiter ;
call Parks_and_recreation.new_procedure2(1)
;

select *
from parks_and_recreation.employee_salary
;
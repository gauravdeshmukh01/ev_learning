create table employee1(
	emp_id int,
	emp_name varchar(50),
	emp_dept varchar(50),
	emp_salary decimal(10,2)
);
INSERT INTO employee1 (emp_id, emp_name, emp_dept, emp_salary)
VALUES (101, 'Alice Johnson', 'HR', 55000.00);

INSERT INTO employee1 (emp_id, emp_name, emp_dept, emp_salary)
VALUES (102, 'Bob Smith', 'Finance', 62000.50);

INSERT INTO employee1 (emp_id, emp_name, emp_dept, emp_salary)
VALUES (103, 'Charlie Brown', 'IT', 72000.75);

INSERT INTO employee1 (emp_id, emp_name, emp_dept, emp_salary)
VALUES (104, 'Diana Ross', 'Marketing', 48000.00);

INSERT INTO employee1 (emp_id, emp_name, emp_dept, emp_salary)
VALUES (105, 'Ethan Lee', 'Operations', 51000.25);

select * from employee1;

--distinct
select distinct emp_dept from employee1 order by emp_dept;

--limit
select emp_name,emp_id from employee1 order by emp_id limit 3 offset 2;

--fetch
select emp_name,emp_id from employee1 order by emp_id fetch first 4 rows only;

--AND operator
select emp_name from employee1 where emp_dept = 'HR' AND emp_salary = 20000;

--OR operator
select emp_name from employee1 where emp_dept = 'HR' OR emp_salary = 20000;

--BETWEEN
select emp_name from employee1 where emp_id between 102 and 105;
select emp_name from employee1 where emp_id not between 101 and 104;

--like - pattern matching
select emp_id, emp_name from employee1 where emp_name like '%th';
select emp_id, emp_name from employee1 where emp_name like 'Bo%';
select emp_id, emp_name from employee1 where emp_name like '%ia%';
select emp_id, emp_name from employee1 where emp_name like 'Ch_';
select emp_id, emp_name from employee1 where emp_name like '_ss';
select emp_id, emp_name from employee1 where emp_name like '%ro_';

--is null and not null












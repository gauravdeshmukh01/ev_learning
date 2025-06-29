-- locations table
create table locations (
    location_id serial primary key,
    city varchar(50) not null
);
select * from locations;


insert into locations (city) values
('Mumbai'),
('Delhi'),
('Bangalore');

-- departments table
create table departments (
    department_id serial primary key,
    department_name varchar(100) not null,
    location_id int references locations(location_id)
);

insert into departments (department_name, location_id) values
('HR', 1),
('IT', 2),
('Sales', 3);

select * from departments;


-- jobs table (only 6 records, capitalized titles)
create table jobs (
    job_id serial primary key,
    job_title varchar(50) not null,
    min_salary numeric(10,2),
    max_salary numeric(10,2)
);

insert into jobs (job_title, min_salary, max_salary) values
('Hr Manager', 40000.00, 70000.00),
('Accountant', 30000.00, 60000.00),
('Software Engineer', 50000.00, 120000.00),
('Marketing Exec', 35000.00, 75000.00),
('Sales Rep', 30000.00, 65000.00),
('Support Lead', 40000.00, 80000.00);

select * from jobs;


-- employees table (capitalized names)
create table employees (
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50) not null,
    email varchar(100) unique not null,
    phone_number varchar(20),
    hire_date date not null,
    job_id int references jobs(job_id),
    salary numeric(10,2) not null,
    manager_id int references employees(employee_id),
    department_id int references departments(department_id)
);

insert into employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) values
('Amit', 'Verma', 'amitv@gmail.com', '9876543210', '2017-12-15', 1, 65000, null, 1),
('Priya', 'Sharma', 'priyas@gmail.com', '9876543211', '2019-03-10', 2, 58000, 1, 1),
('Rahul', 'Joshi', 'rahulj@gmail.com', '9876543212', '2018-06-20', 3, 90000, 1, 2),
('Sneha', 'Reddy', 'snehar@gmail.com', '9876543213', '2016-07-11', 4, 70000, 3, 2),
('Arjun', 'Mehta', 'arjunm@gmail.com', '9876543214', '2019-09-05', 5, 60000, 3, 3),
('Neha', 'Patil', 'nehap@gmail.com', '9876543215', '2015-01-18', 6, 78000, 3, 3),
('Ravi', 'Iyer', 'ravii@gmail.com', '9876543216', '2017-08-23', 6, 55000, 3, 3),
('Kiran', 'Rao', 'kiranr@gmail.com', '9876543217', '2018-10-30', 5, 50000, 4, null), -- no dept
('Sonal', 'Desai', 'sonald@gmail.com', '9876543218', '2016-04-12', 2, 85000, 4, 1),
('Deepak', 'Kumar', 'deepakk@gmail.com', '9876543219', '2020-01-15', null, 98000, 2, 2); -- no job

select * from employees;


-- job_history table (some employees only)
create table job_history (
    employee_id int references employees(employee_id),
    start_date date not null,
    end_date date not null,
    job_id int references jobs(job_id),
    department_id int references departments(department_id),
    primary key (employee_id, start_date)
);
select * from job_history;

insert into job_history (employee_id, start_date, end_date, job_id, department_id) values
(1, '2018-01-01', '2020-01-14', 1, 1),
(2, '2020-01-01', '2021-03-21', 2, 1),
(4, '2017-04-01', '2019-06-15', 4, 2),
(6, '2016-02-01', '2018-11-12', 6, 3);







select e.first_name, e.last_name, j.job_title
from employees e
inner join jobs j on e.job_id = j.job_id;

select e.first_name, e.last_name, d.department_name
from employees e
left join departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, j.job_title as previous_job, d.department_name, jh.start_date, jh.end_date
from job_history jh
inner join employees e on jh.employee_id = e.employee_id
inner join jobs j on jh.job_id = j.job_id
inner join departments d on jh.department_id = d.department_id;

select e.first_name, e.last_name, e.salary, d.department_name
from employees e
inner join departments d on e.department_id = d.department_id
where e.salary > (select avg(salary) from employees);

-- all 8 queries below

select d.department_name, l.city
from locations l
right join departments d on l.location_id = d.location_id;

select e.employee_id, e.first_name, e.last_name, jh.start_date, jh.end_date
from employees e
inner join job_history jh on e.employee_id = jh.employee_id;

select first_name, last_name, job_title
from employees
natural join jobs;

select e.first_name, e.last_name, j.job_title, d.department_name
from employees e
inner join jobs j on e.job_id = j.job_id
inner join departments d on e.department_id = d.department_id;

select e.first_name as employee, m.first_name as manager, d.department_name
from employees e
left join employees m on e.manager_id = m.employee_id
left join departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, j.job_title, d.department_name, jh.start_date, jh.end_date
from job_history jh
inner join employees e on jh.employee_id = e.employee_id
inner join jobs j on jh.job_id = j.job_id
inner join departments d on jh.department_id = d.department_id;

select e.first_name, e.last_name, e.salary, d.department_name
from employees e
inner join departments d on e.department_id = d.department_id
where e.salary > (select avg(salary) from employees);

select e.first_name, e.last_name, j_current.job_title as current_job, j_prev.job_title as previous_job
from employees e
left join jobs j_current on e.job_id = j_current.job_id
left join job_history jh on e.employee_id = jh.employee_id
left join jobs j_prev on jh.job_id = j_prev.job_id;










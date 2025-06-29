select * from orders;

-- left join 

select company_name, order_id
from customers
left join orders on customers.customer_id = orders.customer_id;

select company_name, order_id
from customers
left join orders on customers.customer_id = orders.customer_id
where order_id is null;


--right join

select company_name, order_id
from orders
right join customers on customers.customer_id = orders.customer_id
where order_id is null;

--full join

select company_name, order_id
from customers
full join orders on customers.customer_id = orders.customer_id;

select product_name, category_name
from categories
full join products on 
products.category_id=categories.category_id;

--find customers who are in same city and order by city // self join

select a.company_name as customername1, b.company_name as customername2, a.city
from customers a, customers b
where a.customer_id > b.customer_id
and a.city = b.city
order by city;

--find the supplier from same country and order by country






--cross join 

create table department(dept_id int, dept_name text);

insert into department values(1,'HR');
insert into department values(2,'IT');
insert into department values(3,'Sales');
insert into department values(4,'Finance');

select * from department;
--delete  from department where dept_id = 4;

select e.employee_id,e.first_name,e.last_name,
d.dept_id,d.dept_name
from employees e cross join department d 
order by e.employee_id;

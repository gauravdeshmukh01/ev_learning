SELECT "CompanyName", "OrderDate", "ShipCountry"
FROM orders
JOIN customers ON customers."CustomerID" = orders."CustomerID";



select * from orders;
select * from customers;

SELECT "CompanyName", "OrderDate", "ShipCountry"
FROM orders
JOIN customers ON customers."CustomerID" = orders."CustomerID";


select company_name,unit_price,unit_in_stock 
from products
join suppliers on products.

select "CompanyName","OrderDate","UnitPrice","Quantity" 
from orders
join order_details on orders."OrderID" = order_details."OrderID"
join customers on customers."CustomerID" = orders."CustomerID";

select * from categories;

select count("OrderID") from order_details;



join products on products.product_id=order_details.product_id
join categories on categories.category_id=products.category_id;
--add where clause select category name of Dairy Products and amount spent>=568
select from categories;
select "CompanyName","OrderDate",order_details."UnitPrice", "Quantity", "ProductName","CategoryName"
from orders
join order_details on orders."OrderID"=order_details."OrderID"
join customers on customers."CustomerID"=orders."CustomerID"
join products on products."ProductID"=order_details."ProductID"
join categories on categories."CategoryID"=products."CategoryID";



--category name of Dairy Products and amo 40-add where clause select cat spent>=500

select "CompanyName", "OrderDate",order_details."UnitPrice", "Quantity", "ProductName","CategoryName"
from orders
join order_details on orders."OrderID"=order_details."OrderID"
join customers on customers."CustomerID"=orders."CustomerID"
join products on products."ProductID"=order_details."ProductID"
join categories on categories."CategoryID"=products."CategoryID"
where "CategoryName"='Dairy Products' and
order_details."UnitPrice"*"Quantity">=500;

select * from orders;
select * from customers;

--left joint 

select company_name,order_id
from customers
left join orders on customers.customer_id = orders.customer_id; 



select company_name,order_id
from customers
left join orders on customers.customer_id = orders.customer_id
where order_id is null;


--right join 

select company_name,order_id
from customers
right join orders on customers.customer_id = orders.customer_id
where order_id is null;

select company_name,order_id
from orders
right join customers on customers.customer_id = orders.customer_id
where order_id is null;

--full  join it gives all table

select company_name,order_id
from orders
full join customers on customers.customer_id = orders.customer_id;


select product_name,category_name
from categories
full join products on products.category_id=categories.category_id;


--find customers who are in same city and order by city

select a.company_name as customername1,b.company_name as customername2 ,a.city
from customers a,  customers b
where a.customer_id > b.customer_id
and a.city = b.city
order by city;

--find suppliers from same country and order by country

select * from customers;


select a.company_name as suppliername1,b.company_name as suppliername2 ,a.city
from suppliers a,  suppliers b
where a.supplier_id > b.supplier_id
and a.country = b.country
order by a.country;


--cross join

create table dept(
dept_id serial primary key,
dept_name varchar(50)

);

insert into dept (dept_name)
values
('hr'),
('it'),
('slaes'),
('finance');
select * from dept;


select e.employee_id,e.first_name,e.last_name,
d.dept_id,d.dept_name
from employees e cross join department d
order by e.employee_id;




select e.employee_id,e.first_name,e.last_name,
d.dept_id,d.dept_name
from employees e natural join dept d;


create table zoo1(
animal_id serial primary key,
animal_name varchar(50)
);


create table zoo2(
animal_id serial primary key,
animal_name varchar(50)
);




insert into zoo1 (animal_name)
values
('tiger'),
('wolf'),
('fox'),
('panda');

insert into zoo2 (animal_name)
values
('lion'),
('snake'),
('hippo'),
('rhino');

select * from zoo2; 
--inner join

select zoo1.animal_id ,zoo1.animal_name,zoo2.animal_id,zoo2.animal_name from zoo1 
inner join zoo2 on zoo1.animal_name = zoo2.animal_name; 

--left join 
select zoo1.animal_id ,zoo1.animal_name,zoo2.animal_id,zoo2.animal_name from zoo1 
left join zoo2 on zoo1.animal_name = zoo2.animal_name; 

--right join 

select zoo1.animal_id ,zoo1.animal_name,zoo2.animal_id,zoo2.animal_name from zoo1 
right join zoo2 on zoo1.animal_name = zoo2.animal_name; 

--full join 

select zoo1.animal_id ,zoo1.animal_name,zoo2.animal_id,zoo2.animal_name from zoo1 
full join zoo2 on zoo1.animal_name = zoo2.animal_name; 

--natural join 
select zoo1.animal_id ,zoo1.animal_name,zoo2.animal_id,zoo2.animal_name from zoo1 
natural join zoo2 ; 

--self join 

select zoo1.animal_id ,zoo1.animal_name,zoo2.animal_id,zoo2.animal_name from zoo1 
self join zoo2 on zoo1.animal_name = zoo2.animal_name; 

--cross join *


select zoo1.animal_id ,zoo1.animal_name,zoo2.animal_id,zoo2.animal_name from zoo1 
cross join zoo2 ; 


select * from employees;

select * from customers;

--indexes
select * from customers where contact_title='Owner';
create INDEX indexdemo on customers(contact_title);
explain analyze select * from customers where contact_title='Owner';

select * from orders; 

select customer_id,ship_name,ship_country from orders where ship_country='France';
create INDEX indexdemo2 on orders(customer_id);
explain analyze select customer_id,ship_name,ship_country from orders where ship_country='France';


--view  or replace :- it if exist
select customer_id,ship_name,ship_country from orders where ship_country='France';

create view view1 as
select customer_id,ship_name,ship_country from orders where ship_country='France';


create or replace view view2 as
select customer_id ,ship_address from orders where ship_address='Rua do Paço, 67';
select count(*) from view2 ;

create view orderviewdemo as
SELECT customers.customer_id, customers.contact_name, orders.order_id 
FROM orders, customers
WHERE orders.customer_id = customers.customer_id;

select* from view2 ;
update view2 set customer_id ='Ram' WHERE customer_id='HANAR';

UPDATE view2 
SET customer_id = 'Ram' 
WHERE customer_id = 'HANAR';













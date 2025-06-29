select * from bankdb;

INSERT INTO bankdb (id, name, amount) VALUES (6, 'Gaurav', 5000);
INSERT INTO bankdb (id, name, amount) VALUES (2, 'Ravi', 3200);
INSERT INTO bankdb (id, name, amount) VALUES (3, 'Simran', 8700);
INSERT INTO bankdb (id, name, amount) VALUES (4, 'Anjali', 1500);
INSERT INTO bankdb (id, name, amount) VALUES (5, 'Ramesh', 6700);

select * from bankdb where amount > 3200;
select * from bankdb order by amount asc;

-- aggregate function sum,count,avg,min,max

select count(*) as Totalamount from bankdb;
select sum(amount) as Totalamount from bankdb;
select avg(amount) as avgamount from bankdb;
select max(amount) as higheramount from bankdb;
select min(amount) as lowestamount from bankdb;

-- group by

select name,sum(amount) as Totalamount from bankdb group by id;

-- having

select name,sum(amount) as Totalamount from bankdb
group by name 
having sum(amount) > 3000;


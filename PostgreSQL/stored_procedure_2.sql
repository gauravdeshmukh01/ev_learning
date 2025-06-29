-- creating procedure

create table emp4( id serial primary key, name varchar(100), age int);

create procedure add_emp4(emp_name varchar,emp_age int)
language plpgsql
as 
$$
begin
insert into emp4(name,age) values (emp_name, emp_age);
end;
$$;

call add_emp4('alice', 24);
select * from emp4;

----------------------------------------------------------
-- updating age

create procedure update_emp4(emp_id int, new_age int)
language plpgsql
as
$$
begin
  update emp4 set age = new_age where id = emp_id;
end;
$$;
call update_emp4(1, 34);












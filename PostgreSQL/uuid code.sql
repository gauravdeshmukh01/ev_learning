--uuid example

create extension "uuid-ossp";

create table new1(
	contact_id uuid default public.uuid_generate_v1(),
	fname varchar,
	lname varchar,
	primary key(contact_id)
);

insert into new1(fname,lname) values
('Gaurav','Deshmukh'),
('Om','Thakare');

select * from new1;


--json example

create table orderinfo(
	id serial primary key,
	info json not null
);






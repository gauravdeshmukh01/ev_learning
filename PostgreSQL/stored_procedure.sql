create or replace procedure message()
language plpgsql
as $$
begin 
	raise notice 'Jay Shree Ram';
end;
$$;

call message();
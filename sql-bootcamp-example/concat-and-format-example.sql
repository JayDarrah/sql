select 	Name as 'Contact Name', concat(City,', ', State) as 'Location',
		concat('$', format(Sales,2)) as 'Sales'
	from customer;


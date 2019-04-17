select * from customer
	where name like 'A%'
		or name like 'D%'
	order by name;

select * from customer
	where name like 'A%'
		and state = 'NJ';
        
-- use a regular expression to return
-- all records with names starting
-- with a vowel

SELECT * FROM Customer
	WHERE Name REGEXP "^[aeiou].*";
    

 -- insert stmt
/* insert into customer
	values (15, 'Gibson Guitars', 'Memphis', 'TN', 757779000, 1); 

insert into customer (Name, City, State, Sales, Active)
	values 	('Ibanez', 'Bensalem', 'PA', 5667787, 1);
    */

-- update statement
update customer
	SET name = 'Pearl',
		city = 'Test',
        state = 'TE'
	WHERE ID = '17';
    
/*
DELETE FROM customer
	WHERE ID = 18;
*/



select * from customer where id in (10,11,12);
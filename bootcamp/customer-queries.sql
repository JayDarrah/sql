SELECT * 
	FROM customer 
	WHERE Sales > '30000000'
    AND Sales < 70000000
	ORDER BY Sales DESC;

SELECT Name AS 'Customer Name', Sales AS 'Total Sales'
	FROM customer;
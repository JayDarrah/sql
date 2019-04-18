SELECT i.OrderNumber, i.OrderDate, i.CustomerName, p.Code as 'Item Code', p.Description, 
	concat('$',format(p.Price,2)) as "List Price", l.Quantity, concat('$',format(i.Total,2)) as 'Total'
		FROM lineitem l
			INNER JOIN product p
				ON l.ProductID = p.ID
			INNER JOIN invoice i
				ON	l.InvoiceID = i.ID;
SELECT c.Name, c.City, s.Name
FROM Customer c
JOIN State s
	On c.State = s.Code
 CREATE TABLE State (
	Code nvarchar(2) not null primary key,
    Name nvarchar(50) not null
);

INSERT INTO State (Code,Name) Values
	('AL','Alabama'),
	('CA','California'),
	('HI','Hawaii'),
	('NJ','New Jersey'),
	('NV','Nevada'),
	('OH','Ohio'),
	('TX','Texas'),
	('WA','Washington');

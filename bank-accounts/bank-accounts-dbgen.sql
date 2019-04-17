DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

CREATE TABLE accounts (
	ID int primary key auto_increment,
	account_holder nvarchar (50) not null,
    balance decimal(20,2) not null,
    fees decimal(20,2) not null
);

CREATE TABLE transactions (
	ID int primary key auto_increment,
    amount varchar(22) not null,
    txn_type varchar(10) not null,
    account_ID int not null
);

INSERT accounts (account_holder,balance,fees) VALUES
	('Anna Bengel',8888.00,250.00),
	('Chase Williams',5444.00,175.00),
	('Jonelle Wehrman',3333.00,88.00),
	('Steven Ross',3322.00,88.00);

INSERT transactions (amount,txn_type,account_ID) VALUES
	('500.00','Deposit',3),
    ('(200.00)','Withdrawal',4),
    ('200.00','Deposit',4),
    ('248.00','Deposit',1);
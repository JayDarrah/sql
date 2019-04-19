-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_db
-- ------------------------------------------------------
-- Server version	8.0.15

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `account_holder` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `balance` decimal(20,2) NOT NULL,
  `fees` decimal(20,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(22) NOT NULL,
  `txn_type` varchar(10) NOT NULL,
  `account_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `account_ID` (`account_ID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_ID`) REFERENCES `accounts` (`ID`)
);

INSERT INTO `transactions` VALUES 
	(1,'500.00','Deposit',3),
    (2,'(200.00)','Withdrawal',4),
    (3,'200.00','Deposit',4),
    (4,'248.00','Deposit',1);

-- Dump completed on 2019-04-17 13:53:32

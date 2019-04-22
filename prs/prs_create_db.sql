-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;



CREATE TABLE user (
	ID				INT		PRIMARY KEY AUTO_INCREMENT,
	UserName		VARCHAR(20) 	NOT NULL,
	Password		VARCHAR(10) 	NOT NULL,
	FirstName		VARCHAR(20) 	NOT NULL,
	LastName		VARCHAR(20) 	NOT NULL,
	PhoneNumber		VARCHAR(12) 	NOT NULL,
	Email			VARCHAR(75) 	NOT NULL,
	IsReviewer		TINYINT(1) 		DEFAULT 1 NOT NULL,
	IsAdmin			TINYINT(1) 		DEFAULT 1 NOT NULL,
	IsActive		TINYINT(1) 		DEFAULT 1 NOT NULL,
	DateCreated		DATETIME 		DEFAULT current_timestamp NOT NULL,
	DateUpdated		DATETIME 		DEFAULT current_timestamp ON UPDATE current_timestamp NOT NULL,
	UpdatedByUser	INT				DEFAULT 1 NOT NULL,

	CONSTRAINT uname UNIQUE (Username)
);

CREATE TABLE vendor (
	ID					INT				PRIMARY KEY AUTO_INCREMENT,
	Code				VARCHAR(10) 	NOT NULL,
	Name				VARCHAR(255) 	NOT NULL,
	Address				VARCHAR(255) 	NOT NULL,
	City				VARCHAR(255) 	NOT NULL,
	State				VARCHAR(2)		NOT NULL,
	Zip					VARCHAR(5)		NOT NULL,
	PhoneNumber			VARCHAR(12) 	NOT NULL,
	Email				VARCHAR(100) 	NOT NULL,
	IsPreApproved		TINYINT(1)		DEFAULT 1 NOT NULL,
	IsActive			TINYINT(1)		DEFAULT 1 NOT NULL,
	DateCreated 		DATETIME		DEFAULT current_timestamp NOT NULL,
	DateUpdated 		DATETIME		DEFAULT current_timestamp ON UPDATE current_timestamp NOT NULL,
	UpdatedByUser		INT				DEFAULT 1 NOT NULL,
	
	CONSTRAINT vcode UNIQUE (Code)
);


CREATE TABLE purchaserequest (
	ID					INT		PRIMARY KEY AUTO_INCREMENT,
	UserID				INT				NOT NULL,
	Description			VARCHAR(100)	NOT NULL,
	Justification		VARCHAR(255)	NOT NULL,
	DateNeeded			DATE,
	DeliveryMode		VARCHAR(25) 	NOT NULL,
	Status				VARCHAR(20) 	NOT NULL,
	Total				DECIMAL(10,2) 	NOT NULL,
	SubmittedDate		DATETIME		NOT NULL,
	ReasonForRejection	VARCHAR(100), 	-- Nullable
	IsActive			TINYINT(1)		DEFAULT 1 NOT NULL,
	DateCreated			DATETIME		DEFAULT current_timestamp NOT NULL,
	DateUpdated			DATETIME		DEFAULT current_timestamp ON UPDATE current_timestamp NOT NULL,
	UpdatedByUser		INT				DEFAULT 1 NOT NULL,
	
	FOREIGN KEY (UserID) REFERENCES user (ID)
);


CREATE TABLE product (
	ID				INT				PRIMARY KEY AUTO_INCREMENT,
	VendorID		INT 			NOT NULL,
	PartNumber		VARCHAR(50) 	NOT NULL,
	Name			VARCHAR(150) 	NOT NULL,
	Price			DECIMAL(10,2) 	NOT NULL,
	Unit			VARCHAR(255), 	-- Nullable
	PhotoPath		VARCHAR(255), 	-- Nullable
	IsActive		TINYINT(1)		DEFAULT 1 NOT NULL,
	DateCreated 	DATETIME		DEFAULT current_timestamp NOT NULL,
	DateUpdated 	DATETIME		DEFAULT current_timestamp ON UPDATE current_timestamp NOT NULL,
	UpdatedByUser	INT				DEFAULT 1 NOT NULL,
	
	FOREIGN KEY (VendorID) REFERENCES vendor (ID),
	CONSTRAINT vcode UNIQUE (VendorID, PartNumber)
);


CREATE TABLE purchaserequestlineitem (
	ID					INT			PRIMARY KEY AUTO_INCREMENT,
	PurchaseRequestID	INT			NOT NULL,
	ProductID			INT			NOT NULL,
	Quantity			INT			NOT NULL,
	IsActive			TINYINT(1)	DEFAULT 1 NOT NULL,
	DateCreated 		DATETIME	DEFAULT current_timestamp NOT NULL,
	DateUpdated 		DATETIME	DEFAULT current_timestamp ON UPDATE current_timestamp NOT NULL,
	UpdatedByUser		INT			DEFAULT 1 NOT NULL,

	FOREIGN KEY (ProductID) REFERENCES product (ID),
	FOREIGN KEY (PurchaseRequestID)	REFERENCES purchaserequest (ID),
	CONSTRAINT req_pdt UNIQUE (PurchaseRequestID, ProductID)
);

/******************
 Populate Database
******************/

-- insert users
INSERT INTO user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1),
-- my additions
(3,'jdarrah','loginjd','Jason','Darrah','513-513-5135','jd@email.com',1,1),
(4,'kdeal','loginkd','Kim','Deal','937-323-0455','kimd@cannonball.com',1,0),
(5,'numang','logingn','Gary','Numan','937-819-0530','army@tubeway.net',0,0),
(6,'gnuman','loginrs','Richard','Stallman','859-712-0819','emacsdad@gnumail.org',0,1);


-- insert vendors
INSERT INTO `vendor` (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, isPreApproved) VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0),
-- my additions
(6,'WW-1001','Walt''s Widget Works','4529 Setting Sun Blvd','Sharonville','OH','45246','513-529-9420','walt@wwworks.com',1);


-- insert base products
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');
-- my additions
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (14,6,'401364','ACME All-in-one Widget Cleaner',24.99,NULL,'/images/WidgetCleaner.jpg');
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (15,1,'364279','Lenovo ThinkPad Notebook PC',249.99,NULL,'/images/LenovoThinkPad.jpg');









-- More CRUD

-- Step 3: Purchase request submit

-- Create purchase request

INSERT INTO purchaserequest (UserID, Description, Justification, DateNeeded, DeliveryMode, Status, Total,
		SubmittedDate, ReasonForRejection, IsActive, DateCreated, DateUpdated, UpdatedByUser)
	VALUES (3, 'New mouse and widget cleaner', 'Dirty widgets, broken mouse button', '2019-05-01', 'Pickup', 'Approved', '39.98',
		current_timestamp(), NULL, 1, current_timestamp(), current_timestamp(), 2);
    
-- Add some items to the purchase request
INSERT INTO purchaserequestlineitem (PurchaseRequestID, ProductID, Quantity, IsActive, DateCreated, DateUpdated, UpdatedByUser)
	VALUES	(1, 5, 1, 1, current_timestamp(), current_timestamp(), 3);
INSERT INTO purchaserequestlineitem (PurchaseRequestID, ProductID, Quantity, IsActive, DateCreated, DateUpdated, UpdatedByUser)
	VALUES	(1, 15, 1, 1, current_timestamp(), current_timestamp(), 3);

-- Show purchase request line items
SELECT * FROM purchaserequestlineitem where PurchaseRequestID = 1;
SELECT * FROM purchaserequest where ID = 1;


SELECT concat( usr.FirstName,' ',usr.LastName ) as 'Name', pr.Description , pr.Justification, pr.DateNeeded, pr.DeliveryMode, pr.Status, concat('$',format(pr.Total,2)) as 'Total',
		pr.SubmittedDate, pr.IsActive, pr.DateUpdated
	FROM purchaserequest pr
		JOIN purchaserequestlineitem prli
			ON pr.ID = prli.PurchaseRequestID
		JOIN user usr
			ON pr.UserID = usr.ID;



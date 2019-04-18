-- delete, create, and select database
DROP DATABASE IF EXISTS sdb;
CREATE DATABASE sdb;
USE sdb;

CREATE TABLE Student (
	ID			int not null primary key AUTO_INCREMENT,
    FirstName	nvarchar(30) not null,
    LastName	nvarchar(30) not null,
    Address		nvarchar(35) not null,
    City		nvarchar(20) not null,
    State		varchar(2) not null,
    ZIP			varchar(10) not null,
    DOB			date not null,
    PhoneNumber	varchar(15),
    Email		varchar(50),
    SSN			varchar(10)

);

CREATE TABLE Instructor (
	ID			int not null primary key AUTO_INCREMENT,
    FirstName	nvarchar(30),
    LastName	nvarchar(30)
-- add more fields if necessary in a future exercise
);

-- ID, Subject, CourseName, CourseCode, Quarter, InstructorID
CREATE TABLE Course (
	ID			int not null primary key AUTO_INCREMENT,
    Subject			varchar(50) not null,
    CourseName		varchar(50) not null,
    CourseCode		varchar(20) not null,
    Quarter			varchar(20) not null,
    InstructorID	int,
    FOREIGN KEY (InstructorID) REFERENCES Instructor (ID)
);


CREATE TABLE Enrollment (
	ID				int not null primary key AUTO_INCREMENT,
    StudentID		int,
    CourseID		int,
    Grade			varchar(10),
    FOREIGN KEY (StudentID) REFERENCES Student (ID),
    FOREIGN KEY (CourseID) REFERENCES Course (ID)

);

-- ID, FirstName, LastName, Address, City, State, ZIP, DOB, PhoneNumber, Email, SSN

INSERT INTO Student VALUES
	(1, 'Amber', 'Kidwell', '5309 Water St.', 'Cincinnati', 'OH', 45678, '1990-11-11', '484-555-8392', 'amkidw@email.com', 123121234),
    (2, 'Anna', 'Bengel', '962 Bottle Blvd.', 'Cincinnati', 'OH', 45392, '1989-12-03', '346-555-3939', 'anben@gmail.com', 123344567),
    (3, 'Ben', 'Sheperd', '38 Coffee Ave.', 'Dayton', 'KY', 39390, '1985-04-04', '859-555-9287', 'beshep@email.com', 939482749),
    (4, 'Chase', 'Williams', '6509 Cuplid St.', 'Dayton', 'OH', 49584, '1992-06-08', '937-555-4444', 'chaswil@email.com', 494059382),
    (5, 'Chris', 'Jackson', '63 Nametag Way', 'Cincinnati', 'OH', 45830, '1984-12-22', '432-555-3920', 'chrijack@email.com', 494039284);

-- add more later if necessary
/*    (6, 'David', 'McCann', 
    (7, 'Denis', 'Zamorski', 
    (8, 'Dimitriy', 'Guzov', 
    (9, 'Erin', 'Heinrich', 
    (10, 'Jason', 'Darrah', 
    (11, 'Jonelle', 'Wehrman', 
    (12, 'Maria', 'Konerman', 
    (13, 'Marianne', 'Linardos', 
    (14, 'Steven', 'Ross', 
*/

INSERT INTO Instructor VALUES
	(1, 'Sean', 'Blessing'),
    (2, 'Greg', 'Doud');

-- ID, Subject, CourseName, CourseCode, Quarter, InstructorID
INSERT INTO Course VALUES
	(1, 'Programming', 'Intro to Java', 'JD101-648', 'Q1', 1),
    (2, 'Programming', 'C# Development', 'CS301-864', 'Q1', 2),
    (3, 'Data Modelling', 'Widgets and You', 'WWG101-761', 'Q3', 1);

-- ID, StudentID, CourseID, Grade
INSERT INTO Enrollment VALUES
	(1, 3, 1, 'A+'),
    (2, 2, 1, 'A-'),
    (3, 5, 3, 'Pass'),
    (4, 4, 2, 'B');





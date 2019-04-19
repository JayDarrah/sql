-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;


-- [Movie] ID, title, rating, year, director
CREATE TABLE Movie (
	ID			int primary key not null auto_increment,
    title		varchar(100),
    rating		varchar(5),
    year		int,
	director	varchar(50)
);

-- [Actor] ID, firstName, lastName, gender, birthDate
CREATE TABLE Actor (
	ID			int primary key not null AUTO_INCREMENT,
	firstName	varchar(25),
    lastName	varchar(25),
    gender		varchar(12),
    birthDate	date
);

-- [Credit] ID, movieID, actorID, role
CREATE TABLE Credit (
	ID			int primary key not null AUTO_INCREMENT,
    movieID		int,
    actorID		int,
    role	varchar(50),
	FOREIGN KEY (movieID) REFERENCES Movie (ID),
    FOREIGN KEY (actorID) REFERENCES Actor (ID)
);

-- [Genre] ID, name
CREATE TABLE Genre (
	ID			int primary key not null auto_increment,
    name		varchar(25)
);

-- [MovieGenre] ID, movieID, genreID
CREATE TABLE MovieGenre (
	ID			int primary key not null auto_increment,
    movieID		int,
    genreID		int,
	FOREIGN KEY (movieID) REFERENCES Movie (ID),
    FOREIGN KEY (genreID) REFERENCES Genre (ID)
);


-- [Movie] ID, title, rating, year, director
INSERT INTO Movie VALUES
	(1, 'Shaun of the Dead', 'R', 2004, 'Edgar Wright'),
    (2, 'Hot Fuzz', 'R', 2007, 'Edgar Wright'),
    (3, 'The World''s End', 'R', 2013, 'Edgar Wright'),
    (4, 'Star Trek', 'PG-13', 2009, 'J.J. Abrams'),
    (5, 'Paul', 'R', 2011, 'Greg Mottola');

/* Add more if necessary. Examples:
    (6, 'Ready Player One', 'PG-13', 2018, 'Steven Spielberg');
    (7, 'Kill Me Three Times', 'R', 2014, 'Kriv Stenders'),
*/

-- [Actor] ID, firstName, lastName, gender, birthDate
INSERT INTO Actor VALUES
	(1, 'Simon', 'Pegg', 'Male', '1970-02-14'),
    (2, 'Kate', 'Ashfield', 'Female', '1972-05-28'),
    (3, 'Nick', 'Frost', 'Male', '1972-03-28'),
    (4, 'Lucy', 'Davis', 'Female', '1973-02-17'),
    (5, 'Dylan', 'Moran', 'Male', '1971-11-03'),
    (6, 'Peter', 'Serafinowicz', 'Male', '1972-07-10'),
    (7, 'Jessica', 'Hynes', 'Female', '1972-10-30'),
    (8, 'Martin', 'Freeman', 'Male', '1971-09-08'),
    (9, 'Bill', 'Nighy', 'Male', '1949-12-12'),
    (10, 'Penelope', 'Wilton', 'Female', '1946-06-03'),
    (11, 'Bill', 'Bailey', 'Male', '1965-01-13'),
    (12, 'Timothy', 'Dalton', 'Male', '1946-03-21'),
    (13, 'Michael', 'Smiley', 'Male', '1963-01-01'),
    (14, 'Paddy', 'Considine','Male', '1973-09-05'),
    (15, 'Eddie', 'Marsan', 'Male', '1968-06-09'),
    (16, 'Rosamund', 'Pike', 'Female', '1979-01-27'),
    (17, 'Pierce', 'Brosnan', 'Male', '1953-05-16'),
	(18, 'Chris', 'Pine', 'Male', '1980-08-26'),
    (19, 'Zachary', 'Quinto', 'Male', '1977-06-02'),
    (20, 'Leonard', 'Nimoy', 'Male', '1031-03-26'),
    (21, 'Karl', 'Urban', 'Male', '1972-06-07'),
    (22, 'Zoe', 'Saldana', 'Female', '1978-06-19'),
    (23, 'John', 'Cho', 'Male', '1972-06-16'),
    (24, 'Anton', 'Yelchin', 'Male', '1989-03-11'),
	(25, 'Seth', 'Rogen', 'Male', '1892-04-15'),
    (26, 'Jason', 'Bateman', 'Male', '1969-01-14'),
    (27, 'Kristen', 'Wiig', 'Female', '1973-08-22'),
    (28, 'Bill', 'Hader', 'Male', '1978-06-07'),
    (29, 'Sigourney', 'Weaver', 'Female', '1949-10-08'),
    (30, 'Steven', 'Spielberg', 'Male', '1946-12-18');
 
 
 
 
-- [Credit] ID, movieID, actorID, role
INSERT INTO Credit    VALUES
	(1, 1, 1, 'Shaun'),
    (2, 1, 2, 'Liz'),
    (3, 1, 3, 'Ed'),
    (4, 1, 4, 'Dianne'),
    (5, 1, 5, 'David'),
    (6, 1, 6, 'Pete'),
    (7, 1, 7, 'Yvonne (As Jessica Stevenson)'),
	(8, 1, 10, 'Barbara'),
    (9, 1, 9, 'Philip'),
    (10, 1, 13, 'Zombie (Uncredited)'),
    (11, 2, 1, 'Nicholas Angel'),
    (12, 2, 8, 'Met Sergeant'),
    (13, 2, 9, 'Met Chief Inspector'),
    (14, 2, 11, 'Sergeant Turner'),
    (15, 2, 12, 'Simon Skinner'),
    (16, 3, 13, 'Reverend Green'),
    (17, 3, 1, 'Gary King'),
	(18, 3, 3, 'Andy Knightley'),
    (19, 3, 8, 'Oliver Chamberlain'),
    (20, 3, 14, 'Steven Prince'),
	(21, 3, 9, 'The Network (voice)'),
    (22, 3, 15, 'Peter Page'),
    (23, 3, 16, 'Sam Chamberlain'),
    (24, 3, 17, 'Guy Shepherd'),
    (25, 4, 18, 'James T. Kirk'),
    (26, 4, 19, 'Spock'),
    (27, 4, 20, 'Spock Prime'),
    (28, 4, 21, 'Dr. Leonard "Bones" McCoy'),
    (29, 4, 22, 'Nyota Uhura'),
    (30, 4, 1, 'Montgomery "Scotty" Scott'),
    (31, 4, 23, 'Hikaru Sulu'),
    (32, 4, 24, 'Pavel Chekov'),
    (33, 5, 1, 'Graeme Willy'),
    (34, 5, 3, 'Clive Gollings'),
    (35, 5, 25, 'Paul'),
	(36, 5, 26, 'Special Agent Lorenzo Zoil'),
    (37, 5, 27, 'Ruth Buggs'),
    (38, 5, 28, 'Agent Haggard'),
    (39, 5, 29, 'The Big Guy'),
    (40, 5, 30, 'Himself (voice)');




-- [Genre] ID, name
INSERT INTO Genre (name) VALUES
	('Adventure'),
	('Comedy'),
	('Crime'),
	('Drama'),
	('Fantasy'),
	('Historical'),
	('Historical fiction'),
	('Horror'),
	('Action'),
	('Mystery'),
	('Paranoid Fiction'),
	('Philosophical'),
	('Political'),
	('Romance'),
	('Saga'),
	('Satire'),
	('Science fiction'),
	('Social'),
	('Speculative'),
	('Thriller'),
	('Urban'),
	('Western');
    

-- [MovieGenre] ID, movieID, genreID

INSERT INTO MovieGenre VALUES
	(1, 1, 2),
    (2, 1, 8),
    (3, 2, 2),
    (4, 2, 9),
    (5, 3, 17),
    (6, 3, 2),
    (7, 3, 20),
    (8, 4, 17),
    (9, 4, 9),
    (10, 5, 2),
    (11, 5, 17);
    
/* Commenting out to avoid error messages
	-- create a user and grant privileges to that user
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;

*/
-- [Movie] ID, title, rating, year, director
-- [Actor] ID, firstName, lastName, gender, birthDate
-- [Credit] ID, movieID, actorID, role
-- [Genre] ID, name
-- [MovieGenre] ID, movieID, genreID
select mo.title, mo.year, mo.rating, mo.director
	FROM movie mo	
	where ID = 1;

select * from movie;
select * from credit;
select * from actor;

select concat(act.FirstName,' ',act.LastName) as 'Actor', cr.role
	FROM credit cr
    JOIN movie mo
			ON cr.movieID = mo.ID
	JOIN  actor act
			ON cr.actorID = act.ID
	WHERE cr.movieID = 1
;

select mo.title, mo.year, mo.rating, mo.director
	FROM movie mo	
	where ID = 1;

select * from movie;
select * from credit;
select * from actor;

select mo.title, concat(act.FirstName,' ',act.LastName) as 'Actor', cr.role
	FROM credit cr
    JOIN movie mo
			ON cr.movieID = mo.ID
	JOIN  actor act
			ON cr.actorID = act.ID

;


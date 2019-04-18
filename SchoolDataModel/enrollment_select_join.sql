-- [Course] ID, Subject, CourseName, CourseCode, Quarter, InstructorID
-- [Enrollment] ID, StudentID, CourseID, Grade
-- [Student] ID, FirstName, LastName, Address, City, State, ZIP, DOB, PhoneNumber, Email, SSN
-- [Instructor] ID, Firstname, Lastname
-- [Course] -- ID, Subject, CourseName, CourseCode, Quarter, InstructorID


SELECT concat(st.FirstName,' ',st.LastName) as "Student Name", st.DOB, st.Email, 
	co.CourseCode, co.Subject, co.CourseName, co.Quarter, en.Grade, concat(ins.FirstName,' ',ins.LastName) as 'Instructor'
	FROM Enrollment en
		JOIN Student st
			ON st.ID = en.StudentID
		JOIN Course co
			ON co.ID = en.CourseID
		JOIN Instructor ins
			on ins.ID = co.InstructorID;
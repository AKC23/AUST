clear screen;
drop database Offline01
create database Offline01;
use Offline01;
 
drop table Student;
create table Student
( 
   StudentID int,
   S_Name varchar(100),
   S_Phone varchar(100),
   S_Age int
)

insert into Student	values
(101, 'A','01519253022',20),
(102, 'B','01619253059',23),
(103, 'C','01719253056',24),
(104, 'D','01819253051',21),
(105, 'E','01919253072',22),
(106, 'F','01119253035',23),
(107, 'G','01629253065',21),
(108, 'H','01919253055',19)

select * from Student;

drop table Borrows;
create table Borrows
( 
   Borrows_StudentID int,
   Borrows_BookID int,
   Borrows_DateBorrowed date
)

insert into Borrows	values
(101, 1256, '2022-11-23'),
(102, 1502, '2022-12-01'),
(103, 1305, '2022-11-13'),
(104, 1001, '2022-12-02'),
(105, 1205, '2022-10-04'),
(106, 1545, '2022-10-04'),
(107, 1153, '2022-09-24'),
(108, 1665, '2022-11-30')

drop table Book;
create table Book
( 
   BookID int,
   B_AuthorID int,
   B_Title varchar(50),
   B_Genre varchar(50)
)

insert into Book values
(1502, 8105,'The Lord of the Rings','Adventure'),
(1001, 8202,'Harry Potter','Fantasy'),
(1153, 8025,'Sapiens: A Brief History of Humankind','Non-FIction'),
(1205, 8202,'Macbeth','Tragedy'),
(1665, 8305,'In Cold Blood','Non-Fiction'),
(1545, 8305,'The Emperor of All Maladies','Non-Fiction'),
(1256, 8355,'Pride and Prejudice','Fiction'),
(1305, 8202,'The Great Gatsby','Comics')

drop table Author;
create table Author
( 
   AuthorID int,
   A_Name varchar(50),
   A_Age varchar(50)
)

insert into Author values
(8305,'Mrs. A2',44),
(8105,'Mr. A3',56),
(8355,'Mr. A5',39),
(8202,'Mr. A1',77),
(8025,'Mrs. A8',65)

select * from Student
select * from Borrows
select * from Book
select * from Author

/* Show the name of the author who published the highest number of books. */

select B_AuthorID from Book
select AuthorID from Author

SELECT B_AuthorID, COUNT(B_AuthorID) FROM Book 
GROUP BY B_AuthorID
ORDER BY COUNT(B_AuthorID) desc;

/* Solve 01 */
select A_Name from Author where AuthorID = (select Top 1 B_AuthorID FROM Book 
GROUP BY B_AuthorID
ORDER BY COUNT(B_AuthorID) desc);


Select A_Name from Author where AuthorID =
(select AuthorID from (Select AuthorID, count(AuthorID) From Book 
Group by AuthorID Order by count(AuthorID) desc) where rownum=1);


/* Show the age of the youngest student from among those who have borrowed
books belonging to the genre “Non-Fiction”. */

select S_Age from Student

select BookID from Book where B_Genre ='Non-Fiction'

SELECT S_Age FROM Student ORDER BY S_Age;

select S_Name,min(S_Age) from Student 
Group by S_Name
Having Student.StudentID = (select Borrows.Borrows_StudentID from Borrows
Inner join Book 
on Book.BookID = Borrows.Borrows_BookID);


SELECT Min(Student.S_Age) as Student_Age FROM student
JOIN Borrows
  ON Student.StudentID = Borrows.Borrows_StudentID
JOIN Book
  ON Borrows.Borrows_BookID = Book.BookID
  AND Book.B_Genre = 'Non-Fiction';

(select BookID from Book where B_Genre ='Non-Fiction')



/* Show the dates on which “Macbeth” was borrowed. */

select Borrows_DateBorrowed from Borrows where Borrows_BookID = (
select BookID from Book where B_Title = 'Macbeth');



select Borrows.Borrows_DateBorrowed from Borrows 
inner join Book
on Borrows.Borrows_BookID = Book.bookID
where Book.B_Title ='Macbeth';





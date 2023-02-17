clear screen;

drop table Student;
drop table Borrows;
drop table Author;
drop table Book;

create table Student(StudentID number, S_Name varchar2(50),S_Phone varchar2(50), S_Age number);
insert into Student	values (101, 'A','01519253022',20);
insert into Student	values (102, 'B','01619253059',23);
insert into Student	values (103, 'C','01719253056',24);
insert into Student	values (104, 'D','01819253051',21);
insert into Student	values (105, 'E','01919253072',22);
insert into Student	values (106, 'F','01119253035',23);
insert into Student	values (107, 'G','01629253065',21);
insert into Student	values (108, 'H','01919253055',19);

create table Borrows(Borrows_StudentID number, Borrows_BookID number, Borrows_DateBorrowed date);
insert into Borrows	values(101, 1256, '23-Nov-2022');
insert into Borrows	values(102, 1502, '01-Dec-2022');
insert into Borrows	values(103, 1305, '13-Nov-2022');
insert into Borrows	values(104, 1001, '02-Dec-2022');
insert into Borrows	values(105, 1205, '04-Oct-2022');
insert into Borrows	values(106, 1545, '04-Oct-2022');
insert into Borrows	values(107, 1153, '24-Sep-2022');
insert into Borrows	values(108, 1665, '30-Nov-2022');


create table Book(BookID number, AuthorID number,B_Title varchar2(50),B_Genre varchar2(50));
insert into Book values(1502, 8105,'The Lord of the Rings','Adventure');
insert into Book values(1001, 8202,'Harry Potter','Fantasy');
insert into Book values(1153, 8025,'Sapiens: A Brief History of Humankind','Non-FIction');
insert into Book values(1205, 8202,'Macbeth','Tragedy');
insert into Book values(1665, 8305,'In Cold Blood','Non-Fiction');
insert into Book values(1545, 8305,'The Emperor of All Maladies','Non-Fiction');
insert into Book values(1256, 8355,'Pride and Prejudice','Fiction');
insert into Book values(1305, 8202,'The Great Gatsby','Comics');

create table Author(AuthorID number,A_Name varchar2(50),A_Age varchar2(50));
insert into Author values(8105,'Mrs. A2',44);
insert into Author values(8305,'Mr. A3',56);
insert into Author values(8025,'Mr. A5',39);
insert into Author values(8202,'Mr. A1',77);
insert into Author values(8355,'Mrs. A8',65);

commit;

select * from Student;
select * from Borrows;
select * from Book;
select * from Author;

/*2a. Show the name of the author who published the highest number of books. */
select A_Name from Author where AuthorID = (select AuthorID from (Select AuthorID, count(AuthorID) From Book Group by AuthorID Order by count(AuthorID) desc) where rownum = 1);

/* 2b. Show the age of the youngest student from among those who have borrowed
books belonging to the genre “Non-Fiction”. */
select Min(Student.S_Age) as Student_Age from student 
join Borrows on Student.StudentID = Borrows.Borrows_StudentID 
join Book on Borrows.Borrows_BookID = Book.BookID 
and Book.B_Genre = 'Non-Fiction';

/*2c. Show the dates on which “Macbeth” was borrowed. */
select Borrows.Borrows_DateBorrowed from Borrows 
join Book 
on Borrows.Borrows_BookID = Book.bookID 
where Book.B_Title ='Macbeth';
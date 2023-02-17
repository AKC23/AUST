drop table Student;
drop table Borrows;
drop table Book;
drop table Author;
/*Answer to Question 01*/
create table Student(studentID number, name varchar2(20), phone varchar2(14), age number);
create table Author(authorID number, name varchar2(20), age number);
create table Book(bookID number, authorID number, title varchar2(50), genre varchar2(20));
create table Borrows(studentID number, bookID number, dateBorrowed date);


insert into Student values(1,'Abel Tesfaye','01969484103',26);
insert into Student values(2,'Ariana Grande','01969484203',28);
insert into Student values(3,'Sia','01969484303',24);
insert into Student values(4,'Ed Sheeran','01969484403',32);
insert into Student values(5,'Drake','01969484503',44);

insert into Author values(10,'Stefen King', 56);
insert into Author values(20,'Shakespeare', 58);
insert into Author values(30,'JK Rowling', 48);
insert into Author values(40,'Amy Tan', 35);
insert into Author values(50,'George Martin', 48);

insert into Book values(11, 10,'Lord of the Flies','Fiction');
insert into Book values(22, 20,'Macbeth','Non-Fiction');
insert into Book values(33, 20,'Hamlet','Non-Fiction');
insert into Book values(44, 40,'Devotion','Fiction');
insert into Book values(55, 50,'Fireman','Non-Fiction');
insert into Book values(66, 30,'Harry Potter','Fiction');


insert into Borrows values(1,11,TO_DATE('2021-01-21','YYYY-MM-DD'));
insert into Borrows values(2,22,TO_DATE('2021-02-10','YYYY-MM-DD'));
insert into Borrows values(3,33,TO_DATE('2021-02-25','YYYY-MM-DD'));
insert into Borrows values(4,44,TO_DATE('2021-03-08','YYYY-MM-DD'));
insert into Borrows values(5,55,TO_DATE('2021-03-16','YYYY-MM-DD'));

/*   Answer to Question 02
a. Show the name of the author who published the highest number of books.
b. Show the age of the youngest student from among those who have borrowed
books belonging to the genre “Non-Fiction”.
c. Show the dates on which “Macbeth” was borrowed.

/*2a
select name from Author A inner join Book B 
on A.authorID = B.authorID
group by authorID order by count(*) desc;
*/
Select Name from Author where authorID=
(select authorID from (Select authorID, count(authorID) From Book Group by authorID Order by count(authorID) desc) where rownum=1);

/*02b */

select min(Student.age) from Student inner join Borrows 
on Student.studentID=Borrows.studentID
inner join Book on Borrows.Bookid=Book.Bookid
where Book.genre='Non-Fiction';


/*02c */

select Borrows.dateBorrowed from Borrows inner join Book
on Borrows.bookID = Book.bookID
where Book.title ='Macbeth';


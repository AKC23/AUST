create database Practise06

drop table Exam3
create table Exam3
(
	Rollno int,
	S_code varchar(255),
	Marks int,
	B_Code varchar(255)
)

drop table Student3
create table Student3
(
	Rollno int,
	Name varchar(255),
	Branch varchar(255)
)

Select * from Exam3
Select * from Student3

insert into Exam3 values
(1,'CS111',50,'CSE'),
(1,'CS112',60,'CSE'),
(2,'EC101',66,'ECE'),
(2,'EC102',66,'CSE'),
(3,'EC102',70,'CSE'),
(3,'CS122',80,'CSE'),
(4,'EC102',50,'CSE'),
(4,'CS122',60,'CSE'),
(6,'EC201',50,'ECE')

insert into student3 values
(1,'Jay','CSE'),
(2,'Suhani','ECE'),
(3,'Kriti','ECE'),
(4,'Selim','CSE'),
(5,'Hasan','ECE')

Select * from Student3
Select * from Exam3


Select student3.Rollno, student3.Name, student3.Branch,Exam3.Marks,Exam3.B_Code,Exam3.S_code				/*Left Join*/
From student3 
left join Exam3
on student3.Rollno = Exam3.Rollno

Select * from Student3
Select * from Exam3


Select student3.Rollno, student3.Name, student3.Branch,Exam3.Marks,Exam3.B_Code,Exam3.S_code				/*Right Join*/
From student3 
right join Exam3
on student3.Rollno = Exam3.Rollno


Select * from Student3
Select * from Exam3


Select student3.Rollno, student3.Name, Branch,Marks,B_Code,S_code,Exam3.Rollno								 /*Inner Join*/
From student3 
inner join Exam3
on student3.Rollno = Exam3.Rollno


Select student3.Rollno, student3.Name, student3.Branch,Exam3.Marks,Exam3.B_Code,Exam3.S_code,Exam3.Rollno			   /*Full Join*/
From student3 
full join Exam3
on student3.Rollno = Exam3.Rollno

Select * From student3 
full join Exam3
on student3.Rollno = Exam3.Rollno



Select * from Student3
Select * from Exam3

Select Name, Branch as 'Dept' from student3													 /* Union */
union
Select s_code,B_Code from Exam3


Select Name,Branch as 'Dept' from student3													/* Union all */
union all
Select s_code,B_Code from Exam3






drop table StudentX

create table StudentX
(
S_Id int,
age int,
marks int,
NAME varchar(255),
dept varchar(255)

)

 INSERT INTO StudentX VALUES
(1, 10, 80 ,'JAMAL','CSE'),  
(2, 25, 70,'AHMED','Tex'),  
(3, 50, 60,'SADIA','CSE'),  
(4, 15, 50,'ILMA','MPE'),  
(5, 28, 55,'azt','EEE'), 
(6, 25, 88,'avc','BBA')


Select Age,dept from StudentX group by age,dept having age>20




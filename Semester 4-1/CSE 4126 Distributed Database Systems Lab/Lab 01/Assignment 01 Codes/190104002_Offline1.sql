drop table Album;
drop table track;
drop table artist;

/*Answer to Question 01 */

create table Artist(artistID number, name varchar2(20), age number, gender varchar2(7));
create table Album(albumID number, albumTitle varchar2(20), artistID number, certification varchar2(21), numberOfTracks number);
create table Track(trackID number, trackTitle varchar2(20), genre varchar2(21), albumID number, published date);

insert into Artist values(1,'Abel Tesfaye',32,'male');
insert into Artist values(2,'Ariana Grande',29,'female');
insert into Artist values(3,'Sia',46,'female');
insert into Artist values(4,'Ed Sheeran',31,'male');
insert into Artist values(5,'Drake',36,'male');
insert into Artist values(6,'John Legend',43,'male');
insert into Artist values(7,'Shakira',45,'female');

insert into Album values(101,'After Hours',1,'platinum',14);
insert into Album values(102,'Dawn FM',1,'silver',8);
insert into Album values(103,'Starboy',1,'silver',16);
insert into Album values(104,'Beauty Behind the Madness',1,'silver',11);
insert into Album values(105,'Views',5,'platinum',8);
insert into Album values(106,'Scorpion',5,'gold',13);
insert into Album values(107,'Her Loss',5,'silver',6);
insert into Album values(108,'Divide',4,'gold',19);
insert into Album values(109,'=',4,'silver',14);

insert into Track values(1001,'Blinding Lights','R and B',101,TO_DATE('2021-02-21','YYYY-MM-DD'));
insert into Track values(1002,'In Your Eyes','R and B',101,TO_DATE('2021-02-25','YYYY-MM-DD'));
insert into Track values(1003,'Save Your Tears','R and B',101,TO_DATE('2021-02-26','YYYY-MM-DD'));
insert into Track values(1004,'Heartless','R and B',101,TO_DATE('2021-02-27','YYYY-MM-DD'));
insert into Track values(1005,'Too Good','Hip Hop',105,TO_DATE('2016-04-21','YYYY-MM-DD'));
insert into Track values(1006,'One Dance','Hip Hop',105,TO_DATE('2016-04-15','YYYY-MM-DD'));
insert into Track values(1007,'Faithful','Hip Hop',105,TO_DATE('2016-04-07','YYYY-MM-DD'));
insert into Track values(1008,'Perfect','Pop',108,TO_DATE('2021-01-01','YYYY-MM-DD'));
insert into Track values(1009,'Castle on the Hill','Pop',108,TO_DATE('2021-01-06','YYYY-MM-DD'));

/* End of Answer 01 */

/*   Answer to Question 02a */
select *
from track T
INNER JOIN album A 
ON T.albumID = A.albumID 
where published Between 
TO_DATE('2021-01-01','YYYY-MM-DD') AND TO_DATE('2021-12-31','YYYY-MM-DD') 
AND A.certification = 'platinum';

/*  END of answer 02a */

/*  Answer to question 02b */

select name from Artist A
inner join Album B
on A.artistID = B.artistID
where B.certification = 'silver'
group by name having count(B.artistID) >= 3;

/* End of Answer 02b */

/* Answer to question 02c */

select avg(age) 
as avgAge from Artist A 
inner join Album B
on A.artistID = B.artistID 
where numberOfTracks >= 10 having count(B.artistID) >= 3;

/* End of answer 02c */

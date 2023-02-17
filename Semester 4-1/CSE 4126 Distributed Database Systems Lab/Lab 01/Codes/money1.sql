clear screen;
drop table money;
create table money1(id number, name varchar2(20), taka number);
select * from money1;

insert into money1 values(1,'AB',400);
insert into money1 values(2,'BB',510);
insert into money1 values(4,'DD',1020);

select * from money; /*comment*/

commit;
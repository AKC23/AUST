clear screen;
set linesize 32767;
drop table Bills1;

create table Bills1(m_id number, bill_amount number, Billing_Date DATE);

-- Member_Id, Billing_Month, Billing_Amount, Billing_Date

insert into Bills1 values(2201,1500, '11-Feb-22');
insert into Bills1 values(2203,2000, '22-Jul-22');
insert into Bills1 values(2313,2500, '15-Jul-22');
insert into Bills1 values(4400,3500, '23-Jan-22');



commit;

select * from Bills1;


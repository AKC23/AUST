clear screen;
set linesize 32767;
drop table Bills2;

create table Bills2(m_id number, bill_voucher number, Billing_month VARCHAR2(10),Billing_year VARCHAR2(10));

-- Member_Id, Billing_Month, Billing_Amount, Billing_Date

insert into Bills2 values(2201,4567, 'January','2022');
insert into Bills2 values(2203,4568, 'March','2022');
insert into Bills2 values(2312,4569, 'February','2022');
insert into Bills2 values(4400,4570, 'January','2022');


commit;

select * from Bills2;
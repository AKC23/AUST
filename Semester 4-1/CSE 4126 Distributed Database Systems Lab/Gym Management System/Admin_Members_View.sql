clear Screen;

CREATE OR REPLACE VIEW Admin_MembersView(Members_ID, Trainer_ID, Name, Members_Age, Gender, Blood_Group, Package_Name) 
AS
SELECT m_id, tr_id, name, age, gender, bg, pack
FROM members1
UNION
SELECT m_id, tr_id, name, age, gender, bg, pack
FROM members2;

select * from Admin_MembersView;

/*
commit;

Members1(m_id number,tr_id number, name varchar2(10),
age number,gender varchar2(6),height number,weight number,bg varchar2(5),
NID varchar2(15),mn varchar2(11), email varchar2(25),pass varchar2(8),
pack varchar2(15),bill_amount number);



*/



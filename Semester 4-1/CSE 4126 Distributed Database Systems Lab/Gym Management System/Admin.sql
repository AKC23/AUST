clear screen;
set linesize 32767;
drop table Admins;

create table Admins(Admin_Id number, AName VARCHAR2(20), Age number, Gender VARCHAR2(20), bg VARCHAR2(20), NID VARCHAR2(20), mn varchar2(11), Email VARCHAR2(20));

-- Admin (Admin_Id, Month, Year, SL. No. Name, Age, Gender, Picture, Blood Group, NID, Mobile No., Email)

insert into Admins values(1,'Hiru',45, 'Male','O+', '1313555555', '01677192720', 'hiru38@gmail.com');
insert into Admins values(1,'Zakir',50, 'Male','O+', '1212775557', '01177192720', 'zakir2@gmail.com');


BEGIN
	dbms_lock.sleep(1);
END;
/

select * from Admins;

commit;


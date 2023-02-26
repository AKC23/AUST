set serveroutput on;
set verify OFF;



drop table Customer CASCADE CONSTRAINTS;
drop table ShiftDetails CASCADE CONSTRAINTS;
drop table Server CASCADE CONSTRAINTS;
drop table Food CASCADE CONSTRAINTS;
drop table Orders CASCADE CONSTRAINTS;

create table Customer(
	cid int,
	cname VARCHAR2(50), 
	phone VARCHAR2(15),
	PRIMARY KEY (cid));
	
create table ShiftDetails(
	shiftid int,
	duration_hours VARCHAR2(50), 
	PRIMARY KEY (shiftid));
	
create table Server(
	sid int,
	sname VARCHAR2(50), 
	shiftid int,
	PRIMARY KEY (sid),
	FOREIGN KEY (shiftid) REFERENCES ShiftDetails (shiftid));

create table Food(
	fid int,
	fname VARCHAR2(50), 
	price int,
	PRIMARY KEY (fid));
	
create table Orders(
	oid int,
	sid int, 
	cid int,
	fid int,
	datePlaced date,
	FOREIGN KEY (sid) REFERENCES Server (sid),
	FOREIGN KEY (cid) REFERENCES Customer (cid),
	FOREIGN KEY (fid) REFERENCES Food (fid));

insert into Customer(cid, cname, phone) values (1,'Shadhin','01711122333');
insert into Customer(cid, cname, phone) values (2,'Shahrin','01711122334');
insert into Customer(cid, cname, phone) values (3,'Ramisa','01711122335');
insert into Customer(cid, cname, phone) values (4,'Maisha','01711122336');
insert into Customer(cid, cname, phone) values (5,'Jim','01711122337');


insert into ShiftDetails(shiftid, duration_hours) values (1,5);
insert into ShiftDetails(shiftid, duration_hours) values (2,8);


insert into Server(sid, sname, shiftid) values (1,'mohammad',1);
insert into Server(sid, sname, shiftid) values (2,'ahmed',1);
insert into Server(sid, sname, shiftid) values (3,'abdullah',2);
insert into Server(sid, sname, shiftid) values (4,'masud',2);
insert into Server(sid, sname, shiftid) values (5,'mamun',1);



insert into Food(fid, fname, price) values (1,'tacos',199);
insert into Food(fid, fname, price) values (2,'nachos',159);
insert into Food(fid, fname, price) values (3,'fried rice',299);
insert into Food(fid, fname, price) values (4,'chicken fry',99);
insert into Food(fid, fname, price) values (5,'milkshake',149);


insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,1,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,2,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,3,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,4,'11-Feb-22');

insert into Orders(oid, sid, cid, fid, datePlaced) values (2,3,3,1,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (2,3,3,2,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (2,3,3,3,'11-Feb-22');

insert into Orders(oid, sid, cid, fid, datePlaced) values (3,2,2,1,'12-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (3,2,2,2,'12-Feb-22');

insert into Orders(oid, sid, cid, fid, datePlaced) values (4,2,5,3,'12-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (4,2,5,4,'12-Feb-22');

insert into Orders(oid, sid, cid, fid, datePlaced) values (5,1,4,1,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (5,1,4,2,'13-Feb-22');

insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,1,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,2,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,3,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,5,'13-Feb-22');



SELECT * FROM Orders;
SELECT * FROM Customer;
SELECT * FROM Food;
SELECT * FROM SERVER;
SELECT * FROM ShiftDetails;


ACCEPT X NUMBER PROMPT "ENTER ORDER ID = "

DECLARE
	A NUMBER;
	OID_ORDER Orders.oid %TYPE;
	FID_ORDER Orders.fid %TYPE;
	SID_ORDER Orders.sid %TYPE;
	
	FID_Food Food.fid %TYPE;
	PRICE_Food Food.price %TYPE;
	SUMM int:= 0;
	
	SID_Server Server.sid %TYPE;
	SNAME_Server Server.sname %TYPE;
	SHIFTID_Server Server.shiftid %TYPE;
	
BEGIN 

	A := &X;
	
	FOR O IN (SELECT * FROM Orders) LOOP
		OID_ORDER := O.oid;
		FID_ORDER := O.fid;
		SID_ORDER := O.sid;
		
		IF OID_ORDER = A THEN
			-- isODD;
			-- DBMS_OUTPUT.PUT_LINE(OID_ORDER); 
			-- DBMS_OUTPUT.PUT_LINE(FID_ORDER);
			
			FOR F IN (SELECT * FROM Food) LOOP
			FID_Food := F.fid;
			PRICE_Food := F.price;
			--DBMS_OUTPUT.PUT_LINE(FID_ORDER); 
				IF FID_Food = FID_ORDER THEN
					SUMM := SUMM + PRICE_Food;
				END IF;
				
			END LOOP;
			
			FOR S IN (SELECT * FROM SERVER) LOOP
				SID_Server := S.sid;
				SNAME_Server := S.sname;
				SHIFTID_Server := S.shiftid;
				-- DBMS_OUTPUT.PUT_LINE(SID_order); 
				
				IF SID_Server = SID_ORDER THEN
					DBMS_OUTPUT.PUT_LINE(SID_Server || SNAME_Server || SHIFTID_Server); 
				END IF;
				
			END LOOP;
		ELSE
			insert into Orders(oid, sid, cid, fid, datePlaced) 
			values (A,5,1,1,'28-Feb-22');
			
		END IF;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('SUM OF ORDER ' || SUMM);	
	DBMS_OUTPUT.PUT_LINE('Order Recieved'); 
END;
/


/*
CREATE or REPLACE PROCEDURE isODD
IS


BEGIN 



END;
/








*/


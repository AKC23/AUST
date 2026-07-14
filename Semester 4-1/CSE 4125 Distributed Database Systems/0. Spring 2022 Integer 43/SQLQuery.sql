
drop table R
drop table S 
drop table T 

CREATE TABLE R(
A VARCHAR(255),
B INT,
C VARCHAR(255),
)
CREATE TABLE S(
A VARCHAR(255),
B INT,
C VARCHAR(255),
)
CREATE TABLE T(
B INT,
C VARCHAR(255),
D INT
)

INSERT INTO R VALUES
('a',1, 'a'),
('b',1, 'b'),
('a',1, 'd'),
('b',2, 'f')


INSERT INTO S VALUES
('a',1, 'a'),
('a',3, 'f')

INSERT INTO T VALUES
(1, 'a',1),
(3, 'b',1),
(3, 'c',2),
(1, 'b',4),
(2, 'a',3)

select * from R

select * from S

select * from T


SELECT R.A,R.B,R.C
FROM R CROSS JOIN S where R.C = S.C;

SELECT R.A,R.B,R.C,S.A,S.B,S.C
FROM R CROSS JOIN S;

SELECT R.A,R.B,R.C,S.A,S.B,S.C
FROM R CROSS JOIN S where R.C = S.C;


SELECT R.A,R.B,R.C,S.A,S.B,S.C
FROM R INNER JOIN S ON R.C = S.C;


SELECT R.A,R.B,R.C,S.A,S.B,S.C
FROM R LEFT SEMIJOIN S ON R.C = S.C;

SELECT * FROM R WHERE R.C IN (SELECT S.C FROM S)





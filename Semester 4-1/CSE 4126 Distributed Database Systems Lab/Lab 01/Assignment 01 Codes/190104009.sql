drop table Artist;
drop table Album;
DROP TABLE Track;
CREATE TABLE Artist
(artistID INTEGER,name VARCHAR2(20),age INTEGER,gender VARCHAR2(20));

INSERT INTO Artist VALUES(1000, 'Jackson', 25, 'M');

INSERT INTO Artist VALUES(1001, 'Swift', 23, 'F');

INSERT INTO Artist VALUES(1002, 'Martin', 27, 'M');

INSERT INTO Artist VALUES(1003, 'Eminem', 25, 'M');

INSERT INTO Artist VALUES(1004, 'Selena', 22, 'F');

INSERT INTO Artist VALUES(1005, 'Rob', 25, 'M');

select * from Artist;

CREATE TABLE Album
(albumID INTEGER, albumTitle VARCHAR2(20), artistID INTEGER, certification VARCHAR2(20),numberOfTracks INTEGER);

INSERT INTO Album VALUES(2000, 'Thriller', 1000, 'Platinum', 12);

INSERT INTO Album VALUES(2001, 'Midnights', 1001, 'Gold', 7);

INSERT INTO Album VALUES(2002, 'Coldplay', 1002, 'Diamond', 10);

INSERT INTO Album VALUES(2003, 'Recovery', 1003, 'Diamond', 8);

INSERT INTO Album VALUES(2004, 'Revival', 1004, 'Silver', 5);

INSERT INTO Album VALUES(2005, 'Forgive', 1005, 'Platinum', 4);

INSERT INTO Album VALUES(2004, 'Moon', 1004, 'Silver', 5);

INSERT INTO Album VALUES(2004, 'Enemy', 1003, 'Silver', 3);

INSERT INTO Album VALUES(2004, 'Star', 1002, 'Silver', 10);

INSERT INTO Album VALUES(2004, 'Noon', 1004, 'Silver', 2);

select * from Album;

CREATE TABLE Track
(trackID INTEGER primary key,trackTitle VARCHAR2(20),genre VARCHAR2(10),albumID INTEGER, published DATE );

INSERT INTO Track VALUES(3000, 'Beat It', 'Rock', 2000, TO_DATE('1990-04-07','YYYY-MM-DD'));

INSERT INTO Track VALUES(3001, 'Maroon', 'P', 2001, TO_DATE('2022-06-08','YYYY-MM-DD'));

INSERT INTO Track VALUES(3002, 'Hymn', 'Indie', 2002, TO_DATE('2015-05-07','YYYY-MM-DD'));

INSERT INTO Track VALUES(3003, 'Love the Way You Lie', 'Rap', 2003, TO_DATE('2012-04-07','YYYY-MM-DD'));

INSERT INTO Track VALUES(3004, 'Back to You', 'P', 2004, TO_DATE('2018-04-07','YYYY-MM-DD'));

INSERT INTO Track VALUES(3005, 'Now You', 'Rap', 2005, TO_DATE('2021-04-07','YYYY-MM-DD'));

select * from Track;

SELECT trackID, trackTitle, genre, published, Album.certification
FROM Track
INNER JOIN Album ON Track.albumID = Album.albumID where published Between TO_DATE('2021-01-01','YYYY-MM-DD') AND TO_DATE('2021-12-31','YYYY-MM-DD') AND Album.certification = 'Platinum';

select name from Artist inner join Album
on Artist.artistID = Album.artistID where Album.certification = 'Silver' group by Artist.name HAVING count(Album.albumID) >= 3;

select avg(age) AS AVERAGE_AGE from Artist inner join Album
on Artist.artistID = Album.artistID where numberOfTracks >= 10 having count(Album.artistID) >= 3;
COMMIT;

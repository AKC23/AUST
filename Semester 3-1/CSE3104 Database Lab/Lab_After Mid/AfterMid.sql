
Create Database AfterMid

drop table AggregateFuncOrder

create table AggregateFuncOrder
(
O_Id int,
OrderDate date,
OrderPrice int,
Customer varchar(255)
)


INSERT INTO AggregateFuncOrder VALUES
(111, '2021-10-20', 23, 'London'),  
(112, '2018-08-10', 26, 'Dhaka'),  
(113, '2021-10-10', 12, 'Chottogram'),  
(114, '2010-05-20', 11, 'Sylhet'),  
(115, '2017-01-04', 15, 'New York') 

select * from AggregateFuncOrder

select AVG(OrderPrice) AS OrderPriceAverage from AggregateFuncOrder

/*Find the customers that have an OrderPrice value higher than the average OrderPrice 
value. */

select customer from AggregateFuncOrder 
where OrderPrice > (select AVG(OrderPrice) from AggregateFuncOrder)

select customer from AggregateFuncOrder 
where OrderPrice > (select AVG(OrderPrice) AS OrderPriceAverage from AggregateFuncOrder)

/*
The COUNT(DISTINCT column_name) function returns the number of 
distinct values of the specified column 
*/

SELECT COUNT(DISTINCT Customer) AS CountDistinctCustomer FROM AggregateFuncOrder 


SELECT COUNT(*) AS CustomerOrders FROM AggregateFuncOrder 


/*  we want to find the first value of the "OrderPrice" column */
select * from AggregateFuncOrder

SELECT OrderPrice FROM AggregateFuncOrder ORDER BY O_Id LIMIT 2

select top 1 * from AggregateFuncOrder order by OrderPrice
 
select top 1 * from AggregateFuncOrder order by OrderPrice desc 
 
SELECT first(OrderPrice) AS FirstOrderPrice FROM AggregateFuncOrder 

SELECT LAST(OrderPrice) AS LastOrderPrice FROM AggregateFuncOrder

SELECT OrderPrice FROM Orders ORDER BY O_Id DESC LIMIT 1 

 

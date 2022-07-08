USE mainassessment;

SELECT Snum, Snum, City, Comm
FROM SalesPeople;
GO

SELECT DISTINCT Snum
FROM Orders;
GO

SELECT Snum, Comm
FROM SalesPeople
WHERE City = 'mumbai';
GO

SELECT Cname 
FROM Customers
WHERE Rating = 100;
GO

SELECT Onum, AMT, Odate
FROM Orders;
GO

SELECT Cname, City, Rating
FROM Customers
WHERE City = 'mumbai' AND Rating > 200;
GO

SELECT Cname, City, Rating
FROM Customers
WHERE City = 'chennai' OR Rating > 200;
GO

SELECT *
FROM Orders
WHERE AMT > 1000;
GO

SELECT Sname, City, Comm
FROM SalesPeople
WHERE City = 'mumbai' AND Comm > 0.11;
GO

SELECT Cname, City, Rating
FROM Customers
WHERE Rating <= 100 OR City = 'kerala';
GO

SELECT Sname, City
FROM SalesPeople
WHERE City IN ('bangalore','pune');
GO

SELECT Sname, Comm
FROM SalesPeople
WHERE Comm > 0.10 AND Comm < 0.12;
GO

SELECT Cname, City
FROM Customers
WHERE City IS NULL;
GO

SELECT *
FROM Orders
WHERE Odate IN ('03-OCT-94','04-OCT-94');
GO

SELECT Cname
FROM Customers, Orders
WHERE Orders.Cnum = Customers.Cnum 
AND Orders.Snum IN( SELECT Snum FROM SalesPeople WHERE Sname IN ('abdul','ajith'));
GO

SELECT Cname
FROM Customers
WHERE Cname LIKE 'A%' OR Cname LIKE 'B%';
GO

SELECT *
FROM Orders
WHERE AMT != 0 OR AMT IS NOT NULL;
GO

SELECT COUNT(DISTINCT Snum) AS 'salespeople currently listing orders'
FROM Orders;
GO

SELECT Snum, Odate, MAX(AMT) AS 'Largest order'
FROM Orders
GROUP BY Odate, Snum
ORDER BY Odate,Snum;
GO

SELECT Snum, Odate, MAX(AMT) AS 'Largest order'
FROM Orders
WHERE AMT > 3000
GROUP BY Odate, Snum
ORDER BY Odate, Snum;
GO

--21.Which day had the hightest total amount ordered.
SELECT Odate, AMT, Snum, Cnum
FROM Orders
WHERE AMT = ( SELECT MAX(AMT) FROM Orders);
GO

--22.Count all orders for Oct 3rd.
SELECT COUNT(*) AS 'Orders on Oct 3rd'
FROM Orders
WHERE Odate = '03-OCT-94';
GO

--23.Count the number of different non NULL city values in customers table.
SELECT COUNT(DISTINCT City)
FROM Customers;
GO

--24.Select each customer’s smallest order.
SELECT Cnum, MIN(AMT)
FROM Orders
GROUP BY Cnum;
GO 

--25.First customer in alphabetical order whose name begins with G.
SELECT MIN(Cname)
FROM Customers
WHERE Cname LIKE 'G%';
GO


SELECT 'For'  (CONVERT(varchar(10), GETDATE(),120)) || 'there are' || COUNT(*) || 'Orders'
FROM Orders
GROUP BY Odate;
GO

SELECT Onum, Snum, AMT, AMT * 0.12 AS 'Commission'
FROM Orders
ORDER BY Snum;
GO


Select 'For the city (' || City || '), the highest rating is : (' || MAX(Rating) || ')'
FROM Customers
GROUP BY city;


SELECT Odate, COUNT(Onum) AS 'Total No of Orders'
FROM Orders
GROUP BY Odate
ORDER BY COUNT(Onum) DESC;
GO


SELECT Sname, Cname, S.City AS City
FROM SalesPeople AS S, Customers AS C
WHERE S.City = C.City;
GO


SELECT Cname, Sname 
FROM Customers AS C, SalesPeople AS S
WHERE C.Snum = S.Snum;
GO

SELECT Onum, Cname
FROM Customers AS C, Orders AS O
WHERE O.Cnum = C.Cnum;
GO

SELECT Onum, Sname, Cname
FROM Orders AS O, Customers AS C, SalesPeople AS S
WHERE O.Cnum = C.Cnum and O.Snum = S.Snum;
GO

SELECT Cname, Sname, Comm
FROM Customers AS C, SalesPeople AS S
WHERE Comm > 0.12 AND C.Snum = S.Snum;
GO

SELECT Sname, AMT*Comm, Rating
FROM Customers AS C, SalesPeople AS S, Orders AS O
WHERE Rating > 100 AND 
        S.Snum = C.Snum AND 
        S.Snum = O.Snum AND 
        O.Cnum = C.Cnum;
GO

SELECT a.Cname, b.Cname, a.Rating
FROM Customers a, Customers b
WHERE a.Rating = b.Rating and a.Cnum != b.Cnum;
GO

--37.Find all pairs of customers having the same rating, each pair coming once only.
SELECT a.Cname, b.Cname, a.Rating
FROM Customers a, Customers b
WHERE a.Rating = b.Rating AND a.Cnum != b.Cnum AND a.Cnum < b.Cnum;
GO

Select Cname, Sname
FROM SalesPeople, Customers
WHERE Sname IN  ( SELECT Sname FROM salespeople WHERE rownum <= 3)
ORDER BY Cname;
GO

SELECT Cname
FROM Customers
WHERE City IN ( SELECT City FROM Customers AS C, Orders AS O
                WHERE C.Cnum = O.Cnum AND 
                    O.Snum IN ( SELECT Snum FROM SalesPeople 
                                WHERE Sname = 'jon'));
GO

SELECT DISTINCT a.Cname
FROM Customers a ,Customers b
WHERE a.Snum = b.Snum and a.Cnum != b.Cnum;
GO

SELECT a.Sname, b.Sname
FROM SalesPeople a, SalesPeople b
WHERE a.Snum > b.Snum AND a.City = b.City;
GO

SELECT c.Cname, a.Onum, b.Onum
FROM Orders a, Orders b, Customers c
WHERE a.Cnum = b.Cnum AND 
        a.Onum > b.Onum AND 
        c.Cnum = a.Cnum;
GO

SELECT Cname, City
FROM Customers
WHERE Rating = (SELECT Rating FROM Customers WHERE Cname = 'arun') AND Cname != 'arun';
GO

SELECT Onum
FROM Orders
WHERE Snum = ( SELECT Snum FROM SalesPeople WHERE Sname = 'salman');
GO

SELECT Onum, sname, Cname, AMT
from Orders AS O, SalesPeople AS S, Customers C
where O.Snum = S.Snum AND O.Cnum = C.Cnum AND
          O.Snum = ( SELECT Snum FROM Orders
                        WHERE Cnum = ( SELECT Cnum FROM Customers
                                        WHERE Cname = 'vishwa'));
GO

SELECT *
FROM Orders
WHERE AMT > ( SELECT AVG(AMT) FROM Orders
                WHERE Odate = '03-OCT-94');
GO
.
SELECT AVG(Comm)
FROM SalesPeople
WHERE City = 'chennai';
GO

SELECT Snum, Cnum
FROM Orders
WHERE Cnum IN (SELECT Cnum FROM Customers WHERE City = 'chennai');
GO

SELECT Comm
FROM SalesPeople
WHERE Snum IN (SELECT Snum FROM Customers WHERE City = 'mumbai');
GO

SELECT Cnum, Cname from Customers
where Cnum > ( SELECT Snum + 1000
                FROM SalesPeople
                WHERE Sname = 'mumbai');
GO



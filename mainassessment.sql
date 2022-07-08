CREATE DATABASE mainassessment;
GO

USE mainassessment; 
GO

CREATE TABLE SalesPeople (

    Snum INT NOT NULL PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Comm FLOAT
);
GO

INSERT INTO SalesPeople
VALUES
    (1001,'abdul','chennai',0.12),
    (1002,'monesh','mumbai',0.13),
    (1004,'jon','mumbai',0.11),
    (1007,'salman','bangalore',0.15),
    (1003,'ajith','pune',0.1);
GO


CREATE TABLE Customers (

    Cnum INT NOT NULL,
    Cname VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Rating INT,
    Snum INT NOT NULL,
    CONSTRAINT PK_Customers_Cnum PRIMARY KEY(Cnum),
    CONSTRAINT FK_Customers_Snum FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum)
);
GO

INSERT INTO Customers
VALUES 
    (2001,'kiruba','chennai',100,1001),
    (2002,'arun','ooty',200,1003),
    (2003,'nishanth','mumbai',300,1002),
    (2004,'lokash','mumbai',100,1002),
    (2006,'vishnu','chennai',300,1007),
    (2007,'vishwa','kerala',100,1004);
GO


CREATE TABLE Orders (

    Onum INT NOT NULL,
    AMT FLOAT NOT NULL,
    Odate DATE NOT NULL,
    Cnum INT NOT NULL,
    Snum INT NOT NULL,
    CONSTRAINT PK_Orders_Onum PRIMARY KEY(Onum),
    CONSTRAINT FK_Orders_Cnum FOREIGN KEY(Cnum) REFERENCES Customers(Cnum),
    CONSTRAINT FK_Orders_Snum FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum)
);
GO

INSERT INTO Orders
VALUES
    (3001,18.69,'03-OCT-94',2004,1007),
    (3003,767.19,'03-OCT-94',2001,1001),
    (3002,1900.10,'03-OCT-94',2007,1004),
    (3005,5160.45,'03-OCT-94',2003,1002),
    (3006,1098.16,'04-OCT-94',2004,1007),
    (3009,1713.23,'04-OCT-94',2002,1003),
    (3007,75.75,'05-OCT-94',2004,1002),
    (3008,4723.00,'05-OCT-94',2006,1001),
    (30010,1309.95,'06-OCT-94',2004,1002),
    (30011,9891.88,'06-OCT-94',2006,1001);
GO
-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'DatabaseName'
)
CREATE DATABASE Testing_Bai6_SQL
GO

USE Testing_Bai6_SQL

CREATE TABLE CustomerDetails (
    CusID varchar(10) NOT NULL PRIMARY KEY,
    CusName Nvarchar(100) NOT NULL,
    CusAddress Nvarchar(255),
    CusPhone varchar(15),
);
GO

CREATE TABLE ProductDetails (
    ProductID int NOT NULL PRIMARY KEY,
    ProductName Nvarchar(255) NOT NULL,
    Description Nvarchar(255),
    Unit varchar(50),
    Price money
);
GO

CREATE TABLE OrderTable (
    OrderID int NOT NULL PRIMARY KEY,
    CusID varchar(10) FOREIGN KEY REFERENCES CustomerDetails(CusID),
    OrderDate date,
    ProductID int FOREIGN KEY REFERENCES ProductDetails(ProductID),
    Price money,
    Quantity int,
    Summary money
);
GO

CREATE TABLE Report (
    ReportID int NOT NULL PRIMARY KEY,
    OrderID int FOREIGN KEY REFERENCES OrderTable(OrderID),
    SumTotalPrice money
);
GO

INSERT INTO CustomerDetails (CusID,CusName,CusAddress,CusPhone)
VALUES (836, 'Nguyễn Văn An', '111 Nguyễn Trãi, Thanh Xuân, Hà Nội ', '0987654321'),
(238, 'Lê Quý Vượng', '222 Nguyễn Trãi, Thanh Xuân, Hà Nội ', '0982434321'),
(452, 'Văn Tiến Huy', '333 Nguyễn Trãi, Thanh Xuân, Hà Nội ', '0912524321');
GO

INSERT INTO ProductDetails (ProductID, ProductName, Description, Unit, Price)
VALUES (450, 'Máy Tính T450', 'Máy nhập mới', 'Chiếc', 1000),
(5670, 'Điện thoại Nokia 5670', 'Điện thoại đang Hot', 'Chiếc', 200),
(320, 'Máy In Samsung 450', 'Máy in đang ế', 'Chiếc', 2000),
(890, 'Điện thoại Nokia 1234', 'Điện thoại đang Hot', 'Chiếc', 500),
(338, 'Máy In Samsung 222', 'Máy in đang ế', 'Chiếc', 4500),
(225, 'Điện thoại Nokia 875', 'Điện thoại đang Hot', 'Chiếc', 8700),
(825, 'Máy In Samsung 09u7', 'Máy in đang ế', 'Chiếc', 11100);
GO

INSERT INTO OrderTable (OrderID, CusID, OrderDate, ProductID, Quantity)
VALUES 
(1, 836, '2024-07-24', 450, 1),
(2, 836, '2024-07-24', 5670, 1),
(3, 836, '2024-07-24', 320, 5),
(4, 238, '2024-07-24', 890, 7),
(5, 238, '2024-07-24', 225, 9),
(6, 238, '2024-07-24', 338, 12),
(7, 238, '2024-07-24', 320, 15),
(8, 452, '2024-07-24', 5670, 3),
(9, 452, '2024-07-24', 338, 5),
(10, 452, '2024-07-24', 320, 4),
(11, 452, '2024-07-24', 450, 6),
(12, 452, '2024-07-24', 825, 2);
GO

UPDATE OrderTable
SET OrderTable.Price = ProductDetails.Price
FROM OrderTable
JOIN ProductDetails ON OrderTable.ProductID = ProductDetails.ProductID;

UPDATE OrderTable
SET Summary = Price * Quantity;

SELECT SUM(Summary) AS total
FROM OrderTable;

ALTER TABLE OrderTable
DROP CONSTRAINT FK_ProductID;

SELECT * FROM OrderTable
USE master
GO
-- Câu 1 - bài 7
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'DatabaseName'
)
CREATE DATABASE Testing_Bai7_SQL
GO

-- Câu 2 - bài 7

CREATE TABLE ProductList (
    Product_NameID varchar(10) NOT NULL PRIMARY KEY,
    Product_Name Nvarchar(255) NOT NULL,
    Product_Des Nvarchar(255),
);
GO
------------------
CREATE TABLE Responsibility (
    Person_ID varchar(10) NOT NULL PRIMARY KEY,
    Person_Name Nvarchar(100) NOT NULL,
    Person_Address Nvarchar(255),
    Person_Phone varchar(15),
);
GO
------------------
CREATE TABLE Storage (
    ProductID varchar(10) NOT NULL PRIMARY KEY,
    Storage_Date DATE NOT NULL,
    Product_NameID varchar(10) FOREIGN KEY REFERENCES ProductList(Product_NameID),
    Product_Name Nvarchar(255) NOT NULL,
    Person_Name Nvarchar(100) NOT NULL,
    Person_ID varchar(10) FOREIGN KEY REFERENCES Responsibility(Person_ID)
);
GO

-- Câu 3 - bài 7
------------------
INSERT INTO ProductList (Product_NameID, Product_Name, Product_Des) VALUES
('i3', 'Chip Intel core i3', 'From 2013'),
('i5', 'Chip Intel core i5', 'From 2015'),
('i7', 'Chip Intel core i7', 'From 2017'),
('i9', 'Chip Intel core i9', 'From 2019'),
('i11', 'Chip Intel core i11', 'From 2021'),
('RTX 10xx', 'VGA Nvidia RTX 10xx', '1030, 1060, 1070'),
('RTX 20xx', 'VGA Nvidia RTX 20xx', '2030, 2060, 2070, 2080'),
('RTX 30xx', 'VGA Nvidia RTX 30xx', '3030, 3060, 3070, 3080'),
('RTX 40xx', 'VGA Nvidia RTX 40xx', '4030, 4060, 4070, 4080'),
('AMD 5xxx', 'VGA AMD Radeon 5xxx', '5055, 5500, 5750');
------------------
INSERT INTO Responsibility (Person_ID, Person_Name, Person_Address, Person_Phone) VALUES
('R001', 'John Smith', '123 Main St, Springfield', '555-123-4567'),
('R002', 'Jane Doe', '456 Elm St, Shelbyville', '555-234-5678'),
('R003', 'Michael Johnson', '789 Maple Ave, Capital City', '555-345-6789'),
('R004', 'Emily Davis', '101 Oak St, Ogdenville', '555-456-7890'),
('R005', 'William Brown', '202 Pine St, North Haverbrook', '555-567-8901');
------------------
INSERT INTO Storage (ProductID, Storage_Date, Product_NameID, Product_Name, Person_Name, Person_ID) VALUES
('S001', '2024-01-01', 'i3', 'Chip Intel core i3', 'John Smith', 'R001'),
('S002', '2024-01-02', 'i5', 'Chip Intel core i5', 'Jane Doe', 'R002'),
('S003', '2024-01-03', 'i3', 'Chip Intel core i3', 'John Smith', 'R001'),
('S004', '2024-01-04', 'i9', 'Chip Intel core i9', 'Emily Davis', 'R004'),
('S005', '2024-01-05', 'i11', 'Chip Intel core i11', 'William Brown', 'R005'),
('S006', '2024-01-06', 'RTX 40xx', 'VGA Nvidia RTX 40xx', 'John Smith', 'R001'),
('S007', '2024-01-07', 'AMD 5xxx', 'VGA AMD Radeon 5xxx', 'Jane Doe', 'R002'),
('S008', '2024-01-08', 'AMD 5xxx', 'VGA AMD Radeon 5xxx', 'John Smith', 'R001'),
('S009', '2024-01-09', 'RTX 40xx', 'VGA Nvidia RTX 40xx', 'Emily Davis', 'R004'),
('S010', '2024-01-10', 'AMD 5xxx', 'VGA AMD Radeon 5xxx', 'Emily Davis', 'R004'),
('S011', '2024-01-11', 'i5', 'Chip Intel core i5', 'Jane Doe', 'R002'),
('S012', '2024-01-12', 'i5', 'Chip Intel core i5', 'John Smith', 'R001'),
('S013', '2024-01-13', 'RTX 40xx', 'VGA Nvidia RTX 40xx', 'Emily Davis', 'R004'),
('S014', '2024-01-14', 'i9', 'Chip Intel core i9', 'William Brown', 'R005'),
('S015', '2024-01-15', 'i11', 'Chip Intel core i11', 'Jane Doe', 'R002'),
('S016', '2024-01-16', 'RTX 10xx', 'VGA Nvidia RTX 10xx', 'Jane Doe', 'R002'),
('S017', '2024-01-17', 'i5', 'Chip Intel core i5', 'Emily Davis', 'R004'),
('S018', '2024-01-18', 'i11', 'Chip Intel core i11', 'Jane Doe', 'R002'),
('S019', '2024-01-19', 'i11', 'Chip Intel core i11', 'William Brown', 'R005'),
('S020', '2024-01-20', 'AMD 5xxx', 'VGA AMD Radeon 5xxx', 'John Smith', 'R001');

-- Câu 4 - bài 7
SELECT * FROM ProductList
SELECT * FROM Responsibility
SELECT * FROM Storage

-- Câu 5 - bài 7
SELECT *
FROM ProductList
ORDER BY Product_Name ASC;
------------------
SELECT *
FROM Responsibility
ORDER BY Person_Name ASC;
------------------
SELECT * FROM Storage
WHERE Product_NameID='i5';
------------------
SELECT *
FROM Storage
WHERE Person_ID='R001'
ORDER BY ProductID DESC;

-- Câu 6 - bài 7
SELECT Product_NameID,
COUNT(ProductID) AS Count_ProductID
FROM Storage
GROUP BY Product_NameID

SELECT Product_NameID,
COUNT(ProductID) AS Count_ProductID,
COUNT(DISTINCT ProductID) AS CountDistinct_ProductID,
AVG(CountDistinct_ProductID) AS Avg_ProductID
FROM Storage
GROUP BY Product_NameID
------------------
SELECT Product_Des
FROM ProductList
INNER JOIN Storage ON ProductList.Product_NameID = Storage.Product_NameID;

SELECT Product_NameID, Product_Name, Product_Des, ProductID
FROM Storage
ORDER BY Product_NameID ASC;
------------------
SELECT Person_Address, Person_Phone
FROM Responsibility
INNER JOIN Storage ON Responsibility.Person_ID = Storage.Person_ID;

SELECT ProductID, Product_Name, Person_Name, Person_ID, Person_Address, Person_Phone
FROM Storage
ORDER BY Product_Name ASC;

-- Câu 7 - bài 7
UPDATE Storage SET Storage_Date = '2019-05-15' WHERE ProductID = 'S001';
UPDATE Storage SET Storage_Date = '2020-08-21' WHERE ProductID = 'S002';
UPDATE Storage SET Storage_Date = '2021-02-10' WHERE ProductID = 'S003';
UPDATE Storage SET Storage_Date = '2022-03-25' WHERE ProductID = 'S004';
UPDATE Storage SET Storage_Date = '2023-11-05' WHERE ProductID = 'S005';
UPDATE Storage SET Storage_Date = '2019-12-30' WHERE ProductID = 'S006';
UPDATE Storage SET Storage_Date = '2020-07-14' WHERE ProductID = 'S007';
UPDATE Storage SET Storage_Date = '2021-09-23' WHERE ProductID = 'S008';
UPDATE Storage SET Storage_Date = '2022-04-11' WHERE ProductID = 'S009';
UPDATE Storage SET Storage_Date = '2023-06-08' WHERE ProductID = 'S010';
UPDATE Storage SET Storage_Date = '2019-01-19' WHERE ProductID = 'S011';
UPDATE Storage SET Storage_Date = '2020-10-28' WHERE ProductID = 'S012';
UPDATE Storage SET Storage_Date = '2021-05-30' WHERE ProductID = 'S013';
UPDATE Storage SET Storage_Date = '2022-08-15' WHERE ProductID = 'S014';
UPDATE Storage SET Storage_Date = '2023-03-19' WHERE ProductID = 'S015';
UPDATE Storage SET Storage_Date = '2019-04-25' WHERE ProductID = 'S016';
UPDATE Storage SET Storage_Date = '2020-09-09' WHERE ProductID = 'S017';
UPDATE Storage SET Storage_Date = '2021-11-30' WHERE ProductID = 'S018';
UPDATE Storage SET Storage_Date = '2022-06-22' WHERE ProductID = 'S019';
UPDATE Storage SET Storage_Date = '2023-12-01' WHERE ProductID = 'S020';
------------------
-- Tìm khóa chính
SELECT
    tc.table_name,
    kcu.column_name
FROM
    information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
WHERE
    tc.constraint_type = 'PRIMARY KEY';

-- Tìm khóa ngoại
SELECT
    tc.table_name AS foreign_table,
    kcu.column_name AS foreign_column,
    ccu.table_name AS primary_table,
    ccu.column_name AS primary_column
FROM
    information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
WHERE
    tc.constraint_type = 'FOREIGN KEY';
------------------
ALTER TABLE Storage
ADD Version varchar(50);

UPDATE Storage SET Version = 
    CASE Product_Name
        WHEN 'Chip Intel core i3' THEN 'v1.0'
        WHEN 'Chip Intel core i5' THEN 'v2.0'
        WHEN 'Chip Intel core i7' THEN 'v3.0'
        WHEN 'Chip Intel core i9' THEN 'v4.0'
        WHEN 'Chip Intel core i11' THEN 'v5.0'
        WHEN 'VGA Nvidia RTX 10xx' THEN 'v1.1'
        WHEN 'VGA Nvidia RTX 20xx' THEN 'v2.1'
        WHEN 'VGA Nvidia RTX 30xx' THEN 'v3.1'
        WHEN 'VGA Nvidia RTX 40xx' THEN 'v4.1'
        WHEN 'VGA AMD Radeon 5xxx' THEN 'v5.1'
        ELSE 'v1.0'
    END;
-------------------

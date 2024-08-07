----------- Câu 1 -------------
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'DatabaseName'
)
CREATE DATABASE BaitaphetmonSQL_Tung
GO

----------- Câu 2 -------------
USE BaitaphetmonSQL_Tung

CREATE TABLE Department (
    DepartId int PRIMARY KEY,
    DepartName varchar(50) NOT NULL,
    Description varchar(100) NOT NULL
);
GO

CREATE TABLE Employee (
    EmpCode char(6) PRIMARY KEY,
    FirstName varchar(30) NOT NULL,
    LastName varchar(30) NOT NULL,
    Birthday smalldatetime NOT NULL,
    Gender bit,
    Address varchar(100),
    DepartID int Foreign key references Department(DepartId),
    Salary money
);
GO

----------- Câu 3 -------------
INSERT INTO Department (DepartId, DepartName, Description) 
VALUES 
(1, 'Kinh doanh', 'Phụ trách hoạt động kinh doanh'),
(2, 'Tiếp thị', 'Quản lý các chiến dịch tiếp thị'),
(3, 'Nhân sự', 'Chịu trách nhiệm tuyển dụng và phúc lợi nhân viên'),
(4, 'Tài chính', 'Quản lý tài chính của công ty'),
(5, 'CNTT', 'Phụ trách hạ tầng và phát triển phần mềm'),
(6, 'Vận hành', 'Giám sát hoạt động hàng ngày'),
(7, 'Logistics', 'Quản lý chuỗi cung ứng và logistics'),
(8, 'Dịch vụ khách hàng', 'Giải quyết thắc mắc và hỗ trợ khách hàng'),
(9, 'Nghiên cứu & Phát triển', 'Thực hiện nghiên cứu và phát triển'),
(10, 'Đảm bảo chất lượng', 'Đảm bảo chất lượng sản phẩm'),
(11, 'Pháp lý', 'Quản lý các vấn đề pháp lý'),
(12, 'Hành chính', 'Phụ trách các công việc hành chính'),
(13, 'Mua sắm', 'Quản lý hoạt động mua sắm'),
(14, 'Sản xuất', 'Giám sát các quy trình sản xuất'),
(15, 'An ninh', 'Đảm bảo an ninh vật lý và kỹ thuật số'),
(16, 'Bảo trì', 'Chịu trách nhiệm bảo trì thiết bị'),
(17, 'Đào tạo', 'Phụ trách các chương trình đào tạo nhân viên'),
(18, 'Tuân thủ', 'Đảm bảo tuân thủ quy định'),
(19, 'Quan hệ công chúng', 'Quản lý hình ảnh công chúng và truyền thông'),
(20, 'Kế hoạch chiến lược', 'Phát triển các chiến lược dài hạn');

INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary) 
VALUES 
('E00001', 'Nguyễn', 'Văn A', '1985-02-15', 1, '123 Đường Chính', 1, 55000000),
('E00002', 'Trần', 'Thị B', '1990-07-08', 0, '456 Đường Phụ', 2, 60000000),
('E00003', 'Lê', 'Văn C', '1978-11-22', 1, '789 Đường Cây Thông', 3, 65000000),
('E00004', 'Phạm', 'Thị D', '1982-03-30', 0, '101 Đường Gỗ', 4, 70000000),
('E00005', 'Hoàng', 'Văn E', '1995-12-14', 1, '202 Đường Sồi', 5, 75000000),
('E00006', 'Vũ', 'Thị F', '1988-09-10', 0, '303 Đường Bạch Dương', 6, 80000000),
('E00007', 'Đỗ', 'Văn G', '1975-05-05', 1, '404 Đường Tuyết Tùng', 7, 85000000),
('E00008', 'Ngô', 'Thị H', '1992-08-18', 0, '505 Đường Vân Sam', 8, 90000000),
('E00009', 'Dương', 'Văn I', '1980-01-20', 1, '606 Đường Tần Bì', 9, 95000000),
('E00010', 'Bùi', 'Thị K', '1983-10-12', 0, '707 Đường Óc Chó', 10, 100000000),
('E00011', 'Đặng', 'Văn L', '1991-04-25', 1, '808 Đường Thông', 11, 105000000),
('E00012', 'Trịnh', 'Thị M', '1986-06-06', 0, '909 Đường Đỏ Gỗ', 12, 110000000),
('E00013', 'Nguyễn', 'Văn N', '1979-02-17', 1, '1010 Đường Ngọc Lan', 13, 115000000),
('E00014', 'Trần', 'Thị P', '1984-07-19', 0, '1111 Đường Dẻ Gai', 14, 120000000),
('E00015', 'Lê', 'Văn Q', '1987-11-23', 1, '1212 Đường Dương Xỉ', 15, 125000000),
('E00016', 'Phạm', 'Thị R', '1993-05-27', 0, '1313 Đường Hồ Tràm', 16, 130000000),
('E00017', 'Hoàng', 'Văn S', '1977-09-29', 1, '1414 Đường Cọ', 17, 135000000),
('E00018', 'Vũ', 'Thị T', '1981-03-31', 0, '1515 Đường Tràm', 18, 140000000),
('E00019', 'Đỗ', 'Văn U', '1989-08-14', 1, '1616 Đường Kim Giao', 19, 145000000),
('E00020', 'Ngô', 'Thị V', '1994-12-16', 0, '1717 Đường Dẻ Cát', 20, 150000000);

----------- Câu 4 -------------
UPDATE Employee
SET Salary = Salary * 1.10;

----------- Câu 5 -------------
ALTER TABLE Employee
ADD CONSTRAINT chk_Salary CHECK (Salary > 0);
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- ----HOTEL MANAGEMENT SYSTEM - SQL-Project----
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

-- 1.Create Database

CREATE DATABASE HotelDB;
USE HotelDB;


-- 2.Create Tables

-- Customers --
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50)
);

-- Staff --
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE
);

-- Rooms --
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY ,
    RoomType VARCHAR(50),
    PricePerNight INT,
    Capacity INT
);


-- Bookings --
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    StaffID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Payments --
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    PaymentMethod VARCHAR(30),
    Amount INT,
    PaymentDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


-- 3.Insert Sample Data --
-- Customers 
INSERT INTO Customers VALUES
(1,'Amit','Sharma','9898989898','amit@gmail.com','Nagpur'),
(2,'Rahul','Verma','9876543210','rahul@gmail.com','Mumbai'),
(3,'Priya','Singh','9812345678','priya@gmail.com','Delhi'),
(4,'Anita','Patil','9822334455','anita@gmail.com','Pune'),
(5,'Suresh','Mehta','9833445566','suresh@gmail.com','Mumbai'),
(6,'Neha','Joshi','9844556677','neha@gmail.com','Chennai'),
(7,'Rohit','Kulkarni','9855667788','rohit@gmail.com','Nagpur'),
(8,'Kiran','Desai','9866778899','kiran@gmail.com','Delhi'),
(9,'Vikas','Rao','9877889900','vikas@gmail.com','Hyderabad'),
(10,'Pooja','Nair','9888990011','pooja@gmail.com','Chennai');

-- Staff 
INSERT INTO Staff VALUES
(1,'Raj','Malhotra','Manager','9000000001','raj@hotel.com','2022-01-10'),
(2,'Priya','Kale','Receptionist','9000000002','priya@hotel.com','2022-03-15'),
(3,'Aman','Singh','Chef','9000000003','aman@hotel.com','2021-11-20'),
(4,'Ritu','Shah','Waiter','9000000004','ritu@hotel.com','2023-02-05'),
(5,'Kunal','Verma','Manager','9000000005','kunal@tcs.in','2020-08-18'),
(6,'Sneha','Patil','Cleaner','9000000006','sneha@hotel.com','2023-06-10'),
(7,'Mohit','Gupta','Waiter','9000000007','mohit@hotel.com','2024-01-12'),
(8,'Neel','Kapoor','Security','9000000008','neel@hotel.com','2024-04-01');

-- Rooms 
INSERT INTO Rooms VALUES
(1,'Single',2000,1),
(2,'Double',3000,2),
(3,'Suite',6000,3),
(4,'Family',5000,4),
(5,'Suite',8000,4),
(6,'Double',3500,2),
(7,'Single',1800,1),
(8,'Suite',7000,3),
(9,'Family',5500,4),
(10,'Double',3200,2);

-- Bookings 
INSERT INTO Bookings VALUES
(1,1,2,2,'2024-01-10','2024-01-12',6000),
(2,2,3,1,'2024-02-05','2024-02-07',12000),
(3,3,4,2,'2023-12-01','2023-12-03',10000),
(4,4,5,1,'2024-03-01','2024-03-05',32000),
(5,5,6,2,'2024-01-20','2024-01-22',7000),
(6,6,7,4,'2023-11-10','2023-11-11',1800),
(7,7,8,2,'2024-04-01','2024-04-04',21000),
(8,8,9,1,'2024-05-10','2024-05-15',27500),
(9,9,10,2,'2023-10-05','2023-10-06',3200),
(10,10,1,4,'2024-06-01','2024-06-02',2000);

-- Payments 
INSERT INTO Payments VALUES
(1,1,'UPI',6000,'2024-01-10'),
(2,2,'Card',12000,'2024-02-05'),
(3,3,'Cash',10000,'2023-12-01'),
(4,4,'Online',32000,'2024-03-01'),
(5,5,'UPI',7000,'2024-01-20'),
(6,6,'Cash',1800,'2023-11-10'),
(7,7,'Card',21000,'2024-04-01'),
(8,8,'Online',27500,'2024-05-10'),
(9,9,'UPI',3200,'2023-10-05'),
(10,10,'Cash',2000,'2024-06-01');


-- QUESTIONS--


-- Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption. 

              SELECT * FROM Payments WHERE PaymentMethod = 'UPI';
              

-- Question - 2] List all unique first names of customers for a duplicate check. 

              SELECT DISTINCT FirstName FROM Customers;
              

-- Question - 3] Delete all rooms with Capacity = 1. 

              -- DELETE FROM Rooms WHERE Capacity = 1; // gives error Rooms is a PARENT table, Bookings is a CHILD table
              -- That means: You cannot delete a room if any booking is already using that RoomID This is referential integrity in SQL.
              -- option :Delete dependent bookings first:
              
              -- DELETE FROM Bookings
--               WHERE RoomID IN (
--               SELECT RoomID FROM Rooms WHERE Capacity = 1
--               );
              --  DELETE FROM Rooms WHERE Capacity = 1;

               ----- OR--
               
               ALTER TABLE Rooms ADD IsActive BOOLEAN DEFAULT 1;

               UPDATE Rooms
               SET IsActive = 0
               WHERE Capacity = 1;



-- Question - 4] Display each customer’s name and phone number together using CONCAT. 

              SELECT CONCAT(FirstName,' ',LastName,' - ',Phone) FROM Customers;


-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room.

              SELECT * FROM Bookings WHERE RoomID = 10;


-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms.(Rooms subquery)  

              SELECT * FROM Rooms
              WHERE Capacity > (SELECT AVG(Capacity) FROM Rooms);


-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone.

              CREATE VIEW StaffContact AS
			  SELECT FirstName, LastName, Role, Phone FROM Staff;

-- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 

              SELECT * FROM Rooms WHERE RoomType='Suite' AND PricePerNight < 7000;
             

-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers table.

              SELECT Email FROM Customers ORDER BY LastName;

-- Question - 10] Show staff full names combined into one column. 

              SELECT CONCAT(FirstName,' ',LastName) AS FullName FROM Staff;

-- Question - 11] Display all payment details in one line using CONCAT_WS. 
              
             
              SELECT 
              CONCAT_WS(' | ',
              PaymentID,
              BookingID,
              PaymentMethod,
              Amount,
              PaymentDate
              ) AS Payment_Details
              FROM Payments;

              

-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests. 
  
              SELECT *
              FROM Rooms
              ORDER BY PricePerNight DESC
              LIMIT 2;


-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined.

              SELECT 
              CONCAT(BookingID, ' : ', CheckInDate, ' to ', CheckOutDate) AS Booking_Dates
              FROM Bookings;


-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod. 

              SELECT 
              PaymentMethod,
              AVG(Amount) AS AverageAmount
			  FROM Payments
              GROUP BY PaymentMethod;
              
              
-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50. 
             
               SELECT 
               City
               FROM Customers
			   GROUP BY City
               HAVING AVG(CustomerID) > 50;
               
			
-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 
               
               
                SELECT *
                FROM Bookings
                WHERE TotalAmount > (
                SELECT AVG(TotalAmount)
                FROM Bookings
                );

-- Question - 17] Display the last 2 added rooms from the Rooms table. 
 
               SELECT *
               FROM Rooms
			   ORDER BY RoomID DESC
               LIMIT 2;
               
               
-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
            
               SELECT *
               FROM Payments
               WHERE Amount < 1500;
               

-- Question - 19] Management wants to list all customers who have made more than 5 bookings. 
       
              SELECT CustomerID
              FROM Bookings
              GROUP BY CustomerID
              HAVING COUNT(BookingID) > 5;

-- Question - 20] Identify customers who live in the same city. (Customers self join) 

              SELECT 
              A.CustomerID AS Customer1,
              A.FirstName AS Name1,
			  B.CustomerID AS Customer2,
              B.FirstName AS Name2,
              A.City
              FROM Customers A
              JOIN Customers B
              ON A.City = B.City
              AND A.CustomerID < B.CustomerID;


-- Question - 21] Show the total revenue handled by each StaffID. 

			 SELECT 
             StaffID,
             SUM(TotalAmount) AS TotalRevenue
			 FROM Bookings
             GROUP BY StaffID;



-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns.
  
              SELECT *
              FROM Customers
              WHERE City = 'Mumbai';
              
              
-- Question - 23] Display the 3 lowest booking amounts.

              SELECT TotalAmount
              FROM Bookings
              ORDER BY TotalAmount ASC
              LIMIT 3;
              
              
 -- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table. 
 
               INSERT INTO Rooms (RoomID, RoomType, PricePerNight, Capacity) VALUES
               (16, 'Single', 2200, 1),
               (17, 'Double', 3600, 2),
               (18, 'Suite', 9000, 4),
               (19, 'Family', 5800, 4),
               (20, 'Double', 3400, 2);

               select * from rooms;
               
               
               
-- Question - 25] Show all unique CustomerIDs from bookings.  


			  SELECT DISTINCT CustomerID
              FROM Bookings;
              
              
-- Question - 26] Create a trigger to automatically delete a payment when its corresponding booking is deleted.

              DELIMITER $$

             CREATE TRIGGER delete_payment_after_booking_delete
             AFTER DELETE ON Bookings
             FOR EACH ROW
             BEGIN
             DELETE FROM Payments
             WHERE BookingID = OLD.BookingID;
             END$$

             DELIMITER ;



-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'.

              UPDATE Customers
              SET FirstName = 'Rahul'
              WHERE CustomerID = 30;
              
              
-- Question - 28] List all bookings ordered by CheckInDate. 

              SELECT * FROM Bookings
              ORDER BY CheckInDate;


-- Question - 29] Show all rooms where capacity is greater than 2. 

              SELECT *
              FROM Rooms
              WHERE Capacity > 2;
              

-- Question - 30] List staff emails ordered by their roles. 

              SELECT Email FROM Staff
              ORDER BY Role;
              
              
-- Question - 31] Display each customer’s full name and city using CONCAT_WS. 

              SELECT CONCAT_WS(' ', FirstName, LastName, City) AS Customer_Details
              FROM Customers;
              

-- Question - 32] Show the first 4 customers’ full names only. 

              SELECT CONCAT(FirstName, ' ', LastName) AS FullName
              FROM Customers
              LIMIT 4;
              

-- Question - 33] Show each staff’s role with their full name. 

              SELECT CONCAT(FirstName, ' ', LastName) AS FullName,
              Role
              FROM Staff;
              

-- Question - 34] Management wants to find the average StaffID per role. 

              SELECT Role,AVG(StaffID) AS AvgStaffID
              FROM Staff
              GROUP BY Role;
              

-- Question - 35] List all bookings handled by StaffID = 2. 

               SELECT * FROM Bookings
               WHERE StaffID = 2;
               

-- Question - 36] Display the first 3 staff alphabetically by their first names. 

               SELECT * FROM Staff
			   ORDER BY FirstName ASC
               LIMIT 3;


-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention.

               SELECT * FROM Customers
               WHERE FirstName = 'Amit'
               AND City = 'Nagpur';
               
               
-- Question - 38] Show all unique payment methods in descending order. 

              SELECT DISTINCT PaymentMethod
              FROM Payments
              ORDER BY PaymentMethod DESC;

-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email. 

               INSERT INTO Staff (StaffID, FirstName, LastName, Role, Phone, Email, HireDate) VALUES
               (16, 'Ravi', 'Joshi', 'Manager', '9000000009', 'ravi@hotel.com', '2024-06-01'),
               (17, 'Meena', 'Kulkarni', 'Receptionist', '9000000010', 'meena@hotel.com', '2024-06-05'),
               (18, 'Sanjay', 'Patel', 'Waiter', '9000000011', 'sanjay@hotel.com', '2024-06-10'),
               (19, 'Nikita', 'Sharma', 'Chef', '9000000012', 'nikita@hotel.com', '2024-06-15'),
               (20, 'Aakash', 'Rao', 'Cleaner', '9000000013', 'aakash@hotel.com', '2024-06-20');
               
               
                select * from staff;
                
                
                
-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024 01-01' to analyze recent occupancy. 

              SELECT * FROM Bookings
              WHERE CheckInDate > '2024-01-01';

-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program. 
 
               SELECT * FROM Customers
               WHERE FirstName = 'Rahul';
               

-- Question - 42] Show all unique room types offered by the hotel. 

				SELECT DISTINCT RoomType FROM Rooms;



-- Question - 43] Identify customers who spent more than 50,000 in total. 

               SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
               FROM Bookings
			   GROUP BY CustomerID
               HAVING SUM(TotalAmount) > 50000;


-- Question - 44] Delete all customers from the city 'TestCity'. 

              DELETE FROM Customers
              WHERE City = 'TestCity';
              

-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join)

              SELECT 
              A.RoomID AS Room1,
              B.RoomID AS Room2,
              A.PricePerNight
              FROM Rooms A
              JOIN Rooms B
              ON A.PricePerNight = B.PricePerNight
              AND A.RoomID < B.RoomID;
              
              
-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tieups.

              SELECT * FROM Staff
              WHERE Email LIKE '%@tcs.in';
              

-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100.  

			   SELECT City
               FROM Customers
               GROUP BY City
               HAVING MAX(CustomerID) > 100;

-- Question - 48] Show all unique capacities in descending order.

               SELECT DISTINCT Capacity
               FROM Rooms
               ORDER BY Capacity DESC;

-- Question - 49] List staff working as Managers. 

               SELECT * FROM Staff
               WHERE Role = 'Manager';

-- Question - 50] Display each payment’s ID, Method, Amount in one line. 

               SELECT CONCAT(PaymentID, ' | ', PaymentMethod, ' | ', Amount) AS Payment_Details
               FROM Payments;


-- Question - 51] Show the first 4 payments only. 

              SELECT * FROM Payments
              LIMIT 4;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts. 

               SELECT * FROM Rooms
               WHERE PricePerNight BETWEEN 2000 AND 4000;

-- Question - 53] List all bookings ordered by CheckInDate. 

               SELECT * FROM Bookings
               ORDER BY CheckInDate;

-- Question - 54] Display all unique CustomerIDs from bookings.

               SELECT DISTINCT CustomerID
               FROM Bookings;

 
-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table. 

               INSERT INTO Customers (CustomerID, FirstName, LastName, Phone, Email, City) VALUES
               (21, 'Arjun', 'Mehra', '9811111111', 'arjun@gmail.com', 'Delhi'),
               (22, 'Sneha', 'Kapoor', '9822222222', 'sneha@gmail.com', 'Mumbai'),
			   (23, 'Rakesh', 'Iyer', '9833333333', 'rakesh@gmail.com', 'Chennai'),
               (24, 'Pallavi', 'Deshpande', '9844444444', 'pallavi@gmail.com', 'Pune'),
			   (25, 'Manish', 'Jain', '9855555555', 'manish@gmail.com', 'Jaipur');

-- Question - 56] Show the last 2 staff hired. 

               SELECT * FROM Staff
               ORDER BY HireDate DESC
			   LIMIT 2;

-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)

               SELECT * FROM Rooms
               WHERE PricePerNight > (
               SELECT MAX(PricePerNight)
               FROM Rooms
               WHERE Capacity = 2
               );


-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation. 

               SELECT * FROM Staff
               WHERE Role <> 'Chef';

-- Question - 59] Show all unique cities in descending order from the Customers table. 

               SELECT DISTINCT City
               FROM Customers
               ORDER BY City DESC;

-- Question - 60] Display the phone number of the Waiter only. 

               SELECT Phone
               FROM Staff
               WHERE Role = 'Waiter';

-- Question - 61] Display the last 2 bookings in the table. 

               SELECT * FROM Bookings
               ORDER BY BookingID DESC
               LIMIT 2;

-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for targeted promotions.

               SELECT * FROM Customers
               WHERE City IN ('Delhi', 'Chennai');
 
-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations. 

               SELECT * FROM Rooms
               WHERE RoomType <> 'Family';

-- Question - 64] List staff emails ordered by their roles. 

               SELECT Email FROM Staff
               ORDER BY Role;

-- Question - 65] Display all unique payment methods. 

               SELECT DISTINCT PaymentMethod
               FROM Payments;

-- Question - 66] The receptionist wants a list of customers whose Phone starts with '98' for mobile offers.

               SELECT * FROM Customers
               WHERE Phone LIKE '98%';
               
               
-- Question - 67] Show the 3 cheapest rooms available for budget travelers. 
         
               SELECT * FROM Rooms
               ORDER BY PricePerNight ASC
               LIMIT 3;

-- Question - 68] Display the last 2 payments. 

              SELECT * FROM Payments
              ORDER BY PaymentID DESC
              LIMIT 2;

-- Question - 69] Management wants to know which unique cities customers come from. 

               SELECT DISTINCT City FROM Customers;

-- Question - 70] List all bookings where TotalAmount > 5000. 

               SELECT * FROM Bookings
               WHERE TotalAmount > 5000;

-- Question - 71] Display each staff’s Role with their Email in one column. 

               SELECT CONCAT(Role, ' - ', Email) AS Role_Email
               FROM Staff;

-- Question - 72] Show the first 4 staff full names. 

                SELECT CONCAT(FirstName, ' ', LastName) AS FullName
                FROM Staff
				LIMIT 4;

-- Question - 73] Find bookings where TotalAmount is greater than all bookings made by  CustomerID = 10. (Bookings subquery) 

                SELECT * FROM Bookings
                WHERE TotalAmount > ALL (
                SELECT TotalAmount
                FROM Bookings
                WHERE CustomerID = 10
                );

-- Question - 74] List rooms with capacity >= 3 for family bookings. 

               SELECT * FROM Rooms
			   WHERE Capacity >= 3;

-- Question - 75] Display the RoomType and Price of only Suite rooms.
 
               SELECT RoomType, PricePerNight
               FROM Rooms
               WHERE RoomType = 'Suite';

               
-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks. 

               SELECT * FROM Payments
               WHERE Amount BETWEEN 2000 AND 7000;

-- Question - 77] Insert 5 booking records into the Bookings table with all details. 

               INSERT INTO Bookings (BookingID, CustomerID, RoomID, StaffID, CheckInDate, CheckOutDate, TotalAmount) VALUES
               (11, 21, 2, 2, '2024-07-01', '2024-07-03', 6000),
			   (12, 22, 3, 1, '2024-07-05', '2024-07-07', 12000),
               (13, 23, 5, 2, '2024-07-10', '2024-07-12', 15000),
			   (14, 24, 6, 1, '2024-07-15', '2024-07-18', 18000),
                (15, 25, 4, 2, '2024-07-20', '2024-07-23',20000);


-- Question - 78] Display the 3 lowest payments made by customers

               SELECT * FROM Payments
               ORDER BY Amount ASC
               LIMIT 3;

-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT. 

               SELECT CONCAT(BookingID, ' : ', TotalAmount) AS Booking_Amount
			   FROM Bookings;

-- Question - 80] Show all unique RoomIDs in descending order.

               SELECT DISTINCT RoomID
               FROM Rooms
               ORDER BY RoomID DESC;

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS. 

               SELECT CONCAT_WS(' | ', RoomType, PricePerNight) AS Room_Info
               FROM Rooms;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3.

               DELETE FROM Bookings
               WHERE StaffID = 3;

-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study. 

               SELECT *
               FROM Customers
               WHERE LENGTH(FirstName) > 5;

-- Question - 84] Show all unique roles available in the hotel.

               SELECT DISTINCT Role
               FROM Staff;
 
-- Question - 85] List all rooms where capacity is greater than 2. 

               SELECT *
			   FROM Rooms
			   WHERE Capacity > 2;

-- Question - 86] Display each payment’s ID with Amount using CONCAT. 

               SELECT CONCAT(PaymentID, ' : ', Amount) AS Payment_Info
               FROM Payments;

-- Question - 87] List all Card payments from the Payments table. 

               SELECT *
               FROM Payments
               WHERE PaymentMethod = 'Card';

-- Question - 88] Delete all customers whose Email ends with '@test.com' as invalid. 

               DELETE FROM Customers
               WHERE Email LIKE '%@test.com';

-- Question - 89] The hotel manager wants to review bookings where CheckOutDate before '2023-12-31' to measure old occupancy.

               SELECT * FROM Bookings
               WHERE CheckOutDate < '2023-12-31';

-- Question - 90] The front office manager needs to list rooms with capacity = 2 for couples. 

               SELECT * FROM Rooms
               WHERE Capacity = 2;



-- Question - 91] Show all unique capacities in descending order. 

              SELECT DISTINCT Capacity
              FROM Rooms
              ORDER BY Capacity DESC;

-- Question - 92] The operations team wants to find the minimum TotalAmount in bookings. 

              SELECT MIN(TotalAmount) AS MinTotalAmount
              FROM Bookings;

-- Question - 93] Display all rooms by capacity in ascending order. 

               SELECT *
               FROM Rooms
               ORDER BY Capacity ASC;

-- Question - 94] Show each booking’s BookingID with TotalAmount using CONCAT. 

              SELECT CONCAT('BookingID: ', BookingID, ', TotalAmount: ₹', TotalAmount) AS BookingInfo
              FROM Bookings;

-- Question - 95] The operations head wants to see rooms with Capacity = 4 AND PricePerNight > ₹6000 for premium family packages. 

               SELECT *
               FROM Rooms
               WHERE Capacity = 4 AND PricePerNight > 6000;

-- Question - 96] Show staff full names combined into one column. 

				SELECT CONCAT(FirstName, ' ', LastName) AS FullName
                FROM Staff;

-- Question - 97] The accounts team wants to see bookings where the TotalAmount is greater than ₹10,000 to track high-value customers. 

                SELECT *
                FROM Bookings
                WHERE TotalAmount > 10000;

-- Question - 98] Show all unique payment methods in descending order. 

               SELECT DISTINCT PaymentMethod
               FROM Payments
			   ORDER BY PaymentMethod DESC;


-- Question - 99] List staff members who share the same Role. (Staff self join)

               SELECT s1.StaffID AS Staff1_ID, s1.FirstName AS Staff1_Name,
               s2.StaffID AS Staff2_ID, s2.FirstName AS Staff2_Name, s1.Role
               FROM Staff s1
               JOIN Staff s2 ON s1.Role = s2.Role AND s1.StaffID < s2.StaffID;

-- Question - 100] Show customer first name, last name, and TotalAmount of their bookings usingJOIN between Customers and Bookings.

               SELECT c.FirstName, c.LastName, b.TotalAmount
               FROM Customers c
               JOIN Bookings b ON c.CustomerID = b.CustomerID;

-- Question - 101] Display the first 4 bookings only. 

                SELECT * FROM Bookings
                LIMIT 4;

-- Question - 102] Show all unique staff first names. 

                SELECT DISTINCT FirstName
                FROM Staff;

-- Question - 103] Insert 5 new room records with type, price, and capacity into the Rooms table. 

                INSERT INTO Rooms (RoomID, RoomType, PricePerNight, Capacity)
                VALUES
                (301, 'Deluxe Suite', 8000, 4),
                (302, 'Executive Room', 5500, 3),
                (303, 'Standard Room', 3500, 2),
                (304, 'Family Suite', 9000, 5),
                (305, 'Single Room', 2500, 1);

-- Question - 104] Display each customer’s full name and city using CONCAT_WS. 

                 SELECT CONCAT_WS(' ', FirstName, LastName) AS FullName, City
                 FROM Customers;

-- Question - 105] Show all unique cities in descending order from the Customers table.

                 SELECT DISTINCT City
                 FROM Customers
                 ORDER BY City DESC;


 
-- Question - 106] The analytics team wants to list all cities where maximum CustomerID is more than 100.

                 SELECT City
                 FROM Customers
                 GROUP BY City
				 HAVING MAX(CustomerID) > 100;
 
-- Question - 107] The HR team wants to see staff whose FirstName is 'Priya' for employee recognition. 

                SELECT * FROM Staff
                WHERE FirstName = 'Priya';

-- Question - 108] Display the last 2 staff members from the Staff table.

                 SELECT * FROM Staff
                 ORDER BY StaffID DESC
                 LIMIT 2;
 
-- Question - 109] Create a VIEW BookingSummary showing BookingID, CustomerID, RoomID, and TotalAmount.

                CREATE VIEW BookingSummary AS
                SELECT BookingID, CustomerID, RoomID, TotalAmount
                 FROM Bookings;

-- Question - 110] Show all unique RoomIDs in descending order. 

                 SELECT DISTINCT RoomID
                 FROM Rooms
                 ORDER BY RoomID DESC;

-- Question - 111] Display each staff’s role with their full name. 

                 SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Role
				 FROM Staff;

-- Question - 112] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 

                  SELECT * FROM Rooms
                  WHERE RoomType = 'Suite'
                  AND PricePerNight < 7000;

-- Question - 113] Display the first 3 staff alphabetically by their first names.

                   SELECT * FROM Staff
                  ORDER BY FirstName ASC
                  LIMIT 3;
 
-- Question - 114] List all bookings ordered by CheckInDate. 
 
                SELECT * FROM Bookings
                ORDER BY CheckInDate;

-- Question - 115] Show all unique StaffIDs from the bookings.

                 SELECT DISTINCT StaffID
                 FROM Bookings;



-- Question - 116] Display the first 4 customers’ full names only. 

              SELECT CONCAT(FirstName, ' ', LastName) AS FullName
              FROM Customers
              LIMIT 4;

-- Question - 117] Show all unique room types offered by the hotel. 

               SELECT DISTINCT RoomType
               FROM Rooms;

-- Question - 118] Display the phone number of the Waiter only. 

               SELECT Phone
               FROM Staff
               WHERE Role = 'Waiter';

-- Question - 119] Show all bookings where TotalAmount > 5000. 

               SELECT * FROM Bookings
               WHERE TotalAmount > 5000;

-- Question - 120] The HR team wants to update Role = 'Senior Manager' where StaffID = 12.

               UPDATE Staff
               SET Role = 'Senior Manager'
              WHERE StaffID = 12;
 
-- Question - 121] List all staff working as Managers.

               SELECT * FROM Staff
                WHERE Role LIKE '%Manager%';

-- Question - 122] Show the last 2 registered customers for follow-up.

               SELECT * FROM Customers
              ORDER BY CustomerID DESC
              LIMIT 2;
 
-- Question - 123] Display each booking’s BookingID with TotalAmount using CONCAT.

               SELECT CONCAT(BookingID, ' - ', TotalAmount) AS Booking_Amount
               FROM Bookings;
 
-- Question - 124] Insert 5 staff members into the Staff table with their role, phone, and email. 

                 INSERT INTO Staff (StaffID, FirstName, LastName, Role, Phone, Email, HireDate) VALUES
                  (22, 'Sunita', 'More', 'Receptionist', '9000000014', 'sunita@hotel.com', '2024-07-01'),
                  (23, 'Amit', 'Joshi', 'Waiter', '9000000015', 'amit@hotel.com', '2024-07-03'),
                  (24, 'Rohan', 'Patel', 'Cleaner', '9000000016', 'rohan@hotel.com', '2024-07-05'),
                  (25, 'Pankaj', 'Singh', 'Chef', '9000000017', 'pankaj@hotel.com', '2024-07-07'),
                  (26, 'Neha', 'Kulkarni', 'Manager', '9000000018', 'neha@hotel.com', '2024-07-10');
                  
				
                  select * from staff;
                  
                  
-- Question - 125] Display the RoomType and Price of only Suite rooms. 

                SELECT RoomType, PricePerNight
                 FROM Rooms
                WHERE RoomType = 'Suite';



-- Question - 126] The admin wants to delete all payments linked to BookingID = 15. 

                DELETE FROM Payments
                WHERE BookingID = 15;

-- Question - 127] Display all unique capacities in descending order. 

                 SELECT DISTINCT Capacity
                 FROM Rooms
                 ORDER BY Capacity DESC;

-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType. 

                 SELECT * FROM Rooms
                 ORDER BY RoomType ASC
				 LIMIT 4;

-- Question - 129] The cashier wants a report of payments where Amount < ₹1500 for small transactions. 

                   SELECT * FROM Payments
                   WHERE Amount < 1500;

-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT. 

                   SELECT CONCAT(BookingID, ' : ', TotalAmount) AS Booking_Amount
                   FROM Bookings;

-- Question - 131] Display the last 2 added rooms from the Rooms table. 

                   SELECT * FROM Rooms
                    ORDER BY RoomID DESC
					LIMIT 2;

-- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention.

                   SELECT * FROM Customers
				 WHERE FirstName = 'Amit'
                  AND City = 'Nagpur';

-- Question - 133] Insert 5 new customer details into the Customers table. 

                  INSERT INTO Customers (CustomerID, FirstName, LastName, Phone, Email, City) VALUES
                  (26, 'Deepak', 'Rana', '9810000001', 'deepak@gmail.com', 'Delhi'),
                 (27, 'Ritu', 'Malik', '9820000002', 'ritu@gmail.com', 'Mumbai'),
                 (28, 'Sahil', 'Kapoor', '9830000003', 'sahil@gmail.com', 'Chandigarh'),
                 (29, 'Neeta', 'Bansal', '9840000004', 'neeta@gmail.com', 'Jaipur'),
                 (30, 'Vijay', 'Sharma', '9850000005', 'vijay@gmail.com', 'Nagpur');

-- Question - 134] Show staff full names combined into one column.

                SELECT CONCAT(FirstName, ' ', LastName) AS FullName
                FROM Staff;
 
-- Question - 135] Show all room details separated by commas using CONCAT_WS. 

                SELECT CONCAT_WS(', ', RoomID, RoomType, PricePerNight, Capacity) AS Room_Details
                FROM Rooms;

-- Question - 136] Display each customer’s name and phone number together using CONCAT. 

                SELECT CONCAT(FirstName, ' ', LastName, ' - ', Phone) AS Customer_Contact
                FROM Customers;


-- Question - 137] Display all payment details in one line using CONCAT_WS. 

                SELECT CONCAT_WS(' | ', PaymentID, BookingID, PaymentMethod, Amount, PaymentDate) AS Payment_Details
                FROM Payments;

-- Question - 138] Show the last 2 bookings in the table. 

               SELECT * FROM Bookings
              ORDER BY BookingID DESC
              LIMIT 2;

-- Question - 139] List all payments ordered by PaymentDate. 

               SELECT * FROM Payments
               ORDER BY PaymentDate;

-- Question - 140] Show the 2 highest payments received.

               SELECT * FROM Payments
               ORDER BY Amount DESC
               LIMIT 2;



-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a loyalty program.

                SELECT * FROM Customers
                WHERE FirstName = 'Rahul';

-- Question - 142] Display each PaymentID with its method using CONCAT.
 
                SELECT CONCAT(PaymentID, ' - ', PaymentMethod) AS Payment_Info
                FROM Payments;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times. 

                SELECT PaymentMethod, COUNT(*) AS Method_Count
                FROM Payments
                GROUP BY PaymentMethod
                HAVING COUNT(*) > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests. 

                SELECT * FROM Rooms
                ORDER BY PricePerNight DESC
                LIMIT 2;

-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS.

                SELECT CONCAT_WS(' : ', RoomType, PricePerNight) AS Room_Info
                FROM Rooms;
 
-- Question - 146] Display the first 3 staff alphabetically by their first names.

               SELECT * FROM Staff
                ORDER BY FirstName ASC
                LIMIT 3;

-- Question - 147] List all bookings handled by StaffID = 2. 

                SELECT * FROM Bookings
                WHERE StaffID = 2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50.
 
                SELECT City FROM Customers
                GROUP BY City
                HAVING AVG(CustomerID) > 50;

-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests. 

               SELECT * FROM Rooms
               ORDER BY PricePerNight DESC
               LIMIT 2;

-- Question - 150] Show all unique first names of customers for a duplicate check. 

               SELECT DISTINCT FirstName
               FROM Customers;

-- Question - 151] Show all unique roles in descending order. 

              SELECT DISTINCT Role FROM Staff
              ORDER BY Role DESC;

-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)  

              SELECT * FROM Rooms
               WHERE Capacity > (
			  SELECT AVG(Capacity)
              FROM Rooms
              );

-- Question - 153] Display all rooms by capacity in ascending order. 

               SELECT * FROM Rooms
               ORDER BY Capacity ASC;

-- Question - 154] Display the first 4 payments only. 

                SELECT * FROM Payments
                LIMIT 4;

-- Question - 155] Show each payment’s ID, Method, Amount in one line. 

                SELECT CONCAT_WS(' | ', PaymentID, PaymentMethod, Amount) AS Payment_Info
                FROM Payments;

-- Question - 156] List all bookings where TotalAmount > 5000.

                 SELECT * FROM Bookings
                 WHERE TotalAmount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID. (Customers subquery) 

               SELECT * FROM Customers
               WHERE CustomerID > (
                SELECT AVG(CustomerID)
                FROM Customers
                );

-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation. 

               SELECT * FROM Staff
               WHERE Role <> 'Chef';

-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than ₹10,000. 

               SELECT * FROM Bookings
              WHERE TotalAmount > 10000;

-- Question - 160] Display each staff’s role with their full name.  

              SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Role
              FROM Staff;



-- Question - 161] List staff members who share the same Role. (Staff self join) 

               SELECT s1.StaffID, s1.FirstName, s1.LastName, s1.Role
               FROM Staff s1
               JOIN Staff s2
               ON s1.Role = s2.Role
               AND s1.StaffID <> s2.StaffID;

-- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments. 

                SELECT 
              CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
              p.Amount
			  FROM Customers c
              JOIN Bookings b ON c.CustomerID = b.CustomerID
              JOIN Payments p ON b.BookingID = p.BookingID;


-- Question - 163] Display all bookings where TotalAmount > 5000. 

               SELECT * FROM Bookings
               WHERE TotalAmount > 5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'.

               SELECT * FROM Customers
               WHERE Phone LIKE '98%';
 
-- Question - 165] Identify customers who live in the same city. (Customers self join) 

               SELECT 
               c1.CustomerID, c1.FirstName, c1.City
               FROM Customers c1
               JOIN Customers c2
               ON c1.City = c2.City
               AND c1.CustomerID <> c2.CustomerID;
               

-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'.

               SELECT * FROM Bookings
               WHERE CheckOutDate < '2023-12-31';

-- Question - 167] Display all unique StaffIDs from the bookings. 

               SELECT DISTINCT StaffID
               FROM Bookings;

-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'.

               CREATE OR REPLACE VIEW OnlinePayments AS
              SELECT * FROM Payments
              WHERE PaymentMethod = 'Online';

-- Question - 169] Display all unique payment methods in descending order. 

              SELECT DISTINCT PaymentMethod
              FROM Payments
              ORDER BY PaymentMethod DESC;

-- Question - 170] Display each payment’s ID with Amount using CONCAT. 

              SELECT CONCAT(PaymentID, ' : ', Amount) AS Payment_Info
              FROM Payments;

-- Question - 171] Show all unique RoomIDs in descending order. 

               SELECT DISTINCT RoomID
               FROM Rooms
               ORDER BY RoomID DESC;

-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100.

               SELECT City FROM Customers
               GROUP BY City
			   HAVING MAX(CustomerID) > 100;

-- Question - 173] List staff emails ordered by their roles.

                SELECT Email, Role
                FROM Staff
                ORDER BY Role;

-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 

                SELECT * FROM Bookings
                WHERE TotalAmount > (
                    SELECT AVG(TotalAmount)
                FROM Bookings
                );

-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer recommendations.

               SELECT * FROM Rooms
               WHERE PricePerNight > 5000;


 
-- Question - 176] Show all unique capacities in descending order. 

               SELECT DISTINCT Capacity
               FROM Rooms
               ORDER BY Capacity DESC;

-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType.

               SELECT * FROM Rooms
                ORDER BY RoomType ASC
                LIMIT 4;
 
-- Question - 178] Show all unique staff first names. 

               SELECT DISTINCT FirstName
               FROM Staff;

-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)

                SELECT * FROM Rooms
                 WHERE PricePerNight > (
                 SELECT MAX(PricePerNight)
                 FROM Rooms
                 WHERE Capacity = 2
                 );

-- Question - 180] Show all unique cities in descending order from the Customers table. 

               SELECT DISTINCT City
               FROM Customers
               ORDER BY City DESC;

-- Question - 181] List all bookings where TotalAmount > 5000. 

              SELECT * FROM Bookings
              WHERE TotalAmount > 5000;

-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'. 

              SELECT 
              p.PaymentID,
              CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
              b.BookingID
              FROM Payments p
              JOIN Bookings b ON p.BookingID = b.BookingID
              JOIN Customers c ON b.CustomerID = c.CustomerID
              WHERE p.PaymentMethod = 'Credit Card';

-- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT. 

              SELECT CONCAT(BookingID, ' - ', TotalAmount) AS Booking_Amount
              FROM Bookings;

-- Question - 184] Show all bookings handled by StaffID = 2. 

                SELECT * FROM Bookings
                WHERE StaffID = 2;

-- Question - 185] Display the last 2 added rooms from the Rooms table. 

                SELECT * FROM Rooms
                ORDER BY RoomID DESC
                LIMIT 2;

-- Question - 186] List all rooms where capacity is greater than 2. 

                 SELECT * FROM Rooms
                 WHERE Capacity > 2;

-- Question - 187] Display the last 2 staff members from the Staff table. 

                 SELECT * FROM Staff
                 ORDER BY StaffID DESC
                 LIMIT 2;

-- Question - 188] Show all unique roles available in the hotel. 

                 SELECT DISTINCT Role
                 FROM Staff;

-- Question - 189] Display the last 2 payments. 

                 SELECT * FROM Payments
                 ORDER BY PaymentID DESC
                 LIMIT 2;

-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests. 

                  SELECT * FROM Bookings
                  WHERE CustomerID IN (2, 4, 6, 8);



-- Question - 191] Show all unique first names of customers for a duplicate check. 

               SELECT DISTINCT FirstName
               FROM Customers;

-- Question - 192] Display all bookings where TotalAmount > 5000. 

                SELECT * FROM Bookings
                WHERE TotalAmount > 5000;

-- Question - 193] The admin wants to delete all payments where Amount < 1000. 

                DELETE FROM Payments
                WHERE Amount < 1000;

-- Question - 194] Display all unique RoomIDs in descending order. 

                SELECT DISTINCT RoomID
                FROM Rooms
                ORDER BY RoomID DESC;

-- Question - 195] List customers who made more than 5 bookings. 

               SELECT CustomerID, COUNT(*) AS TotalBookings
                FROM Bookings
                GROUP BY CustomerID
                HAVING COUNT(*) > 5;

-- Question - 196] Display all rooms by capacity in ascending order. 

				SELECT * FROM Rooms
                ORDER BY Capacity ASC;

-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT. 

                 SELECT CONCAT(BookingID, ' : ', TotalAmount) AS Booking_Amount
                 FROM Bookings;

-- Question - 198] List all staff working as Managers. 
 
                 SELECT * FROM Staff
                 WHERE Role LIKE '%Manager%';

-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study.

                 SELECT * FROM Customers
                 WHERE LENGTH(FirstName) > 5;

-- Question - 200] Display all unique capacities in descending order.

                 SELECT DISTINCT Capacity
                 FROM Rooms
                 ORDER BY Capacity DESC;

-- Question - 201] List staff members who share the same Role. (Staff self join) 

                 SELECT s1.StaffID, s1.FirstName, s1.LastName, s1.Role
                 FROM Staff s1
                 JOIN Staff s2
                 ON s1.Role = s2.Role
                 AND s1.StaffID <> s2.StaffID;
 
-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'. 

                 SELECT 
                 p.PaymentID,
                 CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
                 b.BookingID
                 FROM Payments p
                 JOIN Bookings b ON p.BookingID = b.BookingID
				 JOIN Customers c ON b.CustomerID = c.CustomerID
                 WHERE p.PaymentMethod = 'Credit Card';

-- Question - 203] Display the first 4 payments only.

                SELECT * FROM Payments
                 LIMIT 4;
 
-- Question - 204] Show each payment’s ID, Method, Amount in one line.

                SELECT CONCAT_WS(' | ', PaymentID, PaymentMethod, Amount) AS Payment_Info
                FROM Payments;
 
-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount >20,000. 

                CREATE OR REPLACE VIEW HighValueBookings AS
                SELECT *
                FROM Bookings
                WHERE TotalAmount > 20000;

-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted.

                DELIMITER $$

                CREATE TRIGGER delete_payment_after_booking_delete
                AFTER DELETE ON Bookings
                FOR EACH ROW
                BEGIN
                DELETE FROM Payments
                WHERE BookingID = OLD.BookingID;
                END$$

                DELIMITER ;
 
-- Question - 207] Create a trigger to prevent insertion of a booking where CheckOutDate < CheckInDate. 

               DELIMITER $$

               CREATE TRIGGER prevent_invalid_booking
               BEFORE INSERT ON Bookings
               FOR EACH ROW
               BEGIN
                IF NEW.CheckOutDate < NEW.CheckInDate THEN
                SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'CheckOutDate cannot be before CheckInDate';
                END IF;
				END$$

                DELIMITER ;

-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments. 

                  DELIMITER $$

                  CREATE TRIGGER update_totalamount_after_payment
                  AFTER INSERT ON Payments
                  FOR EACH ROW
                  BEGIN
                  UPDATE Bookings
                  SET TotalAmount = TotalAmount + NEW.Amount
                  WHERE BookingID = NEW.BookingID;
                  END$$

                  DELIMITER ;
                  
	
-- ---------------------------------------------------------------------------------------------------------------------------------
                                           -- END --
-- ----------------------------------------------------------------------------------------------------------------------------------

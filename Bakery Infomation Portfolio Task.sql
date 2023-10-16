CREATE DATABASE Cake_Cupcakes_Orders;
USE Cake_Cupcakes_Orders;

CREATE TABLE Bakery_Customer_Information(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email_Address VARCHAR(100),
   Contact_Number VARCHAR (12),
   How_Did_You_Hear_About_Us VARCHAR(30),
   Returning_Customer VARCHAR(30)
);

INSERT INTO Bakery_Customer_Information (Customer_ID, Customer_Name, Email_Address, Contact_Number, How_Did_You_Hear_About_Us, Returning_Customer) 
VALUES
(30, 'Michael Johnson', 'michael.johnson@email.com', 1234567890, 'Instagram', 'New Customer'),
(31, 'Laura Williams', 'laura.williams@email.com', 2345678901, 'Referral', 'New Customer'),
(33, 'David Smith', 'david.smith@email.com',4567890123, 'Referral', 'New Customer'),
(32, 'Emily Brown', 'emily.brown@email.com', 3456789012, 'Instagram', 'New Customer'),
(34, 'Sarah Jones',  'sarah.jones@email.com', 5678901234, 'Referral', 'Returning Customer'),
(35, 'Robert Davis', 'robert.davis@email.com', 7890123456, 'Instagram', 'New Customer'),
(36, 'Jessica Taylor', 'jessica.taylor@email.com', 6789012345, 'Referral', 'Returning Customer'),
(37, 'William Wilson', 'william.wilson@email.com', 8901234567, 'Instagram', 'New Customer'),
(38, 'Ashley White', 'ashley.white@email.com', 9012345678, 'Instagram', 'Returning Customer'),
(39, 'James Miller', 'james.miller@email.com', 0123456789, 'Instagram', 'Returning Customer'),
(40, 'Elizabeth Hall', 'elizabeth.hall@email.com', 1112223333, 'Instagram', 'Returning Customer')
;


CREATE TABLE Occasions (
    Occasion_ID INT PRIMARY KEY,
    Occasion_Name VARCHAR(100)
);

INSERT INTO Occasions (Occasion_ID, Occasion_Name) 
VALUES
(90, 'Birthday'),
(91, 'Baby Shower'),
(92, 'Wedding');


CREATE TABLE Cupcake_Flavours (
    Flavour_ID INT PRIMARY KEY,
    Available_cupcake_flavours VARCHAR(20) UNIQUE,
    Price_Per_Dozen INT,
    Popularity VARCHAR(10)
);

INSERT INTO Cupcake_Flavours (Flavour_ID, Available_cupcake_flavours, Price_Per_Dozen, Popularity)
VALUES 
(601, 'Vanilla', 28, 'High'),
(602, 'Red Velvet', 32, 'Low'),
(603, 'Fudge', 34, 'Low'),
(604, 'Biscoff', 34, 'High'),
(605, 'Toffee', 34, 'Medium'),
(607, 'Lemon', 32, 'Low');

CREATE TABLE Cupcake_Orders (
    Cupcake_OrderID INT PRIMARY KEY,
    Customer_ID INT,
    Flavour_ID INT,
    Quantity_Per_Dozen INT,
    Occasion_ID INT,
    FOREIGN KEY (Occasion_ID) REFERENCES Occasions(Occasion_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Bakery_Customer_Information(Customer_ID),
    FOREIGN KEY (Flavour_ID) REFERENCES Cupcake_Flavours(Flavour_ID)
);

INSERT INTO Cupcake_Orders (Cupcake_OrderID, Customer_ID,  Flavour_ID, Quantity_Per_Dozen, Occasion_ID) 
VALUES
(801, 31, 601, 1, 90),
(802, 31, 603, 1, 90),
(803, 39, 601, 2, 91),
(804, 39, 605, 2, 90),
(805, 31, 604, 2, 90),
(806, 30, 601, 2, 90),
(807, 33, 604, 2, 91),
(808, 33, 607, 2, 91),
(809, 36, 605, 1, 91),
(810, 39, 607, 1, 91),
(811, 39, 602, 1, 92),
(815, 40, 605, 2, 91),
(816, 39, 607, 1, 91),
(817, 33, 605, 1, 91),
(818, 33, 601, 1, 91);



CREATE TABLE Custom_Cake_Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT, 
    Order_Date DATE,
    Includes_Cupcakes BOOLEAN,
    Occasion_ID INT,
    FOREIGN KEY (Occasion_ID) REFERENCES Occasions(Occasion_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Bakery_Customer_Information(Customer_ID)
);

INSERT INTO Custom_Cake_Orders (Order_ID, Customer_ID, Order_Date, Includes_Cupcakes, Occasion_ID) 
VALUES
(401, 30, '2017-04-15', 'Yes', 90),
(402, 33, '2018-08-15', 'Yes', 91),
(403, 33, '2018-08-15', 'Yes', 91),
(404, 34, '2019-12-15', 'No', 92),
(405, 35, '2019-12-15', 'No', 92),
(406, 36, '2020-06-15', 'Yes', 91),
(407, 37, '2021-12-15', 'No', 92),
(408, 37, '2022-01-15', 'No', 91),
(409, 38, '2023-04-15', 'No', 91),
(410, 39, '2021-04-15', 'Yes', 91),
(411, 39, '2020-04-15', 'Yes', 92),
(412, 40, '2020-04-12', 'No', 92),
(413, 40, '2021-08-15', 'No', 91),
(415, 40, '2022-08-12', 'Yes', 91),
(416, 39, '2023-03-19', 'Yes', 91),
(417, 33, '2017-05-17', 'Yes', 91),
(418, 36, '2018-09-15', 'No', 90)
; 


CREATE TABLE Custom_Cake_Order_Details (
    OrderDetail_ID INT PRIMARY KEY,
    Order_ID INT,
    Cake_Flavour VARCHAR(50),
    Cake_Inches INT,
    Cake_Layers INT,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Custom_Cake_Orders(Order_ID)
);

INSERT INTO Custom_Cake_Order_Details (OrderDetail_ID, Order_ID,  Cake_Flavour, Cake_Inches, Cake_Layers, Quantity) 
VALUES
(1, 401, 'Vanilla', 6, 4, 1),
(2, 402, 'Red Velvet',7, 4, 1),
(3, 403, 'Lemon', 5, 3, 2 ),
(4, 404, 'Red Velvet', 6, 6, 1),
(5, 405, 'Coffee', 8, 5, 2),
(6, 406, 'Chocolate', 5, 4, 2),
(7, 407, 'Chocolate', 6, 5, 2),
(8, 408, 'Biscoff', 6, 4, 1),
(10, 409, 'Biscoff', 7, 5, 1),
(11, 410, 'Vanilla', 7, 5, 1),
(12, 411, 'Coffee', 7, 4,  2),
(13, 412, 'Vanilla', 6, 4, 1),
(14, 413, 'Chocolate', 7, 4, 1),
(15, 415, 'Chocolate', 6, 5, 1),
(16, 416, 'Coffee',6, 5, 1),
(17, 417, 'Biscoff', 8, 5, 1),
(18, 418, 'Lemon', 6, 5, 2)
; 

SELECT * FROM Bakery_Customer_Information	
WHERE How_Did_You_Hear_About_Us= 'Instagram' AND 'Returning_Customer'
;

SELECT * FROM Bakery_Customer_Information	
WHERE How_Did_You_Hear_About_Us= 'Instagram' AND 'New Customer'
;

SELECT * FROM Bakery_Customer_Information	
WHERE How_Did_You_Hear_About_Us= 'Referral'
;

SELECT COUNT * Bakery_Customer_Information
WHERE How_Did_You_Hear_About_Us = 'Instagram'
;

SELECT Customer_ID
FROM Cupcake_Orders
WHERE Customer_ID IN (SELECT Customer_ID FROM Custom_Cake_Orders);

-- List the names and email addresses of customers who have ordered a vanilla-flavored cupcake.


SELECT Bakery_Customer_Information.Customer_Name, Bakery_Customer_Information.Email_Address 
FROM Bakery_Customer_Information
JOIN Cupcake_Orders ON Bakery_Customer_Information.Customer_ID = Cupcake_Orders.Customer_ID
JOIN Cupcake_Flavours ON Cupcake_Orders.Flavour_ID = Cupcake_Flavours.Flavour_ID
WHERE Cupcake_Flavours.Available_cupcake_flavours = 'Vanilla';

-- Which customers have ordered custom cakes for birthdays? Display their names and contact numbers.

SELECT Bakery_Customer_Information.Customer_Name, Bakery_Customer_Information.Contact_Number
FROM Bakery_Customer_Information
JOIN Custom_Cake_Orders ON Bakery_Customer_Information.Customer_ID = Custom_Cake_Orders.Customer_ID
JOIN Occasions ON Custom_Cake_Orders.Occasion_ID = Occasions.Occasion_ID
WHERE Occasions.Occasion_Name = 'Birthday';


-- How many lemon-flavored cupcakes have been ordered in total?

SELECT SUM(Cupcake_Orders.Quantity_Per_Dozen) as Total_Lemon_Cupcakes_Ordered
FROM Cupcake_Orders
JOIN Cupcake_Flavours ON Cupcake_Orders.Flavour_ID = Cupcake_Flavours.Flavour_ID
WHERE Cupcake_Flavours.Available_cupcake_flavours = 'Lemon';

-- Which customers have ordered both custom cakes and cupcakes? Display their names.

SELECT DISTINCT Bakery_Customer_Information.Customer_Name
FROM Bakery_Customer_Information
JOIN Custom_Cake_Orders ON Bakery_Customer_Information.Customer_ID = Custom_Cake_Orders.Customer_ID
JOIN Cupcake_Orders ON Bakery_Customer_Information.Customer_ID = Cupcake_Orders.Customer_ID;

-- Find the most popular cupcake flavor based on the number of orders.

SELECT Cupcake_Flavours.Available_cupcake_flavours, SUM(Cupcake_Orders.Quantity_Per_Dozen) as Total_Orders
FROM Cupcake_Orders
JOIN Cupcake_Flavours ON Cupcake_Orders.Flavour_ID = Cupcake_Flavours.Flavour_ID
GROUP BY Cupcake_Flavours.Available_cupcake_flavours
ORDER BY Total_Orders DESC
LIMIT 1;

-- how many new customers from instagram made more than one order over time

SELECT 
    Bakery_Customer_Information.Customer_ID,
    Bakery_Customer_Information.Customer_Name,
    COUNT(Custom_Cake_Orders.Order_ID) AS NumberOfOrders
FROM 
    Bakery_Customer_Information
JOIN 
    Custom_Cake_Orders ON Bakery_Customer_Information.Customer_ID = Custom_Cake_Orders.Customer_ID
WHERE 
    Bakery_Customer_Information.How_Did_You_Hear_About_Us = 'Instagram' 
    AND Bakery_Customer_Information.Returning_Customer = 'New Customer'
GROUP BY 
    Bakery_Customer_Information.Customer_ID, 
    Bakery_Customer_Information.Customer_Name
HAVING 
    COUNT(Custom_Cake_Orders.Order_ID) > 1;

-- Which occasion has the highest number of custom cake orders?

SELECT Custom_Cake_Orders.Occasion_ID, COUNT(*) as Total_Orders
FROM Custom_Cake_Orders
GROUP BY Custom_Cake_Orders.Occasion_ID
ORDER BY Total_Orders DESC
LIMIT 1;

-- How many customers learned about the bakery through Instagram and made at least one order?
SELECT COUNT(DISTINCT Bakery_Customer_Information.Customer_ID)
FROM Bakery_Customer_Information
WHERE Bakery_Customer_Information.How_Did_You_Hear_About_Us = 'Instagram'
AND (EXISTS (SELECT 1 FROM Custom_Cake_Orders WHERE Custom_Cake_Orders.Customer_ID = Bakery_Customer_Information.Customer_ID)
     OR EXISTS (SELECT 1 FROM Cupcake_Orders WHERE Cupcake_Orders.Customer_ID = Bakery_Customer_Information.Customer_ID));
     
     
     -- Which cake flavour is most popular among Returning Customers?
     
SELECT Custom_Cake_Order_Details.Cake_Flavour, COUNT(*) as Total_Orders
FROM Custom_Cake_Orders
JOIN Custom_Cake_Orders ON Custom_Cake_Order_Details.Order_ID = Custom_Cake_Orders.Order_ID
JOIN Bakery_Customer_Information ON Custom_Cake_Orders.Customer_ID = Bakery_Customer_Information.Customer_ID
WHERE Bakery_Customer_Information.Returning_Customer = 'Returning Customer'
GROUP BY Custom_Cake_Order_Details.Cake_Flavour
ORDER BY Total_Orders DESC
LIMIT 1;


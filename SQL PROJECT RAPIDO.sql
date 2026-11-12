CREATE DATABASE rapido;
USE rapido;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    DriverName VARCHAR(100),
    Phone VARCHAR(15),
    VehicleType VARCHAR(50),
    VehicleNumber VARCHAR(20),
    Rating DECIMAL(2,1)
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    DriverID INT,
    VehicleType VARCHAR(50),
    VehicleNumber VARCHAR(20),
    Model VARCHAR(50),
    CONSTRAINT FK_Vehicle_Driver
        FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    DriverID INT,
    PickupLocation VARCHAR(100),
    DropLocation VARCHAR(100),
    BookingDate DATE,
    BookingTime TIME,
    Status VARCHAR(20),
    CONSTRAINT FK_Booking_Customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Booking_Driver
        FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(20),
    CONSTRAINT FK_Payment_Booking
        FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY,
    BookingID INT,
    CustomerID INT,
    DriverID INT,
    Rating INT,
    Review VARCHAR(255),
    CONSTRAINT FK_Rating_Booking
        FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    CONSTRAINT FK_Rating_Customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Rating_Driver
        FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- 1. CUSTOMERS: 100 records 
INSERT INTO Customers (CustomerID, CustomerName, Phone, Email, City)
VALUES
(101,'Rahul Sharma','9876500001','rahul101@gmail.com','Mumbai'),
(102,'Priya Singh','9876500002','priya102@gmail.com','Delhi'),
(103,'Amit Kumar','9876500003','amit103@gmail.com','Bangalore'),
(104,'Neha Patel','9876500004','neha104@gmail.com','Pune'),
(105,'Rohan Verma','9876500005','rohan105@gmail.com','Hyderabad'),
(106,'Anjali Gupta','9876500006','anjali106@gmail.com','Chennai'),
(107,'Vikas Yadav','9876500007','vikas107@gmail.com','Kolkata'),
(108,'Sneha Joshi','9876500008','sneha108@gmail.com','Jaipur'),
(109,'Karan Malhotra','9876500009','karan109@gmail.com','Lucknow'),
(110,'Pooja Mehta','9876500010','pooja110@gmail.com','Ahmedabad'),
(111,'Arjun Nair','9876500011','arjun111@gmail.com','Kochi'),
(112,'Meera Iyer','9876500012','meera112@gmail.com','Coimbatore'),
(113,'Sanjay Das','9876500013','sanjay113@gmail.com','Bhubaneswar'),
(114,'Kavita Roy','9876500014','kavita114@gmail.com','Patna'),
(115,'Deepak Jain','9876500015','deepak115@gmail.com','Indore'),
(116,'Nisha Kapoor','9876500016','nisha116@gmail.com','Chandigarh'),
(117,'Mohit Arora','9876500017','mohit117@gmail.com','Nagpur'),
(118,'Asha Reddy','9876500018','asha118@gmail.com','Visakhapatnam'),
(119,'Harsh Vardhan','9876500019','harsh119@gmail.com','Surat'),
(120,'Divya Sharma','9876500020','divya120@gmail.com','Noida'),
(121,'Nitin Soni','9876500021','nitin121@gmail.com','Gurgaon'),
(122,'Shreya Kulkarni','9876500022','shreya122@gmail.com','Nashik'),
(123,'Abhishek Mishra','9876500023','abhishek123@gmail.com','Kanpur'),
(124,'Ritika Sharma','9876500024','ritika124@gmail.com','Varanasi'),
(125,'Manish Tiwari','9876500025','manish125@gmail.com','Bhopal'),
(126,'Komal Shah','9876500026','komal126@gmail.com','Rajkot'),
(127,'Yash Agarwal','9876500027','yash127@gmail.com','Udaipur'),
(128,'Payal Verma','9876500028','payal128@gmail.com','Mysore'),
(129,'Rakesh Pandey','9876500029','rakesh129@gmail.com','Ranchi'),
(130,'Sonia Bansal','9876500030','sonia130@gmail.com','Dehradun'),
(131,'Aditya Saxena','9876500031','aditya131@gmail.com','Agra'),
(132,'Tanvi Chawla','9876500032','tanvi132@gmail.com','Amritsar'),
(133,'Naveen Kumar','9876500033','naveen133@gmail.com','Jodhpur'),
(134,'Isha Malhotra','9876500034','isha134@gmail.com','Gwalior'),
(135,'Saurabh Gupta','9876500035','saurabh135@gmail.com','Meerut'),
(136,'Anita Sharma','9876500036','anita136@gmail.com','Vadodara'),
(137,'Ritu Singh','9876500037','ritu137@gmail.com','Ludhiana'),
(138,'Kishore Rao','9876500038','kishore138@gmail.com','Madurai'),
(139,'Bhavna Jain','9876500039','bhavna139@gmail.com','Jabalpur'),
(140,'Akash Verma','9876500040','akash140@gmail.com','Raipur'),
(141,'Swati Desai','9876500041','swati141@gmail.com','Goa'),
(142,'Rohit Batra','9876500042','rohit142@gmail.com','Shimla'),
(143,'Pallavi Rao','9876500043','pallavi143@gmail.com','Mangalore'),
(144,'Ajay Singh','9876500044','ajay144@gmail.com','Aurangabad'),
(145,'Monika Sethi','9876500045','monika145@gmail.com','Srinagar'),
(146,'Gaurav Joshi','9876500046','gaurav146@gmail.com','Trichy'),
(147,'Preeti Nair','9876500047','preeti147@gmail.com','Salem'),
(148,'Vinay Sharma','9876500048','vinay148@gmail.com','Kolhapur'),
(149,'Rekha Gupta','9876500049','rekha149@gmail.com','Hubli'),
(150,'Kunal Mehta','9876500050','kunal150@gmail.com','Thrissur'),
(151,'Aarav Sharma','9876500051','aarav151@gmail.com','Mumbai'),
(152,'Diya Patel','9876500052','diya152@gmail.com','Ahmedabad'),
(153,'Vivaan Singh','9876500053','vivaan153@gmail.com','Delhi'),
(154,'Ananya Gupta','9876500054','ananya154@gmail.com','Lucknow'),
(155,'Krishna Verma','9876500055','krishna155@gmail.com','Kanpur'),
(156,'Ishita Mehra','9876500056','ishita156@gmail.com','Chandigarh'),
(157,'Aryan Kumar','9876500057','aryan157@gmail.com','Patna'),
(158,'Riya Sharma','9876500058','riya158@gmail.com','Jaipur'),
(159,'Aditya Mishra','9876500059','aditya159@gmail.com','Varanasi'),
(160,'Simran Kaur','9876500060','simran160@gmail.com','Amritsar'),
(161,'Harshit Jain','9876500061','harshit161@gmail.com','Indore'),
(162,'Muskan Arora','9876500062','muskan162@gmail.com','Ludhiana'),
(163,'Yuvraj Singh','9876500063','yuvraj163@gmail.com','Jalandhar'),
(164,'Pallavi Sharma','9876500064','pallavi164@gmail.com','Bhopal'),
(165,'Nikhil Soni','9876500065','nikhil165@gmail.com','Udaipur'),
(166,'Kriti Agarwal','9876500066','kriti166@gmail.com','Agra'),
(167,'Siddharth Rao','9876500067','siddharth167@gmail.com','Hyderabad'),
(168,'Snehal Patil','9876500068','snehal168@gmail.com','Pune'),
(169,'Rajat Khanna','9876500069','rajat169@gmail.com','Noida'),
(170,'Aditi Kapoor','9876500070','aditi170@gmail.com','Gurgaon'),
(171,'Karthik Iyer','9876500071','karthik171@gmail.com','Chennai'),
(172,'Nandini Reddy','9876500072','nandini172@gmail.com','Visakhapatnam'),
(173,'Pranav Nair','9876500073','pranav173@gmail.com','Kochi'),
(174,'Shivani Joshi','9876500074','shivani174@gmail.com','Nashik'),
(175,'Akhil Menon','9876500075','akhil175@gmail.com','Coimbatore'),
(176,'Sakshi Bansal','9876500076','sakshi176@gmail.com','Dehradun'),
(177,'Tushar Malhotra','9876500077','tushar177@gmail.com','Meerut'),
(178,'Poonam Yadav','9876500078','poonam178@gmail.com','Nagpur'),
(179,'Rohit Saxena','9876500079','rohit179@gmail.com','Raipur'),
(180,'Megha Tiwari','9876500080','megha180@gmail.com','Jabalpur'),
(181,'Abhinav Roy','9876500081','abhinav181@gmail.com','Ranchi'),
(182,'Kajal Das','9876500082','kajal182@gmail.com','Bhubaneswar'),
(183,'Varun Chawla','9876500083','varun183@gmail.com','Surat'),
(184,'Tanisha Shah','9876500084','tanisha184@gmail.com','Vadodara'),
(185,'Hemant Dubey','9876500085','hemant185@gmail.com','Gwalior'),
(186,'Sonal Mehta','9876500086','sonal186@gmail.com','Rajkot'),
(187,'Lokesh Kumar','9876500087','lokesh187@gmail.com','Mysore'),
(188,'Rashmi Kulkarni','9876500088','rashmi188@gmail.com','Kolhapur'),
(189,'Nitin Arora','9876500089','nitin189@gmail.com','Aurangabad'),
(190,'Bhavya Jain','9876500090','bhavya190@gmail.com','Goa'),
(191,'Sachin Patel','9876500091','sachin191@gmail.com','Ahmedabad'),
(192,'Priti Sharma','9876500092','priti192@gmail.com','Mumbai'),
(193,'Vivek Gupta','9876500093','vivek193@gmail.com','Delhi'),
(194,'Ayesha Khan','9876500094','ayesha194@gmail.com','Bangalore'),
(195,'Dev Malhotra','9876500095','dev195@gmail.com','Pune'),
(196,'Lavanya Rao','9876500096','lavanya196@gmail.com','Hyderabad'),
(197,'Ramesh Naidu','9876500097','ramesh197@gmail.com','Chennai'),
(198,'Anushka Sen','9876500098','anushka198@gmail.com','Kolkata'),
(199,'Farhan Ali','9876500099','farhan199@gmail.com','Lucknow'),
(200,'Niharika Verma','9876500100','niharika200@gmail.com','Jaipur');

-- 2. DRIVERS: required because the 100 booking records reference DriverID 201-300
-- These driver records are added only to satisfy the existing Booking foreign keys.
INSERT INTO Drivers (DriverID, DriverName, Phone, VehicleType, VehicleNumber, Rating)
VALUES
(201,'Aarav Sharma','9000000001','Bike','MH01AB2000','4.0'),
(202,'Vivaan Singh','9000000002','Auto','MH01AB2001','4.1'),
(203,'Aditya Mehta','9000000003','Cab','MH01AB2002','4.2'),
(204,'Rohan Shah','9000000004','Bike','MH01AB2003','4.3'),
(205,'Karan Kumar','9000000005','Auto','MH01AB2004','4.4'),
(206,'Arjun Gupta','9000000006','Cab','MH01AB2005','4.5'),
(207,'Vikas Rao','9000000007','Bike','MH01AB2006','4.6'),
(208,'Sahil Patel','9000000008','Auto','MH01AB2007','4.7'),
(209,'Rahul Verma','9000000009','Cab','MH01AB2008','4.8'),
(210,'Amit Joshi','9000000010','Bike','MH01AB2009','4.9'),
(211,'Aarav Sharma','9000000011','Auto','MH01AB2010','4.0'),
(212,'Vivaan Singh','9000000012','Cab','MH01AB2011','4.1'),
(213,'Aditya Mehta','9000000013','Bike','MH01AB2012','4.2'),
(214,'Rohan Shah','9000000014','Auto','MH01AB2013','4.3'),
(215,'Karan Kumar','9000000015','Cab','MH01AB2014','4.4'),
(216,'Arjun Gupta','9000000016','Bike','MH01AB2015','4.5'),
(217,'Vikas Rao','9000000017','Auto','MH01AB2016','4.6'),
(218,'Sahil Patel','9000000018','Cab','MH01AB2017','4.7'),
(219,'Rahul Verma','9000000019','Bike','MH01AB2018','4.8'),
(220,'Amit Joshi','9000000020','Auto','MH01AB2019','4.9'),
(221,'Aarav Sharma','9000000021','Cab','MH01AB2020','4.0'),
(222,'Vivaan Singh','9000000022','Bike','MH01AB2021','4.1'),
(223,'Aditya Mehta','9000000023','Auto','MH01AB2022','4.2'),
(224,'Rohan Shah','9000000024','Cab','MH01AB2023','4.3'),
(225,'Karan Kumar','9000000025','Bike','MH01AB2024','4.4'),
(226,'Arjun Gupta','9000000026','Auto','MH01AB2025','4.5'),
(227,'Vikas Rao','9000000027','Cab','MH01AB2026','4.6'),
(228,'Sahil Patel','9000000028','Bike','MH01AB2027','4.7'),
(229,'Rahul Verma','9000000029','Auto','MH01AB2028','4.8'),
(230,'Amit Joshi','9000000030','Cab','MH01AB2029','4.9'),
(231,'Aarav Sharma','9000000031','Bike','MH01AB2030','4.0'),
(232,'Vivaan Singh','9000000032','Auto','MH01AB2031','4.1'),
(233,'Aditya Mehta','9000000033','Cab','MH01AB2032','4.2'),
(234,'Rohan Shah','9000000034','Bike','MH01AB2033','4.3'),
(235,'Karan Kumar','9000000035','Auto','MH01AB2034','4.4'),
(236,'Arjun Gupta','9000000036','Cab','MH01AB2035','4.5'),
(237,'Vikas Rao','9000000037','Bike','MH01AB2036','4.6'),
(238,'Sahil Patel','9000000038','Auto','MH01AB2037','4.7'),
(239,'Rahul Verma','9000000039','Cab','MH01AB2038','4.8'),
(240,'Amit Joshi','9000000040','Bike','MH01AB2039','4.9'),
(241,'Aarav Sharma','9000000041','Auto','MH01AB2040','4.0'),
(242,'Vivaan Singh','9000000042','Cab','MH01AB2041','4.1'),
(243,'Aditya Mehta','9000000043','Bike','MH01AB2042','4.2'),
(244,'Rohan Shah','9000000044','Auto','MH01AB2043','4.3'),
(245,'Karan Kumar','9000000045','Cab','MH01AB2044','4.4'),
(246,'Arjun Gupta','9000000046','Bike','MH01AB2045','4.5'),
(247,'Vikas Rao','9000000047','Auto','MH01AB2046','4.6'),
(248,'Sahil Patel','9000000048','Cab','MH01AB2047','4.7'),
(249,'Rahul Verma','9000000049','Bike','MH01AB2048','4.8'),
(250,'Amit Joshi','9000000050','Auto','MH01AB2049','4.9'),
(251,'Aarav Sharma','9000000051','Cab','MH01AB2050','4.0'),
(252,'Vivaan Singh','9000000052','Bike','MH01AB2051','4.1'),
(253,'Aditya Mehta','9000000053','Auto','MH01AB2052','4.2'),
(254,'Rohan Shah','9000000054','Cab','MH01AB2053','4.3'),
(255,'Karan Kumar','9000000055','Bike','MH01AB2054','4.4'),
(256,'Arjun Gupta','9000000056','Auto','MH01AB2055','4.5'),
(257,'Vikas Rao','9000000057','Cab','MH01AB2056','4.6'),
(258,'Sahil Patel','9000000058','Bike','MH01AB2057','4.7'),
(259,'Rahul Verma','9000000059','Auto','MH01AB2058','4.8'),
(260,'Amit Joshi','9000000060','Cab','MH01AB2059','4.9'),
(261,'Aarav Sharma','9000000061','Bike','MH01AB2060','4.0'),
(262,'Vivaan Singh','9000000062','Auto','MH01AB2061','4.1'),
(263,'Aditya Mehta','9000000063','Cab','MH01AB2062','4.2'),
(264,'Rohan Shah','9000000064','Bike','MH01AB2063','4.3'),
(265,'Karan Kumar','9000000065','Auto','MH01AB2064','4.4'),
(266,'Arjun Gupta','9000000066','Cab','MH01AB2065','4.5'),
(267,'Vikas Rao','9000000067','Bike','MH01AB2066','4.6'),
(268,'Sahil Patel','9000000068','Auto','MH01AB2067','4.7'),
(269,'Rahul Verma','9000000069','Cab','MH01AB2068','4.8'),
(270,'Amit Joshi','9000000070','Bike','MH01AB2069','4.9'),
(271,'Aarav Sharma','9000000071','Auto','MH01AB2070','4.0'),
(272,'Vivaan Singh','9000000072','Cab','MH01AB2071','4.1'),
(273,'Aditya Mehta','9000000073','Bike','MH01AB2072','4.2'),
(274,'Rohan Shah','9000000074','Auto','MH01AB2073','4.3'),
(275,'Karan Kumar','9000000075','Cab','MH01AB2074','4.4'),
(276,'Arjun Gupta','9000000076','Bike','MH01AB2075','4.5'),
(277,'Vikas Rao','9000000077','Auto','MH01AB2076','4.6'),
(278,'Sahil Patel','9000000078','Cab','MH01AB2077','4.7'),
(279,'Rahul Verma','9000000079','Bike','MH01AB2078','4.8'),
(280,'Amit Joshi','9000000080','Auto','MH01AB2079','4.9'),
(281,'Aarav Sharma','9000000081','Cab','MH01AB2080','4.0'),
(282,'Vivaan Singh','9000000082','Bike','MH01AB2081','4.1'),
(283,'Aditya Mehta','9000000083','Auto','MH01AB2082','4.2'),
(284,'Rohan Shah','9000000084','Cab','MH01AB2083','4.3'),
(285,'Karan Kumar','9000000085','Bike','MH01AB2084','4.4'),
(286,'Arjun Gupta','9000000086','Auto','MH01AB2085','4.5'),
(287,'Vikas Rao','9000000087','Cab','MH01AB2086','4.6'),
(288,'Sahil Patel','9000000088','Bike','MH01AB2087','4.7'),
(289,'Rahul Verma','9000000089','Auto','MH01AB2088','4.8'),
(290,'Amit Joshi','9000000090','Cab','MH01AB2089','4.9'),
(291,'Aarav Sharma','9000000091','Bike','MH01AB2090','4.0'),
(292,'Vivaan Singh','9000000092','Auto','MH01AB2091','4.1'),
(293,'Aditya Mehta','9000000093','Cab','MH01AB2092','4.2'),
(294,'Rohan Shah','9000000094','Bike','MH01AB2093','4.3'),
(295,'Karan Kumar','9000000095','Auto','MH01AB2094','4.4'),
(296,'Arjun Gupta','9000000096','Cab','MH01AB2095','4.5'),
(297,'Vikas Rao','9000000097','Bike','MH01AB2096','4.6'),
(298,'Sahil Patel','9000000098','Auto','MH01AB2097','4.7'),
(299,'Rahul Verma','9000000099','Cab','MH01AB2098','4.8'),
(300,'Amit Joshi','9000000100','Bike','MH01AB2099','4.9');

-- 3. VEHICLES
INSERT INTO Vehicles (VehicleID, DriverID, VehicleType, VehicleNumber, Model)
VALUES
(1,201,'Bike','MH01AB2000','Honda Activa'),
(2,202,'Auto','MH01AB2001','Bajaj RE'),
(3,203,'Cab','MH01AB2002','Maruti Swift'),
(4,204,'Bike','MH01AB2003','Honda Activa'),
(5,205,'Auto','MH01AB2004','Bajaj RE'),
(6,206,'Cab','MH01AB2005','Maruti Swift'),
(7,207,'Bike','MH01AB2006','Honda Activa'),
(8,208,'Auto','MH01AB2007','Bajaj RE'),
(9,209,'Cab','MH01AB2008','Maruti Swift'),
(10,210,'Bike','MH01AB2009','Honda Activa'),
(11,211,'Auto','MH01AB2010','Bajaj RE'),
(12,212,'Cab','MH01AB2011','Maruti Swift'),
(13,213,'Bike','MH01AB2012','Honda Activa'),
(14,214,'Auto','MH01AB2013','Bajaj RE'),
(15,215,'Cab','MH01AB2014','Maruti Swift'),
(16,216,'Bike','MH01AB2015','Honda Activa'),
(17,217,'Auto','MH01AB2016','Bajaj RE'),
(18,218,'Cab','MH01AB2017','Maruti Swift'),
(19,219,'Bike','MH01AB2018','Honda Activa'),
(20,220,'Auto','MH01AB2019','Bajaj RE'),
(21,221,'Cab','MH01AB2020','Maruti Swift'),
(22,222,'Bike','MH01AB2021','Honda Activa'),
(23,223,'Auto','MH01AB2022','Bajaj RE'),
(24,224,'Cab','MH01AB2023','Maruti Swift'),
(25,225,'Bike','MH01AB2024','Honda Activa'),
(26,226,'Auto','MH01AB2025','Bajaj RE'),
(27,227,'Cab','MH01AB2026','Maruti Swift'),
(28,228,'Bike','MH01AB2027','Honda Activa'),
(29,229,'Auto','MH01AB2028','Bajaj RE'),
(30,230,'Cab','MH01AB2029','Maruti Swift'),
(31,231,'Bike','MH01AB2030','Honda Activa'),
(32,232,'Auto','MH01AB2031','Bajaj RE'),
(33,233,'Cab','MH01AB2032','Maruti Swift'),
(34,234,'Bike','MH01AB2033','Honda Activa'),
(35,235,'Auto','MH01AB2034','Bajaj RE'),
(36,236,'Cab','MH01AB2035','Maruti Swift'),
(37,237,'Bike','MH01AB2036','Honda Activa'),
(38,238,'Auto','MH01AB2037','Bajaj RE'),
(39,239,'Cab','MH01AB2038','Maruti Swift'),
(40,240,'Bike','MH01AB2039','Honda Activa'),
(41,241,'Auto','MH01AB2040','Bajaj RE'),
(42,242,'Cab','MH01AB2041','Maruti Swift'),
(43,243,'Bike','MH01AB2042','Honda Activa'),
(44,244,'Auto','MH01AB2043','Bajaj RE'),
(45,245,'Cab','MH01AB2044','Maruti Swift'),
(46,246,'Bike','MH01AB2045','Honda Activa'),
(47,247,'Auto','MH01AB2046','Bajaj RE'),
(48,248,'Cab','MH01AB2047','Maruti Swift'),
(49,249,'Bike','MH01AB2048','Honda Activa'),
(50,250,'Auto','MH01AB2049','Bajaj RE'),
(51,251,'Cab','MH01AB2050','Maruti Swift'),
(52,252,'Bike','MH01AB2051','Honda Activa'),
(53,253,'Auto','MH01AB2052','Bajaj RE'),
(54,254,'Cab','MH01AB2053','Maruti Swift'),
(55,255,'Bike','MH01AB2054','Honda Activa'),
(56,256,'Auto','MH01AB2055','Bajaj RE'),
(57,257,'Cab','MH01AB2056','Maruti Swift'),
(58,258,'Bike','MH01AB2057','Honda Activa'),
(59,259,'Auto','MH01AB2058','Bajaj RE'),
(60,260,'Cab','MH01AB2059','Maruti Swift'),
(61,261,'Bike','MH01AB2060','Honda Activa'),
(62,262,'Auto','MH01AB2061','Bajaj RE'),
(63,263,'Cab','MH01AB2062','Maruti Swift'),
(64,264,'Bike','MH01AB2063','Honda Activa'),
(65,265,'Auto','MH01AB2064','Bajaj RE'),
(66,266,'Cab','MH01AB2065','Maruti Swift'),
(67,267,'Bike','MH01AB2066','Honda Activa'),
(68,268,'Auto','MH01AB2067','Bajaj RE'),
(69,269,'Cab','MH01AB2068','Maruti Swift'),
(70,270,'Bike','MH01AB2069','Honda Activa'),
(71,271,'Auto','MH01AB2070','Bajaj RE'),
(72,272,'Cab','MH01AB2071','Maruti Swift'),
(73,273,'Bike','MH01AB2072','Honda Activa'),
(74,274,'Auto','MH01AB2073','Bajaj RE'),
(75,275,'Cab','MH01AB2074','Maruti Swift'),
(76,276,'Bike','MH01AB2075','Honda Activa'),
(77,277,'Auto','MH01AB2076','Bajaj RE'),
(78,278,'Cab','MH01AB2077','Maruti Swift'),
(79,279,'Bike','MH01AB2078','Honda Activa'),
(80,280,'Auto','MH01AB2079','Bajaj RE'),
(81,281,'Cab','MH01AB2080','Maruti Swift'),
(82,282,'Bike','MH01AB2081','Honda Activa'),
(83,283,'Auto','MH01AB2082','Bajaj RE'),
(84,284,'Cab','MH01AB2083','Maruti Swift'),
(85,285,'Bike','MH01AB2084','Honda Activa'),
(86,286,'Auto','MH01AB2085','Bajaj RE'),
(87,287,'Cab','MH01AB2086','Maruti Swift'),
(88,288,'Bike','MH01AB2087','Honda Activa'),
(89,289,'Auto','MH01AB2088','Bajaj RE'),
(90,290,'Cab','MH01AB2089','Maruti Swift'),
(91,291,'Bike','MH01AB2090','Honda Activa'),
(92,292,'Auto','MH01AB2091','Bajaj RE'),
(93,293,'Cab','MH01AB2092','Maruti Swift'),
(94,294,'Bike','MH01AB2093','Honda Activa'),
(95,295,'Auto','MH01AB2094','Bajaj RE'),
(96,296,'Cab','MH01AB2095','Maruti Swift'),
(97,297,'Bike','MH01AB2096','Honda Activa'),
(98,298,'Auto','MH01AB2097','Bajaj RE'),
(99,299,'Cab','MH01AB2098','Maruti Swift'),
(100,300,'Bike','MH01AB2099','Honda Activa');

-- 4. BOOKINGS: 100 records
INSERT INTO Bookings
(BookingID, CustomerID, DriverID, PickupLocation, DropLocation, BookingDate, BookingTime, Status)
VALUES
(1,101,201,'Andheri','Bandra','2026-01-01','08:15:00','Completed'),
(2,102,202,'Borivali','Malad','2026-01-02','09:30:00','Completed'),
(3,103,203,'Dadar','Kurla','2026-01-03','10:15:00','Completed'),
(4,104,204,'Thane','Mulund','2026-01-04','11:00:00','Cancelled'),
(5,105,205,'Vile Parle','Andheri','2026-01-05','08:45:00','Completed'),
(6,106,206,'Powai','Ghatkopar','2026-01-06','09:15:00','Completed'),
(7,107,207,'Bandra','Worli','2026-01-07','10:30:00','Completed'),
(8,108,208,'Malad','Goregaon','2026-01-08','11:45:00','Completed'),
(9,109,209,'Kurla','Sion','2026-01-09','12:15:00','Cancelled'),
(10,110,210,'Churchgate','Colaba','2026-01-10','13:00:00','Completed'),
(11,111,211,'Andheri','Jogeshwari','2026-01-11','08:30:00','Completed'),
(12,112,212,'Dadar','Matunga','2026-01-12','09:00:00','Completed'),
(13,113,213,'Bandra','Santacruz','2026-01-13','09:45:00','Completed'),
(14,114,214,'Thane','Bhandup','2026-01-14','10:30:00','Completed'),
(15,115,215,'Goregaon','Malad','2026-01-15','11:15:00','Cancelled'),
(16,116,216,'Borivali','Kandivali','2026-01-16','12:00:00','Completed'),
(17,117,217,'Kurla','Chembur','2026-01-17','12:45:00','Completed'),
(18,118,218,'Powai','Vikhroli','2026-01-18','13:30:00','Completed'),
(19,119,219,'Worli','Prabhadevi','2026-01-19','14:15:00','Completed'),
(20,120,220,'Colaba','Churchgate','2026-01-20','15:00:00','Completed'),
(21,121,221,'Andheri','Bandra','2026-01-21','08:15:00','Completed'),
(22,122,222,'Malad','Kandivali','2026-01-22','09:30:00','Completed'),
(23,123,223,'Dadar','Lower Parel','2026-01-23','10:15:00','Cancelled'),
(24,124,224,'Ghatkopar','Powai','2026-01-24','11:00:00','Completed'),
(25,125,225,'Thane','Mulund','2026-01-25','11:45:00','Completed'),
(26,126,226,'Santacruz','Bandra','2026-01-26','12:30:00','Completed'),
(27,127,227,'Kurla','Sion','2026-01-27','13:15:00','Completed'),
(28,128,228,'Goregaon','Andheri','2026-01-28','14:00:00','Completed'),
(29,129,229,'Borivali','Malad','2026-01-29','14:45:00','Completed'),
(30,130,230,'Vile Parle','Santacruz','2026-01-30','15:30:00','Cancelled'),
(31,131,231,'Bandra','Juhu','2026-02-01','08:15:00','Completed'),
(32,132,232,'Dadar','Sion','2026-02-02','09:30:00','Completed'),
(33,133,233,'Thane','Ghatkopar','2026-02-03','10:15:00','Completed'),
(34,134,234,'Powai','Andheri','2026-02-04','11:00:00','Completed'),
(35,135,235,'Kurla','Bandra','2026-02-05','08:45:00','Cancelled'),
(36,136,236,'Malad','Goregaon','2026-02-06','09:15:00','Completed'),
(37,137,237,'Andheri','Powai','2026-02-07','10:30:00','Completed'),
(38,138,238,'Colaba','Dadar','2026-02-08','11:45:00','Completed'),
(39,139,239,'Worli','Bandra','2026-02-09','12:15:00','Completed'),
(40,140,240,'Mulund','Thane','2026-02-10','13:00:00','Completed'),
(41,141,241,'Chembur','Kurla','2026-02-11','08:30:00','Completed'),
(42,142,242,'Vikhroli','Ghatkopar','2026-02-12','09:00:00','Cancelled'),
(43,143,243,'Juhu','Andheri','2026-02-13','09:45:00','Completed'),
(44,144,244,'Bandra','Santacruz','2026-02-14','10:30:00','Completed'),
(45,145,245,'Malad','Bandra','2026-02-15','11:15:00','Completed'),
(46,146,246,'Kandivali','Borivali','2026-02-16','12:00:00','Completed'),
(47,147,247,'Sion','Dadar','2026-02-17','12:45:00','Completed'),
(48,148,248,'Goregaon','Jogeshwari','2026-02-18','13:30:00','Cancelled'),
(49,149,249,'Andheri','Vile Parle','2026-02-19','14:15:00','Completed'),
(50,150,250,'Churchgate','Worli','2026-02-20','15:00:00','Completed'),
(51,151,251,'Bandra','Andheri','2026-02-21','08:15:00','Completed'),
(52,152,252,'Powai','Ghatkopar','2026-02-22','09:30:00','Completed'),
(53,153,253,'Thane','Dadar','2026-02-23','10:15:00','Completed'),
(54,154,254,'Kurla','Chembur','2026-02-24','11:00:00','Cancelled'),
(55,155,255,'Malad','Borivali','2026-02-25','11:45:00','Completed'),
(56,156,256,'Dadar','Bandra','2026-02-26','12:30:00','Completed'),
(57,157,257,'Ghatkopar','Vikhroli','2026-02-27','13:15:00','Completed'),
(58,158,258,'Santacruz','Juhu','2026-02-28','14:00:00','Completed'),
(59,159,259,'Worli','Colaba','2026-03-01','14:45:00','Completed'),
(60,160,260,'Mulund','Bhandup','2026-03-02','15:30:00','Completed'),
(61,161,261,'Andheri','Goregaon','2026-03-01','08:15:00','Completed'),
(62,162,262,'Bandra','Worli','2026-03-02','09:30:00','Cancelled'),
(63,163,263,'Borivali','Kandivali','2026-03-03','10:15:00','Completed'),
(64,164,264,'Dadar','Matunga','2026-03-04','11:00:00','Completed'),
(65,165,265,'Kurla','Sion','2026-03-05','08:45:00','Completed'),
(66,166,266,'Powai','Andheri','2026-03-06','09:15:00','Completed'),
(67,167,267,'Thane','Mulund','2026-03-07','10:30:00','Completed'),
(68,168,268,'Malad','Goregaon','2026-03-08','11:45:00','Cancelled'),
(69,169,269,'Bandra','Juhu','2026-03-09','12:15:00','Completed'),
(70,170,270,'Vile Parle','Bandra','2026-03-10','13:00:00','Completed'),
(71,171,271,'Andheri','Churchgate','2026-03-11','08:30:00','Completed'),
(72,172,272,'Colaba','Dadar','2026-03-12','09:00:00','Completed'),
(73,173,273,'Ghatkopar','Kurla','2026-03-13','09:45:00','Completed'),
(74,174,274,'Bandra','Santacruz','2026-03-14','10:30:00','Cancelled'),
(75,175,275,'Goregaon','Malad','2026-03-15','11:15:00','Completed'),
(76,176,276,'Thane','Powai','2026-03-16','12:00:00','Completed'),
(77,177,277,'Sion','Dadar','2026-03-17','12:45:00','Completed'),
(78,178,278,'Borivali','Andheri','2026-03-18','13:30:00','Completed'),
(79,179,279,'Worli','Bandra','2026-03-19','14:15:00','Completed'),
(80,180,280,'Kurla','Ghatkopar','2026-03-20','15:00:00','Completed'),
(81,181,281,'Andheri','Bandra','2026-03-21','08:15:00','Cancelled'),
(82,182,282,'Malad','Andheri','2026-03-22','09:30:00','Completed'),
(83,183,283,'Dadar','Worli','2026-03-23','10:15:00','Completed'),
(84,184,284,'Powai','Vikhroli','2026-03-24','11:00:00','Completed'),
(85,185,285,'Thane','Dadar','2026-03-25','11:45:00','Completed'),
(86,186,286,'Santacruz','Bandra','2026-03-26','12:30:00','Completed'),
(87,187,287,'Juhu','Andheri','2026-03-27','13:15:00','Completed'),
(88,188,288,'Goregaon','Borivali','2026-03-28','14:00:00','Cancelled'),
(89,189,289,'Chembur','Kurla','2026-03-29','14:45:00','Completed'),
(90,190,290,'Bandra','Worli','2026-03-30','15:30:00','Completed'),
(91,191,291,'Vile Parle','Andheri','2026-04-01','08:15:00','Completed'),
(92,192,292,'Mulund','Thane','2026-04-02','09:30:00','Completed'),
(93,193,293,'Ghatkopar','Powai','2026-04-03','10:15:00','Cancelled'),
(94,194,294,'Dadar','Bandra','2026-04-04','11:00:00','Completed'),
(95,195,295,'Malad','Goregaon','2026-04-05','08:45:00','Completed'),
(96,196,296,'Kandivali','Borivali','2026-04-06','09:15:00','Completed'),
(97,197,297,'Churchgate','Colaba','2026-04-07','10:30:00','Completed'),
(98,198,298,'Andheri','Powai','2026-04-08','11:45:00','Completed'),
(99,199,299,'Bandra','Juhu','2026-04-09','12:15:00','Completed'),
(100,200,300,'Dadar','Matunga','2026-04-10','13:00:00','Completed');

INSERT INTO Payments
(PaymentID, BookingID, Amount, PaymentMethod, PaymentStatus)
VALUES
(1,1,180,'UPI','Paid'),
(2,2,150,'Cash','Paid'),
(3,3,170,'Card','Paid'),
(4,4,120,'UPI','Refunded'),
(5,5,130,'UPI','Paid'),
(6,6,140,'Card','Paid'),
(7,7,160,'Cash','Paid'),
(8,8,110,'UPI','Paid'),
(9,9,100,'Card','Refunded'),
(10,10,190,'UPI','Paid'),
(11,11,100,'Cash','Paid'),
(12,12,90,'UPI','Paid'),
(13,13,120,'Card','Paid'),
(14,14,130,'UPI','Paid'),
(15,15,110,'Cash','Refunded'),
(16,16,100,'UPI','Paid'),
(17,17,120,'Card','Paid'),
(18,18,130,'UPI','Paid'),
(19,19,140,'Cash','Paid'),
(20,20,150,'Card','Paid'),
(21,21,180,'UPI','Paid'),
(22,22,110,'Cash','Paid'),
(23,23,150,'Card','Refunded'),
(24,24,140,'UPI','Paid'),
(25,25,120,'UPI','Paid'),
(26,26,130,'Card','Paid'),
(27,27,100,'Cash','Paid'),
(28,28,120,'UPI','Paid'),
(29,29,150,'Card','Paid'),
(30,30,100,'Cash','Refunded'),
(31,31,130,'UPI','Paid'),
(32,32,110,'Card','Paid'),
(33,33,180,'UPI','Paid'),
(34,34,200,'Cash','Paid'),
(35,35,190,'Card','Refunded'),
(36,36,110,'UPI','Paid'),
(37,37,210,'Card','Paid'),
(38,38,220,'UPI','Paid'),
(39,39,160,'Cash','Paid'),
(40,40,120,'Card','Paid'),
(41,41,130,'UPI','Paid'),
(42,42,110,'Cash','Refunded'),
(43,43,170,'UPI','Paid'),
(44,44,120,'Card','Paid'),
(45,45,180,'UPI','Paid'),
(46,46,110,'Cash','Paid'),
(47,47,100,'Card','Paid'),
(48,48,100,'UPI','Refunded'),
(49,49,120,'Cash','Paid'),
(50,50,180,'Card','Paid'),
(51,51,180,'UPI','Paid'),
(52,52,140,'Card','Paid'),
(53,53,220,'UPI','Paid'),
(54,54,120,'Cash','Refunded'),
(55,55,150,'UPI','Paid'),
(56,56,190,'Card','Paid'),
(57,57,110,'UPI','Paid'),
(58,58,120,'Cash','Paid'),
(59,59,170,'Card','Paid'),
(60,60,100,'UPI','Paid'),
(61,61,140,'Cash','Paid'),
(62,62,160,'Card','Refunded'),
(63,63,100,'UPI','Paid'),
(64,64,90,'Cash','Paid'),
(65,65,100,'Card','Paid'),
(66,66,200,'UPI','Paid'),
(67,67,120,'Card','Paid'),
(68,68,110,'Cash','Refunded'),
(69,69,130,'UPI','Paid'),
(70,70,150,'Card','Paid'),
(71,71,210,'UPI','Paid'),
(72,72,220,'Cash','Paid'),
(73,73,130,'Card','Paid'),
(74,74,120,'UPI','Refunded'),
(75,75,110,'Cash','Paid'),
(76,76,190,'UPI','Paid'),
(77,77,110,'Card','Paid'),
(78,78,190,'UPI','Paid'),
(79,79,160,'Cash','Paid'),
(80,80,120,'Card','Paid'),
(81,81,180,'UPI','Refunded'),
(82,82,140,'Cash','Paid'),
(83,83,170,'Card','Paid'),
(84,84,130,'UPI','Paid'),
(85,85,220,'Card','Paid'),
(86,86,120,'Cash','Paid'),
(87,87,170,'UPI','Paid'),
(88,88,160,'Card','Refunded'),
(89,89,120,'UPI','Paid'),
(90,90,160,'Cash','Paid'),
(91,91,130,'Card','Paid'),
(92,92,120,'UPI','Paid'),
(93,93,140,'Cash','Refunded'),
(94,94,190,'UPI','Paid'),
(95,95,110,'Card','Paid'),
(96,96,100,'UPI','Paid'),
(97,97,150,'Cash','Paid'),
(98,98,210,'Card','Paid'),
(99,99,130,'UPI','Paid'),
(100,100,90,'Cash','Paid');

INSERT INTO Ratings
(RatingID, BookingID, CustomerID, DriverID, Rating, Review)
VALUES
(1,1,101,201,5,'Excellent ride'),
(2,2,102,202,4,'Good service'),
(3,3,103,203,5,'Very good driver'),
(4,4,104,204,3,'Average experience'),
(5,5,105,205,5,'Excellent service'),
(6,6,106,206,4,'Good ride'),
(7,7,107,207,5,'Very comfortable'),
(8,8,108,208,4,'Good experience'),
(9,9,109,209,2,'Ride was cancelled'),
(10,10,110,210,5,'Excellent'),
(11,11,111,211,4,'Good service'),
(12,12,112,212,5,'Very good'),
(13,13,113,213,4,'Nice ride'),
(14,14,114,214,5,'Excellent driver'),
(15,15,115,215,2,'Ride was cancelled'),
(16,16,116,216,4,'Good ride'),
(17,17,117,217,5,'Excellent service'),
(18,18,118,218,4,'Good experience'),
(19,19,119,219,5,'Very comfortable'),
(20,20,120,220,4,'Good driver'),
(21,21,121,221,5,'Excellent ride'),
(22,22,122,222,4,'Good service'),
(23,23,123,223,2,'Ride was cancelled'),
(24,24,124,224,5,'Excellent'),
(25,25,125,225,4,'Good ride'),
(26,26,126,226,5,'Very good service'),
(27,27,127,227,4,'Nice experience'),
(28,28,128,228,5,'Excellent driver'),
(29,29,129,229,4,'Good ride'),
(30,30,130,230,2,'Ride was cancelled'),
(31,31,131,231,5,'Excellent service'),
(32,32,132,232,4,'Good experience'),
(33,33,133,233,5,'Very good ride'),
(34,34,134,234,4,'Good driver'),
(35,35,135,235,2,'Ride was cancelled'),
(36,36,136,236,5,'Excellent'),
(37,37,137,237,5,'Excellent service'),
(38,38,138,238,4,'Good ride'),
(39,39,139,239,5,'Very comfortable'),
(40,40,140,240,4,'Good experience'),
(41,41,141,241,5,'Excellent ride'),
(42,42,142,242,2,'Ride was cancelled'),
(43,43,143,243,4,'Good service'),
(44,44,144,244,5,'Excellent driver'),
(45,45,145,245,4,'Good ride'),
(46,46,146,246,5,'Very good'),
(47,47,147,247,4,'Nice experience'),
(48,48,148,248,2,'Ride was cancelled'),
(49,49,149,249,5,'Excellent'),
(50,50,150,250,4,'Good service'),
(51,51,151,251,5,'Excellent ride'),
(52,52,152,252,4,'Good experience'),
(53,53,153,253,5,'Very good driver'),
(54,54,154,254,2,'Ride was cancelled'),
(55,55,155,255,4,'Good ride'),
(56,56,156,256,5,'Excellent service'),
(57,57,157,257,4,'Good experience'),
(58,58,158,258,5,'Excellent'),
(59,59,159,259,4,'Good driver'),
(60,60,160,260,5,'Very comfortable'),
(61,61,161,261,4,'Good service'),
(62,62,162,262,2,'Ride was cancelled'),
(63,63,163,263,5,'Excellent ride'),
(64,64,164,264,4,'Good experience'),
(65,65,165,265,5,'Very good'),
(66,66,166,266,4,'Good driver'),
(67,67,167,267,5,'Excellent service'),
(68,68,168,268,2,'Ride was cancelled'),
(69,69,169,269,4,'Good ride'),
(70,70,170,270,5,'Excellent experience'),
(71,71,171,271,4,'Good service'),
(72,72,172,272,5,'Very good driver'),
(73,73,173,273,4,'Good ride'),
(74,74,174,274,2,'Ride was cancelled'),
(75,75,175,275,5,'Excellent'),
(76,76,176,276,4,'Good experience'),
(77,77,177,277,5,'Very comfortable'),
(78,78,178,278,4,'Good service'),
(79,79,179,279,5,'Excellent ride'),
(80,80,180,280,4,'Good driver'),
(81,81,181,281,2,'Ride was cancelled'),
(82,82,182,282,5,'Excellent service'),
(83,83,183,283,4,'Good ride'),
(84,84,184,284,5,'Very good'),
(85,85,185,285,4,'Good experience'),
(86,86,186,286,5,'Excellent driver'),
(87,87,187,287,4,'Good service'),
(88,88,188,288,2,'Ride was cancelled'),
(89,89,189,289,5,'Excellent ride'),
(90,90,190,290,4,'Good experience'),
(91,91,191,291,5,'Very good'),
(92,92,192,292,4,'Good driver'),
(93,93,193,293,2,'Ride was cancelled'),
(94,94,194,294,5,'Excellent service'),
(95,95,195,295,4,'Good ride'),
(96,96,196,296,5,'Excellent experience'),
(97,97,197,297,4,'Good service'),
(98,98,198,298,5,'Very good driver'),
(99,99,199,299,4,'Good ride'),
(100,100,200,300,5,'Excellent service');

select* from ratings;

select CustomerID,CustomerName,Phone,Email
from customers;

SELECT *
FROM payments
WHERE PaymentMethod = 'upi';

select *
from payments
where Amount >200;

select *
from payments
where Amount between 150 AND 200;

select *
from payments
where Amount NOT between 150 AND 200;

select*from customers;

select *
from customers
where customerid in (150,151,152,153,154,155);

select* from customers
where customername like 'S%';

select *from customers
where customername like '%_S';
 
 select *from bookings 
 order by  bookingid desc;
 
 select*from drivers
 order by drivername asc
 limit 5;
 
 select *from drivers;
 
 select*from drivers
 order by drivername asc
 limit 5 offset 2;
 
 select *from bookings;
 select *from customers;
 select *from payments;
 select *from ratings;
 select *from vehicles;
 
SELECT DISTINCT Model
FROM Vehicles;

SELECT DISTINCT paymentmethod
FROM payments;

select *from payments
where paymentmethod like 'upi';

SELECT *
FROM customers
WHERE phone IS NULL;

SELECT CustomerName,
UPPER(CustomerName) AS Name_in_cap
FROM customers;

SELECT CustomerName,
lower(CustomerName) AS Lowercasename
FROM customers;

select customername,
length(customername) as name_length
from customers;

select drivername,
left(drivername,3) as INITIAL
from drivers;

select drivername,
concat(drivername) as full_name
from drivers;

select customername,
ifnull(phone,'not available') as phonenumber
from customers;

select bookingid,
datediff(curdate(),bookingdate) as DAYS
from bookings;

SELECT
    drivername,
    NULLIF(drivername,'aarav sharma') AS Result
FROM drivers;

SELECT MAX(amount) AS highest_amount
FROM payments;

SELECT min(amount) AS lowest_amount
FROM payments;

SELECT COUNT(amount) AS total_amount
FROM payments;

select paymentId, bookingid,amount,
rank() over(order by amount desc)
from payments;

select paymentId, bookingid,amount,
dense_rank() over(order by amount desc)
from payments;


select bookingId, paymentid,amount,
row_number() over(order by amount desc)
from payments;

SELECT City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY City;


SELECT City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY City
HAVING COUNT(*) > 2;


SELECT CustomerName, CustomerID
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Bookings
);

SELECT 
    b.BookingID,
    c.CustomerName,
    b.PickupLocation,
    b.DropLocation,
    b.Status
FROM Bookings b
INNER JOIN Customers c
ON b.CustomerID = c.CustomerID;


(MySQL does not have a direct FULL OUTER JOIN. You can simulate it using LEFT JOIN + RIGHT JOIN with UNION)

SELECT c.CustomerID, c.CustomerName, b.BookingID
FROM Customers c
LEFT JOIN Bookings b
ON c.CustomerID = b.CustomerID

UNION

SELECT c.CustomerID, c.CustomerName, b.BookingID
FROM Customers c
RIGHT JOIN Bookings b
ON c.CustomerID = b.CustomerID;

SELECT 
    c.CustomerID,
    c.CustomerName,
    b.BookingID,
    b.Status
FROM Customers c
LEFT JOIN Bookings b
ON c.CustomerID = b.CustomerID;

SELECT 
    c.CustomerName,
    b.BookingID,
    b.PickupLocation,
    b.DropLocation
FROM Customers c
RIGHT JOIN Bookings b
ON c.CustomerID = b.CustomerID;

SELECT 
    c.CustomerName,
    d.DriverName
FROM Customers c
CROSS JOIN Drivers d;

CREATE VIEW BookingDetails AS
SELECT
    b.BookingID,
    c.CustomerName,
    d.DriverName,
    b.PickupLocation,
    b.DropLocation,
    b.BookingDate,
    b.BookingTime,
    b.Status
FROM Bookings b
INNER JOIN Customers c
    ON b.CustomerID = c.CustomerID
INNER JOIN Drivers d
    ON b.DriverID = d.DriverID;
    
SELECT * FROM BookingDetails;


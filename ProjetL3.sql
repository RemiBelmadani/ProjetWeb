CREATE DATABASE if not exists Jewelry;
USE Jewelry;

DROP TABLE if exists Clients;
DROP TABLE if exists Brands;
DROP TABLE if exists Jewels;

create table Orders (
	Order_ID INT auto_increment primary key,
    N°_Orders varchar(10),
    Orders_adress varchar (20),
    Orders_product varchar(50),
    Orders_number int,
    
	Constraint fk_Orders foreign key (N°_Orders) REFERENCES Clients (Client_ID)
);

CREATE TABLE Clients ( 
    Client_ID INT auto_increment primary key,
    Client_name varchar(20) NOT NULL,
    Client_mail varchar(50) NOT NULL,
    Client_phone varchar(20) NOT NULL,
    Client_address varchar(50) NOT NULL,
	Passwords varchar(20) NOT NULL,
    Orders varchar(50) not null,
    CONSTRAINT chk_Clien_age CHECK (Client_age > 13)
);

CREATE TABLE Jewels (
	Jewel_ID INT auto_increment primary key,
    Jewel_material varchar (20),
    size int,
    price float NOT NULL,
    Jewel_name varchar (20),
	Stone varchar (9),
    Category varchar(15)
);

 INSERT INTO Jewels VALUES
-- silver necklaces
(1,'silver',50,50, 'Silver Necklace','no'),
(2,'silver',52,50, 'Silver Necklace','no'),
-- gold necklaces
(3,'gold',50,60, 'Gold Necklace','no'),
(4,'gold',52,60, 'Gold Necklace','no'),
-- platinium necklaces
(5,'platinium',50,80, 'Platinium Necklace','yes'),
(6,'platinium',52,80, 'Platinium Necklace','yes'),
-- biodegradable necklaces
(7,'biodegradable',50,1000, 'Biodegradable Necklace','yes'),
(8,'biodegradable',52,1000, 'Biodegradable Necklace','yes'),
-- silver rings
(9,'silver',50,'50€', 'Silver Ring','no'),
(10,'silver',52,'50€', 'Silver Ring','no'),
-- gold rings
(11,'gold',50,'60€', 'Gold Ring','no'),
(12,'gold',52,'60€', 'Gold Ring','no'),
-- platinium rings
(13,'platinium',50,'80€', 'Platinium Ring','yes'),
(14,'platinium',52,'80€', 'Platinium Ring','yes'),
-- biodegradable rings 
(15,'biodegradable',50,'2000€', 'Biodegradable Ring','yes'),
(16,'biodegradable',52,'2000€', 'Biodegradable Ring','yes'),
-- silver bracelets
(17,'silver',50,'50€', 'Silver Bracelet','no'),
(18,'silver',52,'50€', 'Silver Bracelet','no'),
-- gold bracelets
(19,'gold',50,'60€', 'Gold Bracelet','no'),
(20,'gold',52,'60€', 'Gold Bracelet','no'),
-- platinium bracelets
(21,'platinium',50,'80€', 'Platinium Bracelet','yes'),
(22,'platinium',52,'80€', 'Platinium Bracelet','yes'),
-- biodegradable bracelets
(23,'biodegradable',50,'3000€', 'Biodegradable Bracelet','yes'),
(24,'biodegradable',52,'3000€', 'Biodegradable Bracelet','yes'),
-- silver earrings
(25,'silver',0,'50€', 'Silver Earring','no'),
-- gold earrings
(26,'gold',0,'60€', 'Gold Earring','no'),
-- platinium earrings
(27,'platinium',0,'80€', 'Platinium Earring','yes'),
-- biodegradable earrings
(28,'biodegradable',0,'100€', 'Biodegradable Earring','yes');


/*
SELECT * FROM Earrings;
SELECT * FROM Rings;
SELECT * FROM Bracelets;
SELECT * FROM Necklaces;
SELECT * FROM Jewels;
*/

SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "silver";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "gold";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "platinium";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "biodegradable";
SELECT Jewel_ID,Jewel_name FROM Jewels where Stone = "yes";
SELECT Jewel_ID,Jewel_name FROM Jewels where Stone = "no";
SELECT Jewel_ID,Jewel_name FROM Jewels where 



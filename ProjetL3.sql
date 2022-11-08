CREATE DATABASE if not exists Jewelry;
USE Jewelry;

DROP TABLE if exists Clients;
DROP TABLE if exists Bracelets;
DROP TABLE if exists Earrings;
DROP TABLE if exists Rings;
DROP TABLE if exists Necklaces;
DROP TABLE if exists Brands;
DROP TABLE if exists Jewels;


create table Brands (
	Brand_ID INT auto_increment primary key,
	Brand_name varchar(15)
);

CREATE TABLE Clients ( 
    Client_ID INT auto_increment primary key,
    Client_name varchar(20) NOT NULL,
    Client_mail varchar(50) NOT NULL,
    Client_phone varchar(20) NOT NULL,
    Client_age INT NOT NULL,
	Passwords varchar(20) NOT NULL,
    CONSTRAINT chk_Clien_age CHECK (Client_age > 13)
);
    
CREATE TABLE Rings (
	Ring_ID INT auto_increment primary key,
    Ring_material varchar (20),
    size int,
    price varchar(15) NOT NULL,
    Ring_name varchar (20),
    Stone varchar (9)
);
    
   CREATE TABLE Earrings (
	Earring_ID INT auto_increment primary key,
    Earring_material varchar (20),
    size int,
    price varchar(15) NOT NULL,
    Earring_name varchar (20),
	Stone varchar (9)
); 

CREATE TABLE Necklaces (
	Necklace_ID INT auto_increment primary key,
    Necklace_material varchar (20),
    size int,
    price varchar(15) NOT NULL,
    Necklace_name varchar (20),
	Stone varchar (9)
);

CREATE TABLE Bracelets (
	Bracelet_ID INT auto_increment primary key,
    Bracelet_material varchar (20),
    size int,
    price varchar(15) NOT NULL,
    Bracelet_name varchar (20),
	Stone varchar (9)
);

CREATE TABLE Jewels (
	Jewel_ID INT auto_increment primary key,
    Jewel_material varchar (20),
    size int,
    price varchar(15) NOT NULL,
    Jewel_name varchar (20),
	Stone varchar (9)
);

INSERT INTO Brands VALUES (100, 'Remi&Steve');

INSERT INTO Necklaces VALUES
-- silver necklaces
(1,'silver',50,'50€', 'Necklace','no'),
(2,'silver',52,'50€', 'Necklace','no'),
-- gold necklaces
(3,'gold',50,'60€', 'Necklace','no'),
(4,'gold',52,'60€', 'Necklace','no'),
-- platinium necklaces
(5,'platinium',50,'80€', 'Necklace','yes'),
(6,'platinium',52,'80€', 'Necklace','yes'),
-- biodegradable necklaces
(7,'biodegradable',50,'1000€', 'Necklace','yes'),
(8,'biodegradable',52,'1000€', 'Necklace','yes');

INSERT INTO Rings VALUES
-- silver rings
(9,'silver',50,'50€', 'Ring','no'),
(10,'silver',52,'50€', 'Ring','no'),
-- gold rings
(11,'gold',50,'60€', 'Ring','no'),
(12,'gold',52,'60€', 'Ring','no'),
-- platinium rings
(13,'platinium',50,'80€', 'Ring','yes'),
(14,'platinium',52,'80€', 'Ring','yes'),
-- biodegradable rings 
(15,'biodegradable',50,'2000€', 'Ring','yes'),
(16,'biodegradable',52,'2000€', 'Ring','yes');

INSERT INTO Bracelets VALUES
-- silver bracelets
(17,'silver',50,'50€', 'Bracelet','no'),
(18,'silver',52,'50€', 'Bracelet','no'),
-- gold bracelets
(19,'gold',50,'60€', 'Bracelet','no'),
(20,'gold',52,'60€', 'Bracelet','no'),
-- platinium bracelets
(21,'platinium',50,'80€', 'Bracelet','yes'),
(22,'platinium',52,'80€', 'Bracelet','yes'),
-- biodegradable bracelets
(23,'biodegradable',50,'3000€', 'Bracelet','yes'),
(24,'biodegradable',52,'3000€', 'Bracelet','yes'); 

INSERT INTO Earrings VALUES
-- silver earrings
(25,'silver',0,'50€', 'Earring','no'),
-- gold earrings
(26,'gold',0,'60€', 'Earring','no'),
-- platinium earrings
(27,'platinium',0,'80€', 'Earring','yes'),
-- biodegradable earrings
(28,'biodegradable',0,'100€', 'Earring','yes');

 INSERT INTO Jewels VALUES
-- silver necklaces
(1,'silver',50,'50€', 'Silver Necklace','no'),
(2,'silver',52,'50€', 'Silver Necklace','no'),
-- gold necklaces
(3,'gold',50,'60€', 'Gold Necklace','no'),
(4,'gold',52,'60€', 'Gold Necklace','no'),
-- platinium necklaces
(5,'platinium',50,'80€', 'Platinium Necklace','yes'),
(6,'platinium',52,'80€', 'Platinium Necklace','yes'),
-- biodegradable necklaces
(7,'biodegradable',50,'1000€', 'Biodegradable Necklace','yes'),
(8,'biodegradable',52,'1000€', 'Biodegradable Necklace','yes'),
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
select Jewel_ID,Jewel_name from Jewels where 

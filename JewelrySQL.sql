CREATE DATABASE if not exists Jewelry;
USE Jewelry;

DROP TABLE if exists Orders;
DROP TABLE if exists Clients;
DROP TABLE if exists Jewels;

CREATE TABLE Clients ( 
    Client_ID INT auto_increment primary key,
    Client_name varchar(20) NOT NULL,
    Client_mail varchar(50) NOT NULL,
    Client_phone varchar(20) NOT NULL,
    Client_address varchar(50) NOT NULL,
	Passwords varchar(20) NOT NULL,
    Orders varchar(50) not null
);

CREATE TABLE Jewels (
	Jewel_ID INT auto_increment primary key,
    Jewel_material varchar (20),
    size int,
    price float NOT NULL,
    Jewel_name varchar (100),
	Stone varchar (9),
    Jewel_category varchar(25)
);

CREATE TABLE Orders (
	Order_ID INT auto_increment primary key,
	Orders_product varchar(50) NOT NULL,
    Orders_adress varchar (20) NOT NULL,
    type_Orders varchar(50) NOT NULL,
    Orders_payment varchar(50) NOT NULL,
    Client_ID INT NOT NULL,
    foreign key(Client_ID) REFERENCES Clients(Client_ID)
    
	 -- CONSTRAINT fk_Orders FOREIGN KEY (Orders_product) REFERENCES Clients(Client_ID),
     -- CONSTRAINT fk_Orderssss foreign key (Orders_product) REFERENCES Jewels(Jewel_ID)
);

-- Error Code: 3780. Referencing column 'Orders_product' and referenced column 'Client_ID' in foreign key constraint 'fk_Orders' are incompatible.
-- Error Code: 3780. Referencing column 'Orders_product' and referenced column 'Jewel_ID' in foreign key constraint 'fk_Order' are incompatible.

 INSERT INTO Jewels VALUES
-- silver necklaces
(1,'silver',50,50, 'Silver Necklace','no','Necklace'),
(2,'silver',52,50, 'Silver Necklace','no','Necklace'),
-- gold necklaces
(3,'gold',50,60, 'Gold Necklace','no','Necklace'),
(4,'gold',52,60, 'Gold Necklace','no','Necklace'),
-- platinium necklaces
(5,'platinium',50,80, 'Platinium Necklace','yes','Necklace'),
(6,'platinium',52,80, 'Platinium Necklace','yes','Necklace'),
-- biodegradable necklaces
(7,'biodegradable',50,1000, 'Biodegradable Necklace','yes','Necklace'),
(8,'biodegradable',52,1000, 'Biodegradable Necklace','yes','Necklace'),
-- silver rings
(9,'silver',50,50, 'Silver Ring','no','Ring'),
(10,'silver',52,50, 'Silver Ring','no','Ring'),
-- gold rings
(11,'gold',50,60, 'Gold Ring','no','Ring'),
(12,'gold',52,60, 'Gold Ring','no','Ring'),
-- platinium rings
(13,'platinium',50,80, 'Platinium Ring','yes','Ring'),
(14,'platinium',52,80, 'Platinium Ring','yes','Ring'),
-- biodegradable rings 
(15,'biodegradable',50,2000, 'Biodegradable Ring','yes','Ring'),
(16,'biodegradable',52,2000, 'Biodegradable Ring','yes','Ring'),
-- silver bracelets
(17,'silver',50,50, 'Silver Bracelet','no','Bracelet'),
(18,'silver',52,50, 'Silver Bracelet','no','Bracelet'),
-- gold bracelets
(19,'gold',50,60, 'Gold Bracelet','no','Bracelet'),
(20,'gold',52,60, 'Gold Bracelet','no','Bracelet'),
-- platinium bracelets
(21,'platinium',50,80, 'Platinium Bracelet','yes','Bracelet'),
(22,'platinium',52,80, 'Platinium Bracelet','yes','Bracelet'),
-- biodegradable bracelets
(23,'biodegradable',50,3000, 'Biodegradable Bracelet','yes','Bracelet'),
(24,'biodegradable',52,3000, 'Biodegradable Bracelet','yes','Bracelet'),
-- silver earrings
(25,'silver',0,50, 'Silver Earring','no','Earring'),
-- gold earrings
(26,'gold',0,60, 'Gold Earring','no','Earring'),
-- platinium earrings
(27,'platinium',0,80, 'Platinium Earring','yes','Earring'),
-- biodegradable earrings
(28,'biodegradable',0,100, 'Biodegradable Earring','yes','Earring');


/*
SELECT * FROM Jewels;
*/

/*SELECT Jewel_ID,Jewel_name, Jewel_category FROM Jewels where Jewel_material = "silver";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "gold";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "platinium";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "biodegradable";
SELECT Jewel_ID,Jewel_name FROM Jewels where Stone = "yes";
SELECT Jewel_ID,Jewel_name FROM Jewels where Stone = "no";
SELECT Jewel_ID,Jewel_name, Jewel_category FROM Jewels where size = 50;*/
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_category = 'Necklace';

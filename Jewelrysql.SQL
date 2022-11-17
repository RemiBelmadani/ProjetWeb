CREATE DATABASE if not exists Jewelry;
USE Jewelry;

DROP TABLE if exists Orders;
DROP TABLE if exists Clients;
DROP TABLE if exists Jewels;

CREATE TABLE Clients ( 
	Client_ID INT auto_increment primary key,
	Client_name varchar(20) NOT NULL,
	Client_mail varchar(50) NOT NULL,
	Client_phone varchar(40) NOT NULL,
	Client_address varchar(50) NOT NULL,
	Passwords varchar(20) NOT NULL
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
	Orders_product_ID INT, -- varchar(50) NOT NULL,
    Name_of_product varchar(50),
	Orders_adress varchar (90) NOT NULL,
	Orders_payment varchar(50) NOT NULL,
	Number_of_product INT NOT NULL,
	order_date varchar(20) not null,
   	Client_ID INT NOT NULL,
	foreign key(Client_ID) REFERENCES Clients(Client_ID),
	foreign key (Orders_product_ID) REFERENCES Jewels(Jewel_ID)
);

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
 
INSERT INTO Clients VALUES
(1,'Rami','jose.rami@gmail.com','+33712345678','13 rue France','1234a'),
(2,'Christophe','robert.christophe@gmail.com','+33712345678','1 Avenue des Champs Elysées','1234a'),
(3,'Jean','jose.jean@gmail.com','+33712345678','19 Avenue des Champs Elysées','1234a'),
(4,'Bob','Jose.bob@gmail.com','+33712345678','13 Rue Mozart','1234a'),
(5,'wayne','bruce.wayne@gmail.com','+33712345678','17 Rue Mozart','1234a'),
(6,'kent','clark.kent@gmail.com','+33712345678','13 rue France','1234a'),
(7,'parker','peter.parker@gmail.com','+33712345678','35 rue de la Paix','1234a'),
(8,'stark','tony.stark@gmail.com','+33712345678','27 rue France','1234a'),
(9,'goku','son.goku@gmail.com','+33712345678','18 rue de la Paix','1234a'),
(10,'vegeta','vegeta@gmail.com','+33712345678','115 rue de la Liberté','1234a'),
(11,'bulma','bulma@gmail.com','+33712345678','23 Rue Mozart','1234a');

 INSERT INTO Orders VALUES
(1,1,'Silver Necklace','Avenue de la Liberté','Carte',1,'23/12/2022',6),
(2,3,'Gold Necklace','115 rue de la Liberté','Paypal',1,'23/12/2022',10),
(3,5,'Platinium Necklace','18 rue de la Paix','Carte',1,'23/12/2022',9),
(4,7,'Biodegradable Necklace','35 rue de la Paix','Paypal',2,'23/12/2022',7),
(12,9,'Silver Ring','35 rue de la Paix','Paypal',2,'23/12/2022',7),
(5,11,'Gold Ring','27 rue France','Apple Pay',1,'23/12/2022',8),
(6,14,'Platinium Ring','13 rue France','Apple Pay',1,'23/12/2022',1),
(7,16,'Biodegradable Ring','1 Avenue des Champs Elysées',' Carte',1,'23/12/2022',2),
(8,17,'Silver Bracelet','19 Avenue des Champs Elysées',' Apple Pay',1,'23/12/2022',3),
(9,19,'Gold Bracelet','13 Rue Mozart',' Carte',1,'23/12/2022',4),
(10,21,'Platinium Bracelet','17 Rue Mozart',' Carte',1,'23/12/2022',5),
(11,23,'Biodegradable Bracelet', '23 Rue Mozart', 'Apple Pay',3, '12/01/2023',11),
(13,27,'Platinium Earring','23 Rue Mozart','Apple Pay',3,'12/01/2023',11),
(14,28,'Biodegradable Earring','23 Rue Mozart','Apple Pay',3,'12/01/2023',11);

/*SELECT * FROM Jewels;
SELECT Jewel_ID,Jewel_name, Jewel_category FROM Jewels where Jewel_material = "silver";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "gold";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "platinium";
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_material = "biodegradable";
SELECT Jewel_ID,Jewel_name FROM Jewels where Stone = "yes";
SELECT Jewel_ID,Jewel_name FROM Jewels where Stone = "no";
SELECT Jewel_ID,Jewel_name, Jewel_category FROM Jewels where size = 50;
SELECT Jewel_ID,Jewel_name FROM Jewels where Jewel_category = 'Necklace';*/
-- Select * FROM Orders;

-- select * From Clients;

CREATE DATABASE if not exists Jewelry;
USE Jewelry;

DROP TABLE if exists Clients;
DROP TABLE if exists Jewels;
DROP TABLE if exists Brand;

create table Brand (
	Brand_ID INT auto_increment primary key,
	Brand_name varchar(15)
);

CREATE TABLE Clients ( 
    Client_ID INT auto_increment primary key,
    Client_name varchar(20),
    Client_mail varchar(50)
    );

CREATE TABLE Jewels (
	Jewel_ID INT auto_increment primary key,
    jewel_material varchar (10),
    size int,
    price varchar(15) NOT NULL,
    jewel_name varchar (20)
);

INSERT INTO brands VALUES (1, 'Remi&Steve');

INSERT INTO Jewels VALUES
-- silver neckless
(1,'silver',50,'50€', 'Neckless'),
(2,'silver',52,'50€', 'Neckless'),
-- gold neckless
(3,'gold',50,'60€', 'Neckless'),
(4,'gold',52,'60€', 'Neckless'),
-- platinium neckless
(5,'platinium',50,'80€', 'Neckless'),
(6,'platinium',52,'80€', 'Neckless'),
-- biodegradable neckless
(7,'biodegradable',50,'1000€', 'Neckless'),
(8,'biodegradable',52,'1000€', 'Neckless'),
-- silver rings
(9,'silver',50,'50€', 'Ring'),
(10,'silver',52,'50€', 'Ring'),
-- gold rings
(11,'gold',50,'60€', 'Ring'),
(12,'gold',52,'60€', 'Ring'),
-- platinium rings
(13,'platinium',50,'80€', 'Ring'),
(14,'platinium',52,'80€', 'Ring'),
-- biodegradable rings 
(15,'biodegradable',50,'2000€', 'Ring'),
(16,'biodegradable',52,'2000€', 'Ring'),
-- silver bracelets
(17,'silver',50,'50€', 'Bracelet'),
(18,'silver',52,'50€', 'Bracelet'),
-- gold bracelets
(19,'gold',50,'60€', 'Bracelet'),
(20,'gold',52,'60€', 'Bracelet'),
-- platinium bracelets
(21,'platinium',50,'80€', 'Bracelet'),
(22,'platinium',52,'80€', 'Bracelet'),
-- biodegradable bracelets
(23,'biodegradable',50,'3000€', 'Bracelet'),
(24,'biodegradable',52,'3000€', 'Bracelet'),
-- silver earrings
(25,'silver',0,'50€', 'Earring'),
-- gold earrings
(26,'gold',0,'60€', 'Earring'),
-- platinium earrings
(27,'platinium',0,'80€', 'Earring'),
-- biodegradable earrings
(28,'biodegradable',0,'100€', 'Earring')
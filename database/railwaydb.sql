/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.2.0 : Database - railwaydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`railwaydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `railwaydb`;

/*Table structure for table `stations` */

DROP TABLE IF EXISTS `stations`;

CREATE TABLE `stations` (
  `STATION_NAME` varchar(50) DEFAULT NULL,
  `STATION_CODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `stations` */

insert  into `stations`(`STATION_NAME`,`STATION_CODE`) values 
('Agra','AGC'),
('Ahmedabad','ADI'),
('Ajmer','AII'),
('Asansol','ASN'),
('Bangalore','BNC'),
('Bhopal','BPL'),
('Bhubaneswar','BBS'),
('Bikaner','BKN'),
('Bilaspur','BSP'),
('Chennai','MS'),
('Darbhanga','DBG'),
('Durg','DURG'),
('Gaya','GAYA'),
('Gwalior','GWL'),
('Howrah','HWH'),
('Jaipur','JP'),
('Jhansi','JHS'),
('Jodhpur','JU'),
('Kanpur','CNB'),
('Kharagpur','KPG'),
('Kota','KOTA'),
('Mathura','MTJ'),
('Mumbai','CSTM'),
('Nagpur','NGP'),
('New Delhi','NDLS'),
('Prayagraj','PRYJ'),
('Pune','PUNE'),
('Raipur','R'),
('Secunderabad','SC'),
('Surat','ST'),
('Tatanagar','TATA'),
('Vadodara','BRC'),
('Vijayawada','BZA');

/*Table structure for table `ticketdetails` */

DROP TABLE IF EXISTS `ticketdetails`;

CREATE TABLE `ticketdetails` (
  `PNR` bigint DEFAULT NULL,
  `TRAIN_NO` int DEFAULT NULL,
  `TRAIN_NAME` varchar(255) DEFAULT NULL,
  `CLASS` varchar(5) DEFAULT NULL,
  `COACH` varchar(2) DEFAULT NULL,
  `SEAT_NO` int DEFAULT NULL,
  `JOURNEY_DATE` date DEFAULT NULL,
  `ORIGIN` varchar(255) DEFAULT NULL,
  `DESTINATION` varchar(255) DEFAULT NULL,
  `DEPARTURE_TIME` time DEFAULT NULL,
  `ARRIVAL_TIME` time DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `NO_OF_PASSENGERS` int DEFAULT NULL,
  `TOTAL_FARE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ticketdetails` */

/*Table structure for table `trainschedule` */

DROP TABLE IF EXISTS `trainschedule`;

CREATE TABLE `trainschedule` (
  `TRAIN_NO` int DEFAULT NULL,
  `TRAIN_NAME` varchar(100) DEFAULT NULL,
  `ORIGIN` varchar(50) DEFAULT NULL,
  `DESTINATION` varchar(50) DEFAULT NULL,
  `DEPARTURE_TIME` time DEFAULT NULL,
  `ARRIVAL_TIME` time DEFAULT NULL,
  `DISTANCE` int DEFAULT NULL,
  `FARE_SLEEPER` int DEFAULT NULL,
  `FARE_3AC` int DEFAULT NULL,
  `FARE_2AC` int DEFAULT NULL,
  `FARE_1AC` int DEFAULT NULL,
  `MONDAY` tinyint(1) DEFAULT NULL,
  `TUESDAY` tinyint(1) DEFAULT NULL,
  `WEDNESDAY` tinyint(1) DEFAULT NULL,
  `THURSDAY` tinyint(1) DEFAULT NULL,
  `FRIDAY` tinyint(1) DEFAULT NULL,
  `SATURDAY` tinyint(1) DEFAULT NULL,
  `SUNDAY` tinyint(1) DEFAULT NULL,
  `SEATS_SL` int DEFAULT NULL,
  `SEATS_3AC` int DEFAULT NULL,
  `SEATS_2AC` int DEFAULT NULL,
  `SEATS_1AC` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `trainschedule` */

insert  into `trainschedule`(`TRAIN_NO`,`TRAIN_NAME`,`ORIGIN`,`DESTINATION`,`DEPARTURE_TIME`,`ARRIVAL_TIME`,`DISTANCE`,`FARE_SLEEPER`,`FARE_3AC`,`FARE_2AC`,`FARE_1AC`,`MONDAY`,`TUESDAY`,`WEDNESDAY`,`THURSDAY`,`FRIDAY`,`SATURDAY`,`SUNDAY`,`SEATS_SL`,`SEATS_3AC`,`SEATS_2AC`,`SEATS_1AC`) values 
(12125,'Bhubaneswar Humsafar Express','Darbhanga','Bhubaneswar','16:00:00','22:00:00',865,577,1040,1732,2598,0,1,0,1,0,1,0,77,33,19,2),
(12126,'Darbhanga Humsafar Express','Bhubaneswar','Darbhanga','16:00:00','22:00:00',865,577,1040,1732,2598,0,1,0,1,0,1,0,73,36,19,1),
(12215,'Mumbai Garib Rath','Surat','Mumbai','03:55:00','07:35:00',252,168,302,504,756,1,1,1,1,1,1,1,79,32,20,2),
(12215,'Mumbai Garib Rath','Ahmedabad','Mumbai','00:35:00','07:35:00',480,320,576,960,1440,1,1,1,1,1,1,1,70,33,18,0),
(12215,'Mumbai Garib Rath','Jaipur','Mumbai','13:25:00','07:35:00',1128,752,1354,2256,3384,1,1,1,1,1,1,1,71,30,20,1),
(12215,'Mumbai Garib Rath','New Delhi','Mumbai','08:55:00','07:35:00',1429,953,1716,2860,4290,1,1,1,1,1,1,1,77,33,19,2),
(12216,'NDLS Garib Rath','Mumbai','Surat','12:00:00','15:10:00',252,168,302,504,756,1,1,1,1,1,1,1,73,36,19,1),
(12216,'NDLS Garib Rath','Mumbai','Ahmedabad','12:00:00','18:55:00',480,320,576,960,1440,1,1,1,1,1,1,1,79,32,20,2),
(12216,'NDLS Garib Rath','Mumbai','Jaipur','12:00:00','05:55:00',1128,752,1354,2256,3384,1,1,1,1,1,1,1,70,33,18,0),
(12216,'NDLS Garib Rath','Mumbai','New Delhi','12:00:00','11:00:00',1429,953,1716,2860,4290,1,1,1,1,1,1,1,71,30,20,1),
(12221,'Howrah Duronto Express','Pune','Howrah','15:15:00','20:15:00',2010,1340,2416,4028,6042,1,0,1,1,1,0,1,77,33,19,2),
(12222,'Pune Duronto Express','Howrah','Pune','05:45:00','09:45:00',2010,1340,2416,4028,6042,0,1,1,0,1,1,0,73,36,19,1),
(12301,'SMVB Duronto Express','Howrah','Bangalore','10:50:00','15:50:00',1930,1287,2317,3862,5800,1,1,0,1,0,1,1,79,32,20,2),
(12302,'Howrah Duronto Express','Bangalore','Howrah','11:20:00','16:50:00',1930,1287,2317,3862,5800,0,1,1,1,1,1,0,70,33,18,0),
(12303,'Howrah Duronto Express','Mumbai','Nagpur','17:15:00','04:10:00',837,558,1004,1674,2511,0,1,1,1,1,1,0,71,30,20,1),
(12304,'Howrah Duronto Express','Mumbai','Bilaspur','17:15:00','09:55:00',1249,833,1499,2498,3747,0,1,1,1,1,1,0,77,33,19,2),
(12305,'Howrah Duronto Express','Mumbai','Tatanagar','17:15:00','16:10:00',1717,1145,2062,3436,5154,0,1,1,1,1,1,0,73,36,19,1),
(12306,'Howrah Duronto Express','Mumbai','Howrah','17:15:00','20:15:00',1968,1312,2361,3936,5904,0,1,1,1,1,1,0,79,32,20,2),
(12307,'CSTM Duronto Express','Nagpur','Mumbai','21:00:00','08:15:00',837,558,1004,1674,2511,0,1,1,1,1,1,1,70,33,18,0),
(12308,'CSTM Duronto Express','Bilaspur','Mumbai','15:00:00','08:15:00',1249,833,1499,2498,3747,0,1,1,1,1,1,1,71,30,20,1),
(12309,'CSTM Duronto Express','Tatanagar','Mumbai','08:50:00','08:15:00',1717,1145,2062,3436,5154,0,1,1,1,1,1,1,77,33,19,2),
(12310,'CSTM Duronto Express','Howrah','Mumbai','05:45:00','08:15:00',1968,1312,2361,3936,5904,0,1,1,1,1,1,1,73,36,19,1),
(12311,'Delhi Duronto Express','Chennai','New Delhi','06:35:00','10:40:00',2175,1450,2610,4350,6525,0,1,1,0,1,1,1,79,32,20,2),
(12312,'Chennai Duronto Express','New Delhi','Chennai','15:55:00','21:00:00',2175,1450,2610,4350,6525,1,1,0,1,1,1,0,70,33,18,0),
(12311,'Kalka Mail','Howrah','Asansol','21:55:00','00:30:00',198,132,240,400,600,1,0,1,0,1,0,1,71,30,20,1),
(12311,'Kalka Mail','Howrah','Gaya','21:55:00','05:10:00',456,304,550,1000,1400,1,0,1,0,1,0,1,77,33,19,2),
(12311,'Kalka Mail','Howrah','Kanpur','21:55:00','13:30:00',1006,671,1208,2014,3021,1,0,1,0,1,0,1,73,36,19,1),
(12311,'Kalka Mail','Howrah','New Delhi','21:55:00','20:55:00',1441,961,1730,2884,4326,1,0,1,0,1,0,1,79,32,20,2),
(12312,'Kalka Mail','Asansol','Howrah','04:36:00','08:05:00',198,132,240,400,600,0,1,1,1,1,1,1,70,33,18,0),
(12312,'Kalka Mail','Gaya','Howrah','23:40:00','08:05:00',456,304,550,1000,1400,1,1,1,1,1,1,0,71,30,20,1),
(12312,'Kalka Mail','Kanpur','Howrah','13:45:00','08:05:00',1006,671,1208,2014,3021,1,1,1,1,1,1,0,77,33,19,2),
(12312,'Kalka Mail','New Delhi','Howrah','06:15:00','08:05:00',1441,961,1730,2884,4326,1,1,1,1,1,1,0,73,36,19,1),
(12651,'Chennai Express','Chennai','Vijaywada','08:25:00','15:40:00',435,290,533,870,1305,1,0,1,1,0,0,1,79,32,20,2),
(12651,'Chennai Express','Chennai','Nagpur','08:25:00','01:55:00',1096,731,1315,2192,3288,1,0,1,1,0,0,1,70,33,18,0),
(12651,'Chennai Express','Chennai','Bhopal','08:25:00','08:15:00',1482,988,1780,2966,4449,1,0,1,1,0,0,1,71,30,20,1),
(12651,'Chennai Express','Chennai','Jhansi','08:25:00','12:05:00',1773,1182,2126,3548,5422,1,0,1,1,0,0,1,77,33,19,2),
(12651,'Chennai Express','Chennai','New Delhi','08:25:00','18:35:00',2200,1467,2700,4360,6545,1,0,1,1,0,0,1,73,36,19,1),
(12652,'Chennai Express','Vijaywada','Chennai','08:50:00','15:55:00',435,290,533,870,1305,0,1,0,1,0,1,0,79,32,20,2),
(12652,'Chennai Express','Nagpur','Chennai','22:25:00','15:55:00',1096,731,1315,2192,3288,1,0,1,0,1,0,0,70,33,18,0),
(12652,'Chennai Express','Bhopal','Chennai','16:05:00','15:55:00',1482,988,1780,2966,4449,1,0,1,0,1,0,0,71,30,20,1),
(12652,'Chennai Express','Jhansi','Chennai','11:40:00','15:55:00',1773,1182,2126,3548,5422,1,0,1,0,1,0,0,77,33,19,2),
(12652,'Chennai Express','New Delhi','Chennai','05:20:00','15:55:00',2200,1467,2700,4360,6545,1,0,1,0,1,0,0,73,36,19,1),
(12723,'Andhra Pradesh Express','Mathura','New Delhi','05:05:00','07:40:00',135,90,160,270,400,0,0,1,1,0,1,1,79,32,20,2),
(12723,'Andhra Pradesh Express','Agra','New Delhi','04:27:00','07:40:00',186,124,224,376,580,0,0,1,1,0,1,1,70,33,18,0),
(12723,'Andhra Pradesh Express','Gwalior','New Delhi','02:47:00','07:40:00',303,202,364,608,912,0,0,1,1,0,1,1,71,30,20,1),
(12723,'Andhra Pradesh Express','Bhopal','New Delhi','21:55:00','07:40:00',693,462,832,1386,2079,0,1,1,0,1,1,0,77,33,19,2),
(12723,'Andhra Pradesh Express','Nagpur','New Delhi','15:25:00','07:40:00',1084,723,1300,2168,3252,0,1,1,0,1,1,0,73,36,19,1),
(12723,'Andhra Pradesh Express','Secunderabad','New Delhi','06:25:00','07:40:00',1668,1112,2002,3336,5004,0,1,1,0,1,1,0,79,32,20,2),
(12724,'Andhra Pradesh Express','New Delhi','Mathura','16:00:00','17:26:00',135,90,160,270,400,0,1,1,1,0,1,1,70,33,18,0),
(12724,'Andhra Pradesh Express','New Delhi','Agra','16:00:00','18:05:00',186,124,224,376,580,0,1,1,1,0,1,1,71,30,20,1),
(12724,'Andhra Pradesh Express','New Delhi','Gwalior','16:00:00','19:58:00',303,202,364,608,912,0,1,1,1,0,1,1,77,33,19,2),
(12724,'Andhra Pradesh Express','New Delhi','Bhopal','16:00:00','01:20:00',693,462,832,1386,2079,0,1,1,1,0,1,1,73,36,19,1),
(12724,'Andhra Pradesh Express','New Delhi','Nagpur','16:00:00','07:10:00',1084,723,1300,2168,3252,0,1,1,1,0,1,1,79,32,20,2),
(12724,'Andhra Pradesh Express','New Delhi','Secunderabad','16:00:00','15:55:00',1668,1112,2002,3336,5004,0,1,1,1,0,1,1,70,33,18,0),
(12833,'Ahmedabad Howrah Express','Kharagpur','Howrah','11:45:00','13:50:00',118,79,140,232,350,1,1,1,1,1,1,1,71,30,20,1),
(12833,'Ahmedabad Howrah Express','Bilaspur','Howrah','01:45:00','13:50:00',720,480,867,1438,2157,1,1,1,1,1,1,1,77,33,19,2),
(12833,'Ahmedabad Howrah Express','Raipur','Howrah','23:20:00','13:50:00',828,552,994,1658,2487,1,1,1,1,1,1,1,73,36,19,1),
(12833,'Ahmedabad Howrah Express','Durg','Howrah','22:35:00','13:50:00',870,580,1040,1732,2600,1,1,1,1,1,1,1,79,32,20,2),
(12833,'Ahmedabad Howrah Express','Nagpur','Howrah','18:30:00','13:50:00',1131,754,1357,2262,3393,1,1,1,1,1,1,1,70,33,18,0),
(12833,'Ahmedabad Howrah Express','Surat','Howrah','04:30:00','13:50:00',1860,1240,2230,3718,5577,1,1,1,1,1,1,1,71,30,20,1),
(12833,'Ahmedabad Howrah Express','Ahmedabad','Howrah','00:25:00','13:50:00',2088,1392,2505,4176,6264,1,1,1,1,1,1,1,77,33,19,2),
(12834,'Howrah Ahmedabad Express','Howrah','Kharagpur','23:10:00','00:53:00',118,79,140,232,350,1,1,1,1,1,1,1,73,36,19,1),
(12834,'Howrah Ahmedabad Express','Howrah','Bilaspur','23:10:00','11:40:00',720,480,867,1438,2157,1,1,1,1,1,1,1,79,32,20,2),
(12834,'Howrah Ahmedabad Express','Howrah','Raipur','23:10:00','13:35:00',828,552,994,1658,2487,1,1,1,1,1,1,1,70,33,18,0),
(12834,'Howrah Ahmedabad Express','Howrah','Durg','23:10:00','14:35:00',870,580,1040,1732,2600,1,1,1,1,1,1,1,71,30,20,1),
(12834,'Howrah Ahmedabad Express','Howrah','Nagpur','23:10:00','18:55:00',1131,754,1357,2262,3393,1,1,1,1,1,1,1,77,33,19,2),
(12834,'Howrah Ahmedabad Express','Howrah','Surat','23:10:00','08:00:00',1860,1240,2230,3718,5577,1,1,1,1,1,1,1,73,36,19,1),
(12834,'Howrah Ahmedabad Express','Howrah','Ahmedabad','23:10:00','12:05:00',2088,1392,2505,4176,6264,1,1,1,1,1,1,1,79,32,20,2),
(12951,'Mumbai Rajdhani Express','Kota','New Delhi','03:20:00','08:32:00',465,310,557,928,1392,0,1,0,1,1,1,1,70,33,18,0),
(12951,'Mumbai Rajdhani Express','Vadodara','New Delhi','21:16:00','08:32:00',987,658,1185,1976,2970,1,0,1,1,1,1,0,71,30,20,1),
(12951,'Mumbai Rajdhani Express','Surat','New Delhi','19:48:00','08:32:00',1117,745,1341,2236,3354,1,0,1,1,1,1,0,77,33,19,2),
(12951,'Mumbai Rajdhani Express','Mumbai','New Delhi','17:00:00','08:32:00',1380,920,1656,2760,4140,1,0,1,1,1,1,0,73,36,19,1),
(12952,'NDLS Rajdhani Express','New Delhi','Kota','16:55:00','21:30:00',465,310,557,928,1392,1,0,1,0,0,1,0,79,32,20,2),
(12952,'NDLS Rajdhani Express','New Delhi','Vadodara','16:55:00','03:40:00',987,658,1185,1976,2970,1,0,1,0,0,1,0,70,33,18,0),
(12952,'NDLS Rajdhani Express','New Delhi','Surat','16:55:00','05:13:00',1117,745,1341,2236,3354,1,0,1,0,0,1,0,71,30,20,1),
(12952,'NDLS Rajdhani Express','New Delhi','Mumbai','16:55:00','08:35:00',1380,920,1656,2760,4140,1,0,1,0,0,1,0,77,33,19,2),
(12957,'Ahmedabad Swarna Jayanti Rajdhani Express','Jaipur','New Delhi','02:40:00','07:30:00',309,206,372,620,930,1,0,1,0,1,1,0,73,36,19,1),
(12957,'Ahmedabad Swarna Jayanti Rajdhani Express','Ajmer','New Delhi','01:05:00','07:30:00',450,300,533,888,1332,1,0,1,0,1,1,0,79,32,20,2),
(12957,'Ahmedabad Swarna Jayanti Rajdhani Express','Ahmedabad','New Delhi','18:50:00','07:30:00',934,623,1122,1870,2805,0,1,0,1,1,0,1,70,33,18,0),
(12958,'Ahmedabad Swarna Jayanti Rajdhani Express','New Delhi','Jaipur','19:55:00','23:45:00',309,206,372,620,930,1,0,1,0,1,0,1,71,30,20,1),
(12958,'Ahmedabad Swarna Jayanti Rajdhani Express','New Delhi','Ajmer','19:55:00','01:35:00',450,300,533,888,1332,1,0,1,0,1,0,1,77,33,19,2),
(12958,'Ahmedabad Swarna Jayanti Rajdhani Express','New Delhi','Ahmedabad','19:55:00','08:25:00',934,623,1122,1870,2805,1,0,1,0,1,0,1,73,36,19,1),
(20475,'Pune Superfast Express','Surat','Pune','00:00:00','07:35:00',396,264,475,792,1188,1,1,1,1,1,1,1,79,32,20,2),
(20475,'Pune Superfast Express','Ahmedabad','Pune','20:00:00','07:35:00',625,417,750,1250,1875,1,1,1,1,1,1,1,70,33,18,0),
(20475,'Pune Superfast Express','Jodhpur','Pune','12:00:00','07:35:00',1080,720,1296,2160,3240,1,1,1,1,1,1,1,71,30,20,1),
(20475,'Pune Superfast Express','Bikaner','Pune','07:30:00','07:35:00',1356,904,1627,2712,4068,1,1,1,1,1,1,1,77,33,19,2),
(20476,'Bikaner Superfast Express','Pune','Surat','20:10:00','03:23:00',396,264,475,792,1188,1,1,1,1,1,1,1,73,36,19,1),
(20476,'Bikaner Superfast Express','Pune','Ahmedabad','20:10:00','07:25:00',625,417,750,1250,1875,1,1,1,1,1,1,1,79,32,20,2),
(20476,'Bikaner Superfast Express','Pune','Jodhpur','20:10:00','15:40:00',1080,720,1296,2160,3240,1,1,1,1,1,1,1,70,33,18,0),
(20476,'Bikaner Superfast Express','Pune','Bikaner','20:10:00','20:40:00',1356,904,1627,2712,4068,1,1,1,1,1,1,1,71,30,20,1),
(22691,'KSR Bengaluru City - Hazrat Nizamuddin Rajdhani Express','Gwalior','New Delhi','01:20:00','05:30:00',306,204,370,612,1000,1,1,1,1,1,1,1,77,33,19,2),
(22691,'KSR Bengaluru City - Hazrat Nizamuddin Rajdhani Express','Nagpur','New Delhi','14:55:00','05:30:00',1134,756,1307,2172,3258,1,1,1,1,1,1,1,73,36,19,1),
(22691,'KSR Bengaluru City - Hazrat Nizamuddin Rajdhani Express','Bhopal','New Delhi','20:50:00','05:30:00',1134,756,850,1390,2085,1,1,1,1,1,1,1,79,32,20,2),
(22691,'KSR Bengaluru City - Hazrat Nizamuddin Rajdhani Express','Secunderabad','New Delhi','07:05:00','05:30:00',1660,1107,2000,3322,5000,1,1,1,1,1,1,1,70,33,18,0),
(22691,'KSR Bengaluru City - Hazrat Nizamuddin Rajdhani Express','Bangalore','New Delhi','20:00:00','05:30:00',2340,1560,2840,4734,7101,1,1,1,1,1,1,1,71,30,20,1),
(22692,'Hazrat Nizamuddin - KSR Bengaluru City Rajdhani Express','New Delhi','Gwalior','19:50:00','23:08:00',306,204,370,612,1000,1,1,1,1,1,1,1,77,33,19,2),
(22692,'Hazrat Nizamuddin - KSR Bengaluru City Rajdhani Express','New Delhi','Nagpur','19:50:00','02:25:00',1134,756,1307,2172,3258,1,1,1,1,1,1,1,73,36,19,1),
(22692,'Hazrat Nizamuddin - KSR Bengaluru City Rajdhani Express','New Delhi','Bhopal','19:50:00','03:45:00',1134,756,850,1390,2085,1,1,1,1,1,1,1,79,32,20,2),
(22692,'Hazrat Nizamuddin - KSR Bengaluru City Rajdhani Express','New Delhi','Secunderabad','19:50:00','17:10:00',1660,1107,2000,3322,5000,1,1,1,1,1,1,1,70,33,18,0),
(22692,'Hazrat Nizamuddin - KSR Bengaluru City Rajdhani Express','New Delhi','Bangalore','19:50:00','05:20:00',2340,1560,2840,4734,7101,1,1,1,1,1,1,1,71,30,20,1),
(22805,'NDLS Rajdhani Express','Bhubaneswar','Prayagraj','12:30:00','10:55:00',1134,756,1307,2172,3258,1,1,1,1,1,1,1,77,33,19,2),
(22805,'NDLS Rajdhani Express','Bhubaneswar','Gaya','12:30:00','05:38:00',1134,756,850,1390,2085,1,1,1,1,1,1,1,73,36,19,1),
(22805,'NDLS Rajdhani Express','Bhubaneswar','Kanpur','12:30:00','13:20:00',1660,1107,2000,3322,5000,1,1,1,1,1,1,1,79,32,20,2),
(22805,'NDLS Rajdhani Express','Bhubaneswar','New Delhi','12:30:00','19:35:00',2340,1560,2840,4734,7101,1,1,1,1,1,1,1,70,33,18,0),
(22806,'Bhubaneswar Rajdhani Express','New Delhi','Bhubaneswar','08:00:00','14:45:00',306,204,370,612,1000,0,1,0,1,0,1,0,71,30,20,1),
(22806,'Bhubaneswar Rajdhani Express','Gaya','Bhubaneswar','21:45:00','14:45:00',910,607,1099,1845,2800,0,0,1,0,1,0,1,77,33,19,2),
(22806,'Bhubaneswar Rajdhani Express','Prayagraj','Bhubaneswar','16:30:00','14:45:00',1305,870,1516,2580,3800,0,1,0,1,0,1,0,73,36,19,1),
(22806,'Bhubaneswar Rajdhani Express','Kanpur','Bhubaneswar','13:45:00','14:45:00',1470,980,1750,2960,4400,0,1,0,1,0,1,0,79,32,20,2);

/*Table structure for table `userdetails` */

DROP TABLE IF EXISTS `userdetails`;

CREATE TABLE `userdetails` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `EMAIL_ID` varchar(100) DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `DOCUMENT_ID_TYPE` varchar(50) DEFAULT NULL,
  `DOCUMENT_ID_NUMBER` varchar(20) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `EMAIL_ID` (`EMAIL_ID`),
  UNIQUE KEY `DOCUMENT_ID_NUMBER` (`DOCUMENT_ID_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `userdetails` */

insert  into `userdetails`(`USER_ID`,`NAME`,`USERNAME`,`EMAIL_ID`,`DATE_OF_BIRTH`,`PASSWORD`,`DOCUMENT_ID_TYPE`,`DOCUMENT_ID_NUMBER`,`GENDER`) values 
(1,'Manishka Choudhary','manishka','manishka@gmail.com','2001-10-26','2fH7$PmW8s@','Aadhar Card','1234 5678 90','Female');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

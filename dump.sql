-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: crm
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Doe','1993-01-14'),(2,'Huey','Wong','1987-07-22'),(3,'Jorge','Martinez','1970-08-25'),(4,'Mia','Fallon','1977-01-30'),(5,'Janet','Flackson','1988-03-22');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `hour_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Hue','Jackson','125 Main Street Cambridge','12 209 298 988','can\'t work Saturdays',15.20),(2,'Sophie','Landall','60 Park St Bronson','11 39 020 203','no overtime, no weekends',15.00),(3,'Jonathan','Sparks II','Marriott Courthouse, room 298','606 876 278','temporary, until mid-year',18.50),(4,'Liu','Kang','12 Small Street B','287 827 827','electrician',17.20),(5,'Ahmed','Muhammad','143 Pink Ave','12 323 121 121','can\'t work during Ramadan',14.80);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acceptance` date DEFAULT NULL,
  `planned_service_start` date DEFAULT NULL,
  `actual_service_start` date DEFAULT NULL,
  `service_end` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `problem_desc` varchar(250) DEFAULT NULL,
  `service_desc` varchar(250) DEFAULT NULL,
  `status` enum('car in','cost approved','in service','ready','cancelled') NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `service_cost` decimal(10,2) DEFAULT NULL,
  `parts_cost` decimal(10,2) DEFAULT NULL,
  `work_hours` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_employees__fk` (`employee_id`),
  KEY `orders_vehicles__fk` (`vehicle_id`),
  CONSTRAINT `orders_employees__fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `orders_vehicles__fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2018-01-22','2019-01-01','2019-01-02',NULL,1,'Strange sound in engine','In progress','in service',3,300.00,30.00,6.00),(2,'2019-01-02','2019-01-07','2019-01-14',NULL,2,'Dinged doors','Not in service yet','car in',4,200.00,40.00,0.00),(3,'2018-11-14','2018-11-14','2018-11-14','2018-12-03',3,'Tires wore off too fast','Wheel alignment and balancing','ready',2,100.00,0.00,2.00),(9,'2018-01-10','2018-01-17','2018-01-18','2018-01-24',4,'Yearly service','Oil, other fluids, standard checks','ready',1,70.00,20.00,3.00),(10,'2018-05-02','2018-05-23','2018-05-24','2018-05-31',5,'Electrical issues','Replaced some fuses','ready',5,60.00,5.00,4.00),(11,'2018-10-03','2018-10-04','2018-10-07','2018-10-14',1,'Can\'t close hatch','Central lock failure','ready',4,200.00,50.00,8.00),(12,'2019-01-01','2019-01-02','2019-01-03',NULL,2,'Broken windshield','To be replaced','in service',2,200.00,100.00,4.00),(13,'2019-01-06','2019-01-16',NULL,NULL,3,'Doesn\'t start','Not in service yet','cost approved',1,150.00,50.00,0.00),(15,'2019-01-01','2019-01-02','2019-01-03','2019-01-06',5,'Broken mirror','Mirror replaced','ready',4,30.00,14.00,4.00),(16,'2019-01-03','2019-01-10',NULL,NULL,3,'Flat tire','Not in service yet','car in',5,30.00,10.00,0.00),(17,'2010-01-01','2010-01-01',NULL,NULL,4,'Doesn\'t work','Not in service yet','car in',8,30.00,20.00,0.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `registration` varchar(50) DEFAULT NULL,
  `next_inspection` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicles_customers__fk` (`customer_id`),
  CONSTRAINT `vehicles_customers__fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,1,'Honda',2012,'Civic','MA23564','2019-01-23'),(2,2,'Toyota',2018,'Yaris','SF98763','2019-11-20'),(3,3,'BMW',2007,'X3','NYC8738','2019-04-17'),(4,4,'Opel',1995,'Astra','TX98792','2019-03-11'),(5,5,'Fiat',1997,'Punto','IL93837','2019-08-21'),(7,4,'Honda',2016,'Jazz','NH98977','2019-05-05'),(8,3,'Fiat',1980,'126p','KAC6667','2010-01-01');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-06 11:09:33

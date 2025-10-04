-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Project
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Project`;

--
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `userID` varchar(50) NOT NULL,
  `passwordHash` varchar(50) NOT NULL,
  `accountType` int NOT NULL DEFAULT '0',
  `addressID` int NOT NULL,
  `emailAddress` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `uniqueAccount` (`userID`),
  UNIQUE KEY `uniqueEmail` (`emailAddress`),
  UNIQUE KEY `uniqueUserID` (`userID`),
  KEY `addressFK` (`addressID`),
  CONSTRAINT `addressFK` FOREIGN KEY (`addressID`) REFERENCES `Addresses` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES ('acemarco1311','qwer',1,1,'acemarco1311@gmail.com'),('acemarco9','qwer',0,2,'acemarco9@gmail.com'),('jetlow123','qwer',0,3,'jetlow123@gmail.com'),('ruixin123','qwer',0,3,'ruixin123@gmail.com');
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Addresses` (
  `addressID` int NOT NULL AUTO_INCREMENT,
  `number` int DEFAULT NULL,
  `streetName` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `stateName` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`addressID`),
  UNIQUE KEY `uniqueAddressID` (`addressID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
INSERT INTO `Addresses` VALUES (1,11,'Alexander','Adelaide','South Australia','Australia'),(2,12,'John','Adelaide','South Australia','Australia'),(3,100,'Xudong','Wuhan','Hubei','China');
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CheckInCodeRecords`
--

DROP TABLE IF EXISTS `CheckInCodeRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CheckInCodeRecords` (
  `checkInCode` char(6) NOT NULL DEFAULT '000000',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`checkInCode`),
  UNIQUE KEY `uniqueCode` (`checkInCode`),
  UNIQUE KEY `uniqueCheckInCode` (`checkInCode`),
  CONSTRAINT `checkValidLatLocation` CHECK (((`latitude` >= -(90)) and (`latitude` <= 90))),
  CONSTRAINT `checkValidLngLocation` CHECK (((`longitude` >= -(180)) and (`longitude` <= 180)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CheckInCodeRecords`
--

LOCK TABLES `CheckInCodeRecords` WRITE;
/*!40000 ALTER TABLE `CheckInCodeRecords` DISABLE KEYS */;
INSERT INTO `CheckInCodeRecords` VALUES ('123456',-34.9212300,138.5995030);
/*!40000 ALTER TABLE `CheckInCodeRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CheckInRecords`
--

DROP TABLE IF EXISTS `CheckInRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CheckInRecords` (
  `checkInID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(50) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `dateAdded` date DEFAULT NULL,
  `checkInCode` char(6) DEFAULT NULL,
  PRIMARY KEY (`checkInID`),
  UNIQUE KEY `uniqueCheckInID` (`checkInID`),
  KEY `checkInUserFK` (`userID`),
  KEY `codeFk` (`checkInCode`),
  CONSTRAINT `checkInUserFK` FOREIGN KEY (`userID`) REFERENCES `Accounts` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `codeFk` FOREIGN KEY (`checkInCode`) REFERENCES `CheckInCodeRecords` (`checkInCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checkLat` CHECK (((`latitude` >= -(90)) and (`latitude` <= 90))),
  CONSTRAINT `checkLng` CHECK (((`longitude` >= -(180)) and (`longitude` <= 180)))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CheckInRecords`
--

LOCK TABLES `CheckInRecords` WRITE;
/*!40000 ALTER TABLE `CheckInRecords` DISABLE KEYS */;
INSERT INTO `CheckInRecords` VALUES (2,'acemarco9',-34.9212300,138.5995030,'2020-09-12','123456'),(3,'acemarco9',-34.9212300,138.5995030,'2021-05-23','123456'),(4,'acemarco1311',-34.9212300,138.5995030,'2021-05-24','123456'),(5,'acemarco9',-34.9212300,138.5995030,'2021-05-25','123456'),(6,'acemarco9',-34.9212300,138.5995030,'2021-05-25','123456'),(7,'acemarco9',-34.9212300,138.5995030,'2021-05-25','123456'),(10,'acemarco9',16.0023000,105.9999000,'2021-05-25',NULL),(12,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(13,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(14,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(15,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(16,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(17,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(18,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(19,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(20,'acemarco9',16.0023000,105.9999000,'2021-05-26',NULL),(21,'acemarco9',16.0023000,105.9999000,'2021-05-28',NULL),(22,'acemarco9',16.0023000,105.9999000,'2021-05-28',NULL),(23,'acemarco9',16.0023000,105.9999000,'2021-05-28',NULL),(24,'acemarco9',-34.9212300,138.5995030,'2021-05-28','123456'),(25,'acemarco9',-34.9212300,138.5995030,'2021-05-28','123456'),(26,'acemarco9',16.0023000,105.9999000,'2021-05-28',NULL),(27,'acemarco9',-34.9212300,138.5995030,'2021-05-28','123456'),(28,'acemarco9',16.0023000,105.9999000,'2021-05-28',NULL),(29,'acemarco9',35.8616600,104.1953970,'2021-05-29',NULL),(30,'acemarco9',-34.9212300,138.5995030,'2021-05-29','123456');
/*!40000 ALTER TABLE `CheckInRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotspots`
--

DROP TABLE IF EXISTS `Hotspots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotspots` (
  `hotspotID` int NOT NULL AUTO_INCREMENT,
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000',
  `dateAdded` date DEFAULT NULL,
  `confirmedCases` int DEFAULT NULL,
  `deaths` int DEFAULT NULL,
  `recoveredCases` int DEFAULT NULL,
  `activeCases` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`hotspotID`),
  UNIQUE KEY `uniqueHotspotID` (`hotspotID`),
  UNIQUE KEY `uniqueHotpotID` (`hotspotID`),
  CONSTRAINT `checkValidLat` CHECK (((`latitude` >= -(90)) and (`latitude` <= 90))),
  CONSTRAINT `checkValidLng` CHECK (((`longitude` >= -(180)) and (`longitude` <= 180)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotspots`
--

LOCK TABLES `Hotspots` WRITE;
/*!40000 ALTER TABLE `Hotspots` DISABLE KEYS */;
INSERT INTO `Hotspots` VALUES (1,-34.9212300,138.5995030,'2020-05-17',742,4,724,14),(2,-31.8402330,145.6127930,'2020-05-17',5560,54,3282,2224),(3,-20.9175740,142.7027890,'2020-05-17',1589,7,1564,18),(4,-37.0201000,144.9646000,'2020-05-17',20545,820,19702,23),(5,-25.0422610,117.7932210,'2020-05-17',1015,9,999,7);
/*!40000 ALTER TABLE `Hotspots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserInfo`
--

DROP TABLE IF EXISTS `UserInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserInfo` (
  `userID` varchar(50) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `uniqueUser` (`userID`),
  CONSTRAINT `userFK` FOREIGN KEY (`userID`) REFERENCES `Accounts` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserInfo`
--

LOCK TABLES `UserInfo` WRITE;
/*!40000 ALTER TABLE `UserInfo` DISABLE KEYS */;
INSERT INTO `UserInfo` VALUES ('ruixin123','Ruixin','Wu');
/*!40000 ALTER TABLE `UserInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VenueInfo`
--

DROP TABLE IF EXISTS `VenueInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VenueInfo` (
  `userID` varchar(50) NOT NULL,
  `venueName` varchar(100) DEFAULT NULL,
  `checkInCode` char(6) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `uniqueCheckIn` (`checkInCode`),
  CONSTRAINT `checkInFK` FOREIGN KEY (`checkInCode`) REFERENCES `CheckInCodeRecords` (`checkInCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venueFK` FOREIGN KEY (`userID`) REFERENCES `Accounts` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VenueInfo`
--

LOCK TABLES `VenueInfo` WRITE;
/*!40000 ALTER TABLE `VenueInfo` DISABLE KEYS */;
INSERT INTO `VenueInfo` VALUES ('acemarco1311','La La Land','123456');
/*!40000 ALTER TABLE `VenueInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-30 10:01:32

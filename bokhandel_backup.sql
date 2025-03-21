-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: Bokhandel_2
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `beställningar`
--

DROP TABLE IF EXISTS `beställningar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beställningar` (
  `Ordernummer` int NOT NULL AUTO_INCREMENT,
  `KundID` int NOT NULL,
  `Datum` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Totalsumma` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Ordernummer`),
  KEY `KundID` (`KundID`),
  CONSTRAINT `beställningar_ibfk_1` FOREIGN KEY (`KundID`) REFERENCES `kunder` (`KundID`),
  CONSTRAINT `beställningar_chk_1` CHECK ((`Totalsumma` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beställningar`
--

LOCK TABLES `beställningar` WRITE;
/*!40000 ALTER TABLE `beställningar` DISABLE KEYS */;
INSERT INTO `beställningar` VALUES (1,1,'2024-03-02 23:00:00',699.98),(2,2,'2024-03-04 23:00:00',999.98),(3,2,'2024-03-09 23:00:00',1099.97),(4,3,'2024-03-03 23:00:00',1999.96),(5,3,'2024-03-09 23:00:00',1399.96),(6,3,'2024-03-11 23:00:00',299.99),(7,3,'2024-03-13 23:00:00',799.98),(8,3,'2024-03-18 23:00:00',500.00),(9,3,'2024-03-13 23:00:00',799.98),(10,3,'2024-03-13 23:00:00',799.98),(11,3,'2024-03-13 23:00:00',799.98),(12,3,'2024-03-13 23:00:00',799.98),(13,3,'2024-03-13 23:00:00',799.98);
/*!40000 ALTER TABLE `beställningar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `böcker`
--

DROP TABLE IF EXISTS `böcker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `böcker` (
  `BokID` int NOT NULL AUTO_INCREMENT,
  `Titel` varchar(255) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Författare` varchar(100) NOT NULL,
  `Pris` decimal(10,2) NOT NULL,
  `Lagerstatus` int NOT NULL,
  PRIMARY KEY (`BokID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  CONSTRAINT `böcker_chk_1` CHECK ((`Pris` > 0)),
  CONSTRAINT `böcker_chk_2` CHECK ((`Lagerstatus` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `böcker`
--

LOCK TABLES `böcker` WRITE;
/*!40000 ALTER TABLE `böcker` DISABLE KEYS */;
INSERT INTO `böcker` VALUES (1,'Svensk politik','978-91-7789-849-8','Per T Ohlsson',399.99,192),(2,'Mastering Windows server 2022','978-1-83763-450-7','Jordan Krause',499.99,20),(3,'Comptia Network','978-1-264-26905-1','Mike Meyers',299.99,3);
/*!40000 ALTER TABLE `böcker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunder`
--

DROP TABLE IF EXISTS `kunder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunder` (
  `KundID` int NOT NULL AUTO_INCREMENT,
  `Namn` varchar(100) NOT NULL,
  `Epost` varchar(255) NOT NULL,
  `Telefon` varchar(20) NOT NULL,
  `Adress` varchar(255) NOT NULL,
  PRIMARY KEY (`KundID`),
  UNIQUE KEY `Epost` (`Epost`),
  KEY `idx_Epost` (`Epost`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunder`
--

LOCK TABLES `kunder` WRITE;
/*!40000 ALTER TABLE `kunder` DISABLE KEYS */;
INSERT INTO `kunder` VALUES (1,'Anna Svensson','anna@email.com','0701234567','Bokvägen 1'),(2,'Erik Eriksson','erik@email.com','0702345678','Tidningsvägen 2'),(3,'Per Persson','per@email.com','0703456789','Litteraturvägen 3'),(4,'Bengt Bengtsson','bengt@email.com','0701234568','Husvägen 1'),(5,'Martina Martinsson','martina@email.com','0733456789','Markvägen 3');
/*!40000 ALTER TABLE `kunder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logga_ny_kund` AFTER INSERT ON `kunder` FOR EACH ROW BEGIN
    INSERT INTO Kundlogg (KundID) 
    VALUES (NEW.KundID); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kundlogg`
--

DROP TABLE IF EXISTS `kundlogg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kundlogg` (
  `LoggID` int NOT NULL AUTO_INCREMENT,
  `KundID` int DEFAULT NULL,
  `Registreringsdatum` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LoggID`),
  KEY `KundID` (`KundID`),
  CONSTRAINT `kundlogg_ibfk_1` FOREIGN KEY (`KundID`) REFERENCES `kunder` (`KundID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundlogg`
--

LOCK TABLES `kundlogg` WRITE;
/*!40000 ALTER TABLE `kundlogg` DISABLE KEYS */;
INSERT INTO `kundlogg` VALUES (1,5,'2025-03-19 17:01:47');
/*!40000 ALTER TABLE `kundlogg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderrader`
--

DROP TABLE IF EXISTS `orderrader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderrader` (
  `OrderradID` int NOT NULL AUTO_INCREMENT,
  `Ordernummer` int NOT NULL,
  `BokID` int NOT NULL,
  `Antal` int NOT NULL,
  `Delsumma` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderradID`),
  KEY `Ordernummer` (`Ordernummer`),
  KEY `BokID` (`BokID`),
  CONSTRAINT `orderrader_ibfk_1` FOREIGN KEY (`Ordernummer`) REFERENCES `beställningar` (`Ordernummer`),
  CONSTRAINT `orderrader_ibfk_2` FOREIGN KEY (`BokID`) REFERENCES `böcker` (`BokID`),
  CONSTRAINT `orderrader_chk_1` CHECK ((`Antal` > 0)),
  CONSTRAINT `orderrader_chk_2` CHECK ((`Delsumma` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderrader`
--

LOCK TABLES `orderrader` WRITE;
/*!40000 ALTER TABLE `orderrader` DISABLE KEYS */;
INSERT INTO `orderrader` VALUES (1,1,3,1,299.99),(2,1,1,1,399.99),(3,2,2,2,999.98),(4,3,3,1,299.99),(5,3,1,2,799.98),(6,4,2,4,1999.96),(7,5,3,2,599.98),(8,5,1,2,799.98),(9,6,3,1,299.99),(10,7,1,2,799.98),(11,8,1,1,500.00),(12,7,1,2,799.98),(13,7,1,2,799.98),(14,7,1,2,799.98),(15,7,1,2,799.98),(16,7,1,2,799.98);
/*!40000 ALTER TABLE `orderrader` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppdatera_lagerstatus` AFTER INSERT ON `orderrader` FOR EACH ROW BEGIN
    UPDATE Böcker
    SET Lagerstatus = Lagerstatus - NEW.Antal
    WHERE BokID = NEW.BokID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-21 11:58:08

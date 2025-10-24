-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: criminal_investigation
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `criminal_case`
--

DROP TABLE IF EXISTS `criminal_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criminal_case` (
  `case_id` int NOT NULL AUTO_INCREMENT,
  `case_title` varchar(255) NOT NULL,
  `lead_detective` int DEFAULT NULL,
  `status` enum('Open','Closed','In Progress','Suspended') DEFAULT 'Open',
  `date_open` date NOT NULL,
  `date_closed` date DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  KEY `lead_detective` (`lead_detective`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `criminal_case_ibfk_1` FOREIGN KEY (`lead_detective`) REFERENCES `detective` (`detective_id`) ON DELETE SET NULL,
  CONSTRAINT `criminal_case_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criminal_case`
--

LOCK TABLES `criminal_case` WRITE;
/*!40000 ALTER TABLE `criminal_case` DISABLE KEYS */;
INSERT INTO `criminal_case` VALUES (10001,'Bank Robbery',9832,'Closed','2023-01-15','2023-02-01',9809),(10002,'Murder in Lviv',6574,'In Progress','2024-03-10','2024-03-15',9807),(10003,'Smuggling Operation',21344,'Open','2024-05-21','2025-10-10',9705),(10004,'Forest Homicide',12345,'Open','2023-09-11','2023-09-19',7803),(10005,'Kidnapping Case',14325,'Closed','2022-10-20','2022-11-05',9543),(10006,'Car Accident Investigation',56789,'Open','2024-07-01','2025-07-09',7645),(10007,'Warehouse Theft',99854,'Closed','2023-12-01','2023-12-15',9876),(10008,'Bridge Explosion',9234,'In Progress','2024-02-25','2024-02-26',8765),(10009,'Park Assault',2345,'Open','2024-06-19','2024-09-23',9762),(10010,'Station Pickpocketing',120,'Closed','2023-04-07','2023-04-15',4598),(10013,'Нове пограбування банку',120,'Open','2025-10-24',NULL,9809);
/*!40000 ALTER TABLE `criminal_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detective`
--

DROP TABLE IF EXISTS `detective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detective` (
  `detective_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `detective_rank` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`detective_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99855 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detective`
--

LOCK TABLES `detective` WRITE;
/*!40000 ALTER TABLE `detective` DISABLE KEYS */;
INSERT INTO `detective` VALUES (120,' Taras',' Lysenko',' Chief',' taras.lysenko@police.ua',' +380961111111'),(2345,' Halyna',' Romanenko',' Senior',' halyna.r@police.ua',' +380951234567'),(6574,' Olena',' Shevchenko',' Senior',' olena.shevchenko@police.ua',' +380671234567'),(9234,' Yurii',' Melnyk',' Junior',' yurii.m@police.ua',' +380631111222'),(9832,'Ivan','Petrenko','Chief','ivan.petrenko@police.ua','+380931234567'),(12345,' Oksana',' Tkachenko',' Senior',' oksana.tkachenko@police.ua',' +380991112233'),(14325,' Serhii',' Hrytsenko',' Junior',' serhii.h@police.ua',' +380931234000'),(21344,' Maksym',' Koval',' Junior',' maks.koval@police.ua',' +380501234567'),(56789,' Andrii','Bondar',' Chief',' andrii.bondar@police.ua',' +380981230000'),(99854,' Kateryna',' Vovk',' Senior',' kateryna.vovk@police.ua',' +380971111111');
/*!40000 ALTER TABLE `detective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidence`
--

DROP TABLE IF EXISTS `evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidence` (
  `evidence_id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location_found` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`evidence_id`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `evidence_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `criminal_case` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidence`
--

LOCK TABLES `evidence` WRITE;
/*!40000 ALTER TABLE `evidence` DISABLE KEYS */;
INSERT INTO `evidence` VALUES (10001,10001,'Fingerprint on safe','Bank vault','Fingerprint'),(10002,10002,'Knife with blood','Lviv apartment','Weapon'),(10003,10003,'Hidden box of goods','Odesa port','Container'),(10004,10004,'Footprint','Forest trail','Trace'),(10005,10005,'Phone record','Office','Digital'),(10006,10006,'Car tire mark','Roadside','Trace'),(10007,10007,'Broken lock','Warehouse door','Toolmark'),(10008,10008,'Explosive residue','Bridge edge','Chemical'),(10009,10009,'Torn jacket','Park bench','Cloth'),(10010,10010,'Wallet found','Station platform','Personal item'),(10011,10013,'Камера відеоспостереження','Банк на Шевченка','Digital');
/*!40000 ALTER TABLE `evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (4598,' Train station',' Uzhhorod',' Vokzalna',' Zakarpatska'),(7645,' Car crash site',' Kyiv',' Bohdan Khmelnytsky 10',' Kyivska'),(7803,' Forest area',' Kharkiv',' Lisova 1',' Kharkivska'),(8765,' Old bridge',' Poltava',' Riverside 22',' Poltavska'),(9543,' Apartment complex',' Dnipro',' Kozatska 4',' Dnipropetrovska'),(9705,'Abandoned house',' Odesa',' Deribasivska 33',' Odeska'),(9762,' Park area',' Ternopil',' Zelena 9',' Ternopilska'),(9807,' Murder site',' Lviv',' Halytska St. 5',' Lvivska'),(9809,' Bank robbery scene',' Kyiv',' Shevchenko St. 12','Kyivska'),(9876,' Warehouse',' Lutsk',' Promyslova 17',' Volynska');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathologist_report`
--

DROP TABLE IF EXISTS `pathologist_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pathologist_report` (
  `autopsy_id` int NOT NULL AUTO_INCREMENT,
  `case_of_death` varchar(255) DEFAULT NULL,
  `pathologist_name` varchar(150) DEFAULT NULL,
  `detective_id` int DEFAULT NULL,
  `victim_id` int DEFAULT NULL,
  PRIMARY KEY (`autopsy_id`),
  KEY `detective_id` (`detective_id`),
  KEY `victim_id` (`victim_id`),
  CONSTRAINT `pathologist_report_ibfk_1` FOREIGN KEY (`detective_id`) REFERENCES `detective` (`detective_id`),
  CONSTRAINT `pathologist_report_ibfk_2` FOREIGN KEY (`victim_id`) REFERENCES `victim` (`victim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathologist_report`
--

LOCK TABLES `pathologist_report` WRITE;
/*!40000 ALTER TABLE `pathologist_report` DISABLE KEYS */;
INSERT INTO `pathologist_report` VALUES (10001,'Gunshot','Dr. Kovalenko',9832,10001),(10002,'Stabbing','Dr. Shevchenko',6574,10002),(10003,'Car accident','Dr. Petrenko',21344,10003),(10004,'Drowning','Dr. Melnyk',12345,10004),(10005,'Poisoning','Dr. Tkachenko',14325,10005),(10006,'Burns','Dr. Vovk',56789,10006),(10007,'Blunt force','Dr. Romanenko',99854,10007),(10008,'Fall','Dr. Lysenko',9234,10008),(10009,'Strangulation','Dr. Kravets',2345,10009),(10010,'Heart attack','Dr. Shevchenko',120,10010);
/*!40000 ALTER TABLE `pathologist_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `simple_case_view`
--

DROP TABLE IF EXISTS `simple_case_view`;
/*!50001 DROP VIEW IF EXISTS `simple_case_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `simple_case_view` AS SELECT 
 1 AS `case_id`,
 1 AS `case_title`,
 1 AS `location_city`,
 1 AS `location_address`,
 1 AS `detective_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `suspect`
--

DROP TABLE IF EXISTS `suspect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspect` (
  `suspect_id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`suspect_id`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `suspect_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `criminal_case` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspect`
--

LOCK TABLES `suspect` WRITE;
/*!40000 ALTER TABLE `suspect` DISABLE KEYS */;
INSERT INTO `suspect` VALUES (10001,10001,'Petro','Ivanov','Shevchenko St. 20','380931111555','1988-05-01','Arrested'),(10002,10002,'Andrii','Kovalenko','Halytska St. 12','380671113344','1990-12-10','Wanted'),(10003,10003,'Maksym','Bondar','Deribasivska 40','380501113355','1992-07-22','Under Investigation'),(10004,10004,'Oleh','Tkachenko','Lisova 5','380991114455','1985-03-11','Arrested'),(10005,10005,'Ivan','Petrenko','Kozatska 12','380931115566','1989-09-30','Released'),(10006,10006,'Serhii','Melnyk','Bohdan Khmelnytsky 14','380981116677','1991-11-15','Wanted'),(10007,10007,'Taras','Vovk','Promyslova 21','380971117788','1987-01-20','Under Investigation'),(10008,10008,'Yurii','Romanenko','Riverside 28','380631118899','1993-08-09','Arrested'),(10009,10009,'Oksana','Kravets','Zelena 14','380951119900','1994-04-25','Released'),(10010,10010,'Kateryna','Shevchenko','Vokzalna 5','380961120011','1990-06-06','Wanted');
/*!40000 ALTER TABLE `suspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `victim`
--

DROP TABLE IF EXISTS `victim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `victim` (
  `victim_id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`victim_id`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `victim_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `criminal_case` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victim`
--

LOCK TABLES `victim` WRITE;
/*!40000 ALTER TABLE `victim` DISABLE KEYS */;
INSERT INTO `victim` VALUES (10001,10001,'Oleh Ivanov',30,'Deceased'),(10002,10002,'Olena Kovalenko',28,'Deceased'),(10003,10003,'Maksym Petrenko',35,'Injured'),(10004,10004,'Oksana Tkachenko',25,'Deceased'),(10005,10005,'Serhii Bondar',32,'Deceased'),(10006,10006,'Kateryna Melnyk',29,'Injured'),(10007,10007,'Taras Vovk',40,'Deceased'),(10008,10008,'Yurii Romanenko',33,'Injured'),(10009,10009,'Halyna Kravets',27,'Deceased'),(10010,10010,'Ivan Shevchenko',36,'Injured'),(10011,10013,'Петро Сидоренко',38,'Injured');
/*!40000 ALTER TABLE `victim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `witness`
--

DROP TABLE IF EXISTS `witness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `witness` (
  `witness_id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `statement_date` date DEFAULT NULL,
  PRIMARY KEY (`witness_id`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `witness_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `criminal_case` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `witness`
--

LOCK TABLES `witness` WRITE;
/*!40000 ALTER TABLE `witness` DISABLE KEYS */;
INSERT INTO `witness` VALUES (10001,10001,'Olena','Kravets','Shevchenko St. 15','380931112233','1990-02-15','2023-01-16'),(10002,10002,'Ivan','Bondar','Halytska St. 7','380671112233','1985-06-21','2024-03-11'),(10003,10003,'Maksym','Tkachenko','Deribasivska 35','380501112233','1992-08-10','2024-05-22'),(10004,10004,'Oksana','Melnyk','Lisova 3','380991112233','1995-11-30','2023-09-12'),(10005,10005,'Serhii','Koval','Kozatska 10','380931100000','1988-12-01','2022-10-21'),(10006,10006,'Andrii','Vovk','Bohdan Khmelnytsky 12','380981122233','1991-03-05','2024-07-02'),(10007,10007,'Kateryna','Romanenko','Promyslova 19','380971111222','1994-05-15','2023-12-02'),(10008,10008,'Yurii','Lysenko','Riverside 24','380631111333','1987-09-23','2024-02-26'),(10009,10009,'Halyna','Petrenko','Zelena 11','380951112244','1993-01-19','2024-06-20'),(10010,10010,'Taras','Shevchenko','Vokzalna 3','380961123344','1989-07-07','2023-04-08');
/*!40000 ALTER TABLE `witness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `simple_case_view`
--

/*!50001 DROP VIEW IF EXISTS `simple_case_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `simple_case_view` AS select `c`.`case_id` AS `case_id`,`c`.`case_title` AS `case_title`,`l`.`city` AS `location_city`,`l`.`address` AS `location_address`,`d`.`email` AS `detective_email` from ((`criminal_case` `c` left join `location` `l` on((`c`.`location_id` = `l`.`location_id`))) left join `detective` `d` on((`c`.`lead_detective` = `d`.`detective_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-24 12:29:11

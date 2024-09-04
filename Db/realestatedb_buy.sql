-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: realestatedb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `property_id` bigint DEFAULT NULL,
  `buyDate` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `approvedBy` varchar(45) DEFAULT NULL,
  `declinedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `property_id_idx` (`property_id`),
  CONSTRAINT `property.id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  CONSTRAINT `user.id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (91,5,'myomyint',491,'2024-06-20 22:25:24','APPROVED','kophyo',NULL),(92,5,'myomyint',491,'2024-06-20 22:25:32','DECLINED',NULL,'kophyo'),(93,5,'myomyint',2,'2024-06-21 02:52:54','APPROVED','kophyo',NULL),(94,12,'zawgyi',492,'2024-06-24 11:32:24','DECLINED',NULL,'ray'),(95,8,'hla',492,'2024-06-24 13:19:52','APPROVED','kophyo',NULL),(96,6,'kophyo',521,'2024-07-28 03:42:57','DECLINED',NULL,'ray'),(97,6,'kophyo',520,'2024-07-28 04:09:03','DECLINED',NULL,'ray'),(98,8,'hla',519,'2024-07-28 04:25:41','APPROVED','kophyo',NULL),(99,15,'mama',512,'2024-07-28 04:40:57','DECLINED',NULL,'kophyo'),(100,17,'ray',520,'2024-07-28 05:22:28','DECLINED',NULL,'kophyo'),(101,19,'mya',516,'2024-07-28 05:35:53','APPROVED','kophyo',NULL),(102,12,'zawgyi',513,'2024-07-28 05:45:09','DECLINED',NULL,'ray'),(103,17,'ray',521,'2024-07-28 05:47:42','DECLINED',NULL,'kophyo'),(104,6,'kophyo',518,'2024-07-28 06:00:34','DECLINED',NULL,'kophyo'),(105,6,'kophyo',520,'2024-07-28 14:37:41','DECLINED',NULL,'kophyo'),(106,6,'kophyo',521,'2024-07-28 14:40:20','DECLINED',NULL,'kophyo'),(107,6,'kophyo',494,'2024-07-29 13:08:30','DECLINED',NULL,'kophyo'),(108,6,'kophyo',488,'2024-07-30 10:32:20','DECLINED',NULL,'kophyo'),(109,6,'kophyo',488,'2024-07-30 16:14:15','DECLINED',NULL,'kophyo'),(110,6,'kophyo',488,'2024-07-30 22:33:12','DECLINED',NULL,'kophyo'),(111,6,'kophyo',488,'2024-07-30 22:40:58','DECLINED',NULL,'kophyoe'),(112,6,'kophyo',522,'2024-07-30 22:54:49','DECLINED',NULL,'kophyo'),(113,5,'myomyint',515,'2024-08-01 15:36:41','APPROVED','kophyo',NULL),(114,5,'myomyint',520,'2024-08-01 15:49:45','APPROVED','kophyo',NULL),(115,6,'kophyo',520,'2024-08-01 15:50:25','DECLINED',NULL,'kophyo'),(116,35,'rosy',499,'2024-08-29 03:13:20','PENDING',NULL,NULL);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-04  9:37:44

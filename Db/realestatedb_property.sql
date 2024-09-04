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
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `image` text,
  `description` text,
  `status` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `bedroom` varchar(45) DEFAULT NULL,
  `bathroom` varchar(45) DEFAULT NULL,
  `pool` tinyint DEFAULT NULL,
  `garage` tinyint DEFAULT NULL,
  `garden` tinyint DEFAULT NULL,
  `gym` tinyint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `createdUser` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `user_username_idx` (`createdUser`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (2,'House',1920.5,'89 street, between 23 x 24, ChanAyeThaZan Township','2024-05-23 09:25:41','https://thumbs.dreamstime.com/b/classic-american-house-siding-trim-red-entry-door-exterior-concrete-floor-porch-northwest-usa-76075989.jpg?w=768','This is the simple and beautiful..good..nice..ok','sold out','Mandalay','3','2',0,1,1,0,6,'kophyo'),(488,'Apartment',1200,'110 street, between 65 x 66, ChanMyaTharZi Township','2024-06-01 13:50:36','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','myo myint property ok?',NULL,'Mandalay','1','2',0,1,0,0,5,'myomyint'),(491,'Apartment',7500,'63 street, between 34 x 35, MaharAungMyay Township','2024-06-03 01:55:58','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','the best place','sold out','Mandalay','1','2',1,1,1,0,6,'kophyo'),(492,'House',1500,'78 street, between 35 x 36, MaharAungMyay Township','2024-06-03 18:17:01','https://images.pexels.com/photos/3665354/pexels-photo-3665354.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1','it is good....ok','sold out','Mandalay','2','3',1,0,0,0,12,'zawgyi'),(493,'House',5600,'73 street, between 34 x 35, MaharAungMyay Township','2024-06-04 10:30:57','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','niceeee',NULL,'Mandalay','3','2',0,1,1,1,6,'phyomgmg'),(494,'Villa',1200,'75 street, between 35 x 36, MaharAungMyay Township','2024-06-05 00:04:35','https://thumbs.dreamstime.com/b/classic-american-house-siding-trim-red-entry-door-exterior-concrete-floor-porch-northwest-usa-76075989.jpg?w=768','The best place for living',NULL,'Mandalay','4','3',1,1,1,0,6,'kophyo'),(499,'House',5281,'41 street, between 12 x 13, AungMyayTharZan Township','2024-06-06 01:53:01','https://images.pexels.com/photos/3665354/pexels-photo-3665354.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1','The best place for living',NULL,'Mandalay','1','2',0,1,0,0,15,'mama'),(508,'House',6700,'73 street, between 34 x 35, MaharAungMyay Township','2024-06-09 22:46:35','https://images.pexels.com/photos/3665354/pexels-photo-3665354.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1','nice......ok',NULL,'Mandalay','3','3',0,0,1,1,12,'zawgyi'),(510,'House',2450,'110 street, between 65 x 66, ChanMyaTharZi Township','2024-06-11 23:09:29','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','mya house is for mg',NULL,'Mandalay','4','3',1,0,0,0,19,'mya'),(511,'Apartment',1740,'110 street, between 65 x 66, ChanMyaTharZi Township','2024-06-24 10:15:50','https://images.pexels.com/photos/3665354/pexels-photo-3665354.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1','it is nice place for living',NULL,'Mandalay','2','2',1,1,0,0,12,'zawgyi'),(512,'Condo',1960,'73 street, between 30 x 31, MaharAungMyay Township','2024-06-24 10:24:46','https://thumbs.dreamstime.com/b/classic-american-house-siding-trim-red-entry-door-exterior-concrete-floor-porch-northwest-usa-76075989.jpg?w=768','the best place for living and good transportation',NULL,'Mandalay','3','4',1,0,0,0,12,'zawgyi'),(513,'Apartment',1800,'73 street, between 34 x 35, MaharAungMyay Township','2024-07-26 01:36:38','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','it is nice',NULL,'Mandalay','2','2',0,1,0,1,5,'myomyint'),(514,'House',1400,'73 street, between 34 x 35, MaharAungMyay Township','2024-07-26 02:03:46','https://thumbs.dreamstime.com/b/classic-american-house-siding-trim-red-entry-door-exterior-concrete-floor-porch-northwest-usa-76075989.jpg?w=768','good',NULL,'Mandalay','2','4',0,0,0,1,5,'myomyint'),(515,'Condo',2500,'110 street, between 65 x 66, ChanMyaTharZi Township','2024-07-26 04:25:20','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','Nice place','sold out','Mandalay','3','3',0,0,0,1,12,'zawgyi'),(516,'Villa',1200,'78 street, between 35 x 36, MaharAungMyay Township','2024-07-26 04:28:01','https://images.pexels.com/photos/3665354/pexels-photo-3665354.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1','nice place','sold out','Mandalay','2','1',0,0,0,1,12,'zawgyi'),(517,'House',1450,'74 street, between 34 x 35, MaharAungMyay Township','2024-07-26 04:30:26',' https://thumbs.dreamstime.com/b/classic-american-house-siding-trim-red-entry-door-exterior-concrete-floor-porch-northwest-usa-76075989.jpg?w=768','best place',NULL,'Mandalay','3','2',0,1,1,0,12,'zawgyi'),(518,'House',1400,'73 street, between 34 x 35, MaharAungMyay Township','2024-07-27 15:25:17','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','It is nice',NULL,'Mandalay','2','3',1,0,1,0,12,'zawgyi'),(519,'Apartment',2300,'73 street, between 34 x 35, MaharAungMyay Township','2024-07-27 22:38:05','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','Nice','sold out','Mandalay','3','2',1,0,1,0,6,'kophyo'),(520,'House',2100,'73 street, between 34 x 35, MaharAungMyay Township','2024-07-27 22:48:14','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','good','sold out','Mandalay','3','3',0,1,0,1,5,'myomyint'),(521,'Villa',1100,'78 street, between 35 x 36, MaharAungMyay Township','2024-07-27 22:57:13','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','Nice place',NULL,'Mandalay','2','1',1,0,1,0,8,'hla'),(522,'Villa',1430,'73 street, between 34 x 35, MaharAungMyay Township','2024-07-30 04:31:24','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','Nice View',NULL,'Mandalay','2','1',1,1,1,0,15,'mama'),(523,'House',2500,'78 street, between 34 x 35, MaharAungMyay Township','2024-07-31 16:02:57','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','it is nice for living',NULL,'Yangon','1','2',0,1,1,0,12,'zawgyi'),(524,'Villa',2100,'73 street, between 34 x 35, MaharAungMyay Township','2024-07-31 16:07:37','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','good',NULL,'Mandalay','2','2',0,0,1,0,12,'kozaw'),(526,'Condo',4000,'73 street, between 34 x 35, MaharAungMyay Township','2024-08-01 15:31:04','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','nice',NULL,'Mandalay','3','2',1,0,0,0,5,'myomyint'),(528,'Villa',1850,'403 (A1), Shwe Taung Kyar Street, Bahan Township','2024-08-29 02:39:57','https://cdn.dribbble.com/userupload/6108814/file/original-e4269b2e26fb142b8d4a2fa12dd422fe.jpg?resize=752x','Nice city ,enjoy',NULL,'Yangon','2','1',0,1,0,0,35,'rosy');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
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

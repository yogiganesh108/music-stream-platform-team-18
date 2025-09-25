-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: beatflow
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `artist_id` bigint NOT NULL,
  `cover_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjufclcqx1dtxy7dxtqf2syaba` (`artist_id`),
  CONSTRAINT `FKjufclcqx1dtxy7dxtqf2syaba` FOREIGN KEY (`artist_id`) REFERENCES `artist_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Folklore',1,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(2,'OG',1,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(3,'Devara',2,'https://musicstream.blob.core.windows.net/images/devara.jpeg '),(4,'Arjun Reddy',3,'https://musicstream.blob.core.windows.net/images/arjun%20reddy.jpeg '),(5,'Shape Of You',4,'https://musicstream.blob.core.windows.net/images/Ed%20Sheeran%20-%20Shape%20of%20You%20(Lyrics).jpeg'),(6,'Pushpa 2',1,'https://musicstream.blob.core.windows.net/images/pushpa%202.jpeg '),(7,'Game Changer',2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(8,'KGF 2',3,'https://musicstream.blob.core.windows.net/images/Kgf2.jpeg'),(9,'Guntur Kaaram',4,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg ');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_profiles`
--

DROP TABLE IF EXISTS `artist_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stage_name` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK55uqdb7kdrtkjj1f3choucp4e` (`user_id`),
  CONSTRAINT `FKklsnkuj4ujtummfegmtvvtw6u` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_profiles`
--

LOCK TABLES `artist_profiles` WRITE;
/*!40000 ALTER TABLE `artist_profiles` DISABLE KEYS */;
INSERT INTO `artist_profiles` VALUES (1,'John Melody',6),(2,'John Melody',7),(3,'Melody',8),(4,'Melody',9);
/*!40000 ALTER TABLE `artist_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `follower_id` bigint NOT NULL,
  `following_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4faelgsm2rxl2jf3iyjy981ro` (`follower_id`,`following_id`),
  KEY `FKonkdkae2ngtx70jqhsh7ol6uq` (`following_id`),
  CONSTRAINT `FKonkdkae2ngtx70jqhsh7ol6uq` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqnkw0cwwh6572nyhvdjqlr163` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_tracks`
--

DROP TABLE IF EXISTS `playlist_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_tracks` (
  `playlist_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  PRIMARY KEY (`playlist_id`,`track_id`),
  KEY `FKhjkawu4qwjhxcpveah0pymuct` (`track_id`),
  CONSTRAINT `FKhjkawu4qwjhxcpveah0pymuct` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `FKn9g4py06v2tmrisjdvxvjeb7x` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_tracks`
--

LOCK TABLES `playlist_tracks` WRITE;
/*!40000 ALTER TABLE `playlist_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtgjwvfg23v990xk7k0idmqbrj` (`user_id`),
  CONSTRAINT `FKtgjwvfg23v990xk7k0idmqbrj` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` enum('ROLE_ADMIN','ROLE_ARTIST','ROLE_USER') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `artist` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `album_id` bigint DEFAULT NULL,
  `artist_id` bigint NOT NULL,
  `cover_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdcmijveo7n1lql01vav1u2jd2` (`album_id`),
  KEY `FKabxos3nsmn1mljmhwi36tyett` (`artist_id`),
  CONSTRAINT `FKabxos3nsmn1mljmhwi36tyett` FOREIGN KEY (`artist_id`) REFERENCES `artist_profiles` (`id`),
  CONSTRAINT `FKdcmijveo7n1lql01vav1u2jd2` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,'https://musicstream.blob.core.windows.net/songs/OG/Fire Storm.mp3','Thunder Road',1,1,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(2,'https://musicstream.blob.core.windows.net/songs/OG/Guns And Roses.mp3','Guns & Roses',1,2,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(3,'https://musicstream.blob.core.windows.net/songs/OG/Fire Storm.mp3','Fire Storm',2,2,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(4,'https://musicstream.blob.core.windows.net/songs/OG/Hungry Cheetah.mp3','Hungry Cheetha',2,2,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(5,'https://musicstream.blob.core.windows.net/songs/OG/Suvvi Suvvi.mp3','suvvi suvvi',2,2,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(6,'https://musicstream.blob.core.windows.net/songs/OG/Trance of OMI.mp3','Trance of Omi',2,2,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(7,'https://musicstream.blob.core.windows.net/songs/OG/Washi O Washi.mp3','Washi Yo Washi',2,2,'https://musicstream.blob.core.windows.net/images/Power%20star%20OG%20Pawan%20kalyan%20pfp%20wallpaper%20poster.jpeg'),(8,'https://musicstream.blob.core.windows.net/songs/Devara/All Hail The Tiger.mp3','All Hail The Tiger',3,2,'https://musicstream.blob.core.windows.net/images/devara.jpeg '),(9,'https://musicstream.blob.core.windows.net/songs/Devara/Ayudha Pooja.mp3','Ayudha Pooja',3,3,'https://musicstream.blob.core.windows.net/images/devara.jpeg '),(10,'https://musicstream.blob.core.windows.net/songs/Devara/Chuttamalle.mp3','Chuttamalle',3,3,'https://musicstream.blob.core.windows.net/images/devara.jpeg '),(11,'https://musicstream.blob.core.windows.net/songs/Devara/Daavudi.mp3','Daavudhi',3,3,'https://musicstream.blob.core.windows.net/images/devara.jpeg '),(12,'https://musicstream.blob.core.windows.net/songs/Devara/Fear.mp3','Fear',3,3,'https://musicstream.blob.core.windows.net/images/devara.jpeg '),(13,'https://musicstream.blob.core.windows.net/songs/Devara/Red Sea.mp3','Red Sea',3,3,'https://musicstream.blob.core.windows.net/images/devara.jpeg '),(14,'https://musicstream.blob.core.windows.net/songs/Game Changer/Arugu Meedha.mp3','Arugu Meedha',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(15,'https://musicstream.blob.core.windows.net/songs/Game Changer/Dhop.mp3','Dhop',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(16,'https://musicstream.blob.core.windows.net/songs/Game Changer/Jaragandi.mp3','Jaragandi',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(17,'https://musicstream.blob.core.windows.net/songs/Game Changer/Konda Devara.mp3','Konda Devara',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(18,'https://musicstream.blob.core.windows.net/songs/Game Changer/Koparap.mp3','Koparap',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(19,'https://musicstream.blob.core.windows.net/songs/Game Changer/Naanaa Hyraanaa.mp3','Naanaa Hyraanaa',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(20,'https://musicstream.blob.core.windows.net/songs/Game Changer/Raa Macha Macha.mp3','Raa Macha Macha',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(21,'https://musicstream.blob.core.windows.net/songs/Game Changer/Unpredictable.mp3','Unpredictable',7,2,'https://musicstream.blob.core.windows.net/images/Game%20changer.jpeg '),(22,'https://musicstream.blob.core.windows.net/songs/Guntur Kaaram/Amma.mp3','Guntur Kaaram',9,2,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg '),(23,'https://musicstream.blob.core.windows.net/songs/Guntur Kaaram/Dum Masala.mp3','Dum Masala',9,2,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg '),(24,'https://musicstream.blob.core.windows.net/songs/Guntur Kaaram/Guntur Kaaram.mp3','Guntur Kaaram',9,2,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg '),(25,'https://musicstream.blob.core.windows.net/songs/Guntur Kaaram/Kurchi Madathapetti.mp3','Kurchi Madathapetti',9,2,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg '),(26,'https://musicstream.blob.core.windows.net/songs/Guntur Kaaram/Mawaa Enthaina.mp3','Mawaa Enthaina',9,2,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg '),(27,'https://musicstream.blob.core.windows.net/songs/Guntur Kaaram/Oh My Baby.mp3','Oh My Baby',9,2,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg '),(28,'https://musicstream.blob.core.windows.net/songs/Guntur Kaaram/Ramana Aei.mp3','Ramana Aei',9,2,'https://musicstream.blob.core.windows.net/images/guntur%20karam.jpeg '),(29,'https://musicstream.blob.core.windows.net/songs/KGF 2/Mehabooba.mp3','Mehabooba',8,2,'https://musicstream.blob.core.windows.net/images/Kgf2.jpeg'),(30,'https://musicstream.blob.core.windows.net/songs/KGF 2/Sulthana.mp3','Sulthana',8,2,'https://musicstream.blob.core.windows.net/images/Kgf2.jpeg'),(31,'https://musicstream.blob.core.windows.net/songs/KGF 2/The Monster.mp3','The Monster',8,4,'https://musicstream.blob.core.windows.net/images/Kgf2.jpeg'),(32,'https://musicstream.blob.core.windows.net/songs/KGF 2/Toofan.mp3','Toofan',8,4,'https://musicstream.blob.core.windows.net/images/Kgf2.jpeg');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'karthik@gmail.com','karthik','$2a$10$ycXOhmVq6DMVa7cY0doyxeBiR47wbMPtg3KGa3nRai.wpqVzgMk7a'),(2,'muralikarthik890123@gmail.com','Murali Karthik','$2a$10$kwG5T.ulxWX4PwnZHHAdh.bC72aAXEpGCtPRdUIJ2p1gxq6mc7HTm'),(3,'2300039015@kluniversity.in','Surya Teja','$2a$10$ufi/kgUA.L95Z2Nq5sYLz.rkXdKJqPSD26alWswZBXfxRTQfQRpGa'),(4,'ikoloki@gmail.com','karthik','$2a$10$NziAj7x4j/6iKBqY9r2/h.SSVhi29MZ.F2DJLGRinBneEEopUbOEa'),(5,'k@gmail.com','karthik','$2a$10$.3a8y.T1JodaGFXRIIeDZuaqicVUkSoTWCgHNZusGM1gGun5MavCC'),(6,'arjith@example.com','Arjith','loki123'),(7,'anirudh@example.com','Anirudh','loi123'),(8,'ballaya@example.com','ballaya','loi123'),(9,'thaman@example.com','thaman','loki123'),(10,'g@gmail.com','ganesh','$2a$10$nT/w5GSofCpFYrr4pE40R.9X8gM.lKQT15WiEjmEECnbrmEl4KHs.');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-23 21:34:14

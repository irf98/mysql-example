-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: stream_service
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id_ad` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES
(1,'Coke',1,'Adults','2022-07-10 23:59:59'),
(2,'Oreo',1,'Kids','2022-09-10 10:08:20'),
(3,'PlayStation',1,'Adults','2022-03-10 21:15:30');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `free_content`
--

DROP TABLE IF EXISTS `free_content`;
/*!50001 DROP VIEW IF EXISTS `free_content`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `free_content` (
  `product_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `genre` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `director` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `free_users`
--

DROP TABLE IF EXISTS `free_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `free_users` (
  `id_free_user` int(11) NOT NULL AUTO_INCREMENT,
  `free_minutes` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_quality` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads` tinyint(1) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_free_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `free_users_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_users`
--

LOCK TABLES `free_users` WRITE;
/*!40000 ALTER TABLE `free_users` DISABLE KEYS */;
INSERT INTO `free_users` VALUES
(1,'200','720p',1,3),
(2,'50','720p',1,4),
(3,'180','720p',1,6),
(4,'67','720p',1,10);
/*!40000 ALTER TABLE `free_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id_movie` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) DEFAULT NULL,
  `premium` tinyint(1) DEFAULT NULL,
  `synopsis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES
(1,'2022-03-04 20:30:58','Goldfinger',108,'Spy','1965','Guy Humilton',7.70,1,'Synopsis','movie'),
(2,'2022-03-04 20:30:58','Rear Window',112,'Suspense','1954','Alfred Hitchcock',8.50,1,'Synopsis','movie'),
(4,'2022-03-04 20:30:58','Dial M for Murder',105,'Mystery','1954','Alfred Hitchcock',8.20,1,'Synopsis','movie'),
(5,'2022-03-04 20:30:58','Dr No',111,'Spy','1962','Terence Young',7.20,1,'Synopsis','movie'),
(6,'2022-03-04 20:30:58','Spartacus',197,'Epic','1960','Stanley Kubrick',7.90,1,'Synopsis','movie'),
(7,'2022-03-04 20:30:58','Rosemarys Baby',138,'Horror','1968','Roman Polanski',8.00,0,'Synopsis','movie'),
(8,'2022-03-04 20:30:58','Lolita',155,'Drama','1962','Stanley Kubrick',7.50,1,'Synopsis','movie'),
(9,'2022-03-04 20:30:58','Easy Rider',95,'Drama','1969','Dennis Hopper',7.30,0,'Synopsis','movie');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `premium_content`
--

DROP TABLE IF EXISTS `premium_content`;
/*!50001 DROP VIEW IF EXISTS `premium_content`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `premium_content` (
  `product_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `genre` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `director` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `premium_users`
--

DROP TABLE IF EXISTS `premium_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premium_users` (
  `id_premium_user` int(11) NOT NULL AUTO_INCREMENT,
  `payment_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_data_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_payment` datetime NOT NULL,
  `expiration` datetime NOT NULL,
  `ads` tinyint(1) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `subscription_plan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_premium_user`),
  UNIQUE KEY `payment_data` (`payment_data`),
  KEY `id_user` (`id_user`),
  KEY `subscription_plan` (`subscription_plan`),
  CONSTRAINT `premium_users_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `premium_users_ibfk_2` FOREIGN KEY (`subscription_plan`) REFERENCES `subscription` (`id_subs`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium_users`
--

LOCK TABLES `premium_users` WRITE;
/*!40000 ALTER TABLE `premium_users` DISABLE KEYS */;
INSERT INTO `premium_users` VALUES
(1,'145236524589','112','2021-11-10 23:45:00','2021-12-10 23:59:59',0,1,3),
(2,'252541003636','541','2021-11-25 09:01:45','2021-12-25 23:59:59',0,2,3),
(3,'787855526664','998','2021-12-27 03:49:46','2022-01-27 23:59:59',0,5,2),
(4,'989855551124','336','2021-11-19 20:58:27','2021-12-19 23:59:59',0,7,1),
(5,'323297771145','001','2022-01-07 13:19:20','2022-02-07 23:59:59',0,8,5),
(6,'212033335654','784','2022-01-03 16:08:27','2022-02-03 23:59:59',0,9,4);
/*!40000 ALTER TABLE `premium_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `quick_watch`
--

DROP TABLE IF EXISTS `quick_watch`;
/*!50001 DROP VIEW IF EXISTS `quick_watch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `quick_watch` (
  `id_movie` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `genre` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `director` tinyint NOT NULL,
  `duration` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `premium` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows` (
  `id_show` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `episodes` int(11) DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) DEFAULT NULL,
  `premium` tinyint(1) DEFAULT NULL,
  `synopsis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_show`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES
(1,'2022-03-04 20:30:58','Bonanza',40,431,'Western','1959','David Dortort',7.30,0,'Synopsis','show'),
(2,'2022-03-04 20:30:58','The Addams Family',25,64,'Sitcom','1964','David Levy',7.90,0,'Synopsis','show'),
(3,'2022-03-04 20:30:58','Jonny Quest',20,26,'Science-Fiction','1964','William Hanna',7.80,1,'Synopsis','show');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(6,2) DEFAULT NULL,
  `work_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_staff`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES
(1,'2022-03-04 20:30:58','John Doe','john@staff.com','test1','333555777','Managment',23.70,'Monday-Tuesday-Wednesday-Thursday-Friday'),
(2,'2022-03-04 20:30:58','James Martin','james@staff.com','test2','555888111','Developer',21.90,'Monday-Tuesday-Thursday-Friday'),
(3,'2022-03-04 20:30:58','Anne Williams','anne@staff.com','test3','888222666','Developer',21.90,'Tuesday-Wednesday-Thursday-Friday'),
(4,'2022-03-04 20:30:58','Jennifer Brown','jennifer@staff.com','test4','999333666','Community Managment',15.20,'Monday-Tuesday-Wednesday-Thursday-Friday'),
(5,'2022-03-04 20:30:58','William Evans','william@staff.com','test5','333555111','Junior Marketing',11.50,'Monday-Wednesday-Friday');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `id_subs` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_quality` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multi_user_accounts` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_subs`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES
(1,'Basic','1080p','2 users',9.90),
(2,'Family','2K','4 users',19.90),
(3,'Full','4K','2 users',19.90),
(4,'Family Full','4K','4 users',27.90),
(5,'Ultra','8K','2 users',34.90);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `top_content`
--

DROP TABLE IF EXISTS `top_content`;
/*!50001 DROP VIEW IF EXISTS `top_content`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `top_content` (
  `product_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `premium` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favorites` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'2022-03-04 20:30:58','Otis Francis','otis@mail.com','test','333555111','Drama',1),
(2,'2022-03-04 20:30:58','Drake Chambers','drake@mail.com','test','777444111','Mystery',1),
(3,'2022-03-04 20:30:58','Pearl Porter','pearl@mail.com','test','222000555','Mystery',0),
(4,'2022-03-04 20:30:58','Irene Burke','irene@mail.com','test','555222111','Horror',0),
(5,'2022-03-04 20:30:58','Willette Holmes','willete@mail.com','test','666555000','Epic',1),
(6,'2022-03-04 20:30:58','Frederick Hayes','fred@mail.com','test','222555222','Suspense',0),
(7,'2022-03-04 20:30:58','Theo Bowen','theo@mail.com','test','111222111','Suspense',1),
(8,'2022-03-04 20:30:58','Eileen Cunningham','eileen@mail.com','test','999888999','Horror',1),
(9,'2022-03-04 20:30:58','Guinevere Sims','guinevere@mail.com','test','000444111','Drama',1),
(10,'2022-03-04 20:30:58','Mortimer Lamb','mortimer@mail.com','test','444111000','Epic',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `users_in_debt`
--

DROP TABLE IF EXISTS `users_in_debt`;
/*!50001 DROP VIEW IF EXISTS `users_in_debt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `users_in_debt` (
  `id_premium_user` tinyint NOT NULL,
  `expiration` tinyint NOT NULL,
  `last_payment` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `free_content`
--

/*!50001 DROP TABLE IF EXISTS `free_content`*/;
/*!50001 DROP VIEW IF EXISTS `free_content`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `free_content` AS select `movies`.`id_movie` AS `product_id`,`movies`.`title` AS `title`,`movies`.`genre` AS `genre`,`movies`.`year` AS `year`,`movies`.`director` AS `director`,`movies`.`rating` AS `rating`,`movies`.`category` AS `category` from `movies` where `movies`.`premium` = 0 union select `shows`.`id_show` AS `product_id`,`shows`.`title` AS `title`,`shows`.`genre` AS `genre`,`shows`.`year` AS `year`,`shows`.`director` AS `director`,`shows`.`rating` AS `rating`,`shows`.`category` AS `category` from `shows` where `shows`.`premium` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `premium_content`
--

/*!50001 DROP TABLE IF EXISTS `premium_content`*/;
/*!50001 DROP VIEW IF EXISTS `premium_content`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `premium_content` AS select `movies`.`id_movie` AS `product_id`,`movies`.`title` AS `title`,`movies`.`genre` AS `genre`,`movies`.`year` AS `year`,`movies`.`director` AS `director`,`movies`.`rating` AS `rating`,`movies`.`category` AS `category` from `movies` where `movies`.`premium` = 1 union select `shows`.`id_show` AS `product_id`,`shows`.`title` AS `title`,`shows`.`genre` AS `genre`,`shows`.`year` AS `year`,`shows`.`director` AS `director`,`shows`.`rating` AS `rating`,`shows`.`category` AS `category` from `shows` where `shows`.`premium` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quick_watch`
--

/*!50001 DROP TABLE IF EXISTS `quick_watch`*/;
/*!50001 DROP VIEW IF EXISTS `quick_watch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quick_watch` AS select `movies`.`id_movie` AS `id_movie`,`movies`.`title` AS `title`,`movies`.`genre` AS `genre`,`movies`.`year` AS `year`,`movies`.`director` AS `director`,`movies`.`duration` AS `duration`,`movies`.`rating` AS `rating`,`movies`.`premium` AS `premium`,`movies`.`category` AS `category` from `movies` where `movies`.`duration` < 100 union select `shows`.`id_show` AS `id_show`,`shows`.`title` AS `title`,`shows`.`genre` AS `genre`,`shows`.`year` AS `year`,`shows`.`director` AS `director`,`shows`.`duration` AS `duration`,`shows`.`rating` AS `rating`,`shows`.`premium` AS `premium`,`shows`.`category` AS `category` from `shows` where `shows`.`duration` < 30 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_content`
--

/*!50001 DROP TABLE IF EXISTS `top_content`*/;
/*!50001 DROP VIEW IF EXISTS `top_content`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_content` AS select `movies`.`id_movie` AS `product_id`,`movies`.`title` AS `title`,`movies`.`rating` AS `rating`,`movies`.`category` AS `category`,`movies`.`premium` AS `premium` from `movies` where `movies`.`rating` > 8 union select `shows`.`id_show` AS `product_id`,`shows`.`title` AS `title`,`shows`.`rating` AS `rating`,`shows`.`category` AS `category`,`shows`.`premium` AS `premium` from `shows` where `shows`.`rating` > 8 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_in_debt`
--

/*!50001 DROP TABLE IF EXISTS `users_in_debt`*/;
/*!50001 DROP VIEW IF EXISTS `users_in_debt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_in_debt` AS select `premium_users`.`id_premium_user` AS `id_premium_user`,`premium_users`.`expiration` AS `expiration`,`premium_users`.`last_payment` AS `last_payment` from `premium_users` where `premium_users`.`expiration` < '2022-01-01 00:00:00' */;
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

-- Dump completed on 2022-03-04 18:41:11

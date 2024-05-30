-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: memorand
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `canvas`
--

DROP TABLE IF EXISTS `canvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canvas` (
  `canva_id` varchar(36) NOT NULL,
  `canva_name` varchar(64) DEFAULT NULL,
  `canva_draw` longtext,
  `canva_cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `canva_mdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `canva_status` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`canva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas`
--

LOCK TABLES `canvas` WRITE;
/*!40000 ALTER TABLE `canvas` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collabs`
--

DROP TABLE IF EXISTS `collabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collabs` (
  `collab_id` varchar(36) NOT NULL,
  `collab_status` varchar(2) DEFAULT NULL,
  `team_id` varchar(36) DEFAULT NULL,
  `proj_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`collab_id`),
  KEY `team_id` (`team_id`),
  KEY `proj_id` (`proj_id`),
  CONSTRAINT `collabs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `collabs_ibfk_2` FOREIGN KEY (`proj_id`) REFERENCES `projects` (`proj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collabs`
--

LOCK TABLES `collabs` WRITE;
/*!40000 ALTER TABLE `collabs` DISABLE KEYS */;
INSERT INTO `collabs` VALUES ('2c4bba41-e361-402a-a775-825942bb664f','si','72c8a20d-9ccd-4e9d-8c54-acc538b30d33','0e7a534c-d323-4f90-aec5-05fe133e491b');
/*!40000 ALTER TABLE `collabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collabusers`
--

DROP TABLE IF EXISTS `collabusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collabusers` (
  `collab_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  KEY `collab_id` (`collab_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collabusers_ibfk_1` FOREIGN KEY (`collab_id`) REFERENCES `collabs` (`collab_id`),
  CONSTRAINT `collabusers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collabusers`
--

LOCK TABLES `collabusers` WRITE;
/*!40000 ALTER TABLE `collabusers` DISABLE KEYS */;
INSERT INTO `collabusers` VALUES ('2c4bba41-e361-402a-a775-825942bb664f','ef251564-9915-46fe-891d-48f1cfa0cf6c');
/*!40000 ALTER TABLE `collabusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coposts`
--

DROP TABLE IF EXISTS `coposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coposts` (
  `collab_id` varchar(36) DEFAULT NULL,
  `post_id` varchar(36) DEFAULT NULL,
  KEY `collab_id` (`collab_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `coposts_ibfk_1` FOREIGN KEY (`collab_id`) REFERENCES `collabs` (`collab_id`),
  CONSTRAINT `coposts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coposts`
--

LOCK TABLES `coposts` WRITE;
/*!40000 ALTER TABLE `coposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `coposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotags`
--

DROP TABLE IF EXISTS `cotags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotags` (
  `collab_id` varchar(36) DEFAULT NULL,
  `tag_id` varchar(36) DEFAULT NULL,
  KEY `collab_id` (`collab_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `cotags_ibfk_1` FOREIGN KEY (`collab_id`) REFERENCES `collabs` (`collab_id`),
  CONSTRAINT `cotags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotags`
--

LOCK TABLES `cotags` WRITE;
/*!40000 ALTER TABLE `cotags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotasks`
--

DROP TABLE IF EXISTS `cotasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotasks` (
  `collab_id` varchar(36) DEFAULT NULL,
  `task_id` varchar(36) DEFAULT NULL,
  KEY `collab_id` (`collab_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `cotasks_ibfk_1` FOREIGN KEY (`collab_id`) REFERENCES `collabs` (`collab_id`),
  CONSTRAINT `cotasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotasks`
--

LOCK TABLES `cotasks` WRITE;
/*!40000 ALTER TABLE `cotasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideas`
--

DROP TABLE IF EXISTS `ideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ideas` (
  `idea_id` varchar(36) NOT NULL,
  `idea_text` varchar(256) DEFAULT NULL,
  `idea_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idea_color` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas`
--

LOCK TABLES `ideas` WRITE;
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inprojects`
--

DROP TABLE IF EXISTS `inprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inprojects` (
  `inst_id` varchar(36) DEFAULT NULL,
  `proj_id` varchar(36) DEFAULT NULL,
  KEY `inst_id` (`inst_id`),
  KEY `proj_id` (`proj_id`),
  CONSTRAINT `inprojects_ibfk_1` FOREIGN KEY (`inst_id`) REFERENCES `institutions` (`inst_id`),
  CONSTRAINT `inprojects_ibfk_2` FOREIGN KEY (`proj_id`) REFERENCES `projects` (`proj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inprojects`
--

LOCK TABLES `inprojects` WRITE;
/*!40000 ALTER TABLE `inprojects` DISABLE KEYS */;
INSERT INTO `inprojects` VALUES ('b44f62ec-127d-4ee0-8b54-00e227792439','0e7a534c-d323-4f90-aec5-05fe133e491b');
/*!40000 ALTER TABLE `inprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions` (
  `inst_id` varchar(36) NOT NULL,
  `inst_name` varchar(128) DEFAULT NULL,
  `inst_type` varchar(16) DEFAULT NULL,
  `inst_profile` varchar(256) DEFAULT NULL,
  `inst_status` varchar(2) DEFAULT NULL,
  `lim_ch` varchar(8) DEFAULT NULL,
  `lim_wk` varchar(8) DEFAULT NULL,
  `lim_gp` varchar(8) DEFAULT NULL,
  `lim_ks` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
INSERT INTO `institutions` VALUES ('b44f62ec-127d-4ee0-8b54-00e227792439','Gengram','Empresa','XM-Uploads/institutions/default.png','si','100','2000','100','100');
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inteams`
--

DROP TABLE IF EXISTS `inteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inteams` (
  `inst_id` varchar(36) DEFAULT NULL,
  `team_id` varchar(36) DEFAULT NULL,
  KEY `inst_id` (`inst_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `inteams_ibfk_1` FOREIGN KEY (`inst_id`) REFERENCES `institutions` (`inst_id`),
  CONSTRAINT `inteams_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inteams`
--

LOCK TABLES `inteams` WRITE;
/*!40000 ALTER TABLE `inteams` DISABLE KEYS */;
INSERT INTO `inteams` VALUES ('b44f62ec-127d-4ee0-8b54-00e227792439','72c8a20d-9ccd-4e9d-8c54-acc538b30d33');
/*!40000 ALTER TABLE `inteams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inusers`
--

DROP TABLE IF EXISTS `inusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inusers` (
  `inst_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  KEY `inst_id` (`inst_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inusers_ibfk_1` FOREIGN KEY (`inst_id`) REFERENCES `institutions` (`inst_id`),
  CONSTRAINT `inusers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inusers`
--

LOCK TABLES `inusers` WRITE;
/*!40000 ALTER TABLE `inusers` DISABLE KEYS */;
INSERT INTO `inusers` VALUES ('b44f62ec-127d-4ee0-8b54-00e227792439','5c38bb7c-026b-471b-8e24-e500cbf69833'),('b44f62ec-127d-4ee0-8b54-00e227792439','ef251564-9915-46fe-891d-48f1cfa0cf6c'),('b44f62ec-127d-4ee0-8b54-00e227792439','e479611e-b088-4015-9533-51fc8e26a3cb'),('b44f62ec-127d-4ee0-8b54-00e227792439','2a5a2192-6642-497f-aa71-9bb558610e3e'),('b44f62ec-127d-4ee0-8b54-00e227792439','e73f5920-5eeb-422f-b8b7-e749703fd8fc'),('b44f62ec-127d-4ee0-8b54-00e227792439','2589d284-a399-4837-a4fb-c7c191c860bc');
/*!40000 ALTER TABLE `inusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` varchar(36) NOT NULL,
  `note_name` varchar(64) DEFAULT NULL,
  `note_text` text,
  `note_cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `note_mdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `note_status` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` varchar(36) NOT NULL,
  `post_text` varchar(1024) DEFAULT NULL,
  `post_r1` int DEFAULT NULL,
  `post_r2` int DEFAULT NULL,
  `post_r3` int DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `proj_id` varchar(36) NOT NULL,
  `proj_name` varchar(36) DEFAULT NULL,
  `proj_color` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`proj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES ('0e7a534c-d323-4f90-aec5-05fe133e491b','memorand','25CE7B');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `req_id` varchar(36) NOT NULL,
  `req_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `req_name` varchar(32) DEFAULT NULL,
  `req_pat` varchar(16) DEFAULT NULL,
  `req_mat` varchar(16) DEFAULT NULL,
  `req_inst` varchar(36) DEFAULT NULL,
  `req_email` varchar(64) DEFAULT NULL,
  `req_phone` varchar(16) DEFAULT NULL,
  `req_job` varchar(32) DEFAULT NULL,
  `req_num` varchar(8) DEFAULT NULL,
  `req_msg` text,
  `req_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` varchar(36) NOT NULL,
  `service_name` varchar(16) DEFAULT NULL,
  `service_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('99949271-4466-46bc-b306-aa171e7e81b3','tester','si'),('9cd15faf-0fa5-482c-a7dd-d07790797528','memorand','si'),('c10c1331-6801-4402-b62d-b860d443885b','ventas','si');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestions` (
  `sug_id` varchar(36) NOT NULL,
  `sug_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sug_msg` text,
  `sug_email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` varchar(36) NOT NULL,
  `tag_name` varchar(32) DEFAULT NULL,
  `tag_color` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskcanvas`
--

DROP TABLE IF EXISTS `taskcanvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskcanvas` (
  `task_id` varchar(36) DEFAULT NULL,
  `canva_id` varchar(36) DEFAULT NULL,
  KEY `task_id` (`task_id`),
  KEY `canva_id` (`canva_id`),
  CONSTRAINT `taskcanvas_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `taskcanvas_ibfk_2` FOREIGN KEY (`canva_id`) REFERENCES `canvas` (`canva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskcanvas`
--

LOCK TABLES `taskcanvas` WRITE;
/*!40000 ALTER TABLE `taskcanvas` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskcanvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskideas`
--

DROP TABLE IF EXISTS `taskideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskideas` (
  `task_id` varchar(36) DEFAULT NULL,
  `idea_id` varchar(36) DEFAULT NULL,
  KEY `task_id` (`task_id`),
  KEY `idea_id` (`idea_id`),
  CONSTRAINT `taskideas_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `taskideas_ibfk_2` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`idea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskideas`
--

LOCK TABLES `taskideas` WRITE;
/*!40000 ALTER TABLE `taskideas` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasknotes`
--

DROP TABLE IF EXISTS `tasknotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasknotes` (
  `task_id` varchar(36) DEFAULT NULL,
  `note_id` varchar(36) DEFAULT NULL,
  KEY `task_id` (`task_id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `tasknotes_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `tasknotes_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasknotes`
--

LOCK TABLES `tasknotes` WRITE;
/*!40000 ALTER TABLE `tasknotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasknotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` varchar(36) NOT NULL,
  `task_name` varchar(128) DEFAULT NULL,
  `task_info` text,
  `task_sdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `task_edate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `task_status` varchar(16) DEFAULT NULL,
  `task_prior` varchar(16) DEFAULT NULL,
  `task_diff` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasktags`
--

DROP TABLE IF EXISTS `tasktags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasktags` (
  `task_id` varchar(36) DEFAULT NULL,
  `tag_id` varchar(36) DEFAULT NULL,
  KEY `task_id` (`task_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `tasktags_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `tasktags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasktags`
--

LOCK TABLES `tasktags` WRITE;
/*!40000 ALTER TABLE `tasktags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasktags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` varchar(36) NOT NULL,
  `team_name` varchar(36) DEFAULT NULL,
  `team_color` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('72c8a20d-9ccd-4e9d-8c54-acc538b30d33','Programacion','96D5D9');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamusers`
--

DROP TABLE IF EXISTS `teamusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamusers` (
  `team_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `teamusers_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `teamusers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamusers`
--

LOCK TABLES `teamusers` WRITE;
/*!40000 ALTER TABLE `teamusers` DISABLE KEYS */;
INSERT INTO `teamusers` VALUES ('72c8a20d-9ccd-4e9d-8c54-acc538b30d33','e479611e-b088-4015-9533-51fc8e26a3cb'),('72c8a20d-9ccd-4e9d-8c54-acc538b30d33','2a5a2192-6642-497f-aa71-9bb558610e3e'),('72c8a20d-9ccd-4e9d-8c54-acc538b30d33','e73f5920-5eeb-422f-b8b7-e749703fd8fc'),('72c8a20d-9ccd-4e9d-8c54-acc538b30d33','2589d284-a399-4837-a4fb-c7c191c860bc');
/*!40000 ALTER TABLE `teamusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `token_id` varchar(36) NOT NULL,
  `token_type` varchar(16) DEFAULT NULL,
  `token_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercanvas`
--

DROP TABLE IF EXISTS `usercanvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercanvas` (
  `user_id` varchar(36) DEFAULT NULL,
  `canva_id` varchar(36) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `canva_id` (`canva_id`),
  CONSTRAINT `usercanvas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `usercanvas_ibfk_2` FOREIGN KEY (`canva_id`) REFERENCES `canvas` (`canva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercanvas`
--

LOCK TABLES `usercanvas` WRITE;
/*!40000 ALTER TABLE `usercanvas` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercanvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userideas`
--

DROP TABLE IF EXISTS `userideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userideas` (
  `user_id` varchar(36) DEFAULT NULL,
  `idea_id` varchar(36) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `idea_id` (`idea_id`),
  CONSTRAINT `userideas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `userideas_ibfk_2` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`idea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userideas`
--

LOCK TABLES `userideas` WRITE;
/*!40000 ALTER TABLE `userideas` DISABLE KEYS */;
/*!40000 ALTER TABLE `userideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernotes`
--

DROP TABLE IF EXISTS `usernotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernotes` (
  `user_id` varchar(36) DEFAULT NULL,
  `note_id` varchar(36) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `usernotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `usernotes_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernotes`
--

LOCK TABLES `usernotes` WRITE;
/*!40000 ALTER TABLE `usernotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `usernotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userposts`
--

DROP TABLE IF EXISTS `userposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userposts` (
  `user_id` varchar(36) DEFAULT NULL,
  `post_id` varchar(36) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `userposts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `userposts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userposts`
--

LOCK TABLES `userposts` WRITE;
/*!40000 ALTER TABLE `userposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `userposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(36) NOT NULL,
  `user_email` varchar(64) DEFAULT NULL,
  `user_pass` varchar(32) DEFAULT NULL,
  `user_type` varchar(8) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_pat` varchar(16) DEFAULT NULL,
  `user_mat` varchar(16) DEFAULT NULL,
  `user_status` varchar(2) DEFAULT NULL,
  `user_profile` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('2589d284-a399-4837-a4fb-c7c191c860bc','coxcainteg@gmail.com','1234','wk','Christopher','Sandoval','Coxca','si','XM-Uploads/users/profile/default-user.png'),('2a5a2192-6642-497f-aa71-9bb558610e3e','saulinteg@gmail.com','1234','wk','Saul','Zuniga','Aguilar','si','XM-Uploads/users/profile/default-user.png'),('5c38bb7c-026b-471b-8e24-e500cbf69833','nicotest@gmail.com','nico','admin','Nicolas','Juarez','Barrios','si','XM-Uploads/users/profile/default-user.png'),('b9fde85b-5ce6-452c-96ef-735e4cd6ee94','mygengram@gmail.com','gengram','staff','Gengram','Memorand','Srl','si','XM-Uploads/users/profile/user_icon.png'),('e479611e-b088-4015-9533-51fc8e26a3cb','dylaninteg@gmail.com','1234','wk','Dylan','Martinez','Castillo','si','XM-Uploads/users/profile/default-user.png'),('e73f5920-5eeb-422f-b8b7-e749703fd8fc','cesarinteg@gmail.com','1234','wk','Cesar','Gonzalez','Flores','si','XM-Uploads/users/profile/default-user.png'),('ef251564-9915-46fe-891d-48f1cfa0cf6c','nicolider@gmail.com','1234','ch','Nicolas','Juarez','Barrios','si','XM-Uploads/users/profile/default-user.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertokens`
--

DROP TABLE IF EXISTS `usertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertokens` (
  `user_id` varchar(36) DEFAULT NULL,
  `token_id` varchar(36) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `token_id` (`token_id`),
  CONSTRAINT `usertokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `usertokens_ibfk_2` FOREIGN KEY (`token_id`) REFERENCES `tokens` (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertokens`
--

LOCK TABLES `usertokens` WRITE;
/*!40000 ALTER TABLE `usertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-29 23:27:15

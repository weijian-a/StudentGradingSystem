CREATE DATABASE  IF NOT EXISTS `sgs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sgs`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sgs
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `idAcc` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `security` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `fk_acc_role` int(11) NOT NULL,
  `fk_part_acc` int(11) NOT NULL,
  PRIMARY KEY (`idAcc`),
  KEY `fk_acc_role_idx` (`password`),
  KEY `fk_account_particulars1_idx` (`fk_acc_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'16SIC001A','5d0b66119a3349138e13a1a9af2c66d6','c6ce901781b19884a91134ec55a90b140bfa8eb2a9d86b40e6753297ef353da1',2,1),(2,'16SIC002B','cf874ad95ad64c489202c3d14e91445b','fd8978edaff10783a18f9be8ceb70ef21af6eb3d7a4e9838f5b19e591844bc84',2,2),(3,'16SIC003C','118bccd36b57402d84090625605de1ba','97dee4e9d356ba0d8782cb639893ea34c8c85e4e9cd2d6fcec00e908e0fb2793',2,3),(4,'16SIC004D','0bf19f675ac64ffe9e42614bdce758a0','976966e5c740c3686c6e03d521ba3713644bf707d07fdab5c13b4f1d27e334af',2,4),(5,'16SIC005E','3b94b2b11800470890f627a2da4540ad','bbd86cfc50444668fb2775458ad516487270b23a7610d2f95127074e81a81263',2,5),(6,'16SIC006F','ff6a23508e7d4447aeef4dc2583351d1','732a21392d38370d5cb4999d07319df62209779382637272d9a3247a42b4e58f',2,6),(7,'A100101','fd3f7c9568db41eb9b23180ffa50793a','ee3d6b8f3fe7429d26b90fd21e465217c0ecec28e831d3923673d7dfa4637f73',1,7),(8,'A100102','613c5566a3dd4601a62bbb75c8a8f839','19cf06a17b9985129256f505188d55b5d662d296684aaf68f4ad40fae5faed65',1,8),(9,'A100103','45d2581c21ea4576b868ae0b1e2ae7a6','5a529f527609e2e261d9f498159a8424bfec9aa76d1db5ea87f99bdd7b5b2f37',1,9);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll` (
  `idEnroll` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `fk_enroll_acc` int(11) DEFAULT NULL,
  `fk_enroll_mod` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEnroll`),
  KEY `fk_enroll_acc_idx` (`fk_enroll_acc`),
  KEY `fk_enroll_mod_idx` (`fk_enroll_mod`),
  CONSTRAINT `fk_enroll_acc` FOREIGN KEY (`fk_enroll_acc`) REFERENCES `account` (`idAcc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enroll_mod` FOREIGN KEY (`fk_enroll_mod`) REFERENCES `module` (`idMod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES (1,NULL,1,1001),(2,NULL,1,1002),(3,NULL,2,1001),(4,NULL,2,1003),(5,NULL,2,1005),(6,NULL,3,1002),(7,NULL,3,1003),(8,NULL,3,1005),(9,NULL,4,1001),(10,NULL,4,1002),(11,NULL,4,1003),(12,NULL,4,1005),(13,NULL,5,1001),(14,NULL,5,1004),(15,NULL,5,1005),(16,NULL,6,1001),(17,NULL,6,1003),(18,NULL,6,1004),(19,NULL,6,1005),(20,NULL,7,1002),(21,NULL,7,1005),(22,NULL,8,1004),(23,NULL,9,1001),(24,NULL,9,1003);
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `timestamp` date DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `fk_log_acc` int(11) NOT NULL AUTO_INCREMENT,
  KEY `fk_log_acc_idx` (`fk_log_acc`),
  CONSTRAINT `fk_log_acc` FOREIGN KEY (`fk_log_acc`) REFERENCES `account` (`idAcc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `idMod` int(11) NOT NULL,
  `modName` varchar(45) DEFAULT NULL,
  `modDesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1001,'Introduction to ICT','This module is intended to be at an introductory level to provide an overview of the different modules taught in the ICT programme.'),(1002,'Programming Fundamentals','This module is intended for students with no prior computing knowledge or experience beyond a basic familiarity with operation of a personal computer, and can be taken by any student interested in acq'),(1003,'Computer Organisation and Architecture','This is a foundation module whose main focus is on the characteristics and development of relatively high level ?building? blocks of a computer system. '),(1004,'Web Systems and Technologies','This module covers the essential web technologies to equip students with the useful skills to build websites for web-based IT applications.'),(1005,'Mathematics and Statistics for ICT','This module will equip students with the core mathematical knowledge in two broad focus areas: discrete mathematics, and probability and statistics.');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `particulars`
--

DROP TABLE IF EXISTS `particulars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `particulars` (
  `fk_part_acc` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fk_part_acc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particulars`
--

LOCK TABLES `particulars` WRITE;
/*!40000 ALTER TABLE `particulars` DISABLE KEYS */;
INSERT INTO `particulars` VALUES (1,'Azlan','91234567','azlan@email.com'),(2,'Wei Jian','91234567','weijian@email.com'),(3,'Cheryl','81234567','cheryl@email.com'),(4,'Winnie','81234567','winnie@email.com'),(5,'Huat Sin','97654321','huatsin@email.com'),(6,'Yeong Chai','97654321','yeongchai@email.com'),(7,'Karin Avnit',NULL,'karin@email.com'),(8,'Wing Keong',NULL,'wingkeong@email.com'),(9,'Indriyati',NULL,'indriyati@email.com');
/*!40000 ALTER TABLE `particulars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Faculty','Faculty of school'),(2,'Student','Student enrolled to school');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'name','name2','2016-10-20','afdafa@gmail.com'),(2,'weijian','ang','2016-10-20','agn@gmail.com');
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

-- Dump completed on 2016-10-29 15:09:01

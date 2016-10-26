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
INSERT INTO `account` VALUES (1,'16SIC001A','86fc18a364fe4303ba07e451fcb70a99','293249e7a9725c98fdbb2174fb0a3fe0d00cbf9a42d037c82ce2ec65161f2a21',2,1),(2,'16SIC002B','123','96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e',2,2),(3,'16SIC003C','123','96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e',2,3),(4,'16SIC004D','123','96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e',2,4),(5,'16SIC005E','123','96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e',2,5),(6,'16SIC006F','123','96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e',2,6),(7,'A100101','093de0b7a13a63f7132ad2bc4be0d7df50462af0869656818b446595e0ae1486','4e517ab81e666db06d15340533a68139ecfccaf58da8570e9e2ceb70095c724c',1,7),(8,'A100102','209b057f280a40b4b203847e3de2d24f','a2215e60afc80a04fc91d501d286d99100a4f81beafe982b220f378a75979c7f',1,8),(9,'A100103','123','96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e',1,9);
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

-- Dump completed on 2016-10-26 18:28:30

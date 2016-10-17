# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: sgs
# Generation Time: 2016-10-17 09:10:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `idAcc` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fk_acc_role` int(11) NOT NULL,
  `fk_part_acc` int(11) NOT NULL,
  PRIMARY KEY (`idAcc`),
  KEY `fk_acc_role_idx` (`fk_acc_role`),
  KEY `fk_account_particulars1_idx` (`fk_part_acc`),
  CONSTRAINT `fk_acc_role` FOREIGN KEY (`fk_acc_role`) REFERENCES `role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_particulars1` FOREIGN KEY (`fk_part_acc`) REFERENCES `particulars` (`fk_part_acc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;

INSERT INTO `account` (`idAcc`, `username`, `password`, `fk_acc_role`, `fk_part_acc`)
VALUES
	(1,'16SIC001A','123456',2,1),
	(2,'16SIC002B','123456',2,2),
	(3,'16SIC003C','123456',2,3),
	(4,'16SIC004D','123456',2,4),
	(5,'16SIC005E','123456',2,5),
	(6,'16SIC006F','123456',2,6),
	(7,'A100101','123456',1,7),
	(8,'A100102','123456',1,8),
	(9,'A100103','123456',1,9);

/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table enroll
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enroll`;

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

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;

INSERT INTO `enroll` (`idEnroll`, `grade`, `fk_enroll_acc`, `fk_enroll_mod`)
VALUES
	(1,NULL,1,1001),
	(2,NULL,1,1002),
	(3,NULL,2,1001),
	(4,NULL,2,1003),
	(5,NULL,2,1005),
	(6,NULL,3,1002),
	(7,NULL,3,1003),
	(8,NULL,3,1005),
	(9,NULL,4,1001),
	(10,NULL,4,1002),
	(11,NULL,4,1003),
	(12,NULL,4,1005),
	(13,NULL,5,1001),
	(14,NULL,5,1004),
	(15,NULL,5,1005),
	(16,NULL,6,1001),
	(17,NULL,6,1003),
	(18,NULL,6,1004),
	(19,NULL,6,1005),
	(20,NULL,7,1002),
	(21,NULL,7,1005),
	(22,NULL,8,1004),
	(23,NULL,9,1001),
	(24,NULL,9,1003);

/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `timestamp` date DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `fk_log_acc` int(11) NOT NULL AUTO_INCREMENT,
  KEY `fk_log_acc_idx` (`fk_log_acc`),
  CONSTRAINT `fk_log_acc` FOREIGN KEY (`fk_log_acc`) REFERENCES `account` (`idAcc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `idMod` int(11) NOT NULL,
  `modName` varchar(45) DEFAULT NULL,
  `modDesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;

INSERT INTO `module` (`idMod`, `modName`, `modDesc`)
VALUES
	(1001,'Introduction to ICT','This module is intended to be at an introductory level to provide an overview of the different modules taught in the ICT programme.'),
	(1002,'Programming Fundamentals','This module is intended for students with no prior computing knowledge or experience beyond a basic familiarity with operation of a personal computer, and can be taken by any student interested in acq'),
	(1003,'Computer Organisation and Architecture','This is a foundation module whose main focus is on the characteristics and development of relatively high level ?building? blocks of a computer system. '),
	(1004,'Web Systems and Technologies','This module covers the essential web technologies to equip students with the useful skills to build websites for web-based IT applications.'),
	(1005,'Mathematics and Statistics for ICT','This module will equip students with the core mathematical knowledge in two broad focus areas: discrete mathematics, and probability and statistics.');

/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table particulars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `particulars`;

CREATE TABLE `particulars` (
  `fk_part_acc` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fk_part_acc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `particulars` WRITE;
/*!40000 ALTER TABLE `particulars` DISABLE KEYS */;

INSERT INTO `particulars` (`fk_part_acc`, `name`, `contact`, `email`)
VALUES
	(1,'Azlan','91234567','azlan@email.com'),
	(2,'Wei Jian','91234567','weijian@email.com'),
	(3,'Cheryl','81234567','cheryl@email.com'),
	(4,'Winnie','81234567','winnie@email.com'),
	(5,'Huat Sin','97654321','huatsin@email.com'),
	(6,'Yeong Chai','97654321','yeongchai@email.com'),
	(7,'Karin Avnit',NULL,'karin@email.com'),
	(8,'Wing Keong',NULL,'wingkeong@email.com'),
	(9,'Indriyati',NULL,'indriyati@email.com');

/*!40000 ALTER TABLE `particulars` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`idRole`, `name`, `desc`)
VALUES
	(1,'Faculty','Faculty of school'),
	(2,'Student','Student enrolled to school');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

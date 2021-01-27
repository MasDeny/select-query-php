DROP database IF EXISTS `dbtest`;

create database `dbtest`;

use `dbtest`;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(125) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Device` int(11) NOT NULL DEFAULT '0',
  `Status` int(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES 
(25,'s5@mail.com','s5username','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:12:36','2020-07-03 10:12:36'),
(26,'s6@mail.com','s6username','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:16:49','2020-07-03 10:16:49'),
(27,'s7@mail.com','s7username','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:19:03','2020-07-03 10:19:03'),
(28,'s8@mail.com','s5Username','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:20:24','2020-07-03 10:20:24'),
(29,'s9@mail.com','s9username','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:24:10','2020-07-03 10:24:10'),
(30,'s10@mail.com','Brusi','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:25:22','2020-07-03 10:25:22'),
(31,'s11@mail.com','Fasladasd','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:28:08','2020-07-03 10:28:08'),
(32,'s12@mail.com','Flasli','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:29:02','2020-07-03 10:29:02'),
(33,'s13@mail.com','sasika','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:31:30','2020-07-03 10:31:30'),
(34,'s14@mail.com','Galasik','4297f44b13955235245b2497399d7a93','murid',0,0,'2020-07-03 10:33:37','2020-07-25 09:13:04'),
(38,'s15@mail.com','Gordon','4297f44b13955235245b2497399d7a93','murid',1,0,'2020-07-04 05:14:30','2020-07-25 12:28:35'),
(46,'s16@mail.com','kesetmanyun','96e79218965eb72c92a549dd5a330112','murid',1,1,'2020-07-07 02:02:16','2020-08-09 16:30:26'),
(47,'s17@mail.com','student15','4297f44b13955235245b2497399d7a93','murid',1,1,'2020-07-08 18:28:11','2020-09-10 14:33:17');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `idStudents` varchar(50) NOT NULL,
  `name` varchar(125) NOT NULL,
  `bornOfDate` varchar(125) NOT NULL,
  `gender` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `address` json DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `profilePhoto` varchar(255) DEFAULT NULL,
  `class` int(11) DEFAULT '3',
  `level` varchar(45) DEFAULT NULL,
  `schoolYear` int(11) DEFAULT NULL,
  `idUsers` int(11) NOT NULL,
  PRIMARY KEY (`idStudents`),
  KEY `fk_Students_Users` (`idUsers`),
  CONSTRAINT `fk_Students_Users` FOREIGN KEY (`idUsers`) REFERENCES `Users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES 
('BKKN-345','Kresek Lupis','Bondowoso,  06-02-2008','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','85604968374','upload/profile/students/28-07-2020-s9username-pngkit_horse-face-png_2721043.png',3,NULL,2018,29),
('DDFG-765','Sasika Haruan','Blora, 24-02-1993','Perempuan','Islam','{\"zip\": \"456678\", \"city\": \"Jember\", \"state\": \"Jawa Timur\", \"address\": \"JAlan Ratungalahi \"}','0896547345','upload/profile/students/16-07-2020-sasika-pngkit_cat-png_27307.png',2,'2',2018,33),
('FKG-88','Falcon Falasik','Jember, 06-02-2008','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','085604968374','',3,NULL,2018,30),
('IKL-990','Mamba Bari','Lamongan,  06-02-2008','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','85604968374','',3,NULL,2018,32),
('LMB-DKK','Deny Mazda','Kepulauan Cook,  26-04-2012','Laki-Laki','Hindu','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','085604968374','upload/profile/students/28-07-2020-kesetmanyun-clipart871804.png',2,'1',2018,46),
('LOL-234','Galala Lalalaa','Kediri, 06-02-2008','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','085604968374','',3,NULL,2018,34),
('STT12','Susi Similikita','Jember, 19-02-2010','Perempuan','Katolik','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','085604968374','',3,NULL,2018,25),
('STT15','Andi Kurtawa','Banyuwangi, 19-01-2005','Laki-Laki','Kristen','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','085604968374','',2,NULL,2018,26),
('STT18','Andi Tequila','Situbondo,  24-02-1993','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','85604968374','upload/profile/students/28-07-2020-s7username-pngkit_horse-face-png_2721043.png',1,NULL,2016,27),
('TKL-223','Rudi Diantara','Jember,   14-08-2014','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Pasuruan\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','0895666783','upload/profile/students/09-07-2020-student15-pngkit_lenny-face-png_214209.png',1,'2',2018,47),
('TKL-334','Slalu hasusi','Batu,  06-02-2008','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','85604968374','',3,NULL,2018,31),
('TKM-1244','Gordon Syalala','Pasuruan,  06-02-2008','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','85604968374','upload/profile/students/Gordon-Group_1.png',1,NULL,2018,38),
('TKS45','Garmin Garda','Jember, 06-02-2008','Laki-Laki','Islam','{\"zip\": \"65433\", \"city\": \"Surabaya\", \"state\": \"Jawa Timur\", \"address\": \"jawi wetan\"}','085604968374','',3,NULL,2018,28);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionScores`
--

DROP TABLE IF EXISTS `TransactionScores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransactionScores` (
  `idScores` int(11) NOT NULL AUTO_INCREMENT,
  `typeExam` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `studentScore` varchar(3) NOT NULL,
  `Descriptions` json DEFAULT NULL,
  `idStudent` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idScores`),
  KEY `fk_ScoresHistory_Students1_idx` (`idStudent`),
  CONSTRAINT `fk_ScoresHistory_Students1` FOREIGN KEY (`idStudent`) REFERENCES `Students` (`idStudents`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionScores`
--

LOCK TABLES `TransactionScores` WRITE;
/*!40000 ALTER TABLE `TransactionScores` DISABLE KEYS */;
INSERT INTO `TransactionScores` VALUES 
(1,1,1,'0.8',NULL,'BKKN-345','2020-08-07 04:13:44','2020-08-07 04:13:44'),
(2,2,1,'0.5',NULL,'DDFG-765','2020-08-07 05:41:57','2020-08-07 05:41:57'),
(3,2,1,'0.5',NULL,'FKG-88','2020-08-07 06:25:05','2020-08-07 06:25:05'),
(4,2,1,'0.5',NULL,'IKL-990','2020-08-07 07:11:58','2020-08-07 07:11:58'),
(5,1,1,'0.7',NULL,'LMB-DKK','2020-08-09 15:02:14','2020-08-09 15:02:14'),
(6,1,1,'0.5',NULL,'LOL-234','2020-08-09 16:00:29','2020-08-09 16:00:29'),
(7,2,1,'0.5',NULL,'STT12','2020-08-09 16:05:11','2020-08-09 16:05:11'),
(8,2,2,'0.5',NULL,'STT15','2020-08-09 16:08:10','2020-08-09 16:08:10'),
(9,2,2,'0.5',NULL,'STT18','2020-08-09 16:26:57','2020-08-09 16:26:57'),
(10,2,2,'0',NULL,'TKL-223','2020-08-09 16:30:26','2020-08-09 16:30:26'),
(11,3,2,'0.2',NULL,'TKL-334','2020-09-10 13:44:43','2020-09-10 13:44:43'),
(12,2,1,'0.2',NULL,'TKM-1244','2020-09-10 14:33:17','2020-09-10 14:33:17'),
(13,3,1,'0.2',NULL,'TKS45','2020-09-15 08:13:20','2020-09-15 08:13:20');
/*!40000 ALTER TABLE `TransactionScores` ENABLE KEYS */;
UNLOCK TABLES;
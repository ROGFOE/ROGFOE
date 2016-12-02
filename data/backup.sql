-- MySQL dump 10.14  Distrib 5.5.50-MariaDB, for Linux (x86_64)
--
-- Host: cosc304.ok.ubc.ca    Database: db_jrogers
-- ------------------------------------------------------
-- Server version	5.5.50-MariaDB

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `AddID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) DEFAULT NULL,
  `WID` int(11) DEFAULT NULL,
  `AddressType` enum('Warehouse','Practice','Shipping','Home','Billing','Other') NOT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(3) NOT NULL,
  `State` varchar(50) DEFAULT NULL,
  `PostalCode` char(10) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  PRIMARY KEY (`AddID`),
  KEY `UID` (`UID`),
  KEY `WID` (`WID`),
  CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Address_ibfk_2` FOREIGN KEY (`WID`) REFERENCES `Warehouse` (`WID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,7,NULL,'Home','456 Mumbai Road','Manila',NULL,'phl','JK','V64 899',NULL),(2,8,NULL,'Home','123 Im just suggesting','vancouver',NULL,'cad','BC','gh6 7yh',NULL),(3,9,NULL,'Home','807 Coronado Crescent','Kelowna',NULL,'irn','QT','TYR-989',NULL),(4,10,NULL,'Home','#122  935 academy way','Kelowna',NULL,'cad','BRITISH COLUMBIA','v1v3a4',NULL),(5,11,NULL,'Home','1234 Fake St.','Kelowna',NULL,'cad','BC','V4V 1J6',NULL),(6,7,NULL,'Shipping','456 Fairmont Drive','Kelowna',NULL,'cad','JK','v1v3a4',NULL),(7,1,NULL,'Shipping','456 Fairmont Drive','Kelowna',NULL,'cad','JK','v1v3a4',NULL),(9,1,NULL,'Home','456 Hot Babes Drive','Kelowna',NULL,'cad','JK','v1v3a4',NULL),(10,12,NULL,'Home','#122  935 academy way','Kelowna',NULL,'cad','BRITISH COLUMBIA','v1v3a4',NULL),(11,2,NULL,'Shipping','807 Coronado Crescent','Kelowna',NULL,'BC','cad','V1W 4J1',NULL),(12,2,NULL,'Shipping','113 Main Street','Nashville',NULL,'us','TN','VHJ MTV',NULL),(13,2,NULL,'Shipping','1492 Stone Canyon Drive','LA',NULL,'us','CA','HEL LYA',NULL),(14,2,NULL,'Shipping','45 Last Time Road','SaniCity',NULL,'cad','OI','HEL LYA',NULL),(15,2,NULL,'Shipping','','',NULL,'cad','','',NULL),(16,2,NULL,'Shipping','','',NULL,'cad','','',NULL),(17,2,NULL,'Shipping','','',NULL,'cad','','',NULL),(18,4,NULL,'Shipping','1800 Cinncinati Zoo','Cinncinnati',NULL,'us','CL','HEL LNO',NULL),(19,13,NULL,'Home','3275 Lakeshore Road','Kelowna',NULL,'cad','British Columbia','V1W 3S9',NULL),(20,13,NULL,'Shipping','935 Horseshoe Drive','Vanderhoof',NULL,'cad','BC','W7U O9I',NULL),(21,14,NULL,'Home','1234 Fake St.','Kelowna',NULL,'cad','BC','V4V 111',NULL),(22,15,NULL,'Home','Street','City',NULL,'cad','','',NULL),(23,16,NULL,'Home','1492 Stone Canyon Drive','Los Angeles',NULL,'us','CA','V8M OTO',NULL),(24,17,NULL,'Home','1234 Fake St.','Kelowna',NULL,'cad','BC','V4V 111',NULL),(25,18,NULL,'Home','1234 Fake St.','Kelowna',NULL,'cad','BC','V4V 111',NULL),(26,19,NULL,'Home','4444 Harrison Avenue','Vancouver',NULL,'cad','BC','V3A 012',NULL),(27,20,NULL,'Practice','1234 Pineapple St.','Atlantis',NULL,'cad','ON','SEA BOB',NULL),(28,21,NULL,'Practice',' 456 Fairmont Drive',' Kelowna',NULL,'cad',' JK',' v1v3a4',NULL),(29,15,NULL,'Shipping','1731 Marona Court','Kelowna',NULL,'cad','BC','v1v2n2',NULL),(30,22,NULL,'Home','1731 Marona Court','Kelowna',NULL,'cad','BC','v1v2n2',NULL);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(40) NOT NULL,
  PRIMARY KEY (`UID`),
  CONSTRAINT `Admin_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,'Boss-Man');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BankTransfer`
--

DROP TABLE IF EXISTS `BankTransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BankTransfer` (
  `AccountNum` bigint(20) NOT NULL,
  `BankName` varchar(50) NOT NULL,
  `BranchNum` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`AccountNum`),
  UNIQUE KEY `AccountNum` (`AccountNum`),
  KEY `UID` (`UID`),
  CONSTRAINT `BankTransfer_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankTransfer`
--

LOCK TABLES `BankTransfer` WRITE;
/*!40000 ALTER TABLE `BankTransfer` DISABLE KEYS */;
INSERT INTO `BankTransfer` VALUES (15,'TD',123,4),(4825220,'TD',24,1),(45342433,'RBC',15,4),(78825220,'RBS',24,1),(21231423342,'RBC',22,4);
/*!40000 ALTER TABLE `BankTransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart` (
  `CartID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CartID`),
  KEY `UID` (`UID`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `MedID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `CBloodType` enum('A','B','AB','O') NOT NULL,
  `CSex` enum('Male','Female') DEFAULT NULL,
  PRIMARY KEY (`MedID`),
  KEY `UID` (`UID`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `PracticeName` varchar(50) NOT NULL,
  PRIMARY KEY (`UID`),
  CONSTRAINT `Doctor_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Gonzales and Associates'),(20,'Underwater Family Clinic');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donor`
--

DROP TABLE IF EXISTS `Donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Donor` (
  `DMedID` int(11) NOT NULL AUTO_INCREMENT,
  `DFName` varchar(50) NOT NULL,
  `DMName` varchar(50) NOT NULL,
  `DLName` varchar(50) NOT NULL,
  `Health` varchar(50) DEFAULT NULL,
  `DSex` enum('Male','Female') DEFAULT NULL,
  `DAge` int(3) NOT NULL,
  `Deceased` tinyint(1) NOT NULL,
  PRIMARY KEY (`DMedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donor`
--

LOCK TABLES `Donor` WRITE;
/*!40000 ALTER TABLE `Donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `OID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShipAddID` int(11) NOT NULL,
  `BillAddID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `OrderTotal` decimal(12,2) NOT NULL,
  `ShippingFee` decimal(12,2) DEFAULT NULL,
  `Status` enum('Ordered','InTransit','Delivered') NOT NULL,
  `GrandTotal` decimal(12,2) NOT NULL,
  `PayBy` enum('Visa','BankTransfer','PayPal') NOT NULL,
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`OID`),
  KEY `ShipAddID` (`ShipAddID`),
  KEY `BillAddID` (`BillAddID`),
  KEY `PayBy` (`PayBy`),
  KEY `UID` (`UID`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`ShipAddID`) REFERENCES `Address` (`AddID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`BillAddID`) REFERENCES `Address` (`AddID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_3` FOREIGN KEY (`PayBy`) REFERENCES `PaymentType` (`Type`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_4` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (3,9,9,'2016-12-01',33567.56,0.00,'Ordered',33567.56,'Visa',1),(4,9,9,'2016-12-01',29185.23,0.00,'Ordered',29185.23,'PayPal',1),(5,7,7,'2016-12-01',29185.23,0.00,'Ordered',29185.23,'Visa',1),(6,9,9,'2016-12-02',43566.28,0.00,'Ordered',43566.28,'PayPal',1),(7,9,9,'2016-12-02',147398.13,0.00,'Ordered',147398.13,'PayPal',1),(8,14,14,'2016-12-02',107063.85,0.00,'Ordered',107063.85,'PayPal',2),(9,12,12,'2016-12-02',139713.36,0.00,'Ordered',139713.36,'PayPal',2),(10,11,11,'2016-12-02',43303.47,0.00,'Ordered',43303.47,'Visa',2),(11,23,23,'2016-12-02',85760.44,0.00,'Ordered',85760.44,'Visa',16),(12,7,7,'2016-12-02',110724.18,0.00,'Ordered',110724.18,'Visa',1),(13,6,6,'2016-12-02',1852.56,0.00,'Ordered',1852.56,'PayPal',7),(14,12,12,'2016-12-02',44345.49,0.00,'Ordered',44345.49,'PayPal',2),(15,23,23,'2016-12-02',1852.56,0.00,'Ordered',1852.56,'Visa',16),(16,4,4,'2016-12-02',57106.07,0.00,'Ordered',57106.07,'PayPal',10),(17,29,29,'2016-12-02',81608.88,0.00,'Ordered',81608.88,'PayPal',15);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organ`
--

DROP TABLE IF EXISTS `Organ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organ` (
  `OrgID` int(11) NOT NULL AUTO_INCREMENT,
  `WID` int(11) DEFAULT NULL,
  `CartID` int(11) DEFAULT NULL,
  `DMedID` int(11) DEFAULT NULL,
  `OID` bigint(20) DEFAULT NULL,
  `OName` varchar(100) NOT NULL,
  `UnitPrice` decimal(12,2) NOT NULL,
  `Size` int(11) NOT NULL,
  `RemovalDate` date NOT NULL,
  `OBloodType` enum('A','B','AB','O') NOT NULL,
  `Desc` varchar(500) NOT NULL,
  `Picture` varchar(500) NOT NULL,
  `CertDoctor` varchar(100) NOT NULL,
  `CertHospital` varchar(100) NOT NULL,
  `Category` varchar(100) NOT NULL,
  PRIMARY KEY (`OrgID`),
  KEY `WID` (`WID`),
  KEY `CartID` (`CartID`),
  KEY `DMedID` (`DMedID`),
  KEY `OID` (`OID`),
  CONSTRAINT `Organ_ibfk_1` FOREIGN KEY (`WID`) REFERENCES `Warehouse` (`WID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Organ_ibfk_2` FOREIGN KEY (`CartID`) REFERENCES `Cart` (`CartID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Organ_ibfk_3` FOREIGN KEY (`DMedID`) REFERENCES `Donor` (`DMedID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Organ_ibfk_4` FOREIGN KEY (`OID`) REFERENCES `Order` (`OID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organ`
--

LOCK TABLES `Organ` WRITE;
/*!40000 ALTER TABLE `Organ` DISABLE KEYS */;
INSERT INTO `Organ` VALUES (1,NULL,NULL,NULL,NULL,'Adrenal gland',82383.04,5,'2016-11-25','O','THIS GUY DID FRONTFLIPS FROM STANDING!!!','http://homepage.smc.edu/wissmann_paul/intranetstuff/dept/scienceLRC/wissmann_site/images/adrenals_whole2.jpg','Dr. Dre','Mayo Clinic Rochester Minn.','gland'),(2,NULL,NULL,NULL,NULL,'Appendix',65944.97,4,'2016-12-02','A','This ain\'t the end of no book. ','http://hpbsurgery.net/Images/surgery/appendix/acute%20appendicitis.jpg','Dr. Payne ','Cleveland Clinic','middle body'),(3,NULL,NULL,NULL,16,'Bladder',57106.07,42,'2016-11-29','B','So fresh. So organic. We bet you can\'t wait to hold it.','http://th01.deviantart.net/fs41/PRE/i/2009/011/3/f/Canine_Urinary_Bladder_by_addonemore.jpg','Dr. Blood','Massachusetts General Hospital Boston','middle body'),(4,NULL,NULL,NULL,17,'Brain',53990.15,1400,'2016-11-26','A','He thought, therefore, he was.','http://www.itvscience.com/wp-content/uploads/2016/06/Brain.jpg','Dr. Ricketts','Johns Hopkins Hospital Baltimore','upper body'),(5,NULL,NULL,NULL,11,'Ear',57807.79,10,'2016-11-29','AB','Lend me your... chequebook, for this waxless beaut of a specimen.','http://www.pngall.com/wp-content/uploads/2016/04/Ear-PNG-Pic.png','Dr. Stump','UCLA Medical Center','upper body'),(6,NULL,NULL,NULL,NULL,'Esophagus',32527.41,20,'2016-11-29','A','The poor sap who owned this fine gullet went to war and took a bullet. ','http://www.gastrolab.net/y0027x.jpg','Dr. Croke','New York-Presbyterian University Hospital of Columbia and Cornell','upper body'),(7,NULL,NULL,NULL,NULL,'Eye',16758.53,12,'2016-11-25','B','Eye\'m glad eye avoid eye puns.','https://i.ytimg.com/vi/UPyx0szdv0k/maxresdefault.jpg','Dr. Killie','UCSF Medical Center San Francisco','upper body'),(8,NULL,NULL,NULL,NULL,'Gall bladder',74654.98,30,'2016-12-02','A','Has it been a while since you\'ve had some bile?','http://img.medscapestatic.com/pi/meds/ckb/50/36250tn.jpg','Dr. Poke','Northwestern Memorial Hospital Chicago','middle body'),(9,NULL,NULL,NULL,NULL,'Heart',280.50,130,'2016-11-26','O','This thing will look CRAZY on you.','https://s-media-cache-ak0.pinimg.com/564x/ae/08/0a/ae080ae83b9d4c8dac70dbbff00e4941.jpg','Dr. Young-Hyman','Hospitals of the University of Pennsylvania-Penn Presbyterian Philadelphia','upper middle body'),(10,NULL,NULL,NULL,12,'Kidney',54590.32,365,'2016-11-29','O','I know what you\'re thinking, but this came from an adult.','https://www.thesun.co.uk/wp-content/uploads/2016/04/2095975.main_image.jpg?strip=all','Dr. Fatterpaker','NYU Langone Medical Center','middle body'),(11,NULL,NULL,NULL,NULL,'Large intestine',77926.30,2670,'2016-11-29','AB','Like Trump, it\'s big and full of shit.','https://s-media-cache-ak0.pinimg.com/736x/d5/75/74/d575747e28a251bdf8af8a9c3e70fe6f.jpg','Dr. Acula','Barnes-Jewish Hospital/Washington University St. Louis','middle body'),(12,NULL,NULL,NULL,3,'Liver',57564.23,2300,'2016-12-02','O','If this doesn\'t get purchased soon we\'re going to need to throw another pâté party.','http://supernaturalacnetreatment.com/wp-content/uploads/2016/02/does-toxic-liver-cause-acne.jpg','Dr. Frankenstein','UPMC Presbyterian Shadyside Pittsburgh','middle body'),(13,NULL,NULL,NULL,NULL,'Lung',42048.76,1569,'2016-11-26','AB','Lifelong smoker. But only the good stuff.','http://hotphotosfree.com/sites/default/files/styles/large/public/field/image/b2faa4743fc119677f0e0d68f616346e.jpg?itok=Njk3qgkg','Dr. Pepper','Brigham and Women\'s Hospital Boston','upper middle body'),(14,NULL,NULL,NULL,NULL,'Mouth',83736.47,40,'2016-12-02','B','That\'s right, the whole thing.','http://www.pngall.com/wp-content/uploads/2016/03/Mouth-PNG-Clipart.png','Dr. Bonar','Stanford Health Care-Stanford Hospital Stanford Calif.','upper body'),(15,NULL,NULL,NULL,NULL,'Muscle',42524.26,975,'2016-11-27','A','A random assortment.','http://cdn.rsvlts.com/wp-content/uploads/2012/08/Arnold-Schwarzenegger-Young-Photos-28-930x1301.jpg','Dr. Blome','Mount Sinai Hospital New York','body'),(16,NULL,NULL,NULL,17,'Nose',26576.71,540,'2016-11-29','A','It smelled REAL good. Not so much anymore.','http://www.sciencemag.org/sites/default/files/styles/article_main_large/public/images/cc_nose_16x9.jpg?itok=WXj7iPir','Dr. Doom','Duke University Hospital Durham N.C.','upper body'),(17,NULL,NULL,NULL,11,'Pancreas',27952.65,985,'2016-11-29','AB','Pan crust pizza. Pancreas pizza. Coincidence?','http://partnersah.vet.cornell.edu/sites/default/files/avian_atlas_assets/Pancreas4%20x750.jpg','Dr. Dre','Cedars-Sinai Medical Center Los Angeles','middle body'),(18,NULL,NULL,NULL,NULL,'Parathyroid gland',29185.23,46,'2016-11-28','O','Its name is kinda like being called \"guy beside Ramon\".','http://blog.parathyroid.com/wp-content/uploads/2013/08/adenoma-and-another-quarter-e1377708421605.jpg','Dr. Payne ','University of Michigan Hospitals and Health Centers Ann Arbor','gland'),(19,NULL,NULL,NULL,NULL,'Pineal gland',40558.53,4,'2016-11-27','O','It\'s worth buying just so you can laugh hysterically at all the stupid hagfish.','http://previews.123rf.com/images/allison14/allison141204/allison14120400045/13331869-A-Single-Pea-and-a-Fork-on-a-White-Plate-Stock-Photo.jpg','Dr. Blood','Houston Methodist Hospital','gland'),(20,NULL,NULL,NULL,15,'Pituitary gland',1852.56,39,'2016-11-26','B','The size of a pea, but slightly more of a fee.','http://drarunlnaik.com/wp-content/uploads/2014/08/PituitaryGland.196230413_std.jpg','Dr. Ricketts','University of Colorado Hospital Aurora','gland'),(21,NULL,NULL,NULL,17,'Skin',1042.02,9800,'2016-11-29','B','Get this wrinkly old skin bag for half off if you buy now.','https://thumbs.dreamstime.com/x/wrinkled-skin-18040649.jpg','Dr. Stump','Mayo Clinic Rochester Minn.','body'),(22,NULL,NULL,NULL,NULL,'Small intestine',39912.53,150,'2016-11-30','AB','Like Trump, it\'s full of shit, and has a small mind.','http://hotphotosfree.com/sites/default/files/styles/medium/public/field/image/19ac1b2e54528aba2bbbc6a5dd3ff991.jpg?itok=NfChGaY1','Dr. Croke','Cleveland Clinic','lower middle body'),(23,NULL,NULL,NULL,NULL,'Spleen',65015.09,65,'2016-11-30','AB','FAME ALERT! Straight from Charlie Sheen!  Warning: Sheen\'s spleen is likely infected with syphilis.','http://www.humpath.com/IMG/jpg_spleen_04_1.jpg','Dr. Killie','Massachusetts General Hospital Boston','middle body'),(24,NULL,NULL,NULL,NULL,'Stomach',69717.28,84,'2016-12-02','O','Barring serious crushing injuries, flat stomachs are a myth.','http://i.imgur.com/UHF8s0T.jpg','Dr. Poke','Johns Hopkins Hospital Baltimore','middle body'),(25,NULL,NULL,NULL,NULL,'Thymus',33278.31,9,'2016-11-28','B','Enormous prepubescent A-Grade thymus literally oozing with T-killer cells. ','http://www.ctsnet.org/sites/default/files/graphics/experts/Thoracic/myers_transcerv/4989-thymus.jpg','Dr. Young-Hyman','UCLA Medical Center','unknown'),(26,NULL,NULL,NULL,NULL,'Thyroid gland',41520.44,29,'2016-12-02','A','Buy now and we\'ll throw in Adam\'s apple. ','http://patologia.gabeents.com/data/Pathologic/celk1/celk130.jpg','Dr. Fatterpaker','New York-Presbyterian University Hospital of Columbia and Cornell','upper body'),(27,NULL,NULL,NULL,12,'Trachea',56133.86,60,'2016-11-25','O','Tttrrrrrrrr-aaaaaaaaaaaaaa-cccchhheeeeeeeeeaaaaaaaaaaa! Like the Ricola ads. Just buy it for crying out loud.','https://www.ucl.ac.uk/news/news-articles/1107/scaffold_crop.jpg','Dr. Acula','UCSF Medical Center San Francisco','upper body'),(28,NULL,NULL,NULL,10,'Uterus',43303.47,900,'2016-12-01','AB','Young, fresh, premium quality.','http://library.med.utah.edu/WebPath/jpeg4/FEM082.jpg','Dr. Frankenstein','Northwestern Memorial Hospital Chicago','lower middle body'),(29,NULL,NULL,NULL,NULL,'Vermiform appendix',13500.07,8,'2016-11-29','O','A solid \'B\'. As in most boring organ ever.','http://ee_ce_img.s3.amazonaws.com/cache/ce_img/media/remote/ce_img/https_ee_channel_images.s3.amazonaws.com/article-figures/13805/article-g02_400_259.jpg','Dr. Pepper','Hospitals of the University of Pennsylvania-Penn Presbyterian Philadelphia','lower middle body'),(30,NULL,NULL,NULL,NULL,'Adrenal gland',280.50,9800,'2016-11-25','O','THIS GUY DID FRONTFLIPS FROM STANDING!!!','http://homepage.smc.edu/wissmann_paul/intranetstuff/dept/scienceLRC/wissmann_site/images/adrenals_whole2.jpg','Dr. Acula','UPMC Presbyterian Shadyside Pittsburgh','body'),(31,NULL,NULL,NULL,14,'Appendix',1042.02,2670,'2016-12-02','O','This ain\'t the end of no book. ','http://hpbsurgery.net/Images/surgery/appendix/acute%20appendicitis.jpg','Dr. Acula','University of Michigan Hospitals and Health Centers Ann Arbor','body'),(32,NULL,NULL,NULL,13,'Bladder',1852.56,2300,'2016-11-29','O','So fresh. So organic. We bet you can\'t wait to hold it.','http://th01.deviantart.net/fs41/PRE/i/2009/011/3/f/Canine_Urinary_Bladder_by_addonemore.jpg','Dr. Blome','University of Colorado Hospital Aurora','gland'),(33,NULL,NULL,NULL,NULL,'Brain',13500.07,1569,'2016-11-26','O','He thought, therefore, he was.','http://www.itvscience.com/wp-content/uploads/2016/06/Brain.jpg','Dr. Blood','UCSF Medical Center San Francisco','gland'),(34,NULL,NULL,NULL,NULL,'Ear',16758.53,1400,'2016-11-29','O','Lend me your... chequebook, for this waxless beaut of a specimen.','http://www.pngall.com/wp-content/uploads/2016/04/Ear-PNG-Pic.png','Dr. Blood','UCSF Medical Center San Francisco','gland'),(35,NULL,NULL,NULL,NULL,'Esophagus',26576.71,985,'2016-11-29','O','The poor sap who owned this fine gullet went to war and took a bullet. ','http://www.gastrolab.net/y0027x.jpg','Dr. Bonar','UCLA Medical Center','gland'),(36,NULL,NULL,NULL,NULL,'Eye',27952.65,975,'2016-11-25','O','Eye\'m glad eye avoid eye puns.','https://i.ytimg.com/vi/UPyx0szdv0k/maxresdefault.jpg','Dr. Croke','UCLA Medical Center','lower middle body'),(37,NULL,NULL,NULL,3,'Gall bladder',29185.23,900,'2016-12-02','O','Has it been a while since you\'ve had some bile?','http://img.medscapestatic.com/pi/meds/ckb/50/36250tn.jpg','Dr. Croke','Stanford Health Care-Stanford Hospital Stanford Calif.','lower middle body'),(38,NULL,NULL,NULL,NULL,'Heart',32527.41,540,'2016-11-26','O','This thing will look CRAZY on you.','https://s-media-cache-ak0.pinimg.com/564x/ae/08/0a/ae080ae83b9d4c8dac70dbbff00e4941.jpg','Dr. Doom','NYU Langone Medical Center','lower middle body'),(39,NULL,NULL,NULL,NULL,'Kidney',33278.31,365,'2016-11-29','B','I know what you\'re thinking, but this came from an adult.','https://www.thesun.co.uk/wp-content/uploads/2016/04/2095975.main_image.jpg?strip=all','Dr. Dre','Northwestern Memorial Hospital Chicago','middle body'),(40,NULL,NULL,NULL,NULL,'Large intestine',39912.53,150,'2016-11-29','B','Like Trump, it\'s big and full of shit.','https://s-media-cache-ak0.pinimg.com/736x/d5/75/74/d575747e28a251bdf8af8a9c3e70fe6f.jpg','Dr. Dre','Northwestern Memorial Hospital Chicago','middle body'),(41,NULL,NULL,NULL,9,'Liver',40558.53,130,'2016-12-02','B','If this doesn\'t get purchased soon we\'re going to need to throw another pâté party.','http://supernaturalacnetreatment.com/wp-content/uploads/2016/02/does-toxic-liver-cause-acne.jpg','Dr. Fatterpaker','New York-Presbyterian University Hospital of Columbia and Cornell','middle body'),(42,NULL,NULL,NULL,NULL,'Lung',41520.44,84,'2016-11-26','B','Lifelong smoker. But only the good stuff.','http://hotphotosfree.com/sites/default/files/styles/large/public/field/image/b2faa4743fc119677f0e0d68f616346e.jpg?itok=Njk3qgkg','Dr. Fatterpaker','New York-Presbyterian University Hospital of Columbia and Cornell','middle body'),(43,NULL,NULL,NULL,9,'Mouth',42048.76,65,'2016-12-02','B','That\'s right, the whole thing.','http://www.pngall.com/wp-content/uploads/2016/03/Mouth-PNG-Clipart.png','Dr. Frankenstein','Mount Sinai Hospital New York','middle body'),(44,NULL,NULL,NULL,NULL,'Muscle',42524.26,60,'2016-11-27','B','A random assortment.','http://cdn.rsvlts.com/wp-content/uploads/2012/08/Arnold-Schwarzenegger-Young-Photos-28-930x1301.jpg','Dr. Frankenstein','Mayo Clinic Rochester Minn.','middle body'),(45,NULL,NULL,NULL,14,'Nose',43303.47,46,'2016-11-29','AB','It smelled REAL good. Not so much anymore.','http://www.sciencemag.org/sites/default/files/styles/article_main_large/public/images/cc_nose_16x9.jpg?itok=WXj7iPir','Dr. Killie','Mayo Clinic Rochester Minn.','middle body'),(46,NULL,NULL,NULL,NULL,'Parathyroid gland',54590.32,40,'2016-11-28','AB','Its name is kinda like being called \"guy beside Ramon\".','http://blog.parathyroid.com/wp-content/uploads/2013/08/adenoma-and-another-quarter-e1377708421605.jpg','Dr. Payne ','Massachusetts General Hospital Boston','middle body'),(47,NULL,NULL,NULL,NULL,'Pineal gland',56133.86,39,'2016-11-27','AB','It\'s worth buying just so you can laugh hysterically at all the stupid hagfish.','http://previews.123rf.com/images/allison14/allison141204/allison14120400045/13331869-A-Single-Pea-and-a-Fork-on-a-White-Plate-Stock-Photo.jpg','Dr. Payne ','Johns Hopkins Hospital Baltimore','unknown'),(48,NULL,NULL,NULL,NULL,'Pituitary gland',57106.07,30,'2016-11-26','AB','The size of a pea, but slightly more of a fee.','http://drarunlnaik.com/wp-content/uploads/2014/08/PituitaryGland.196230413_std.jpg','Dr. Pepper','Johns Hopkins Hospital Baltimore','upper body'),(49,NULL,NULL,NULL,NULL,'Skin',57564.23,29,'2016-11-29','AB','Get this wrinkly old skin bag for half off if you buy now.','https://thumbs.dreamstime.com/x/wrinkled-skin-18040649.jpg','Dr. Pepper','Houston Methodist Hospital','upper body'),(50,NULL,NULL,NULL,NULL,'Small intestine',57807.79,20,'2016-11-30','AB','Like Trump, it\'s full of shit, and has a small mind.','http://hotphotosfree.com/sites/default/files/styles/medium/public/field/image/19ac1b2e54528aba2bbbc6a5dd3ff991.jpg?itok=NfChGaY1','Dr. Poke','Hospitals of the University of Pennsylvania-Penn Presbyterian Philadelphia','upper body'),(51,NULL,NULL,NULL,8,'Spleen',65015.09,12,'2016-11-30','A','FAME ALERT! Straight from Charlie Sheen!  Warning: Sheen\'s spleen is likely infected with syphilis.','http://www.humpath.com/IMG/jpg_spleen_04_1.jpg','Dr. Poke','Hospitals of the University of Pennsylvania-Penn Presbyterian Philadelphia','upper body'),(52,NULL,NULL,NULL,3,'Stomach',65944.97,10,'2016-12-02','A','Barring serious crushing injuries, flat stomachs are a myth.','http://i.imgur.com/UHF8s0T.jpg','Dr. Ricketts','Duke University Hospital Durham N.C.','upper body'),(53,NULL,NULL,NULL,NULL,'Thymus',69717.28,9,'2016-11-28','A','Enormous prepubescent A-Grade thymus literally oozing with T-killer cells. ','http://www.ctsnet.org/sites/default/files/graphics/experts/Thoracic/myers_transcerv/4989-thymus.jpg','Dr. Ricketts','Cleveland Clinic','upper body'),(54,NULL,NULL,NULL,3,'Thyroid gland',74654.98,8,'2016-12-02','A','Buy now and we\'ll throw in Adam\'s apple. ','http://patologia.gabeents.com/data/Pathologic/celk1/celk130.jpg','Dr. Stump','Cleveland Clinic','upper body'),(55,NULL,NULL,NULL,NULL,'Trachea',77926.30,5,'2016-11-25','A','Tttrrrrrrrr-aaaaaaaaaaaaaa-cccchhheeeeeeeeeaaaaaaaaaaa! Like the Ricola ads. Just buy it for crying out loud.','https://www.ucl.ac.uk/news/news-articles/1107/scaffold_crop.jpg','Dr. Stump','Cedars-Sinai Medical Center Los Angeles','upper body'),(56,NULL,NULL,NULL,7,'Uterus',82383.04,4,'2016-12-01','A','Young, fresh, premium quality.','http://library.med.utah.edu/WebPath/jpeg4/FEM082.jpg','Dr. Young-Hyman','Brigham and Women\'s Hospital Boston','upper middle body'),(57,NULL,NULL,NULL,NULL,'Vermiform appendix',83736.47,4,'2016-11-29','A','A solid \'B\'. As in most boring organ ever.','http://ee_ce_img.s3.amazonaws.com/cache/ce_img/media/remote/ce_img/https_ee_channel_images.s3.amazonaws.com/article-figures/13805/article-g02_400_259.jpg','Dr. Young-Hyman','Barnes-Jewish Hospital/Washington University St. Louis','upper middle body');
/*!40000 ALTER TABLE `Organ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPal`
--

DROP TABLE IF EXISTS `PayPal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayPal` (
  `AccountNum` bigint(20) NOT NULL,
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`AccountNum`),
  UNIQUE KEY `AccountNum` (`AccountNum`),
  KEY `UID` (`UID`),
  CONSTRAINT `PayPal_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPal`
--

LOCK TABLES `PayPal` WRITE;
/*!40000 ALTER TABLE `PayPal` DISABLE KEYS */;
INSERT INTO `PayPal` VALUES (4820,1),(48250,1),(4825220,1),(12345,2),(12312324,2),(1111,4),(4321,4),(3423443,4),(4320,7),(123456,10),(40256998,15);
/*!40000 ALTER TABLE `PayPal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentType`
--

DROP TABLE IF EXISTS `PaymentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentType` (
  `Type` enum('Visa','BankTransfer','PayPal') NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentType`
--

LOCK TABLES `PaymentType` WRITE;
/*!40000 ALTER TABLE `PaymentType` DISABLE KEYS */;
INSERT INTO `PaymentType` VALUES ('Visa'),('BankTransfer'),('PayPal');
/*!40000 ALTER TABLE `PaymentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `AccType` enum('Customer','Doctor','Admin') NOT NULL,
  `fName` varchar(50) NOT NULL,
  `mName` varchar(50) DEFAULT NULL,
  `lName` varchar(50) NOT NULL,
  `UphoneH` varchar(15) NOT NULL,
  `UphoneC` varchar(15) DEFAULT NULL,
  `UphoneW` varchar(15) DEFAULT NULL,
  `Uemail` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Customer','Harambe ','  ','Gorilla ',' 12508786650',' ',NULL,' harambe@heaven.com',' fuckthatkid'),(2,'Customer','Emerson','TEST','Kirby','2508786650','2508786650','2508786650','me@emersonkirby.com','test2'),(3,'Customer','Olivia','Hunter','Kirby','2508786650','2508786650','2508786650','olivia@emersonkirby.com','test3'),(4,'Admin','Harambe','','Gorilla','12508786650','','','harambe@heaven.com','fuckthatkid'),(5,'Customer','Donald','J','Trump','8663962673','','','dtrump@trump.com','trump'),(6,'Customer','Donald','J','Trump','8663962673','','','dtrump@trump.com','trump'),(7,'Customer','Pete','','Windsor','7 343 512 3456','','','maniladude@manila.com','vanilla'),(8,'Customer','Test','test','test','12508786650','','','dtrump@trump.com','swag'),(9,'Customer','Russell','Gregory','Kirby','1 234 567 8901 ','','','russ@wwe.com','wrestling'),(10,'Customer','Julius','','Wu','2504691966','2504691966','2504691966','aapple1994@gmail.com','123456'),(11,'Customer','Nino','','Gonzales','6041111111','','','nino.gonzales.music@gmail.com','letmen'),(12,'Customer','1','2','3','2504691966','2504691966','2504691966','julius@gmail.com','123456'),(13,'Customer','Anne','Marie','Kirby','8663962673','8663962673','8663962673','amk@corehealthtech.com','suggest'),(14,'Customer','Nino','J.','Gonzales','6041011001','','','nino.gonzales.music@gmail.com','letmein1234'),(15,'Customer','fName','mName','lName','1-800-99-JENNY','1-800-99-JENNY','1-800-99-JENNY','email','password'),(16,'Doctor','Kendall','','Jenner','8663962673','','','kj@emersonkirby.com','emerson'),(17,'Customer','Nino','J.','Gonzales','6041011001','','','wanjak.gonzales@gmail.com','password'),(18,'Customer','Jacob','M.','Gonzales','6041012222','','','jacob@gonzales.com','password'),(19,'Customer','Vanessa','L.','Goulding','6041111111','','','vanessa@goulding.com','password'),(20,'Customer','Spongebob','S.','Squarepants','0987654321','','','spongebob@squarepants.com','password'),(21,'Customer','Eman',' Stanley ',' Kirby ',' 250 878 6650',' null',' null',' emerson.kirby@gmail.com',' testPW'),(22,'Customer','James','','Rogers','7789856299','7789856299','7789856299','cjbrogers@gmail.com','test');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visa`
--

DROP TABLE IF EXISTS `Visa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visa` (
  `CardNum` char(16) NOT NULL,
  `Expiry` date NOT NULL,
  `CVV` int(3) NOT NULL,
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`CardNum`),
  KEY `UID` (`UID`),
  CONSTRAINT `Visa_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visa`
--

LOCK TABLES `Visa` WRITE;
/*!40000 ALTER TABLE `Visa` DISABLE KEYS */;
INSERT INTO `Visa` VALUES ('0987654321098765','2012-04-04',56,2),('1.11122223333e15','2012-01-01',456,2),('1.23454321235e15','2012-02-03',456,2),('12323','2012-09-09',773,4),('1234432112344321','2099-08-01',567,4),('1234567123456','2012-01-01',123,1),('1234567890123456','2012-01-01',123,1),('1446555633355553','2016-11-04',529,13),('17234567123456','2012-01-01',123,1),('4820938842741128','2012-01-01',123,1),('87737473773','2020-02-02',322,16),('887276452345','2012-01-09',455,4);
/*!40000 ALTER TABLE `Visa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse`
--

DROP TABLE IF EXISTS `Warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Warehouse` (
  `WID` int(11) NOT NULL AUTO_INCREMENT,
  `WName` varchar(50) NOT NULL,
  `WPhone` varchar(10) NOT NULL,
  PRIMARY KEY (`WID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse`
--

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;
INSERT INTO `Warehouse` VALUES (1,'Warehouse One','2501938466');
/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 10:35:30

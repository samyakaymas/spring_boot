-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: mobile_database
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `SPRING_SESSION`
--

DROP TABLE IF EXISTS `SPRING_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPRING_SESSION` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION`
--

LOCK TABLES `SPRING_SESSION` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION` VALUES ('0e384dad-1343-4d64-9500-791fa07ba7ec','9eed70b5-eff8-4477-a090-23817b9f9288',1571045990975,1571045991088,900,1571046891088,NULL);
/*!40000 ALTER TABLE `SPRING_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRING_SESSION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `SPRING_SESSION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `SPRING_SESSION` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION_ATTRIBUTES`
--

LOCK TABLES `SPRING_SESSION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION_ATTRIBUTES` VALUES ('0e384dad-1343-4d64-9500-791fa07ba7ec','SPRING_SECURITY_SAVED_REQUEST',_binary '¬\í\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest@HDù6d”\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0t\0\0sr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie@+‚ŸÀ´f\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xpÿÿÿÿ\0\0\0\0\0ppt\0\nJSESSIONIDpt\0 1E7D002173D0486F6AAC1F57D2272FDExsr\0java.util.TreeMapÁ\ö>-%j\æ\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\å\Î\0\0xpw\0\0\0\rt\0acceptsq\0~\0\0\0\0w\0\0\0t\0vtext/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, brxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0\Zen-GB,en-US;q=0.9,en;q=0.8xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\0+JSESSIONID=1E7D002173D0486F6AAC1F57D2272FDExt\0dntsq\0~\0\0\0\0w\0\0\0t\01xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0referersq\0~\0\0\0\0w\0\0\0t\0%http://localhost:8080/admin/birthdaysxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0hMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~ø`œ0ù\ì\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpÿÿÿÿt\0GBq\0~\0t\0enq\0~\0q\0~\0xsq\0~\09ÿÿÿÿt\0USq\0~\0q\0~\0<q\0~\0q\0~\0xsq\0~\09ÿÿÿÿq\0~\0q\0~\0q\0~\0<q\0~\0q\0~\0xxt\0GETsq\0~\0pw\0\0\0t\0logoutur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0q\0~\0xpt\0logoutt\0/t\0http://localhost:8080/t\0httpt\0	localhostt\0/');
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `model` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES ('A868','Ear Pods','Earphone',8976,'APPLE'),('saff','asff','Charger',12,'a'),('u908','by8','Battre',98,'a');
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspecs`
--

DROP TABLE IF EXISTS `aspecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspecs` (
  `specs` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  PRIMARY KEY (`specs`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspecs`
--

LOCK TABLES `aspecs` WRITE;
/*!40000 ALTER TABLE `aspecs` DISABLE KEYS */;
INSERT INTO `aspecs` VALUES ('','u908'),('dff','saff'),('soac','u908');
/*!40000 ALTER TABLE `aspecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `astock`
--

DROP TABLE IF EXISTS `astock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `astock` (
  `cost_price` int(11) DEFAULT NULL,
  `sell_price` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astock`
--

LOCK TABLES `astock` WRITE;
/*!40000 ALTER TABLE `astock` DISABLE KEYS */;
/*!40000 ALTER TABLE `astock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `name` varchar(50) NOT NULL,
  `brank` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES ('a',0),('APPLE',3),('MI',2),('ONEPLUS',4),('SAMSUNG',1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `color` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  PRIMARY KEY (`color`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES ('Almond','GM1911'),('Aura Black','SM975F'),('Aura White','SM975F'),('Auro Glow','SM975F'),('Black','A2105'),('Black','A2221'),('Black','MZB4782IN'),('Black','MZB6878IN'),('Blue','A2105'),('Blue','MZB6709IN'),('Blue','MZB6878IN'),('Blue','SMM305'),('Carbon Black','MZB7748IN'),('Carbon Black','MZB8193IN'),('Ceramic Black','SMG975'),('Ceramic White','SMG975'),('Charcoal Black','SMM205'),('Cocktail Orange','SMM405'),('Coral White','A2105'),('Flame Red','MZB7748IN'),('Flame Red','MZB8193IN'),('Frosted Silver','HD1901'),('Glacier Blue','HD1901'),('Glacier Blue','MZB7748IN'),('Glacier Blue','MZB8193IN'),('Gold','A1863'),('Gold','A1864'),('Gold','A2097'),('Gold','A2101'),('Gold','A2218'),('Gold','MZB4782IN'),('Green','A2221'),('Grey','MZB6709IN'),('Lavender Purple','SMN960'),('Metallic Copper','SMN960'),('Midnight Black','SMN960'),('Midnight Blue','SMM405'),('Midnight Green','A2218'),('Mirror Blue','GM1901'),('Mirror Grey','GM1901'),('Mirror Grey','GM1911'),('Moonlight White','MZB7463IN'),('Nebula Blue','GM1911'),('Nebula Red','MZB7463IN'),('Neptune Blue','MZB7463IN'),('Ocean Blue','SMM205'),('Ocean Blue','SMN960'),('Opal Black','SMM307'),('Pearl White','SMM307'),('Prism Black','SMG970'),('Prism Black','SMG973'),('Prism Black','SMG975'),('Prism Blue','SMG973'),('Prism Blue','SMG975'),('Prism Green','SMG973'),('Prism Green','SMG975'),('Prism White','SMG970'),('Prism White','SMG973'),('Prism White','SMG975'),('Purple','A2221'),('Red','A2221'),('Red','GM1901'),('Rose Gold','MZB6878IN'),('Sapphire Blue','SMM307'),('Seawater Blue','SMM405'),('Silver','A1863'),('Silver','A1864'),('Silver','A2097'),('Silver','A2101'),('Silver','A2218'),('Space Black','MZB7463IN'),('Space Gray','A1863'),('Space Gray','A1864'),('Space Gray','A2097'),('Space Gray','A2101'),('Space Gray','A2218'),('White','A2221'),('White','MZB4782IN'),('Yellow','A2105'),('Yellow','A2221');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Samyak Soni','Rajsamand','1999-10-20',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_number`
--

DROP TABLE IF EXISTS `customer_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_number` (
  `number` bigint(20) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`number`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_number`
--

LOCK TABLES `customer_number` WRITE;
/*!40000 ALTER TABLE `customer_number` DISABLE KEYS */;
INSERT INTO `customer_number` VALUES (7790943285,1),(9694476548,1);
/*!40000 ALTER TABLE `customer_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobiles`
--

DROP TABLE IF EXISTS `mobiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobiles` (
  `model` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `b_name` varchar(50) DEFAULT NULL,
  `display` varchar(50) DEFAULT NULL,
  `screen` float DEFAULT NULL,
  `resolution` varchar(50) DEFAULT NULL,
  `fcamera` int(11) DEFAULT NULL,
  `rcamera` int(11) DEFAULT NULL,
  `bluetooth` float DEFAULT NULL,
  `wifi` float DEFAULT NULL,
  `network` varchar(50) DEFAULT NULL,
  `exmemory` int(11) DEFAULT NULL,
  `fcharge` varchar(50) DEFAULT NULL,
  `usb` float DEFAULT NULL,
  `battery` int(11) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `gpu` varchar(50) DEFAULT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `dualsim` varchar(50) DEFAULT NULL,
  `smemory` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`model`),
  KEY `b_name` (`b_name`),
  CONSTRAINT `mobiles_ibfk_1` FOREIGN KEY (`b_name`) REFERENCES `brand` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobiles`
--

LOCK TABLES `mobiles` WRITE;
/*!40000 ALTER TABLE `mobiles` DISABLE KEYS */;
INSERT INTO `mobiles` VALUES ('A1863','iPhone 8','APPLE','LCD',4.7,'750x1334',7,12,5,802.11,'GSM',0,'YES',2,3934,2,'APPLE GPU','HEXACORE','IOS','YES',64,35999),('A1864','iPhone 8 PLUS','APPLE','LCD',5.5,'1080x1920',7,12,5,802.11,'GSM',0,'YES',2,2691,3,'APPLE GPU','HEXACORE','IOS','YES',64,44999),('A2097','iPhone XS','APPLE','OLED',5.8,'1125x2436',7,12,5,802.11,'GSM',0,'YES',2,2658,4,'APPLE GPU','HEXACORE','IOS','YES',64,84999),('A2101','iPhone XS MAX','APPLE','OLED',6.5,'1242x2688',7,12,5,802.11,'GSM',0,'YES',2,3174,4,'APPLE GPU','HEXACORE','IOS','YES',64,74999),('A2105','iPhone XR','APPLE','LCD',6.1,'828x1792',7,12,5,802.11,'GSM',0,'YES',2,2942,3,'APPLE GPU','HEXACORE','IOS','YES',64,44999),('A2218','iPhone 11 PRO MAX','APPLE','OLED',6.5,'1242x2688',12,12,5,802.11,'GSM',0,'YES',2,3696,4,'APPLE GPU','HEXACORE','IOS','YES',64,109900),('A2221','iPhone 11','APPLE','OLED',6.1,'828x1792',12,12,5,802.11,'GSM',0,'YES',2,3110,4,'APPLE GPU','HEXACORE','IOS','YES',64,64900),('GM1901','7','ONEPLUS','AMOLED',6.41,'1080x2340',16,48,5,802.11,'GSM',0,'YES',3.1,3700,6,'ADRENO-640','OCTACORE','ANDROID','YES',128,29999),('GM1911','7 PRO','ONEPLUS','AMOLED',6.67,'1440x3120',16,48,5,802.11,'GSM',0,'YES',3.1,4000,8,'ADRENO-640','OCTACORE','ANDROID','YES',256,48999),('HD1901','7T','ONEPLUS','AMOLED',6.55,'1080x2400',16,48,5,802.11,'GSM',0,'YES',3.1,3800,8,'ADRENO-640','OCTACORE','ANDROID','YES',128,37999),('MZB4782IN','5','MI','AMOLED',5.15,'1080x1920',4,16,4.2,802.11,'GSM',0,'YES',1,3000,3,'ADRENO-530','QUADCORE','ANDROID','YES',32,2399),('MZB6709IN','POCO F1','MI','AMOLED',6.18,'1080x2246',20,12,5,802.11,'GSM',256,'YES',2,4000,6,'ADRENO-630','OCTACORE','ANDROID','YES',64,15999),('MZB6878IN','NOTE 6 PRO','MI','AMOLED',6.26,'1080x2280',20,12,5,802.11,'GSM',256,'YES',2,4000,6,'ADRENO-509','OCTACORE','ANDROID','YES',64,11999),('MZB7463IN','NOTE 7 PRO','MI','AMOLED',6.3,'1080x2340',13,48,5,802.11,'GSM',0,'YES',2,4000,4,'ADRENO-612','OCTACORE','ANDROID','YES',64,13449),('MZB7748IN','K20 PRO','MI','AMOLED',6.39,'1080x2340',20,48,5,802.11,'GSM',0,'YES',2,4000,8,'ADRENO-640','OCTACORE','ANDROID','YES',128,24999),('MZB8193IN','K20 ','MI','AMOLED',6.39,'1080x2340',20,48,5,802.11,'GSM',0,'YES',2,4000,6,'ADRENO-618','OCTACORE','ANDROID','YES',64,19999),('SM975F','GALAXY NOTE 10+','SAMSUNG','AMOLED',6.8,'1440x3040',10,12,5,802.11,'GSM',1024,'YES',3.1,4300,12,'MALI-G76','OCTACORE','ANDROID','YES',256,74000),('SMG970','GALAXY S10 E','SAMSUNG','AMOLED',5.8,'1080x2280',10,12,5,802.11,'GSM',1024,'YES',3.1,3100,8,'MALI-G76','OCTACORE','ANDROID','YES',256,48990),('SMG973','GALAXY S10','SAMSUNG','AMOLED',6.1,'1440x3040',10,16,5,802.11,'GSM',1024,'YES',3.1,3400,8,'MALI-G76','OCTACORE','ANDROID','YES',512,61638),('SMG975','GALAXY S10+','SAMSUNG','AMOLED',6.4,'1440x3040',10,16,5,802.11,'GSM',1024,'YES',3.1,4100,8,'MALI-G76','OCTACORE','ANDROID','YES',128,69900),('SMM205','GALAXY M20','SAMSUNG','AMOLED',6.3,'1080x2340',8,13,5,802.11,'GSM',1024,'YES',2,5000,4,'MALI-G71','OCTACORE','ANDROID','YES',64,9999),('SMM305','GALAXY M30','SAMSUNG','AMOLED',6.4,'1080x2340',16,13,5,802.11,'GSM',1024,'YES',2,5000,6,'MALI-G71','OCTACORE','ANDROID','YES',128,11999),('SMM307','GALAXY M30S','SAMSUNG','AMOLED',6.4,'1080x2400',16,48,5,802.11,'GSM',1024,'YES',2,6000,6,'MALI-G72','OCTACORE','ANDROID','YES',128,13999),('SMM405','GALAXY M40','SAMSUNG','AMOLED',6.3,'1080x2340',16,32,5,802.11,'GSM',1024,'YES',2,3500,6,'ADRENO-612','OCTACORE','ANDROID','YES',128,18999),('SMN960','GALAXY NOTE 9','SAMSUNG','AMOLED',6.4,'1440x2960',8,12,5,802.11,'GSM',1024,'YES',3.1,4000,6,'MALI-G72','OCTACORE','ANDROID','YES',128,42999);
/*!40000 ALTER TABLE `mobiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstock`
--

DROP TABLE IF EXISTS `mstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mstock` (
  `CostPrice` int(11) DEFAULT NULL,
  `SellingPrice` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstock`
--

LOCK TABLES `mstock` WRITE;
/*!40000 ALTER TABLE `mstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `mstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otherexpenses`
--

DROP TABLE IF EXISTS `otherexpenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otherexpenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otherexpenses`
--

LOCK TABLES `otherexpenses` WRITE;
/*!40000 ALTER TABLE `otherexpenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `otherexpenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdescription`
--

DROP TABLE IF EXISTS `pdescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdescription` (
  `id` bigint(20) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdescription`
--

LOCK TABLES `pdescription` WRITE;
/*!40000 ALTER TABLE `pdescription` DISABLE KEYS */;
INSERT INTO `pdescription` VALUES (678987,'MZB4782IN',2999,1),(9543859,'MZB6709IN',12655,2);
/*!40000 ALTER TABLE `pdescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `moa` varchar(50) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2019-10-14','mobile',11),(2,'2019-10-14','mobile',11);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference` (
  `reference_to` int(11) NOT NULL,
  `reference_by` int(11) NOT NULL,
  PRIMARY KEY (`reference_to`,`reference_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference`
--

LOCK TABLES `reference` WRITE;
/*!40000 ALTER TABLE `reference` DISABLE KEYS */;
INSERT INTO `reference` VALUES (1,0),(3,4);
/*!40000 ALTER TABLE `reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ADMIN'),('SALESMAN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moa` varchar(50) DEFAULT NULL,
  `sell_price` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'mobile',12000,'2019-10-12',1,13),(2,'mobile',13000,'2019-10-14',1,13);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesman` (
  `name` varchar(50) DEFAULT NULL,
  `start_salary` int(11) DEFAULT NULL,
  `sale_value` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `leaving_date` date DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `sale_units` int(11) DEFAULT '0',
  `current_salary` int(11) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO `salesman` VALUES ('Raghu',12000,0,'Mumbai','2019-10-14','2019-10-14','1990-05-04',0,12000,12),('Shyam',10000,25000,'Udaipur','2019-10-14',NULL,'1999-09-23',3,10000,13);
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman_number`
--

DROP TABLE IF EXISTS `salesman_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesman_number` (
  `number` bigint(20) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`number`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman_number`
--

LOCK TABLES `salesman_number` WRITE;
/*!40000 ALTER TABLE `salesman_number` DISABLE KEYS */;
INSERT INTO `salesman_number` VALUES (8547945247,13),(9625478592,12);
/*!40000 ALTER TABLE `salesman_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sdescription`
--

DROP TABLE IF EXISTS `sdescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sdescription` (
  `id` bigint(20) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `sell_price` int(11) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdescription`
--

LOCK TABLES `sdescription` WRITE;
/*!40000 ALTER TABLE `sdescription` DISABLE KEYS */;
INSERT INTO `sdescription` VALUES (678987,'MZB4782IN',13000,2),(9543859,'MZB6709IN',12000,1);
/*!40000 ALTER TABLE `sdescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('SAMSUNG INDIA PVT LMT','DELHI',11),('APPLE INDIA PVT LMT','DELHI',12),('MI INDIA PVT LIMT','Jodhpur',13);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_number`
--

DROP TABLE IF EXISTS `supplier_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_number` (
  `number` bigint(20) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`number`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_number`
--

LOCK TABLES `supplier_number` WRITE;
/*!40000 ALTER TABLE `supplier_number` DISABLE KEYS */;
INSERT INTO `supplier_number` VALUES (8351992836,12),(8754210720,13);
/*!40000 ALTER TABLE `supplier_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `username` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('admin','ADMIN'),('kaymas','SALESMAN'),('champak','SALESMAN'),('xxx','SALESMAN'),('d','SALESMAN'),('d','SALESMAN'),('raghu','SALESMAN'),('shyam','SALESMAN');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','$2a$10$voZ/vAMr.7zgBsZYTE/EbO2OgQ3HQVmUwU4ohlcqBI75wF1kig3zy',6),('shyam','$2a$10$CwVFZchswTNKO7mRt4ZH1O34ydvo6NuXvpBbCu38DCUo7mQjE5kFW',13);
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

-- Dump completed on 2019-10-14 15:11:48

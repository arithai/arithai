-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for CYGWIN (x86_64)
--
-- Host: 127.0.0.1    Database: mysql
-- ------------------------------------------------------
-- Server version	5.5.41

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
-- Table structure for table `speciesmain`
--

DROP TABLE IF EXISTS `speciesmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speciesmain` (
  `cname` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arithaiid` int(11) DEFAULT NULL,
  `youtubetext` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtubeid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciesmain`
--

LOCK TABLES `speciesmain` WRITE;
/*!40000 ALTER TABLE `speciesmain` DISABLE KEYS */;
INSERT INTO `speciesmain` VALUES ('臺灣赤楠',322,'葉側脈於表裡兩面皆明顯可見\n界：植物界 Plantae\n演化支：維管束植物 Tracheophyta\n演化支：被子植物 Angiosperms\n演化支：真雙子葉植物 Eudicots\n演化支：薔薇類植物 Rosids\n目：桃金孃目 Myrtales\n科：桃金孃科 Myrtaceae\n屬：赤楠屬 Syzygium\n種：臺灣赤楠 S. formosanum\n二名法\nSyzygium formosanum','YHx7RzAlbEw','VID20250614123229'),('咖啡',17,'咖啡葉薄革質，光滑深綠色，卵狀披針形，長6—14釐米，寬3.5—5釐米\n界：植物界 Plantae\n演化支：維管束植物 Tracheophyta\n演化支：被子植物 Angiosperms\n演化支：真雙子葉植物 Eudicots\n演化支：菊類植物 Asterids\n目：龍膽目 Gentianales\n科：茜草科 Rubiaceae\n亞科：仙丹花亞科 Ixoroideae\n族：咖啡族 Coffeeae\n屬：咖啡屬 Coffea\n咖啡','BMdmGhR6ooI','VID20250324112600');
/*!40000 ALTER TABLE `speciesmain` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-30  8:27:26

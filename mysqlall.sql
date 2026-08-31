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
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('localhost','phpmyadmin','phpmyadmin','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (1,'Geographic',0,''),(2,'Polygon properties',35,''),(3,'Numeric Functions',39,''),(4,'WKT',35,''),(5,'Plugins',36,''),(6,'Control flow functions',39,''),(7,'MBR',35,''),(8,'Transactions',36,''),(9,'Help Metadata',36,''),(10,'Account Management',36,''),(11,'Point properties',35,''),(12,'Encryption Functions',39,''),(13,'LineString properties',35,''),(14,'Miscellaneous Functions',39,''),(15,'Logical operators',39,''),(16,'Functions and Modifiers for Use with GROUP BY',36,''),(17,'Information Functions',39,''),(18,'Storage Engines',36,''),(19,'Bit Functions',39,''),(20,'Comparison operators',39,''),(21,'Table Maintenance',36,''),(22,'User-Defined Functions',36,''),(23,'Data Types',36,''),(24,'Compound Statements',36,''),(25,'Geometry constructors',35,''),(26,'GeometryCollection properties',1,''),(27,'Administration',36,''),(28,'Data Manipulation',36,''),(29,'Utility',36,''),(30,'Language Structure',36,''),(31,'Geometry relations',35,''),(32,'Date and Time Functions',39,''),(33,'WKB',35,''),(34,'Procedures',36,''),(35,'Geographic Features',36,''),(36,'Contents',0,''),(37,'Geometry properties',35,''),(38,'String Functions',39,''),(39,'Functions',36,''),(40,'Data Definition',36,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (0,'JOIN'),(1,'HOST'),(2,'SERIALIZABLE'),(3,'CONTAINS'),(4,'SRID'),(5,'AT'),(6,'SCHEDULE'),(7,'RETURNS'),(8,'MASTER_SSL_CA'),(9,'NCHAR'),(10,'ONLY'),(11,'WORK'),(12,'OPEN'),(13,'ESCAPE'),(14,'EVENTS'),(15,'MONTH'),(16,'PROFILES'),(17,'ISCLOSED'),(18,'DUPLICATE'),(19,'REPLICATION'),(20,'UNLOCK'),(21,'INNODB'),(22,'YEAR_MONTH'),(23,'WITHIN'),(24,'PREPARE'),(25,'LOCK'),(26,'NDB'),(27,'INT4'),(28,'POLYGON'),(29,'MINUTE'),(30,'SEPARATOR'),(31,'DELETE'),(32,'ON'),(33,'CONNECTION'),(34,'CLOSE'),(35,'USE'),(36,'PRIVILEGES'),(37,'SPATIAL'),(38,'SQL_BUFFER_RESULT'),(39,'ERROR'),(40,'SECURITY'),(41,'AUTOEXTEND_SIZE'),(42,'NDBCLUSTER'),(43,'LEVEL'),(44,'BINARY'),(45,'CURRENT_USER'),(46,'HOUR_MINUTE'),(47,'UPDATE'),(48,'PRESERVE'),(49,'INTO'),(50,'POLYFROMWKB'),(51,'VARIABLE'),(52,'ROLLBACK'),(53,'TIMESTAMP'),(54,'IMPORT'),(55,'CHECKSUM'),(56,'THEN'),(57,'ENGINES'),(58,'HANDLER'),(59,'DAY_SECOND'),(60,'HELP_DATE'),(61,'BOOLEAN'),(62,'MOD'),(63,'CLASS_ORIGIN'),(64,'MPOLYFROMWKB'),(65,'ITERATE'),(66,'DO'),(67,'DATE'),(68,'FULLTEXT'),(69,'COMMENT'),(70,'MASTER_CONNECT_RETRY'),(71,'MASTER_LOG_FILE'),(72,'PRECISION'),(73,'REQUIRE'),(74,'LONG'),(75,'OPTION'),(76,'REORGANIZE'),(77,'ELSE'),(78,'EXTERIORRING'),(79,'GEOMFROMWKB'),(80,'FROM'),(81,'MULTIPOLYGON'),(82,'LEFT'),(83,'ELSEIF'),(84,'COMPACT'),(85,'DEC'),(86,'FOR'),(87,'WARNINGS'),(88,'STRING'),(89,'CONDITION'),(90,'ENCLOSED'),(91,'AGGREGATE'),(92,'FIELDS'),(93,'KILL'),(94,'DISJOINT'),(95,'TABLESPACE'),(96,'OVERLAPS'),(97,'INFILE'),(98,'MBREQUAL'),(99,'HELP_VERSION'),(100,'ORDER'),(101,'USING'),(102,'MIDDLEINT'),(103,'GRANT'),(104,'MBRINTERSECTS'),(105,'GEOMETRYN'),(106,'GEOMETRYFROMTEXT'),(107,'FOREIGN'),(108,'CACHE'),(109,'MYSQL_ERRNO'),(110,'SCHEMAS'),(111,'LEADING'),(112,'CONSTRAINT_NAME'),(113,'CONVERT'),(114,'DYNAMIC'),(115,'POLYGONFROMTEXT'),(116,'ENVELOPE'),(117,'HAVING'),(118,'STARTING'),(119,'RELOAD'),(120,'ISSIMPLE'),(121,'AUTOCOMMIT'),(122,'REVOKE'),(123,'EXPLAIN'),(124,'CSV'),(125,'OUTFILE'),(126,'LOW_PRIORITY'),(127,'FILE'),(128,'NODEGROUP'),(129,'SCHEMA'),(130,'MLINEFROMWKB'),(131,'DUAL'),(132,'MULTIPOINTFROMWKB'),(133,'MULTIPOINTFROMTEXT'),(134,'EXTENDED'),(135,'CROSS'),(136,'CONTRIBUTORS'),(137,'NATIONAL'),(138,'GROUP'),(139,'SHA'),(140,'POINTN'),(141,'IGNORE_SERVER_IDS'),(142,'ASBINARY'),(143,'MBROVERLAPS'),(144,'GENERAL'),(145,'OWNER'),(146,'TRUE'),(147,'CHARACTER'),(148,'SCHEMA_NAME'),(149,'TABLE'),(150,'CASCADE'),(151,'RELAY_LOG_POS'),(152,'ASWKB'),(153,'LEAVE'),(154,'MODIFY'),(155,'MATCH'),(156,'MASTER_LOG_POS'),(157,'DISTINCTROW'),(158,'X'),(159,'CURSOR'),(160,'CROSSES'),(161,'GEOMETRYCOLLECTIONFROMTEXT'),(162,'CHAIN'),(163,'FLUSH'),(164,'CREATE'),(165,'DESCRIBE'),(166,'PROCESSLIST'),(167,'DISCARD'),(168,'SOUNDS'),(169,'PACK_KEYS'),(170,'MULTILINESTRINGFROMTEXT'),(171,'INTERSECTS'),(172,'FAST'),(173,'LOOP'),(174,'VARCHARACTER'),(175,'BEFORE'),(176,'ALL'),(177,'REDUNDANT'),(178,'USER_RESOURCES'),(179,'PARTIAL'),(180,'END'),(181,'SECOND'),(182,'FLOAT8'),(183,'PREV'),(184,'MBRCONTAINS'),(185,'OR'),(186,'IDENTIFIED'),(187,'POINTFROMTEXT'),(188,'MASTER_SSL_CIPHER'),(189,'SQL_SLAVE_SKIP_COUNTER'),(190,'BOTH'),(191,'YEAR'),(192,'UNIQUE'),(193,'TRIGGERS'),(194,'RESIGNAL'),(195,'MASTER_SSL'),(196,'DATE_ADD'),(197,'LIKE'),(198,'PLUGIN'),(199,'MULTIPOINT'),(200,'FETCH'),(201,'MBRWITHIN'),(202,'COLUMN'),(203,'USAGE'),(204,'MEMORY'),(205,'QUERY'),(206,'Y'),(207,'LINES'),(208,'SQL_THREAD'),(209,'INTERIORRINGN'),(210,'NUMINTERIORRINGS'),(211,'MAX_QUERIES_PER_HOUR'),(212,'TRANSACTION'),(213,'STDDEV'),(214,'NAMES'),(215,'INT1'),(216,'RIGHT'),(217,'MAX_ROWS'),(218,'ALTER'),(219,'NATURAL'),(220,'MULTILINESTRING'),(221,'VARIABLES'),(222,'ESCAPED'),(223,'KEY_BLOCK_SIZE'),(224,'MPOINTFROMTEXT'),(225,'CHAR'),(226,'UPGRADE'),(227,'INTERVAL'),(228,'NAME'),(229,'REFERENCES'),(230,'STORAGE'),(231,'ISOLATION'),(232,'EVERY'),(233,'INT8'),(234,'AUTHORS'),(235,'RESTRICT'),(236,'UNCOMMITTED'),(237,'LINESTRINGFROMTEXT'),(238,'IS'),(239,'NOT'),(240,'DATAFILE'),(241,'ANALYSE'),(242,'DES_KEY_FILE'),(243,'COMPRESSED'),(244,'START'),(245,'IF'),(246,'ROWS'),(247,'PURGE'),(248,'USER'),(249,'EXIT'),(250,'MERGE'),(251,'SQL_NO_CACHE'),(252,'DELAYED'),(253,'PROXY'),(254,'RELAY'),(255,'WRITE'),(256,'DATABASE'),(257,'NULL'),(258,'POWER'),(259,'POINTFROMWKB'),(260,'USE_FRM'),(261,'TERMINATED'),(262,'NVARCHAR'),(263,'RETURN'),(264,'DIRECTORY'),(265,'AES_DECRYPT'),(266,'GLENGTH'),(267,'SHUTDOWN'),(268,'CATALOG_NAME'),(269,'FIXED'),(270,'MULTIPOLYGONFROMTEXT'),(271,'REPLACE'),(272,'REPEAT'),(273,'STARTS'),(274,'COMPLETION'),(275,'COLUMNS'),(276,'DATETIME'),(277,'MODE'),(278,'INTEGER'),(279,'VALUE'),(280,'ASWKT'),(281,'GEOMETRYCOLLECTIONFROMWKB'),(282,'DROP'),(283,'SQL_BIG_RESULT'),(284,'MASTER_SSL_VERIFY_SERVER_CERT'),(285,'SUBJECT'),(286,'CHECK'),(287,'FULL'),(288,'BY'),(289,'NO'),(290,'DAY'),(291,'DATA'),(292,'PARTITION'),(293,'REAL'),(294,'SHARE'),(295,'LINESTRING'),(296,'MASTER_HEARTBEAT_PERIOD'),(297,'MESSAGE_TEXT'),(298,'COLUMN_NAME'),(299,'LINEFROMTEXT'),(300,'X509'),(301,'WHERE'),(302,'SUBCLASS_ORIGIN'),(303,'EVENT'),(304,'IGNORE'),(305,'SUPER'),(306,'SHA2'),(307,'QUICK'),(308,'SIGNED'),(309,'OFFLINE'),(310,'FALSE'),(311,'POLYGONFROMWKB'),(312,'FORCE'),(313,'CHANGE'),(314,'TO'),(315,'POINT'),(316,'TABLE_NAME'),(317,'SLOW'),(318,'VARYING'),(319,'FEDERATED'),(320,'MAX_SIZE'),(321,'HOUR_SECOND'),(322,'GEOMETRYCOLLECTION'),(323,'PROCEDURE'),(324,'AGAINST'),(325,'ENDPOINT'),(326,'LONGBINARY'),(327,'INSERT'),(328,'COUNT'),(329,'PORT'),(330,'MLINEFROMTEXT'),(331,'EXISTS'),(332,'MUTEX'),(333,'RELEASE'),(334,'DEFAULT'),(335,'TYPE'),(336,'NO_WRITE_TO_BINLOG'),(337,'OPTIMIZE'),(338,'SQLSTATE'),(339,'RESET'),(340,'INSTALL'),(341,'BIGINT'),(342,'SET'),(343,'ISSUER'),(344,'STATUS'),(345,'INNER'),(346,'RELAYLOG'),(347,'MRG_MYISAM'),(348,'STOP'),(349,'TRAILING'),(350,'PARTITIONS'),(351,'CASE'),(352,'IO_THREAD'),(353,'DEALLOCATE'),(354,'CIPHER'),(355,'CONTINUE'),(356,'READ'),(357,'MINUTE_SECOND'),(358,'MIN_ROWS'),(359,'FUNCTION'),(360,'CHARSET'),(361,'INT3'),(362,'ADD'),(363,'AVG_ROW_LENGTH'),(364,'ARCHIVE'),(365,'FLOAT4'),(366,'ASTEXT'),(367,'NUMGEOMETRIES'),(368,'VIEW'),(369,'REPEATABLE'),(370,'STARTPOINT'),(371,'CONSTRAINT_CATALOG'),(372,'MPOLYFROMTEXT'),(373,'UNSIGNED'),(374,'DECIMAL'),(375,'INDEXES'),(376,'HOSTS'),(377,'COMMIT'),(378,'SNAPSHOT'),(379,'DECLARE'),(380,'NUMPOINTS'),(381,'LOAD'),(382,'SQL_CACHE'),(383,'COLLATE'),(384,'BYTE'),(385,'LINESTRINGFROMWKB'),(386,'GLOBAL'),(387,'WHEN'),(388,'TOUCHES'),(389,'AS'),(390,'AUTO_INCREMENT'),(391,'GEOMCOLLFROMTEXT'),(392,'GRANTS'),(393,'OUTER'),(394,'CURSOR_NAME'),(395,'FLOOR'),(396,'WITH'),(397,'STD'),(398,'AFTER'),(399,'DISABLE'),(400,'UNINSTALL'),(401,'POW'),(402,'SONAME'),(403,'INDEX'),(404,'DEFINER'),(405,'MASTER_BIND'),(406,'REMOVE'),(407,'MULTILINESTRINGFROMWKB'),(408,'ONLINE'),(409,'UNDO'),(410,'ZEROFILL'),(411,'CLIENT'),(412,'MASTER_PASSWORD'),(413,'RELAY_LOG_FILE'),(414,'MBRTOUCHES'),(415,'MASTER_USER'),(416,'ENGINE'),(417,'INSERT_METHOD'),(418,'SQL_CALC_FOUND_ROWS'),(419,'UNION'),(420,'MYISAM'),(421,'DESC'),(422,'TIME'),(423,'EXPANSION'),(424,'NUMERIC'),(425,'CODE'),(426,'AREA'),(427,'LOGFILE'),(428,'EXTENT_SIZE'),(429,'INT2'),(430,'MAX_UPDATES_PER_HOUR'),(431,'ENDS'),(432,'ISEMPTY'),(433,'RECOVER'),(434,'LOGS'),(435,'HEAP'),(436,'BETWEEN'),(437,'REPAIR'),(438,'MBRDISJOINT'),(439,'CALL'),(440,'VALUES'),(441,'TRUNCATE'),(442,'SHOW'),(443,'BINLOG'),(444,'AND'),(445,'HOUR'),(446,'SELECT'),(447,'DATABASES'),(448,'WRAPPER'),(449,'BOOL'),(450,'MASTER_PORT'),(451,'CONCURRENT'),(452,'HELP'),(453,'OPTIONS'),(454,'PROCESS'),(455,'CONSISTENT'),(456,'MAX_CONNECTIONS_PER_HOUR'),(457,'IN'),(458,'DUMPFILE'),(459,'POLYFROMTEXT'),(460,'EXECUTE'),(461,'CEIL'),(462,'MASTER_HOST'),(463,'SERVER'),(464,'MULTIPOLYGONFROMWKB'),(465,'MASTER_SSL_CERT'),(466,'DAY_MINUTE'),(467,'DATE_SUB'),(468,'REBUILD'),(469,'GEOMETRYFROMWKB'),(470,'PARSER'),(471,'RENAME'),(472,'GEOMFROMTEXT'),(473,'SOCKET'),(474,'STRAIGHT_JOIN'),(475,'SHA1'),(476,'PASSWORD'),(477,'OFFSET'),(478,'NEXT'),(479,'ERRORS'),(480,'TEMPORARY'),(481,'SQL_LOG_BIN'),(482,'DIMENSION'),(483,'SQL_SMALL_RESULT'),(484,'COMMITTED'),(485,'EQUALS'),(486,'DELAY_KEY_WRITE'),(487,'BEGIN'),(488,'XA'),(489,'PROFILE'),(490,'CENTROID'),(491,'MEDIUM'),(492,'SSL'),(493,'DAY_HOUR'),(494,'AES_ENCRYPT'),(495,'GEOMCOLLROMWKB'),(496,'CEILING'),(497,'LINEFROMWKB'),(498,'GEOMETRYTYPE'),(499,'SIGNAL'),(500,'PLUGINS'),(501,'SAVEPOINT'),(502,'PRIMARY'),(503,'LAST'),(504,'KEYS'),(505,'MPOINTFROMWKB'),(506,'LIMIT'),(507,'KEY'),(508,'UNTIL'),(509,'CONSTRAINT_SCHEMA'),(510,'ANALYZE'),(511,'CONSTRAINT'),(512,'SERIAL'),(513,'ACTION'),(514,'INITIAL_SIZE'),(515,'SESSION'),(516,'SLAVE'),(517,'ASC'),(518,'ENABLE'),(519,'OPTIONALLY'),(520,'DISTINCT'),(521,'LOCAL'),(522,'WHILE'),(523,'MAX_USER_CONNECTIONS'),(524,'MASTER_SSL_KEY'),(525,'NONE'),(526,'TABLES'),(527,'<>'),(528,'RLIKE'),(529,'TRIGGER'),(530,'HIGH_PRIORITY'),(531,'COLLATION'),(532,'BTREE'),(533,'COALESCE'),(534,'FIRST'),(535,'WAIT'),(536,'MASTER'),(537,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (0,0),(432,0),(239,1),(229,2),(2,3),(3,4),(300,5),(300,6),(456,6),(55,7),(349,8),(221,9),(474,10),(327,11),(13,12),(59,12),(323,12),(426,12),(196,13),(66,14),(91,14),(218,14),(195,15),(45,16),(18,17),(307,18),(106,19),(24,20),(237,21),(426,21),(195,22),(21,23),(23,24),(372,24),(474,24),(24,25),(173,25),(432,25),(237,26),(255,27),(26,28),(195,29),(433,30),(30,31),(237,31),(497,31),(0,32),(300,32),(456,32),(497,32),(93,33),(237,33),(491,33),(31,34),(59,34),(0,35),(33,35),(103,35),(102,36),(106,36),(133,36),(173,36),(110,37),(491,37),(432,38),(173,39),(106,40),(103,41),(237,42),(229,43),(25,44),(121,44),(146,44),(173,44),(300,45),(456,45),(195,46),(46,47),(307,47),(432,47),(497,47),(300,48),(456,48),(260,49),(307,49),(399,49),(432,49),(51,50),(319,51),(327,52),(474,52),(489,52),(56,53),(347,53),(464,54),(491,54),(206,55),(237,55),(491,55),(20,56),(34,56),(47,56),(390,57),(426,57),(59,58),(406,58),(195,59),(60,60),(266,61),(299,61),(63,62),(342,62),(193,63),(488,63),(67,64),(68,65),(69,66),(300,66),(456,66),(507,66),(71,67),(121,67),(195,67),(381,67),(110,68),(237,68),(491,68),(103,69),(110,69),(237,69),(300,69),(456,69),(491,69),(349,70),(349,71),(405,72),(106,73),(391,74),(106,75),(133,75),(491,76),(34,77),(47,77),(76,78),(77,79),(30,80),(66,80),(218,80),(265,80),(403,80),(426,80),(432,80),(487,80),(79,81),(0,82),(20,83),(237,84),(359,85),(242,86),(344,86),(406,86),(426,86),(432,86),(465,86),(413,87),(426,87),(55,88),(344,89),(464,90),(55,91),(265,92),(426,92),(464,92),(93,93),(94,94),(103,95),(214,95),(491,95),(498,95),(96,96),(321,97),(464,97),(98,98),(100,99),(30,100),(46,100),(432,100),(433,100),(491,100),(0,101),(30,101),(48,101),(135,102),(106,103),(133,103),(107,104),(112,105),(459,106),(237,107),(239,107),(491,107),(497,107),(57,108),(81,108),(173,108),(316,108),(399,108),(193,109),(488,109),(88,110),(426,110),(487,111),(193,112),(488,112),(121,113),(442,113),(237,114),(452,115),(127,116),(432,117),(464,118),(106,119),(129,120),(327,121),(133,122),(137,123),(237,124),(464,124),(432,125),(24,126),(30,126),(46,126),(260,126),(307,126),(321,126),(464,126),(106,127),(103,128),(111,129),(330,129),(348,129),(402,129),(426,129),(149,130),(151,131),(490,132),(219,133),(137,134),(235,134),(0,135),(4,136),(426,136),(140,137),(221,137),(103,138),(122,138),(278,138),(367,138),(432,138),(467,139),(155,140),(349,141),(159,142),(163,143),(173,144),(239,145),(200,146),(111,147),(140,147),(177,147),(221,147),(237,147),(250,147),(321,147),(330,147),(426,147),(432,147),(464,147),(491,147),(193,148),(488,148),(38,149),(61,149),(114,149),(150,149),(206,149),(215,149),(235,149),(237,149),(313,149),(388,149),(410,149),(426,149),(491,149),(495,149),(237,150),(269,150),(388,150),(497,150),(349,151),(159,152),(167,153),(491,154),(299,155),(349,156),(432,157),(169,158),(465,159),(171,160),(376,161),(327,162),(81,163),(173,163),(12,164),(15,164),(38,164),(55,164),(103,164),(110,164),(150,164),(165,164),(185,164),(203,164),(237,164),(239,164),(278,164),(295,164),(300,164),(330,164),(360,164),(402,164),(426,164),(486,164),(137,165),(426,166),(484,166),(491,167),(443,168),(237,169),(491,169),(308,170),(178,171),(215,172),(179,173),(140,174),(146,175),(106,176),(133,176),(273,176),(400,176),(432,176),(237,177),(173,178),(237,179),(20,180),(34,180),(47,180),(123,180),(174,180),(179,180),(474,180),(507,180),(195,181),(405,182),(59,183),(183,184),(186,185),(106,186),(295,186),(321,186),(188,187),(349,188),(97,189),(487,190),(195,191),(491,192),(17,193),(426,193),(193,194),(349,195),(195,196),(265,197),(426,197),(443,197),(158,198),(426,198),(463,198),(197,199),(199,200),(201,201),(491,202),(106,203),(432,204),(81,205),(93,205),(173,205),(299,205),(316,205),(205,206),(321,207),(464,207),(282,208),(412,208),(208,209),(207,210),(106,211),(229,212),(327,212),(211,213),(292,214),(266,215),(0,216),(237,217),(491,217),(38,218),(87,218),(106,218),(111,218),(192,218),(226,218),(367,218),(370,218),(456,218),(491,218),(498,218),(0,219),(217,220),(426,221),(427,221),(464,222),(237,223),(491,223),(219,224),(121,225),(493,225),(111,226),(215,226),(195,227),(300,227),(111,228),(106,229),(237,229),(497,229),(390,230),(229,231),(300,232),(317,233),(7,234),(426,234),(269,235),(388,235),(497,235),(229,236),(283,237),(108,238),(191,238),(231,238),(298,238),(108,239),(298,239),(300,239),(330,239),(404,239),(103,240),(498,240),(99,241),(173,242),(237,243),(327,244),(412,244),(474,244),(6,245),(20,245),(244,245),(269,245),(300,245),(330,245),(348,245),(388,245),(397,245),(321,246),(146,247),(239,248),(295,248),(365,248),(414,248),(406,249),(237,250),(432,251),(260,252),(307,252),(501,252),(133,253),(173,254),(24,255),(474,255),(111,256),(239,256),(330,256),(348,256),(402,256),(426,256),(191,257),(298,257),(497,257),(246,258),(245,259),(235,260),(464,261),(140,262),(251,263),(111,264),(237,264),(491,264),(253,265),(256,266),(106,267),(193,268),(488,268),(237,269),(359,269),(353,270),(260,271),(321,271),(464,271),(123,272),(300,273),(300,274),(456,274),(237,275),(265,275),(426,275),(464,275),(491,275),(121,276),(299,277),(432,277),(55,278),(121,278),(255,278),(193,279),(260,279),(307,279),(374,279),(488,279),(343,280),(309,281),(6,282),(49,282),(122,282),(142,282),(210,282),(214,282),(269,282),(271,282),(348,282),(372,282),(388,282),(397,282),(414,282),(462,282),(491,282),(498,282),(432,283),(349,284),(106,285),(215,286),(237,286),(491,286),(160,287),(237,287),(265,287),(426,287),(484,287),(30,288),(46,288),(106,288),(237,288),(295,288),(321,288),(432,288),(433,288),(464,288),(491,288),(237,289),(497,289),(195,290),(111,291),(237,291),(239,291),(464,291),(491,291),(237,292),(491,292),(55,293),(405,293),(432,294),(276,295),(349,296),(193,297),(488,297),(193,298),(488,298),(283,299),(106,300),(30,301),(46,301),(59,301),(265,301),(403,301),(193,302),(488,302),(185,303),(300,303),(397,303),(456,303),(0,304),(46,304),(307,304),(321,304),(432,304),(464,304),(491,304),(106,305),(288,306),(30,307),(215,307),(235,307),(121,308),(49,309),(110,309),(491,309),(200,310),(51,311),(0,312),(349,313),(491,313),(146,314),(349,314),(489,314),(296,315),(193,316),(488,316),(173,317),(140,318),(237,319),(103,320),(195,321),(302,322),(12,323),(99,323),(165,323),(175,323),(226,323),(426,323),(432,323),(462,323),(502,323),(299,324),(305,325),(391,326),(104,327),(164,327),(307,327),(501,327),(222,328),(293,328),(413,328),(239,329),(308,330),(6,331),(269,331),(300,331),(330,331),(348,331),(388,331),(397,331),(426,332),(436,332),(327,333),(474,333),(489,333),(111,334),(237,334),(260,334),(307,334),(330,334),(354,334),(374,334),(491,334),(497,334),(491,335),(173,336),(235,336),(313,336),(495,336),(313,337),(491,337),(193,338),(488,338),(81,339),(143,339),(273,339),(316,339),(463,340),(116,341),(46,342),(97,342),(111,342),(177,342),(193,342),(237,342),(242,342),(250,342),(252,342),(260,342),(292,342),(307,342),(319,342),(321,342),(327,342),(330,342),(426,342),(432,342),(464,342),(488,342),(491,342),(497,342),(106,343),(35,344),(114,344),(117,344),(173,344),(175,344),(326,344),(417,344),(426,344),(436,344),(0,345),(218,346),(237,347),(282,348),(487,349),(137,350),(34,351),(47,351),(282,352),(412,352),(372,353),(106,354),(406,355),(24,356),(59,356),(173,356),(229,356),(474,356),(195,357),(237,358),(491,358),(55,359),(165,359),(203,359),(210,359),(271,359),(290,359),(360,359),(370,359),(417,359),(426,359),(462,359),(250,360),(135,361),(38,362),(103,362),(491,362),(498,362),(237,363),(491,363),(237,364),(338,365),(343,366),(346,367),(87,368),(269,368),(486,368),(229,369),(352,370),(193,371),(488,371),(353,372),(121,373),(255,373),(266,373),(317,373),(338,373),(359,373),(405,373),(55,374),(85,374),(121,374),(426,375),(173,376),(328,376),(426,376),(327,377),(474,377),(327,378),(474,378),(344,379),(354,379),(406,379),(465,379),(366,380),(399,381),(464,381),(432,382),(111,383),(237,383),(330,383),(491,383),(493,384),(483,385),(97,386),(229,386),(319,386),(326,386),(427,386),(34,387),(47,387),(373,388),(0,389),(24,389),(432,389),(491,390),(376,391),(350,392),(426,392),(0,393),(193,394),(488,394),(116,395),(106,396),(110,396),(173,396),(237,396),(299,396),(491,396),(380,397),(491,398),(300,399),(456,399),(491,399),(158,400),(387,401),(55,402),(0,403),(38,403),(49,403),(57,403),(110,403),(237,403),(399,403),(403,403),(426,403),(491,403),(300,404),(456,404),(349,405),(491,406),(149,407),(49,408),(110,408),(491,408),(406,409),(255,410),(266,410),(317,410),(338,410),(359,410),(405,410),(106,411),(349,412),(349,413),(396,414),(349,415),(103,416),(173,416),(214,416),(237,416),(426,416),(436,416),(491,416),(498,416),(237,417),(491,417),(432,418),(400,419),(491,419),(237,420),(137,421),(432,421),(433,421),(121,422),(194,422),(407,422),(299,423),(359,424),(290,425),(502,425),(411,426),(103,427),(122,427),(278,427),(367,427),(103,428),(124,429),(106,430),(300,431),(416,432),(474,433),(25,434),(146,434),(173,434),(426,434),(237,435),(78,436),(235,437),(491,437),(419,438),(421,439),(260,440),(307,440),(410,441),(491,441),(4,442),(7,442),(12,442),(17,442),(22,442),(25,442),(35,442),(45,442),(66,442),(88,442),(91,442),(102,442),(114,442),(117,442),(150,442),(160,442),(175,442),(177,442),(185,442),(203,442),(218,442),(248,442),(265,442),(290,442),(293,442),(323,442),(326,442),(328,442),(350,442),(390,442),(402,442),(403,442),(413,442),(417,442),(426,442),(427,442),(436,442),(484,442),(502,442),(505,442),(66,443),(428,443),(78,444),(430,444),(195,445),(137,446),(164,446),(260,446),(307,446),(432,446),(88,447),(426,447),(239,448),(62,449),(266,449),(349,450),(321,451),(464,451),(64,452),(449,452),(192,453),(239,453),(106,454),(327,455),(474,455),(106,456),(66,457),(218,457),(265,457),(299,457),(403,457),(432,457),(432,458),(452,459),(48,460),(106,460),(454,461),(349,462),(6,463),(192,463),(239,463),(67,464),(349,465),(195,466),(195,467),(491,468),(77,469),(110,470),(237,470),(491,470),(61,471),(365,471),(456,471),(491,471),(459,472),(239,473),(0,474),(432,474),(467,475),(106,476),(239,476),(242,476),(295,476),(491,476),(432,477),(59,478),(293,479),(426,479),(388,480),(252,481),(471,482),(432,483),(229,484),(473,485),(237,486),(491,486),(174,487),(327,487),(474,487),(474,488),(248,489),(475,490),(215,491),(106,492),(195,493),(478,494),(309,495),(482,496),(483,497),(485,498),(488,499),(22,500),(489,501),(491,502),(59,503),(403,504),(426,504),(491,504),(490,505),(30,506),(46,506),(59,506),(66,506),(218,506),(432,506),(38,507),(237,507),(307,507),(491,507),(497,507),(123,508),(193,509),(488,509),(491,510),(495,510),(237,511),(491,511),(237,512),(374,512),(237,513),(497,513),(103,514),(498,514),(229,515),(319,515),(326,515),(427,515),(117,516),(173,516),(273,516),(282,516),(300,516),(316,516),(328,516),(412,516),(456,516),(432,517),(433,517),(300,518),(456,518),(491,518),(464,519),(54,520),(222,520),(259,520),(393,520),(400,520),(432,520),(433,520),(445,520),(24,521),(173,521),(235,521),(313,521),(321,521),(464,521),(495,521),(507,522),(106,523),(349,524),(106,525),(24,526),(160,526),(173,526),(323,526),(426,526),(506,527),(19,528),(15,529),(142,529),(426,529),(307,530),(432,530),(426,531),(505,531),(110,532),(491,533),(59,534),(237,534),(491,534),(103,535),(498,535),(25,536),(35,536),(143,536),(146,536),(173,536),(316,536),(349,536),(237,537),(491,537);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` bigint(20) unsigned NOT NULL,
  `updates` bigint(20) unsigned NOT NULL,
  `deletes` bigint(20) unsigned NOT NULL,
  `schemaops` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'','2025-05-23 23:04:55'),('u14','root','','',1,'','2025-05-23 23:04:55');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `speciesyoutube`
--

DROP TABLE IF EXISTS `speciesyoutube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speciesyoutube` (
  `cname` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arithaino` int(11) DEFAULT NULL,
  `youtubeid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciesyoutube`
--

LOCK TABLES `speciesyoutube` WRITE;
/*!40000 ALTER TABLE `speciesyoutube` DISABLE KEYS */;
INSERT INTO `speciesyoutube` VALUES ('臺灣赤楠',1,'YHx7RzAlbEw','VID20250614123229'),('臺灣赤楠',2,'nlbAm5d1HzY','VID20250614121019'),('咖啡',1,'BMdmGhR6ooI','VID20250324112600'),('咖啡',2,'0nvNk6O5xn0','VID20231216111936'),('咖啡',3,'MuCTZjFzX6U','VID20231216111957'),('咖啡',4,'6gyVmjqD7Q4','VID20240901082357'),('咖啡',5,'ndeykI6spLU','VID20240926062957');
/*!40000 ALTER TABLE `speciesyoutube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin DEFAULT '',
  `authentication_string` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('u14','root','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('127.0.0.1','root','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('::1','root','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('localhost','debian-sys-maint','*5F7EB3E964D54350F2476BEDEA03C9222239BA85','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',NULL),('localhost','phpmyadmin','*FD571203974BA9AFE270FE62151AE967ECA5E0AA','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-30  8:41:27

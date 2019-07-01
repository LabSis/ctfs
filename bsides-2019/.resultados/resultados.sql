-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: juez
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

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
-- Current Database: `juez`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `juez` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `juez`;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `clave` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'admin','fb05e1d4ad5033aa120d98e653a7c5aa66eb5dd3');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio_competencia` datetime NOT NULL,
  `hora_frizado_avances` datetime NOT NULL,
  `hora_fin_competencia` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (2,'2019-06-08 03:00:00','2019-06-09 21:00:00','2019-06-11 03:00:00');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desafios`
--

DROP TABLE IF EXISTS `desafios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desafios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `enunciado` text NOT NULL,
  `puntos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desafios`
--

LOCK TABLES `desafios` WRITE;
/*!40000 ALTER TABLE `desafios` DISABLE KEYS */;
INSERT INTO `desafios` VALUES (1,'Gran rifa 2019','gran_rifa_2019.pdf',15),(2,'Análisis de frecuencias','analisis_frecuencia.pdf',15),(3,'Aldeas inseguras','aldeas_inseguras.pdf',15),(4,'Juego de las bolitas','juego_bolitas.pdf',15),(5,'Rompiendo login','rompiendo_login.pdf',30),(6,'Consulta de multas','consultas_multas.pdf',40),(7,'Gran rifa 2019 - 2','gran_rifa_2019_2.pdf',30),(8,'Android secret saver','android_secret_saver.pdf',40),(9,'Recuperación de imagen','recuperacion_imagen.pdf',50);
/*!40000 ALTER TABLE `desafios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` blob NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `nombre_visible` varchar(20) NOT NULL,
  `puntaje` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'de00e05b16ec4b3c8fdb1394f9fd8aceb0a8a9c2','Giugiu','Giugiu',0),(2,'0bd2a831c8ea3c9eaad1b252afbe4be79b512bea','random.random','random.random',0),(3,'c78e03412594195c5841e16f2f939068369f1241','Puts4','Puts4',100),(4,'ef837875323ef2e23f81f01d428db4ef0b525059','Manyino','Manyino',0),(5,'03ecb67816f471ec1f5af6bb7ba9a7ac80a66f68','MarquitosGalacticos','MarquitosGalacticos',250),(6,'cc4172cb5146c79cd1c71f3b10cd9009810f8c9e','zamoxima','zamoxima',0),(7,'08673c3fb5d9173cd0e23d455762bdd283811687','DoubleZer0','DoubleZer0',0),(8,'43812969ffc543979dffbd927dca27a959fbe131','TandilSec','TandilSec',100),(9,'b3cb8fec989076251d203be39771930f86c73d62','Bidichsen','Bidichsen',100),(10,'0c66d6334d8f40d46f163f5ad2c0bb2085f2c73c','GordoAlone','GordoAlone',30),(11,'8c62d69a2e2fc2098fe663f716a9117ee998f0e1','$T0Rd0','$T0Rd0',60),(12,'93e14168ff64548feb72ecda130f6bce2966beee','ValorNull','ValorNull',15),(13,'0590294cceacb7c1f33b27de8250841d42282fe6','Lossincamuflaje','Lossincamuflaje',60),(14,'9b423b457140cf6259f29076b88663d2ea6345c8','Forsec','Forsec',60),(15,'9393ab1e6482e4a10d1aabcdb9159f2adf6dc895','EZT','EZT',140),(16,'e8085c4729479ac5d51f33ba08456bc16cc7a6b0','TeamFish','TeamFish',220);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hash_desafios`
--

DROP TABLE IF EXISTS `hash_desafios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hash_desafios` (
  `id_desafio` int(11) NOT NULL,
  `hash` varchar(256) NOT NULL,
  PRIMARY KEY (`id_desafio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hash_desafios`
--

LOCK TABLES `hash_desafios` WRITE;
/*!40000 ALTER TABLE `hash_desafios` DISABLE KEYS */;
INSERT INTO `hash_desafios` VALUES (1,'99e40704e04e4b9c4d5485d7491137cb'),(2,'d38aab889e5ec77ce97107755b06258b'),(3,'6834653c57b5bb8117cd6e119d213b2c'),(4,'eca0049bb012c0ab9df50049c750cdc3'),(5,'9d666d36b87fa3eb312a66bf7390186d'),(6,'05d1091e5cddc234428fb3fc5ea9d540'),(7,'3924a3d5010ef094323af3621333b26f'),(8,'6644b831e436dd3e4230d80e15633ceb'),(9,'a1e2fc4a3e2659a1e104d8491990163b');
/*!40000 ALTER TABLE `hash_desafios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_grupo`
--

DROP TABLE IF EXISTS `historico_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_grupo` (
  `id_grupo` int(11) NOT NULL,
  `id_desafio` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_desafio`),
  KEY `id_desafio` (`id_desafio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_grupo`
--

LOCK TABLES `historico_grupo` WRITE;
/*!40000 ALTER TABLE `historico_grupo` DISABLE KEYS */;
INSERT INTO `historico_grupo` VALUES (5,2,'2019-06-08 03:08:11'),(5,1,'2019-06-08 03:11:16'),(5,4,'2019-06-08 03:17:58'),(5,6,'2019-06-08 03:57:05'),(10,2,'2019-06-08 04:01:45'),(14,2,'2019-06-08 04:02:47'),(10,3,'2019-06-08 04:22:03'),(9,1,'2019-06-08 04:59:25'),(9,2,'2019-06-08 05:03:49'),(13,3,'2019-06-08 05:04:53'),(9,3,'2019-06-08 05:12:47'),(11,2,'2019-06-08 05:33:13'),(9,4,'2019-06-08 06:23:39'),(9,6,'2019-06-08 06:43:41'),(13,2,'2019-06-08 06:55:42'),(3,4,'2019-06-08 09:03:10'),(3,3,'2019-06-08 12:49:34'),(5,3,'2019-06-08 13:30:26'),(5,5,'2019-06-08 13:49:03'),(14,4,'2019-06-08 15:01:27'),(3,2,'2019-06-08 15:04:46'),(5,8,'2019-06-08 15:39:38'),(5,9,'2019-06-08 16:45:06'),(11,4,'2019-06-08 16:55:24'),(12,2,'2019-06-08 20:31:23'),(11,1,'2019-06-08 21:42:08'),(13,1,'2019-06-08 21:50:36'),(11,3,'2019-06-08 22:56:54'),(5,7,'2019-06-08 23:12:37'),(16,2,'2019-06-08 23:35:50'),(16,3,'2019-06-08 23:47:51'),(15,3,'2019-06-09 00:08:11'),(15,6,'2019-06-09 00:36:05'),(15,4,'2019-06-09 00:46:04'),(13,4,'2019-06-09 01:14:56'),(15,1,'2019-06-09 02:43:34'),(16,4,'2019-06-09 03:40:05'),(15,8,'2019-06-09 04:15:52'),(15,2,'2019-06-09 04:38:45'),(3,1,'2019-06-09 05:33:51'),(16,1,'2019-06-09 11:27:28'),(16,6,'2019-06-09 12:01:58'),(14,3,'2019-06-09 19:23:23'),(14,1,'2019-06-09 20:02:45'),(16,5,'2019-06-09 22:21:01'),(8,1,'2019-06-10 01:00:38'),(8,2,'2019-06-10 01:00:45'),(8,3,'2019-06-10 01:00:51'),(8,4,'2019-06-10 01:00:58'),(8,6,'2019-06-10 01:01:42'),(3,8,'2019-06-10 10:58:52'),(16,8,'2019-06-10 14:55:29'),(16,9,'2019-06-10 23:12:11');
/*!40000 ALTER TABLE `historico_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intentos_por_grupo`
--

DROP TABLE IF EXISTS `intentos_por_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intentos_por_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_desafio` int(11) NOT NULL,
  `hash_intento` varchar(256) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `correcto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_desafio` (`id_desafio`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intentos_por_grupo`
--

LOCK TABLES `intentos_por_grupo` WRITE;
/*!40000 ALTER TABLE `intentos_por_grupo` DISABLE KEYS */;
INSERT INTO `intentos_por_grupo` VALUES (13,8,1,'sZSdpFAcPESCmS1fQS7ThKmDzWfbpUqddyac85jsUh6yI59JIE6480V9hh3G70aA','2019-06-08 03:06:06',0),(14,5,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 03:08:11',1),(15,5,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-08 03:11:16',1),(16,8,1,'csrfmiddlewaretoken','2019-06-08 03:16:09',0),(17,5,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-08 03:17:58',1),(18,5,6,'05d1091e5cddc234428fb3fc5ea9d540','2019-06-08 03:57:05',1),(19,10,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 04:01:45',1),(20,14,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 04:02:47',1),(21,10,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-08 04:22:03',1),(22,9,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-08 04:59:25',1),(23,9,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 05:03:49',1),(24,13,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-08 05:04:53',1),(25,5,5,'bd148eab0493e38354e45e2cd7db59b90fdcad79','2019-06-08 05:08:53',0),(26,9,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-08 05:12:47',1),(27,11,2,'7afe68fa7ee8deaa1fc158efff950812','2019-06-08 05:16:40',0),(28,11,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 05:33:13',1),(29,9,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-08 06:23:39',1),(30,9,6,'05d1091e5cddc234428fb3fc5ea9d540','2019-06-08 06:43:41',1),(31,13,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 06:55:42',1),(32,3,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-08 09:03:10',1),(33,3,8,'oHfn7J1oXEa','2019-06-08 12:20:03',0),(34,3,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-08 12:49:34',1),(35,5,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-08 13:30:26',1),(36,5,5,'9d666d36b87fa3eb312a66bf7390186d','2019-06-08 13:49:03',1),(37,14,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-08 15:01:27',1),(38,3,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 15:04:46',1),(39,5,8,'6644b831e436dd3e4230d80e15633ceb','2019-06-08 15:39:38',1),(40,3,8,'oHfn7J1oXEa','2019-06-08 16:10:28',0),(41,5,9,'a1e2fc4a3e2659a1e104d8491990163b','2019-06-08 16:45:06',1),(42,11,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-08 16:55:24',1),(43,11,8,'7GfNMAzV9Q52dxEfH20hXheSWgEssLS6pzG+orQsuXXa+mGxQ6Lm/E4sMKPuDIG6','2019-06-08 17:05:41',0),(44,11,8,'7GfNMAzV9Q52dxEfH20hXheSWgEssLS6pzG+orQsuXXa+mGxQ6Lm/E4sMKPuDIG6','2019-06-08 18:53:48',0),(45,11,1,'Qg2LZWYLYcQaFVhH7RYjYgcCYK2VGhy7kMp8v6lD2SYkJzRg1JKYhsaY8ZdWhZML','2019-06-08 19:24:40',0),(46,12,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 20:31:23',1),(47,11,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-08 21:42:08',1),(48,13,1,'99e4070e04e4b9c4d5485d7491137cb','2019-06-08 21:47:51',0),(49,13,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-08 21:50:36',1),(50,11,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-08 22:56:54',1),(51,5,7,'3924a3d5010ef094323af3621333b26f','2019-06-08 23:12:37',1),(52,16,2,'d38aab889e5ec77ce97107755b06258b','2019-06-08 23:35:50',1),(53,16,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-08 23:47:51',1),(54,11,8,'0x7f07005f','2019-06-08 23:48:29',0),(55,15,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-09 00:08:11',1),(56,15,6,'05d1091e5cddc234428fb3fc5ea9d540','2019-06-09 00:36:05',1),(57,15,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-09 00:46:04',1),(58,13,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-09 01:14:56',1),(59,11,8,'c794a4ce0e10cf17c39a6635012dfae1bd61810e','2019-06-09 01:34:30',0),(60,11,8,'7472787127dd38a5d0bce27cadcce6a1','2019-06-09 01:36:11',0),(61,11,8,'7472787127DD38A5D0BCE27CADCCE6A1','2019-06-09 01:57:39',0),(62,11,8,'FC659859D6DE72AC809DE0DE20817A4E','2019-06-09 01:59:42',0),(63,11,8,'$2y$10$tDqhO8iG64LJCut4mFMIaebVP2Vh30eG1uDsEQ/6IOSlAHWIAozSO','2019-06-09 02:14:15',0),(64,11,8,'C794A4CE0E10CF17C39A6635012DFAE1BD61810E','2019-06-09 02:15:42',0),(65,11,8,'$2y$10$uv74JGYbz9Ornp4gNh/ive2LxipkX0wYDZdwrCWjrBRD9AJkrHM4a','2019-06-09 02:20:01',0),(66,11,8,'$2b$10$bIqXr4iAvfzkMhRyMH4n0.N2Rx0oQPnhlaVaV0y3CD4QZELrb1wI6','2019-06-09 02:25:45',0),(67,11,8,'$2b$10$3rdW3shgq36wg4mub2jVSuIwpZTas35A6aV10gX1WaSbcG0TGLewy','2019-06-09 02:31:20',0),(68,15,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-09 02:43:34',1),(69,11,8,'39DF0BB209825157C263B8460967649D','2019-06-09 02:44:34',0),(70,11,8,'7GfNMAzV9Q52dxEfH20hXheSWgEssLS6pzG','2019-06-09 02:50:08',0),(71,11,8,'c951a5ad4c1463a6bbc2a4400ec2436e','2019-06-09 03:24:11',0),(72,11,8,'5ebe2294ecd0e0f08eab7690d2a6ee69','2019-06-09 03:25:53',0),(73,11,8,'7de38f3c3d3baa7ca58a366f09577586','2019-06-09 03:28:28',0),(74,16,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-09 03:40:05',1),(75,13,9,'ce8086a965de686834065d8610e730f394bb3b1c','2019-06-09 03:58:27',0),(76,15,8,'6644b831e436dd3e4230d80e15633ceb','2019-06-09 04:15:52',1),(77,15,2,'d38aab889e5ec77ce97107755b06258b','2019-06-09 04:38:45',1),(78,3,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-09 05:33:51',1),(79,11,8,'oHfn7J1oXEa','2019-06-09 05:38:22',0),(80,11,8,'7GfNMAzV9Q52dxEfH20hXheSWgEssLS6pzG+orQsuXXa+mGxQ6Lm/E4sMKPuDIG6','2019-06-09 05:41:28',0),(81,16,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-09 11:27:28',1),(82,16,6,'05d1091e5cddc234428fb3fc5ea9d540','2019-06-09 12:01:58',1),(83,14,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-09 19:23:23',1),(84,11,8,'b3cbcbe3c67bf93a9bbca9a9c3a592c1d2de2d14','2019-06-09 19:55:15',0),(85,14,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-09 20:02:45',1),(86,16,5,'9d666d36b87fa3eb312a66bf7390186d','2019-06-09 22:21:01',1),(87,8,1,'99e40704e04e4b9c4d5485d7491137cb','2019-06-10 01:00:38',1),(88,8,2,'d38aab889e5ec77ce97107755b06258b','2019-06-10 01:00:45',1),(89,8,3,'6834653c57b5bb8117cd6e119d213b2c','2019-06-10 01:00:51',1),(90,8,4,'eca0049bb012c0ab9df50049c750cdc3','2019-06-10 01:00:58',1),(91,8,6,'05d1091e5cddc234428fb3fc5ea9d540','2019-06-10 01:01:42',1),(92,3,8,'7GfNMAzV9Q52dxEfH20hXheSWgEssLS6pzG+orQsuXXa+mGxQ6Lm/E4sMKPuDIG6','2019-06-10 07:27:44',0),(93,3,8,'6644b831e436dd3e4230d80e15633ceb','2019-06-10 10:58:52',1),(94,16,8,'1a3c70ef40506f667262a3fc49024d22','2019-06-10 14:35:05',0),(95,16,8,'6644b831e436dd3e4230d80e15633ceb','2019-06-10 14:55:29',1),(96,16,9,'a1e2fc4a3e2659a1e104d8491990163b','2019-06-10 23:12:11',1);
/*!40000 ALTER TABLE `intentos_por_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_intentos_por_grupo`
--

DROP TABLE IF EXISTS `vista_intentos_por_grupo`;
/*!50001 DROP VIEW IF EXISTS `vista_intentos_por_grupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_intentos_por_grupo` (
  `id` tinyint NOT NULL,
  `id_grupo` tinyint NOT NULL,
  `id_desafio` tinyint NOT NULL,
  `fecha_hora` tinyint NOT NULL,
  `correcto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `juez`
--

USE `juez`;

--
-- Final view structure for view `vista_intentos_por_grupo`
--

/*!50001 DROP TABLE IF EXISTS `vista_intentos_por_grupo`*/;
/*!50001 DROP VIEW IF EXISTS `vista_intentos_por_grupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_intentos_por_grupo` AS select `intentos_por_grupo`.`id` AS `id`,`intentos_por_grupo`.`id_grupo` AS `id_grupo`,`intentos_por_grupo`.`id_desafio` AS `id_desafio`,`intentos_por_grupo`.`fecha_hora` AS `fecha_hora`,`intentos_por_grupo`.`correcto` AS `correcto` from `intentos_por_grupo` */;
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

-- Dump completed on 2019-06-12 13:42:21

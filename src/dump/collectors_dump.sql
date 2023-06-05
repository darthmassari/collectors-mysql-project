CREATE DATABASE  IF NOT EXISTS `collectors` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `collectors`;
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: collectors
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `tipo` enum('esecutore','compositore') NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Kanye West','esecutore'),(2,'Kid Cudi','esecutore'),(3,'Metro Boomin','compositore'),(4,'Linkin Park','esecutore'),(5,'The Weeknd','esecutore');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaborazione`
--

DROP TABLE IF EXISTS `collaborazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaborazione` (
  `ID_artista` int unsigned NOT NULL,
  `ID_traccia` int unsigned NOT NULL,
  UNIQUE KEY `collaboratore_unico` (`ID_artista`,`ID_traccia`),
  KEY `traccia_collaborazione` (`ID_traccia`),
  CONSTRAINT `artista_collaborazione` FOREIGN KEY (`ID_artista`) REFERENCES `artista` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `traccia_collaborazione` FOREIGN KEY (`ID_traccia`) REFERENCES `traccia` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborazione`
--

LOCK TABLES `collaborazione` WRITE;
/*!40000 ALTER TABLE `collaborazione` DISABLE KEYS */;
INSERT INTO `collaborazione` VALUES (2,1),(5,3);
/*!40000 ALTER TABLE `collaborazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collezione`
--

DROP TABLE IF EXISTS `collezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collezione` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_collezionista` int unsigned NOT NULL,
  `nome` varchar(50) NOT NULL,
  `visibilita` enum('privata','pubblica') NOT NULL DEFAULT 'privata',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nome` (`nome`),
  KEY `proprietario_collezione` (`ID_collezionista`),
  CONSTRAINT `proprietario_collezione` FOREIGN KEY (`ID_collezionista`) REFERENCES `collezionista` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collezione`
--

LOCK TABLES `collezione` WRITE;
/*!40000 ALTER TABLE `collezione` DISABLE KEYS */;
INSERT INTO `collezione` VALUES (1,1,'My Collection','privata'),(2,2,'Collezione Bianchi','privata'),(3,3,'Collezione Francesco','pubblica');
/*!40000 ALTER TABLE `collezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collezionista`
--

DROP TABLE IF EXISTS `collezionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collezionista` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `collezionista_unico` (`nickname`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collezionista`
--

LOCK TABLES `collezionista` WRITE;
/*!40000 ALTER TABLE `collezionista` DISABLE KEYS */;
INSERT INTO `collezionista` VALUES (3,'francescoverdi','francescoverdi@univaq.it'),(2,'luigibianchi','luigibianchi@outlook.com'),(1,'mariorossi','mariorossi@gmail.com');
/*!40000 ALTER TABLE `collezionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condivisione`
--

DROP TABLE IF EXISTS `condivisione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condivisione` (
  `ID_collezionista` int unsigned NOT NULL,
  `ID_collezione` int unsigned NOT NULL,
  UNIQUE KEY `condivisione_unica` (`ID_collezionista`,`ID_collezione`),
  KEY `collezione_condivisa` (`ID_collezione`),
  CONSTRAINT `collezione_condivisa` FOREIGN KEY (`ID_collezione`) REFERENCES `collezione` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collezionista_condiviso` FOREIGN KEY (`ID_collezionista`) REFERENCES `collezionista` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condivisione`
--

LOCK TABLES `condivisione` WRITE;
/*!40000 ALTER TABLE `condivisione` DISABLE KEYS */;
INSERT INTO `condivisione` VALUES (2,1),(3,1),(1,2),(3,2),(1,3),(2,3);
/*!40000 ALTER TABLE `condivisione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia`
--

DROP TABLE IF EXISTS `copia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia` (
  `ID_collezione` int unsigned NOT NULL,
  `ID_disco` int unsigned NOT NULL,
  `quantita` smallint unsigned NOT NULL DEFAULT '1',
  `stato` varchar(50) NOT NULL,
  UNIQUE KEY `disco_stato_unico` (`ID_collezione`,`ID_disco`,`stato`),
  KEY `disco_copia` (`ID_disco`),
  CONSTRAINT `collezione_copia` FOREIGN KEY (`ID_collezione`) REFERENCES `collezione` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `disco_copia` FOREIGN KEY (`ID_disco`) REFERENCES `disco` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stati_conservazione` CHECK ((`stato` in (_utf8mb4'Nuovo',_utf8mb4'Come nuovo',_utf8mb4'Buono',_utf8mb4'Pessimo',_utf8mb4'n/a')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia`
--

LOCK TABLES `copia` WRITE;
/*!40000 ALTER TABLE `copia` DISABLE KEYS */;
INSERT INTO `copia` VALUES (1,1,3,'Buono'),(1,2,4,'Come nuovo'),(2,4,1,'n/a'),(3,4,2,'Come nuovo'),(3,6,3,'Buono'),(3,6,1,'Come nuovo');
/*!40000 ALTER TABLE `copia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disco`
--

DROP TABLE IF EXISTS `disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_autore` int unsigned NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `formato` varchar(50) NOT NULL,
  `barcode` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `disco_unico` (`ID_autore`,`titolo`,`barcode`),
  CONSTRAINT `autore_disco` FOREIGN KEY (`ID_autore`) REFERENCES `artista` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `formati` CHECK ((`formato` in (_utf8mb4'Vinile',_utf8mb4'CD',_utf8mb4'Digitale',_utf8mb4'Musicassetta')))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disco`
--

LOCK TABLES `disco` WRITE;
/*!40000 ALTER TABLE `disco` DISABLE KEYS */;
INSERT INTO `disco` VALUES (1,1,'Graduation','Vinile',NULL),(2,1,'808s & Heartbreak','CD','82156179'),(3,2,'Man on The Moon','Digitale',NULL),(4,3,'HEROES & VILLAINS','Digitale','561795468941'),(6,4,'Hybrid Theory','Vinile',NULL),(7,2,'Passion, Pain & Demon Slayin\'','CD','82156179');
/*!40000 ALTER TABLE `disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immagine`
--

DROP TABLE IF EXISTS `immagine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immagine` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_disco` int unsigned NOT NULL,
  `path` varchar(512) NOT NULL,
  `etichetta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `immagine_unica` (`ID_disco`,`path`),
  CONSTRAINT `immagine_disco` FOREIGN KEY (`ID_disco`) REFERENCES `disco` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immagine`
--

LOCK TABLES `immagine` WRITE;
/*!40000 ALTER TABLE `immagine` DISABLE KEYS */;
INSERT INTO `immagine` VALUES (1,4,'/home/user/pictures/heroes-and-villains.png','Copertina'),(2,4,'/home/user/pictures/heroes-and-villains-retro.png','Retro'),(3,6,'/home/user/pictures/hybrid-theory.jpg','Copertina');
/*!40000 ALTER TABLE `immagine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_disco`
--

DROP TABLE IF EXISTS `info_disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_disco` (
  `ID_disco` int unsigned NOT NULL,
  `genere` varchar(50) DEFAULT NULL,
  `descrizione` varchar(5000) DEFAULT NULL,
  `etichetta` varchar(50) DEFAULT NULL,
  `anno` smallint unsigned DEFAULT NULL,
  `anteprima` blob,
  UNIQUE KEY `ID_disco` (`ID_disco`),
  CONSTRAINT `disco_dettagli` FOREIGN KEY (`ID_disco`) REFERENCES `disco` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `controllo_anno` CHECK (((`anno` > 1900) and (`anno` < 2100))),
  CONSTRAINT `generi_musicali` CHECK ((`genere` in (_utf8mb4'Hip-Hop',_utf8mb4'R&B',_utf8mb4'Blues',_utf8mb4'Funk',_utf8mb4'Jazz',_utf8mb4'Rock',_utf8mb4'Metal',_utf8mb4'Pop',_utf8mb4'Classica',_utf8mb4'Disco',_utf8mb4'Altro')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_disco`
--

LOCK TABLES `info_disco` WRITE;
/*!40000 ALTER TABLE `info_disco` DISABLE KEYS */;
INSERT INTO `info_disco` VALUES (2,'Hip-Hop','808s & Heartbreak è il quarto album in studio del rapper statunitense Kanye West, pubblicato il 24 novembre 2008 dall\'etichetta discografica Roc-A-Fella Records','Roc-A-Fella Records',2008,NULL),(3,'Hip-Hop',NULL,'GOOD Music',2009,NULL),(4,'Pop',NULL,'Boominati',2022,NULL),(6,'Rock',NULL,'Warner Bros. Records',2000,NULL),(7,'Hip-Hop','Passion, Pain & Demon Slayin\' è il sesto album in studio del rapper e cantante statunitense Kid Cudi','Wicked Awesome',2016,NULL);
/*!40000 ALTER TABLE `info_disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traccia`
--

DROP TABLE IF EXISTS `traccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traccia` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_disco` int unsigned NOT NULL,
  `numero` tinyint unsigned NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `durata` time DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `traccia_unica` (`ID_disco`,`numero`),
  CONSTRAINT `disco_traccia` FOREIGN KEY (`ID_disco`) REFERENCES `disco` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `controllo_durata` CHECK ((`durata` < _utf8mb4'00:30:00'))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traccia`
--

LOCK TABLES `traccia` WRITE;
/*!40000 ALTER TABLE `traccia` DISABLE KEYS */;
INSERT INTO `traccia` VALUES (1,2,2,'Welcome To Heartbreak','00:04:22'),(3,4,10,'Creepin\'','00:03:41'),(4,4,2,'Superhero','00:03:02'),(5,4,7,'Around Me','00:03:11'),(6,6,2,'One Step Closer',NULL),(7,6,8,'In The End','00:03:36'),(8,7,4,'By Design','00:04:17'),(9,7,8,'Baptized In Fire','00:04:45');
/*!40000 ALTER TABLE `traccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'collectors'
--
/*!50003 DROP FUNCTION IF EXISTS `aggiungi_collezione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `aggiungi_collezione`(ID_collezionista INTEGER UNSIGNED, nome VARCHAR(50), visibilita VARCHAR(10)) RETURNS int unsigned
    DETERMINISTIC
BEGIN
	INSERT INTO collezione (ID_collezionista, nome, visibilita) 
    VALUES (ID_collezionista, nome, visibilita);
	
    RETURN last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `aggiungi_disco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `aggiungi_disco`(
	ID_collezione INTEGER UNSIGNED, quantita SMALLINT UNSIGNED, stato VARCHAR(50), 
    ID_autore INTEGER UNSIGNED, titolo VARCHAR(50), formato varchar(20), 
    barcode VARCHAR(12), genere VARCHAR(50), descrizione VARCHAR(5000), 
    etichetta VARCHAR(50), anno SMALLINT UNSIGNED, anteprima BLOB) RETURNS int unsigned
    DETERMINISTIC
BEGIN
    DECLARE IDdisco INTEGER UNSIGNED;

	INSERT INTO disco (ID_autore, titolo, formato, barcode) 
    VALUES (ID_autore, titolo, formato, barcode);
    
    SET IDdisco = last_insert_id();
    
    INSERT INTO info_disco (ID_disco, genere, descrizione, etichetta, anno, anteprima)
    VALUES (IDdisco, genere, descrizione, etichetta, anno, anteprima);
	
    INSERT INTO copia (ID_collezione, ID_disco, quantita, stato)
    VALUES (ID_collezione, IDdisco, quantita, stato);
    
    RETURN IDdisco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `aggiungi_traccia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `aggiungi_traccia`(
	ID_disco INTEGER UNSIGNED, numero TINYINT UNSIGNED, 
    titolo VARCHAR(50), durata TIME) RETURNS int unsigned
    DETERMINISTIC
BEGIN
	INSERT INTO traccia (ID_disco, numero, titolo, durata) 
    VALUES (ID_disco, numero, titolo, durata);
	
    RETURN last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dischi_collezione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dischi_collezione`(ID INTEGER UNSIGNED)
BEGIN
	SELECT c.quantita, d.titolo, a.nome AS artista, d.formato, d.barcode, c.stato 
	FROM copia c 
		JOIN disco d ON (c.ID_disco = d.ID)
		JOIN artista a ON (d.ID_autore = a.ID)
	WHERE c.ID_collezione = ID
	ORDER BY d.titolo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dischi_per_artista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dischi_per_artista`(nome VARCHAR(50))
BEGIN
	SELECT a.nome AS artista, a.tipo, d.titolo, d.formato, d.barcode
	FROM disco d
		JOIN artista a ON (d.ID_autore = a.ID)
    WHERE a.nome = nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dischi_per_titolo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dischi_per_titolo`(titolo VARCHAR(50))
BEGIN
	SELECT a.nome as artista, d.titolo, d.formato, d.barcode
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
    WHERE d.titolo = titolo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `minuti_artista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `minuti_artista`(ID_artista INTEGER)
BEGIN
	SELECT a.nome, SEC_TO_TIME(SUM(TIME_TO_SEC(t.durata))) as minuti_totali
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
        JOIN traccia t ON (d.ID = t.ID_disco)
    WHERE c.visibilita = 'pubblica' AND ID_artista = a.ID
    GROUP BY a.nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `num_tracce_artista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `num_tracce_artista`(ID_artista INTEGER)
BEGIN
	SELECT a.nome, COUNT(DISTINCT t.titolo) as numero_brani
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
        JOIN traccia t ON (d.ID = t.ID_disco)
    WHERE c.visibilita = 'pubblica' AND ID_artista = a.ID
    GROUP BY a.nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tracklist_disco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tracklist_disco`(ID INTEGER UNSIGNED)
BEGIN
	SELECT t.numero, t.titolo, t.durata
	FROM traccia t
	WHERE ID_disco = ID
	ORDER BY t.numero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verifica_visibilita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifica_visibilita`(ID_collezionista INTEGER, ID_collezione INTEGER)
BEGIN
	(
		SELECT collezione.nome, collezione.visibilita
		FROM collezione
		WHERE ID_collezionista = collezione.ID_collezionista 
			AND ID_collezione = collezione.ID
	)
	UNION
	(
		SELECT collezione.nome, collezione.visibilita
		FROM collezione
		WHERE ID_collezione = collezione.ID 
			AND collezione.visibilita = 'pubblica'
	)
	UNION
	(
		SELECT collezione.nome, 'Condivisa con te' AS visibilita
		FROM collezione, condivisione
		WHERE ID_collezione = condivisione.ID_collezione 
			AND ID_collezionista = condivisione.ID_collezionista 
			AND ID_collezione = collezione.ID
	)
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-04 19:57:37
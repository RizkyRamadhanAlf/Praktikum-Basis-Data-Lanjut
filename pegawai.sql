-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: pegawai_1
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `bagian`
--

DROP TABLE IF EXISTS `bagian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bagian` (
  `Kode_Bag` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `Nama_Bag` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Kode_Bag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bagian`
--

LOCK TABLES `bagian` WRITE;
/*!40000 ALTER TABLE `bagian` DISABLE KEYS */;
INSERT INTO `bagian` VALUES ('1','Teknologi Informasi'),('2','Pemasaran'),('3','Produksi'),('4','SDM'),('5','Akunting');
/*!40000 ALTER TABLE `bagian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `data_pekerjaan`
--

DROP TABLE IF EXISTS `data_pekerjaan`;
/*!50001 DROP VIEW IF EXISTS `data_pekerjaan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `data_pekerjaan` AS SELECT 
 1 AS `kode_pekerjaan`,
 1 AS `nip`,
 1 AS `nama`,
 1 AS `kota`,
 1 AS `nama_bag`,
 1 AS `nama_pekerjaan`,
 1 AS `tgl_masuk`,
 1 AS `gaji`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `data_pribadi`
--

DROP TABLE IF EXISTS `data_pribadi`;
/*!50001 DROP VIEW IF EXISTS `data_pribadi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `data_pribadi` AS SELECT 
 1 AS `Nip`,
 1 AS `Nama`,
 1 AS `Tgl_Lahir`,
 1 AS `Alamat`,
 1 AS `Kota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pegawai_gaji`
--

DROP TABLE IF EXISTS `pegawai_gaji`;
/*!50001 DROP VIEW IF EXISTS `pegawai_gaji`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pegawai_gaji` AS SELECT 
 1 AS `nama`,
 1 AS `nip`,
 1 AS `gaji`,
 1 AS `nama_pekerjaan`,
 1 AS `nama_bag`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pekerjaan`
--

DROP TABLE IF EXISTS `pekerjaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pekerjaan` (
  `kode_pekerjaan` int NOT NULL AUTO_INCREMENT,
  `NIP` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Tgl_masuk` date DEFAULT NULL,
  `Kode_Bag` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `Nama_Pekerjaan` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Gaji` int DEFAULT NULL,
  PRIMARY KEY (`kode_pekerjaan`),
  KEY `NIP` (`NIP`),
  KEY `Kode_Bag` (`Kode_Bag`),
  CONSTRAINT `pekerjaan_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `pribadi` (`Nip`),
  CONSTRAINT `pekerjaan_ibfk_2` FOREIGN KEY (`Kode_Bag`) REFERENCES `bagian` (`Kode_Bag`)
) ENGINE=InnoDB AUTO_INCREMENT=12355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pekerjaan`
--

LOCK TABLES `pekerjaan` WRITE;
/*!40000 ALTER TABLE `pekerjaan` DISABLE KEYS */;
INSERT INTO `pekerjaan` VALUES (1,'12345','1992-02-02','3','Manager',2000000),(2,'12346','1992-02-02','1','Asisten Manager',1500000),(3,'12347','1992-02-02','2','Kepala Sesi',1200000),(4,'12348','1992-02-02','4','Asisten Manager',1500000),(5,'12349','1992-02-02','5','Kepala Sesi',1200000),(6,'12350','1992-02-02','2','Manager',2300000),(7,'12351','1992-02-02','1','Kepala Sesi',1400000),(8,'12352','1992-02-02','2','Kepala Sesi',3200000),(9,'12353','1992-02-02','4','Kepala Sesi',2400000),(10,'12354','1992-02-02','5','Manager',4300000);
/*!40000 ALTER TABLE `pekerjaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pribadi`
--

DROP TABLE IF EXISTS `pribadi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pribadi` (
  `Nip` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `Nama` varchar(35) COLLATE utf8mb4_general_ci NOT NULL,
  `Tgl_lahir` date DEFAULT NULL,
  `kelamin` enum('P','W') COLLATE utf8mb4_general_ci DEFAULT 'P',
  `Alamat` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kota` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Bisa_Bhs_Asing` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pribadi`
--

LOCK TABLES `pribadi` WRITE;
/*!40000 ALTER TABLE `pribadi` DISABLE KEYS */;
INSERT INTO `pribadi` VALUES ('12345','A. Hamzah Sianturi','1965-12-23','P','Jl. Kudus 1','Yogya',0),('12346','Udinsah','1978-01-12','P','Jl. Masjid 47','Sleman',0),('12347','Siti Umayani','0000-00-00','W','NULL','NULL',0),('12348','Dian Arum','1969-03-14','W','Jl. Arumdalu 23','Bantul',0),('12349','Bagus','1966-05-13','P','Karangwaru I/3','Magelang',0),('12350','Intan','1975-02-01','W','Jl. Sawo 108','Yogya',0),('12351','Edi Damhudi','1971-04-05','P','Ngampilan 2A','Sleman',0),('12352','Sinta','1969-04-29','W','Jl. Kertosono 87','Klaten',0),('12353','Sueb','1971-07-04','P','Jl. Astina 4A','Yogya',0),('12354','Joned','1978-05-05','P','Jl. Karyacita 9','Yogya',0),('12361','Edi harahap',NULL,'',NULL,NULL,0),('12370','Fahmi Idris',NULL,'P',NULL,NULL,0);
/*!40000 ALTER TABLE `pribadi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pribadi_pekerjaan`
--

DROP TABLE IF EXISTS `pribadi_pekerjaan`;
/*!50001 DROP VIEW IF EXISTS `pribadi_pekerjaan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pribadi_pekerjaan` AS SELECT 
 1 AS `nama`,
 1 AS `nip`,
 1 AS `tgl_masuk`,
 1 AS `nama_pekerjaan`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `riwayat`
--

DROP TABLE IF EXISTS `riwayat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat` (
  `Kode_Riwayat` int NOT NULL AUTO_INCREMENT,
  `Nip` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ket` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Kode_Riwayat`),
  KEY `Nip` (`Nip`),
  CONSTRAINT `riwayat_ibfk_1` FOREIGN KEY (`Nip`) REFERENCES `pribadi` (`Nip`)
) ENGINE=InnoDB AUTO_INCREMENT=12355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat`
--

LOCK TABLES `riwayat` WRITE;
/*!40000 ALTER TABLE `riwayat` DISABLE KEYS */;
INSERT INTO `riwayat` VALUES (12345,'12345','SMA XEVERIUS 1'),(12346,'12346','SMA XEVERIUS 2'),(12347,'12347','SMA UNGGUL SAKTI'),(12348,'12348','SMA BINA KASIH'),(12349,'12349','SMA PELITA RAYA'),(12350,'12350','SMA NURUL ILMI'),(12351,'12351','SMA AL-FALAH'),(12352,'12352','KANAAN GLOBAL SCHOOL'),(12353,'12353','SMA 1 KOTA'),(12354,'12354','SMA 2 KOTA');
/*!40000 ALTER TABLE `riwayat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `data_pekerjaan`
--

/*!50001 DROP VIEW IF EXISTS `data_pekerjaan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_pekerjaan` AS select `pk`.`kode_pekerjaan` AS `kode_pekerjaan`,`p`.`Nip` AS `nip`,`p`.`Nama` AS `nama`,`p`.`kota` AS `kota`,`b`.`Nama_Bag` AS `nama_bag`,`pk`.`Nama_Pekerjaan` AS `nama_pekerjaan`,`pk`.`Tgl_masuk` AS `tgl_masuk`,`pk`.`Gaji` AS `gaji` from ((`pekerjaan` `pk` join `pribadi` `p` on((`pk`.`NIP` = `p`.`Nip`))) join `bagian` `b` on((`pk`.`Kode_Bag` = `b`.`Kode_Bag`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `data_pribadi`
--

/*!50001 DROP VIEW IF EXISTS `data_pribadi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_pribadi` AS select `pribadi`.`Nip` AS `Nip`,`pribadi`.`Nama` AS `Nama`,`pribadi`.`Tgl_lahir` AS `Tgl_Lahir`,`pribadi`.`Alamat` AS `Alamat`,`pribadi`.`kota` AS `Kota` from `pribadi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pegawai_gaji`
--

/*!50001 DROP VIEW IF EXISTS `pegawai_gaji`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pegawai_gaji` AS select `a`.`Nama` AS `nama`,`a`.`Nip` AS `nip`,`b`.`Gaji` AS `gaji`,`b`.`Nama_Pekerjaan` AS `nama_pekerjaan`,`c`.`Nama_Bag` AS `nama_bag` from ((`pribadi` `a` join `pekerjaan` `b` on((`a`.`Nip` = `b`.`NIP`))) join `bagian` `c` on((`b`.`Kode_Bag` = `c`.`Kode_Bag`))) order by `b`.`Gaji` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pribadi_pekerjaan`
--

/*!50001 DROP VIEW IF EXISTS `pribadi_pekerjaan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pribadi_pekerjaan` AS select `a`.`Nama` AS `nama`,`a`.`Nip` AS `nip`,`b`.`Tgl_masuk` AS `tgl_masuk`,`b`.`Nama_Pekerjaan` AS `nama_pekerjaan` from (`pribadi` `a` join `pekerjaan` `b` on((`a`.`Nip` = `b`.`NIP`))) */;
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

-- Dump completed on 2025-12-29 16:21:02

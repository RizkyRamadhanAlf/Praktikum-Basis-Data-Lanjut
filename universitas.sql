-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: universitas
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
-- Temporary view structure for view `dosen1`
--

DROP TABLE IF EXISTS `dosen1`;
/*!50001 DROP VIEW IF EXISTS `dosen1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dosen1` AS SELECT 
 1 AS `nip`,
 1 AS `namains`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instruktur`
--

DROP TABLE IF EXISTS `instruktur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruktur` (
  `NIP` char(5) NOT NULL,
  `Namains` varchar(30) NOT NULL,
  `Jurusan` varchar(20) NOT NULL,
  `Asalkota` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruktur`
--

LOCK TABLES `instruktur` WRITE;
/*!40000 ALTER TABLE `instruktur` DISABLE KEYS */;
INSERT INTO `instruktur` VALUES ('1','Steve Wozniak','Ilmu Komputer','Bantul'),('2','Steve Jobs','Seni Rupa','Solo'),('3','James Gosling','Ilmu Komputer','Klaten'),('4','Bill Gates','Ilmu Komputer','Magelang');
/*!40000 ALTER TABLE `instruktur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `jumlahmk_instruktur`
--

DROP TABLE IF EXISTS `jumlahmk_instruktur`;
/*!50001 DROP VIEW IF EXISTS `jumlahmk_instruktur`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jumlahmk_instruktur` AS SELECT 
 1 AS `nip`,
 1 AS `namains`,
 1 AS `jumlah_mata_kuliah`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kuliah1`
--

DROP TABLE IF EXISTS `kuliah1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kuliah1` (
  `NIP` char(5) NOT NULL,
  `NOMK` char(10) NOT NULL,
  `Ruangan` char(5) DEFAULT NULL,
  `jmlmhs` int DEFAULT NULL,
  KEY `NIP` (`NIP`),
  KEY `NOMK` (`NOMK`),
  CONSTRAINT `kuliah1_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `instruktur` (`NIP`),
  CONSTRAINT `kuliah1_ibfk_2` FOREIGN KEY (`NOMK`) REFERENCES `matakuliah` (`nomk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kuliah1`
--

LOCK TABLES `kuliah1` WRITE;
/*!40000 ALTER TABLE `kuliah1` DISABLE KEYS */;
INSERT INTO `kuliah1` VALUES ('1','KOM101','101',50),('1','KOM102','102',35),('2','SR101','101',45),('3','KOM201','101',55);
/*!40000 ALTER TABLE `kuliah1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matakuliah`
--

DROP TABLE IF EXISTS `matakuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matakuliah` (
  `nomk` char(10) NOT NULL,
  `namamk` varchar(30) NOT NULL,
  `sks` int NOT NULL,
  PRIMARY KEY (`nomk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matakuliah`
--

LOCK TABLES `matakuliah` WRITE;
/*!40000 ALTER TABLE `matakuliah` DISABLE KEYS */;
INSERT INTO `matakuliah` VALUES ('KOM101','Algoritma Pemgrograman',3),('KOM102','Basis Data',3),('KOM201','Pemrograman Berorientasi Objek',3),('SR101','Desain Elementer',3);
/*!40000 ALTER TABLE `matakuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `matakuliah1`
--

DROP TABLE IF EXISTS `matakuliah1`;
/*!50001 DROP VIEW IF EXISTS `matakuliah1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `matakuliah1` AS SELECT 
 1 AS `nomor_mk`,
 1 AS `mata_kuliah`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `matakuliah2`
--

DROP TABLE IF EXISTS `matakuliah2`;
/*!50001 DROP VIEW IF EXISTS `matakuliah2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `matakuliah2` AS SELECT 
 1 AS `matakuliah`,
 1 AS `ruangan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `nipdosen`
--

DROP TABLE IF EXISTS `nipdosen`;
/*!50001 DROP VIEW IF EXISTS `nipdosen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nipdosen` AS SELECT 
 1 AS `nip`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `nipdosen2`
--

DROP TABLE IF EXISTS `nipdosen2`;
/*!50001 DROP VIEW IF EXISTS `nipdosen2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nipdosen2` AS SELECT 
 1 AS `nip`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_instruktur_belum_mengampu`
--

DROP TABLE IF EXISTS `view_instruktur_belum_mengampu`;
/*!50001 DROP VIEW IF EXISTS `view_instruktur_belum_mengampu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_instruktur_belum_mengampu` AS SELECT 
 1 AS `nip`,
 1 AS `namains`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `dosen1`
--

/*!50001 DROP VIEW IF EXISTS `dosen1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dosen1` AS select `a`.`NIP` AS `nip`,`a`.`Namains` AS `namains` from ((`instruktur` `a` join `kuliah1` `b` on((`a`.`NIP` = `b`.`NIP`))) join `matakuliah` `c` on((`b`.`NOMK` = `c`.`nomk`))) where (`c`.`namamk` = 'Basis Data') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jumlahmk_instruktur`
--

/*!50001 DROP VIEW IF EXISTS `jumlahmk_instruktur`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jumlahmk_instruktur` AS select `i`.`NIP` AS `nip`,`i`.`Namains` AS `namains`,count(`k`.`NOMK`) AS `jumlah_mata_kuliah` from (`instruktur` `i` left join `kuliah1` `k` on((`i`.`NIP` = `k`.`NIP`))) group by `i`.`NIP`,`i`.`Namains` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `matakuliah1`
--

/*!50001 DROP VIEW IF EXISTS `matakuliah1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `matakuliah1` AS select `b`.`nomk` AS `nomor_mk`,`b`.`namamk` AS `mata_kuliah` from (`matakuliah` `b` join `kuliah1` `c` on((`c`.`NOMK` = `b`.`nomk`))) where (`c`.`jmlmhs` > '40') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `matakuliah2`
--

/*!50001 DROP VIEW IF EXISTS `matakuliah2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `matakuliah2` AS select `a`.`namamk` AS `matakuliah`,`b`.`Ruangan` AS `ruangan` from ((`matakuliah` `a` join `kuliah1` `b` on((`a`.`nomk` = `b`.`NOMK`))) join `instruktur` `c` on((`b`.`NIP` = `c`.`NIP`))) where (`c`.`Namains` = 'Steve Jobs') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nipdosen`
--

/*!50001 DROP VIEW IF EXISTS `nipdosen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nipdosen` AS select `a`.`NIP` AS `nip` from (`instruktur` `a` join `kuliah1` `b` on((`a`.`NIP` = `b`.`NIP`))) where (`b`.`NOMK` = 'KOM102') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nipdosen2`
--

/*!50001 DROP VIEW IF EXISTS `nipdosen2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nipdosen2` AS select `a`.`NIP` AS `nip` from (`kuliah1` `a` join `matakuliah` `b` on((`a`.`NOMK` = `b`.`nomk`))) where (`b`.`namamk` = 'Basis Data') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_instruktur_belum_mengampu`
--

/*!50001 DROP VIEW IF EXISTS `view_instruktur_belum_mengampu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_instruktur_belum_mengampu` AS select `f`.`NIP` AS `nip`,`f`.`Namains` AS `namains` from (`instruktur` `f` left join `kuliah1` `g` on((`f`.`NIP` = `g`.`NIP`))) where (`g`.`NIP` is null) */;
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

-- Dump completed on 2025-12-29 16:22:40

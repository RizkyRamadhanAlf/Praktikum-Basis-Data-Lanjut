-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ujian
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
-- Table structure for table `dosen`
--

DROP TABLE IF EXISTS `dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dosen` (
  `nip` varchar(20) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES ('1123','hanif'),('1124','fayid'),('1125','aslam'),('1127','khansa'),('1128','azkia'),('1129','hanifah');
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kuliah`
--

DROP TABLE IF EXISTS `kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kuliah` (
  `kode_kuliah` varchar(10) NOT NULL,
  `kode_mk` varchar(10) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `thn_akademik` varchar(9) NOT NULL,
  `ruang` varchar(20) DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `semester` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_kuliah`),
  KEY `fk_kuliah_mk` (`kode_mk`),
  KEY `fk_kuliah_dosen` (`nip`),
  CONSTRAINT `fk_kuliah_dosen` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_kuliah_mk` FOREIGN KEY (`kode_mk`) REFERENCES `matakuliah` (`kode_mk`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kuliah`
--

LOCK TABLES `kuliah` WRITE;
/*!40000 ALTER TABLE `kuliah` DISABLE KEYS */;
INSERT INTO `kuliah` VALUES ('a1','mik11','1129','2012/2013','u201','08:00:00','ganjil'),('a2','mik12','1124','2012/2013','u204','11:00:00','ganjil'),('a3','mik13','1125','2012/2013','u205','09:00:00','ganjil'),('a4','mik14','1123','2012/2013','u201','11:00:00','genap'),('a5','mik23','1128','2012/2013','u206','13:00:00','genap'),('a6','mik24','1129','2012/2013','u203','09:00:00','genap');
/*!40000 ALTER TABLE `kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahasiswa` (
  `nim` varchar(15) NOT NULL,
  `nama_mhs` varchar(100) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `fk_dosen_wali` (`nip`),
  CONSTRAINT `fk_dosen_wali` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES ('10','gilbratac','1123'),('11','aslam','1123'),('12','kamil','1124'),('13','yunita','1128'),('14','gella','1128'),('15','nia','1123'),('16','sari','1127'),('17','dewi','1127'),('18','norma','1129'),('19','rianti','1125');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matakuliah`
--

DROP TABLE IF EXISTS `matakuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matakuliah` (
  `kode_mk` varchar(10) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL,
  `sks` int NOT NULL,
  PRIMARY KEY (`kode_mk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matakuliah`
--

LOCK TABLES `matakuliah` WRITE;
/*!40000 ALTER TABLE `matakuliah` DISABLE KEYS */;
INSERT INTO `matakuliah` VALUES ('mik11','metstat',2),('mik12','basis data',3),('mik13','alpro',3),('mik14','kalkulus',3),('mik23','TK',1),('mik24','IMK',3);
/*!40000 ALTER TABLE `matakuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nilai` (
  `kode_kuliah` varchar(10) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `nilai` varchar(2) NOT NULL,
  PRIMARY KEY (`kode_kuliah`,`nim`),
  KEY `fk_nilai_mahasiswa` (`nim`),
  CONSTRAINT `fk_nilai_kuliah` FOREIGN KEY (`kode_kuliah`) REFERENCES `kuliah` (`kode_kuliah`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nilai_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilai`
--

LOCK TABLES `nilai` WRITE;
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
INSERT INTO `nilai` VALUES ('a1','10','90'),('a1','11','88'),('a1','12','60'),('a1','13','87'),('a1','14','64'),('a1','15','70'),('a2','10','78'),('a2','11','40'),('a2','12','67'),('a2','13','56'),('a2','14','89'),('a2','15','90'),('a3','10','80'),('a3','11','85'),('a3','12','54'),('a3','13','88'),('a3','14','66'),('a3','15','45'),('a4','10','77'),('a4','11','86'),('a4','12','95'),('a4','13','67'),('a4','14','77'),('a4','15','60');
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 15:58:14

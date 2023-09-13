-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: medicationmanagement
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `diadasemana`
--

DROP TABLE IF EXISTS `diadasemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diadasemana` (
  `Nome` varchar(255) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diadasemana`
--

LOCK TABLES `diadasemana` WRITE;
/*!40000 ALTER TABLE `diadasemana` DISABLE KEYS */;
INSERT INTO `diadasemana` VALUES ('Domingo'),('Quarta'),('Quinta'),('Sabado'),('Segunda'),('Sexta'),('Terca');
/*!40000 ALTER TABLE `diadasemana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `Nome` varchar(255) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES ('Almoco'),('Jantar'),('Jejum'),('Pequeno almoco');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idoso`
--

DROP TABLE IF EXISTS `idoso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idoso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idoso`
--

LOCK TABLES `idoso` WRITE;
/*!40000 ALTER TABLE `idoso` DISABLE KEYS */;
INSERT INTO `idoso` VALUES (1,'Tom Smith','1954-12-10','tom.smith@gmail.com','123456'),(2,'Anna Hardy','1945-09-07','anna.hardy14@outlook.com','cat1');
/*!40000 ALTER TABLE `idoso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idoso_medicamento`
--

DROP TABLE IF EXISTS `idoso_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idoso_medicamento` (
  `Idoso_Id` int NOT NULL,
  `Medicamento_Id` int NOT NULL,
  PRIMARY KEY (`Idoso_Id`,`Medicamento_Id`),
  KEY `fk_Idoso_has_Medicamento_Medicamento1_idx` (`Medicamento_Id`),
  KEY `fk_Idoso_has_Medicamento_Idoso_idx` (`Idoso_Id`),
  CONSTRAINT `fk_Idoso_has_Medicamento_Idoso` FOREIGN KEY (`Idoso_Id`) REFERENCES `idoso` (`Id`),
  CONSTRAINT `fk_Idoso_has_Medicamento_Medicamento1` FOREIGN KEY (`Medicamento_Id`) REFERENCES `medicamento` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idoso_medicamento`
--

LOCK TABLES `idoso_medicamento` WRITE;
/*!40000 ALTER TABLE `idoso_medicamento` DISABLE KEYS */;
INSERT INTO `idoso_medicamento` VALUES (1,1);
/*!40000 ALTER TABLE `idoso_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idoso_medicamento_diadasemana`
--

DROP TABLE IF EXISTS `idoso_medicamento_diadasemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idoso_medicamento_diadasemana` (
  `Idoso_Id` int NOT NULL,
  `Medicamento_Id` int NOT NULL,
  `DiaSemana` varchar(255) NOT NULL,
  PRIMARY KEY (`Idoso_Id`,`Medicamento_Id`,`DiaSemana`),
  KEY `fk_Idoso_Medicamento_has_DiaDaSemana_DiaDaSemana1_idx` (`DiaSemana`),
  KEY `fk_Idoso_Medicamento_has_DiaDaSemana_Idoso_Medicamento1_idx` (`Idoso_Id`,`Medicamento_Id`),
  CONSTRAINT `fk_Idoso_Medicamento_has_DiaDaSemana_DiaDaSemana1` FOREIGN KEY (`DiaSemana`) REFERENCES `diadasemana` (`Nome`),
  CONSTRAINT `fk_Idoso_Medicamento_has_DiaDaSemana_Idoso_Medicamento1` FOREIGN KEY (`Idoso_Id`, `Medicamento_Id`) REFERENCES `idoso_medicamento` (`Idoso_Id`, `Medicamento_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idoso_medicamento_diadasemana`
--

LOCK TABLES `idoso_medicamento_diadasemana` WRITE;
/*!40000 ALTER TABLE `idoso_medicamento_diadasemana` DISABLE KEYS */;
INSERT INTO `idoso_medicamento_diadasemana` VALUES (1,1,'Quarta'),(1,1,'Segunda');
/*!40000 ALTER TABLE `idoso_medicamento_diadasemana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idoso_medicamento_diadasemana_horario`
--

DROP TABLE IF EXISTS `idoso_medicamento_diadasemana_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idoso_medicamento_diadasemana_horario` (
  `Idoso_Id` int NOT NULL,
  `Medicamento_Id` int NOT NULL,
  `DiaSemana` varchar(255) NOT NULL,
  `Horario` varchar(255) NOT NULL,
  `Quantidade` int DEFAULT NULL,
  `Notas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idoso_Id`,`Medicamento_Id`,`DiaSemana`,`Horario`),
  KEY `fk_Idoso_Medicamento_DiaDaSemana_has_Horario_Horario1_idx` (`Horario`),
  KEY `fk_Idoso_Medicamento_DiaDaSemana_has_Horario_Idoso_Medicame_idx` (`Idoso_Id`,`Medicamento_Id`,`DiaSemana`),
  CONSTRAINT `fk_Idoso_Medicamento_DiaDaSemana_has_Horario_Horario1` FOREIGN KEY (`Horario`) REFERENCES `horario` (`Nome`),
  CONSTRAINT `fk_Idoso_Medicamento_DiaDaSemana_has_Horario_Idoso_Medicament1` FOREIGN KEY (`Idoso_Id`, `Medicamento_Id`, `DiaSemana`) REFERENCES `idoso_medicamento_diadasemana` (`Idoso_Id`, `Medicamento_Id`, `DiaSemana`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idoso_medicamento_diadasemana_horario`
--

LOCK TABLES `idoso_medicamento_diadasemana_horario` WRITE;
/*!40000 ALTER TABLE `idoso_medicamento_diadasemana_horario` DISABLE KEYS */;
INSERT INTO `idoso_medicamento_diadasemana_horario` VALUES (1,1,'Quarta','Jantar',1,'Ir dormir a seguir'),(1,1,'Segunda','Almoco',1,'Tomar devagar');
/*!40000 ALTER TABLE `idoso_medicamento_diadasemana_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Designacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1,'Brufen'),(2,'Paracetamol 500 mg'),(3,'Triazol');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-11 10:39:52

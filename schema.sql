-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: making_the_grade
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
-- Table structure for table `adviceitem`
--

DROP TABLE IF EXISTS `adviceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adviceitem` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `TopicID` int NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Content` text NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ItemID`),
  KEY `fk_item_topic` (`TopicID`),
  CONSTRAINT `fk_item_topic` FOREIGN KEY (`TopicID`) REFERENCES `advicetopic` (`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adviceitem`
--

LOCK TABLES `adviceitem` WRITE;
/*!40000 ALTER TABLE `adviceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `adviceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advicetopic`
--

DROP TABLE IF EXISTS `advicetopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advicetopic` (
  `TopicID` int NOT NULL AUTO_INCREMENT,
  `TopicName` varchar(120) NOT NULL,
  PRIMARY KEY (`TopicID`),
  UNIQUE KEY `TopicName` (`TopicName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advicetopic`
--

LOCK TABLES `advicetopic` WRITE;
/*!40000 ALTER TABLE `advicetopic` DISABLE KEYS */;
/*!40000 ALTER TABLE `advicetopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celebration`
--

DROP TABLE IF EXISTS `celebration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celebration` (
  `CelebrationID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int NOT NULL,
  `Date` date NOT NULL,
  `AchievementTitle` varchar(160) NOT NULL,
  `Notes` text,
  PRIMARY KEY (`CelebrationID`),
  KEY `fk_celebration_student` (`StudentID`),
  CONSTRAINT `fk_celebration_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celebration`
--

LOCK TABLES `celebration` WRITE;
/*!40000 ALTER TABLE `celebration` DISABLE KEYS */;
/*!40000 ALTER TABLE `celebration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `OfficeID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Role` varchar(80) NOT NULL,
  `Email` varchar(120) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_employee_office` (`OfficeID`),
  CONSTRAINT `fk_employee_office` FOREIGN KEY (`OfficeID`) REFERENCES `office` (`OfficeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `GoalID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int NOT NULL,
  `GoalTitle` varchar(150) NOT NULL,
  `GoalDesc` text,
  `StartDate` date DEFAULT NULL,
  `TargetDate` date DEFAULT NULL,
  `Status` varchar(30) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`GoalID`),
  KEY `fk_goal_student` (`StudentID`),
  CONSTRAINT `fk_goal_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `OfficeID` int NOT NULL AUTO_INCREMENT,
  `State` varchar(40) NOT NULL,
  `City` varchar(80) NOT NULL,
  `Address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`OfficeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent` (
  `ParentID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ParentID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progressentry`
--

DROP TABLE IF EXISTS `progressentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progressentry` (
  `ProgressID` int NOT NULL AUTO_INCREMENT,
  `GoalID` int NOT NULL,
  `EntryDate` date NOT NULL,
  `Notes` text,
  PRIMARY KEY (`ProgressID`),
  KEY `fk_progress_goal` (`GoalID`),
  CONSTRAINT `fk_progress_goal` FOREIGN KEY (`GoalID`) REFERENCES `goal` (`GoalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressentry`
--

LOCK TABLES `progressentry` WRITE;
/*!40000 ALTER TABLE `progressentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `progressentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `ParentID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DOB` date DEFAULT NULL,
  `GradeLevel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `fk_student_parent` (`ParentID`),
  CONSTRAINT `fk_student_parent` FOREIGN KEY (`ParentID`) REFERENCES `parent` (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentteacher`
--

DROP TABLE IF EXISTS `studentteacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentteacher` (
  `StudentID` int NOT NULL,
  `TeacherID` int NOT NULL,
  PRIMARY KEY (`StudentID`,`TeacherID`),
  KEY `fk_st_teacher` (`TeacherID`),
  CONSTRAINT `fk_st_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `fk_st_teacher` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentteacher`
--

LOCK TABLES `studentteacher` WRITE;
/*!40000 ALTER TABLE `studentteacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentteacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `TeacherID` int NOT NULL AUTO_INCREMENT,
  `TeacherName` varchar(120) NOT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `SchoolName` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troublespot`
--

DROP TABLE IF EXISTS `troublespot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `troublespot` (
  `TroubleID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int NOT NULL,
  `SpotType` varchar(80) NOT NULL,
  `Description` text,
  `IdentifiedDate` date NOT NULL,
  `Status` varchar(30) NOT NULL DEFAULT 'Open',
  PRIMARY KEY (`TroubleID`),
  KEY `fk_trouble_student` (`StudentID`),
  CONSTRAINT `fk_trouble_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troublespot`
--

LOCK TABLES `troublespot` WRITE;
/*!40000 ALTER TABLE `troublespot` DISABLE KEYS */;
/*!40000 ALTER TABLE `troublespot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18  0:50:57

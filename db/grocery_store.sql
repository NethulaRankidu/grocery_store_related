-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: grocery_store
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'root','123456','Nethula Rankidu','2025-07-21 11:23:24');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `cashier_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `fk_bill_admin1_idx` (`cashier_id`),
  KEY `fk_bill_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_bill_admin1` FOREIGN KEY (`cashier_id`) REFERENCES `admin` (`user_id`),
  CONSTRAINT `fk_bill_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (5,1,2,'2025-07-05 17:52:09',400),(6,1,3,'2025-07-06 20:35:01',2400),(8,1,3,'2025-07-06 21:47:22',400),(10,1,3,'2025-07-06 21:51:43',400),(11,1,3,'2025-07-06 21:52:13',400),(12,1,3,'2025-07-06 21:56:07',400),(13,1,3,'2025-07-06 22:01:38',400),(14,1,2,'2025-07-06 22:09:39',400),(15,1,2,'2025-07-06 22:10:40',400),(17,1,3,'2025-07-06 22:13:12',400),(18,1,3,'2025-07-06 22:18:37',400),(19,1,1,'2025-07-06 22:21:55',400),(20,1,1,'2025-07-06 22:24:08',400),(21,1,3,'2025-07-06 22:30:26',400),(22,1,3,'2025-07-06 22:35:14',400),(24,1,3,'2025-07-06 22:39:13',400),(25,1,2,'2025-07-08 20:51:56',2000),(26,1,2,'2025-07-08 20:55:20',800),(27,1,2,'2025-07-12 14:07:58',800),(28,1,2,'2025-07-13 13:36:36',400),(29,1,3,'2025-07-16 19:23:29',400);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `added_by` int NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_category_admin1_idx` (`added_by`),
  CONSTRAINT `fk_category_admin1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Fruits',1),(2,'Vegetables',1),(3,'Dairy Products',1),(4,'Bakery Items',1),(5,'Beverages',1),(6,'Snacks & Confectionery',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `birth_year` int DEFAULT NULL,
  `gender_gender_id` int NOT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customer_gender1_idx` (`gender_gender_id`),
  KEY `fk_customer_admin1_idx` (`added_by`),
  CONSTRAINT `fk_customer_admin1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`user_id`),
  CONSTRAINT `fk_customer_gender1` FOREIGN KEY (`gender_gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Guest','','',1970,3,1),(2,'Nethula Rankidu','0785949390','wintergreen6631@proton.me',2010,1,1),(3,'Sahan','','',2010,1,1),(4,'Roshan Munasinghe','0778857944','roshanmunasinghe81@gmail.com',1981,1,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(45) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Other');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_batches`
--

DROP TABLE IF EXISTS `product_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_batches` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `units` int NOT NULL,
  `expiry_date` datetime NOT NULL,
  `received_date` datetime NOT NULL,
  `product_cost` double NOT NULL,
  `product_price` double NOT NULL,
  `remaining_items` int NOT NULL,
  `bought_items` int NOT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `fk_product_batches_products1_idx` (`product_id`),
  KEY `fk_product_batches_admin1_idx` (`added_by`),
  CONSTRAINT `fk_product_batches_admin1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`user_id`),
  CONSTRAINT `fk_product_batches_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_batches`
--

LOCK TABLES `product_batches` WRITE;
/*!40000 ALTER TABLE `product_batches` DISABLE KEYS */;
INSERT INTO `product_batches` VALUES (1,1,50,'2026-01-04 09:54:22','2025-06-04 09:54:01',380,400,19,31,1),(2,12,50,'2025-09-25 13:34:44','2025-05-25 13:34:24',180,200,48,2,1);
/*!40000 ALTER TABLE `product_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_barcode` varchar(100) NOT NULL,
  `category_id` int NOT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`product_id`,`product_barcode`),
  UNIQUE KEY `product_barcode_UNIQUE` (`product_barcode`),
  KEY `fk_products_category_idx` (`category_id`),
  KEY `fk_products_admin1_idx` (`added_by`),
  CONSTRAINT `fk_products_admin1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`user_id`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Uswatte Real Cream Cracker 490g','4792135080274',3,1),(2,'Panda Baby Rathmal Baby Soap','4792054016736',5,1),(3,'Calin Gold','4796000523958',5,1),(4,'Nature\'s Secrets Panda Baby Cream','4792054001121',5,1),(5,'Jupiter Extreme Men\'s Deodrant','4791097046717',5,1),(6,'Richard Colouray 80 pages B5 Book','4792066005247',6,1),(7,'Atlas B5 80 pages book','4792210131938',6,1),(8,'BIC Shaving Foam for men','4791010004275',5,1),(9,'Kotmale Vanilla & Chocolate Flavoured Ice Cream 1l','4792090120053',4,1),(10,'Kotmale Chocolate Flavoured Ice Cream 1L','4792090030024',4,1),(11,'KIST Squeezy Tomato Sauce 400g','47921430449065',3,1),(12,'Sprite 400ml','4792229048739',3,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_items`
--

DROP TABLE IF EXISTS `sold_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sold_items` (
  `sold_id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `product_id` int NOT NULL,
  `stock_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` int NOT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`sold_id`),
  KEY `fk_sold_items_bill1_idx` (`bill_id`),
  KEY `fk_sold_items_products1_idx` (`product_id`),
  KEY `fk_sold_items_product_batches1_idx` (`stock_id`),
  KEY `fk_sold_items_admin1_idx` (`added_by`),
  CONSTRAINT `fk_sold_items_admin1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`user_id`),
  CONSTRAINT `fk_sold_items_bill1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  CONSTRAINT `fk_sold_items_product_batches1` FOREIGN KEY (`stock_id`) REFERENCES `product_batches` (`batch_id`),
  CONSTRAINT `fk_sold_items_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_items`
--

LOCK TABLES `sold_items` WRITE;
/*!40000 ALTER TABLE `sold_items` DISABLE KEYS */;
INSERT INTO `sold_items` VALUES (1,5,1,1,1,400,1),(2,6,1,1,3,400,1),(3,6,1,1,2,400,1),(4,6,1,1,1,400,1),(5,8,1,1,1,400,1),(6,10,1,1,1,400,1),(7,11,1,1,1,400,1),(8,12,1,1,1,400,1),(9,13,1,1,1,400,1),(10,14,1,1,1,400,1),(11,15,1,1,1,400,1),(12,17,1,1,1,400,1),(13,18,1,1,1,400,1),(14,19,1,1,1,400,1),(15,20,1,1,1,400,1),(16,21,1,1,1,400,1),(17,22,1,1,1,400,1),(18,24,1,1,1,400,1),(19,25,1,1,5,400,1),(20,26,1,1,2,400,1),(21,27,1,1,2,400,1),(22,28,12,2,2,200,1),(23,29,1,1,1,400,1);
/*!40000 ALTER TABLE `sold_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-21 18:54:14

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gcsm_db
-- ------------------------------------------------------
-- Server version	5.5.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gcsm_businessline`
--

DROP TABLE IF EXISTS `gcsm_businessline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_businessline` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT,
  `bl_name` varchar(255) NOT NULL,
  `bl_description` text,
  `bl_head` varchar(255) DEFAULT NULL,
  `bl_status_flag` int(1) NOT NULL,
  `bl_setup_user` varchar(255) NOT NULL,
  `bl_setup_timestamp` text NOT NULL,
  `bl_composed_user` varchar(255) DEFAULT NULL,
  `bl_composed_timestamp` text,
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_businessline`
--

LOCK TABLES `gcsm_businessline` WRITE;
/*!40000 ALTER TABLE `gcsm_businessline` DISABLE KEYS */;
INSERT INTO `gcsm_businessline` VALUES (1,'root','root','root',1,'root','2018-09-03 15:03:43','root','2018-09-03 15:03:43'),(2,'System Administration','System Administration Unit','sysadmin',1,'root','2018-09-03 16:07:18','root','2018-09-03 16:07:18'),(3,'NDB Bank','NDB Bank','Bank Head',1,'111111111V','2018-09-03 16:37:58','111111111V','2018-09-03 16:37:58'),(4,'NDB IB','NDB Investment Bank','NDB IB Head',1,'111111111V','2018-09-03 16:38:36','111111111V','2018-09-03 16:38:36'),(5,'NDB Wealth','NDB Wealth Management','Wealth Head',1,'111111111V','2018-09-03 16:39:10','111111111V','2018-09-03 16:39:10'),(6,'NDB Bank Finance','NDB Bank Finance','Finance Head',1,'111111111V','2018-09-07 09:27:31','111111111V','2018-09-07 09:27:31');
/*!40000 ALTER TABLE `gcsm_businessline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_cross_selling_details`
--

DROP TABLE IF EXISTS `gcsm_cross_selling_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_cross_selling_details` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cs_own_company` int(11) DEFAULT NULL,
  `cs_product_owner` int(11) DEFAULT NULL,
  `cs_product` int(11) DEFAULT NULL,
  `cs_product_status` varchar(45) DEFAULT NULL,
  `cs_customer_name` varchar(45) DEFAULT NULL,
  `cs_customer_nic` varchar(45) DEFAULT NULL,
  `cs_customer_contactNo` varchar(45) DEFAULT NULL,
  `cs_cid` varchar(45) DEFAULT NULL,
  `cs_fee` double DEFAULT NULL,
  `cs_emp_id` varchar(45) DEFAULT NULL,
  `cs_employee_name` varchar(45) DEFAULT NULL,
  `cs_units_sold_by` varchar(45) DEFAULT NULL,
  `cs_date` varchar(45) DEFAULT NULL,
  `cs_contract_no` varchar(45) DEFAULT NULL,
  `cs_comment` varchar(45) DEFAULT NULL,
  `cs_status` int(11) DEFAULT NULL,
  `cs_setup_user` varchar(45) DEFAULT NULL,
  `cs_setup_timestamp` datetime DEFAULT NULL,
  `cs_modified_user` varchar(45) DEFAULT NULL,
  `cs_modified_timestamp` datetime DEFAULT NULL,
  `cs_reject_reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cs_id`),
  UNIQUE KEY `cs_contract_no_UNIQUE` (`cs_contract_no`),
  KEY `cross_selling_own_company_idx` (`cs_own_company`,`cs_product_owner`),
  KEY `cross_selling_product_idx` (`cs_product`),
  KEY `cross_selling_product_owner` (`cs_product_owner`),
  CONSTRAINT `cross_selling_own_company` FOREIGN KEY (`cs_own_company`) REFERENCES `gcsm_businessline` (`bl_id`),
  CONSTRAINT `cross_selling_product` FOREIGN KEY (`cs_product`) REFERENCES `gcsm_product` (`product_id`),
  CONSTRAINT `cross_selling_product_owner` FOREIGN KEY (`cs_product_owner`) REFERENCES `gcsm_businessline` (`bl_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_cross_selling_details`
--

LOCK TABLES `gcsm_cross_selling_details` WRITE;
/*!40000 ALTER TABLE `gcsm_cross_selling_details` DISABLE KEYS */;
INSERT INTO `gcsm_cross_selling_details` VALUES (1,4,3,1,'New','tt','123456789V','24535','435fg',345,'fg','efg','fg','2018-09-03','dg','dfg',0,'444444444V','2018-09-03 18:57:28','444444444V','2018-09-03 18:57:28',NULL),(3,4,4,3,'Top-Up-1-Less','dsf','123213123V','234','35',523452345234,'fdg','dfg','dfg','2018-09-03','rewt','dsg',0,'444444444V','2018-09-03 19:01:08','444444444V','2018-09-03 19:01:08',NULL),(4,4,4,3,'Top-Up-1-2','dsf','123213123V','234','35',523452345234,'fdg','dfg','dfg','2018-09-03','rewt6','dsg',0,'444444444V','2018-09-03 19:01:09','444444444V','2018-09-03 19:01:09',NULL),(5,4,4,3,'New','asdas','234234234V','asd','we',12345678910,'dswf','sd','sdf','2018-09-03','ew','sdf',0,'444444444V','2018-09-03 19:02:58','444444444V','2018-09-03 19:02:58',NULL),(6,4,5,4,'Top-Up-1-Less','gggg','921111111V','9834932','8989',45781,'sdsf','sdf','sc','2018-09-04','23','sdf',0,'444444444V','2018-09-04 09:30:37','444444444V','2018-09-04 09:30:37',NULL),(7,3,4,3,'Top-Up-1-2','zzz','123456789V','yyy','mmmm',987654321,'111111111V','frtertert','fdgdfg','2018-09-04','ttt','sss',0,'222222222V','2018-09-04 10:51:25','222222222V','2018-10-01 11:44:47',NULL),(9,3,4,6,'New','aa','123456789V','324234','ertg',500,'sdf','sadfdsf','sdfsd','2018-09-06','AA18198XMQS2','sdad',1,'211111111V','2018-09-06 17:21:08','333333333V','2018-09-07 09:32:37',' '),(10,4,3,5,'New','ttt','624373888V','fds','sdf',0,'444','dsf','sdfsd','2018-09-06','32423','dfg',0,'444444444V','2018-09-06 17:27:13','444444444V','2018-09-06 17:27:13',NULL);
/*!40000 ALTER TABLE `gcsm_cross_selling_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_individual_target_achievements`
--

DROP TABLE IF EXISTS `gcsm_individual_target_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_individual_target_achievements` (
  `achievement_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_achievement` double DEFAULT NULL,
  `liabilities_achievement` double DEFAULT NULL,
  `cs_asset_achievement` double DEFAULT NULL,
  `cs_liabilities_achievement` double DEFAULT NULL,
  `period_from_yearmonth` varchar(45) DEFAULT NULL,
  `period_to_yearmonth` varchar(45) DEFAULT NULL,
  `target_achivement_status` int(11) DEFAULT NULL,
  `setup_user` varchar(45) DEFAULT NULL,
  `setup_time` datetime DEFAULT NULL,
  `approved_rejected_user` varchar(45) DEFAULT NULL,
  `approved_rejected_time` datetime DEFAULT NULL,
  `approval_reject_comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`achievement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_individual_target_achievements`
--

LOCK TABLES `gcsm_individual_target_achievements` WRITE;
/*!40000 ALTER TABLE `gcsm_individual_target_achievements` DISABLE KEYS */;
INSERT INTO `gcsm_individual_target_achievements` VALUES (1,8001,9001,0,0,'2017-10','2018-10',-1,'888888888V','2018-10-02 12:09:11','999999999V','2018-10-01 16:52:13','jkjkhjk '),(2,6500,55000,0,3308.22,'2016-02','2019-12',0,'888888888V','2018-10-03 09:36:19',NULL,NULL,NULL),(3,3534,566,0,3308.22,'2017-07','2018-10',0,'888888888V','2018-10-03 09:36:08',NULL,NULL,NULL),(4,7878,787878,0,0,'2017-09','2018-10',0,'888888888V','2018-10-02 10:41:23',NULL,NULL,NULL),(5,36,56756,0,0,'2017-10','2018-10',0,'888888888V','2018-10-02 11:06:45',NULL,NULL,NULL),(6,23432,234234,0,0,'2017-10','2018-10',0,'888888888V','2018-10-02 12:16:57',NULL,NULL,NULL),(7,50002,100002,0,0,'2017-10','2018-10',0,'222222222V','2018-10-05 11:29:33',NULL,NULL,NULL),(8,4599,5999,0,3308.22,'2017-10','2018-10',1,'211111111V','2018-10-05 11:34:08','333333333V','2018-10-05 11:41:39','ok ');
/*!40000 ALTER TABLE `gcsm_individual_target_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_point_values`
--

DROP TABLE IF EXISTS `gcsm_point_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_point_values` (
  `point_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `point_A_upper_value` double DEFAULT NULL,
  `point_A_lower_value` double DEFAULT NULL,
  `point_B_upper_value` double DEFAULT NULL,
  `point_B_lower_value` double DEFAULT NULL,
  `point_C_upper_value` double DEFAULT NULL,
  `point_C_lower_value` double DEFAULT NULL,
  `point_D_upper_value` double DEFAULT NULL,
  `point_D_lower_value` double DEFAULT NULL,
  `point_value_status` int(11) DEFAULT NULL,
  `point_value_setup_user` varchar(45) DEFAULT NULL,
  `point_value_setup_timestamp` datetime DEFAULT NULL,
  `point_value_approve_reject_user` varchar(45) DEFAULT NULL,
  `point_value_approve_reject_timestamp` datetime DEFAULT NULL,
  `point_value_approve_reject_comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`point_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_point_values`
--

LOCK TABLES `gcsm_point_values` WRITE;
/*!40000 ALTER TABLE `gcsm_point_values` DISABLE KEYS */;
INSERT INTO `gcsm_point_values` VALUES (1,0,0,0,0,0,0,0,0,-1,'888888888V','2018-09-27 10:38:17','999999999V','2018-09-27 12:10:40','ttt '),(2,150,140,100,60,50,30,20,0,1,'888888888V','2018-09-27 10:32:20','999999999V','2018-09-27 13:18:06','hh '),(3,150,140,130,100,90,30,30,0,1,'888888888V','2018-09-27 12:12:28','999999999V','2018-09-27 12:17:03','ok '),(4,150,140,110,60,50,10,10,0,-1,'888888888V','2018-09-27 13:21:04','999999999V','2018-09-27 13:23:42','tttt '),(5,140,110,70,50,40,20,20,0,1,'888888888V','2018-09-27 13:21:47','999999999V','2018-09-27 13:42:41','new '),(6,1000,120,120,90,90,60,60,-1000,1,'888888888V','2018-09-27 13:56:06','999999999V','2018-09-27 13:56:57','tttteeessssstttt '),(7,150,120,110,80,30,10,10,-1000,0,'888888888V','2018-09-27 14:16:34',NULL,NULL,NULL);
/*!40000 ALTER TABLE `gcsm_point_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_product`
--

DROP TABLE IF EXISTS `gcsm_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_businessline` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` text,
  `product_type` varchar(45) DEFAULT NULL,
  `product_shadow_basis` varchar(45) DEFAULT NULL,
  `product_annual_fee` double DEFAULT NULL,
  `product_status_flag` int(1) DEFAULT NULL,
  `product_setup_user` varchar(255) DEFAULT NULL,
  `product_setup_timestamp` text,
  `product_composed_user` varchar(255) DEFAULT NULL,
  `product_composed_timestamp` text,
  PRIMARY KEY (`product_id`),
  KEY `product_business_line_idx` (`product_businessline`),
  CONSTRAINT `product_business_line` FOREIGN KEY (`product_businessline`) REFERENCES `gcsm_businessline` (`bl_id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_product`
--

LOCK TABLES `gcsm_product` WRITE;
/*!40000 ALTER TABLE `gcsm_product` DISABLE KEYS */;
INSERT INTO `gcsm_product` VALUES (1,3,'Savings Account','Regular Savings Account','Liability','Fee Income',0,1,'111111111V','2018-09-03 17:08:43','111111111V','2018-10-01 11:10:34'),(2,3,'Term Deposit','Fixed Deposits','Liability','Fee Income',0,1,'111111111V','2018-09-03 17:09:16','111111111V','2018-10-01 11:28:40'),(3,4,'NDB IB Savings','IB Savings Account','Liability','Net Interest Income (NII)',0,1,'111111111V','2018-09-03 17:09:48','111111111V','2018-10-01 11:30:31'),(4,5,'Wealth Fund','NDBW Wealth Management Fund','Asset','Net Interest Income (NII)',0,1,'111111111V','2018-09-03 17:10:14','111111111V','2018-10-01 11:30:50'),(5,3,'Credit Card','Gold Credit Card','Asset','Annual Fee',1000,1,'111111111V','2018-09-04 16:53:56','111111111V','2018-10-01 11:29:08'),(6,4,'FIxed Deposit With IB','Combine FD','Liability','NII Fee Income',100,1,'111111111V','2018-09-06 14:46:11','111111111V','2018-10-01 11:30:42'),(7,5,'Platinum Credit Card','Platinum Credit Card','Asset','Annual Fee',5000,1,'111111111V','2018-09-06 17:08:45','111111111V','2018-10-01 11:30:57'),(9,3,'DML','DM Loan','Asset','NII Fee Income',0,1,'111111111V','2018-10-01 11:22:53','111111111V','2018-10-01 11:29:20');
/*!40000 ALTER TABLE `gcsm_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_reward_calculation_status`
--

DROP TABLE IF EXISTS `gcsm_reward_calculation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_reward_calculation_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL COMMENT '0 for not yet started\n1 for started\n2 for closed',
  `initiated_user` varchar(45) DEFAULT NULL,
  `initiated_timestamp` datetime DEFAULT NULL,
  `closed_user` varchar(45) DEFAULT NULL,
  `modified_timestamp` datetime DEFAULT NULL,
  `period_from_yearmonth` varchar(45) DEFAULT NULL,
  `period_to_yearmonth` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_reward_calculation_status`
--

LOCK TABLES `gcsm_reward_calculation_status` WRITE;
/*!40000 ALTER TABLE `gcsm_reward_calculation_status` DISABLE KEYS */;
INSERT INTO `gcsm_reward_calculation_status` VALUES (1,1,NULL,NULL,NULL,NULL,'2017-10','2018-10');
/*!40000 ALTER TABLE `gcsm_reward_calculation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_reward_values`
--

DROP TABLE IF EXISTS `gcsm_reward_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_reward_values` (
  `reward_product_id` int(11) NOT NULL,
  `reward_level` varchar(45) DEFAULT NULL,
  `tier1_reward_calc_method` varchar(100) DEFAULT NULL,
  `tier1_reward_value_or_percentage` double DEFAULT NULL,
  `tier2_reward_calc_method` varchar(100) DEFAULT NULL,
  `tier2_reward_value_or_percentage` double DEFAULT NULL,
  `reward_cap_value` double DEFAULT NULL,
  `reward_1_year_less_method` varchar(100) DEFAULT NULL,
  `reward_1_year_less_percentage` double DEFAULT NULL,
  `reward_1_2_year_method` varchar(100) DEFAULT NULL,
  `reward_1_2_year_percentage` double DEFAULT NULL,
  `reward_value_status` int(11) DEFAULT NULL,
  `reward_value_setup_user` varchar(45) DEFAULT NULL,
  `reward_value_setup_timestamp` datetime DEFAULT NULL,
  `reward_value_modified_user` varchar(45) DEFAULT NULL,
  `reward_modified_timestamp` datetime DEFAULT NULL,
  `reward_value_comments` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reward_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_reward_values`
--

LOCK TABLES `gcsm_reward_values` WRITE;
/*!40000 ALTER TABLE `gcsm_reward_values` DISABLE KEYS */;
INSERT INTO `gcsm_reward_values` VALUES (3,'2','Value',10,'Percentage on Total Value',100,1212,'Percentage over the rewarded amount at Tier II level',12,'Percentage over the rewarded amount',23,2,'888888888V','2018-09-27 14:11:48','999999999V','2018-09-27 17:08:02','3333 ttt    '),(6,'1','Value',1,'null',0,10,'Percentage over the rewarded amount',40,'Percentage over the rewarded amount at Tier II level',50,1,'888888888V','2018-09-25 17:15:55','999999999V','2018-09-27 14:56:43','60 nnnnnn tt  ttt ');
/*!40000 ALTER TABLE `gcsm_reward_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_shadow_revenue`
--

DROP TABLE IF EXISTS `gcsm_shadow_revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_shadow_revenue` (
  `shadow_revenue_id` int(11) NOT NULL AUTO_INCREMENT,
  `shadow_cs_contract_no` varchar(45) DEFAULT NULL,
  `shadow_year_month` varchar(45) DEFAULT NULL,
  `shadow_NII_value` double DEFAULT NULL,
  `shadow_fee_income` double DEFAULT NULL,
  `shadow_annual_fee` double DEFAULT NULL,
  `shadow_revenue_value` double DEFAULT NULL,
  `shadow_revenue_status` int(1) DEFAULT NULL,
  `shadow_setup_user` varchar(45) DEFAULT NULL,
  `shadow_setup_timestamp` datetime DEFAULT NULL,
  `shadow_modified_user` varchar(45) DEFAULT NULL,
  `shadow_modified_timestamp` datetime DEFAULT NULL,
  `shadow_reject_reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shadow_revenue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_shadow_revenue`
--

LOCK TABLES `gcsm_shadow_revenue` WRITE;
/*!40000 ALTER TABLE `gcsm_shadow_revenue` DISABLE KEYS */;
INSERT INTO `gcsm_shadow_revenue` VALUES (10,'AA18198XMQS2','201809',0,500,0,500,1,'888888888V','2018-09-17 09:02:09','888888888V','2018-09-18 15:24:14',' '),(11,'AA18198XMQS2','201803',308.2193548387097,500,0,808.2193548387097,1,'888888888V','2018-09-17 09:20:18','888888888V','2018-09-18 15:51:08',' '),(12,'AA18198XMQS2','201804',0,500,0,500,-1,'888888888V','2018-09-17 09:20:34','888888888V','2018-09-18 15:44:41','tessssss '),(13,'AA18198XMQS2','201810',0,500,0,500,1,'888888888V','2018-09-17 09:30:39','888888888V','2018-09-18 15:24:14',' '),(14,'AA18198XMQS2','201802',0,500,0,500,0,'888888888V','2018-09-18 16:02:43','888888888V','2018-09-18 16:02:43',NULL),(15,'AA18198XMQS2','201801',0,500,0,500,0,'888888888V','2018-09-18 16:16:55','888888888V','2018-09-18 16:16:55',NULL);
/*!40000 ALTER TABLE `gcsm_shadow_revenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_user`
--

DROP TABLE IF EXISTS `gcsm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_businessline` int(11) NOT NULL,
  `user_name_first` varchar(255) DEFAULT NULL,
  `user_name_last` varchar(255) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_NIC` varchar(10) DEFAULT NULL,
  `user_EPF` int(11) DEFAULT NULL,
  `user_status_flag` int(1) DEFAULT NULL,
  `user_setup_user` varchar(255) DEFAULT NULL,
  `user_setup_timestamp` text,
  `user_auth_user` varchar(255) DEFAULT NULL,
  `user_auth_timestamp` text,
  `user_composed_user` varchar(255) DEFAULT NULL,
  `user_composed_timestamp` text,
  `user_signin_flag` int(1) NOT NULL DEFAULT '0',
  `user_designation` text,
  PRIMARY KEY (`user_id`),
  KEY `user_business_line_idx` (`user_businessline`),
  CONSTRAINT `user_business_line` FOREIGN KEY (`user_businessline`) REFERENCES `gcsm_businessline` (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_user`
--

LOCK TABLES `gcsm_user` WRITE;
/*!40000 ALTER TABLE `gcsm_user` DISABLE KEYS */;
INSERT INTO `gcsm_user` VALUES (1,1,'root','root','root','Wo7lfd09haVR2PTcqbXoiQ==','000000000V',0,1,'root','2018-09-03 15:30:56','root','2018-09-03 15:30:56','root','2018-09-03 15:30:56',1,'root'),(20,2,'admin','admin','111111111V','Wo7lfd09haVR2PTcqbXoiQ==','111111111V',1111,1,'root','2018-09-03 16:18:00','root','2018-09-03 16:21:25','111111111V','2018-10-04 08:27:32',0,'BA'),(21,3,'Bank E1','Employee','222222222V','Wo7lfd09haVR2PTcqbXoiQ==','222222222V',2222,1,'111111111V','2018-09-03 16:40:33','111111111V','2018-09-03 16:44:46','111111111V','2018-09-03 16:40:33',0,'BA'),(22,3,'Bank E2','Employee','333333333V','Wo7lfd09haVR2PTcqbXoiQ==','333333333V',3333,1,'111111111V','2018-09-03 16:41:06','111111111V','2018-09-03 16:45:01','111111111V','2018-09-03 16:41:06',0,'SBA'),(23,4,'IB E1','Employee','444444444V','Wo7lfd09haVR2PTcqbXoiQ==','444444444V',4444,1,'111111111V','2018-09-03 16:41:42','111111111V','2018-09-03 16:45:13','111111111V','2018-09-03 16:41:42',0,'JE'),(24,4,'IB E2','Employee','555555555V','Wo7lfd09haVR2PTcqbXoiQ==','555555555V',5555,1,'111111111V','2018-09-03 16:42:19','111111111V','2018-09-03 16:45:25','111111111V','2018-09-03 16:42:19',0,'E'),(25,5,'Wealth E1','Employee','666666666V','Wo7lfd09haVR2PTcqbXoiQ==','666666666V',6666,1,'111111111V','2018-09-03 16:42:59','111111111V','2018-09-03 16:46:11','111111111V','2018-09-03 16:42:59',0,'BA'),(26,5,'Wealth E2','Employee','777777777V','Wo7lfd09haVR2PTcqbXoiQ==','777777777V',7777,1,'111111111V','2018-09-03 16:43:33','111111111V','2018-09-03 16:46:27','111111111V','2018-09-03 16:43:33',0,'SBA'),(27,6,'NDB Bank','Finance Admin','888888888V','Wo7lfd09haVR2PTcqbXoiQ==','888888888V',8888,1,'111111111V','2018-09-07 09:30:08','111111111V','2018-09-07 09:30:22','111111111V','2018-09-07 09:30:08',0,'Executive'),(28,6,'NDB Bank','Finance Admin Authorizer','999999999V','Wo7lfd09haVR2PTcqbXoiQ==','999999999V',9999,1,'111111111V','2018-09-26 13:34:54','111111111V','2018-09-26 13:35:22','111111111V','2018-09-26 13:34:54',0,'Manager'),(31,3,'Bank E3','Employee','211111111V','Wo7lfd09haVR2PTcqbXoiQ==','211111111V',2111,1,'111111111V','2018-10-04 09:27:38','N/A','N/A','111111111V','2018-10-04 09:27:38',0,'JE');
/*!40000 ALTER TABLE `gcsm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_user_has_role`
--

DROP TABLE IF EXISTS `gcsm_user_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_user_has_role` (
  `user_has_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_has_role_user` int(11) NOT NULL,
  `user_has_role_type` int(11) NOT NULL,
  `user_has_role_status_flag` int(1) DEFAULT NULL,
  `user_has_role_setup_user` varchar(255) DEFAULT NULL,
  `user_has_role_setup_timestamp` text,
  `user_has_role_composed_user` varchar(255) DEFAULT NULL,
  `user_has_role_composed_timestamp` text,
  PRIMARY KEY (`user_has_role_id`),
  KEY `user_role_user_idx` (`user_has_role_user`),
  CONSTRAINT `user_role_user` FOREIGN KEY (`user_has_role_user`) REFERENCES `gcsm_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_user_has_role`
--

LOCK TABLES `gcsm_user_has_role` WRITE;
/*!40000 ALTER TABLE `gcsm_user_has_role` DISABLE KEYS */;
INSERT INTO `gcsm_user_has_role` VALUES (1,1,0,1,'root','2018-09-03 15:33:06','root','2018-09-03 15:33:06'),(2,20,1,1,'root','2018-09-03 16:21:25','111111111V','2018-10-04 15:18:52'),(3,21,3,1,'111111111V','2018-09-03 16:44:46','111111111V','2018-10-04 14:57:38'),(4,22,4,1,'111111111V','2018-09-03 16:45:01','111111111V','2018-10-05 11:40:37'),(5,23,3,1,'111111111V','2018-09-03 16:45:13','111111111V','2018-09-03 16:45:13'),(6,24,4,1,'111111111V','2018-09-03 16:45:25','111111111V','2018-09-03 16:45:25'),(7,25,3,1,'111111111V','2018-09-03 16:46:11','111111111V','2018-09-03 16:46:11'),(8,26,4,1,'111111111V','2018-09-03 16:46:27','111111111V','2018-09-03 16:46:27'),(9,27,2,1,'111111111V','2018-09-07 09:30:22','111111111V','2018-10-05 13:28:39'),(10,28,4,1,'111111111V','2018-09-26 13:35:22','111111111V','2018-09-26 13:35:22'),(17,31,3,1,'111111111V','2018-10-04 09:49:29','111111111V','2018-10-05 11:33:42');
/*!40000 ALTER TABLE `gcsm_user_has_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcsm_user_page_privilages`
--

DROP TABLE IF EXISTS `gcsm_user_page_privilages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcsm_user_page_privilages` (
  `privilage_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `page` varchar(45) DEFAULT NULL,
  `authorization_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`privilage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcsm_user_page_privilages`
--

LOCK TABLES `gcsm_user_page_privilages` WRITE;
/*!40000 ALTER TABLE `gcsm_user_page_privilages` DISABLE KEYS */;
INSERT INTO `gcsm_user_page_privilages` VALUES (1,'111111111V','Business Entities',1),(2,'111111111V','Products',1),(3,'111111111V','User Roles',1),(4,'111111111V','Users',1),(5,'111111111V','Cross Selling Management',1),(6,'111111111V','Shadow Revenue',1),(7,'111111111V','Reward Values',1),(8,'111111111V','Point Values',1),(9,'111111111V','Manage Individual Target Achievement',1),(10,'111111111V','Calculate Rewards',1),(11,'222222222V','Business Entities',0),(12,'222222222V','Products',0),(13,'222222222V','User Roles',0),(14,'222222222V','Users',0),(15,'222222222V','Cross Selling Management',1),(16,'222222222V','Shadow Revenue',0),(17,'222222222V','Reward Values',0),(18,'222222222V','Point Values',0),(19,'222222222V','Manage Individual Target Achievement',1),(20,'222222222V','Calculate Rewards',0),(21,'333333333V','Business Entities',0),(22,'333333333V','Products',0),(23,'333333333V','User Roles',0),(24,'333333333V','Users',0),(25,'333333333V','Cross Selling Management',0),(26,'333333333V','Shadow Revenue',0),(27,'333333333V','Reward Values',0),(28,'333333333V','Point Values',0),(29,'333333333V','Manage Individual Target Achievement',1),(30,'333333333V','Calculate Rewards',0),(31,'444444444V','Business Entities',0),(32,'444444444V','Products',0),(33,'444444444V','User Roles',0),(34,'444444444V','Users',0),(35,'444444444V','Cross Selling Management',0),(36,'444444444V','Shadow Revenue',0),(37,'444444444V','Reward Values',0),(38,'444444444V','Point Values',0),(39,'444444444V','Manage Individual Target Achievement',0),(40,'444444444V','Calculate Rewards',0),(41,'555555555V','Business Entities',0),(42,'555555555V','Products',0),(43,'555555555V','User Roles',0),(44,'555555555V','Users',0),(45,'555555555V','Cross Selling Management',0),(46,'555555555V','Shadow Revenue',0),(47,'555555555V','Reward Values',0),(48,'555555555V','Point Values',0),(49,'555555555V','Manage Individual Target Achievement',0),(50,'555555555V','Calculate Rewards',0),(51,'666666666V','Business Entities',0),(52,'666666666V','Products',0),(53,'666666666V','User Roles',0),(54,'666666666V','Users',0),(55,'666666666V','Cross Selling Management',0),(56,'666666666V','Shadow Revenue',0),(57,'666666666V','Reward Values',0),(58,'666666666V','Point Values',0),(59,'666666666V','Manage Individual Target Achievement',0),(60,'666666666V','Calculate Rewards',0),(61,'777777777V','Business Entities',0),(62,'777777777V','Products',0),(63,'777777777V','User Roles',0),(64,'777777777V','Users',0),(65,'777777777V','Cross Selling Management',0),(66,'777777777V','Shadow Revenue',0),(67,'777777777V','Reward Values',0),(68,'777777777V','Point Values',0),(69,'777777777V','Manage Individual Target Achievement',0),(70,'777777777V','Calculate Rewards',0),(71,'888888888V','Business Entities',0),(72,'888888888V','Products',0),(73,'888888888V','User Roles',0),(74,'888888888V','Users',0),(75,'888888888V','Cross Selling Management',1),(76,'888888888V','Shadow Revenue',0),(77,'888888888V','Reward Values',1),(78,'888888888V','Point Values',0),(79,'888888888V','Manage Individual Target Achievement',1),(80,'888888888V','Calculate Rewards',1),(81,'999999999V','Business Entities',0),(82,'999999999V','Products',0),(83,'999999999V','User Roles',0),(84,'999999999V','Users',0),(85,'999999999V','Cross Selling Management',0),(86,'999999999V','Shadow Revenue',0),(87,'999999999V','Reward Values',0),(88,'999999999V','Point Values',0),(89,'999999999V','Manage Individual Target Achievement',0),(90,'999999999V','Calculate Rewards',0),(91,'211111111V','Business Entities',0),(92,'211111111V','Products',0),(93,'211111111V','User Roles',0),(94,'211111111V','Users',0),(95,'211111111V','Cross Selling Management',0),(96,'211111111V','Shadow Revenue',0),(97,'211111111V','Reward Values',0),(98,'211111111V','Point Values',0),(99,'211111111V','Manage Individual Target Achievement',1),(100,'211111111V','Calculate Rewards',0),(101,'root','Business Entities',0),(102,'root','Products',0),(103,'root','User Roles',0),(104,'root','Users',0),(105,'root','Cross Selling Management',0),(106,'root','Shadow Revenue',0),(107,'root','Reward Values',0),(108,'root','Point Values',0),(109,'root','Manage Individual Target Achievement',0),(110,'root','Calculate Rewards',0);
/*!40000 ALTER TABLE `gcsm_user_page_privilages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gcsm_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-05 18:02:08

CREATE DATABASE  IF NOT EXISTS `GROUPSALL` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `GROUPSALL`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: GROUPSALL
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `group_cron_job`
--

DROP TABLE IF EXISTS `group_cron_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_cron_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `group_code` varchar(255) DEFAULT NULL,
  `group_event_code` varchar(255) DEFAULT NULL,
  `job_code` varchar(255) NOT NULL,
  `job_cron_expression` varchar(255) NOT NULL,
  `job_cron_name` varchar(255) NOT NULL,
  `job_description` varchar(255) NOT NULL,
  `job_name` varchar(255) NOT NULL,
  `job_query_string` varchar(255) DEFAULT NULL,
  `job_schedule_date` datetime DEFAULT NULL,
  `job_status_contact_email` varchar(255) DEFAULT NULL,
  `last_execution_date` datetime DEFAULT NULL,
  `member_category_code` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `group_member_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_code` (`job_code`),
  UNIQUE KEY `job_cron_name` (`job_cron_name`),
  KEY `FKDCE7A84CA5EAD1BC` (`group_id`),
  KEY `FKDCE7A84C5B272DC1` (`group_member_category_id`),
  CONSTRAINT `FKDCE7A84C5B272DC1` FOREIGN KEY (`group_member_category_id`) REFERENCES `group_member_category` (`id`),
  CONSTRAINT `FKDCE7A84CA5EAD1BC` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_cron_job`
--

LOCK TABLES `group_cron_job` WRITE;
/*!40000 ALTER TABLE `group_cron_job` DISABLE KEYS */;
INSERT INTO `group_cron_job` VALUES (1,'2019-07-04 16:00:44',NULL,'2020-01-19 13:55:00',NULL,'','\0',NULL,'GIE','','GIE_SMS','0 0/1 * 1/1 * ? *','CRON_SMS','SMS Job','smsProcessorJobExpress','from GroupSMS gsms where (gsms.smsingDate is null or gsms.smsingDate >= NOW() )and gsms.smsHeld = false and (gsms.smsExpirydate is null or gsms.smsExpirydate >=NOW()) and gsms.smsedDate is null ','2020-01-19 13:44:07','mevroy@gmail.com','2020-01-19 13:55:00','','2019-07-04 16:00:00','AcceptanceCriteria',NULL,NULL),(2,'2019-07-19 14:07:07',NULL,'2020-01-19 13:55:00',NULL,'','\0',NULL,'GIE','','GIE_EML','0 0/1 * 1/1 * ? *','CRON_EML','Email Job','emailProcessorJobExpress','from GroupEmail gemail where (gemail.emailExpirydate is null or gemail.emailExpirydate >= NOW()) and (gemail.emailingDate is null and gemail.emailingDate <= NOW()) and gemail.emailHeld = false and gemail.emailedDate is null and gemail.expressEmail = true','2020-01-19 13:44:07','mevroy@gmail.com','2020-01-19 13:55:00','','2019-07-19 14:06:00','AcceptanceCriteria',NULL,NULL);
/*!40000 ALTER TABLE `group_cron_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `avg_members_count` int(11) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_name` varchar(30) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `css` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `group_admin` varchar(255) DEFAULT NULL,
  `group_code` varchar(3) NOT NULL,
  `group_email_send` bit(1) DEFAULT NULL,
  `group_long_name` varchar(200) DEFAULT NULL,
  `registration_email_send` bit(1) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_code` (`group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,NULL,NULL,'2019-05-31 13:50:57',NULL,0,NULL,NULL,NULL,NULL,NULL,'2020-05-31 11:36:15',NULL,'ADM','\0','Admin','\0','2019-05-31 11:36:15'),(11,NULL,NULL,'2020-01-19 13:44:10',NULL,0,NULL,NULL,NULL,NULL,'GIES','2020-05-31 16:16:50',NULL,'GIE','\0','GIES','\0','2019-05-31 16:16:50');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_main_links`
--

DROP TABLE IF EXISTS `group_main_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_main_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `link_description` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `link_order` double DEFAULT NULL,
  `override_child_urlor_js` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_name` (`link_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_main_links`
--

LOCK TABLES `group_main_links` WRITE;
/*!40000 ALTER TABLE `group_main_links` DISABLE KEYS */;
INSERT INTO `group_main_links` VALUES (1,NULL,'','2019-05-31 16:03:08','','\0','','WIR',1,'\0'),(2,NULL,'','2019-07-04 15:41:02','','\0','','Jobs',2,'\0'),(3,NULL,'','2019-07-04 15:06:12','','\0','','Links',4,'\0'),(4,NULL,'','2019-06-02 07:59:46','','\0','','Email',3,'\0'),(5,NULL,'','2019-07-04 14:41:59','','\0','','Audit',5,'\0'),(6,NULL,'','2019-07-04 14:44:06','','\0','','Membership',1.1,'\0'),(7,NULL,'','2019-07-04 14:46:47','','\0','','SMS',1.2,'\0'),(8,NULL,'','2019-07-04 15:09:39','','\0','','Events',1.11,'\0'),(9,NULL,'','2019-07-18 22:15:48','','\0','','Pass',1.12,'\0');
/*!40000 ALTER TABLE `group_main_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `admin_user` bit(1) DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `login_count` int(11) DEFAULT NULL,
  `login_expiry_date` datetime DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `user_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2019-05-31 11:36:46',NULL,'2020-01-19 03:29:05',NULL,'\0','2020-01-19 03:29:05','0:0:0:0:0:0:0:1','mevroy@gmail.com','2020-01-19 03:21:01','0:0:0:0:0:0:0:1',43,NULL,'481370821','f865b53623b121fd34ee5426c792e5c33af8c227',NULL,'admin123'),(2,'2019-05-31 16:00:20',NULL,'2020-01-19 13:44:19',NULL,'\0','2020-01-19 13:44:19','0:0:0:0:0:0:0:1','mevan.dsouza@gmail.com','2020-01-19 12:55:42','0:0:0:0:0:0:0:1',127,NULL,'481370821','8a29de71dc9f03f2e62946cb30c314b28035d00b',NULL,'mdsouza1984');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_push_notification_template`
--

DROP TABLE IF EXISTS `group_push_notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_push_notification_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `group_code` varchar(255) NOT NULL,
  `group_event_code` varchar(255) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `member_category_code` varchar(255) DEFAULT NULL,
  `push_notifications_account_code` varchar(255) NOT NULL,
  `push_notifications_target_type` varchar(255) DEFAULT NULL,
  `template_content` text NOT NULL,
  `template_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_push_notification_template`
--

LOCK TABLES `group_push_notification_template` WRITE;
/*!40000 ALTER TABLE `group_push_notification_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_push_notification_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_reference_data`
--

DROP TABLE IF EXISTS `group_reference_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_reference_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `padding_character` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `reference_data_type` varchar(255) NOT NULL,
  `reference_data_value` varchar(255) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_data_type` (`reference_data_type`),
  KEY `FK77D709DEA5EAD1BC` (`group_id`),
  CONSTRAINT `FK77D709DEA5EAD1BC` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_reference_data`
--

LOCK TABLES `group_reference_data` WRITE;
/*!40000 ALTER TABLE `group_reference_data` DISABLE KEYS */;
INSERT INTO `group_reference_data` VALUES (1,NULL,NULL,'2020-01-19 13:47:37',NULL,'0','JOB-','JOB_CODE_2020','00052',5,NULL,11),(2,NULL,NULL,'2020-01-19 07:28:50',NULL,'0','QUOTE-','QUOTE_CODE_2020','0043',4,NULL,11),(3,NULL,NULL,'2020-01-19 07:28:50',NULL,'0','ORDER-','ORDER_CODE_2020','00043',5,NULL,11);
/*!40000 ALTER TABLE `group_reference_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_email_accounts`
--

DROP TABLE IF EXISTS `group_email_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_email_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `email_account_code` varchar(255) NOT NULL,
  `group_code` varchar(3) NOT NULL,
  `hold_emails_out` bit(1) DEFAULT NULL,
  `host` varchar(255) NOT NULL,
  `login_failed` bit(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `protocol` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_account_code` (`email_account_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_email_accounts`
--

LOCK TABLES `group_email_accounts` WRITE;
/*!40000 ALTER TABLE `group_email_accounts` DISABLE KEYS */;
INSERT INTO `group_email_accounts` VALUES (1,'2019-06-02 08:04:24',NULL,'2019-06-02 08:04:35',NULL,'MRD','GIE','\0','smtp.gmail.com','\0','Love1Nest',465,'smtps','mevan.dsouza@gmail.com');
/*!40000 ALTER TABLE `group_email_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_email_template`
--

DROP TABLE IF EXISTS `group_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_email_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `email_account_code` varchar(255) NOT NULL,
  `express_email` bit(1) DEFAULT NULL,
  `from_alias` varchar(255) DEFAULT NULL,
  `from_alias_personal_string` varchar(255) DEFAULT NULL,
  `group_code` varchar(255) NOT NULL,
  `group_event_code` varchar(255) DEFAULT NULL,
  `html` bit(1) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `member_category_code` varchar(255) DEFAULT NULL,
  `prefill_attachments` bit(1) DEFAULT NULL,
  `reply_to_email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `template_content` text NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_name` (`template_name`),
  KEY `FK5520CB7DA5EAD1BC` (`group_id`),
  CONSTRAINT `FK5520CB7DA5EAD1BC` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_email_template`
--

LOCK TABLES `group_email_template` WRITE;
/*!40000 ALTER TABLE `group_email_template` DISABLE KEYS */;
INSERT INTO `group_email_template` VALUES (1,'2019-07-16 10:19:10',NULL,'2019-07-16 10:19:10',NULL,'','','MRD','\0','mevroy@gmail.com','','GIE','','\0',NULL,'','\0','','TestMethods','[\r\n  {\r\n    \"TestMethod\": \"VT\",\r\n    \"TestMethodLabel\": \"VT\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-VT-001\",\r\n        \"ITRDocumentValue\": \"GIES-WS-VT-001\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-VT-001\",\r\n        \"ProcedureValue\": \"GIES-VT-001\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 3978\",\r\n        \"TestMethodStandardValue\": \"AS 3978\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASME V Art. 9\",\r\n        \"TestMethodStandardValue\": \"ASME V Art. 9\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASME IX QW 194\",\r\n        \"TestMethodStandardValue\": \"ASME IX QW 194\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"EN 970\",\r\n        \"TestMethodStandardValue\": \"EN 970\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.1\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.1\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.2\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.3\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.3\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.4\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.4\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.5\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.5\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.6\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.6\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME B31.3 2012 Parra 344.3.2\",\r\n        \"AcceptanceCriteriaValue\": \"ASME B31.3 2012 Parra 344.3.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1210\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1210\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 4041\",\r\n        \"AcceptanceCriteriaValue\": \"AS 4041\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 4037\",\r\n        \"AcceptanceCriteriaValue\": \"AS 4037\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME IX\",\r\n        \"AcceptanceCriteriaValue\": \"ASME IX\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AWS D1.1\",\r\n        \"AcceptanceCriteriaValue\": \"AWS D1.1\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"EN 287.2\",\r\n        \"AcceptanceCriteriaValue\": \"EN 287.2\"\r\n      }\r\n    ]\r\n  },\r\n  {\r\n    \"TestMethod\": \"PT\",\r\n    \"TestMethodLabel\": \"PT\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-PT-002\",\r\n        \"ITRDocumentValue\": \"GIES-WS-PT-002\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-PT-002\",\r\n        \"ProcedureValue\": \"GIES-PT-002\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 2062-1997\",\r\n        \"TestMethodStandardValue\": \"AS 2062-1997\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASME V - (2017) Article 6\",\r\n        \"TestMethodStandardValue\": \"ASME V - (2017) Article 6\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"EN 571-1 : 1997\",\r\n        \"TestMethodStandardValue\": \"EN 571-1 : 1997\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM E165\",\r\n        \"TestMethodStandardValue\": \"ASTM E165\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.1\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.1\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.2\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.3\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.3\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.4\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.4\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.5\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.5\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.6\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.6\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME B31.3 2016, Parra 344.4.2\",\r\n        \"AcceptanceCriteriaValue\": \"ASME B31.3 2016, Parra 344.4.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME IX  2017 Parra QW195.2.2\",\r\n        \"AcceptanceCriteriaValue\": \"ASME IX  2017 Parra QW195.2.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"REPORT FINDINGS\",\r\n        \"AcceptanceCriteriaValue\": \"REPORT FINDINGS\"\r\n      }\r\n    ]\r\n  },\r\n  {\r\n    \"TestMethod\": \"MT\",\r\n    \"TestMethodLabel\": \"MT\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-MT-003\",\r\n        \"ITRDocumentValue\": \"GIES-WS-MT-003\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-MT-003\",\r\n        \"ProcedureValue\": \"GIES-MT-003\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 1171 (1998)\",\r\n        \"TestMethodStandardValue\": \"AS 1171 (1998)\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASME V - 2017 Article 7\",\r\n        \"TestMethodStandardValue\": \"ASME V - 2017 Article 7\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM 709\",\r\n        \"TestMethodStandardValue\": \"ASTM 709\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"EN 1444\",\r\n        \"TestMethodStandardValue\": \"EN 1444\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.1 table 6.2.1 2014\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.1 table 6.2.1 2014\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.2\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.3\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.3\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.4\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.4\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.5\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.5\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.6\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.6\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME B31.3 2012 Parra 344.3.2\",\r\n        \"AcceptanceCriteriaValue\": \"ASME B31.3 2012 Parra 344.3.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1210\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1210\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 4041\",\r\n        \"AcceptanceCriteriaValue\": \"AS 4041\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME IX\",\r\n        \"AcceptanceCriteriaValue\": \"ASME IX\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AWS D1.1\",\r\n        \"AcceptanceCriteriaValue\": \"AWS D1.1\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"EN 287.2\",\r\n        \"AcceptanceCriteriaValue\": \"EN 287.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME BPVC. VIII DIV 1-2015\",\r\n        \"AcceptanceCriteriaValue\": \"ASME BPVC. VIII DIV 1-2015\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"REPORT FINDINGS\",\r\n        \"AcceptanceCriteriaValue\": \"REPORT FINDINGS\"\r\n      }\r\n    ]\r\n  },\r\n  {\r\n    \"TestMethod\": \"UT Welds/Thickness/FORGING/CASTINGS/\",\r\n    \"TestMethodLabel\": \"UT Welds/Thickness/FORGING/CASTINGS/\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-UT-004\",\r\n        \"ITRDocumentValue\": \"GIES-WS-UT-004\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-UT-004\",\r\n        \"ProcedureValue\": \"GIES-UT-004\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 2207-2007\",\r\n        \"TestMethodStandardValue\": \"AS 2207-2007\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 2452.3 - (2005)\",\r\n        \"TestMethodStandardValue\": \"AS 2452.3 - (2005)\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 1710-2007\",\r\n        \"TestMethodStandardValue\": \"AS 1710-2007\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 1065-1998\",\r\n        \"TestMethodStandardValue\": \"AS 1065-1998\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASME V - (2017) Article 5\",\r\n        \"TestMethodStandardValue\": \"ASME V - (2017) Article 5\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"AWS D1.1 PART F\",\r\n        \"TestMethodStandardValue\": \"AWS D1.1 PART F\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"EN 1714\",\r\n        \"TestMethodStandardValue\": \"EN 1714\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME B31.3  Parra 344.6.2\",\r\n        \"AcceptanceCriteriaValue\": \"ASME B31.3  Parra 344.6.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.1\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.1\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.2\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.2\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.3\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.3\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.4\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.4\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.5\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.5\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1554.6\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1554.6\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"REPORT FINDINGS\",\r\n        \"AcceptanceCriteriaValue\": \"REPORT FINDINGS\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"REPORT MINIMUM THICKNESS\",\r\n        \"AcceptanceCriteriaValue\": \"REPORT MINIMUM THICKNESS\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 2885.2-2016 SECTION 17 TIER 1\",\r\n        \"AcceptanceCriteriaValue\": \"AS 2885.2-2016 SECTION 17 TIER 1\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"NIL CRACKS PERMITTED\",\r\n        \"AcceptanceCriteriaValue\": \"NIL CRACKS PERMITTED\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1085.20 :2012\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1085.20 :2012\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1210 -2010 CLASS 1/2/3\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1210 -2010 CLASS 1/2/3\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 4037\",\r\n        \"AcceptanceCriteriaValue\": \"AS 4037\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASME VIII-DIV 1:2015\",\r\n        \"AcceptanceCriteriaValue\": \"ASME VIII-DIV 1:2015\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 1228\",\r\n        \"AcceptanceCriteriaValue\": \"AS 1228\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"AS 4037 CLASS 1/2/3\",\r\n        \"AcceptanceCriteriaValue\": \"AS 4037 CLASS 1/2/3\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"EN 287.2\",\r\n        \"AcceptanceCriteriaValue\": \"EN 287.2\"\r\n      }\r\n    ]\r\n  },\r\n  {\r\n    \"TestMethod\": \"ET\",\r\n    \"TestMethodLabel\": \"ET\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-ET-005\",\r\n        \"ITRDocumentValue\": \"GIES-WS-ET-005\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-ET-005\",\r\n        \"ProcedureValue\": \"GIES-ET-005\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 4544 - (2005)\",\r\n        \"TestMethodStandardValue\": \"AS 4544 - (2005)\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 2331.1.4 - (1982)\",\r\n        \"TestMethodStandardValue\": \"AS 2331.1.4 - (1982)\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ISO 17643\",\r\n        \"TestMethodStandardValue\": \"ISO 17643\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASME V - (2017) Article 8\",\r\n        \"TestMethodStandardValue\": \"ASME V - (2017) Article 8\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM\",\r\n        \"TestMethodStandardValue\": \"ASTM\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 2084 -1987\",\r\n        \"TestMethodStandardValue\": \"AS 2084 -1987\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [      {\r\n            \"AcceptanceCriteriaLabel\": \"Report Findings\",\r\n            \"AcceptanceCriteriaValue\": \"Report Findings\"\r\n          },\r\n          {\r\n            \"AcceptanceCriteriaLabel\": \"NIL CRACKS PERMITTED\",\r\n            \"AcceptanceCriteriaValue\": \"NIL CRACKS PERMITTED\"\r\n          }]\r\n  },\r\n  {\r\n    \"TestMethod\": \"PVI\",\r\n    \"TestMethodLabel\": \"PVI\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-PVI-006\",\r\n        \"ITRDocumentValue\": \"GIES-WS-PVI-006\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-PVI-006\",\r\n        \"ProcedureValue\": \"GIES-PVI-006\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"AS 3788\",\r\n        \"TestMethodStandardValue\": \"AS 3788\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [{\r\n      \"AcceptanceCriteriaLabel\": \"AS 3788\",\r\n      \"AcceptanceCriteriaValue\": \"AS 3788\"\r\n    }]\r\n  },\r\n  {\r\n    \"TestMethod\": \"HT\",\r\n    \"TestMethodLabel\": \"HT\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-HT-007\",\r\n        \"ITRDocumentValue\": \"GIES-WS-HT-007\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-HT-007\",\r\n        \"ProcedureValue\": \"GIES-HT-007\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM A956 - Leeb\",\r\n        \"TestMethodStandardValue\": \"ASTM A956 - Leeb\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM E110 - Hardness test by Portable hardness tester\",\r\n        \"TestMethodStandardValue\": \"ASTM E110 - Hardness test by Portable hardness tester\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASTM A956 - Leeb\",\r\n        \"AcceptanceCriteriaValue\": \"ASTM A956 - Leeb\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASTM E110 - Hardness test by Portable hardness tester\",\r\n        \"AcceptanceCriteriaValue\": \"ASTM E110 - Hardness test by Portable hardness tester\"\r\n      }\r\n    ]\r\n  },\r\n  {\r\n    \"TestMethod\": \"PMI\",\r\n    \"TestMethodLabel\": \"PMI\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-PMI-008\",\r\n        \"ITRDocumentValue\": \"GIES-WS-PMI-008\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-PMI-008\",\r\n        \"ProcedureValue\": \"GIES-PMI-008\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM 572-13\",\r\n        \"TestMethodStandardValue\": \"ASTM 572-13\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"Equipment Manufacturer recommendation and  API 578\",\r\n        \"TestMethodStandardValue\": \"Equipment Manufacturer recommendation and  API 578\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [{\r\n            \"AcceptanceCriteriaLabel\": \"Report Findings\",\r\n            \"AcceptanceCriteriaValue\": \"Report Findings\"\r\n          }]\r\n  },\r\n  {\r\n    \"TestMethod\": \"HT/PT\",\r\n    \"TestMethodLabel\": \"HT/PT\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-HTPT-0010\",\r\n        \"ITRDocumentValue\": \"GIES-WS-HTPT-0010\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-HT-007\",\r\n        \"ItemProcedure\": \"GIES-HT-007\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM A956 - Leeb\",\r\n        \"TestMethodStandardValue\": \"ASTM A956 - Leeb\"\r\n      },\r\n      {\r\n        \"TestMethodStandardLabel\": \"ASTM E110 - Hardness test by Portable hardness tester\",\r\n        \"TestMethodStandardValue\": \"ASTM E110 - Hardness test by Portable hardness tester\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASTM A956 - Leeb\",\r\n        \"AcceptanceCriteriaValue\": \"ASTM A956 - Leeb\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASTM E110 - Hardness test by Portable hardness tester\",\r\n        \"AcceptanceCriteriaValue\": \"ASTM E110 - Hardness test by Portable hardness tester\"\r\n      }\r\n    ]\r\n  },\r\n  {\r\n    \"TestMethod\": \"CI\",\r\n    \"TestMethodLabel\": \"CI\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"GIES-WS-CI-0011\",\r\n        \"ITRDocumentValue\": \"GIES-WS-CI-0011\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"GIES-CI-0011\",\r\n        \"ProcedureValue\": \"GIES-CI-0011\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [\r\n      {\r\n        \"TestMethodStandardLabel\": \"NACE SSPC\",\r\n        \"TestMethodStandardValue\": \"NACE SSPC\"\r\n      }\r\n    ],\r\n    \"AcceptanceCriteria\": [\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASTM A956 - Leeb\",\r\n        \"AcceptanceCriteriaValue\": \"ASTM A956 - Leeb\"\r\n      },\r\n      {\r\n        \"AcceptanceCriteriaLabel\": \"ASTM E110 - Hardness test by Portable hardness tester\",\r\n        \"AcceptanceCriteriaValue\": \"ASTM E110 - Hardness test by Portable hardness tester\"\r\n      }\r\n    ]\r\n  },\r\n  {\r\n    \"TestMethod\": \"RT\",\r\n    \"TestMethodLabel\": \"RT\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"Subcontract works\",\r\n        \"ITRDocumentValue\": \"Subcontract works\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"Not Available\",\r\n        \"ProcedureValue\": \"\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [],\r\n    \"AcceptanceCriteria\": []\r\n  },\r\n  {\r\n    \"TestMethod\": \"Mech\",\r\n    \"TestMethodLabel\": \"Mech\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"Mechanical Testing\",\r\n        \"ITRDocumentValue\": \"Mechanical Testing\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"Not Available\",\r\n        \"ProcedureValue\": \"\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [],\r\n    \"AcceptanceCriteria\": []\r\n  },\r\n  {\r\n    \"TestMethod\": \"ENG\",\r\n    \"TestMethodLabel\": \"ENG\",\r\n    \"ITRDocument\": [\r\n      {\r\n        \"ITRDocumentLabel\": \"Third party\",\r\n        \"ITRDocumentValue\": \"Third party\"\r\n      },\r\n      {\r\n        \"ITRDocumentLabel\": \"FEED (Front end Engineering Design)\",\r\n        \"ITRDocumentValue\": \"FEED (Front end Engineering Design)\"\r\n      },\r\n      {\r\n        \"ITRDocumentLabel\": \"Piping & Pipelines\",\r\n        \"ITRDocumentValue\": \"Piping & Pipelines\"\r\n      },\r\n      {\r\n        \"ITRDocumentLabel\": \"On site works as per Client requirements\",\r\n        \"ITRDocumentValue\": \"On site works as per Client requirements\"\r\n      }\r\n    ],\r\n    \"ItemProcedure\": [\r\n      {\r\n        \"ProcedureLabel\": \"Not Available\",\r\n        \"ProcedureValue\": \"\"\r\n      }\r\n    ],\r\n    \"TestMethodStandard\": [],\r\n    \"AcceptanceCriteria\": []\r\n  }\r\n]','TestMethods',NULL),(2,'2019-06-03 17:11:38',NULL,'2019-06-03 17:11:38',NULL,'','','MRD','\0','mevroy@gmail.com','','GIE','','\0',NULL,'','\0','','AcceptanceCriteria','[\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1085.20 :2012\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1085.20 :2012\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1210\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1210\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1210 -2010 CLASS 1/2/3\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1210 -2010 CLASS 1/2/3\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1228\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1228\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1554.1\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1554.1\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1554.1  table 6.2.1 2014\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1554.1  table 6.2.1 2014\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1554.2\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1554.2\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1554.3\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1554.3\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1554.4\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1554.4\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1554.5\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1554.5\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 1554.6\",\r\n   \"AcceptanceCriteriaValue\": \"AS 1554.6\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 2885.2-2016 SECTION 17 TIER 1\",\r\n   \"AcceptanceCriteriaValue\": \"AS 2885.2-2016 SECTION 17 TIER 1\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 3788\",\r\n   \"AcceptanceCriteriaValue\": \"AS 3788\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 4037\",\r\n   \"AcceptanceCriteriaValue\": \"AS 4037\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 4037 CLASS 1/2/3\",\r\n   \"AcceptanceCriteriaValue\": \"AS 4037 CLASS 1/2/3\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AS 4041\",\r\n   \"AcceptanceCriteriaValue\": \"AS 4041\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASME B31.3  Parra 344.6.2\",\r\n   \"AcceptanceCriteriaValue\": \"ASME B31.3  Parra 344.6.2\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASME B31.3 2012 Parra 344.3.2\",\r\n   \"AcceptanceCriteriaValue\": \"ASME B31.3 2012 Parra 344.3.2\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASME B31.3 2016 Parra 344.4.2\",\r\n   \"AcceptanceCriteriaValue\": \"ASME B31.3 2016 Parra 344.4.2\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASME BPVC .VIII DIV 1-2015\",\r\n   \"AcceptanceCriteriaValue\": \"ASME BPVC .VIII DIV 1-2015\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASME IX\",\r\n   \"AcceptanceCriteriaValue\": \"ASME IX\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASME IX  2017 Parra QW195.2.2\",\r\n   \"AcceptanceCriteriaValue\": \"ASME IX  2017 Parra QW195.2.2\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASME VIII-DIV 1:2015\",\r\n   \"AcceptanceCriteriaValue\": \"ASME VIII-DIV 1:2015\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASTM A956 – Leeb\",\r\n   \"AcceptanceCriteriaValue\": \"ASTM A956 – Leeb\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"ASTM E110 – Hardness test by Portable hardness tester\",\r\n   \"AcceptanceCriteriaValue\": \"ASTM E110 – Hardness test by Portable hardness tester\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"AWS D1.1\",\r\n   \"AcceptanceCriteriaValue\": \"AWS D1.1\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"EN 287.2\",\r\n   \"AcceptanceCriteriaValue\": \"EN 287.2\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"NIL CRACKS PERMITTED\",\r\n   \"AcceptanceCriteriaValue\": \"NIL CRACKS PERMITTED\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"REPORT MINIMUM THICKNESS\",\r\n   \"AcceptanceCriteriaValue\": \"REPORT MINIMUM THICKNESS\"\r\n },\r\n {\r\n   \"AcceptanceCriteria\": \"REPORT FINDINGS\",\r\n   \"AcceptanceCriteriaValue\": \"REPORT FINDINGS\"\r\n }\r\n]','AcceptanceCriteria',NULL),(4,'2019-06-03 18:15:25',NULL,'2019-06-03 18:15:25',NULL,'','','MRD','\0','mevroy@gmail.com','','GIE','','\0',NULL,'','\0','','Procedures','[\r\n {\r\n   \"ProcedureLabel\": \"GIES-VT-001\",\r\n   \"ProcedureValue\": \"GIES-VT-001\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-PT-002\",\r\n   \"ProcedureValue\": \"GIES-PT-002\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-MT-003\",\r\n   \"ProcedureValue\": \"GIES-MT-003\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-UT-004\",\r\n   \"ProcedureValue\": \"GIES-UT-004\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-ET-005\",\r\n   \"ProcedureValue\": \"GIES-ET-005\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-PVI-006\",\r\n   \"ProcedureValue\": \"GIES-PVI-006\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-HT-007\",\r\n   \"ProcedureValue\": \"GIES-HT-007\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-PMI-008\",\r\n   \"ProcedureValue\": \"GIES-PMI-008\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-HT-007\",\r\n   \"ProcedureValue\": \"GIES-HT-007\"\r\n },\r\n {\r\n   \"ProcedureLabel\": \"GIES-CI-0011\",\r\n   \"ProcedureValue\": \"GIES-CI-0011\"\r\n }\r\n]','Procedures',NULL),(5,'2019-06-03 23:08:29',NULL,'2019-06-03 23:08:29',NULL,'','','MRD','\0','mevroy@gmail.com','','GIE','','\0',NULL,'','\0','','TestMethodStandards','[\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 1171 (1998)\",\r\n   \"TestMethodStandardValue\": \"AS 1171 (1998)\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 1065-1998\",\r\n   \"TestMethodStandardValue\": \"AS 1065-1998\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 1710-2007\",\r\n   \"TestMethodStandardValue\": \"AS 1710-2007\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 2084 -1987\",\r\n   \"TestMethodStandardValue\": \"AS 2084 -1987\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 2207-2007\",\r\n   \"TestMethodStandardValue\": \"AS 2207-2007\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 2331.1.4  - (1982)\",\r\n   \"TestMethodStandardValue\": \"AS 2331.1.4  - (1982)\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 2452.3 - (2005)\",\r\n   \"TestMethodStandardValue\": \"AS 2452.3 – (2005)\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 3788\",\r\n   \"TestMethodStandardValue\": \"AS 3788\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AS 4544 - (2005)\",\r\n   \"TestMethodStandardValue\": \"AS 4544 – (2005)\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASME V - (2017) Article 5\",\r\n   \"TestMethodStandardValue\": \"ASME V - (2017) Article 5\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASME V - 2017 Article 7\",\r\n   \"TestMethodStandardValue\": \"ASME V - 2017 Article 7\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASME V -(2017) Article 8\",\r\n   \"TestMethodStandardValue\": \"ASME V -(2017) Article 8\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASTM\",\r\n   \"TestMethodStandardValue\": \"ASTM\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASTM 1476\",\r\n   \"TestMethodStandardValue\": \"ASTM 1476\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASTM 572-13 ;Equipment Manufacturer recommendation and  API 578\",\r\n   \"TestMethodStandardValue\": \"ASTM 572-13 ;Equipment Manufacturer recommendation and  API 578\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASTM 709\",\r\n   \"TestMethodStandardValue\": \"ASTM 709\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASTM A956 - Leeb\",\r\n   \"TestMethodStandardValue\": \"ASTM A956 - Leeb\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ASTM E110 - Hardness test by Portable hardness tester\",\r\n   \"TestMethodStandardValue\": \"ASTM E110 - Hardness test by Portable hardness tester\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"AWS D1.1 PART F\",\r\n   \"TestMethodStandardValue\": \"AWS D1.1 PART F\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"EN 1444\",\r\n   \"TestMethodStandardValue\": \"EN 1444\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"EN 1714\",\r\n   \"TestMethodStandardValue\": \"EN 1714\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"ISO 17643\",\r\n   \"TestMethodStandardValue\": \"ISO 17643\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"NACE SSPC\",\r\n   \"TestMethodStandardValue\": \"NACE SSPC\"\r\n },\r\n {\r\n   \"TestMethodStandardLabel\": \"OXFORD ERF WORK INSTRUCTIONS\",\r\n   \"TestMethodStandardValue\": \"OXFORD ERF WORK INSTRUCTIONS\"\r\n }\r\n]','TestMethodStandards',NULL);
/*!40000 ALTER TABLE `group_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_sub_links`
--

DROP TABLE IF EXISTS `group_sub_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_sub_links` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `link_description` varchar(255) DEFAULT NULL,
  `link_href` varchar(255) NOT NULL,
  `link_java_script` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) NOT NULL,
  `link_order` double DEFAULT NULL,
  `group_main_link_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `link_name` (`link_name`,`group_main_link_id`),
  KEY `FK7364DF3AC216DBFF` (`group_main_link_id`),
  CONSTRAINT `FK7364DF3AC216DBFF` FOREIGN KEY (`group_main_link_id`) REFERENCES `group_main_links` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_sub_links`
--

LOCK TABLES `group_sub_links` WRITE;
/*!40000 ALTER TABLE `group_sub_links` DISABLE KEYS */;
INSERT INTO `group_sub_links` VALUES ('290591fa-a92f-4deb-a201-4d227ad85eca','2019-07-04 14:57:34',NULL,'2019-07-04 14:57:34',NULL,'\0','','#','','-------',2.1,4),('333688a9-56dd-45fa-a9ba-51d61acd7a50','2019-07-04 15:04:23',NULL,'2019-07-04 15:04:23',NULL,'\0','','viewAllGroupMember','','Members View',1.1,6),('33f96ed9-3c4c-47af-b0da-39fdc8c685f3','2019-07-04 14:44:28',NULL,'2019-07-04 14:44:28',NULL,'\0','','#','','------',2,6),('40f608db-7847-4490-9305-3c304b09bb0e','2019-06-05 19:40:48',NULL,'2019-07-04 15:06:39',NULL,'\0','','viewAuditLogs','','Audit View',1,5),('59e5d295-b6ba-4cb1-b362-8ca4b22cd39c','2019-06-02 08:01:26',NULL,'2019-06-02 08:01:26',NULL,'\0','','#','','-------',1.1,1),('5d79b80a-074b-43a1-901c-d1d772dbfcd2','2019-07-04 15:32:41',NULL,'2019-07-04 15:32:41',NULL,'\0','','addGroupSMSTemplate','','SMS Template Add',4,7),('6271ecf3-a9bb-42a9-8e15-17a9799ccf25','2019-07-16 16:21:34',NULL,'2019-07-16 16:21:34',NULL,'\0','','viewGroupEventTableAllocations','','Passes Table Allocations',4,9),('7974ceb6-f052-457e-8b16-9518cdacc5e7','2019-05-31 16:03:38',NULL,'2019-05-31 17:58:00',NULL,'\0','','groupInstructionRecord','','New WIR',1,1),('799bedd5-2500-4195-bf75-9100431abd4a','2019-07-16 16:17:17',NULL,'2019-07-16 16:17:17',NULL,'\0','','#','','------',2,9),('820a906b-c36d-4f16-9e43-9a9208889ea2','2019-07-04 14:59:05',NULL,'2019-07-04 14:59:05',NULL,'\0','','addGroupEmailTemplate','','Email Template Add',2.2,4),('839f859b-5e90-4ce5-a849-ae336e0dbb19','2019-07-04 15:11:17',NULL,'2019-07-04 15:11:17',NULL,'\0','','#','','------',3,8),('962d72e4-591a-4fa6-8b65-f36f217b17c6','2019-05-31 16:04:10',NULL,'2019-05-31 17:58:22',NULL,'\0','','viewGroupWorkInstructionRecords','','View WIRs',2,1),('969caefe-1e22-442a-ae20-8b68022fec30','2019-07-04 14:52:13',NULL,'2019-07-04 15:05:35',NULL,'\0','','viewGroupSMS','','SMS View',2,7),('98eb49dc-0ab9-4d7a-b99d-968a0d8ae167','2019-07-16 16:26:33',NULL,'2019-07-16 16:26:33',NULL,'\0','','addUnAssignedGroupEventPassesToGroupMembers','','Pass Assignment',2.1,9),('9afd1925-1111-4e54-9115-ec8c11800aec','2019-07-04 14:54:58',NULL,'2019-07-04 14:57:12',NULL,'\0','','createGroupEventInviteEmails','','Emails Send',1,4),('9bf22b46-71ff-4b8c-8201-4ba01993233f','2019-07-04 15:33:09',NULL,'2019-07-04 15:33:09',NULL,'\0','','viewAllGroupSMSTemplates','','SMS Template View',5,7),('9e328855-0781-49ee-ab12-85a84efa48a3','2019-07-16 16:26:08',NULL,'2019-07-16 16:26:08',NULL,'\0','','#','','-------',2.3,9),('a8496fc8-b118-4016-8ad2-2d2906e06e86','2019-07-04 14:59:42',NULL,'2019-07-04 14:59:42',NULL,'\0','','viewAllGroupEmailTemplates','','Email Template View',2.3,4),('b1932716-8d60-4b02-8bec-d5f9f7ffcee8','2019-06-02 07:59:16',NULL,'2019-07-04 15:06:28',NULL,'\0','','viewNavigationLinks','','Links Add/View',1,3),('b9c2218d-2743-4c6f-99bb-60ef88c03686','2019-06-02 08:00:18',NULL,'2019-07-04 14:57:47',NULL,'\0','','addGroupEmailAccount','','Email Account Add',3,4),('ba48a462-f43b-4176-8e0e-bbeccb120134','2019-07-16 16:20:27',NULL,'2019-07-16 16:20:27',NULL,'\0','','viewGroupEventPasses','','Passes View',3,9),('c740eac9-1f91-4e70-9215-6171d083c38f','2019-07-04 15:13:53',NULL,'2019-07-04 15:13:53',NULL,'\0','','#','','-------',5,8),('c755a6f0-0a13-41bc-8ad3-c894401ff998','2019-07-04 15:10:27',NULL,'2019-07-04 15:10:27',NULL,'\0','','addGroupEvent','','Events Add',1,8),('cb333812-eada-4b4b-87ad-c8fdfbde941e','2019-07-04 15:32:08',NULL,'2019-07-04 15:32:08',NULL,'\0','','#','','------',3,7),('cd9b3cee-3c8f-4d7a-b172-720a85d1ccf2','2019-07-16 16:16:04',NULL,'2019-07-16 16:16:19',NULL,'\0','','viewAllGroupEventsTickets','','Pass Categories Add/View',1,9),('db6b2a56-3454-4569-8d53-e7b72d44b37c','2019-07-04 14:42:56',NULL,'2019-07-04 15:04:44',NULL,'\0','','addGroupMember','','Members Add',1,6),('dbad4d7c-ea56-47f2-b16f-1f4ebbd01526','2019-07-04 14:59:56',NULL,'2019-07-04 14:59:56',NULL,'\0','','#','','--------',2.4,4),('dd1698b4-656f-4238-b9be-3c774a08b97e','2019-07-16 16:28:41',NULL,'2019-07-16 16:28:41',NULL,'\0','','registerGroupEventInvites','','Event Invites Update/Register',4.1,8),('e3f94c15-c9b0-4b95-92a3-2837274a7831','2019-07-04 15:10:50',NULL,'2019-07-04 15:10:50',NULL,'\0','','viewAllGroupEvents','','Events View',2,8),('eb2ba515-b0f1-4af8-83a5-c178acc77797','2019-07-04 14:48:28',NULL,'2019-07-04 15:05:28',NULL,'\0','','createGroupEventInviteSMS','','SMS Send',1,7),('f0b93e8a-278f-4999-b21e-a50aed552018','2019-06-02 07:54:05',NULL,'2019-06-02 07:54:05',NULL,'','','viewAllGroupEmailTemplates','','View Templates',2,2),('f312d47a-10c6-4b5b-9c73-293a777af496','2019-06-02 07:53:18',NULL,'2019-07-04 15:41:27',NULL,'\0','','addGroupEventCron','','Schedule Jobs',1,2),('f6b8622f-0514-48cf-b75a-2c78397632d4','2019-07-04 14:54:25',NULL,'2019-07-04 14:57:19',NULL,'\0','','viewGroupEmails','','Emails View',2,4),('f6c4c4a2-e199-474b-a298-39a84370ab29','2019-07-04 15:12:35',NULL,'2019-07-04 15:13:10',NULL,'\0','','createGroupEventInvite','','Event Invites Create/View',4,8),('fe921ce6-75a6-4371-83fa-ae347bfaabcd','2019-07-04 14:45:00',NULL,'2019-07-04 15:04:53',NULL,'\0','','addGroupMemberCategory','','Member Category Add',3,6),('ff419ac8-8af9-47c9-b342-9122ba5c5e28','2019-07-04 15:14:32',NULL,'2019-07-04 15:14:32',NULL,'\0','','viewGroupEventPaymentTransactions','','Event Payments',6,8);
/*!40000 ALTER TABLE `group_sub_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_link_access`
--

DROP TABLE IF EXISTS `group_link_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_link_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `group_sub_link_id` varchar(255) NOT NULL,
  `link_href` varchar(255) DEFAULT NULL,
  `link_java_script` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`group_sub_link_id`),
  KEY `FKBBC48389A5EAD1BC` (`group_id`),
  CONSTRAINT `FKBBC48389A5EAD1BC` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_link_access`
--

LOCK TABLES `group_link_access` WRITE;
/*!40000 ALTER TABLE `group_link_access` DISABLE KEYS */;
INSERT INTO `group_link_access` VALUES (1,'2019-05-31 16:05:13',NULL,'2019-05-31 16:05:13',NULL,NULL,'7974ceb6-f052-457e-8b16-9518cdacc5e7',NULL,'',NULL,1),(2,'2019-05-31 16:05:48',NULL,'2019-05-31 16:05:48',NULL,NULL,'962d72e4-591a-4fa6-8b65-f36f217b17c6',NULL,'',NULL,1),(3,'2019-05-31 17:07:27',NULL,'2019-05-31 17:07:27',NULL,NULL,'7974ceb6-f052-457e-8b16-9518cdacc5e7',NULL,'',NULL,11),(4,'2019-05-31 17:07:46',NULL,'2019-05-31 17:07:46',NULL,NULL,'962d72e4-591a-4fa6-8b65-f36f217b17c6',NULL,'',NULL,11),(5,'2019-06-02 07:54:11',NULL,'2019-06-02 07:54:11',NULL,NULL,'f312d47a-10c6-4b5b-9c73-293a777af496',NULL,'',NULL,11),(6,'2019-06-02 07:54:27',NULL,'2019-06-02 07:54:27',NULL,NULL,'f0b93e8a-278f-4999-b21e-a50aed552018',NULL,'',NULL,11),(7,'2019-06-02 07:59:21',NULL,'2019-06-02 07:59:21',NULL,NULL,'b1932716-8d60-4b02-8bec-d5f9f7ffcee8',NULL,'',NULL,11),(8,'2019-06-02 08:00:24',NULL,'2019-06-02 08:00:24',NULL,NULL,'b9c2218d-2743-4c6f-99bb-60ef88c03686',NULL,'',NULL,11),(9,'2019-06-05 19:40:55',NULL,'2019-06-05 19:40:55',NULL,NULL,'40f608db-7847-4490-9305-3c304b09bb0e',NULL,'',NULL,11),(10,'2019-07-04 14:43:03',NULL,'2019-07-04 14:43:03',NULL,NULL,'db6b2a56-3454-4569-8d53-e7b72d44b37c',NULL,'',NULL,11),(11,'2019-07-04 14:45:46',NULL,'2019-07-04 14:45:46',NULL,NULL,'fe921ce6-75a6-4371-83fa-ae347bfaabcd',NULL,'',NULL,11),(12,'2019-07-04 14:52:32',NULL,'2019-07-04 14:52:32',NULL,NULL,'eb2ba515-b0f1-4af8-83a5-c178acc77797',NULL,'',NULL,11),(13,'2019-07-04 14:52:43',NULL,'2019-07-04 14:52:43',NULL,NULL,'969caefe-1e22-442a-ae20-8b68022fec30',NULL,'',NULL,11),(14,'2019-07-04 14:55:03',NULL,'2019-07-04 14:55:03',NULL,NULL,'9afd1925-1111-4e54-9115-ec8c11800aec',NULL,'',NULL,11),(15,'2019-07-04 14:55:12',NULL,'2019-07-04 14:55:12',NULL,NULL,'f6b8622f-0514-48cf-b75a-2c78397632d4',NULL,'',NULL,11),(16,'2019-07-04 15:02:03',NULL,'2019-07-04 15:02:03',NULL,NULL,'820a906b-c36d-4f16-9e43-9a9208889ea2',NULL,'',NULL,11),(17,'2019-07-04 15:02:11',NULL,'2019-07-04 15:02:11',NULL,NULL,'a8496fc8-b118-4016-8ad2-2d2906e06e86',NULL,'',NULL,11),(18,'2019-07-04 15:04:28',NULL,'2019-07-04 15:04:28',NULL,NULL,'333688a9-56dd-45fa-a9ba-51d61acd7a50',NULL,'',NULL,11),(19,'2019-07-04 15:10:31',NULL,'2019-07-04 15:10:31',NULL,NULL,'c755a6f0-0a13-41bc-8ad3-c894401ff998',NULL,'',NULL,11),(20,'2019-07-04 15:10:55',NULL,'2019-07-04 15:10:55',NULL,NULL,'e3f94c15-c9b0-4b95-92a3-2837274a7831',NULL,'',NULL,11),(21,'2019-07-04 15:14:42',NULL,'2019-07-04 15:14:42',NULL,NULL,'f6c4c4a2-e199-474b-a298-39a84370ab29',NULL,'',NULL,11),(22,'2019-07-04 15:14:53',NULL,'2019-07-04 15:14:53',NULL,NULL,'ff419ac8-8af9-47c9-b342-9122ba5c5e28',NULL,'',NULL,11),(23,'2019-07-04 15:33:14',NULL,'2019-07-04 15:33:14',NULL,NULL,'5d79b80a-074b-43a1-901c-d1d772dbfcd2',NULL,'',NULL,11),(24,'2019-07-04 15:33:22',NULL,'2019-07-04 15:33:22',NULL,NULL,'9bf22b46-71ff-4b8c-8201-4ba01993233f',NULL,'',NULL,11),(25,'2019-07-16 16:16:23',NULL,'2019-07-16 16:16:23',NULL,NULL,'cd9b3cee-3c8f-4d7a-b172-720a85d1ccf2',NULL,'',NULL,11),(27,'2019-07-16 16:21:38',NULL,'2019-07-16 16:21:38',NULL,NULL,'ba48a462-f43b-4176-8e0e-bbeccb120134',NULL,'',NULL,11),(28,'2019-07-16 16:21:45',NULL,'2019-07-16 16:21:45',NULL,NULL,'6271ecf3-a9bb-42a9-8e15-17a9799ccf25',NULL,'',NULL,11),(29,'2019-07-16 16:26:39',NULL,'2019-07-16 16:26:39',NULL,NULL,'98eb49dc-0ab9-4d7a-b99d-968a0d8ae167',NULL,'',NULL,11),(30,'2019-07-17 15:32:02',NULL,'2019-07-17 15:32:02',NULL,NULL,'dd1698b4-656f-4238-b9be-3c774a08b97e',NULL,'',NULL,11);
/*!40000 ALTER TABLE `group_link_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_push_notification_accounts`
--

DROP TABLE IF EXISTS `group_push_notification_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_push_notification_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `account_code` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `app_alias` varchar(255) DEFAULT NULL,
  `app_key` varchar(255) NOT NULL,
  `app_secret` varchar(255) NOT NULL,
  `authorization_failed` bit(1) DEFAULT NULL,
  `group_code` varchar(3) NOT NULL,
  `hold_push_notifications` bit(1) DEFAULT NULL,
  `push_notificationqrimage_link` varchar(255) DEFAULT NULL,
  `push_notifications_target_type` varchar(255) NOT NULL,
  `subscription_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_code` (`account_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_push_notification_accounts`
--

LOCK TABLES `group_push_notification_accounts` WRITE;
/*!40000 ALTER TABLE `group_push_notification_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_push_notification_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_link_access_role`
--

DROP TABLE IF EXISTS `group_link_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_link_access_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `group_link_access_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_link_access_id` (`group_link_access_id`,`role`),
  KEY `FK78CD836C7807A101` (`group_link_access_id`),
  CONSTRAINT `FK78CD836C7807A101` FOREIGN KEY (`group_link_access_id`) REFERENCES `group_link_access` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_link_access_role`
--

LOCK TABLES `group_link_access_role` WRITE;
/*!40000 ALTER TABLE `group_link_access_role` DISABLE KEYS */;
INSERT INTO `group_link_access_role` VALUES (1,'2019-05-31 16:05:30',NULL,'2019-05-31 16:05:30',NULL,NULL,'USER',NULL,1),(2,'2019-05-31 16:05:34',NULL,'2019-05-31 16:05:34',NULL,NULL,'SUPER_USER',NULL,1),(3,'2019-05-31 16:05:37',NULL,'2019-05-31 16:05:37',NULL,NULL,'ADMIN',NULL,1),(4,'2019-05-31 16:05:40',NULL,'2019-05-31 16:05:40',NULL,NULL,'SUPER_ADMIN',NULL,1),(5,'2019-05-31 16:05:55',NULL,'2019-05-31 16:05:55',NULL,NULL,'SUPER_ADMIN',NULL,2),(6,'2019-05-31 16:05:58',NULL,'2019-05-31 16:05:58',NULL,NULL,'ADMIN',NULL,2),(7,'2019-05-31 16:05:59',NULL,'2019-05-31 16:05:59',NULL,NULL,'SUPER_USER',NULL,2),(8,'2019-05-31 16:06:02',NULL,'2019-05-31 16:06:02',NULL,NULL,'USER',NULL,2),(9,'2019-05-31 17:07:31',NULL,'2019-05-31 17:07:31',NULL,NULL,'SUPER_ADMIN',NULL,3),(10,'2019-05-31 17:07:36',NULL,'2019-05-31 17:07:36',NULL,NULL,'ADMIN',NULL,3),(11,'2019-05-31 17:07:38',NULL,'2019-05-31 17:07:38',NULL,NULL,'SUPER_USER',NULL,3),(12,'2019-05-31 17:07:40',NULL,'2019-05-31 17:07:40',NULL,NULL,'USER',NULL,3),(13,'2019-05-31 17:07:49',NULL,'2019-05-31 17:07:49',NULL,NULL,'SUPER_ADMIN',NULL,4),(14,'2019-05-31 17:07:51',NULL,'2019-05-31 17:07:51',NULL,NULL,'ADMIN',NULL,4),(15,'2019-05-31 17:07:53',NULL,'2019-05-31 17:07:53',NULL,NULL,'SUPER_USER',NULL,4),(16,'2019-05-31 17:07:55',NULL,'2019-05-31 17:07:55',NULL,NULL,'USER',NULL,4),(17,'2019-06-02 07:54:18',NULL,'2019-06-02 07:54:18',NULL,NULL,'SUPER_ADMIN',NULL,5),(18,'2019-06-02 07:54:30',NULL,'2019-06-02 07:54:30',NULL,NULL,'SUPER_ADMIN',NULL,6),(19,'2019-06-02 07:59:25',NULL,'2019-06-02 07:59:25',NULL,NULL,'SUPER_ADMIN',NULL,7),(20,'2019-06-02 08:00:28',NULL,'2019-06-02 08:00:28',NULL,NULL,'SUPER_ADMIN',NULL,8),(21,'2019-06-05 19:41:10',NULL,'2019-06-05 19:41:10',NULL,NULL,'SUPER_ADMIN',NULL,9),(22,'2019-07-04 14:43:09',NULL,'2019-07-04 14:43:09',NULL,NULL,'SUPER_ADMIN',NULL,10),(23,'2019-07-04 14:45:56',NULL,'2019-07-04 14:45:56',NULL,NULL,'SUPER_ADMIN',NULL,11),(24,'2019-07-04 14:52:35',NULL,'2019-07-04 14:52:35',NULL,NULL,'SUPER_ADMIN',NULL,12),(25,'2019-07-04 14:52:47',NULL,'2019-07-04 14:52:47',NULL,NULL,'SUPER_ADMIN',NULL,13),(26,'2019-07-04 14:55:07',NULL,'2019-07-04 14:55:07',NULL,NULL,'SUPER_ADMIN',NULL,14),(27,'2019-07-04 14:55:20',NULL,'2019-07-04 14:55:20',NULL,NULL,'SUPER_ADMIN',NULL,15),(28,'2019-07-04 15:02:06',NULL,'2019-07-04 15:02:06',NULL,NULL,'SUPER_ADMIN',NULL,16),(29,'2019-07-04 15:02:15',NULL,'2019-07-04 15:02:15',NULL,NULL,'SUPER_ADMIN',NULL,17),(31,'2019-07-04 15:04:31',NULL,'2019-07-04 15:04:31',NULL,NULL,'SUPER_ADMIN',NULL,18),(32,'2019-07-04 15:10:33',NULL,'2019-07-04 15:10:33',NULL,NULL,'SUPER_ADMIN',NULL,19),(33,'2019-07-04 15:11:01',NULL,'2019-07-04 15:11:01',NULL,NULL,'SUPER_ADMIN',NULL,20),(34,'2019-07-04 15:14:47',NULL,'2019-07-04 15:14:47',NULL,NULL,'SUPER_ADMIN',NULL,21),(35,'2019-07-04 15:14:57',NULL,'2019-07-04 15:14:57',NULL,NULL,'SUPER_ADMIN',NULL,22),(36,'2019-07-04 15:33:17',NULL,'2019-07-04 15:33:17',NULL,NULL,'SUPER_ADMIN',NULL,23),(37,'2019-07-04 15:33:28',NULL,'2019-07-04 15:33:28',NULL,NULL,'SUPER_ADMIN',NULL,24),(38,'2019-07-16 16:16:26',NULL,'2019-07-16 16:16:26',NULL,NULL,'SUPER_ADMIN',NULL,25),(39,'2019-07-16 16:21:41',NULL,'2019-07-16 16:21:41',NULL,NULL,'SUPER_ADMIN',NULL,27),(40,'2019-07-16 16:21:49',NULL,'2019-07-16 16:21:49',NULL,NULL,'SUPER_ADMIN',NULL,28),(41,'2019-07-16 16:26:41',NULL,'2019-07-16 16:26:41',NULL,NULL,'SUPER_ADMIN',NULL,29),(42,'2019-07-17 15:32:10',NULL,'2019-07-17 15:32:10',NULL,NULL,'SUPER_ADMIN',NULL,30);
/*!40000 ALTER TABLE `group_link_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user_role`
--

DROP TABLE IF EXISTS `group_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `group_code` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`user_id`),
  KEY `FK8A9712AAA5EAD1BC` (`group_id`),
  KEY `FK8A9712AAC8C73A27` (`user_id`),
  CONSTRAINT `FK8A9712AAA5EAD1BC` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK8A9712AAC8C73A27` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user_role`
--

LOCK TABLES `group_user_role` WRITE;
/*!40000 ALTER TABLE `group_user_role` DISABLE KEYS */;
INSERT INTO `group_user_role` VALUES (1,'2019-05-31 11:36:46',NULL,'2019-05-31 11:36:46',NULL,NULL,'ADM','USER','2019-05-31 11:36:46',1,1),(2,'2019-05-31 16:00:20',NULL,'2019-05-31 16:00:20',NULL,NULL,'ADM','SUPER_ADMIN','2019-05-31 16:00:20',1,2),(3,'2019-05-31 16:00:20',NULL,'2019-05-31 16:00:20',NULL,NULL,'GIE','SUPER_ADMIN','2019-05-31 16:00:20',11,2),(4,'2019-05-31 11:36:46',NULL,'2019-05-31 11:36:46',NULL,NULL,'GIE','SUPER_USER','2019-05-31 11:36:46',11,1);
/*!40000 ALTER TABLE `group_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_push_notifications`
--

DROP TABLE IF EXISTS `group_push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_push_notifications` (
  `group_push_notification_id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `group_event_invite_id` varchar(255) DEFAULT NULL,
  `push_notification_bounce_date` datetime DEFAULT NULL,
  `push_notification_date` datetime DEFAULT NULL,
  `push_notification_error` varchar(255) DEFAULT NULL,
  `push_notification_expirydate` datetime DEFAULT NULL,
  `push_notification_held` bit(1) DEFAULT NULL,
  `push_notification_sent_date` datetime DEFAULT NULL,
  `push_notification_viewed_date` datetime DEFAULT NULL,
  `push_notifications_target_type` varchar(255) NOT NULL,
  `pushed_id` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `account_code` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`group_push_notification_id`),
  UNIQUE KEY `group_push_notification_id` (`group_push_notification_id`),
  KEY `FKFDE68A43A5EAD1BC` (`group_id`),
  KEY `FKFDE68A43149705D5` (`account_code`),
  KEY `FKFDE68A43D9677100` (`serial_number`),
  CONSTRAINT `FKFDE68A43149705D5` FOREIGN KEY (`account_code`) REFERENCES `group_push_notification_accounts` (`id`),
  CONSTRAINT `FKFDE68A43A5EAD1BC` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FKFDE68A43D9677100` FOREIGN KEY (`serial_number`) REFERENCES `group_members` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_push_notifications`
--

LOCK TABLES `group_push_notifications` WRITE;
/*!40000 ALTER TABLE `group_push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_push_notifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-19 14:04:10

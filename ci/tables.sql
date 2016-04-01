-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: devdb    Database: xcf_mfarm
-- ------------------------------------------------------
-- Server version 5.6.26-74.0-log

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
-- Table structure for table `ad_delivery`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_delivery` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_material_id` int(10) DEFAULT NULL,
  `ad_slot_id` int(10) DEFAULT NULL,
  `click_tracking_url` varchar(1000) DEFAULT NULL,
  `expose_tracking_url` varchar(1000) DEFAULT NULL,
  `extra_info` text,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slot_id_time` (`ad_slot_id`,`start_time`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_material`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `ad_type` int(10) DEFAULT NULL,
  `info` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_material_in_delivery`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_material_in_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_material_id` int(11) NOT NULL,
  `ad_delivery_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_material_id` (`ad_material_id`),
  KEY `ad_delivery_id` (`ad_delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=719 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_pic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_pic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_material_id` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `height` int(10) DEFAULT NULL,
  `pic_url` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_material_id` (`ad_material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_slot`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_slot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `ad_type` int(10) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_token`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(100) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `user_id_token` (`user_id`,`token`)
) ENGINE=InnoDB AUTO_INCREMENT=133758292 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `text` varchar(2000) DEFAULT '',
  `status` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0',
  `n_votes` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `answer_order_by_score` (`question_id`,`status`,`score`)
) ENGINE=InnoDB AUTO_INCREMENT=100035154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answer_digg`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_digg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  `score` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2558 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_key`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_key` (
  `id` int(10) unsigned NOT NULL,
  `public_key` bigint(20) unsigned NOT NULL,
  `secret_key` bigint(20) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_key` (`public_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_zone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `section_left_top` text,
  `section_left_bottom` text,
  `section_right` text,
  `recipe_list_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'S',
  `hide` tinyint(4) NOT NULL DEFAULT '1',
  `seo_kwd` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `seo_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `rank` int(12) NOT NULL DEFAULT '0',
  `n_recipes` int(11) DEFAULT '0',
  `include_recipe` tinyint(4) DEFAULT '1',
  `synced` int(11) DEFAULT '0',
  `ident` varbinary(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1012110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table `cat_contain`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_contain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id1` int(10) unsigned NOT NULL,
  `cat_id2` int(10) unsigned NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id1` (`cat_id1`),
  KEY `cat_id2` (`cat_id2`),
  KEY `cat_id1_level` (`cat_id1`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_tree`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `child_id` int(10) unsigned DEFAULT NULL,
  `level` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collect`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `recipe_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`recipe_id`),
  UNIQUE KEY `user_id_id_recipe_id` (`user_id`,`id`,`recipe_id`),
  KEY `recipe_id` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294447832 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digg`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `dish_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valid` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`dish_id`),
  KEY `dish_id` (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=352493849 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dish`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `recipe_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` smallint(6) NOT NULL DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `pic_ver` smallint(5) NOT NULL DEFAULT '0',
  `rating` tinyint(4) NOT NULL,
  `desc` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n_comments` smallint(6) NOT NULL DEFAULT '0',
  `storage` smallint(5) NOT NULL DEFAULT '0',
  `n_cooked` smallint(6) NOT NULL DEFAULT '0',
  `synced` int(11) NOT NULL DEFAULT '0',
  `ident` varbinary(100) NOT NULL DEFAULT '',
  `ndiggs` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`user_id`),
  KEY `create_time` (`create_time`),
  KEY `recipe_id_create_time` (`recipe_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=110895467 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dish_comment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dish_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `dish_id` (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110030306 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dish_extra`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish_extra` (
  `id` int(10) unsigned NOT NULL,
  `origin` smallint(6) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dish_extra_pic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish_extra_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `ident` varbinary(100) NOT NULL,
  `synced` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30343 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dish_pic_tag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish_pic_tag` (
  `id` int(11) NOT NULL,
  `n_tags` int(11) NOT NULL,
  `tags` text NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dish_pic_tag_record`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish_pic_tag_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `target_kind` int(11) NOT NULL,
  `tag_name` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=888 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_activity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_activity_goods_backup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_activity_goods_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `goods_info` text,
  `goods_commission` text,
  `goods_schedule` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_activity_task`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_activity_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `execute_status` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_additional_review`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_additional_review` (
  `id` int(10) unsigned NOT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_additional_review_pic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_additional_review_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `additional_review_id` int(11) DEFAULT NULL,
  `ident` varchar(64) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `additional_review_id` (`additional_review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2951 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_address`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `default` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `region_id` int(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=599858 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_audit_goods`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_audit_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `info` text,
  `reject_reason` text,
  `operator_id` int(10) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_bill2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_bill2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `receipt_count` int(11) DEFAULT NULL,
  `receipt_amount` decimal(16,2) DEFAULT NULL,
  `receipt_cash_amount` decimal(15,2) DEFAULT NULL,
  `receipt_voucher_amount` decimal(15,2) DEFAULT NULL,
  `payment_count` int(11) DEFAULT NULL,
  `payment_amount` decimal(16,2) DEFAULT NULL,
  `payment_cash_amount` decimal(15,2) DEFAULT NULL,
  `payment_voucher_amount` decimal(15,2) DEFAULT NULL,
  `remaining` decimal(16,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_buybuybuy_review`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_buybuybuy_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_charge`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_ids` varchar(1000) DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `desc` varchar(1000) DEFAULT NULL,
  `transaction_no` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `channel` varchar(100) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `cash_amount` decimal(16,2) DEFAULT '0.00',
  `voucher_amount` decimal(16,2) DEFAULT '0.00',
  `money_back_amount` decimal(16,2) DEFAULT '0.00',
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id_status` (`user_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=720758 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_charge_statistic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_charge_statistic` (
  `id` int(11) NOT NULL,
  `origin` int(11) NOT NULL DEFAULT '-1',
  `version` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown version',
  `device_id` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown device id',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_express_waybill`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_express_waybill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `tracking_id` varchar(100) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `ship_status` int(11) NOT NULL DEFAULT '0',
  `ship_message` text,
  `ship_from` varchar(100) DEFAULT NULL,
  `ship_to` varchar(100) NOT NULL DEFAULT '',
  `poll_status` int(11) NOT NULL DEFAULT '10',
  `poll_message` text,
  `poll_count` int(11) NOT NULL DEFAULT '0',
  `salt` char(16) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderindex` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33709 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_free_delivery_promotion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_free_delivery_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `fee` decimal(16,2) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_fresh_member`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_fresh_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expire_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expire_time` (`expire_time`)
) ENGINE=InnoDB AUTO_INCREMENT=107350172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_fresh_member_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_fresh_member_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `package` int(11) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_gift_voucher_manage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_gift_voucher_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(32) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `threshold_amount` decimal(16,2) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receive_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `voucher_id` text NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_sale_shop_id` (`type`,`sale`,`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14927 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_best_selling`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_best_selling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `extra_key` int(11) DEFAULT NULL,
  `n_bumped` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `last_bump_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extra_key` (`extra_key`),
  KEY `last_bump_time` (`last_bump_time`),
  KEY `extra_key_item_id` (`extra_key`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_customs_clearance_in_order`
--
-- Table structure for table `ec_goods_extra_pic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_extra_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `ident` varchar(64) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=274782 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_extra_pic_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_extra_pic_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `ident` varchar(64) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274811 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86089 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_img_txt_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_img_txt_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_type` int(2) DEFAULT NULL,
  `detail_desc` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14927 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_img_txt_detail_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_img_txt_detail_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `detail_type` int(2) DEFAULT NULL,
  `detail_desc` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_activity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_info` text,
  `goods_commission` text,
  `previous_goods_info` text,
  `previous_goods_commission` text,
  `previous_goods_schedule` text,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_cart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_kind` varchar(500) DEFAULT NULL,
  `goods_number` int(11) DEFAULT NULL,
  `shop_update_time` datetime(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_goods_id_goods_kind` (`user_id`,`goods_id`,`goods_kind`(255)),
  KEY `shop_id` (`shop_id`),
  KEY `goods_id_update_time` (`goods_id`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4266108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_order2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_order2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_price` decimal(16,2) DEFAULT NULL,
  `goods_number` int(11) DEFAULT NULL,
  `goods_kind` varchar(200) DEFAULT NULL,
  `goods_type` int(11) DEFAULT NULL,
  `goods_paid_price` decimal(16,2) DEFAULT NULL,
  `review_status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `goods_paid_freight` decimal(16,2) DEFAULT NULL,
  `goods_paid_cash_amount` decimal(16,2) DEFAULT NULL,
  `goods_paid_voucher_amount` decimal(16,2) DEFAULT NULL,
  `goods_name` varchar(1000) DEFAULT NULL,
  `hierarchy_status` int(11) DEFAULT '1',
  `goods_kind_id` int(11) NOT NULL DEFAULT '0',
  `goods_kind_serial_number` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id_status_goods_id` (`user_id`,`status`,`goods_id`),
  KEY `goods_id_status_create_time` (`goods_id`,`status`,`create_time`),
  KEY `status_shop_id` (`status`,`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2081201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_order_export`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_order_export` (
  `id` int(11) NOT NULL,
  `exported` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_order_hist2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_order_hist2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_price` decimal(16,2) DEFAULT NULL,
  `goods_number` int(11) DEFAULT NULL,
  `goods_kind` varchar(200) DEFAULT NULL,
  `goods_paid_price` decimal(16,2) DEFAULT NULL,
  `goods_type` int(11) DEFAULT NULL,
  `review_status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `goods_paid_freight` decimal(16,2) DEFAULT NULL,
  `goods_paid_cash_amount` decimal(16,2) DEFAULT NULL,
  `goods_paid_voucher_amount` decimal(16,2) DEFAULT NULL,
  `goods_in_order_id` int(11) DEFAULT NULL,
  `hierarchy_status` int(11) DEFAULT '1',
  `goods_kind_id` int(11) NOT NULL DEFAULT '0',
  `goods_kind_serial_number` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id_status` (`order_id`,`status`),
  KEY `user_id_status` (`user_id`,`status`),
  KEY `status_goods_id_create_time` (`status`,`goods_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7753767 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_promotion_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_promotion_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `promotion_category_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_category_id` (`promotion_category_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45866 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_refund`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_refund` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `goods_in_order_id` int(10) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `operator_id` int(10) unsigned NOT NULL,
  `total_amount` decimal(16,2) NOT NULL,
  `cash_amount` decimal(16,2) NOT NULL,
  `voucher_amount` decimal(16,2) NOT NULL,
  `transaction_no` varchar(32) NOT NULL,
  `original_voucher_id` int(10) unsigned NOT NULL,
  `new_voucher_id` int(10) unsigned NOT NULL,
  `reason` text,
  `refund_application_processing_id` int(10) unsigned NOT NULL,
  `refund_goods_number` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30458 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_refund_request`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_refund_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_in_order_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `total_amount` decimal(16,2) NOT NULL,
  `cash_amount` decimal(16,2) NOT NULL,
  `voucher_amount` decimal(16,2) NOT NULL,
  `refund_goods_number` int(11) NOT NULL,
  `reason` text,
  `refund_application_id` int(11) NOT NULL,
  `refund_application_processing_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_in_order_id` (`goods_in_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_in_shop_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_in_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `shop_category_id` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12399 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `category` varchar(1000) DEFAULT NULL,
  `desc` text,
  `ident` varchar(64) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `freight` decimal(16,2) DEFAULT NULL,
  `attrs` text,
  `related_recipe_lists` varchar(1000) DEFAULT NULL,
  `promotion_pic` varchar(200) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `desc2` text,
  `foreword` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14927 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_info_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_info_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `category` varchar(1000) DEFAULT NULL,
  `desc` text,
  `ident` varchar(64) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `freight` float DEFAULT NULL,
  `attrs` text,
  `related_recipe_lists` varchar(1000) DEFAULT NULL,
  `promotion_pic` varchar(200) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `desc2` text,
  `foreword` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86089 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_kind`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `kind_name` varchar(500) DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL,
  `original_price` decimal(16,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_delta` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `serial_number` varchar(500) DEFAULT NULL,
  `show_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_kind_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_kind_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `kind_name` varchar(500) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `original_price` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_delta` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `serial_number` varchar(500) DEFAULT NULL,
  `show_position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132353 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_kind_stock`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_kind_stock` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `kind_name` varchar(256) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `modify_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_promotion_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_promotion_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(1000) DEFAULT NULL,
  `category_url` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_promotion_in_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_promotion_in_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_number` int(11) DEFAULT NULL,
  `goods_kind` varchar(500) DEFAULT NULL,
  `goods_type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `gio_id` int(11) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `promotion_type` int(11) DEFAULT NULL,
  `goods_sale_price` decimal(15,2) DEFAULT NULL,
  `goods_daily_buy_limit` int(11) DEFAULT NULL,
  `shop_discount_amount` decimal(15,2) DEFAULT NULL,
  `shop_discount_threshold_amount` decimal(15,2) DEFAULT NULL,
  `promotion_activity_id` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_quick_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_quick_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned DEFAULT NULL,
  `weekly_sales_volume` int(10) unsigned DEFAULT NULL,
  `monthly_sales_volume` int(10) unsigned DEFAULT NULL,
  `total_sales_volume` int(10) unsigned DEFAULT NULL,
  `has_stock` int(11) DEFAULT NULL,
  `enter_into_normal_time` datetime DEFAULT NULL,
  `enter_into_fresh_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `n_reviews` int(10) unsigned DEFAULT NULL,
  `average_rate` float DEFAULT NULL,
  `lowest_price` decimal(16,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `total_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_sale_shop_id_has_stock_weekly_sales_volume` (`type`,`sale`,`shop_id`,`has_stock`,`weekly_sales_volume`),
  KEY `type_sale_has_stock_weekly_sales_volume` (`type`,`sale`,`has_stock`,`weekly_sales_volume`)
) ENGINE=InnoDB AUTO_INCREMENT=14927 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_region`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_region` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `dispatch_area_ids` text,
  `display_area_ids` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9908 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale` int(11) DEFAULT NULL,
  `live_time` datetime DEFAULT NULL,
  `off_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `sale_live_time_id` (`sale`,`live_time`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_schedule3`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_schedule3` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `live_time` datetime DEFAULT NULL,
  `off_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9902 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_goods_stats`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `n_visits` int(11) DEFAULT NULL,
  `sales_volume` int(11) DEFAULT NULL,
  `sales_money` decimal(16,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `count_orders` int(11) DEFAULT '0',
  `count_buyers` int(11) DEFAULT '0',
  `count_customer_service` int(11) DEFAULT '0',
  `count_bad_reviews` int(11) DEFAULT '0',
  `repeat_purchase_rate` double DEFAULT '0',
  `price` decimal(16,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `goods_id_date` (`goods_id`,`date`),
  KEY `shop_id_date` (`shop_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=535869 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) DEFAULT NULL,
  `comment` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_group_member`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_userid_index` (`group_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_group_privilege`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_group_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `priv_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid_userid_index` (`group_id`,`priv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_invitation_reward_for_717`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_invitation_reward_for_717` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inviter_id` int(10) unsigned DEFAULT NULL,
  `rewarded_voucher_id` int(11) DEFAULT NULL,
  `reward_type` int(11) DEFAULT NULL,
  `invitee_id` int(10) unsigned DEFAULT NULL,
  `invitee_phone` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `ref` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `invitee_phone` (`invitee_phone`),
  KEY `rewarded_voucher_id` (`rewarded_voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=469387 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_kuaidi100_record`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_kuaidi100_record` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_manageable_stand`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_manageable_stand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `content` text,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_money_transfer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_money_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_in_order_id` int(11) DEFAULT NULL,
  `fee` decimal(16,2) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `reason` text,
  `transaction_no` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_in_order_id` (`goods_in_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_notice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `article_category` int(11) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_category` (`article_category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL,
  `message` text,
  `freight` decimal(16,2) DEFAULT NULL,
  `delivery_time` varchar(200) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `stock_locked` int(11) DEFAULT NULL,
  `dumped_promotions` varchar(1000) DEFAULT '[]',
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cash_amount` decimal(16,2) DEFAULT '0.00',
  `voucher_amount` decimal(16,2) DEFAULT '0.00',
  `money_back_amount` decimal(16,2) DEFAULT '0.00',
  `stock_locked_time` datetime DEFAULT NULL,
  `parent_order_id` int(11) DEFAULT '-1',
  `hierarchy_status` int(11) DEFAULT '1',
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status_user_id` (`status`,`user_id`),
  KEY `status_shop_id` (`status`,`shop_id`),
  KEY `charge_id` (`charge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_address_region`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_address_region` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `region_code` int(10) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_annotation2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_annotation2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `annotation` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46883 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_change2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_change2` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `order_id` int(11) NOT NULL,
    `shop_id` int(11) NOT NULL,
    `create_time` datetime NOT NULL,
    `status` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`id`),
    KEY `shop_id_create_time` (`shop_id`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_delivery_confirmation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_delivery_confirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deadline` datetime DEFAULT NULL,
  `extend_status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104486 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_hist2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_hist2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `total_price` decimal(16,2) DEFAULT NULL,
  `message` text,
  `freight` decimal(16,2) DEFAULT NULL,
  `delivery_time` varchar(200) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `stock_locked` int(11) DEFAULT NULL,
  `dumped_promotions` varchar(1000) DEFAULT '[]',
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cash_amount` decimal(16,2) DEFAULT '0.00',
  `voucher_amount` decimal(16,2) DEFAULT '0.00',
  `money_back_amount` decimal(16,2) DEFAULT '0.00',
  `stock_locked_time` datetime DEFAULT NULL,
  `parent_order_id` int(11) DEFAULT '-1',
  `hierarchy_status` int(11) DEFAULT '1',
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id_status` (`order_id`,`status`),
  KEY `user_id_status` (`user_id`,`status`),
  KEY `status_create_time` (`status`,`create_time`),
  KEY `status_shop_id_create_time` (`status`,`shop_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4992304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_origin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_origin` (
  `id` int(11) NOT NULL,
  `origin` int(11) NOT NULL DEFAULT '-1',
  `version` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown version',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_reward_voucher`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_reward_voucher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6951 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_star`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `star_shop_id` (`star`,`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=800662 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_statistic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_statistic` (
  `id` int(11) NOT NULL,
  `origin` int(11) NOT NULL DEFAULT '-1',
  `version` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown version',
  `device_id` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown device id',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_time`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_time` (
  `id` int(11) NOT NULL,
  `payment_time` datetime DEFAULT NULL,
  `shipping_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `hierarchy_status` smallint(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `place_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_time` (`payment_time`),
  KEY `shop_id_payment_time` (`shop_id`,`payment_time`),
  KEY `user_id_payment_time` (`user_id`,`payment_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_waybill`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_waybill` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `tracking_id` varchar(100) DEFAULT NULL,
  `courier_name` varchar(100) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tracking_info` (`tracking_id`,`courier_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_outlet`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_outlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `banner` varchar(256) DEFAULT NULL,
  `goods_ids` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `arrangement_mode` int(11) NOT NULL DEFAULT '0',
  `html` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promo_goods_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promo_goods_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promo_request`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promo_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `price` varchar(32) NOT NULL,
  `freight` varchar(32) NOT NULL,
  `stock` varchar(32) NOT NULL,
  `limit` varchar(32) NOT NULL,
  `date` varchar(100) NOT NULL,
  `notes` varchar(500) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promotion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `goods_kind` varchar(500) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `abort_time` datetime DEFAULT NULL,
  `promotion_type` int(11) DEFAULT NULL,
  `goods_sale_price` decimal(15,2) DEFAULT NULL,
  `goods_daily_buy_limit` int(11) DEFAULT NULL,
  `shop_discount_amount` decimal(15,2) DEFAULT NULL,
  `shop_discount_threshold_amount` decimal(15,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `promotion_activity_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_kind_begin_time` (`goods_id`,`goods_kind`(255),`begin_time`),
  KEY `shop_begin_time` (`shop_id`,`begin_time`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promotion_activity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promotion_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `abort_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `promotion_type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promotion_mall_for_717`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promotion_mall_for_717` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `headline_goods_json` text,
  `related_banner_json` text,
  `related_tag_json` text,
  `promotion_category_id` int(10) DEFAULT NULL,
  `mall_url` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promotion_seckilling_for_717`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promotion_seckilling_for_717` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `seckilling_goods_json` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promotion_seckilling_stage_for_717`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promotion_seckilling_stage_for_717` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `seckilling_ids_json` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promotion_voucher_package`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promotion_voucher_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `desc` text,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `meta_vouchers_json` text,
  `voucher_picurl` varchar(500) DEFAULT NULL,
  `voucher_background_picurl` varchar(500) DEFAULT NULL,
  `voucher_unbox_background_picurl` varchar(500) DEFAULT NULL,
  `voucher_social_share_thumb_picurl` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_promotion_voucher_package_issued`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_promotion_voucher_package_issued` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `promotion_voucher_package_id` int(11) DEFAULT NULL,
  `voucher_ids_json` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_promotion_voucher_package_id` (`user_id`,`promotion_voucher_package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258736 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_redeemsrv_code`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_redeemsrv_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(40) DEFAULT NULL,
  `gen_event_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_text` (`text`),
  KEY `code_gen_event_id` (`gen_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2515 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_redeemsrv_code_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_redeemsrv_code_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_info` text,
  `obj_type` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_redeemsrv_code_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_redeemsrv_code_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(40) DEFAULT NULL,
  `gen_event_id` int(11) DEFAULT NULL,
  `redeem_time` datetime DEFAULT NULL,
  `redeemed_obj_id` int(11) DEFAULT NULL,
  `redeemed_obj_type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_redeemsrv_code_log_text` (`text`),
  KEY `ec_redeemsrv_code_log_redeemed_obj_id` (`redeemed_obj_id`),
  KEY `ec_redeemsrv_code_log_id` (`gen_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_refund_application`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_refund_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_in_order_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `reason` text,
  `phone` varchar(24) DEFAULT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `detail_reason` text,
  `goods_status_in_order` int(11) DEFAULT NULL,
  `is_goods_received` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_in_order_id` (`goods_in_order_id`,`status`),
  KEY `order_id` (`order_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=41443 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_refund_application_processing`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_refund_application_processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_application_id` int(11) DEFAULT NULL,
  `reason` text,
  `extra_info_json` text,
  `goods_status_in_order` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_application_id` (`refund_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41045 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_refund_pic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_refund_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_application_id` int(11) DEFAULT NULL,
  `ident` varchar(64) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_application_id` (`refund_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4847 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_review`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `review` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `rate_hist` int(11) DEFAULT '0',
  `essential` int(11) DEFAULT '0',
  `goods_in_order_id` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `review_with_pic` int(11) NOT NULL DEFAULT '0',
  `n_comments` int(11) NOT NULL DEFAULT '0',
  `n_diggs` int(11) DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_goods_in_order_id` (`goods_in_order_id`),
  KEY `shop_id_rate` (`shop_id`,`rate`),
  KEY `goods_id_rate` (`goods_id`,`rate`),
  KEY `goods_id_status` (`goods_id`,`status`),
  KEY `user_id_published` (`user_id`,`published`)
) ENGINE=InnoDB AUTO_INCREMENT=359718 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_review_bonus_auditor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_review_bonus_auditor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) DEFAULT NULL,
  `auditor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bonus` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_review_comment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_review_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_review_digg`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_review_digg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `review_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valid` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`review_id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_review_pic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_review_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) DEFAULT NULL,
  `ident` varchar(64) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33835 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_review_shop_reply`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_review_shop_reply` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `text` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_api_key`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_api_key` (
  `id` int(10) unsigned NOT NULL,
  `public_key` varchar(64) NOT NULL,
  `secret_key` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `public_key` (`public_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_audit_financial_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_audit_financial_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text,
  `audit_state` tinyint(3) NOT NULL DEFAULT '0',
  `submit_user_id` int(11) DEFAULT NULL,
  `audit_user_id` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107333866 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_banner`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(100) DEFAULT NULL,
  `synced` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107333866 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_bill2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_bill2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `receipt_count` int(11) DEFAULT NULL,
  `receipt_amount` decimal(16,2) DEFAULT NULL,
  `payment_count` int(11) DEFAULT NULL,
  `payment_amount` decimal(16,2) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62203 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_commission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `effective_time` datetime DEFAULT NULL,
  `rate` decimal(18,4) DEFAULT NULL,
  `operator_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_custom_banner`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_custom_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `ident` varbinary(100) NOT NULL,
  `synced` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_file`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `server_file_path` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8431 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_financial_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_financial_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text,
  `audit_user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102895275 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_financial_info_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_financial_info_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `info` text,
  `audit_user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_goods_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `shop_id` (`shop_id`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(1000) DEFAULT NULL,
  `shop_url` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `account_no` varchar(100) DEFAULT NULL,
  `account_bank` varchar(100) DEFAULT NULL,
  `agent` varchar(100) DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `carrier` varchar(500) DEFAULT NULL,
  `return_address` varchar(500) DEFAULT NULL,
  `region_restriction` varchar(500) DEFAULT NULL,
  `hotline` varchar(50) DEFAULT NULL,
  `billing_address` varchar(100) DEFAULT NULL,
  `shop_commission_switch` smallint(6) NOT NULL DEFAULT '0',
  `announcement` varchar(100) DEFAULT '',
  `operator_mobile` varchar(20) DEFAULT NULL,
  `invoice_type` tinyint(4) DEFAULT NULL,
  `goods_edit_permission` tinyint(4) DEFAULT NULL,
  `type` int(10) DEFAULT '1',
  `refund_permission` int(11) NOT NULL DEFAULT '0',
  `name` varchar(96) NOT NULL DEFAULT '',
  `group` varchar(20) NOT NULL DEFAULT '',
  `remarks` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107333866 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_info_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_info_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `desc` varchar(1000) DEFAULT NULL,
  `shop_url` varchar(200) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `account_no` varchar(100) DEFAULT NULL,
  `account_bank` varchar(100) DEFAULT NULL,
  `agent` varchar(100) DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `carrier` varchar(500) DEFAULT NULL,
  `return_address` varchar(500) DEFAULT NULL,
  `region_restriction` varchar(500) DEFAULT NULL,
  `hotline` varchar(50) DEFAULT NULL,
  `billing_address` varchar(100) DEFAULT NULL,
  `commission_effective_time` datetime DEFAULT NULL,
  `shop_commission_switch` smallint(6) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `announcement` varchar(100) DEFAULT '',
  `operator_mobile` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2878 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_license`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_license` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_license_id` char(15) NOT NULL,
  `business_license_issuing_organ` varchar(20) NOT NULL,
  `business_license_vaild_start_time` char(10) NOT NULL,
  `business_license_vaild_end_time` char(10) NOT NULL,
  `food_license_id` char(19) NOT NULL,
  `food_license_valid_start_time` char(10) NOT NULL,
  `food_license_valid_end_time` char(10) NOT NULL,
  `business_license_pic_ident` varchar(100) DEFAULT NULL,
  `food_license_pic_ident` varchar(100) DEFAULT NULL,
  `id_card_pic_front_ident` varchar(100) DEFAULT NULL,
  `id_card_pic_back_ident` varchar(100) DEFAULT NULL,
  `check_status` int(3) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `food_license_requirement` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107333866 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_stats`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `n_visits` int(11) DEFAULT NULL,
  `sales_money` decimal(16,2) DEFAULT NULL,
  `count_orders` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `count_buyers` int(11) DEFAULT '0',
  `count_customer_service` int(11) DEFAULT '0',
  `count_bad_reviews` int(11) DEFAULT '0',
  `repeat_purchase_rate` double DEFAULT '0',
  `sales_volume` int(11) DEFAULT '0',
  `count_goods_on_sale` int(11) DEFAULT '0',
  `count_free_freight` int(11) DEFAULT '0',
  `count_goods` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `shop_id_date` (`shop_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=34041 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shopping_point`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shopping_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107350172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shopping_point_from_review`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shopping_point_from_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `review_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=359627 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_sticked_notice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_sticked_notice` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `color` text NOT NULL,
  `link` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_user_level`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_user_level` (
  `id` int(11) NOT NULL,
  `value` decimal(16,2) NOT NULL,
  `level` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_voucher`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `threshold_amount` decimal(16,2) DEFAULT NULL,
  `returned_amount` decimal(16,2) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `issuer_id` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT '-1',
  `shop_id` int(11) DEFAULT '-1',
  `category_id` int(11) DEFAULT '-1',
  `source` int(11) DEFAULT '-1',
  `original_voucher_id` int(11) DEFAULT '-1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_charge_id_begin_time_end_time` (`user_id`,`charge_id`,`begin_time`,`end_time`),
  KEY `charge_id_original_voucher_id` (`charge_id`,`original_voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36512734 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_voucher_for_717`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_voucher_for_717` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2240249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_voucher_pool_for_717`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_voucher_pool_for_717` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_user_id` (`type`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6981 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_waybill`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_waybill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tracking_id` varchar(100) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `ship_to` varchar(100) DEFAULT NULL,
  `ship_from` varchar(100) DEFAULT NULL,
  `message` text,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tracking_info` (`tracking_id`,`courier_id`),
  KEY `status_update_time` (`status`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=638101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word1` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `word2` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `word1` (`word1`),
  KEY `word2` (`word2`)
) ENGINE=InnoDB AUTO_INCREMENT=1204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recommend_time` datetime DEFAULT NULL,
  `n_recommends` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=100049389 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_pr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_pr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1888 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_target`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_target` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  `kind` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target_id_kind` (`target_id`,`kind`),
  KEY `event_id_kind_update_time` (`event_id`,`kind`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=106761802 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_target_user_vote`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_target_user_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `kind` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_target_user_vote` (`event_id`,`target_id`,`kind`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3783 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_target_vote`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_target_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `kind` int(11) NOT NULL,
  `n_votes` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_target_vote` (`event_id`,`target_id`,`kind`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_usage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `last_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_last_time` (`user_id`,`last_time`),
  KEY `user_id_event_id` (`user_id`,`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17006 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expert_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expert_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `skill` text,
  `qq` varchar(256) DEFAULT NULL,
  `weibo` varchar(256) DEFAULT NULL,
  `douban` varchar(256) DEFAULT NULL,
  `recipe_blog` varchar(256) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_weibovip` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=824 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exploration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exploration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `origin_id` int(10) unsigned DEFAULT NULL,
  `destination_id` int(10) unsigned DEFAULT NULL,
  `origin_kind` int(10) unsigned DEFAULT NULL,
  `destination_kind` int(10) unsigned DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `origin_target` (`origin_id`,`origin_kind`),
  KEY `destination_target` (`destination_id`,`destination_kind`)
) ENGINE=InnoDB AUTO_INCREMENT=4685 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feed_user_target` (`user_id`,`cid`,`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=113021794 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `origin` int(11) DEFAULT '0',
  `info` varchar(500) DEFAULT '{}',
  PRIMARY KEY (`id`),
  KEY `feedback_status_user_id` (`status`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14992 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `follow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(10) unsigned NOT NULL,
  `to_id` int(10) unsigned NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ft_unique` (`from_id`,`to_id`),
  KEY `tf` (`to_id`),
  KEY `ft` (`from_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110932986 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `n_topics` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `latest_topic_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `head_recipe`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `head_recipe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `cmt` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=100000867 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_feature`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `warning_score` smallint(6) DEFAULT NULL,
  `color_histogram_vector_json` text,
  `color_histogram_spam_image_feature_id` int(11) DEFAULT NULL,
  `color_histogram_distance` float DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `target_status` (`target_kind`,`target_id`,`status`),
  KEY `author_id_status` (`author_id`,`status`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2628415 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'M',
  `cid` smallint(6) NOT NULL,
  `n_recipes` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(4) NOT NULL DEFAULT '0',
  `rank` int(12) NOT NULL DEFAULT '0',
  `threshold` float NOT NULL DEFAULT '0',
  `include_recipe` tinyint(4) DEFAULT '1',
  `synced` int(11) DEFAULT '0',
  `ident` varbinary(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=52484 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_ad`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `price` float unsigned NOT NULL DEFAULT '0',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'kg',
  `annotation` varchar(128) DEFAULT '',
  `ing_id` int(11) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_collect`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ing_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`ing_id`),
  KEY `ing_id` (`ing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100017399 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_contain`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_contain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ing_id1` int(10) unsigned NOT NULL,
  `ing_id2` int(10) unsigned NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ing_id1` (`ing_id1`),
  KEY `ing_contain_ing_id2` (`ing_id2`)
) ENGINE=InnoDB AUTO_INCREMENT=6206 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_detail` (
  `id` int(10) unsigned NOT NULL,
  `short` varbinary(30) NOT NULL,
  `pic_ver` smallint(6) NOT NULL DEFAULT '0',
  `alias` blob,
  `hid_alias` blob,
  `announce` blob,
  `season` blob,
  `effect` blob,
  `store_time` blob,
  `store_method` blob,
  `pick` blob,
  `synced` int(11) NOT NULL DEFAULT '0',
  `ident` varbinary(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_equal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_equal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ing_id1` int(10) unsigned NOT NULL,
  `ing_id2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ing_id1` (`ing_id1`),
  KEY `ing_id2_index` (`ing_id2`)
) ENGINE=InnoDB AUTO_INCREMENT=10646 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_nutrition`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_nutrition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ing_id` int(10) unsigned NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '1',
  `nutrition` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `quantity` float unsigned NOT NULL,
  `unit` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ing_nutrition_pos` (`ing_id`,`pos`),
  KEY `nutrition` (`nutrition`)
) ENGINE=InnoDB AUTO_INCREMENT=22187 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_price_edit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_price_edit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ing_id` int(10) unsigned NOT NULL,
  `price` float unsigned NOT NULL DEFAULT '0',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'kg',
  `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `market` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ing_id` (`ing_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_recs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_recs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ing_id1` int(10) unsigned NOT NULL,
  `ing_id2` int(10) unsigned NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=586071 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_season`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_season` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ing_id` int(10) unsigned NOT NULL,
  `week` int(10) unsigned NOT NULL,
  `n_dishes` int(10) unsigned NOT NULL DEFAULT '0',
  `n_dishes_mod` float NOT NULL DEFAULT '0',
  `n_dishes_ratio` float NOT NULL DEFAULT '0',
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ing_id` (`ing_id`),
  KEY `week` (`week`),
  KEY `week_ing_id` (`week`,`ing_id`),
  KEY `score` (`score`)
) ENGINE=InnoDB AUTO_INCREMENT=100211814 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_tip`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_tip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ing_id` int(10) unsigned NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '1',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `body` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ing_id_pos` (`ing_id`,`pos`)
) ENGINE=InnoDB AUTO_INCREMENT=2373 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ing_tree`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ing_tree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `child_id` int(10) unsigned DEFAULT NULL,
  `level` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3939 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipad_token`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipad_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(100) NOT NULL,
  `badge` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `user_id_token` (`user_id`,`token`)
) ENGINE=InnoDB AUTO_INCREMENT=12879009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipaddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_ip` bigint(20) DEFAULT NULL,
  `end_ip` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `start_ip` (`start_ip`),
  UNIQUE KEY `end_ip` (`end_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=441062 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_token`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `badge` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `user_id_token` (`user_id`,`token`)
) ENGINE=InnoDB AUTO_INCREMENT=157033285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `publish_date` date NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publish_date` (`publish_date`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_item`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(500) NOT NULL,
  `template` int(11) NOT NULL,
  `column_name` varchar(100) NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `contents_json` text NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_id` (`issue_id`),
  KEY `issue_id_publish_time` (`issue_id`,`publish_time`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword_entire`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_entire` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txt` varchar(64) DEFAULT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword_pop`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_pop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txt` varchar(64) DEFAULT NULL,
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=232561 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword_recent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_recent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txt` varchar(64) DEFAULT '',
  `day` smallint(6) NOT NULL DEFAULT '0',
  `hour` tinyint(4) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `day_hour_txt` (`day`,`hour`,`txt`)
) ENGINE=InnoDB AUTO_INCREMENT=15700581 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `misckv`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misckv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `normal_image_feature`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `normal_image_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `color_histogram_vector_json` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2626505 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification1`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `extra` text NOT NULL,
  `create_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `receiver_id_delete_time_create_time_action_id` (`receiver_id`,`delete_time`,`create_time`,`action`,`id`),
  KEY `receiver_id_action_id` (`receiver_id`,`action`,`id`),
  KEY `action_sender_id_receiver_id_target_id` (`action`,`sender_id`,`receiver_id`,`target_id`),
  KEY `group_id_delete_time` (`group_id`,`delete_time`),
  KEY `delete_time` (`delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=296874419 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL,
  `n_unread_notifications` int(11) DEFAULT NULL,
  `pickled_sample_notifications` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `latest_notification_time` datetime DEFAULT NULL,
  `n_total_notifications` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `receiver_id_action_target_id_read_status` (`receiver_id`,`action`,`target_id`,`read_status`)
) ENGINE=InnoDB AUTO_INCREMENT=39084147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_r1`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_r1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `extra` text,
  `create_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291398973 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `total_pv` int(11) unsigned NOT NULL DEFAULT '0',
  `paid_pv` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4479 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_recipe_list_weight_by_recipe`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_recipe_list_weight_by_recipe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `recipe_list_id` int(10) unsigned NOT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id_weight` (`recipe_id`,`weight`)
) ENGINE=InnoDB AUTO_INCREMENT=2310564 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_recipe_list_weight_by_recipe2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_recipe_list_weight_by_recipe2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `recipe_list_id` int(10) unsigned NOT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id_weight` (`recipe_id`,`weight`)
) ENGINE=InnoDB AUTO_INCREMENT=107331186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `recipe_list_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2020 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `query_click`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_click` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(60) NOT NULL,
  `search_type` tinyint(1) NOT NULL,
  `query_cnt` int(11) NOT NULL,
  `target_click_json` text NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_query` (`query`(10),`search_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `text` varchar(2000) DEFAULT '',
  `score` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `n_answers` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recipe_order_by_score` (`recipe_id`,`status`,`score`)
) ENGINE=InnoDB AUTO_INCREMENT=100054344 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cat` smallint(6) NOT NULL DEFAULT '0',
  `flag` int(11) NOT NULL DEFAULT '0',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A',
  `pic_ver` smallint(5) NOT NULL DEFAULT '0',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `desc` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tips` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ref` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `n_comments` smallint(6) NOT NULL DEFAULT '0',
  `n_collects` int(10) unsigned NOT NULL DEFAULT '0',
  `storage` smallint(5) NOT NULL DEFAULT '0',
  `subject_id` int(10) unsigned DEFAULT NULL,
  `video_address` varbinary(2048) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `synced` int(11) NOT NULL DEFAULT '0',
  `ident` varbinary(100) NOT NULL DEFAULT '',
  `ndishes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `author_id` (`author_id`),
  KEY `ct_index` (`create_time`),
  KEY `recipe_subject_id` (`subject_id`),
  KEY `status` (`status`),
  KEY `author_id_create_time` (`author_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100566095 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_cat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `cat_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_name` (`cat_name`),
  KEY `recipe_id` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102454829 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_cat_batch`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_cat_batch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `cat_name` varchar(120) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_name` (`cat_name`),
  KEY `recipe_id` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_cols`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_cols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id1` int(10) unsigned NOT NULL,
  `recipe_id2` int(10) unsigned NOT NULL,
  `score` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id1` (`recipe_id1`)
) ENGINE=InnoDB AUTO_INCREMENT=101027760 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_comment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `recipe_id` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100470680 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_couple`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_couple` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id1` int(10) unsigned NOT NULL,
  `recipe_id2` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject_id1` int(10) unsigned DEFAULT NULL,
  `subject_id2` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id1` (`recipe_id1`),
  KEY `recipe_id2` (`recipe_id2`),
  KEY `subject_id1` (`subject_id1`),
  KEY `subject_id2` (`subject_id2`),
  KEY `recipe_id1_id2_user` (`recipe_id1`,`recipe_id2`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101423017 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_draft`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL DEFAULT '0',
  `draft` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_draft_user_id_recipe_id` (`user_id`,`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_extra`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_extra` (
  `id` int(10) unsigned NOT NULL,
  `origin` smallint(6) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_goods`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(20) NOT NULL,
  `desc` varchar(1000) NOT NULL DEFAULT '',
  `ident` varchar(64) NOT NULL DEFAULT '',
  `synced` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_honor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_honor` (
  `id` int(10) unsigned NOT NULL,
  `score` float NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_ing1`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_ing1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '1',
  `ing` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `unit` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `index` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varbinary(1) DEFAULT 'S',
  `create_time` datetime DEFAULT NULL,
  `match_word` varbinary(120) DEFAULT '',
  `norm_ing_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_id_index_pos_status` (`recipe_id`,`index`,`pos`,`status`),
  KEY `ing` (`ing`),
  KEY `norm_ing_id` (`norm_ing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107064402 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_ing_weight`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_ing_weight` (
  `id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_list`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `desc` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pic_ver` smallint(5) NOT NULL DEFAULT '0',
  `author_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `n_comments` int(11) NOT NULL DEFAULT '0',
  `status` char(1) DEFAULT 'A',
  `join_pic_ver` smallint(6) NOT NULL DEFAULT '0',
  `synced` int(11) NOT NULL DEFAULT '0',
  `ident` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `author_id_update_time` (`author_id`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=102267680 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_list_cat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_list_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_list_id` int(10) unsigned NOT NULL,
  `cat_name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_name` (`cat_name`),
  KEY `recipe_list_id` (`recipe_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_list_collect`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_list_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `recipe_list_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `create_time_id` (`create_time`,`recipe_list_id`),
  KEY `recipe_list_id_user_id` (`recipe_list_id`,`user_id`),
  KEY `user_id_recipe_list_id` (`user_id`,`recipe_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108527212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_list_comment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_list_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_list_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `recipe_list_index` (`recipe_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000998 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_list_item`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_list_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_list_id` int(10) unsigned NOT NULL,
  `recipe_id` int(10) unsigned NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(800) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_list_index` (`recipe_list_id`,`recipe_id`),
  KEY `recipe_id_recipe_list_id` (`recipe_id`,`recipe_list_id`),
  KEY `recipe_list_id_rank` (`recipe_list_id`,`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=107337502 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_list_pv`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_list_pv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pv` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102267105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_list_recommend`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_list_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n_recommends` smallint(6) NOT NULL DEFAULT '0',
  `recommend_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `n_recommends` (`n_recommends`,`recommend_time`)
) ENGINE=InnoDB AUTO_INCREMENT=102267543 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_mark`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `pic_ver` smallint(5) NOT NULL DEFAULT '0',
  `storage` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100048620 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_module`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `index` int(10) unsigned NOT NULL DEFAULT '0',
  `pic_ver` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `flag` int(10) unsigned NOT NULL DEFAULT '0',
  `belong` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_index_belong` (`recipe_id`,`index`,`belong`)
) ENGINE=InnoDB AUTO_INCREMENT=100000004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_pic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `ver` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `recipe_id_ver` (`recipe_id`,`ver`)
) ENGINE=InnoDB AUTO_INCREMENT=4011 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_pr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_pr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(150) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1414 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_pv`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_pv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pv` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4294967295 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_pv_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_pv_hist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `day` date NOT NULL,
  `pv` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_rank2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_rank2` (
  `id` int(10) unsigned NOT NULL,
  `rank` float unsigned NOT NULL DEFAULT '0',
  `month_rank` float unsigned NOT NULL DEFAULT '0',
  `heat` float unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_rate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` int(11) NOT NULL,
  `recipe_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_user_id` (`recipe_id`,`user_id`),
  KEY `recipe_rate` (`rate`),
  KEY `recipe_id_rate` (`recipe_id`,`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=100824980 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_recs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_recs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id1` int(10) unsigned NOT NULL,
  `recipe_id2` int(10) unsigned NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `recipe_id1` (`recipe_id1`)
) ENGINE=InnoDB AUTO_INCREMENT=124764936 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_rels`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_rels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id1` int(10) unsigned NOT NULL,
  `recipe_id2` int(10) unsigned NOT NULL,
  `rank` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_recipe_id1` (`recipe_id1`)
) ENGINE=InnoDB AUTO_INCREMENT=11010097 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_rising`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_rising` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_id` (`recipe_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100016242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_score`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_score` (
  `id` int(10) unsigned NOT NULL,
  `score` float NOT NULL DEFAULT '-1',
  `create_time` datetime DEFAULT NULL,
  `honorlist_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `score` (`score`),
  KEY `create_time` (`create_time`),
  KEY `honorlist_time` (`honorlist_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_step2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_step2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '1',
  `step` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `index` int(10) unsigned NOT NULL DEFAULT '0',
  `pic_ver` int(10) unsigned NOT NULL DEFAULT '0',
  `storage` smallint(5) NOT NULL DEFAULT '0',
  `synced` int(11) NOT NULL DEFAULT '0',
  `ident` varbinary(100) NOT NULL DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_id_index_pos` (`recipe_id`,`index`,`pos`)
) ENGINE=InnoDB AUTO_INCREMENT=103188123 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_top`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_top` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) unsigned NOT NULL,
  `recipe_id` int(10) unsigned NOT NULL,
  `rank` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_cat` (`recipe_id`,`cat`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB AUTO_INCREMENT=100250168 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommend`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `recipe_id` int(10) unsigned NOT NULL,
  `rank` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ft_unique` (`user_id`,`recipe_id`),
  KEY `tf` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111360653 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_tree`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_tree` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL,
  `child_id` int(10) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=1675 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(5) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  `target_owner_id` int(11) NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `reason_type` int(10) DEFAULT NULL,
  `txt` text,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110772 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segment_unit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segment_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(120) NOT NULL,
  `lexical_category` varchar(20) NOT NULL,
  `priority` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3043 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shout`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `longitude` float(9,6) NOT NULL DEFAULT '0.000000',
  `latitude` float(9,6) NOT NULL DEFAULT '0.000000',
  `content` text,
  `n_comments` smallint(6) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `latest_comment_time` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `status_gps_update_time` (`status`,`longitude`,`latitude`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7987 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shout_comment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shout_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shout_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `shout_id` (`shout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `index` smallint(5) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `speical_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `special_item`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_item` (
  `id` int(10) unsigned NOT NULL,
  `special_id` int(10) NOT NULL,
  `author_intro` varchar(100) NOT NULL,
  `rl_intro` varchar(500) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `synced` int(11) NOT NULL,
  `ident` varbinary(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `static_keyword`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` int(10) NOT NULL,
  `desc` varchar(1024) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1012110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject1`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'O',
  `desc` varchar(1024) NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=100085878 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject_ing`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_ing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) unsigned NOT NULL,
  `ing` varchar(120) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'S',
  `num` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `ing` (`ing`)
) ENGINE=InnoDB AUTO_INCREMENT=2163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t` (
  `id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `target_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_type_name` (`target_type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=844 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `review` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `text_feature`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` text,
  `status` smallint(6) DEFAULT NULL,
  `filter_number` smallint(6) DEFAULT NULL,
  `warning_score` smallint(6) DEFAULT NULL,
  `spam_contact_info` varchar(200) DEFAULT NULL,
  `suspect_contact_info` varchar(200) DEFAULT NULL,
  `spam_strict_keyword` varchar(200) DEFAULT NULL,
  `bayesian_probability` float DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `spam_suspect_keyword` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `target_status` (`target_kind`,`target_id`,`status`),
  KEY `author_id_status` (`author_id`,`status`),
  KEY `suspect_contact_info_status` (`suspect_contact_info`,`status`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2425797 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `n_comments` smallint(6) NOT NULL DEFAULT '0',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `latest_comment_time` datetime DEFAULT NULL,
  `forum_id` int(11) DEFAULT '1',
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forum_id_status_latest_comment_time` (`forum_id`,`status`,`latest_comment_time`)
) ENGINE=InnoDB AUTO_INCREMENT=47292 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topic_comment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292296 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(96) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_id` binary(12) DEFAULT NULL,
  `pic_ver` smallint(5) NOT NULL DEFAULT '0',
  `flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A',
  `bits` bigint(20) unsigned NOT NULL DEFAULT '0',
  `n_comments` smallint(6) NOT NULL DEFAULT '0',
  `auth_state` int(11) NOT NULL DEFAULT '10',
  `storage` smallint(6) NOT NULL DEFAULT '0',
  `synced` int(11) NOT NULL DEFAULT '0',
  `ident` varbinary(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=107350294 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_auth`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL DEFAULT '0',
  `mail` varbinary(63) NOT NULL DEFAULT '',
  `password` binary(32) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_comment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100015890 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_config`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conf` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107350293 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_extra`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_extra` (
  `id` int(10) unsigned NOT NULL,
  `origin` smallint(6) NOT NULL DEFAULT '-1',
  `register_ip` varchar(64) NOT NULL DEFAULT '',
  `last_visit_origin` smallint(6) NOT NULL DEFAULT '-1',
  `last_visit_time` datetime DEFAULT NULL,
  `last_visit_ip` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` smallint(3) DEFAULT NULL,
  `home_city` int(11) DEFAULT NULL,
  `home_province` int(11) DEFAULT NULL,
  `current_city` int(11) DEFAULT NULL,
  `current_province` int(11) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_oauth`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `token` varbinary(300) DEFAULT '',
  `secret` varbinary(300) DEFAULT '',
  `uid` int(10) unsigned DEFAULT NULL,
  `openid` varbinary(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_oauth_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=100000073 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_oauth2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_oauth2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_provider` tinyint(3) unsigned NOT NULL,
  `access_token` varbinary(300) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `third_party_id` varbinary(300) NOT NULL,
  `state` tinyint(3) unsigned DEFAULT '0',
  `refresh_token` varbinary(300) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `expire_time` int(11) NOT NULL DEFAULT '0',
  `tp_nickname` varbinary(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_oauth2_index` (`user_id`,`service_provider`),
  KEY `third_party_id_state` (`third_party_id`(7),`state`),
  KEY `third_party_id_state2` (`third_party_id`,`state`),
  KEY `third_party_id` (`third_party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107112225 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_phone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_phone` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(32) DEFAULT NULL,
  `country_code` varchar(16) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `bind_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_code_phone_number_status` (`country_code`,`phone_number`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=107350294 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_phone_hist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_phone_hist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(32) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `country_code` varchar(16) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1183545 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_priority`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_priority` (
  `id` int(10) unsigned NOT NULL,
  `honorlist_visit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_rank`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rank` (
  `id` int(10) unsigned NOT NULL,
  `rank` float DEFAULT '0',
  `digg_weight` float NOT NULL DEFAULT '0',
  `dish_weight` float NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_spam_record`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_spam_record` (
  `id` int(10) unsigned NOT NULL,
  `n_spam` int(11) NOT NULL DEFAULT '0',
  `n_norm` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_txt`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txt` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107350291 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_uuid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_uuid` (
  `id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uuid` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uuid_login`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uuid_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `man_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` binary(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viewed_recommend`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewed_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `recipe_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`recipe_id`),
  KEY `recipe_id` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69323 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip` (
  `id` int(10) unsigned NOT NULL,
  `realname` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `idno` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `payment` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `desc` text CHARACTER SET utf8,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `score` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vote` (`answer_id`,`status`,`score`)
) ENGINE=InnoDB AUTO_INCREMENT=100015966 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wechat_openid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(128) DEFAULT NULL,
  `unionid` varchar(128) DEFAULT NULL,
  `platform` int(11) DEFAULT NULL,
  `access_token` varchar(512) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unionid_platform` (`unionid`,`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weekly_sub`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekly_sub` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail` varbinary(63) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `key` binary(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2043309 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03  2:01:41

-- Table structure for table `ec_goods_customs_clearance_in_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_goods_customs_clearance_in_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `goods_in_order_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_order_customs_clearance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_customs_clearance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `merchant_customs_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_customs_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alipay_declare_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alipay_trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customs` int(11) DEFAULT NULL,
  `error_message` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ec_shop_customs_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shop_customs_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `merchant_customs_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_customs_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customs` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `ec_points` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `user_id` int(11) NOT NULL,
      `available_amount` decimal(16,2) DEFAULT '0.00',
      `expenditure_amount` decimal(16,2) DEFAULT '0.00',
      `income_amount` decimal(16,2) DEFAULT '0.00',
      `balance_year` int(11) DEFAULT 0,
      `create_time` datetime NOT NULL,
      `update_time` datetime NOT NULL,
      `balance_amount` decimal(16,2) DEFAULT '0.00',
       PRIMARY KEY (`id`),
       KEY `user_id` (`user_id`)

);

CREATE TABLE `ec_points_income` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) NOT NULL,
    `kind` int(11) NOT NULL,
    `foreign_key` int(11) NOT NULL,
    `amount` decimal(16,2) DEFAULT '0.00',
    `text` varchar(200) DEFAULT '',
    `create_time` datetime NOT  NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `foreign_key` (`foreign_key`)
);

CREATE TABLE `ec_points_expenditure` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) NOT NULL,
    `kind` int(11) NOT NULL,
    `foreign_key` int(11) NOT NULL,
    `amount` decimal(16,2) DEFAULT '0.00',
    `text` varchar(200) DEFAULT '',
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `foreign_key` (`foreign_key`)
);


CREATE TABLE `ec_goods_in_order_query` (
  `id` int(10) unsigned NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_query_status` tinyint(4) NOT NULL,
  `review_status` tinyint(4) NOT NULL,
  `goods_type` tinyint(4) NOT NULL,
  `payment_time` datetime DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `place_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_id` (`order_id`),
  KEY `order_query_status` (`order_query_status`),
  KEY `payment_time` (`payment_time`),
  KEY `receipt_name` (`receipt_name`(4)),
  KEY `phone` (`phone`(11)),
  KEY `place_time` (`place_time`)
);


CREATE TABLE `sp_hog_spam_feature2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(100) DEFAULT NULL,
  `vector_json` text,
  `nearest_normal_feature_angle` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  unique key `ident` (`ident`)
);


CREATE TABLE `sp_hog_ham_feature2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(100) DEFAULT NULL,
  `vector_json` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  unique key `ident` (`ident`)
);


CREATE TABLE `sp_color_spam_feature2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(100) DEFAULT NULL,
  `vector_json` text,
  `nearest_normal_feature_angle` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  unique key `ident` (`ident`)
);


CREATE TABLE `sp_color_ham_feature2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(100) DEFAULT NULL,
  `vector_json` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  unique key `ident` (`ident`)
);


CREATE TABLE `sp_qiniu_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `ident` varchar(200) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `examined_status` smallint(6) DEFAULT NULL,
  `examined_time` datetime DEFAULT NULL,
  `confirmed_status` smallint(6) DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `review_priority` float DEFAULT NULL,
  `qiniu_feature_json` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_kind_target_id` (`target_kind`,`target_id`),
  KEY `target_kind_status_review_priority` (`target_kind`,`status`,`review_priority`),
  KEY `status` (`status`)
);



CREATE TABLE `sp_hog_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `ident` varchar(200) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `examined_status` smallint(6) DEFAULT NULL,
  `examined_time` datetime DEFAULT NULL,
  `confirmed_status` smallint(6) DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `vector_json` text,
  `nearest_spam_feature_id` int(11) DEFAULT NULL,
  `nearest_angle` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_kind_target_id` (`target_kind`,`target_id`),
  KEY `target_kind_status_nearest_angle` (`target_kind`,`status`,`nearest_angle`),
  KEY `status` (`status`)
);



CREATE TABLE `sp_color_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `ident` varchar(200) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `examined_status` smallint(6) DEFAULT NULL,
  `examined_time` datetime DEFAULT NULL,
  `confirmed_status` smallint(6) DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `vector_json` text,
  `nearest_spam_feature_id` int(11) DEFAULT NULL,
  `nearest_angle` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_kind_target_id` (`target_kind`,`target_id`),
  KEY `target_kind_status_nearest_angle` (`target_kind`,`status`,`nearest_angle`),
  KEY `status` (`status`)
);



CREATE TABLE `sp_contact_info_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` text,
  `contact_info` varchar(200) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `examined_status` smallint(6) DEFAULT NULL,
  `examined_time` datetime DEFAULT NULL,
  `confirmed_status` smallint(6) DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_kind_target_id` (`target_kind`,`target_id`),
  KEY `target_kind_status_contact_info` (`target_kind`,`status`,`contact_info`),
  KEY `status` (`status`)
);


CREATE TABLE `sp_keyword_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` text,
  `keyword` varchar(200) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `examined_status` smallint(6) DEFAULT NULL,
  `examined_time` datetime DEFAULT NULL,
  `confirmed_status` smallint(6) DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_kind_target_id` (`target_kind`,`target_id`),
  KEY `target_kind_status_contact_info` (`target_kind`,`status`,`keyword`),
  KEY `status` (`status`)
);


CREATE TABLE `sp_bayesian_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` text,
  `probability` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `examined_status` smallint(6) DEFAULT NULL,
  `examined_time` datetime DEFAULT NULL,
  `confirmed_status` smallint(6) DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_kind_target_id` (`target_kind`,`target_id`),
  KEY `target_kind_status_contact_info` (`target_kind`,`status`,`probability`),
  KEY `status` (`status`)
);


CREATE TABLE `sp_content_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_kind` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` text,
  `ident` varchar(200) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_kind_target_id` (`target_kind`,`target_id`),
  KEY `target_kind_status` (`target_kind`,`status`),
  KEY `author_id` (`author_id`)
);


CREATE TABLE `sp_author_suspect2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `author_score` float,
  `status` smallint(6) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`author_id`),
  key `status` (`status`)
);


CREATE TABLE `sp_contact_info_spam_feature2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_info` varchar(150),
  `examined_count` int DEFAULT NULL,
  `spam_count` int DEFAULT NULL,
  `ham_count` int DEFAULT NULL,
  `status` smallint,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_info` (`contact_info`),
  key `status` (`status`)
);


CREATE TABLE `annual_review` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) NOT NULL,
    `year` int(11) NOT NULL,
    `review_json` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_year` (`user_id`,`year`)
);


CREATE TABLE `ec_goods_related` (
	`id` int(11) NOT NULL,
	`prob_json` blob,
	`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
);


CREATE TABLE `ec_goods_related_records` (
	`id` int(11) NOT NULL,
	`feedback_json` BLOB NOT NULL,
	`click_json` BLOB NOT NULL,
	`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`_created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `_updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
);


CREATE TABLE `ec_bill_ledger` (
	`id` int(11) NOT NULL,
	`date` date DEFAULT NULL,
	`bill_json` BLOB,
	`create_time` datetime DEFAULT NULL,
	`update_time` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
);


CREATE TABLE `ec_goods_tree_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `_created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `_updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
);


CREATE TABLE `ec_goods_in_tree_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `tree_category_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `_created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `_updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `tree_category_id` (`tree_category_id`)
);


CREATE TABLE `ec_goods_tree_category_tree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT '1',
  `_created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `_updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`,`level`)
);


CREATE TABLE `ec_stats_data_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
);


CREATE TABLE `related_query` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `query` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `related_query_json` text NOT NULL,
    `_created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `_updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

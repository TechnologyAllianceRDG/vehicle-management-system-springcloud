-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: rm-bp12gjcylbvar819iao.mysql.rds.aliyuncs.com    Database: dra
-- ------------------------------------------------------
-- Server version	8.0.25

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a514f804-9566-11ec-b8e6-00163e187310:1-1204757';

--
-- Current Database: `dra`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dra` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dra`;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
                       `car_id` varchar(80) NOT NULL,
                       `car_num` varchar(20) NOT NULL,
                       UNIQUE KEY `car_car_num_uindex` (`car_num`),
                       UNIQUE KEY `car_id` (`car_id`,`car_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='车辆信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('1','贵D33210'),('a361443c-47c5-4f5d-b2b1-55ac0f728f4f','5555'),('c2eceeea-a939-4627-b0a9-201f30a5754e','贵D33212'),('d440d7f4-8c6e-431b-9145-d7082e58996b','贵D33211');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_date`
--

DROP TABLE IF EXISTS `car_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_date` (
                            `car_id` varchar(80) NOT NULL,
                            `car_pro_time` datetime NOT NULL,
                            `lastMaintain` datetime DEFAULT NULL,
                            PRIMARY KEY (`car_id`),
                            UNIQUE KEY `car_msg_carId_uindex` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_date`
--

LOCK TABLES `car_date` WRITE;
/*!40000 ALTER TABLE `car_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_gps`
--

DROP TABLE IF EXISTS `car_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_gps` (
                           `car_id` varchar(80) NOT NULL,
                           `gps_id` varchar(80) NOT NULL,
                           UNIQUE KEY `car_gps_car_id_uindex` (`car_id`),
                           UNIQUE KEY `car_gps_gps_id_uindex` (`gps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_gps`
--

LOCK TABLES `car_gps` WRITE;
/*!40000 ALTER TABLE `car_gps` DISABLE KEYS */;
INSERT INTO `car_gps` VALUES ('1','2d86ed61-cb10-4fb1-b8ae-6c756216a98c'),('a361443c-47c5-4f5d-b2b1-55ac0f728f4f','98fd134c-ab03-4997-a424-0c9b3459a885'),('d440d7f4-8c6e-431b-9145-d7082e58996b','cde209fd-3467-4072-a067-f94fd2d4e34b');
/*!40000 ALTER TABLE `car_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gps`
--

DROP TABLE IF EXISTS `gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gps` (
                       `gps_id` varchar(80) NOT NULL,
                       `gps_name` varchar(20) DEFAULT NULL,
                       `gps_type` varchar(20) DEFAULT NULL,
                       PRIMARY KEY (`gps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gps`
--

LOCK TABLES `gps` WRITE;
/*!40000 ALTER TABLE `gps` DISABLE KEYS */;
INSERT INTO `gps` VALUES ('2d86ed61-cb10-4fb1-b8ae-6c756216a98c','干饭一号','GPS/BD'),('98fd134c-ab03-4997-a424-0c9b3459a885','4','8'),('cde209fd-3467-4072-a067-f94fd2d4e34b','干饭二号','GPS/BD'),('e5c332d5-9bef-416d-b498-5f9c14ee3547','2','2'),('f45ee9c1-291c-4111-9243-9b636f040731','3','3');
/*!40000 ALTER TABLE `gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gps_log`
--

DROP TABLE IF EXISTS `gps_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gps_log` (
                           `gps_id` varchar(80) NOT NULL,
                           `time` datetime NOT NULL,
                           `position_x` double DEFAULT NULL,
                           `position_y` double DEFAULT NULL,
                           PRIMARY KEY (`gps_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gps_log`
--

LOCK TABLES `gps_log` WRITE;
/*!40000 ALTER TABLE `gps_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_mail`
--

DROP TABLE IF EXISTS `push_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_mail` (
                             `id` int NOT NULL,
                             `mail` varchar(80) NOT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `push_mail_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_mail`
--

LOCK TABLES `push_mail` WRITE;
/*!40000 ALTER TABLE `push_mail` DISABLE KEYS */;
INSERT INTO `push_mail` VALUES (1,'draso@vip.qq.com');
/*!40000 ALTER TABLE `push_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `login`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `login` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `login`;

--
-- Table structure for table `background`
--

DROP TABLE IF EXISTS `background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `background` (
                              `id` varchar(80) NOT NULL,
                              `username` varchar(20) NOT NULL,
                              `password` varchar(20) NOT NULL,
                              `last_time` datetime DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `background_id_uindex` (`id`),
                              UNIQUE KEY `background_username_uindex` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='后台管理用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background`
--

LOCK TABLES `background` WRITE;
/*!40000 ALTER TABLE `background` DISABLE KEYS */;
INSERT INTO `background` VALUES ('1','admin','123456',NULL),('21647953775182','jmj','ssss',NULL),('21647953821307','jj','ss',NULL),('21647957179713','33','33',NULL),('21647957315225','44','4',NULL);
/*!40000 ALTER TABLE `background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `element` (
                           `element_id` varchar(20) NOT NULL,
                           `element_encode` varchar(50) DEFAULT NULL,
                           PRIMARY KEY (`element_id`),
                           UNIQUE KEY `element_element_id_uindex` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='页面元素';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES ('1','/login/user.do'),('10','/pas/deleteElementFromRole.do'),('11','/pas/deleteFileFromRole.do'),('12','/pas/deleteMenuFromRole.do'),('13','/pas/searchRoleByUsername.do'),('14','/pas/searchPowerByRoleId.do'),('15','/pas/searchElementByPowerId.do'),('16','/pas/searchFileByPowerId.do'),('17','/pas/searchMenuByPowerId.do'),('18','/pedit/addrole.do'),('19','/pedit/uprole.do'),('2','/login/bg.do'),('20','/pedit/delrole.do'),('21','/pedit/getrole.do'),('22','/pedit/getsrole.do'),('23','/pedit/addpower.do'),('24','/pedit/uppower.do'),('25','/pedit/delpower.do'),('26','/pedit/getpower.do'),('27','/pedit/getspower.do'),('28','/pedit/addele.do'),('29','/pedit/upele.do'),('3','/pas/addRoleToUser.do'),('30','/pedit/delele.do'),('31','/pedit/getele.do'),('32','/pedit/getsele.do'),('33','/pedit/addfile.do'),('34','/pedit/upfile.do'),('35','/pedit/delfile.do'),('36','/pedit/getfile.do'),('37','/pedit/getsfile.do'),('38','/pedit/addmenu.do'),('39','/pedit/upmenu.do'),('4','/pas/addPowerToRole.do'),('40','/pedit/delmenu.do'),('41','/pedit/getmenu.do'),('42','/pedit/getsmenu.do'),('43','/pedit/upuser.do'),('44','/pedit/deluser.do'),('45','/pedit/getuser.do'),('46','/pedit/getusername.do'),('47','/pedit/getsuser.do'),('48','/pedit/upbg.do'),('49','/pedit/delbg.do'),('5','/pas/addElementToPower.do'),('50','/pedit/getbg.do'),('51','/pedit/getbgname.do'),('52','/pedit/getsbg.do'),('53','/reg/user.do'),('54','/reg/bg.do'),('55','/findUser.do'),('56','/pushmail/addpushmail.do'),('57','/pushmail/delpushmail.do'),('58','/pushmail/uppushmail.do'),('59','/pushmail/selpushmail.do'),('6','/pas/addFileToPower.do'),('60','/sendcode.do'),('61','/car/add.do'),('62','/car/del.do'),('63','/car/up.do'),('64','/car/search.do'),('65','/car/search_gps.do'),('66','/car_gps/add.do'),('666','333'),('67','/car_gps/del.do'),('68','/car_gps/up.do'),('69','/car_gps/search.do'),('7','/pas/addMenuToPower.do'),('70','/gps/add.do'),('71','/gps/del.do'),('72','/gps/up.do'),('73','/gps/search.do'),('74','/gps/search_car.do'),('75','/gps_log/add.do'),('76','/gps_log/search.do'),('8','/pas/deleteRoleFromUser.do'),('9','/pas/deletePowerFromRole.do');
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
                        `file_id` varchar(20) NOT NULL,
                        `file_name` varchar(50) NOT NULL,
                        `file_url` varchar(100) NOT NULL,
                        PRIMARY KEY (`file_id`),
                        UNIQUE KEY `file_file_id_uindex` (`file_id`),
                        UNIQUE KEY `file_file_name_uindex` (`file_name`),
                        UNIQUE KEY `file_file_url_uindex` (`file_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES ('1','test','/dada/adad');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
                        `menu_id` varchar(20) NOT NULL,
                        `menu_name` varchar(30) NOT NULL,
                        `menu_url` varchar(80) NOT NULL,
                        `menu_parent_id` varchar(20) DEFAULT NULL,
                        UNIQUE KEY `menu_menu_id_uindex` (`menu_id`),
                        UNIQUE KEY `menu_menu_name_uindex` (`menu_name`),
                        UNIQUE KEY `menu_menu_url_uindex` (`menu_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('11','申请审批','/Application','0'),('12','派车订单','/Audit','11'),('13','维修订单','/request','11'),('14','车辆监管','/Vehicle','0'),('15','车辆定位','/Vehiclepositioning','14'),('16','历史行程','/Historicalitinerary','14'),('17','违规查询','/vireViolation','14'),('18','车辆与GPS','/V','0'),('19','车辆管理','/carManage','18'),('20','GPS管理','/GPSM','18'),('21','车辆与GPS管理','/ManageCarGPS','18'),('22','系统管理','/user','0'),('23','基础管理','/Ordinarymanage','22'),('24','用户管理','/Usermanage','22'),('25','审核管理','/AdmitRepair','11'),('26','终审管理','/end','11');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power` (
                         `power_id` varchar(20) NOT NULL,
                         `power_type` varchar(20) DEFAULT NULL,
                         PRIMARY KEY (`power_id`),
                         UNIQUE KEY `power_power_id_uindex` (`power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
INSERT INTO `power` VALUES ('1','admin');
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_element`
--

DROP TABLE IF EXISTS `power_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_element` (
                                 `power_id` varchar(20) NOT NULL,
                                 `element_id` varchar(20) NOT NULL,
                                 PRIMARY KEY (`power_id`,`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='权限页面元素关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_element`
--

LOCK TABLES `power_element` WRITE;
/*!40000 ALTER TABLE `power_element` DISABLE KEYS */;
INSERT INTO `power_element` VALUES ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','73'),('1','74'),('1','75'),('1','76'),('1','8'),('1','9');
/*!40000 ALTER TABLE `power_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_file`
--

DROP TABLE IF EXISTS `power_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_file` (
                              `power_id` varchar(20) NOT NULL,
                              `file_id` varchar(20) NOT NULL,
                              PRIMARY KEY (`power_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='权限文件关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_file`
--

LOCK TABLES `power_file` WRITE;
/*!40000 ALTER TABLE `power_file` DISABLE KEYS */;
INSERT INTO `power_file` VALUES ('1','1'),('2','1');
/*!40000 ALTER TABLE `power_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_menu`
--

DROP TABLE IF EXISTS `power_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_menu` (
                              `power_id` varchar(20) NOT NULL,
                              `menu_id` varchar(20) NOT NULL,
                              PRIMARY KEY (`power_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='权限菜单关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_menu`
--

LOCK TABLES `power_menu` WRITE;
/*!40000 ALTER TABLE `power_menu` DISABLE KEYS */;
INSERT INTO `power_menu` VALUES ('1','1'),('1','12');
/*!40000 ALTER TABLE `power_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
                        `role_id` varchar(20) NOT NULL,
                        `role_name` varchar(20) NOT NULL,
                        PRIMARY KEY (`role_id`),
                        UNIQUE KEY `role_role_id_uindex` (`role_id`),
                        UNIQUE KEY `role_role_name_uindex` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('1','admin'),('2','test');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_power`
--

DROP TABLE IF EXISTS `role_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_power` (
                              `role_id` varchar(20) NOT NULL,
                              `power_id` varchar(20) NOT NULL,
                              PRIMARY KEY (`role_id`,`power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色权限关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_power`
--

LOCK TABLES `role_power` WRITE;
/*!40000 ALTER TABLE `role_power` DISABLE KEYS */;
INSERT INTO `role_power` VALUES ('1','1');
/*!40000 ALTER TABLE `role_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `id` varchar(20) NOT NULL,
                        `username` varchar(20) NOT NULL,
                        `name` varchar(10) DEFAULT NULL,
                        `id_num` varchar(30) DEFAULT NULL,
                        `password` varchar(20) NOT NULL,
                        `last_time` datetime DEFAULT NULL,
                        `phone_num` varchar(20) DEFAULT NULL,
                        `e_mail` varchar(30) DEFAULT NULL,
                        UNIQUE KEY `user_id_uindex` (`id`),
                        UNIQUE KEY `user_username_uindex` (`username`),
                        UNIQUE KEY `user_id_num_uindex` (`id_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='普通用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('014','xiaolu','小卢','123456','123456',NULL,NULL,NULL),('16','nn','牛','777','888','2022-03-14 16:08:20','22','22');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
                             `user_id` varchar(20) NOT NULL,
                             `role_id` varchar(20) NOT NULL,
                             PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户角色关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('014','1'),('014','2'),('1','1'),('123','1'),('21647953775182','1');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `wang`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wang` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `wang`;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair` (
                          `repair_id` varchar(20) NOT NULL COMMENT '维修表ID',
                          `apply_id` varchar(20) NOT NULL COMMENT '维修申请表ID',
                          `repairer_id` varchar(20) NOT NULL COMMENT '维修人ID',
                          `car_id` varchar(20) NOT NULL COMMENT '维修汽车车牌号',
                          `repair_content` varchar(300) NOT NULL COMMENT '维修内容',
                          `cost` varchar(20) NOT NULL COMMENT '维修费用',
                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间或最后一次修改时间',
                          PRIMARY KEY (`repair_id`),
                          UNIQUE KEY `repair_repair_id_uindex` (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='维修信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_apply`
--

DROP TABLE IF EXISTS `repair_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_apply` (
                                `apply_id` varchar(20) NOT NULL COMMENT '维修申请表ID',
                                `applicant_id` varchar(20) NOT NULL COMMENT '维修申请人ID',
                                `car_id` varchar(20) NOT NULL COMMENT '维修汽车车牌号',
                                `repair_reasons` varchar(300) DEFAULT NULL COMMENT '维修原因',
                                `apply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间 添加记录时自动添加当前时间',
                                `apply_status` int NOT NULL DEFAULT '0' COMMENT '审核状态',
                                `type` int DEFAULT '2' COMMENT '类型码',
                                PRIMARY KEY (`apply_id`),
                                UNIQUE KEY `repair_apply_apply_id_uindex` (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='维修申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_apply`
--

LOCK TABLES `repair_apply` WRITE;
/*!40000 ALTER TABLE `repair_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairer`
--

DROP TABLE IF EXISTS `repairer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairer` (
                            `repairer_id` varchar(20) NOT NULL COMMENT '维修部门人员ID',
                            `user_id` varchar(20) NOT NULL COMMENT '用户id',
                            PRIMARY KEY (`repairer_id`),
                            UNIQUE KEY `repairer_repairer_id_uindex` (`repairer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='维修部门人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairer`
--

LOCK TABLES `repairer` WRITE;
/*!40000 ALTER TABLE `repairer` DISABLE KEYS */;
INSERT INTO `repairer` VALUES ('111','1');
/*!40000 ALTER TABLE `repairer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violation`
--

DROP TABLE IF EXISTS `violation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `violation` (
                             `vio_id` varchar(20) NOT NULL COMMENT '违章信息编号',
                             `car_id` varchar(20) NOT NULL COMMENT '违章车辆车牌号',
                             `vio_time` datetime NOT NULL COMMENT '违章时间',
                             `vio_place` varchar(40) NOT NULL COMMENT '违章地点',
                             `vio_action` varchar(20) NOT NULL COMMENT '违章行为',
                             `vio_score` int NOT NULL COMMENT '违章记分',
                             `vio_cost` varchar(20) NOT NULL COMMENT '违章罚款金额',
                             `organization` varchar(20) NOT NULL COMMENT '采集机构',
                             `vio_status` int NOT NULL DEFAULT '0' COMMENT '违章状态   0--未处理  1--已处理',
                             `violator_id` varchar(20) DEFAULT NULL COMMENT '违章人员ID',
                             PRIMARY KEY (`vio_id`),
                             UNIQUE KEY `violation_violation_id_uindex` (`vio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='违章信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violation`
--

LOCK TABLES `violation` WRITE;
/*!40000 ALTER TABLE `violation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ycx`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ycx` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ycx`;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
                               `application_id` varchar(20) NOT NULL COMMENT '申请单号',
                               `user_id` varchar(20) NOT NULL COMMENT '申请者id',
                               `car_id` varchar(20) NOT NULL COMMENT '车牌号',
                               `reason` varchar(300) DEFAULT NULL COMMENT '申请原因',
                               `type` int NOT NULL COMMENT '类型码',
                               `audit_status` int NOT NULL DEFAULT '0' COMMENT '审核状态\n',
                               `application_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间	\n  自动生成当前记录添加时的时间',
                               `if_return` int NOT NULL DEFAULT '-1' COMMENT '申请时设置车辆归还状态为-1，审核通过后为0，还车后为1',
                               PRIMARY KEY (`application_id`),
                               UNIQUE KEY `application_application_id_uindex` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_type`
--

DROP TABLE IF EXISTS `application_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_type` (
                                    `type_num` int NOT NULL COMMENT '类型码',
                                    `type_name` varchar(20) NOT NULL COMMENT '类型描述',
                                    PRIMARY KEY (`type_num`),
                                    UNIQUE KEY `application_type_type_id_uindex` (`type_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='申请类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_type`
--

LOCK TABLES `application_type` WRITE;
/*!40000 ALTER TABLE `application_type` DISABLE KEYS */;
INSERT INTO `application_type` VALUES (0,'借车'),(1,'派车'),(2,'维修');
/*!40000 ALTER TABLE `application_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
                         `audit_id` varchar(20) NOT NULL COMMENT '审核单号',
                         `application_id` varchar(20) NOT NULL COMMENT '申请单号',
                         `auditor_id` varchar(20) NOT NULL COMMENT '审核员编号',
                         `audit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间\nps：当审核状态变化时传入的时间',
                         `audit_status` int NOT NULL DEFAULT '0' COMMENT '审核状态，参照审核状态表',
                         PRIMARY KEY (`audit_id`),
                         UNIQUE KEY `audit_audit_id_uindex` (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='审核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_end`
--

DROP TABLE IF EXISTS `audit_end`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_end` (
                             `audit_id` varchar(20) NOT NULL COMMENT '审核单号',
                             `auditor_id` varchar(20) NOT NULL COMMENT '终审员id',
                             `application_id` varchar(20) NOT NULL COMMENT '申请单号',
                             `end_status` int NOT NULL DEFAULT '0' COMMENT '终审状态码\nps:同审核状态码，参照状态表\n   当终审状态为通过时改变申请表中数据',
                             `end_time` datetime DEFAULT NULL COMMENT '终审时间\nps:同审核表中时间记录规则',
                             PRIMARY KEY (`audit_id`),
                             UNIQUE KEY `audit_end_application_id_uindex` (`application_id`),
                             UNIQUE KEY `audit_end_audit_id_uindex` (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='终审表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_end`
--

LOCK TABLES `audit_end` WRITE;
/*!40000 ALTER TABLE `audit_end` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_status`
--

DROP TABLE IF EXISTS `audit_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_status` (
                                `status_num` int NOT NULL COMMENT '审核结果码',
                                `status_name` varchar(20) NOT NULL COMMENT '审核结果描述',
                                PRIMARY KEY (`status_num`),
                                UNIQUE KEY `audit_status_status_num_uindex` (`status_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='审核结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_status`
--

LOCK TABLES `audit_status` WRITE;
/*!40000 ALTER TABLE `audit_status` DISABLE KEYS */;
INSERT INTO `audit_status` VALUES (0,'未审核'),(1,'审核中'),(2,'审核通过'),(3,'审核失败'),(4,'终审中');
/*!40000 ALTER TABLE `audit_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditor` (
                           `auditor_id` varchar(20) NOT NULL COMMENT '审核员编号',
                           `user_id` varchar(20) NOT NULL COMMENT '审核员对应的用户编号',
                           `auditor_type` int NOT NULL DEFAULT '0' COMMENT '审核员类型码',
                           PRIMARY KEY (`auditor_id`),
                           UNIQUE KEY `auditor_auditor_id_uindex` (`auditor_id`),
                           UNIQUE KEY `auditor_user_id_uindex` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='审核员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES ('1','1',2),('2','2',0),('3','3',1),('4','4',0),('5','5',0),('6','6',1),('7','7',0);
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor_type`
--

DROP TABLE IF EXISTS `auditor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditor_type` (
                                `type_num` int NOT NULL COMMENT '类型编号',
                                `type_name` varchar(20) NOT NULL COMMENT '类型描述',
                                PRIMARY KEY (`type_num`),
                                UNIQUE KEY `auditor_type_type_name_uindex` (`type_name`),
                                UNIQUE KEY `auditor_type_type_num_uindex` (`type_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='审核员类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor_type`
--

LOCK TABLES `auditor_type` WRITE;
/*!40000 ALTER TABLE `auditor_type` DISABLE KEYS */;
INSERT INTO `auditor_type` VALUES (0,'普通审核员'),(1,'派车，借车终审员'),(2,'超级终审员');
/*!40000 ALTER TABLE `auditor_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
                       `car_id` varchar(20) NOT NULL COMMENT '车牌号',
                       `car_model` varchar(20) NOT NULL COMMENT '车辆型号',
                       `car_status` int NOT NULL DEFAULT '1' COMMENT '状态码',
                       `car_type` int NOT NULL COMMENT '车辆类型码',
                       PRIMARY KEY (`car_id`),
                       UNIQUE KEY `car_car_id_uindex` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='车辆表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_change`
--

DROP TABLE IF EXISTS `car_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_change` (
                              `car_id` varchar(20) NOT NULL COMMENT '车牌号',
                              `after_status` int NOT NULL COMMENT '变化后状态码',
                              `before_status` int NOT NULL COMMENT '变化前状态码',
                              `change_time` datetime NOT NULL COMMENT '变动时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='车辆状态变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_change`
--

LOCK TABLES `car_change` WRITE;
/*!40000 ALTER TABLE `car_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_type` (
                            `type_num` int NOT NULL COMMENT '车辆类型码',
                            `type_name` varchar(20) NOT NULL COMMENT '车辆类型描述',
                            PRIMARY KEY (`type_num`),
                            UNIQUE KEY `car_type_type_num_uindex` (`type_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='车辆类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type`
--

LOCK TABLES `car_type` WRITE;
/*!40000 ALTER TABLE `car_type` DISABLE KEYS */;
INSERT INTO `car_type` VALUES (1,'微型车'),(2,'小型车'),(3,'中型车'),(4,'大型车');
/*!40000 ALTER TABLE `car_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_return`
--

DROP TABLE IF EXISTS `service_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_return` (
                                  `return_num` int NOT NULL COMMENT '返回值',
                                  `return_name` varchar(20) DEFAULT NULL COMMENT '错误描述',
                                  `return_code` int DEFAULT NULL COMMENT '状态码',
                                  PRIMARY KEY (`return_num`),
                                  UNIQUE KEY `to_myself_return_num_uindex` (`return_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='service层返回错误类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_return`
--

LOCK TABLES `service_return` WRITE;
/*!40000 ALTER TABLE `service_return` DISABLE KEYS */;
INSERT INTO `service_return` VALUES (-3,'重复操作',405),(-2,'参照表中不存在对应值',403),(-1,'主键重复',402),(0,'必要参数为空',401);
/*!40000 ALTER TABLE `service_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_conf`
--

DROP TABLE IF EXISTS `special_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_conf` (
                                `key` varchar(20) NOT NULL COMMENT '键',
                                `value` varchar(260) DEFAULT NULL COMMENT '值',
                                PRIMARY KEY (`key`),
                                UNIQUE KEY `special_conf_key_uindex` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='特殊配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_conf`
--

LOCK TABLES `special_conf` WRITE;
/*!40000 ALTER TABLE `special_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
                          `status_num` int NOT NULL COMMENT '状态码',
                          `status_name` varchar(10) NOT NULL COMMENT '状态名',
                          PRIMARY KEY (`status_num`),
                          UNIQUE KEY `car_status_status_name_uindex` (`status_name`),
                          UNIQUE KEY `car_status_status_num_uindex` (`status_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (2,'已借出'),(5,'已损坏'),(3,'已派出'),(1,'正常'),(6,'状态不明'),(4,'维修中');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `user_id` varchar(20) NOT NULL COMMENT '用户编号',
                        `user_name` varchar(20) NOT NULL COMMENT '用户名',
                        `password` varchar(20) NOT NULL COMMENT '密码',
                        `real_name` varchar(20) NOT NULL COMMENT '真实姓名',
                        `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
                        `emil` varchar(20) DEFAULT NULL COMMENT '邮箱',
                        `phone_num` varchar(20) DEFAULT NULL COMMENT '手机号',
                        `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
                        PRIMARY KEY (`user_id`),
                        UNIQUE KEY `user_user_id_uindex` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-21 21:06:45

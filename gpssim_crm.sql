/*
SQLyog Community Edition- MySQL GUI v8.02 
MySQL - 5.5.24 : Database - gpssim_crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`gpssim_crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gpssim_crm`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desId` int(11) NOT NULL,
  `commentedOn` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `desId_Comments_FK` (`desId`),
  CONSTRAINT `desId_Comments_FK` FOREIGN KEY (`desId`) REFERENCES `destable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comments` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `userId` bigint(11) NOT NULL,
  `company` varchar(30) NOT NULL,
  `prContact` bigint(11) NOT NULL,
  `secContact` bigint(11) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(50) NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`userId`,`company`,`prContact`,`secContact`,`address`,`city`,`country`,`pincode`,`isDeleted`) values (-251755280,'cus pvt ltd',988781111,0,'dddd','Varanasi','India','221005','\0'),(-249826527,'dfdfdfdf',23323223,0,'dsdssdds','sdsdds','dsdsds','323232','\0'),(2,'ANR',790095,33,'btm 2nd stage','11111','india','560076','\0'),(1524631975224,'sddsds11',3,454545,'dsfdsds','Varanasi1','India1','1111','\0');

/*Table structure for table `destable` */

DROP TABLE IF EXISTS `destable`;

CREATE TABLE `destable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `str` varchar(1024) NOT NULL,
  `severity` int(11) NOT NULL,
  `creationDate` date NOT NULL,
  `assignedTo` bigint(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `reopendedDate` date DEFAULT NULL,
  `releaseVersion` float(4,2) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `moduleVersion` float(4,2) NOT NULL,
  `fixedInVersion` float(4,2) DEFAULT NULL,
  `resolutionDate` date DEFAULT NULL,
  `resolution` varchar(1024) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `User_id_destTbl_FK` (`userId`),
  KEY `assign_to_destTbl_FK` (`assignedTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `destable` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(11) NOT NULL,
  `feedbackOn` date NOT NULL,
  `questionId` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId_feedback_FK` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`userId`,`feedbackOn`,`questionId`,`rating`,`comment`,`isDeleted`) values (1,11,'1993-03-07',34,1,'gd','');

/*Table structure for table `feedbackquestions` */

DROP TABLE IF EXISTS `feedbackquestions`;

CREATE TABLE `feedbackquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `feedbackquestions` */

insert  into `feedbackquestions`(`id`,`description`) values (1,'saba');

/*Table structure for table `gpsmodules` */

DROP TABLE IF EXISTS `gpsmodules`;

CREATE TABLE `gpsmodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  `version` float(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `gpsmodules` */

insert  into `gpsmodules`(`id`,`description`,`version`) values (1,'WSMon',2.20),(2,'MySQLMon',4.20),(3,'OracleMon',5.50),(4,'LogMon',1.70),(5,'URLMon',6.20),(6,'JVMMon',3.20),(7,'TomcatAnalyser',2.70),(8,'WebLogicAnalyser',2.80),(9,'ExchangeMon',4.30),(10,'NetworkTrafficAnalyser',4.40);

/*Table structure for table `gpssim_releases` */

DROP TABLE IF EXISTS `gpssim_releases`;

CREATE TABLE `gpssim_releases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` float(4,2) NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `gpssim_releases` */

insert  into `gpssim_releases`(`id`,`version`,`release_date`) values (1,1.10,'2016-06-30'),(2,1.20,'2017-01-31'),(3,2.10,'2018-03-30');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`description`) values (1,'Admin'),(2,'Customer'),(3,'Employee'),(4,'Sales');

/*Table structure for table `severity` */

DROP TABLE IF EXISTS `severity`;

CREATE TABLE `severity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `severity` */

insert  into `severity`(`id`,`description`) values (1,'trival'),(2,'minor'),(3,'major'),(4,'critical'),(5,'blocker');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` bigint(11) NOT NULL AUTO_INCREMENT,
  `loginId` varchar(50) NOT NULL,
  `emailId` varchar(50) NOT NULL DEFAULT 'crm@gps.com',
  `password` varchar(50) NOT NULL,
  `roleId` int(11) NOT NULL,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `isActive` bit(1) DEFAULT b'0',
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`userId`),
  KEY `User_Role_id_FK` (`roleId`),
  CONSTRAINT `User_Role_id_FK` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1524631975225 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`loginId`,`emailId`,`password`,`roleId`,`fName`,`lName`,`isActive`,`isDeleted`) values (-251755280,'cus2','cus@cus.com','123',2,'ccc','rrr','','\0'),(-249826527,'amit@gmail.com','amit@gmail.com','567',2,'sdsd','sdsd','\0','\0'),(1,'admin','admin@gps.com','123',1,'Gps','Sim','','\0'),(2,'cus1','cus1@gps.com','123',2,'AAA','bbb','','\0'),(3,'emp1','emp1@gps.com','123',3,'aaaa','bbbb','','\0'),(4,'sales1','sales@gps.com','123',4,'hjhjj','hjhjhj','','\0'),(1524631975224,'cus5','c@cc.com','123',2,'qqq','eee','','\0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - ssm_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_db`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`name`,`nickname`,`phoneNum`,`email`) values (1,'张三','小三','18888888888','zs@163.com'),(2,'李四','小四','19999999999','ls@163.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderId` int(11) DEFAULT NULL,
  `travellerId` int(11) DEFAULT NULL,
  KEY `sc_fk3` (`orderId`),
  KEY `sc_fk4` (`travellerId`),
  CONSTRAINT `sc_fk3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `sc_fk4` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderId`,`travellerId`) values (1,1),(2,2),(3,1),(4,2),(5,1),(6,2);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(50) DEFAULT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_fk1` (`productId`),
  KEY `sc_fk2` (`memberId`),
  CONSTRAINT `sc_fk1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `sc_fk2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values (1,'54321','2018-02-03 12:00:00',2,'没什么',0,1,1,1),(2,'54321','2018-02-03 12:00:00',2,'没什么',0,1,2,2),(3,'98765','2018-02-03 12:00:00',2,'没什么',0,1,3,2),(4,'11111','2018-02-03 12:00:00',2,'没什么',0,1,4,1),(5,'22222','2018-02-03 12:00:00',2,'没什么',0,1,5,1),(6,'33333','2018-02-03 12:00:00',2,'没什么',0,1,6,2);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`url`) values (1,'user findAll','/user/findAll.do'),(2,'user findById','/user/findById.do'),(4,'role findAll','/role/findAll');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` date DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product` (`id`,`productNum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`DepartureTime`,`productPrice`,`productDesc`,`productStatus`) values (1,'itcast-002','北京三日游','北京','2010-10-12',1200,'不错的旅行',1),(2,'itcast-003','上海五日游','上海','2018-12-11',1800,'魔都我来了',0),(3,'itcast-003','北京一日游','北京','2012-11-22',1200,'旅行',1),(4,'itcast-004','天津二日游','天津','2019-01-17',1300,'真不错',1),(5,'1','1','1','2021-01-16',1,'1',1),(6,'itcast-006','深圳十日游','深圳','2012-11-22',1200,'旅行',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`roleDesc`) values (1,'ADMIN','vip'),(2,'USER','vip');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `roleId` int(11) DEFAULT NULL,
  `permissionId` int(11) DEFAULT NULL,
  KEY `sc_fk7` (`roleId`),
  KEY `sc_fk8` (`permissionId`),
  CONSTRAINT `sc_fk7` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `sc_fk8` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`roleId`,`permissionId`) values (1,1),(2,2),(1,2),(2,1),(2,4);

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `syslog` */

insert  into `syslog`(`id`,`visitTime`,`username`,`ip`,`url`,`executionTime`,`method`) values (1,'2021-12-05 18:46:21','tom','0:0:0:0:0:0:0:1','/product/findAll.do',20,'类名 com.itcast.ssm.controller.ProductController方法名 findAll'),(2,'2021-12-05 19:03:10','tom','0:0:0:0:0:0:0:1','/product/findAll.do',15,'类名 com.itcast.ssm.controller.ProductController方法名 findAll'),(3,'2021-12-05 19:13:33','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',30,'类名 com.itcast.ssm.controller.SysLogController方法名 findAll'),(4,'2021-12-05 19:15:25','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',32,'类名 com.itcast.ssm.controller.SysLogController方法名 findAll'),(5,'2021-12-05 22:58:09','tom','0:0:0:0:0:0:0:1','/product/findAll.do',35,'类名 com.itcast.ssm.controller.ProductController方法名 findAll'),(6,'2021-12-05 22:58:24','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',75,'类名 com.itcast.ssm.controller.OrdersController方法名 findAll'),(7,'2021-12-05 22:58:27','tom','0:0:0:0:0:0:0:1','/product/findAll.do',10,'类名 com.itcast.ssm.controller.ProductController方法名 findAll'),(8,'2021-12-05 22:58:32','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',17,'类名 com.itcast.ssm.controller.OrdersController方法名 findAll'),(9,'2021-12-05 22:58:36','tom','0:0:0:0:0:0:0:1','/product/findAll.do',7,'类名 com.itcast.ssm.controller.ProductController方法名 findAll'),(10,'2021-12-05 22:58:51','tom','0:0:0:0:0:0:0:1','/product/findAll.do',9,'类名 com.itcast.ssm.controller.ProductController方法名 findAll'),(11,'2021-12-05 22:58:53','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',17,'类名 com.itcast.ssm.controller.OrdersController方法名 findAll'),(12,'2021-12-05 22:58:55','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',21,'类名 com.itcast.ssm.controller.OrdersController方法名 findAll'),(13,'2021-12-05 22:58:57','tom','0:0:0:0:0:0:0:1','/product/findAll.do',8,'类名 com.itcast.ssm.controller.ProductController方法名 findAll'),(14,'2021-12-05 23:18:25','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',21,'类名 com.itcast.ssm.controller.OrdersController方法名 findAll'),(15,'2021-12-05 23:18:28','tom','0:0:0:0:0:0:0:1','/user/findAll.do',12,'类名 com.itcast.ssm.controller.UserController方法名 findAll'),(16,'2021-12-05 23:18:31','tom','0:0:0:0:0:0:0:1','/role/findAll.do',9,'类名 com.itcast.ssm.controller.RoleController方法名 findAll'),(17,'2021-12-05 23:18:35','tom','0:0:0:0:0:0:0:1','/role/findAll.do',4,'类名 com.itcast.ssm.controller.RoleController方法名 findAll'),(18,'2021-12-05 23:18:37','tom','0:0:0:0:0:0:0:1','/permission/findAll.do',9,'类名 com.itcast.ssm.controller.PermissionController方法名 findAll'),(19,'2021-12-05 23:18:39','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',14,'类名 com.itcast.ssm.controller.SysLogController方法名 findAll');

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`name`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values (1,'张龙','男','13333333333',0,'123456789009876543',0),(2,'李四','女','14444444444',1,'123456789122131231',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`password`,`phoneNum`,`status`) values (1,'121212313@qq.com','tom','$2a$10$G1Yjyv7qOjz9Mci.q64t7eX0VDl4B0zOzsgsz9lC0w.8FVrkgX6me','13121112543',1),(2,'789123@qq.com','zhangsan','$2a$10$eG6k75/Zl3nfDRFautFeh.F862UqAVmcv0p3f9WPLgf/j8RD2WB8K','1555555555',1),(8,'11312331@qq.com','text','$2a$10$YEZS/WkgzSU7B1y277ZhZezsl0kIPWgMeN3VUIR3SeykQG4ZtYQk.','1333333333',1);

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `usersId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  KEY `sc_fk5` (`usersId`),
  KEY `sc_fk6` (`roleId`),
  CONSTRAINT `sc_fk5` FOREIGN KEY (`usersId`) REFERENCES `users` (`id`),
  CONSTRAINT `sc_fk6` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_role` */

insert  into `users_role`(`usersId`,`roleId`) values (1,1),(1,2),(2,2),(8,1),(8,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

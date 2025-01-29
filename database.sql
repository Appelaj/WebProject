-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for webproject
DROP DATABASE IF EXISTS `webproject`;
CREATE DATABASE IF NOT EXISTS `webproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `webproject`;

-- Dumping structure for table webproject.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `PID` int(11) DEFAULT NULL,
  `body` varchar(1024) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `Comment_Date` date DEFAULT NULL,
  `Comment_Time` time DEFAULT NULL,
  KEY `PID` (`PID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.comments: ~9 rows (approximately)
DELETE FROM `comments`;
INSERT INTO `comments` (`PID`, `body`, `UID`, `Comment_Date`, `Comment_Time`) VALUES
	(147, 'ตัวอย่าง  ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง', 13, '2025-01-28', '17:21:56'),
	(147, 'sample  sample sample sample sample sample sample sample sample sample sample sample sample sample sample sample sample sample sample sample sample', 3, '2025-01-28', '17:22:51'),
	(141, 'ถ้าใช้operaจะเกิดการoverlapของvideoกับheaderขึ้น ถ้าใช้chromeจะไม่เป็นปัญหานี้', 13, '2025-01-28', '20:50:50'),
	(148, 'ผมเล่นกลองนะครับ จะลองติดต่อไปนะครับ อยากรู้ว่าอยู่หอในหรือหอนอกครับ? จะได้นัดกันได้สะดวก', 12, '2025-01-28', '21:02:25'),
	(148, 'อยู่หอนอกครับ ปกติเเถวหน้า ม นี้มีห้องซ้อมเเถวไหนบ้างหรอครับ', 13, '2025-01-28', '21:05:04'),
	(148, 'ผมaddเพื่อนไปเเล้วนะครับ เดี๋ยวผมจะดึงเข้ากลุ่มเเล้วมาคุยพร้อมกับคนอื่นดีกว่าครับ', 12, '2025-01-28', '21:11:28'),
	(148, 'ได้ครับ', 13, '2025-01-28', '21:13:34'),
	(141, 'ทดสอบ featured การ edit ครบทั้ง 3 เเบบ', 3, '2025-01-29', '18:12:15'),
	(152, 'ASDADSDAS', 12, '2025-01-29', '20:41:00');

-- Dumping structure for table webproject.media
DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `PID` int(11) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  KEY `PID` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.media: ~2 rows (approximately)
DELETE FROM `media`;
INSERT INTO `media` (`PID`, `path`) VALUES
	(144, '../upload/1_29_2025_1738158491000_GdKfUhBb0AAKb5_.jpg'),
	(148, '../upload/1_29_2025_1738158654000_images (2).png');

-- Dumping structure for table webproject.post
DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `body_text` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.post: ~6 rows (approximately)
DELETE FROM `post`;
INSERT INTO `post` (`PID`, `title`, `UID`, `created_time`, `created_date`, `body_text`) VALUES
	(142, 'ทดสอบการ upload เเละ เเสดงรูปภาพหลาบรูป', 13, '20:15:54', '2025-01-27', 'ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง'),
	(143, 'ทดสอบการ upload เเละ เเสดง รูปภาพ 1 รูป', 13, '20:19:30', '2025-01-27', 'ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง'),
	(144, 'ทดสอบ text อย่างเดียวไม่มี media', 3, '06:27:50', '2025-01-28', 'ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง'),
	(147, 'ทดสอบระบบ comment', 13, '17:20:48', '2025-01-28', 'ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง ตัวอย่าง'),
	(148, 'หาเพื่อนทำวงดนตรีครับ', 13, '20:59:10', '2025-01-28', 'ผมชอบเพลงเเนวrockครับ ผมเล่นกีตาร์อยากหาสมาชิกคนอื่นมาเพิ่มนะครับ ถ้าสนใจลองทักมาคุยได้นะครับ Facebook:XXXXXXX ผมอยากเเสดงในงานที่จะจัดของมหาลัยปลายเดือนหน้าครับ'),
	(152, 'TEST TITLE TEST TITLETEST TITLE', 12, '20:40:32', '2025-01-29', ' ASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASD');

-- Dumping structure for table webproject.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.users: ~6 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`UID`, `username`, `password`) VALUES
	(3, 'john', '81dc9bdb52d04dc20036dbd8313ed055'),
	(11, 'Elon musk', '81dc9bdb52d04dc20036dbd8313ed055'),
	(12, 'Panuwat', '81dc9bdb52d04dc20036dbd8313ed055'),
	(13, 'Maple', '81dc9bdb52d04dc20036dbd8313ed055'),
	(14, 'spider', '81dc9bdb52d04dc20036dbd8313ed055'),
	(15, 'Admin', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

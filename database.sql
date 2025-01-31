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
CREATE DATABASE IF NOT EXISTS `webproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `webproject`;

-- Dumping structure for table webproject.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `PID` int(11) DEFAULT NULL,
  `body` varchar(1024) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `Comment_Date` date DEFAULT NULL,
  `Comment_Time` time DEFAULT NULL,
  KEY `PID` (`PID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.comments: ~16 rows (approximately)
DELETE FROM `comments`;
INSERT INTO `comments` (`PID`, `body`, `UID`, `Comment_Date`, `Comment_Time`) VALUES
	(141, 'ถ้าใช้operaจะเกิดการoverlapของvideoกับheaderขึ้น ถ้าใช้chromeจะไม่เป็นปัญหานี้', 13, '2025-01-28', '20:50:50'),
	(148, 'ผมเล่นกลองนะครับ จะลองติดต่อไปนะครับ อยากรู้ว่าอยู่หอในหรือหอนอกครับ? จะได้นัดกันได้สะดวก', 12, '2025-01-28', '21:02:25'),
	(148, 'อยู่หอนอกครับ ปกติเเถวหน้า ม นี้มีห้องซ้อมเเถวไหนบ้างหรอครับ', 13, '2025-01-28', '21:05:04'),
	(148, 'ผมaddเพื่อนไปเเล้วนะครับ เดี๋ยวผมจะดึงเข้ากลุ่มเเล้วมาคุยพร้อมกับคนอื่นดีกว่าครับ', 12, '2025-01-28', '21:11:28'),
	(148, 'ได้ครับ', 13, '2025-01-28', '21:13:34'),
	(141, 'ทดสอบ featured การ edit ครบทั้ง 3 เเบบ', 3, '2025-01-29', '18:12:15'),
	(154, 'ยังผิดอยู่หลายจุดเหมือนกันนะครับ เเต่โดยรวมเเล้วก็โอเคเลยนะครับ ฝึกซ้อมต่อไปนะครับ', 3, '2025-01-30', '20:52:39'),
	(155, 'ถ้างบเท่านี้ลองไปดู Epiphone เลยครับ', 3, '2025-01-30', '20:54:47'),
	(154, 'ขอบคุณสำหรับความห็นนะครับ ผมจะซ้อมต่อไปเรื่อยๆครับ', 13, '2025-01-30', '20:58:09'),
	(155, 'เเนะนำ Epiphone อีกเสียงครับ ในงบเท่านี้ผมว่า Epiphone ตอบโจทย์สุดเเล้ว อย่าลืมเผื่องบไว้ซื้อ effect กับ amp ด้วยนะครับ', 13, '2025-01-30', '21:04:59'),
	(156, 'ผมไม่เเนะนำให้นั่งจำเป็นเหมือนกับท่องหนังสือเเบบนี้นะครับ ผมว่าลองหาเพลงที่อยากเล่นเเล้วลองไปฝึกดูดีกว่าครับ เดี๋ยวพอเราเล่นได้เล่นเพลงขึ้นจำคอร์ดก็ไม่ใช่เรื่องยากเเล้วครับ ', 13, '2025-01-30', '21:17:17'),
	(156, 'ผมเห็นด้วยกับเม้นบนนะครับ เหนือสิ่งอื่นใดซ้อมให้สนุกเข้าไว้ดีกว่า พอเล่นไปซักพักเดี๋ยวพวกทฤษฎีก็จะเข้าใจขึ้นเรื่อยเองเเหละครับ', 3, '2025-01-30', '21:21:48'),
	(156, 'ขอบคุณสำหรับคำเเนะนำนะครับ ผมจะนำไปปรับใช้นะครับ', 16, '2025-01-30', '21:23:42'),
	(158, 'ผมว่า SG ก็เท่ไม่เเพ้เลยนะครับ lespaul เเต่เรื่องราคานี่ lespaul ยิ่งกว่า to the moon เเล้วนะครับ', 13, '2025-01-30', '21:52:17'),
	(158, 'นั้นเเหละครับ อยากจะลองเล่นดูสักครั้งดูเหมือนกันเเต่คงจะยาก ในไทยน่าจะนับคนที่มีได้เลย', 3, '2025-01-30', '21:54:59'),
	(160, 'ของ gibson ก็ใช้ได้ดีเหมือนกันนะครับ ราคาพอๆกันด้วย', 3, '2025-01-30', '22:24:05');

-- Dumping structure for table webproject.media
CREATE TABLE IF NOT EXISTS `media` (
  `PID` int(11) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  KEY `PID` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.media: ~10 rows (approximately)
DELETE FROM `media`;
INSERT INTO `media` (`PID`, `path`) VALUES
	(154, '../upload/1_30_2025_1738243684000_20250130_161000.mp4'),
	(155, '../upload/1_30_2025_1738244341000_SGS00CWCH1_front_800x.png'),
	(156, '../upload/1_30_2025_1738246432000_basic-guitar-chord-chart-sheets-260nw-1884206446.png'),
	(157, '../upload/1_30_2025_1738247317000_image_166390835111701339819ca5181t106960ef.jpg'),
	(157, '../upload/1_30_2025_1738247362000_ab67616d0000b2735b7451c08d679d567a97f881.jpg'),
	(157, '../upload/1_30_2025_1738247441000_71BMpuFyU4L._UF1000,1000_QL80_.jpg'),
	(158, '../upload/1_30_2025_1738248556000_4K3A8330.jpg'),
	(159, '../upload/1_30_2025_1738249632000_band-maid-group-2021.jpg'),
	(159, '../upload/1_30_2025_1738249632000_BandMaid_Dallas_211022.jpg'),
	(160, '../upload/1_30_2025_1738250364000_948c1a8ad8e626354c52c1f48b99c88e.jpg');

-- Dumping structure for table webproject.post
CREATE TABLE IF NOT EXISTS `post` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `body_text` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.post: ~8 rows (approximately)
DELETE FROM `post`;
INSERT INTO `post` (`PID`, `title`, `UID`, `created_time`, `created_date`, `body_text`) VALUES
	(148, 'หาเพื่อนทำวงดนตรีครับ', 13, '20:59:10', '2025-01-28', 'ผมชอบเพลงเเนวrockครับ ผมเล่นกีตาร์อยากหาสมาชิกคนอื่นมาเพิ่มนะครับ ถ้าสนใจลองทักมาคุยได้นะครับ Facebook:XXXXXXX ผมอยากเเสดงในงานที่จะจัดของมหาลัยปลายเดือนหน้าครับ'),
	(154, 'Cover เพลง that band ของ kessoku band', 13, '20:24:10', '2025-01-30', 'ผมได้ลอง cover เพลง that band จากอนิเมะเรื่อง Bocchi the rock ตัว track guitar ของเพลงนี้มีความโดดเด่นเป็นอยากมากอยากให้ลองไปฟังต้นฉบับกันนะครับ ส่วนคลิปนี้ที่ผมได้เล่น ยังมีจุดที่ผิดพลาดอยู่อีกหลายจุดเลย สามารถติชมกันได้ครับ'),
	(155, 'ช่วยเเนะนำกีตาร์หน่อยครับ งบไม่เกิน 20000', 12, '20:39:01', '2025-01-30', 'ผมอยากได้guitarตัวเเรกมาเล่นครับ ช่วยเเนะนำตัวที่ไม่เกิน 20000 บาทนะครับ ถ้าเป็นไปได้ผมสนใจทรง sg สีขาวตามรูปเลยครับ'),
	(156, 'อยากจะขอคำเเนะนำในการซ้อมหน่อยครับ', 16, '21:13:52', '2025-01-30', 'คือผมพึ่งจะเริ่มเล่นกีตาร์ อยากจะรู้ว่าควรจะฝึกจากอะไรก่อนหรอครับ ตอนนี้กำลังผึกจำคอร์ดในภาพอยู่นะครับ เเต่รู้สึกไม่ค่อยเข้าหัวเลยนะครับ อยากรู้ทุกคนเริ่มฝึกกันยังไงหรอครับ'),
	(157, 'ปกติทุกคนฟังเพลงเเนวไหนกันหรอครับ', 16, '21:28:37', '2025-01-30', 'ตามหัวข้อเลยครับ อยากจะถามว่าทุกคนฟังเพลงเเนวไหนกันบ้างครับ ปกติผมชอบเเนว rock ไม่ก็ metal ไปเลยเเต่ก็ขึ้นอยู่กับเพลงซะมากกว่า ลองมาเเชร์วที่ชอบกันด้วยนะครับ จะได้หาวงใหม่ฟังกันด้วย'),
	(158, 'ทรงกีตาร์ที่ชอบ', 3, '21:49:16', '2025-01-30', 'อยากรู้ว่าเพื่อนๆชอบกีตาร์ทรงไหนกันบ้าง ผมชอบ lespaul ที่สุดเเล้ว สำหรับผมว่ามันดู classic ตลอดกาลจริงๆ ส่วนเรื่องราคาของ gibson lespaul ปีเก่าๆตอนนี้คงได้เเค่ฝัน เเค่คิดก็นึกไม่ถึงว่ากีตาร์ตัวนึงจะเเพงได้ขนาดนี้'),
	(159, 'รู้จัก Band-Maid กันรึเปล่าครับ?', 13, '22:07:12', '2025-01-30', 'อยากจะเเนะนำวง J-Rock นอกกระเเสสักหน่อย สำหรับ band-maid เเล้วนี่ถือเป็นอีกวง rock หญิงล้วนอีกวง เเถม\r\nฝีมือการเล่นของเเต่ละคนนี่ยิ่งกว่าไม่ธรรมดา เเถม saiki ที่เป็นนักร้องนำเสียงยังหนักเเน่นเข้ากับดนตรีของวงอีกด้วย อยากลองให้ทุกคนไปลองฟังวงนี้กันครับ สำหรับคนที่ชอบเเนว rock เป็นทุนเดิม น่าจะชอบกับสไตล์เพลงของวงนี้ไม่ได้ยากเลย'),
	(160, 'ใช้สายกีตาร์ยี่ห้อไหนกันหรอครับ', 13, '22:19:24', '2025-01-30', 'อยากสอบถามว่าปกติใช้สายกีตาร์ยี่ห้อไหนกันบ้าง คือปกติผมใช้สาย D\'Addario เบอร์ 10-52 พอดีอยากลองไปใช้เจ้าอื่นบ้างพอจะมีคำเเนะนำไหมครับ');

-- Dumping structure for table webproject.users
CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webproject.users: ~6 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`UID`, `username`, `password`) VALUES
	(3, 'john', '81dc9bdb52d04dc20036dbd8313ed055'),
	(12, 'Panuwat', '81dc9bdb52d04dc20036dbd8313ed055'),
	(13, 'Maple', '81dc9bdb52d04dc20036dbd8313ed055'),
	(14, 'spider', '81dc9bdb52d04dc20036dbd8313ed055'),
	(15, 'Admin', NULL),
	(16, 'Syrup', '81dc9bdb52d04dc20036dbd8313ed055');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

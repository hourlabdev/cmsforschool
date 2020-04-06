-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.36-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for learning
CREATE DATABASE IF NOT EXISTS `learning` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `learning`;

-- Dumping structure for table learning.class_entity
CREATE TABLE IF NOT EXISTS `class_entity` (
  `cls_id` int(10) NOT NULL,
  `cls_code` varchar(10) NOT NULL DEFAULT '',
  `cls_name` varchar(50) NOT NULL DEFAULT '',
  `cls_desc` text NOT NULL,
  `created_at` date NOT NULL,
  `creatde_by` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for class entity';

-- Data exporting was unselected.

-- Dumping structure for table learning.institution_entity
CREATE TABLE IF NOT EXISTS `institution_entity` (
  `instt_id` int(10) NOT NULL,
  `instt_code` varchar(10) NOT NULL DEFAULT '',
  `instt_name` varchar(50) NOT NULL DEFAULT '',
  `instt_desc` text NOT NULL,
  `created_at` date NOT NULL,
  `created_by` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`instt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for institution entity';

-- Data exporting was unselected.

-- Dumping structure for table learning.student_entity
CREATE TABLE IF NOT EXISTS `student_entity` (
  `std_id` int(10) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_code` varchar(10) NOT NULL DEFAULT '1',
  `std_sx` int(1) NOT NULL DEFAULT '1',
  `std_pob` varchar(50) NOT NULL,
  `std_dob` datetime NOT NULL,
  `std_addrs` text NOT NULL,
  `username` varchar(10) NOT NULL,
  `created_at` date NOT NULL,
  `created_by` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`std_id`),
  KEY `username` (`username`),
  CONSTRAINT `FK_student_entity_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for students entities';

-- Data exporting was unselected.

-- Dumping structure for table learning.teacher_entity
CREATE TABLE IF NOT EXISTS `teacher_entity` (
  `tchr_id` int(10) NOT NULL,
  `tchr_code` varchar(10) NOT NULL DEFAULT '',
  `tchr_name` varchar(50) NOT NULL DEFAULT '',
  `tchr_sx` int(1) NOT NULL DEFAULT '1',
  `tchr_pob` varchar(50) NOT NULL,
  `tchr_dob` date NOT NULL,
  `tchr_addrs` text NOT NULL,
  `username` varchar(10) NOT NULL DEFAULT '',
  `created_at` date NOT NULL,
  `created_by` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`tchr_id`),
  KEY `username` (`username`),
  CONSTRAINT `FK_teacher_entity_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for techer entity';

-- Data exporting was unselected.

-- Dumping structure for table learning.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` text NOT NULL,
  `entity_id` int(10) NOT NULL,
  PRIMARY KEY (`id`,`username`),
  KEY `FK_user_student_entity` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for username and passrod for system login';

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
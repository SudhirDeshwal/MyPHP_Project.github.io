-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping structure for table coronatravels.bookings
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int NOT NULL,
  `trip_id` int DEFAULT NULL,
  `number_adults` int DEFAULT NULL,
  `number_children` int DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ;

-- Dumping data for table coronatravels.bookings: ~0 rows (approximately)
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`booking_id`, `trip_id`, `number_adults`, `number_children`, `total_cost`, `user_id`) VALUES
	(1, 1, 2, 1, 700.00, 1),
	(2, 2, 2, 0, 900.00, 2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- Dumping structure for table coronatravels.hotels
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `hotel_id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ;

INSERT INTO `hotels` (`hotel_id`, `name`, `address`, `rating`) VALUES
	(1, 'Panama Hotel', '123 Panama City', 4.5),
	(2, 'Havana Inn', '1456 Castro Way', 5);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Dumping structure for table coronatravels.images
DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `image_id` int NOT NULL,
  `path` varchar(500) DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ;


INSERT INTO `images` (`image_id`, `path`, `trip_id`) VALUES
	(1, '/images/image1/png', 1),
	(2, '/images/image2.png', 2),
	(3, '/images/image3.png', 1),
	(4, '/images/image4.png', 2);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping structure for table coronatravels.trips
DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `trip_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `short_description` varchar(50) NOT NULL,
  `long_description` text NOT NULL,
  `country` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `hotel_id` int NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`trip_id`)
) ;


INSERT INTO `trips` (`trip_id`, `name`, `short_description`, `long_description`, `country`, `start_date`, `end_date`, `hotel_id`, `cost`, `status`) VALUES
	(1, 'Panama 7 Day Getaway', 'The best Panama trip ever', 'The best panama trip ever to exist', 'Panama', '2020-01-01', '2020-02-08', 1, 450.00, 'open'),
	(2, 'Havana 2 Week Lounge', 'The best Cuba trip ever!', 'The best Cuba trip to ever exit!', 'Cuba', '2020-01-01', '2020-02-08', 2, 500.00, 'open');


-- Dumping structure for table coronatravels.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL,
  `password_hash` varchar(500) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `email_verification_code` varchar(500) DEFAULT NULL,
  `password_recovery_code` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ;


INSERT INTO `users` (`user_id`, `password_hash`, `first_name`, `last_name`, `phone`, `dob`, `role`, `status`, `created_at`, `email_verification_code`, `password_recovery_code`) VALUES
	(1, 'dsfsadfsdafdsf', 'John', 'Doe', '55555', '1956-01-01', 'user', 'enabled', '2020-01-02 00:00:00', 'dsfsfdsfdsf', 'asdasdasdasd'),
	(2, 'dfdsfsdfdsf', 'Jane', 'Doe', '5555', '1978-01-01', 'user', 'pass_verification', '2020-01-01 00:00:00', 'adsadasdsad', NULL),
	(3, 'fsdfsdfsdf', 'Big', 'Boss', '55555', '1990-01-01', 'admin', 'enabled', '2020-01-01 00:00:00', 'sadasdasdasd', NULL);


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

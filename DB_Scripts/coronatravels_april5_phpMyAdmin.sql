-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 05, 2020 at 06:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coronatravels`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `number_adults` int(11) DEFAULT NULL,
  `number_children` int(11) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `trip_id`, `number_adults`, `number_children`, `total_cost`, `user_id`) VALUES
(1, 1, 2, 1, '700.00', 1),
(2, 2, 2, 0, '900.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `rating` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `name`, `address`, `rating`) VALUES
(1, 'Panama Hotel', '123 Panama City', 4.5),
(2, 'Havana Inn', '1456 Castro Way', 5);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `path` varchar(500) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `path`, `trip_id`) VALUES
(1, './images/panama1.jpg', 1),
(2, '/images/image2.jpg', 2),
(3, './images/panama2.jpg', 1),
(4, '/images/image4.png', 2),
(5, './images/panama1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short_description` varchar(50) NOT NULL,
  `long_description` text NOT NULL,
  `country` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`trip_id`, `name`, `short_description`, `long_description`, `country`, `start_date`, `end_date`, `hotel_id`, `cost`, `status`) VALUES
(1, 'Panama 7 Day Getaway', 'The best Panama trip ever', 'The best panama trip ever to exist', 'Panama', '2020-01-01', '2020-02-08', 1, '450.00', 'open'),
(2, 'Havana 2 Week Lounge', 'The best Cuba trip ever!', 'The best Cuba trip to ever exit!', 'Cuba', '2020-01-01', '2020-02-08', 2, '500.00', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `password_hash` varchar(500) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `email_verification_code` varchar(500) DEFAULT NULL,
  `password_recovery_code` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password_hash`, `first_name`, `last_name`, `phone`, `dob`, `role`, `status`, `created_at`, `email_verification_code`, `password_recovery_code`) VALUES
(1, 'dsfsadfsdafdsf', 'John', 'Doe', '55555', '1956-01-01', 'user', 'enabled', '2020-01-02 05:00:00', 'dsfsfdsfdsf', 'asdasdasdasd'),
(2, 'dfdsfsdfdsf', 'Jane', 'Doe', '5555', '1978-01-01', 'user', 'pass_verification', '2020-01-01 05:00:00', 'adsadasdsad', NULL),
(3, 'fsdfsdfsdf', 'Big', 'Boss', '55555', '1990-01-01', 'admin', 'enabled', '2020-01-01 05:00:00', 'sadasdasdasd', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 05:36 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE `individuals` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individuals`
--

INSERT INTO `individuals` (`id`, `code`, `name`, `date_created`) VALUES
(3, '871616979009', 'John Smith', '2021-06-28 16:06:46'),
(4, '125845984159', 'Claire Blake', '2021-06-28 16:07:12'),
(10, '928213289230', 'Saturnino Anim', '2022-02-07 21:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `individual_meta`
--

CREATE TABLE `individual_meta` (
  `individual_id` int(30) NOT NULL,
  `meta_field` text DEFAULT NULL,
  `meta_value` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individual_meta`
--

INSERT INTO `individual_meta` (`individual_id`, `meta_field`, `meta_value`, `date_created`) VALUES
(3, 'name', 'John Smith', '2021-06-28 16:06:46'),
(3, 'contact', '09123456789', '2021-06-28 16:06:46'),
(3, 'gender', 'Male', '2021-06-28 16:06:46'),
(3, 'dob', '1995-06-23', '2021-06-28 16:06:46'),
(3, 'address', 'Sample Address', '2021-06-28 16:06:46'),
(4, 'name', 'Claire Blake', '2021-06-28 16:07:12'),
(4, 'contact', 'Sample Address', '2021-06-28 16:07:12'),
(4, 'gender', 'Female', '2021-06-28 16:07:12'),
(4, 'dob', '1995-10-14', '2021-06-28 16:07:12'),
(4, 'address', 'Sample Address', '2021-06-28 16:07:12'),
(10, 'name', 'Saturnino Anim', '2022-02-07 21:26:10'),
(10, 'contact', '09083951236', '2022-02-07 21:26:10'),
(10, 'gender', 'Male', '2022-02-07 21:26:10'),
(10, 'age', '21', '2022-02-07 21:26:10'),
(10, 'dob', '2001-01-10', '2022-02-07 21:26:10'),
(10, 'vaccine', 'Pfizer', '2022-02-07 21:26:10'),
(10, 'address', '401 San Vicente St. Road 3 Paradise Malanday Marikina City', '2022-02-07 21:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `location` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `max_a_day` int(5) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location`, `description`, `max_a_day`, `date_created`, `date_updated`) VALUES
(5, 'Mandaluyong Vaccination Center', '&lt;p&gt;Located: Forum Robinsons, Pioneer St, Mandaluyong, Metro Manila&lt;/p&gt;&lt;p&gt;Open Monday to Friday 8am to 3pm&lt;br&gt;&lt;/p&gt;', 150, '2022-02-07 21:13:51', '2022-02-14 16:17:12'),
(6, 'Marikina City Mega Vaccination Facility', '&lt;p&gt;Located:&amp;nbsp;15 Jacamar, Marikina, 1800 Metro Manila&lt;/p&gt;&lt;p&gt;Open Monday to Friday 8am to 3pm&lt;/p&gt;', 200, '2022-02-08 00:00:20', '2022-02-14 16:16:59'),
(7, 'Quezon City Vaccination Center', '&lt;p&gt;Located:&amp;nbsp;Smart Araneta Coliseum, General Araneta, Cubao, Quezon City, Metro Manila&lt;/p&gt;&lt;p&gt;Open Monday to Friday 8am to 3pm&lt;br&gt;&lt;/p&gt;', 150, '2022-02-08 08:31:55', '2022-02-14 16:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(30) NOT NULL,
  `individual_id` int(30) NOT NULL,
  `location_id` int(30) NOT NULL,
  `date_sched` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `individual_id`, `location_id`, `date_sched`, `status`, `date_created`) VALUES
(3, 3, 1, '2021-06-28', 1, '2021-06-28 16:06:46'),
(4, 4, 1, '2021-06-28', 1, '2021-06-28 16:07:12'),
(10, 10, 5, '2022-02-08', 0, '2022-02-07 21:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Vaccination Scheduling For Child Ages'),
(6, 'short_name', 'Vaccination Scheduler'),
(11, 'logo', 'uploads/1644238620_logss.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1644238620_sureeee.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1644238380_EARIST_Logo.png', NULL, 1, '2021-01-20 14:02:37', '2022-02-07 20:53:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `individuals`
--
ALTER TABLE `individuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `individuals`
--
ALTER TABLE `individuals`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

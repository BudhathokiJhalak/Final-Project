-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2017 at 08:28 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helping_hand`
--

-- --------------------------------------------------------

--
-- Table structure for table `isp_table`
--

CREATE TABLE `isp_table` (
  `isp_id` int(11) NOT NULL,
  `isp_name` varchar(25) NOT NULL,
  `value` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `isp_table`
--

INSERT INTO `isp_table` (`isp_id`, `isp_name`, `value`) VALUES
(1, 'Vianet Communication', 'smtp.vianet.com.np'),
(2, 'WorldLink Communication', 'smtp.wlink.com.np'),
(3, 'Subisu', 'smtp.subisu.net.np');

-- --------------------------------------------------------

--
-- Table structure for table `mailing_address_table`
--

CREATE TABLE `mailing_address_table` (
  `mail_address_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mailing_address_table`
--

INSERT INTO `mailing_address_table` (`mail_address_id`, `email`) VALUES
(1, 'dayfeb1217@gmail.com'),
(2, 'mgr.amrit1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `post_table`
--

CREATE TABLE `post_table` (
  `post_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_table`
--

INSERT INTO `post_table` (`post_id`, `description`, `added_date`, `modified_date`, `user_id`) VALUES
(1, 'How can i get MRR printed T-shirts???', '2017-04-07 08:10:36', NULL, 2),
(2, 'I\'m thinking for abroad study can anyone suggest which consultancy should i choose?', '2017-05-02 02:37:57', NULL, 3),
(9, 'asdfsadf\r\n', '2017-05-16 12:54:51', NULL, 2),
(10, 'asdf', '2017-05-16 18:15:46', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reply_table`
--

CREATE TABLE `reply_table` (
  `reply_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reply_table`
--

INSERT INTO `reply_table` (`reply_id`, `description`, `added_date`, `modified_date`, `post_id`, `user_id`) VALUES
(1, 'You can contact to admin.\r\nHemanta Lamichhane', '2017-04-07 08:45:11', NULL, 1, 4),
(3, 'You can contact to admin. Hemanta Lamichhane 9865654', '2017-05-09 13:24:09', NULL, 1, 1),
(21, 'You can try US', '2017-05-16 12:52:14', NULL, 2, 2),
(22, 'you can contact to the broker', '2017-05-16 17:28:43', NULL, 10, 2),
(23, 'akjfsd', '2017-05-16 18:07:51', NULL, 10, 1),
(24, 'asdfasd', '2017-05-16 18:17:15', NULL, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `current_address` varchar(30) NOT NULL,
  `permanent_address` varchar(30) DEFAULT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `interest` text,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `first_name`, `last_name`, `email`, `mobile_no`, `gender`, `current_address`, `permanent_address`, `blood_group`, `interest`, `username`, `password`, `added_date`, `modified_date`, `status`, `role`) VALUES
(1, 'Suraj', 'G.C', 'surajacule@gmail.com', '+9779843654314', 'Male', 'Pokhara', 'Gulmi, Tamghas', 'A+', 'I love Soccor.', 'suraj', 'suraj@123', '2017-05-09 08:33:51', NULL, 1, 'ROLE_ADMIN'),
(2, 'Ayush', 'Dumre', 'ayushdumre7@gmail.com', '+9779814460446', 'Male', 'Buddhanagar, Kathmandu', 'Bhumai, Nawalparasi', 'A+', 'I am interested in Travelling to new Place.', 'ayush', 'bhumai123', '2017-04-05 11:20:10', NULL, 1, 'ROLE_USER'),
(3, 'Alisha', 'Thapa', 'thapalisa@gmail.com', '+9779843574740', 'Female', 'Kalanki, Kathmandu', 'Kalanki, Kathmandu', 'O+', 'i am interested in programming.', 'alisha4u', 'alisha4u', '2017-04-05 10:17:14', NULL, 1, 'ROLE_USER'),
(4, 'Vijay', 'Chhetri', 'mevj99@gmail.com', '+9779849888799', 'Male', 'Sitapaila, Kathmandu', 'Kapilvastu', 'A+', 'i am data analyist.', 'mevijay', 'mevijay99', '2017-04-05 11:18:30', NULL, 1, 'ROLE_USER'),
(5, 'Manisha', 'Limbu', 'm_limbu1993@yahoo.com', '+9779818310478', 'Female', 'Buddhanagar, Kathmandu', 'Saljhandi, Rupandehi', 'A+', 'I love helping others.', 'maniiisssa', 'manisha@123', '2017-04-06 15:09:31', NULL, 0, 'ROLE_USER'),
(8, 'asf', 'asfd', 'sadfasdf@ganf.co', 's6543', 'Male', 'sadf', NULL, 'A+', NULL, 'asf', 'tyuujhgf', '2017-05-16 13:14:50', NULL, 1, 'ROLE_USER'),
(9, 'fdsaffdf', 'fsdoifjkl', 'fdkjflkdasj', '97987489', 'Male', 'dfjkdlsjfkl', NULL, 'A+', NULL, 'fjkaldj', 'fkjakldj', '2017-05-16 14:17:12', NULL, 1, 'ROLE_USER'),
(10, 'fkdsjfklj', 'fkljdsklfjkl', 'fdfdkj', 'fkdjsfkj', 'Male', 'dfkjaklj', NULL, 'A+', NULL, 'fdksfj', 'fdjslkjflk', '2017-05-16 14:19:49', NULL, 1, 'ROLE_USER'),
(11, 'fkdsjlk', 'fjdlksj', 'fkldjsfklj', 'fdskfj', 'Male', 'kfjdsklfj', NULL, 'A+', NULL, 'fdfkjalk', 'fjdlksjkl', '2017-05-16 14:22:41', NULL, 1, 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `isp_table`
--
ALTER TABLE `isp_table`
  ADD PRIMARY KEY (`isp_id`);

--
-- Indexes for table `mailing_address_table`
--
ALTER TABLE `mailing_address_table`
  ADD PRIMARY KEY (`mail_address_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `post_table`
--
ALTER TABLE `post_table`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reply_table`
--
ALTER TABLE `reply_table`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `isp_table`
--
ALTER TABLE `isp_table`
  MODIFY `isp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mailing_address_table`
--
ALTER TABLE `mailing_address_table`
  MODIFY `mail_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `post_table`
--
ALTER TABLE `post_table`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `reply_table`
--
ALTER TABLE `reply_table`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `post_table`
--
ALTER TABLE `post_table`
  ADD CONSTRAINT `post_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`);

--
-- Constraints for table `reply_table`
--
ALTER TABLE `reply_table`
  ADD CONSTRAINT `reply_table_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post_table` (`post_id`),
  ADD CONSTRAINT `reply_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

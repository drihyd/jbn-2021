-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2020 at 11:25 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whitetho_an4y4`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_gift_messages`
--

CREATE TABLE `order_gift_messages` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `gift_special_message` text NOT NULL,
  `gift_message_packaging` text NOT NULL,
  `gift_email` varchar(150) NOT NULL,
  `gift_for` char(20) NOT NULL,
  `get_for_updates` char(5) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_gift_messages`
--

INSERT INTO `order_gift_messages` (`ID`, `UserID`, `OrderID`, `gift_special_message`, `gift_message_packaging`, `gift_email`, `gift_for`, `get_for_updates`, `Addedon`) VALUES
(1, 0, 0, 'test', 'Testing by venkat', 'test@gmail.com', 'girl_friend', 'on', '2020-09-18 02:15:55'),
(2, 0, 0, 'test 123', 'Testing by venkat', 'test@gmail.com', 'girl_friend', 'on', '2020-09-21 01:47:03'),
(3, 0, 0, 'test 123', 'Testing by venkat', 'test@gmail.com', 'girl_friend', 'on', '2020-09-21 01:47:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_gift_messages`
--
ALTER TABLE `order_gift_messages`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_gift_messages`
--
ALTER TABLE `order_gift_messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

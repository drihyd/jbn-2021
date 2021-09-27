-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2020 at 11:29 AM
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
-- Table structure for table `address_master`
--

CREATE TABLE `address_master` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(12) NOT NULL,
  `Fullname` varchar(100) NOT NULL,
  `Address1` varchar(150) NOT NULL,
  `Address2` varchar(150) NOT NULL,
  `LandMark` varchar(100) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `City` varchar(50) NOT NULL,
  `Pincode` varchar(20) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Country` char(4) NOT NULL,
  `Mobile` char(20) NOT NULL,
  `addtype` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_master`
--

INSERT INTO `address_master` (`AddressID`, `UserID`, `Fullname`, `Address1`, `Address2`, `LandMark`, `Addedon`, `City`, `Pincode`, `State`, `Country`, `Mobile`, `addtype`) VALUES
(1, 0, 'shp_Fullname', 'shp_street_house', 'shp_address', '', '2020-09-17 16:32:01', 'shp_city', 'shp_pincode', 'shp_state', 'shp_', 'shp_mobile_numer', 'shipping'),
(2, 0, 'bill_Fullname', 'bill_street_house', 'bill_address', '', '2020-09-17 16:32:01', 'bill_city', 'bill_pincode', 'bill_state', 'bill', 'bill_mobile_numer', 'billing'),
(3, 0, 'Vnekat', 'Testing', 'Hyd', '', '2020-09-17 16:39:49', '', '500034', '', '', '09090909099', 'shipping'),
(4, 0, 'Test', 'Testing', 'Venkat - 2', '', '2020-09-17 16:39:49', 'Hyder', '500034', 'telangana', 'tela', '9000677584', 'billing'),
(5, 0, 'Vnekat yadav', 'Testing', 'Hyd', '', '2020-09-21 01:39:23', '', '500034', '', '', '09090909099', 'shipping'),
(6, 0, 'Test', 'Testing', 'Venkat - 2', '', '2020-09-21 01:39:23', 'Hyder', '500034', 'telangana', 'tela', '9000677584', 'billing'),
(7, 0, 'Vnekat yadav', 'Testing', 'Hyd', '', '2020-09-21 01:47:50', '', '500034', '', '', '09090909099', 'shipping'),
(8, 0, 'Vnekat yadav', 'Testing', 'Hyd', '', '2020-09-21 01:49:31', '', '500034', '', '', '09090909099', 'shipping'),
(9, 0, 'Vnekat yadav', 'Testing', 'Hyd', '', '2020-09-21 01:49:59', '', '500034', '', '', '09090909099', 'shipping'),
(10, 0, 'Vnekat yadav', 'Testing', 'Hyd', '', '2020-09-21 01:49:59', '', '500034', '', '', '09090909099', 'billing'),
(11, 0, 'Vnekat yadav', 'Testing', 'Hyd', '', '2020-09-21 01:52:18', '', '500034', '', '', '09090909099', 'shipping'),
(12, 0, 'Vnekat yadav', 'Testing', 'Hyd', '', '2020-09-21 01:52:18', '', '500034', '', '', '09090909099', 'billing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_master`
--
ALTER TABLE `address_master`
  ADD PRIMARY KEY (`AddressID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_master`
--
ALTER TABLE `address_master`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

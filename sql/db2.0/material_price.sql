-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2021 at 08:15 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anaya_jewellery`
--

-- --------------------------------------------------------

--
-- Table structure for table `material_price`
--

CREATE TABLE `material_price` (
  `id` int(11) NOT NULL,
  `material_type_id` int(11) NOT NULL,
  `metal_color_id` int(11) NOT NULL,
  `metal_clar_purity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `units` varchar(10) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_price`
--

INSERT INTO `material_price` (`id`, `material_type_id`, `metal_color_id`, `metal_clar_purity`, `price`, `units`, `ip_address`, `date`) VALUES
(7, 1, 1, 24, '9000.00', 'gm', '', '2021-04-16 05:29:05'),
(8, 1, 1, 24, '2500.00', 'gm', '', '2021-04-16 05:43:02'),
(9, 1, 1, 24, '4200.00', 'gm', '::1', '2021-04-16 05:50:20'),
(10, 1, 1, 24, '15000.00', 'gm', '::1', '2021-04-16 06:12:42'),
(11, 1, 1, 24, '1500.45', 'gm', '::1', '2021-04-16 06:14:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `material_price`
--
ALTER TABLE `material_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_type_id` (`material_type_id`),
  ADD KEY `metal_color_id` (`metal_color_id`),
  ADD KEY `metal_clar_pur_id` (`metal_clar_purity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `material_price`
--
ALTER TABLE `material_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

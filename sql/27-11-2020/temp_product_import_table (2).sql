-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2020 at 08:03 AM
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
-- Database: `anaya_jewellery`
--

-- --------------------------------------------------------

--
-- Table structure for table `temp_product_import_table`
--

CREATE TABLE `temp_product_import_table` (
  `ID` int(11) NOT NULL,
  `is_error` text DEFAULT NULL,
  `category_name` varchar(100) NOT NULL,
  `sub_category_name` varchar(100) NOT NULL,
  `no_of_pieces` varchar(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `stock` varchar(100) NOT NULL,
  `material` varchar(100) NOT NULL,
  `gross_weight` float NOT NULL,
  `net_weight` float NOT NULL,
  `product_type` varchar(100) NOT NULL,
  `provision_for_opening` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `purity_kt` varchar(100) NOT NULL,
  `metal_types` varchar(100) NOT NULL,
  `polish_details` varchar(100) NOT NULL,
  `widthmm` varchar(100) NOT NULL,
  `lengthmm` varchar(100) NOT NULL,
  `heightmm` varchar(100) NOT NULL,
  `chain_length` varchar(100) NOT NULL,
  `making_charges` varchar(100) NOT NULL,
  `making_charges_unit` varchar(100) NOT NULL,
  `making_charges_on_gross_weightnet_weight` varchar(100) NOT NULL,
  `discount_percentage` varchar(100) NOT NULL,
  `diamond_color_purity_1` varchar(100) NOT NULL,
  `diamond_shape_1` varchar(100) NOT NULL,
  `no_of_diamonds_1` varchar(100) NOT NULL,
  `certified_by_1` varchar(100) NOT NULL,
  `diamond_weight_1` varchar(100) NOT NULL,
  `diamond_rate_1` varchar(100) NOT NULL,
  `diamond_color_purity_2` varchar(100) NOT NULL,
  `diamond_shape_2` varchar(100) NOT NULL,
  `no_of_diamonds_2` varchar(100) NOT NULL,
  `certified_by_2` varchar(100) NOT NULL,
  `diamond_weight_2` varchar(100) NOT NULL,
  `diamond_rate_2` varchar(100) NOT NULL,
  `diamond_color_purity_3` varchar(100) NOT NULL,
  `diamond_shape_3` varchar(100) NOT NULL,
  `no_of_diamonds_3` varchar(100) NOT NULL,
  `certified_by_3` varchar(100) NOT NULL,
  `diamond_weight_3` varchar(100) NOT NULL,
  `diamond_rate_3` varchar(100) NOT NULL,
  `diamond_color_purity_4` varchar(100) NOT NULL,
  `diamond_shape_4` varchar(100) NOT NULL,
  `no_of_diamonds_4` varchar(100) NOT NULL,
  `certified_by_4` varchar(100) NOT NULL,
  `diamond_weight_4` varchar(100) NOT NULL,
  `diamond_rate_4` varchar(100) NOT NULL,
  `diamond_color_purity_5` varchar(100) NOT NULL,
  `diamond_shape_5` varchar(100) NOT NULL,
  `no_of_diamonds_5` varchar(100) NOT NULL,
  `certified_by_5` varchar(100) NOT NULL,
  `diamond_weight_5` varchar(100) NOT NULL,
  `diamond_rate_5` varchar(100) NOT NULL,
  `gemstone_type_1` varchar(100) NOT NULL,
  `gemstone_quantity_1` varchar(100) NOT NULL,
  `gemstone_weight_1` varchar(100) NOT NULL,
  `gemstone_rate_1` varchar(100) NOT NULL,
  `gemstone_type_2` varchar(100) NOT NULL,
  `gemstone_quantity_2` varchar(100) NOT NULL,
  `gemstone_weight_2` varchar(100) NOT NULL,
  `gemstone_rate_2` varchar(100) NOT NULL,
  `gemstone_type_3` varchar(100) NOT NULL,
  `gemstone_quantity_3` varchar(100) NOT NULL,
  `gemstone_weight_3` varchar(100) NOT NULL,
  `gemstone_rate_3` varchar(100) NOT NULL,
  `gemstone_type_4` varchar(100) NOT NULL,
  `gemstone_quantity_4` varchar(100) NOT NULL,
  `gemstone_weight_4` varchar(100) NOT NULL,
  `gemstone_rate_4` varchar(100) NOT NULL,
  `gemstone_type_5` varchar(100) NOT NULL,
  `gemstone_quantity_5` varchar(100) NOT NULL,
  `gemstone_weight_5` varchar(100) NOT NULL,
  `gemstone_rate_5` varchar(100) NOT NULL,
  `pearls_1` varchar(100) NOT NULL,
  `pearls_quantity_1` varchar(100) NOT NULL,
  `pearl_weight_1` varchar(100) NOT NULL,
  `pearls_rate_1` varchar(100) NOT NULL,
  `pearls_2` varchar(100) NOT NULL,
  `pearls_quantity_2` varchar(100) NOT NULL,
  `pearl_weight_2` varchar(100) NOT NULL,
  `pearls_rate_2` varchar(100) NOT NULL,
  `pearls_3` varchar(100) NOT NULL,
  `pearls_quantity_3` varchar(100) NOT NULL,
  `pearl_weight_3` varchar(100) NOT NULL,
  `pearls_rate_3` varchar(100) NOT NULL,
  `pearls_4` varchar(100) NOT NULL,
  `pearls_quantity_4` varchar(100) NOT NULL,
  `pearl_weight_4` varchar(100) NOT NULL,
  `pearls_rate_4` varchar(100) NOT NULL,
  `pearls_5` varchar(100) NOT NULL,
  `pearls_quantity_5` varchar(100) NOT NULL,
  `pearl_weight_5` varchar(100) NOT NULL,
  `pearls_rate_5` varchar(100) NOT NULL,
  `mrp_price` varchar(100) NOT NULL,
  `actual_price` varchar(100) NOT NULL,
  `collection` varchar(100) NOT NULL,
  `special_notes` varchar(100) NOT NULL,
  `screw_type` varchar(100) NOT NULL,
  `certificate_number` varchar(100) NOT NULL,
  `mould_availability` varchar(100) NOT NULL,
  `cad_availability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp_product_import_table`
--

INSERT INTO `temp_product_import_table` (`ID`, `is_error`, `category_name`, `sub_category_name`, `no_of_pieces`, `product_code`, `product_name`, `product_description`, `gender`, `stock`, `material`, `gross_weight`, `net_weight`, `product_type`, `provision_for_opening`, `size`, `purity_kt`, `metal_types`, `polish_details`, `widthmm`, `lengthmm`, `heightmm`, `chain_length`, `making_charges`, `making_charges_unit`, `making_charges_on_gross_weightnet_weight`, `discount_percentage`, `diamond_color_purity_1`, `diamond_shape_1`, `no_of_diamonds_1`, `certified_by_1`, `diamond_weight_1`, `diamond_rate_1`, `diamond_color_purity_2`, `diamond_shape_2`, `no_of_diamonds_2`, `certified_by_2`, `diamond_weight_2`, `diamond_rate_2`, `diamond_color_purity_3`, `diamond_shape_3`, `no_of_diamonds_3`, `certified_by_3`, `diamond_weight_3`, `diamond_rate_3`, `diamond_color_purity_4`, `diamond_shape_4`, `no_of_diamonds_4`, `certified_by_4`, `diamond_weight_4`, `diamond_rate_4`, `diamond_color_purity_5`, `diamond_shape_5`, `no_of_diamonds_5`, `certified_by_5`, `diamond_weight_5`, `diamond_rate_5`, `gemstone_type_1`, `gemstone_quantity_1`, `gemstone_weight_1`, `gemstone_rate_1`, `gemstone_type_2`, `gemstone_quantity_2`, `gemstone_weight_2`, `gemstone_rate_2`, `gemstone_type_3`, `gemstone_quantity_3`, `gemstone_weight_3`, `gemstone_rate_3`, `gemstone_type_4`, `gemstone_quantity_4`, `gemstone_weight_4`, `gemstone_rate_4`, `gemstone_type_5`, `gemstone_quantity_5`, `gemstone_weight_5`, `gemstone_rate_5`, `pearls_1`, `pearls_quantity_1`, `pearl_weight_1`, `pearls_rate_1`, `pearls_2`, `pearls_quantity_2`, `pearl_weight_2`, `pearls_rate_2`, `pearls_3`, `pearls_quantity_3`, `pearl_weight_3`, `pearls_rate_3`, `pearls_4`, `pearls_quantity_4`, `pearl_weight_4`, `pearls_rate_4`, `pearls_5`, `pearls_quantity_5`, `pearl_weight_5`, `pearls_rate_5`, `mrp_price`, `actual_price`, `collection`, `special_notes`, `screw_type`, `certificate_number`, `mould_availability`, `cad_availability`) VALUES
(18, '', 'Ring', 'cocktail ring', '1', 'NVR 69', 'Kia1', 'Diamond ring', 'Female', '1', 'Gold ', 9.13, 8.962, 'anaya', 'No', '11', '18', 'Rose gold and white gold', 'Rose gold and white gold', '3.08 -22.02 ', '27.01', '', '', '1675', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '137', 'IGI', '0.84', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Wedding', '', '', '19J560441706', '', ''),
(19, '', 'Ring', 'cocktail ring', '1', 'NVR 92', 'Kia2', 'Flower ring', 'Female', '1', 'Gold ', 14.88, 14.69, 'anaya', 'No', '13', '18', 'Rose gold and white gold', 'Rose gold and white gold', '40', '40', '', '', '1575', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '33', 'IGI', '0.95', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Festival', '', '', 'I6J62056116', '', ''),
(20, '', 'Ring', 'cocktail ring', '1', 'NVR 94', 'Kia3', 'Diamond ring', 'Female', '1', 'Gold ', 9, 8.914, 'anaya', 'No', '14', '18', 'Rose gold and white gold', 'Rose gold and white gold', '22.87', '21.05', '', '', '1675', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '43', 'IGI', '0.43', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Party wear', '', '', 'I6J620571116', '', ''),
(21, '', 'Ring', 'cocktail ring', '1', 'NVR 103', 'Kia4', 'Diamond ring', 'Female', '1', 'Gold ', 7.99, 7.642, 'anaya', 'No', '13.5', '18', 'yellow gold', 'yellow gold', '26.67', '22.31', '', '', '875', 'per gram', 'Gross weight', '', '', 'Round', '134', 'Non certified diamonds', '1.26', '51000', '', 'baguette', '17', 'Non Certified diamonds', '0.48', '42000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Wedding', '', '', '', '', ''),
(22, '<ol><li>This OptionName [marqies] does not exist.</li></ol>', 'Ring', 'cocktail ring', '1', 'NZR 3', 'Kia5', 'Flower ring', 'Female', '1', 'Gold ', 8.74, 8.398, 'anaya', 'No', '16', '18', 'rose gold', 'rose gold', '12.28', '31', '', '', '1375', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '91', 'IGI', '0.57', '51000', 'VVS-EF', 'marqies', '2', 'IGI', '0.15', '68000', 'EF-VVS', 'pears', '12', 'IGI', '0.99', '85000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Festival', '', '', '27J099631809', '', ''),
(23, '', 'Ring', 'cocktail ring', '1', 'NVR 63', 'Kia6', 'Flower ring', 'Female', '1', 'Gold ', 11.94, 11.716, 'anaya', 'No', '14', '18', 'white gold and yellow gold', 'white gold and yellow gold', '23.55', '26.21', '', '', '875', 'per gram', 'Gross weight', '', '', 'Round', '51', 'Non certified diamonds', '0.75', '51000', '', 'baguette', '14', 'Non Certified diamonds', '37', '42000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Party wear', '', '', '', '', ''),
(24, '', 'Ring', 'cocktail ring', '1', 'NVR 88', 'Kia7', 'Diamond ring', 'Female', '1', 'Gold ', 4.83, 4.662, 'solitaire ', 'No', '13', '18', 'Rose gold and white gold', 'Rose gold and white gold', '13.72', '13.95', '', '', '1675', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '65', 'IGI', '0.84', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Wedding', '', '', '19J560401706', '', ''),
(25, '', 'Ring', 'cocktail ring', '1', 'NVR 52', 'Kia8', 'Diamond ring', 'Female', '1', 'Gold ', 4.49, 4.42, 'solitaire ', 'No', '15', '18', 'yellow gold', 'yellow gold', '15.72', '19.62', '', '', '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '102', 'IGI', '0.35', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Festival', '', '', '30J774961710', '', ''),
(26, '', 'Ring', 'cocktail ring', '1', 'NVR 42', 'Kia9', 'Diamond ring', 'Female', '1', 'Gold ', 4.15, 4.008, 'solitaire ', 'No', '12', '18', 'yellow gold', 'yellow gold', '19.39', '13.57', '', '', '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '106', 'IGI', '0.71', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Party wear', '', '', '28J119151809', '', ''),
(27, '', 'Ring', 'cocktail ring', '1', 'NVR 90', 'Kia10', 'Floral ring', 'Female', '1', 'Gold ', 14.46, 14.158, 'solitaire ', 'No', '13', '18', 'Rose gold and white gold', 'Rose gold and white gold', '31', '27.09', '', '', '1675', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '134', 'IGI', '1.51', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Wedding', '', '', 'I6J620651116', '', ''),
(28, '<ol><li>This OptionName [marqies] does not exist.</li></ol>', 'Ring', 'cocktail ring', '1', 'NVR 80', 'Kia11', 'Floral ring', 'Female', '1', 'Gold ', 10.37, 10.212, 'solitaire ', 'No', '15', '18', 'yellow gold and white gold', 'yellow gold and white gold', '14.95', '14.95', '', '', '875', 'per gram', 'Gross weight', '', '', 'Round', '11', 'Non certified diamonds', '0.16', '51000', '', 'baguette', '20', 'Non Certified diamonds', '0.45', '42000', '', 'marqies', '4', 'Non Certified diamonds', '0.18', '58000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Festival', '', '', '', '', ''),
(29, '', 'Ring', 'Ring', '1', 'NVR 101', 'Kia12', 'Diamond ring', 'Female', '1', 'Gold ', 1.6, 1.586, 'jbn', 'No', '11', '18', 'yellow gold', 'yellow gold', '2.87', '2.87', '', '', '1414', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '1', 'IGI', '0.07000000000000001', '68000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Party wear', '', '', '26J939191809', '', ''),
(30, '', 'Ring', 'Ring', '1', 'NVR140', 'Kia13', 'Diamond ring', 'Female', '1', 'Gold ', 1.47, 1.456, 'jbn', 'No', '13.5', '18', 'yellow gold', 'yellow gold', '7.2', '5.97', '', '', '1495', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '1', 'IGI', '0.07000000000000001', '68000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Daily wear', '', '', 'I5J576440816', '', ''),
(31, '', 'Ring', 'Ring', '1', 'NVR33', 'Kia14', 'Diamond ring', 'Female', '1', 'Gold ', 2.11, 2.086, 'jbn', 'No', '12', '18', 'yellow gold', 'yellow gold', '10.43', '5.3', '', '', '1190', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '8', 'IGI', '0.12', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Daily wear', '', '', 'I5J581770916', '', ''),
(32, '', 'Ring', 'Ring', '1', 'NVR70', 'Kia15', 'Diamond ring', 'Female', '1', 'Gold ', 2.42, 2.374, 'anaya', 'No', '11', '18', 'yellow gold', 'yellow gold', '19.67', '5.05', '', '', '1095', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '13', 'IGI', '0.23', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Daily wear', '', '', 'I5J582210916', '', ''),
(33, '', 'Ring', 'Ring', '1', 'NVR105', 'Kia16', 'Diamond ring', 'Female', '1', 'Gold ', 1.99, 1.916, 'anaya', 'no', '10', '18', 'yellow gold', 'yellow gold', '19.36', '6.02', '', '', '1230', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '26', 'IGI', '0.37', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Daily wear', '', '', '27J485101809', '', ''),
(34, '', 'Ring', 'Ring', '1', 'NVR96', 'Kia17', 'Diamond ring', 'Female', '1', 'Gold ', 2.21, 2.188, 'anaya', 'No', '13', '18', 'yellow gold', 'yellow gold', '8.699999999999999', '7.7', '', '', '1150', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '1', 'IGI', '0.11', '75000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Daily wear', '', '', 'I5J576690816', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `temp_product_import_table`
--
ALTER TABLE `temp_product_import_table`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `temp_product_import_table`
--
ALTER TABLE `temp_product_import_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

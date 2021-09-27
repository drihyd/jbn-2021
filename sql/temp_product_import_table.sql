-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2020 at 06:50 AM
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
-- Database: `deepred_anaya`
--

-- --------------------------------------------------------

--
-- Table structure for table `temp_product_import_table`
--

CREATE TABLE `temp_product_import_table` (
  `ID` int(11) NOT NULL,
  `A_category_name` varchar(100) NOT NULL,
  `category_error_checking` varchar(100) NOT NULL,
  `B_sub_category_name` varchar(100) NOT NULL,
  `sub_category_error_checking` varchar(100) NOT NULL,
  `C_no_of_pieces` varchar(100) NOT NULL,
  `D_product_code` varchar(100) NOT NULL,
  `E_product_name` varchar(100) NOT NULL,
  `F_product_description` varchar(100) NOT NULL,
  `G_gender` varchar(100) NOT NULL,
  `H_discount_percentage` varchar(100) NOT NULL,
  `I_stock` varchar(100) NOT NULL,
  `J_material` varchar(100) NOT NULL,
  `material_error_checking` varchar(100) NOT NULL,
  `K_purity_in_kt` varchar(100) NOT NULL,
  `purity_error_checking` varchar(100) NOT NULL,
  `L_gross_weight` varchar(100) NOT NULL,
  `M_net_weight` varchar(100) NOT NULL,
  `N_provision_for_opening` varchar(100) NOT NULL,
  `O_sizeringbraceletbangles` varchar(100) NOT NULL,
  `P_metal_types` varchar(100) NOT NULL,
  `color_metal_err_chk` varchar(50) NOT NULL,
  `Q_certirifed_by` varchar(100) NOT NULL,
  `diam_certi_err_chk` varchar(100) NOT NULL,
  `R_diamond_types` varchar(100) NOT NULL,
  `dia_clor_error` varchar(100) NOT NULL,
  `dia_clarity_error` varchar(100) NOT NULL,
  `S_no_of_diamonds` varchar(100) NOT NULL,
  `T_diamond_weight_in_ct` varchar(100) NOT NULL,
  `U_diamond_rate` varchar(100) NOT NULL,
  `V_diamond_shape` varchar(100) NOT NULL,
  `W_no_of_diamonds` varchar(100) NOT NULL,
  `X_diamond_weight_in_ct` varchar(100) NOT NULL,
  `Y_diamond_rate` varchar(100) NOT NULL,
  `Z_diamond_shape` varchar(100) NOT NULL,
  `AA_no_of_diamonds` varchar(100) NOT NULL,
  `AB_diamond_weight_in_ct` varchar(100) NOT NULL,
  `AC_diamond_rate` varchar(100) NOT NULL,
  `AD_diamond_shape` varchar(100) NOT NULL,
  `AE_gemstone_type` varchar(100) NOT NULL,
  `AF_gemstone_quantity` varchar(100) NOT NULL,
  `AG_gemstone_weight` varchar(100) NOT NULL,
  `AH_gemstone_rate` varchar(100) NOT NULL,
  `AI_pearls` varchar(100) NOT NULL,
  `AJ_pearls_quantity` varchar(100) NOT NULL,
  `AK_pearl_weight` varchar(100) NOT NULL,
  `AL_pearls_rate` varchar(100) NOT NULL,
  `AM_width_mm` varchar(100) NOT NULL,
  `AN_length_mm` varchar(100) NOT NULL,
  `AO_height_mm` varchar(100) NOT NULL,
  `AP_chain_length` varchar(100) NOT NULL,
  `AQ_making_charges` varchar(100) NOT NULL,
  `AR_per_unit` varchar(100) NOT NULL,
  `AS_on_gross_weightnet_weight` varchar(100) NOT NULL,
  `AT_you_may_also_like_1` varchar(100) NOT NULL,
  `AU_you_may_also_like_12` varchar(100) NOT NULL,
  `AV_you_may_also_like_3` varchar(100) NOT NULL,
  `AW_polish_details` varchar(100) NOT NULL,
  `AX_cad` varchar(100) NOT NULL,
  `AY_mold` varchar(100) NOT NULL,
  `AZ_photography` varchar(100) NOT NULL,
  `BA_perspective_image` varchar(100) NOT NULL,
  `BB_mrp_price` varchar(100) NOT NULL,
  `BC_actual_price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp_product_import_table`
--

INSERT INTO `temp_product_import_table` (`ID`, `A_category_name`, `category_error_checking`, `B_sub_category_name`, `sub_category_error_checking`, `C_no_of_pieces`, `D_product_code`, `E_product_name`, `F_product_description`, `G_gender`, `H_discount_percentage`, `I_stock`, `J_material`, `material_error_checking`, `K_purity_in_kt`, `purity_error_checking`, `L_gross_weight`, `M_net_weight`, `N_provision_for_opening`, `O_sizeringbraceletbangles`, `P_metal_types`, `color_metal_err_chk`, `Q_certirifed_by`, `diam_certi_err_chk`, `R_diamond_types`, `dia_clor_error`, `dia_clarity_error`, `S_no_of_diamonds`, `T_diamond_weight_in_ct`, `U_diamond_rate`, `V_diamond_shape`, `W_no_of_diamonds`, `X_diamond_weight_in_ct`, `Y_diamond_rate`, `Z_diamond_shape`, `AA_no_of_diamonds`, `AB_diamond_weight_in_ct`, `AC_diamond_rate`, `AD_diamond_shape`, `AE_gemstone_type`, `AF_gemstone_quantity`, `AG_gemstone_weight`, `AH_gemstone_rate`, `AI_pearls`, `AJ_pearls_quantity`, `AK_pearl_weight`, `AL_pearls_rate`, `AM_width_mm`, `AN_length_mm`, `AO_height_mm`, `AP_chain_length`, `AQ_making_charges`, `AR_per_unit`, `AS_on_gross_weightnet_weight`, `AT_you_may_also_like_1`, `AU_you_may_also_like_12`, `AV_you_may_also_like_3`, `AW_polish_details`, `AX_cad`, `AY_mold`, `AZ_photography`, `BA_perspective_image`, `BB_mrp_price`, `BC_actual_price`) VALUES
(1, 'Bangles', '{\"status\":\"success\",\"ID\":\"12\"}', 'Open setting diamond bangles', '{\"status\":\"failed\",\"ID\":0}', '2', 'NVB30', '', 'A pair of bangles with rubies and diamonds', 'Women', '', '1', 'gold', '{\"status\":\"success\",\"ID\":\"1\"}', '18', '{\"status\":\"success\",\"ID\":\"3\"}', '49.53', '46.65', 'Yes', '2.4', 'Yellow gold ', '{\"status\":\"failed\",\"ID\":0}', 'IGI', '', 'EF-VVS', '', '', '265', '5.02', '51000', 'Round', '269', '4.68', '42000', 'Baguette', '', '', '', '', 'Rubies', '10', '4.7', '1000 per carat', '', '', '', '', '26.76', '26.7', '', '', '875', 'gram', 'on gross weight', '', '', '', 'Yellow gold with white pen rodium', '', '', 'Not done', 'Yes', '', ''),
(2, 'Bangles', '{\"status\":\"success\",\"ID\":\"12\"}', 'Open setting diamond bangles', '{\"status\":\"failed\",\"ID\":0}', '1', 'NVB17', '', 'A single bangle in fancy cut diamonds', 'Women', '', '1', 'gold', '{\"status\":\"success\",\"ID\":\"1\"}', '18', '{\"status\":\"success\",\"ID\":\"3\"}', '27.35', '26.198', 'No', '2.5', 'Yellow gold', '{\"status\":\"success\",\"ID\":\"15\"}', 'IGI', '', 'EF-VVS', '', '', '317', '3.52', '51000', 'Round', '33', '0.82', '68000', 'Marquis', '22', '1.42', '75000', 'Pear ', 'NA', 'NA', 'NA', 'NA', '', '', '', '', '27.76', '26.7', '', '', '975', 'gram', 'on gross weight', '', '', '', 'Yellow gold with white and rose gold pen rodium', '', '', 'Not done ', 'Yes', '', '');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

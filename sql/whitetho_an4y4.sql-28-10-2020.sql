-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 28, 2020 at 11:17 AM
-- Server version: 5.6.49
-- PHP Version: 7.3.6

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
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `City` varchar(50) NOT NULL,
  `Pincode` varchar(20) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `Mobile` char(20) NOT NULL,
  `addtype` char(20) NOT NULL,
  `billing_same_as_shipping` char(5) NOT NULL,
  `is_default` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_master`
--

INSERT INTO `address_master` (`AddressID`, `UserID`, `Fullname`, `Address1`, `Address2`, `LandMark`, `Addedon`, `City`, `Pincode`, `State`, `Country`, `Mobile`, `addtype`, `billing_same_as_shipping`, `is_default`) VALUES
(1, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:35:07', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(2, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:35:07', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(3, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:39:20', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(4, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:39:20', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(5, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:42:10', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(6, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:42:10', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(7, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:42:45', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(8, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:42:45', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(9, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:48:54', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(10, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:48:54', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(11, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:50:11', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(12, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 09:50:11', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(13, 5, 'Test', 'Testing', '', '', '2020-10-01 09:54:34', 'Hyder', '500034', 'India', 'tela', '09090909099', 'shipping', '', 0),
(14, 5, 'Test', 'Testing', '', '', '2020-10-01 09:54:34', 'Hyder', '500034', 'India', 'tela', '09090909099', 'billing', 'on', 0),
(15, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 11:02:18', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(16, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 11:02:18', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(17, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 12:13:21', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(18, 4, 'Venkat', 'Meerpet', '', '', '2020-10-01 12:13:21', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(19, 4, 'Venkat', 'Meerpet', '', '', '2020-10-04 23:28:34', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(20, 4, 'Venkat', 'Meerpet', '', '', '2020-10-04 23:28:35', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(21, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 01:21:35', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(22, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 01:21:35', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(23, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 01:31:17', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(24, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 01:31:17', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(25, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 03:39:37', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(26, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 03:39:37', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(27, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 08:38:39', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'shipping', '', 0),
(28, 4, 'Venkat', 'Meerpet', '', '', '2020-10-05 08:38:39', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'billing', 'on', 0),
(31, 4, 'Fullname', 'street', 'address info', '', '2020-10-05 08:59:43', 'city', '518401', 'state', 'coutnry', '9052691535', 'shipping', '', 1),
(32, 4, 'Fullname', 'street', 'address info', '', '2020-10-05 08:59:43', 'city', '518401', 'state', 'coutnry', '9052691535', 'billing', 'on', 1),
(33, 5, 'Test', 'Testing', '', '', '2020-10-05 16:51:24', 'Hyder', '500034', 'India', 'tela', '9090909099', 'shipping', '', 1),
(34, 5, 'Test', 'Testing', '', '', '2020-10-05 16:51:24', 'Hyder', '500034', 'India', 'tela', '9090909099', 'billing', 'on', 1),
(35, 7, 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', '2020-10-06 03:04:33', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'shipping', '', 1),
(36, 7, 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', '2020-10-06 03:04:33', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'billing', 'on', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `AdminID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(150) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `EmailVerified` tinyint(1) NOT NULL DEFAULT '1',
  `RegistrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IP` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `Status` enum('Active','Deactive') NOT NULL,
  `LastLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`AdminID`, `Email`, `Password`, `FirstName`, `LastName`, `EmailVerified`, `RegistrationDate`, `IP`, `Phone`, `Address`, `RoleID`, `Status`, `LastLogin`) VALUES
(1, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju', 'vangapandu', 1, '2020-08-13 08:55:18', '202.83.28.235', '9700334319', 'vijayawada', 1, 'Active', '2020-10-16 11:12:19'),
(2, 'venkat@deepredink.com', 'feb43797d2a30b2472d5f3d7604f8b70', 'venkat', 'Yadav', 1, '2020-08-20 06:18:38', '157.48.154.168', '9872458585', 'sdgfdg', 4, 'Active', '2020-08-31 16:54:10'),
(6, 'rajkumar@deepredink.com', '43ab12269b21434ab9132e1bda2aa78d', '', '', 1, '2020-08-31 06:16:20', '49.206.45.21', '', '', 1, 'Active', '2020-10-28 16:29:39'),
(7, 'shanthi@whitethoughts.in', 'de1e0a63351b68f3112e2bce5024af7a', 'Shanti', 'WTB', 1, '2020-09-15 05:09:06', '223.238.32.67', 'shanti$$', '', 2, 'Active', '2020-09-15 15:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `available_locations`
--

CREATE TABLE `available_locations` (
  `id` int(11) NOT NULL,
  `pincode` int(6) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `available_locations`
--

INSERT INTO `available_locations` (`id`, `pincode`, `is_available`, `name`) VALUES
(1, 500085, 1, 'KPHB Colony');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `Banner_image` varchar(255) NOT NULL,
  `Heading_One` varchar(150) DEFAULT NULL,
  `Heading_Two` varchar(150) DEFAULT NULL,
  `Description` varchar(250) NOT NULL,
  `Button_Name` varchar(30) DEFAULT NULL,
  `Call_to_action_URL` varchar(150) DEFAULT NULL,
  `Panel_Type` enum('Home_Banner_Panel','Right_Image_Panel','Left_Image_Panel','Without_Image_Panel') NOT NULL,
  `Order_By` int(11) DEFAULT NULL,
  `Added_On` datetime DEFAULT NULL,
  `status` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `Banner_image`, `Heading_One`, `Heading_Two`, `Description`, `Button_Name`, `Call_to_action_URL`, `Panel_Type`, `Order_By`, `Added_On`, `status`) VALUES
(1, 'banner_images/JR00313-WGP900_11_listfront.jpg', 'Platinum rings', 'You\'re worth it.', 'Lorem Ipsum', 'Shop Now', 'https://whitethoughtsdemos.com/anaya/product/platinum-rings', 'Home_Banner_Panel', 1, '2020-08-20 10:35:12', '1'),
(2, 'banner_images/JR00050-WRP200_11_listfront.jpg', 'Diamond Collection', 'You\'re worth it.', 'Lorem Ipsum', 'Shop Now', 'https://whitethoughtsdemos.com/anaya/product/enagagement-rings', 'Home_Banner_Panel', 1, '2020-08-20 10:35:12', '1'),
(4, 'banner_images/JR00322-YGP900_11_listfront.jpg', 'Gold Rings', 'Gold Rings', 'Lorem Ipsum', 'shop now', 'https://whitethoughtsdemos.com/anaya/product/alocasia-root-earring', 'Home_Banner_Panel', 1, '2020-08-20 02:59:44', '1'),
(5, '', 'NEW ARRIVALS', '', 'Make a statements tha\'t all yours. Mix, Match, andstake to your heart\'s content', 'Shop Now', 'http://www.anayajewellery.com/', 'Without_Image_Panel', 1, '2020-08-21 08:40:05', '1'),
(6, 'banner_images/left_back.jpg', 'ANAYA GOLD -1', '', 'Lorem ipsum dolor ipsum dolor -1', 'Shop Now', 'http://www.anayajewellery.com/', 'Left_Image_Panel', 1, '2020-08-21 08:57:52', '1'),
(7, 'banner_images/left_back1.jpg', 'ANAYA GOLD - 2', '', 'Lorem ipsum dolor ipsum dolor - 2', 'Shop Now', 'http://www.anayajewellery.com/', 'Right_Image_Panel', 1, '2020-08-21 08:58:58', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `Order_DetailsID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `order_method` varchar(30) NOT NULL,
  `ProductName` varchar(150) NOT NULL,
  `MRP_Price` float NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductSKU` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT '1',
  `CouponID` int(11) NOT NULL,
  `CouponCode` varchar(50) NOT NULL,
  `Amount` float NOT NULL,
  `MRP_Amount` float NOT NULL,
  `attribute_json_data` text NOT NULL,
  `customized_product_data` text NOT NULL,
  `discounted_amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`Order_DetailsID`, `OrderID`, `ProductID`, `order_method`, `ProductName`, `MRP_Price`, `ProductPrice`, `ProductSKU`, `Quantity`, `CouponID`, `CouponCode`, `Amount`, `MRP_Amount`, `attribute_json_data`, `customized_product_data`, `discounted_amount`) VALUES
(3, 3, 2, '', 'NVB17', 20001, 15001, 'NVB17', 1, 0, '', 15001, 20001, '', '', NULL),
(6, 6, 3, 'customized', 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', '{\"custom_order_size\":\".2.\",\"custom_order_color\":\"GH-VVS\"}', NULL),
(7, 7, 1, '', 'NVB30', 20000, 15000, 'NVB30', 2, 0, '', 30000, 40000, '', '', NULL),
(8, 8, 3, '', 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', '', NULL),
(11, 11, 3, '', 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', '', NULL),
(12, 11, 19, '', 'NVT580', 20018, 15018, 'NVT580', 1, 0, '', 15018, 20018, '', '', NULL),
(14, 13, 3, '', 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', '', NULL),
(15, 14, 1, 'customized', 'NVB30', 20000, 15000, 'NVB30', 1, 0, '', 15000, 20000, '', '{\"custom_order_size\":\".2.\",\"custom_order_color\":\"EF-VVS\"}', NULL),
(16, 15, 3, '', 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', '', NULL),
(17, 16, 1, '', 'NVB30', 20000, 15000, 'NVB30', 1, 0, '', 15000, 20000, '', '', NULL),
(20, 19, 3, 'customized', 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', '{\"custom_order_size\":\".2.\",\"custom_order_color\":\"EF-VVS\"}', NULL),
(21, 20, 19, '', 'NVT580', 20018, 15018, 'NVT580', 1, 0, '', 15018, 20018, '', '', NULL),
(24, 23, 19, '', 'NVT580', 20018, 15018, 'NVT580', 1, 0, '', 15018, 20018, '', '', NULL),
(25, 24, 1, '', 'NVB30', 260032, 260032, 'NVB30', 1, 0, '', 260032, 260032, '', '', 0),
(26, 24, 2, '', 'NVB17', 143588, 143588, 'NVB17', 1, 0, '', 143588, 143588, '', '', 0),
(27, 25, 19, '', 'NVT580', 24622.5, 24622.5, 'NVT580', 1, 7, 'gfg', 24622.5, 24622.5, '', '', 2625),
(28, 26, 1, '', 'NVB30', 260032, 260032, 'NVB30', 1, 0, '', 260032, 260032, '', '', NULL),
(29, 27, 3, '', 'NVB63', 335738, 335738, 'NVB63', 1, 0, '', 335738, 335738, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_master`
--

CREATE TABLE `cart_master` (
  `OrderlD` int(11) NOT NULL,
  `Order_Number` varchar(100) NOT NULL,
  `UserlD` varchar(120) NOT NULL,
  `OrderAmount` float NOT NULL,
  `OrderShipName` varchar(100) NOT NULL,
  `OrderPhone` varchar(20) NOT NULL,
  `OrderShipping` tinyint(1) NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmall` varchar(100) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` tinyint(1) NOT NULL,
  `OrderTrackingNumber` varchar(80) NOT NULL,
  `Delivery_Mode` varchar(20) NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `Order_status` enum('placed','confirmed','processing','dispatched','on Hold','delivered','cancelled','cancelled - Refund pending','Cancelled-Refunded') NOT NULL DEFAULT 'on Hold',
  `billing_Fullname` varchar(100) NOT NULL,
  `billing_Address1` varchar(150) NOT NULL,
  `billing_Address2` varchar(150) NOT NULL,
  `billing_LandMark` varchar(100) NOT NULL,
  `billing_City` varchar(50) NOT NULL,
  `billing_Pincode` varchar(20) NOT NULL,
  `billing_State` varchar(30) NOT NULL,
  `billing_Country` varchar(50) NOT NULL,
  `billing_Mobile` varchar(20) NOT NULL,
  `shipping_Fullname` varchar(100) NOT NULL,
  `shipping_Address1` varchar(150) NOT NULL,
  `shipping_Address2` varchar(150) NOT NULL,
  `shipping_LandMark` varchar(100) NOT NULL,
  `shipping_City` varchar(50) NOT NULL,
  `shipping_Pincode` varchar(20) NOT NULL,
  `shipping_State` varchar(30) NOT NULL,
  `shipping_Country` varchar(50) NOT NULL,
  `shipping_Mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_master`
--

INSERT INTO `cart_master` (`OrderlD`, `Order_Number`, `UserlD`, `OrderAmount`, `OrderShipName`, `OrderPhone`, `OrderShipping`, `OrderTax`, `OrderEmall`, `OrderDate`, `OrderShipped`, `OrderTrackingNumber`, `Delivery_Mode`, `DeliveryDate`, `Order_status`, `billing_Fullname`, `billing_Address1`, `billing_Address2`, `billing_LandMark`, `billing_City`, `billing_Pincode`, `billing_State`, `billing_Country`, `billing_Mobile`, `shipping_Fullname`, `shipping_Address1`, `shipping_Address2`, `shipping_LandMark`, `shipping_City`, `shipping_Pincode`, `shipping_State`, `shipping_Country`, `shipping_Mobile`) VALUES
(3, '20201005181534', '9bd6b789bf07cc7e12a346b34b28e53b16558b4c', 15001, '', '', 0, 0, '', '2020-10-05 12:45:34', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, '20201005221031', '5', 15002, 'Venkat Yadav ', '', 0, 0, 'venkatyadav.1986@gmail.com', '2020-10-05 16:40:31', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Test', 'Testing', '', '', 'Hyder', '500034', 'India', 'tela', '9090909099', 'Test', 'Testing', '', '', 'Hyder', '500034', 'India', 'tela', '9090909099'),
(7, '20201005222658', '5', 30000, '', '', 0, 0, '', '2020-10-05 16:56:58', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, '20201005224548', '5', 15002, '', '', 0, 0, '', '2020-10-05 17:15:48', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(11, '20201006073122', '4', 30020, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2020-10-06 02:01:22', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535'),
(13, '20201006082716', '7', 15002, '', '', 0, 0, '', '2020-10-06 02:57:16', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, '20201006083246', '4', 15000, '', '', 0, 0, '', '2020-10-06 03:02:46', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, '20201006085122', '7', 15002, 'Jayaraju Vangapandu ', '', 0, 0, 'jayarajuv5@gmail.com', '2020-10-06 03:21:22', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319'),
(16, '20201006085304', '7', 15000, '', '', 0, 0, '', '2020-10-06 03:23:04', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, '20201006092329', '4', 15002, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2020-10-06 03:53:29', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535'),
(20, '20201006102939', '7', 15018, 'Jayaraju Vangapandu ', '', 0, 0, 'jayarajuv5@gmail.com', '2020-10-06 04:59:39', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319'),
(23, '20201007115946', '7', 15018, 'Jayaraju Vangapandu ', '', 0, 0, 'jayarajuv5@gmail.com', '2020-10-07 06:29:46', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319'),
(24, '20201009152622', 'b3b5e4f92fbae8f2ce2763ad1cf3fc3ede8c70c5', 403620, '', '', 0, 0, '', '2020-10-09 09:56:22', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, '20201012094656', '141ce0b3b24c40faf499398c5128bb1d204d9a0c', 21997.5, '', '', 0, 0, '', '2020-10-12 04:16:56', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, '20201012133132', '2736619789aa532644d81bf09e9ee167271a040c', 0, '', '', 0, 0, '', '2020-10-12 08:01:32', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, '20201028150457', '082f36b8c64632b6519ae68df739584e40f96d06', 0, '', '', 0, 0, '', '2020-10-28 09:34:57', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `phone`, `subject`, `comments`, `created_on`) VALUES
(1, 'jayaraju', 'jayaraju@deepredink.com', '9700334319', 'rings', 'new model request', '2020-09-14 05:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `CouponID` int(11) NOT NULL,
  `Coupon_title` varchar(100) NOT NULL,
  `CouponCode` varchar(20) NOT NULL,
  `CouponAddedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CouponExpiryDate` date NOT NULL,
  `Description` varchar(100) NOT NULL,
  `DiscountType` char(10) NOT NULL,
  `Discount_value` float NOT NULL,
  `Cartamount` float NOT NULL,
  `Couponamount` float NOT NULL,
  `Is_Active` tinyint(1) NOT NULL DEFAULT '1',
  `Is_public` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`CouponID`, `Coupon_title`, `CouponCode`, `CouponAddedon`, `CouponExpiryDate`, `Description`, `DiscountType`, `Discount_value`, `Cartamount`, `Couponamount`, `Is_Active`, `Is_public`) VALUES
(7, 'fgdfg', 'gfg', '2020-09-29 01:45:51', '2020-09-30', 'sdgf', 'percent', 25, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `material_price`
--

CREATE TABLE `material_price` (
  `id` int(11) NOT NULL,
  `material_type_id` int(11) NOT NULL,
  `metal_color_id` int(11) NOT NULL,
  `metal_clar_pur_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `units` varchar(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_price`
--

INSERT INTO `material_price` (`id`, `material_type_id`, `metal_color_id`, `metal_clar_pur_id`, `price`, `units`, `date`) VALUES
(1, 1, 1, 1, 5000, 'gm', '2020-09-03 11:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `material_type`
--

CREATE TABLE `material_type` (
  `MaterialID` int(11) NOT NULL,
  `MaterialName` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material_type`
--

INSERT INTO `material_type` (`MaterialID`, `MaterialName`, `slug`) VALUES
(1, 'Gold', 'gold'),
(2, 'Platinum', 'platinum'),
(3, 'Silver', 'silver'),
(4, 'Diamonds', 'diamond');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `m_id` int(11) NOT NULL,
  `m_name` varchar(50) NOT NULL,
  `m_url` varchar(255) DEFAULT NULL,
  `m_slug` varchar(255) DEFAULT NULL,
  `m_desc` varchar(255) DEFAULT NULL,
  `m_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_position` varchar(50) DEFAULT NULL,
  `order_logic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`m_id`, `m_name`, `m_url`, `m_slug`, `m_desc`, `m_created_at`, `m_position`, `order_logic`) VALUES
(1, 'Primary Menu', NULL, 'primary-menu', NULL, '2020-08-25 06:17:59', NULL, NULL),
(2, 'Footer menu', NULL, 'footer-menu', NULL, '2020-08-31 09:05:13', NULL, NULL),
(3, 'JBN', NULL, 'jbn', NULL, '2020-09-02 22:54:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `m_item_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 if menu is root level or menuid if this is child on any menu',
  `m_item_name` varchar(255) NOT NULL,
  `m_item_url` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 for disabled menu or 1 for enabled menu',
  `m_item_desc` varchar(500) NOT NULL,
  `m_item_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`m_item_id`, `m_id`, `parent_id`, `m_item_name`, `m_item_url`, `status`, `m_item_desc`, `m_item_created_at`) VALUES
(732, 1, 0, 'Gold', '#', '1', '', '2020-10-06 06:14:27'),
(733, 1, 732, 'Men', '', '1', '', '2020-10-06 06:14:27'),
(734, 1, 733, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/gold/men', '1', '', '2020-10-06 06:14:27'),
(735, 1, 733, 'Pendents', 'https://whitethoughtsdemos.com/anaya/products/category/pendents/gold/men', '1', '', '2020-10-06 06:14:27'),
(736, 1, 733, 'Ear rings', 'https://whitethoughtsdemos.com/anaya/products/category/ear-rings/gold/men', '1', '', '2020-10-06 06:14:27'),
(737, 1, 732, 'Women', '', '1', '', '2020-10-06 06:14:27'),
(738, 1, 737, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/gold/women', '1', '', '2020-10-06 06:14:27'),
(739, 1, 737, 'Ear rings', 'https://whitethoughtsdemos.com/anaya/products/category/ear-rings/gold/women', '1', '', '2020-10-06 06:14:27'),
(740, 1, 737, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/gold/women', '1', '', '2020-10-06 06:14:27'),
(741, 1, 737, 'Bangles', 'https://whitethoughtsdemos.com/anaya/products/category/bangles/gold/women', '1', '', '2020-10-06 06:14:27'),
(742, 1, 737, 'Bracelets', 'https://whitethoughtsdemos.com/anaya/products/category/bracelets/gold/women', '1', '', '2020-10-06 06:14:27'),
(743, 1, 0, 'Diamonds', '', '1', '', '2020-10-06 06:14:27'),
(744, 1, 743, 'Men', '', '1', '', '2020-10-06 06:14:27'),
(745, 1, 744, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/diamonds/men', '1', '', '2020-10-06 06:14:27'),
(746, 1, 744, 'Ear rings', 'https://whitethoughtsdemos.com/anaya/products/category/ear-rings/diamonds/men', '1', '', '2020-10-06 06:14:27'),
(747, 1, 744, 'solitairs', 'https://whitethoughtsdemos.com/anaya/products/category/solitairs/diamonds/men', '1', '', '2020-10-06 06:14:27'),
(748, 1, 743, 'Women', '', '1', '', '2020-10-06 06:14:27'),
(749, 1, 748, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/diamonds/women', '1', '', '2020-10-06 06:14:27'),
(750, 1, 748, 'Ear rings', 'https://whitethoughtsdemos.com/anaya/products/category/ear-rings/diamonds/women', '1', '', '2020-10-06 06:14:27'),
(751, 1, 748, 'Solitairs', 'https://whitethoughtsdemos.com/anaya/products/category/solitairs/diamonds/women', '1', '', '2020-10-06 06:14:27'),
(752, 1, 748, 'Pendents', 'https://whitethoughtsdemos.com/anaya/products/category/pendents/diamonds/women', '1', '', '2020-10-06 06:14:27'),
(753, 1, 748, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/diamonds/women', '1', '', '2020-10-06 06:14:27'),
(754, 1, 748, 'Bangles', 'https://whitethoughtsdemos.com/anaya/products/category/bangles/diamonds/women', '1', '', '2020-10-06 06:14:27'),
(755, 1, 748, 'Bracelets', 'https://whitethoughtsdemos.com/anaya/products/category/bracelets/diamonds/women', '1', '', '2020-10-06 06:14:27'),
(756, 3, 0, 'Jbn', '', '1', '', '2020-10-06 06:23:55'),
(757, 3, 756, 'Gold', '', '1', '', '2020-10-06 06:23:55'),
(758, 3, 757, 'Men', '', '1', '', '2020-10-06 06:23:55'),
(759, 3, 758, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/gold/men/jbn', '1', '', '2020-10-06 06:23:55'),
(760, 3, 758, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/gold/men/jbn', '1', '', '2020-10-06 06:23:55'),
(761, 3, 758, 'Bracelets', 'https://whitethoughtsdemos.com/anaya/products/category/bracelets/gold/men/jbn', '1', '', '2020-10-06 06:23:55'),
(762, 3, 757, 'women', '', '1', '', '2020-10-06 06:23:55'),
(763, 3, 762, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/gold/women/jbn', '1', '', '2020-10-06 06:23:55'),
(764, 3, 762, 'Nose Pins', 'https://whitethoughtsdemos.com/anaya/products/category/nose-pins/gold/women/jbn', '1', '', '2020-10-06 06:23:55'),
(765, 3, 762, 'chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/gold/women/jbn', '1', '', '2020-10-06 06:23:55'),
(766, 3, 756, 'Diamonds', '', '1', '', '2020-10-06 06:23:55'),
(767, 3, 766, 'Men', '', '1', '', '2020-10-06 06:23:55'),
(768, 3, 767, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/diamonds/men/jbn', '1', '', '2020-10-06 06:23:55'),
(769, 3, 767, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/diamonds/men/jbn', '1', '', '2020-10-06 06:23:55'),
(770, 3, 767, 'solitairs', 'https://whitethoughtsdemos.com/anaya/products/category/solitairs/diamonds/men/jbn', '1', '', '2020-10-06 06:23:55'),
(771, 3, 766, 'Women', '', '1', '', '2020-10-06 06:23:55'),
(772, 3, 771, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/diamonds/women/jbn', '1', '', '2020-10-06 06:23:55'),
(773, 3, 771, 'Earings', 'https://whitethoughtsdemos.com/anaya/products/category/earings/diamonds/women/jbn', '1', '', '2020-10-06 06:23:55'),
(774, 3, 771, 'bangles', 'https://whitethoughtsdemos.com/anaya/products/category/bangles/diamonds/women/jbn', '1', '', '2020-10-06 06:23:55'),
(775, 3, 771, 'tops', 'https://whitethoughtsdemos.com/anaya/products/category/tops/diamonds/women/jbn', '1', '', '2020-10-06 06:23:55'),
(776, 3, 771, 'pendents', 'https://whitethoughtsdemos.com/anaya/products/category/pendents/diamonds/women/jbn', '1', '', '2020-10-06 06:23:55'),
(777, 3, 771, 'necklaces', 'https://whitethoughtsdemos.com/anaya/products/category/necklaces/diamonds/women/jbn', '1', '', '2020-10-06 06:23:55'),
(778, 3, 771, 'chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/diamonds/women/jbn', '1', '', '2020-10-06 06:23:55'),
(779, 2, 0, 'Blog', 'https://whitethoughtsdemos.com/anaya/blog', '1', '', '2020-10-08 11:39:37'),
(780, 2, 0, 'Contact us', 'https://whitethoughtsdemos.com/anaya/contact_us', '1', '', '2020-10-08 11:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `metal_clar_purity`
--

CREATE TABLE `metal_clar_purity` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `material_type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metal_clar_purity`
--

INSERT INTO `metal_clar_purity` (`id`, `name`, `slug`, `material_type_id`) VALUES
(1, '14', '14', 1),
(2, '18', '18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `metal_color`
--

CREATE TABLE `metal_color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `slug` varchar(100) NOT NULL,
  `material_type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metal_color`
--

INSERT INTO `metal_color` (`id`, `name`, `date`, `slug`, `material_type_id`) VALUES
(1, 'white', '2020-09-03 11:46:37', 'white', 1),
(2, 'Rose', '2020-09-03 11:46:37', 'rose', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `status`, `added_on`) VALUES
(1, 'venkat@deepredink.com', '1', '2020-10-05 11:07:12'),
(2, 'jayaraju@deepredink.com', '1', '2020-10-05 12:45:03'),
(6, 'jayaraju123@gmail.com', '1', '2020-10-06 02:52:16'),
(7, 'jayaraju1234@gmail.com', '1', '2020-10-07 05:35:35');

-- --------------------------------------------------------

--
-- Table structure for table `options_group`
--

CREATE TABLE `options_group` (
  `OptionGroupID` int(11) NOT NULL,
  `OptionGroupName` varchar(50) DEFAULT NULL,
  `Display` enum('Yes','No') NOT NULL,
  `material_type_id` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options_group`
--

INSERT INTO `options_group` (`OptionGroupID`, `OptionGroupName`, `Display`, `material_type_id`, `slug`) VALUES
(1, 'Diamond Color', 'Yes', 4, 'diamond-color'),
(2, 'Metal', 'Yes', 1, 'metal'),
(3, 'Size', 'No', 0, 'size'),
(5, 'Diamond Clarity', 'No', 4, 'diamond-clarity'),
(6, 'Gold Color', 'No', 1, 'gold-color'),
(7, 'Pearls', 'No', 0, 'pearls'),
(8, 'Gemstone', 'No', 0, 'gemstone'),
(9, 'Diamond Shape', 'No', 4, 'diamond-shape'),
(10, 'Diamond Certified', 'No', 4, 'diamond-certified');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderlD` int(11) NOT NULL,
  `UserlD` int(11) NOT NULL,
  `CartID` int(11) NOT NULL,
  `PaymentID` varchar(100) NOT NULL,
  `Order_Number` varchar(100) NOT NULL,
  `CouponID` int(11) NOT NULL,
  `OrderAmount` float NOT NULL,
  `OrderShipName` varchar(100) NOT NULL,
  `OrderPhone` varchar(20) NOT NULL,
  `OrderShipping` tinyint(1) NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmall` varchar(100) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` tinyint(1) NOT NULL,
  `OrderTrackingNumber` varchar(80) NOT NULL,
  `Delivery_Mode` varchar(20) NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `Order_status` enum('placed','confirmed','processing','dispatched','on Hold','delivered','cancelled','cancelled-Refund pending','Cancelled-Refunded') NOT NULL DEFAULT 'placed',
  `billing_Fullname` varchar(100) NOT NULL,
  `billing_Address1` varchar(150) NOT NULL,
  `billing_Address2` varchar(150) NOT NULL,
  `billing_LandMark` varchar(100) NOT NULL,
  `billing_City` varchar(50) NOT NULL,
  `billing_Pincode` varchar(20) NOT NULL,
  `billing_State` varchar(30) NOT NULL,
  `billing_Country` varchar(50) NOT NULL,
  `billing_Mobile` char(20) NOT NULL,
  `shipping_Fullname` varchar(100) NOT NULL,
  `shipping_Address1` varchar(150) NOT NULL,
  `shipping_Address2` varchar(150) NOT NULL,
  `shipping_LandMark` varchar(100) NOT NULL,
  `shipping_City` varchar(50) NOT NULL,
  `shipping_Pincode` varchar(20) NOT NULL,
  `shipping_State` varchar(30) NOT NULL,
  `shipping_Country` varchar(50) NOT NULL,
  `shipping_Mobile` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderlD`, `UserlD`, `CartID`, `PaymentID`, `Order_Number`, `CouponID`, `OrderAmount`, `OrderShipName`, `OrderPhone`, `OrderShipping`, `OrderTax`, `OrderEmall`, `OrderDate`, `OrderShipped`, `OrderTrackingNumber`, `Delivery_Mode`, `DeliveryDate`, `Order_status`, `billing_Fullname`, `billing_Address1`, `billing_Address2`, `billing_LandMark`, `billing_City`, `billing_Pincode`, `billing_State`, `billing_Country`, `billing_Mobile`, `shipping_Fullname`, `shipping_Address1`, `shipping_Address2`, `shipping_LandMark`, `shipping_City`, `shipping_Pincode`, `shipping_State`, `shipping_Country`, `shipping_Mobile`) VALUES
(1, 4, 1, 'pay_Fl0PQ0gFdOlz9P', '20201005054459', 0, 30002, '', '', 0, 0, '', '2020-10-05 00:14:59', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 4, 2, 'pay_Fl0PQ0gFdOlz9P', '20201005061127', 0, 15004, '', '', 0, 0, '', '2020-10-05 00:41:27', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 4, 3, 'pay_Fl2LIJHzn4znMz', '20201005065044', 0, 15004, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2020-10-05 01:20:44', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Venkat', 'Meerpet', '', '', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'Venkat', 'Meerpet', '', '', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535'),
(4, 4, 3, 'pay_Fl2V4MRZAOH8D8', '20201005065044', 0, 15004, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2020-10-05 01:20:44', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Venkat', 'Meerpet', '', '', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'Venkat', 'Meerpet', '', '', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535'),
(5, 4, 1, 'pay_Fl4gaUOwV6MUnh', '20201005075523', 0, 15000, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2020-10-05 02:25:23', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Venkat', 'Meerpet', '', '', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535', 'Venkat', 'Meerpet', '', '', 'Hyderabad', '500097', 'Telangana', 'Indi', '9052691535'),
(6, 5, 6, 'pay_FlIBL4s1IStkQ4', '20201005221031', 0, 15002, 'Venkat Yadav ', '', 0, 0, 'venkatyadav.1986@gmail.com', '2020-10-05 16:40:31', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Test', 'Testing', '', '', 'Hyder', '500034', 'India', 'tela', '9090909099', 'Test', 'Testing', '', '', 'Hyder', '500034', 'India', 'tela', '9090909099'),
(7, 4, 11, 'pay_FlRe1ZmVsY1V5s', '20201006073122', 0, 30020, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2020-10-06 02:01:22', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535'),
(8, 7, 13, 'pay_FlScwA69rsXz2n', '20201006082716', 0, 15002, '', '', 0, 0, '', '2020-10-06 02:57:16', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 7, 15, 'pay_FlSvSRnD58QvIS', '20201006085122', 0, 15002, 'Jayaraju Vangapandu ', '', 0, 0, 'jayarajuv5@gmail.com', '2020-10-06 03:21:22', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319'),
(10, 7, 16, 'pay_FlTSooePGFbzhK', '20201006085304', 0, 15000, '', '', 0, 0, '', '2020-10-06 03:23:04', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(11, 4, 14, 'pay_FlTSsS1oisJKJo', '20201006083246', 0, 15000, '', '', 0, 0, '', '2020-10-06 03:02:46', 0, '', '', '0000-00-00 00:00:00', 'placed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, 4, 19, 'pay_FlTSsS1oisJKJo', '20201006092329', 0, 15002, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2020-10-06 03:53:29', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535', 'Fullname', 'street', 'address info', '', 'city', '518401', 'state', 'coutnry', '9052691535'),
(13, 7, 20, 'pay_FlUavTasGIvfhu', '20201006102939', 0, 15018, 'Jayaraju Vangapandu ', '', 0, 0, 'jayarajuv5@gmail.com', '2020-10-06 04:59:39', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'confirmed', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319'),
(14, 7, 23, 'pay_FlunNrrzw8UilD', '20201007115946', 0, 15018, 'Jayaraju Vangapandu ', '', 0, 0, 'jayarajuv5@gmail.com', '2020-10-07 06:29:46', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319', 'dsafdsaf', 'sdafsdaf', 'sdafsdaf', '', 'fsadfsad', '520004', 'asdfsad', 'asdffads', '9700334319');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_DetailsID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `customized_product_data` text NOT NULL,
  `order_method` varchar(30) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(150) NOT NULL,
  `MRP_Price` float NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductSKU` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT '1',
  `CouponID` int(11) NOT NULL,
  `CouponCode` varchar(50) NOT NULL,
  `Amount` float NOT NULL,
  `MRP_Amount` float NOT NULL,
  `attribute_json_data` text NOT NULL,
  `discounted_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_DetailsID`, `OrderID`, `customized_product_data`, `order_method`, `ProductID`, `ProductName`, `MRP_Price`, `ProductPrice`, `ProductSKU`, `Quantity`, `CouponID`, `CouponCode`, `Amount`, `MRP_Amount`, `attribute_json_data`, `discounted_amount`) VALUES
(1, 1, '', '', 1, 'NVB30', 20000, 15000, 'NVB30', 1, 0, '', 15000, 20000, '', 0),
(2, 1, '', '', 3, 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', 0),
(3, 2, '', '', 5, 'NVL 153', 20004, 15004, 'NVL 153', 1, 0, '', 15004, 20004, '', 0),
(4, 3, '', '', 5, 'NVL 153', 20004, 15004, 'NVL 153', 1, 0, '', 15004, 20004, '', 0),
(5, 4, '', '', 5, 'NVL 153', 20004, 15004, 'NVL 153', 1, 0, '', 15004, 20004, '', 0),
(6, 5, '{\"custom_order_size\":\"Size\",\"custom_order_color\":\"Pick Color\"}', 'customized', 1, 'NVB30', 20000, 15000, 'NVB30', 1, 0, '', 15000, 20000, '', 0),
(7, 6, '{\"custom_order_size\":\".2.\",\"custom_order_color\":\"GH-VVS\"}', 'customized', 3, 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', 0),
(8, 7, '', '', 3, 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', 0),
(9, 7, '', '', 19, 'NVT580', 20018, 15018, 'NVT580', 1, 0, '', 15018, 20018, '', 0),
(10, 8, '', '', 3, 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', 0),
(11, 9, '', '', 3, 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', 0),
(12, 10, '', '', 1, 'NVB30', 20000, 15000, 'NVB30', 1, 0, '', 15000, 20000, '', 0),
(13, 11, '{\"custom_order_size\":\".2.\",\"custom_order_color\":\"EF-VVS\"}', 'customized', 1, 'NVB30', 20000, 15000, 'NVB30', 1, 0, '', 15000, 20000, '', 0),
(14, 12, '{\"custom_order_size\":\".2.\",\"custom_order_color\":\"EF-VVS\"}', 'customized', 3, 'NVB63', 20002, 15002, 'NVB63', 1, 0, '', 15002, 20002, '', 0),
(15, 13, '', '', 19, 'NVT580', 20018, 15018, 'NVT580', 1, 0, '', 15018, 20018, '', 0),
(16, 14, '', '', 19, 'NVT580', 20018, 15018, 'NVT580', 1, 0, '', 15018, 20018, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_gift_messages`
--

CREATE TABLE `order_gift_messages` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `gift_special_message` text,
  `gift_message_packaging` text,
  `gift_email` varchar(150) DEFAULT NULL,
  `gift_for` char(20) DEFAULT NULL,
  `get_for_updates` char(5) DEFAULT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_gift_messages`
--

INSERT INTO `order_gift_messages` (`ID`, `UserID`, `OrderID`, `gift_special_message`, `gift_message_packaging`, `gift_email`, `gift_for`, `get_for_updates`, `Addedon`) VALUES
(1, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 09:16:14'),
(2, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 09:39:17'),
(3, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 09:42:07'),
(4, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 09:42:42'),
(5, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 09:48:49'),
(6, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 09:50:08'),
(7, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 11:02:15'),
(8, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-01 12:13:18'),
(9, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-04 23:28:31'),
(10, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 01:21:32'),
(11, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 01:31:14'),
(12, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 03:39:34'),
(13, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 08:38:37'),
(14, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 08:54:58'),
(15, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 09:16:14'),
(16, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 09:26:29'),
(17, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 09:35:11'),
(18, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 09:35:47'),
(19, 4, 0, 'Test', 'Testing', 'venkat@deepredink.com', 'wife', 'on', '2020-10-05 09:49:03'),
(20, 4, 0, 'Test', 'Testing', '', 'wife', 'on', '2020-10-05 11:01:46'),
(21, 5, 0, 'test', 'Testing', 'test@gmail.com', 'girl_friend', 'on', '2020-10-05 16:51:06'),
(22, 4, 0, 'Test', 'Testing', '', 'wife', 'on', '2020-10-06 02:07:01'),
(23, 4, 0, 'Test', 'Testing', '', 'wife', 'on', '2020-10-06 03:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `keywords` text NOT NULL,
  `featured_image_path` varchar(255) DEFAULT NULL,
  `order_logic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `title`, `slug`, `content`, `keywords`, `featured_image_path`, `order_logic`) VALUES
(1, 'about', 'about', 'about', '<p> </p>\r\n\r\n<p><img alt=\"\" class=\"img-fluid\" src=\"https://www.oakleyjewelers.com/images/banner-img-2.jpg\"></p>\r\n\r\n<p>Anaya was founded in 2010, with the objective to make beautiful jewellery accessible, affordable and forever wearable. After speaking to hundreds of women across the country, we came to find that there was a common dilemma women faced - picking between expensive jewellery for special occasions, and everyday jewellery that was of inferior quality and was not keeping pace with their changing lifestyle. Anaya was founded, to give women access to modern, fine jewellery, that was also wearable everyday.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">\r\n<h4>Our Mission</h4>\r\n\r\n<p>Our mission is to make beautiful jewellery accessible. Jewellery that not only makes a woman look beautiful but also make her feel beautiful and loved.</p>\r\n</div>\r\n\r\n<div class=\"col-sm-6\">\r\n<h4>Our Vission</h4>\r\n\r\n<p>We started our company on three simple premises:</p>\r\n\r\n<ul>\r\n <li>Our style is relentlessly modern, yet intensely respectful of traditions.</li>\r\n <li>We always look for better and newer ways to do things; from the designs that we make to the experiences that we deliver.</li>\r\n <li>We are open in our interactions with our customers. Our prices and policies are always transparent.</li>\r\n</ul>\r\n\r\n<p> </p>\r\n</div>\r\n</div>\r\n\r\n<h4>Our Team</h4>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-4\"><img class=\"img-fluid team-mate\" src=\"https://media.istockphoto.com/photos/indian-man-picture-id178583962?k=6&m=178583962&s=612x612&w=0&h=tBib83dLUIcMeh0LzUj4ujfrFQvPRrYrw2zRI0AUEMk=\">\r\n<h4 class=\"team-mate-text\">Lorem Ipsum</h4>\r\n<p class=\"team-mate-text\">MD</p>\r\n</div>\r\n\r\n<div class=\"col-sm-4\"><img class=\"img-fluid team-mate\" src=\"https://media.istockphoto.com/photos/indian-man-picture-id178583962?k=6&m=178583962&s=612x612&w=0&h=tBib83dLUIcMeh0LzUj4ujfrFQvPRrYrw2zRI0AUEMk=\">\r\n<h4 class=\"team-mate-text\">Lorem Ipsum</h4>\r\n<p class=\"team-mate-text\">MD</p>\r\n</div>\r\n\r\n<div class=\"col-sm-4\"><img class=\"img-fluid team-mate\" src=\"https://media.istockphoto.com/photos/indian-man-picture-id178583962?k=6&m=178583962&s=612x612&w=0&h=tBib83dLUIcMeh0LzUj4ujfrFQvPRrYrw2zRI0AUEMk=\">\r\n<h4 class=\"team-mate-text\">Lorem Ipsum</h4>\r\n<p class=\"team-mate-text\">MD</p>\r\n</div>\r\n</div>', 'About  us Anayajewelry', 'page_images/cropper.jpg', 1),
(2, 'terms and conditions', 'terms and conditions', 'terms-and-conditions', '<p> </p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-5\">\r\n<h4>Terms of Use</h4>\r\nPlease read these terms of use carefully before using this website. If you do not agree to this Terms of Use you may not use this Website. By using this Website, you signify your explicit assent to this Terms of Use as well as the Website&#39;s Privacy Policy (which is hereby incorporated by reference herein). These Terms of Use sets out the legally binding terms of services available on the Website as well as at the terms of use of this Website. These Terms of Use along with the Privacy Policy extends to both users, who visit the Website but do not transact business on the Website (\"Users / Guests\") as well as users who are registered with by the Website to transact business on the Website (\"Members\"). The Company reserves the right to modify or terminate any portion of the Website or the Services offered by the Company for any reason, without notice and without liability to you or any third party. You are responsible for regularly reviewing these Terms of Use so that you will be apprised of changes, if any. Nothing in these Terms of Use should be construed to confer any rights to third party beneficiaries.</div>\r\n<div class=\"col-sm-2\"></div>\r\n<div class=\"col-sm-5\">\r\n<h4>Our Promise</h4>\r\nThis Website provides access to trading, pricing, news and other information services related to diamonds, precious gems and jewellery. Certain Services available on this Website are for the use of Members only. Please note that some of the terms under these Terms of Use, differ for purchases for personal consumption and for investment purposes. This Website offers services for Members who wish to purchase diamonds / jewellery for personal consumption, inclusive of, customized and readymade Jewellery. The Website also offers services to sell diamonds for investment. The Website displays diamonds and gemstones that are specifically recommended for the purpose of investment. The Website will also feature the recommendations of a trained diamond consultant, circulate a list of investment grade diamonds and recommend good buys. Recommendations of the consultant are not guaranteed under any circumstances and the Company shall not be held liable for any loss and / or damage suffered by Members who rely on such recommendation. Some items may appear slightly larger or smaller than actual size due to screen defaults and photography techniques. Sometimes the items may be represented larger than the actual size in order to clearly show details or smaller than the actual size in order to show the entire item. The Company shall not be liable for any legal action on this account.</div>\r\n</div>\r\n\r\n<p> </p>', 'terms and conditions', '', 2),
(3, 'privacy policy', 'our privacy policy', 'privacy-policy', '<h4> </h4>\r\n\r\n<p>Welcome to anaya.jewelry. This section pertains to the Privacy Policy of the website and native mobile applications. We would like to inform that our privacy policy is subject to change without intimation and you shall be required to review the same regularly.</p>\r\n\r\n<p>The protection and security of your personal information is one of anaya.jewelry&#39;s top priorities. This Privacy Policy discloses anaya.jewelry&#39;s practice with respect to the information collected from the users of the Website or native mobile applications. Luxury Online Retail India Private Limited is authorized to use the website - anaya.jewelry and native mobile applications for commercial purposes by virtue of a Platform License Agreement.</p>\r\n\r\n<p>By using the Website or native mobile applications you agree to accept the terms of this Privacy Policy as well as the Website and native mobile applications&#39;s Terms of Use. By accessing or using the Website and native mobile applications you expressly consent to our use and disclosure of your personal information in any manner described in this Privacy Policy. This Privacy Policy extends to both, users who visit the Website or native mobile applications but do not transact business on the Website or native mobile applications as well as users who are registered on the Website or native mobile applications. \"Personal Information\" refers to any information that identifies or can be used to identify, contact or locate the person, to whom such information pertains including, but not limited to, name, address, phone number, fax number, email address, financial profiles, identification number, credit card information etc.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">\r\n<h4><strong>Personal information collected </strong></h4>\r\nBy accepting this privacy policy<strong>, </strong>you authorize anaya.jewelry to collect, store and use any information that you provide on our Website or native mobile applications. The information collected by us are: All information entered by you on our website and native mobile applications such as your name, address, contact number, email ID , chat history , and such other information sent by you via emails to our email ID. Information collected by means of cookies that are installed on your hard drive. Information collected by means of cookies that are installed on your hard drive. Information such as the IP Address of your computer, the server from which you are accessing our website and native mobile applications, details of web browser and operating system used to access our website or native mobile applications, date, time and place of accessing of our website and native mobile applications etc.,</div>\r\n\r\n<div class=\"col-sm-6\">\r\n<h4><strong>Cookies</strong></h4>\r\n\r\n<p>Cookies are small pieces of information saved by your browser onto your computer. Cookies are used to record various aspects of your visit and assist anaya.jewelry to provide you with uninterrupted service. anaya.jewelry does not use cookies to save Personal Information for outside uses. We have implemented Google Analytics features based on Display Advertising ( Google Display Network Impression Reporting, the DoubleClick Campaign Manager integration, and Google Analytics Demographics and Interest Reporting). Visitors can opt-out of Google Analytics for Display Advertising and customize Google Display Network ads using the Ads Settings. We, along with third-party vendors, including Google, use first-party cookies (such as the Google Analytics cookies) and third-party cookies (such as the DoubleClick cookie) together to report how our ad impressions, other uses of ad services, and interactions with these ad impressions and ad services are related to visits to our site. No use or Services available on the Website and native mobile applications are directed towards children. anaya.jewelry does not knowingly collect Personal Information from children or sell of its products to children.</p>\r\n\r\n<p> </p>\r\n</div>\r\n\r\n<p>BY USING THE WEBSITE OR NATIVE MOBILE APPLICATIONS, YOU SIGNIFY YOUR AGREEMENT TO THE TERMS OF THIS PRIVACY POLICY, ANAYA.JEWELRY RESERVES THE RIGHT, IN OUR SOLE DISCRETION, TO CHANGE, MODIFY, ADD OR DELETE PORTIONS OF THE TERMS OF THIS PRIVACY POLICY AT ANY TIME.</p>\r\n\r\n<p>If you have any questions about this Privacy Policy, please feel free to [Contact Us] through our Website or native mobile applications or write to us at contactus@anaya.jewelry.</p>\r\n</div>', 'Privacy Policy', '', 0),
(4, 'Disclaimer', 'Disclaimer', 'disclaimer', '<p> </p>\r\n\r\n<p>Every shipment comes with a Anaya bill within the parcel, please remember to read the terms and conditions printed on the back of the bill.</p>\r\n\r\n<p>The information contained in this website is for general information purposes only. The information is provided by [business name] and while we endeavor to keep the information up to date and correct, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability or availability with respect to the website or the information, products, services, or related graphics contained on the website for any purpose. Any reliance you place on such information is therefore strictly at your own risk.</p>\r\n\r\n<p>In no event will we be liable for any loss or damage including without limitation, indirect or consequential loss or damage, or any loss or damage whatsoever arising from loss of data or profits arising out of, or in connection with, the use of this website.</p>\r\n\r\n<p>Through this website you are able to link to other websites which are not under the control of Anaya. We have no control over the nature, content and availability of those sites. The inclusion of any links does not necessarily imply a recommendation or endorse the views expressed within them.</p>\r\n\r\n<p>Every effort is made to keep the website up and running smoothly. However, Anaya takes no responsibility for, and will not be liable for, the website being temporarily unavailable due to technical issues beyond our control.</p>\r\n\r\n<p>All orders are subject to Custom duty and customers may/may not be charged by the government/department of customs of the respective country to which parcel is being delivered. these duties do not come under the jurisdiction of anaya.jewelry and will be borne/paid by the customer.</p>', 'disclaimer', '', 0),
(5, 'Refund Policy', 'Refund Policy', 'refund-policy', '<p> </p>\r\n\r\n<h4>Refund:</h4>\r\n\r\n<p>The customer will require the bill and the product to be returned along with the price tag. </p>\r\n\r\n<ul>\r\n <li>Customised Jewellery (including personalised/ engraved products) is not eligible for a 15 Day Money-Back or a 15 Day Exchange. Lifetime Exchange and Buyback are applicable.</li>\r\n <li>Once your returned item is received, our Quality Assurance Department will review it.</li>\r\n <li>Any item that shows sign of wear or has been altered, resized (by a jeweller other than the company) or damaged cannot be accepted for 15 Day Money-Back.</li>\r\n <li>The product should be accompanied by the original product certificate and the original/ copy of the invoice for all exchange within the 15 Day Money-Back period.</li>\r\n <li>In case the customer cannot produce the original certificate, the company will send the solitaire/ jewellery to the lab for recertification, the shipping and certification cost of which shall be borne by the customer.</li>\r\n <li>The Money-Back amount will be 100% of the actual amount paid. In case, any coupon, discount or promo codes were used during the original purchase, the exchange amount will be reduced by an amount equivalent to the coupon, discount or promo codes, as applicable.</li>\r\n <li>In case, any coupon, discount or promo codes were used during the original purchase, the BuyBack / Exchange amount will be reduced by an amount equivalent to the coupon, discount or promo codes, as applicable.</li>\r\n <li>If the discount was on making charges, the discount will not be deducted while arriving at the Lifetime Exchange (LTE) value.</li>\r\n <li>If the discount was on the gold value or diamond value then the entire discount will be deducted while arriving at the LTE value.</li>\r\n <li>If the discount was on MRP then 70% of the discount will be deducted while arriving at the final LTE value.</li>\r\n <li>In case of a refund on 15 Day Money-Back, payment of the refund amount shall be done via online bank transfer to the customer&#39;s bank account within 10 days of receipt of the product. If the mode of the payment was through online debit/ credit card/ net banking, the refund will be processed by reversal of the transaction.</li>\r\n <li>In case the exchange value is higher than the value of the old product, the customer will have to pay the difference.</li>\r\n <li>In case the exchanged value is lesser than the value of the old product, the difference will be refunded in case of a 15 Day exchange, but if it’s a Lifetime Exchange then the difference will be held as a credit for future purchase.</li>\r\n <li>The prevailing market value will be determined by the company.</li>\r\n <li>This feature is not available for international orders (orders that will be shipped abroad from India).</li>\r\n <li>CaratLane reserves the right to change the terms and conditions for specific customers. In such a situation, the customer will always be informed of the decision prior to the purchase.</li>\r\n <li>15 Day Money-Back is not applicable on a product purchased in exchange of gold coins (15 day exchange at 100% of the invoice value is still applicable).</li>\r\n <li>Lifetime Exchange and Buyback values are calculated excluding the making charges and taxes.</li>\r\n <li>Any new product purchased against LTE value or Old Gold Exchange Credit will be eligible for 100% exchange (15 days), LTE and Buyback but not eligible for 15 day money-back.</li>\r\n <li>Additional 10% will be deducted from the LTE value if the customer does not have the Invoice.</li>\r\n <li>You can exchange your design within 15 days for the full value only once. If you wish to exchange the design the second time, it will be considered as a Lifetime Exchange.</li>\r\n <li>15 Day Money-Back is not applicable on orders that have been exchanged earlier under the 15 Day Exchange Policy.</li>\r\n</ul>\r\n\r\n<p> </p>\r\n\r\n<h4>Resizing & Repairs:</h4>\r\n\r\n<ul>\r\n <li>If you want to resize your ring, the company will resize it free of cost except in certain cases where the resizing is not possible.</li>\r\n <li>If the resized ring costs more than the existing ring, the incremental cost shall be borne by the customer.</li>\r\n <li>If the resized ring costs less than the existing ring, the differential amount shall be refunded to the customer.</li>\r\n <li>In case of a refund, the payment of the same shall be made by way of an online bank transfer within 10 days of dispatch of the resized product.</li>\r\n <li>If for some reasons, your product needs to be repaired, the company shall repair / replace the product for charges which would be determined by the company on a case to case basis.</li>\r\n <li>Shipping charges under Repairs & Resizing policy shall be borne by the customer.</li>\r\n <li>This feature is not available for international orders (orders that will be shipped abroad from India).</li>\r\n</ul>', 'Refund Policy', '', 0),
(6, 'Shipping and Delivery Policy', 'Shipping and Delivery Policy', 'shipping-and-delivery-policy', '<p> </p>\r\n\r\n<p>We offer FREE shipping on every order only within India. Your order will be shipped to you fully insured. We urge all customers to inspect the package for any damage or tamper before receiving or signing for receipt.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our Indian customers, after your item has been packaged, it will be shipped and delivered free via one of the following carriers.</div>\r\n\r\n<div class=\"col-sm-6 shipping-products\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/b0749d0d9b944e2cb5a90394c9263d4b.png\"></div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our International customers, after your item has been packaged, it will be shipped and delivered via the following carrier. The shipping charges for our international customers are charged at the time of order booking.</div>\r\n\r\n<div class=\"col-sm-6 shipping-products\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/a1e46a88e47b41a0be37d3f609ea1805.png\"></div>\r\n</div>\r\n<br>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'Shipping and delivery', '', 0),
(7, 'How it Works', 'How it works', 'how-it-works', '<p> </p>\r\n\r\n<h3><strong>Navigation:</strong></h3>\r\n\r\n<p>All the product Categories and Sub-categories as listed in the header on top. Choose the Categories or the sub-categories by clicking on them and all the products listed under those categories will be shown.</p>\r\n\r\n<p>The topmost navigation bar shows the number of products in your Cart, along with Wishlist and Login links.</p>\r\n\r\n<p>Click on the Login button to login or register on our website. After loging-in, the same button holds the links to your Account and Orders. Use these links to view and update your account details, change password, track/cancel orders etc.  </p>\r\n\r\n<p>You can return to the homepage anytime the clicking on the \"Anaya Logo\" in the header or by clicking on the \"home\" link.</p>\r\n\r\n<p>A lot of useful links have also been provided in the footer, including our helpline number and email.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Exploring Products:</strong></h3>\r\n\r\n<p>Click on your preferred category/sub-category link in the header to view products listed under them. You can also click on the \"Collections\" link in the header to explore the store and look at latest deals and new-arrivals.</p>\r\n\r\n<p>Clicking on individual product will take you to the product page, where you can get all the information about the product, like its price, discount, description, attributes, photographs etc.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Adding Products to your Cart:</strong></h3>\r\n\r\n<p>While on the product page, choose one of the available sizes(s,m,l,xl,xxl) and the desired quantity and click on the \"Add to Cart\" button to add that product to your virtual cart.</p>\r\n\r\n<p>A notification box will flash, confirming your product has been added to your cart and the number of products in your cart will get updated, which can be noticed in the header.</p>\r\n\r\n<p>You can review the items in your cart anytime, by clicking on the cart symbol in the top-most part of the header. The cart page will show you the list of products in your cart and their cost information.</p>\r\n\r\n<p>If you wish to increase or descrease the quantity of a product in your cart, simply edit the number in the column against that product and your cart will be updated automatically.</p>\r\n\r\n<p>You can remove a product from your cart, by simply clicking the X symbol in the last column against that product and it will be removed from your cart.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Wishlist:</strong></h3>\r\n\r\n<p>You can also click on the \"Add to wishlist\" button instead of \"Add to cart\", if you decide to make the purchase at a later date. Your wishlist will be saved in our system and you can access the list anytime by clicking on the \"heart\" symbol in the header.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Online Payment Process:</strong></h3>\r\n\r\n<p>Online payment options like credit-card, debit-card, VISA, Netbanking etc. are available in our payment gateway.</p>\r\n\r\n<p>PayPal option is available for international payments.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Cash on Delivery:</strong></h3>\r\n\r\n<p>In select cities, we offer the option of paying Cash on Delivery. Simply choose the \"Cash on Delivery\" option as your payment mode(if it is available in your city), and submit your order and you can pay for your order only after it arrives at your doorstep.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Tracking Your Orders:</strong></h3>\r\n\r\n<p>Once your order is dispatched, you can login to you account and track your package&#39;s location and the estimated time of arrival, almost in realtime. </p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Grievances and Feedback:</strong></h3>\r\n\r\n<p>You can email us your concerns, complaints and grievances to: <a href=\"mailto:eshop@taruni.in\">eshop@a</a>nayajwelley.com or Call us at: <strong>+91 9999999999</strong></p>\r\n\r\n<p> </p>', 'Anaya how its work', '', 0),
(12, 'Insurance policy', 'insurance', 'insurance-policy', '<p> </p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'insurance', '', 0),
(13, 'test', 'test', 'test', '<p>test</p>', 'test', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `ID` int(11) NOT NULL,
  `PaymentID` varchar(100) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Order_Number` varchar(100) NOT NULL,
  `CartID` int(11) NOT NULL,
  `captured` char(3) NOT NULL,
  `created_at` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `emailid` varchar(150) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `amount` float NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currency` varchar(20) NOT NULL,
  `TransactionID` varchar(100) NOT NULL,
  `PaymentStatus` char(20) DEFAULT NULL,
  `Payment_method` enum('COD','Credit Card','Debit','Netbanking','APIS') DEFAULT NULL,
  `IP` varchar(20) NOT NULL,
  `BankRefNumber` varchar(50) NOT NULL,
  `JsonData` text NOT NULL,
  `entity` varchar(20) NOT NULL,
  `invoice_number` varchar(30) NOT NULL,
  `code_execute_dt` datetime NOT NULL,
  `card_id` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `success` enum('true','false') NOT NULL,
  `merchant_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`ID`, `PaymentID`, `UserID`, `Order_ID`, `Order_Number`, `CartID`, `captured`, `created_at`, `fullname`, `emailid`, `contact_number`, `amount`, `payment_date`, `currency`, `TransactionID`, `PaymentStatus`, `Payment_method`, `IP`, `BankRefNumber`, `JsonData`, `entity`, `invoice_number`, `code_execute_dt`, `card_id`, `description`, `success`, `merchant_total`) VALUES
(1, 'pay_FjJMDOw503cofk', 7, 0, '0', 0, '1', 1601484175, 'Jayaraju Vangapandu ', 'jayarajuv5@gmail.com', '+919700334319', 15000, '2020-09-30 04:43:01', 'INR', '1601484096', 'captured', '', '::1', '0', '{\"id\":\"pay_FjJMDOw503cofk\",\"entity\":\"payment\",\"amount\":1500000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Purchase Order # 63\",\"card_id\":\"card_FjJMDT10uynbS4\",\"card\":{\"id\":\"card_FjJMDT10uynbS4\",\"entity\":\"card\",\"name\":\"Jayaraju Vangapandu \",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\"},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"jayarajuv5@gmail.com\",\"contact\":\"+919700334319\",\"notes\":{\"soolegal_order_id\":\"63\"},\"fee\":35400,\"tax\":5400,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"156150\"},\"created_at\":1601484175}', 'payment', '0', '2020-09-30 10:13:01', '', 'Purchase Order # 63', 'true', 15000),
(2, 'pay_FjTFTB9JfmeADe', 7, 0, '0', 5, '1', 1601519008, 'Jayaraju Vangapandu ', 'jayarajuv5@gmail.com', '+919700334319', 15000, '2020-10-01 02:23:34', 'INR', '1601518980', 'captured', '', '::1', '0', '{\"id\":\"pay_FjTFTB9JfmeADe\",\"entity\":\"payment\",\"amount\":1500000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Purchase Order # 63\",\"card_id\":\"card_FjJMDT10uynbS4\",\"card\":{\"id\":\"card_FjJMDT10uynbS4\",\"entity\":\"card\",\"name\":\"Jayaraju Vangapandu \",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\"},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"jayarajuv5@gmail.com\",\"contact\":\"+919700334319\",\"notes\":{\"soolegal_order_id\":\"63\"},\"fee\":35400,\"tax\":5400,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"848370\"},\"created_at\":1601519008}', 'payment', '0', '2020-10-01 07:53:34', '', 'Purchase Order # 63', 'true', 15000),
(3, 'pay_FjYdDCFeUOQ1qL', 4, 5, '20201001125002', 6, '1', 1601537965, 'Venkat Yadav ', 'venkat@deepredink.com', '+919704842889', 15000, '2020-09-30 19:39:25', 'INR', '1601537938', 'captured', '', '::1', '0', '{\"id\":\"pay_FjYdDCFeUOQ1qL\",\"entity\":\"payment\",\"amount\":1500000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Purchase Order # 20201001125002\",\"card_id\":\"card_FjYdDFnqPivoiE\",\"card\":{\"id\":\"card_FjYdDFnqPivoiE\",\"entity\":\"card\",\"name\":\"Chintan D Parikh\",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\"},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"venkat@deepredink.com\",\"contact\":\"+919704842889\",\"notes\":{\"soolegal_order_id\":\"20201001125002\"},\"fee\":35400,\"tax\":5400,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"440047\"},\"created_at\":1601537965}', 'payment', '0', '2020-10-01 01:09:25', '', 'Purchase Order # 20201001125002', 'true', 15000),
(4, 'pay_FjYg3QCoecrDBq', 4, 5, '20201001125002', 6, '1', 1601538126, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 15000, '2020-09-30 19:42:11', 'INR', '1601538104', 'captured', '', '::1', '0', '{\"id\":\"pay_FjYg3QCoecrDBq\",\"entity\":\"payment\",\"amount\":1500000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Purchase Order # 20201001125002\",\"card_id\":\"card_FjYg3UIJrDaDVJ\",\"card\":{\"id\":\"card_FjYg3UIJrDaDVJ\",\"entity\":\"card\",\"name\":\"Chintan D Parikh\",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\"},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"hfgh@hgfg.bjh\",\"contact\":\"+919704842889\",\"notes\":{\"soolegal_order_id\":\"20201001125002\"},\"fee\":35400,\"tax\":5400,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"200261\"},\"created_at\":1601538126}', 'payment', '0', '2020-10-01 01:12:11', '', 'Purchase Order # 20201001125002', 'true', 15000),
(5, 'pay_FjYl4kDq3mEn9H', 4, 5, '20201001125002', 6, '1', 1601538411, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 15000, '2020-09-30 19:46:55', 'INR', '1601538381', 'captured', '', '::1', '0', '{\"id\":\"pay_FjYl4kDq3mEn9H\",\"entity\":\"payment\",\"amount\":1500000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Purchase Order # 20201001125002\",\"card_id\":\"card_FjYl4oJkDGvSpL\",\"card\":{\"id\":\"card_FjYl4oJkDGvSpL\",\"entity\":\"card\",\"name\":\"Chintan D Parikh\",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\"},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"hfgh@hgfg.bjh\",\"contact\":\"+919704842889\",\"notes\":{\"soolegal_order_id\":\"20201001125002\"},\"fee\":35400,\"tax\":5400,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"644379\"},\"created_at\":1601538411}', 'payment', '0', '2020-10-01 01:16:55', '', 'Purchase Order # 20201001125002', 'true', 15000),
(6, 'cod_CvYULNgqXB', 4, 0, '', 0, '1', 1601501736, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:35:36', 'INR', '1601544909', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjabsgTX2sTZF0\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601544909\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:05:36', '', '', 'true', 30002),
(7, 'cod_oJN5s4Sbhf', 4, 0, '', 0, '1', 1601501875, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:37:55', 'INR', '1601544909', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjabsgTX2sTZF0\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601544909\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:07:55', '', '', 'true', 30002),
(8, 'cod_AO9LCbYqih', 4, 0, '', 0, '1', 1601501931, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:38:51', 'INR', '1601544909', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjabsgTX2sTZF0\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601544909\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:08:51', '', '', 'true', 30002),
(9, 'cod_13SjsHART5', 4, 0, '', 0, '1', 1601501976, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:39:36', 'INR', '1601545161', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_Fjag9CBYClbuNo\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601545161\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:09:36', '', '', 'true', 30002),
(10, 'cod_EICnPhezGF', 4, 0, '', 0, '1', 1601502150, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:42:30', 'INR', '1601545331', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjajDNmg4Erf7J\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601545331\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:12:30', '', '', 'true', 30002),
(11, 'cod_JoHvsua4Rf', 4, 0, '', 0, '1', 1601502259, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:44:19', 'INR', '1601545366', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_Fjal84SlIJeSQq\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601545366\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:14:19', '', '', 'true', 30002),
(12, 'cod_QGHeq9Z7W4', 4, 0, '', 0, '1', 1601502285, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:44:45', 'INR', '1601545473', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjalaoM0YjLzb0\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601545473\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:14:45', '', '', 'true', 30002),
(13, 'cod_VmQdhNLZls', 4, 0, '', 0, '1', 1601502562, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:49:22', 'INR', '1601545735', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjaqFY16INSXnJ\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601545735\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:19:22', '', '', 'true', 30002),
(14, 'cod_fgv0seBo5F', 4, 0, '', 0, '1', 1601502639, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 21:50:39', 'INR', '1601545812', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjarooZvcjBUHC\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601545812\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 03:20:39', '', '', 'true', 30002),
(15, 'pay_FjawNPFR05IXQ9', 5, 1, '20201001152357', 3, '1', 1601546097, 'Venkat Yadav ', 'test@gmail.com', '+919090909099', 15000, '2020-09-30 21:54:58', 'INR', '1601546075', 'captured', '', '::1', '0', '{\"id\":\"pay_FjawNPFR05IXQ9\",\"entity\":\"payment\",\"amount\":1500000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Purchase Order # 20201001152357\",\"card_id\":\"card_Fcs7qae7mpSZEl\",\"card\":{\"id\":\"card_Fcs7qae7mpSZEl\",\"entity\":\"card\",\"name\":\"test\",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\"},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"test@gmail.com\",\"contact\":\"+919090909099\",\"notes\":{\"soolegal_order_id\":\"20201001152357\"},\"fee\":35400,\"tax\":5400,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"716832\"},\"created_at\":1601546097}', 'payment', '0', '2020-10-01 03:24:58', '', 'Purchase Order # 20201001152357', 'true', 15000),
(16, 'cod_UaXmK46hWO', 4, 0, '', 0, '1', 1601506955, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 23:02:35', 'INR', '1601550139', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_Fjc5nW4N5Sf7PV\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601550139\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 04:32:35', '', '', 'true', 30002),
(17, 'cod_zA7qEvaGJ3', 4, 0, '', 0, '1', 1601507436, 'Venkat Yadav ', 'venkat@deepredink.com', '9052691535', 30002, '2020-09-30 23:10:36', 'INR', '1601550618', 'Order Confirmed', 'COD', '::1', '0', '{\"razorpay_payment_id\":\"pay_FjcEH7NAFDt0lA\",\"merchant_order_id\":\"\",\"merchant_trans_id\":\"1601550618\",\"merchant_product_info_id\":\"testing\",\"merchant_surl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/success\",\"merchant_furl_id\":\"http:\\/\\/localhost\\/anaya\\/razorpay\\/failed\",\"card_holder_name_id\":\"Venkat Yadav \",\"merchant_total\":\"30002\",\"merchant_amount\":\"3000200\"}', 'cod payment', '0', '2020-10-01 04:40:36', '', '', 'true', 30002),
(18, 'pay_FjdK9s6SHkEAxZ', 4, 2, '20201001174155', 3, '1', 1601554491, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 60009, '2020-10-01 00:14:53', 'INR', '1601554402', 'captured', '', '::1', '0', '{\"id\":\"pay_FjdK9s6SHkEAxZ\",\"entity\":\"payment\",\"amount\":6000900,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"card\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Purchase Order # 20201001174155\",\"card_id\":\"card_FjdK9wCmfMmtsp\",\"card\":{\"id\":\"card_FjdK9wCmfMmtsp\",\"entity\":\"card\",\"name\":\"Chintan D Parikh\",\"last4\":\"1111\",\"network\":\"Visa\",\"type\":\"debit\",\"issuer\":null,\"international\":false,\"emi\":false,\"sub_type\":\"consumer\"},\"bank\":null,\"wallet\":null,\"vpa\":null,\"email\":\"hfgh@hgfg.bjh\",\"contact\":\"+919704842889\",\"notes\":{\"soolegal_order_id\":\"20201001174155\"},\"fee\":141622,\"tax\":21604,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"auth_code\":\"868875\"},\"created_at\":1601554491}', 'payment', '0', '2020-10-01 05:44:53', '', 'Purchase Order # 20201001174155', 'true', 60009),
(19, 'pay_Fl0PQ0gFdOlz9P', 4, 24, '20201005045811', 5, '0', 1601854127, '', 'hfgh@hgfg.bjh', '+919704842889', 75013, '2020-10-05 00:01:00', 'INR', '', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl0PQ0gFdOlz9P\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.340145,\"namelookup_time\":0.074083,\"connect_time\":0.099008,\"pretransfer_time\":0.175251,\"size_upload\":0,\"size_download\":632,\"speed_download\":1858,\"speed_upload\":0,\"download_content_length\":632,\"upload_content_length\":-1,\"starttransfer_time\":0.3401,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"3.7.120.158\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":50175,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":175004,\"connect_time_us\":99008,\"namelookup_time_us\":74083,\"pretransfer_time_us\":175251,\"redirect_time_us\":0,\"starttransfer_time_us\":340100,\"total_time_us\":340145,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl0PQ0gFdOlz9P\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":7501300,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005045811\\\",\\\"card_id\\\":\\\"card_Fl0PQ40rdIDEUS\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"hfgh@hgfg.bjh\\\",\\\"contact\\\":\\\"+919704842889\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005045811\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"359632\\\"},\\\"created_at\\\":1601854127}\"}', 'payment', '0', '2020-10-05 05:31:00', '', 'Purchase Order # 20201005045811', 'true', 75013),
(20, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:22:18', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.327499,\"namelookup_time\":0.048523,\"connect_time\":0.068551,\"pretransfer_time\":0.154734,\"size_upload\":0,\"size_download\":640,\"speed_download\":1957,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.327457,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.115.122\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53411,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":154570,\"connect_time_us\":68551,\"namelookup_time_us\":48523,\"pretransfer_time_us\":154734,\"redirect_time_us\":0,\"starttransfer_time_us\":327457,\"total_time_us\":327499,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:52:18', '', 'Purchase Order # 20201005065044', 'true', 15004),
(21, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:25:40', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.290022,\"namelookup_time\":0.070581,\"connect_time\":0.087583,\"pretransfer_time\":0.148806,\"size_upload\":0,\"size_download\":640,\"speed_download\":2206,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.289973,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.218.159\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53447,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":148641,\"connect_time_us\":87583,\"namelookup_time_us\":70581,\"pretransfer_time_us\":148806,\"redirect_time_us\":0,\"starttransfer_time_us\":289973,\"total_time_us\":290022,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:55:40', '', 'Purchase Order # 20201005065044', 'true', 15004),
(22, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:26:23', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.237674,\"namelookup_time\":0.050086,\"connect_time\":0.067474,\"pretransfer_time\":0.124097,\"size_upload\":0,\"size_download\":640,\"speed_download\":2700,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.237642,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.115.122\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53456,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":123944,\"connect_time_us\":67474,\"namelookup_time_us\":50086,\"pretransfer_time_us\":124097,\"redirect_time_us\":0,\"starttransfer_time_us\":237642,\"total_time_us\":237674,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:56:23', '', 'Purchase Order # 20201005065044', 'true', 15004),
(23, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:26:26', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.250379,\"namelookup_time\":0.044616,\"connect_time\":0.064562,\"pretransfer_time\":0.133401,\"size_upload\":0,\"size_download\":640,\"speed_download\":2560,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.250332,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.218.159\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53460,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":133122,\"connect_time_us\":64562,\"namelookup_time_us\":44616,\"pretransfer_time_us\":133401,\"redirect_time_us\":0,\"starttransfer_time_us\":250332,\"total_time_us\":250379,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:56:26', '', 'Purchase Order # 20201005065044', 'true', 15004),
(24, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:27:00', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.295257,\"namelookup_time\":0.048538,\"connect_time\":0.072509,\"pretransfer_time\":0.1526,\"size_upload\":0,\"size_download\":640,\"speed_download\":2169,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.295227,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.218.159\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53473,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":152352,\"connect_time_us\":72509,\"namelookup_time_us\":48538,\"pretransfer_time_us\":152600,\"redirect_time_us\":0,\"starttransfer_time_us\":295227,\"total_time_us\":295257,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:57:00', '', 'Purchase Order # 20201005065044', 'true', 15004),
(25, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:27:02', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.275274,\"namelookup_time\":0.003022,\"connect_time\":0.026277,\"pretransfer_time\":0.113247,\"size_upload\":0,\"size_download\":640,\"speed_download\":2327,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.275245,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.218.159\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53477,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":113042,\"connect_time_us\":26277,\"namelookup_time_us\":3022,\"pretransfer_time_us\":113247,\"redirect_time_us\":0,\"starttransfer_time_us\":275245,\"total_time_us\":275274,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:57:02', '', 'Purchase Order # 20201005065044', 'true', 15004),
(26, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:27:19', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.266973,\"namelookup_time\":0.041069,\"connect_time\":0.064616,\"pretransfer_time\":0.144595,\"size_upload\":0,\"size_download\":640,\"speed_download\":2406,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.266941,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.218.159\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53482,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":144442,\"connect_time_us\":64616,\"namelookup_time_us\":41069,\"pretransfer_time_us\":144595,\"redirect_time_us\":0,\"starttransfer_time_us\":266941,\"total_time_us\":266973,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:57:19', '', 'Purchase Order # 20201005065044', 'true', 15004),
(27, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:27:21', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.224962,\"namelookup_time\":0.004152,\"connect_time\":0.028562,\"pretransfer_time\":0.106926,\"size_upload\":0,\"size_download\":640,\"speed_download\":2857,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.224931,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.218.159\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53487,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":106689,\"connect_time_us\":28562,\"namelookup_time_us\":4152,\"pretransfer_time_us\":106926,\"redirect_time_us\":0,\"starttransfer_time_us\":224931,\"total_time_us\":224962,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:57:21', '', 'Purchase Order # 20201005065044', 'true', 15004),
(28, 'pay_Fl2LIJHzn4znMz', 4, 0, '20201005065044', 3, '0', 1601860936, 'Venkat Yadav ', 'venkat@deepredink.com', '+919052691535', 15004, '2020-10-05 01:29:54', 'INR', '1601860896', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2LIJHzn4znMz\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.266982,\"namelookup_time\":0.034163,\"connect_time\":0.058442,\"pretransfer_time\":0.136346,\"size_upload\":0,\"size_download\":640,\"speed_download\":2406,\"speed_upload\":0,\"download_content_length\":640,\"upload_content_length\":-1,\"starttransfer_time\":0.266951,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.126.198.111\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53505,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":136169,\"connect_time_us\":58442,\"namelookup_time_us\":34163,\"pretransfer_time_us\":136346,\"redirect_time_us\":0,\"starttransfer_time_us\":266951,\"total_time_us\":266982,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2LIJHzn4znMz\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fcs7qae7mpSZEl\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"venkat@deepredink.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"745335\\\"},\\\"created_at\\\":1601860936}\"}', 'payment', '0', '2020-10-05 06:59:54', '', 'Purchase Order # 20201005065044', 'true', 15004),
(29, 'pay_Fl2V4MRZAOH8D8', 4, 0, '20201005065044', 3, '0', 1601861491, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 15004, '2020-10-05 01:31:33', 'INR', '1601861478', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl2V4MRZAOH8D8\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.323584,\"namelookup_time\":0.045023,\"connect_time\":0.068013,\"pretransfer_time\":0.156857,\"size_upload\":0,\"size_download\":632,\"speed_download\":1956,\"speed_upload\":0,\"download_content_length\":632,\"upload_content_length\":-1,\"starttransfer_time\":0.323541,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.234.89.177\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":53544,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":156549,\"connect_time_us\":68013,\"namelookup_time_us\":45023,\"pretransfer_time_us\":156857,\"redirect_time_us\":0,\"starttransfer_time_us\":323541,\"total_time_us\":323584,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl2V4MRZAOH8D8\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500400,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005065044\\\",\\\"card_id\\\":\\\"card_Fl2V4R5qB4GSk2\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"hfgh@hgfg.bjh\\\",\\\"contact\\\":\\\"+919704842889\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005065044\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"827013\\\"},\\\"created_at\\\":1601861491}\"}', 'payment', '0', '2020-10-05 07:01:33', '', 'Purchase Order # 20201005065044', 'true', 15004),
(30, 'pay_Fl4gaUOwV6MUnh', 4, 0, '20201005075523', 1, '0', 1601869188, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 15000, '2020-10-05 03:40:08', 'INR', '1601869178', 'authorized', '', '::1', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Fl4gaUOwV6MUnh\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":224,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.377938,\"namelookup_time\":0.043294,\"connect_time\":0.068211,\"pretransfer_time\":0.208586,\"size_upload\":0,\"size_download\":632,\"speed_download\":1676,\"speed_upload\":0,\"download_content_length\":632,\"upload_content_length\":-1,\"starttransfer_time\":0.377898,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.115.122\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"192.168.1.102\",\"local_port\":58053,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":208368,\"connect_time_us\":68211,\"namelookup_time_us\":43294,\"pretransfer_time_us\":208586,\"redirect_time_us\":0,\"starttransfer_time_us\":377898,\"total_time_us\":377938,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Fl4gaUOwV6MUnh\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500000,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005075523\\\",\\\"card_id\\\":\\\"card_Fl4gaYmKNFLt52\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"hfgh@hgfg.bjh\\\",\\\"contact\\\":\\\"+919704842889\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005075523\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"743621\\\"},\\\"created_at\\\":1601869188}\"}', 'payment', '0', '2020-10-05 09:10:08', '', 'Purchase Order # 20201005075523', 'true', 15000),
(31, 'pay_FlIBL4s1IStkQ4', 5, 0, '20201005221031', 6, '0', 1601916716, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 15002, '2020-10-05 10:22:00', 'INR', '1601916685', 'authorized', '', '124.123.171.120', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlIBL4s1IStkQ4\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":1.015578000000000091773699750774540007114410400390625,\"namelookup_time\":0.10304699999999999970867747833835892379283905029296875,\"connect_time\":0.30636099999999999443645037899841554462909698486328125,\"pretransfer_time\":0.7258679999999999576942855128436349332332611083984375,\"size_upload\":0,\"size_download\":632,\"speed_download\":622,\"speed_upload\":0,\"download_content_length\":632,\"upload_content_length\":-1,\"starttransfer_time\":1.01548600000000011078782335971482098102569580078125,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.115.122\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":44640,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":725778,\"connect_time_us\":306361,\"namelookup_time_us\":103047,\"pretransfer_time_us\":725868,\"redirect_time_us\":0,\"starttransfer_time_us\":1015486,\"total_time_us\":1015578,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlIBL4s1IStkQ4\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500200,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005221031\\\",\\\"card_id\\\":\\\"card_FlIBL86xFwYlsF\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"hfgh@hgfg.bjh\\\",\\\"contact\\\":\\\"+919704842889\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005221031\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"678118\\\"},\\\"created_at\\\":1601916716}\"}', 'payment', '0', '2020-10-05 10:22:00', '', 'Purchase Order # 20201005221031', 'true', 15002),
(32, 'pay_FlIBL4s1IStkQ4', 5, 0, '20201005221031', 6, '0', 1601916716, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 15002, '2020-10-05 10:26:17', 'INR', '1601916685', 'authorized', '', '124.123.171.120', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlIBL4s1IStkQ4\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.934682000000000012818190953112207353115081787109375,\"namelookup_time\":0.02962800000000000155697676973431953229010105133056640625,\"connect_time\":0.23306999999999999939603867460391484200954437255859375,\"pretransfer_time\":0.6510329999999999728288457845337688922882080078125,\"size_upload\":0,\"size_download\":632,\"speed_download\":676,\"speed_upload\":0,\"download_content_length\":632,\"upload_content_length\":-1,\"starttransfer_time\":0.93461499999999997356781022972427308559417724609375,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.115.122\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":44676,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":650945,\"connect_time_us\":233070,\"namelookup_time_us\":29628,\"pretransfer_time_us\":651033,\"redirect_time_us\":0,\"starttransfer_time_us\":934615,\"total_time_us\":934682,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlIBL4s1IStkQ4\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500200,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201005221031\\\",\\\"card_id\\\":\\\"card_FlIBL86xFwYlsF\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"hfgh@hgfg.bjh\\\",\\\"contact\\\":\\\"+919704842889\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201005221031\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"678118\\\"},\\\"created_at\\\":1601916716}\"}', 'payment', '0', '2020-10-05 10:26:17', '', 'Purchase Order # 20201005221031', 'true', 15002);
INSERT INTO `payments` (`ID`, `PaymentID`, `UserID`, `Order_ID`, `Order_Number`, `CartID`, `captured`, `created_at`, `fullname`, `emailid`, `contact_number`, `amount`, `payment_date`, `currency`, `TransactionID`, `PaymentStatus`, `Payment_method`, `IP`, `BankRefNumber`, `JsonData`, `entity`, `invoice_number`, `code_execute_dt`, `card_id`, `description`, `success`, `merchant_total`) VALUES
(33, 'pay_FlRe1ZmVsY1V5s', 4, 0, '20201006073122', 11, '0', 1601950040, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 30020, '2020-10-06 07:37:24', 'INR', '1601950031', 'authorized', '', '49.206.43.240', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlRe1ZmVsY1V5s\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":1.0023359999999998937170175850042141973972320556640625,\"namelookup_time\":0.08593699999999999949995554970882949419319629669189453125,\"connect_time\":0.2856199999999999850075482754618860781192779541015625,\"pretransfer_time\":0.6965149999999999952393636704073287546634674072265625,\"size_upload\":0,\"size_download\":632,\"speed_download\":630,\"speed_upload\":0,\"download_content_length\":632,\"upload_content_length\":-1,\"starttransfer_time\":1.0022580000000000932658394958707503974437713623046875,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"3.7.206.194\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":46662,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":696425,\"connect_time_us\":285620,\"namelookup_time_us\":85937,\"pretransfer_time_us\":696515,\"redirect_time_us\":0,\"starttransfer_time_us\":1002258,\"total_time_us\":1002336,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlRe1ZmVsY1V5s\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":3002000,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201006073122\\\",\\\"card_id\\\":\\\"card_FlRe1dXahRh7Fu\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"hfgh@hgfg.bjh\\\",\\\"contact\\\":\\\"+919704842889\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201006073122\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"918609\\\"},\\\"created_at\\\":1601950040}\"}', 'payment', '0', '2020-10-06 07:37:24', '', 'Purchase Order # 20201006073122', 'true', 30020),
(34, 'pay_FlScwA69rsXz2n', 7, 0, '', 0, '0', 1601953500, 'Jayaraju Vangapandu ', 'jayarajuv5@gmail.com', '+917207589349', 15002, '2020-10-06 08:40:19', 'INR', '1601953473', 'authorized', '', '202.83.28.235', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlScwA69rsXz2n\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.9314430000000000209325889954925514757633209228515625,\"namelookup_time\":0.0283050000000000002986499936241671093739569187164306640625,\"connect_time\":0.2258719999999999894502167308019124902784824371337890625,\"pretransfer_time\":0.63965199999999999835864628039416857063770294189453125,\"size_upload\":0,\"size_download\":611,\"speed_download\":656,\"speed_upload\":0,\"download_content_length\":611,\"upload_content_length\":-1,\"starttransfer_time\":0.9313599999999999656807858627871610224246978759765625,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.232.218.159\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":35174,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":639551,\"connect_time_us\":225872,\"namelookup_time_us\":28305,\"pretransfer_time_us\":639652,\"redirect_time_us\":0,\"starttransfer_time_us\":931360,\"total_time_us\":931443,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlScwA69rsXz2n\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500200,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # \\\",\\\"card_id\\\":\\\"card_FjJMDT10uynbS4\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"jayarajuv5@gmail.com\\\",\\\"contact\\\":\\\"+917207589349\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"215666\\\"},\\\"created_at\\\":1601953500}\"}', 'payment', '0', '2020-10-06 08:40:19', '', 'Purchase Order # ', 'true', 15002),
(35, 'pay_FlSvSRnD58QvIS', 7, 0, '20201006085122', 0, '0', 1601954552, 'Jayaraju Vangapandu ', 'jayarajuv5@gmail.com', '+917207589349', 15002, '2020-10-06 08:52:36', 'INR', '1601954522', 'authorized', '', '202.83.28.235', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlSvSRnD58QvIS\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.89117199999999996418154069033334963023662567138671875,\"namelookup_time\":0.028135000000000000286437540353290387429296970367431640625,\"connect_time\":0.220418000000000002813749233609996736049652099609375,\"pretransfer_time\":0.616786999999999974164666127762757241725921630859375,\"size_upload\":0,\"size_download\":639,\"speed_download\":717,\"speed_upload\":0,\"download_content_length\":639,\"upload_content_length\":-1,\"starttransfer_time\":0.89104799999999995119281948063871823251247406005859375,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.235.190.228\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":34430,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":616689,\"connect_time_us\":220418,\"namelookup_time_us\":28135,\"pretransfer_time_us\":616787,\"redirect_time_us\":0,\"starttransfer_time_us\":891048,\"total_time_us\":891172,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlSvSRnD58QvIS\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500200,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201006085122\\\",\\\"card_id\\\":\\\"card_FjJMDT10uynbS4\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"jayarajuv5@gmail.com\\\",\\\"contact\\\":\\\"+917207589349\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201006085122\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"338658\\\"},\\\"created_at\\\":1601954552}\"}', 'payment', '0', '2020-10-06 08:52:36', '', 'Purchase Order # 20201006085122', 'true', 15002),
(36, 'pay_FlTSooePGFbzhK', 7, 0, '', 0, '0', 1601956447, 'Jayaraju Vangapandu ', 'jayarajuv5@gmail.com', '+917207589349', 15000, '2020-10-06 09:24:11', 'INR', '1601956436', 'authorized', '', '202.83.28.235', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlTSooePGFbzhK\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.96625199999999999977973175191436894237995147705078125,\"namelookup_time\":0.0857900000000000051425530500637250952422618865966796875,\"connect_time\":0.276847000000000009745093620949774049222469329833984375,\"pretransfer_time\":0.67104200000000002734878989940625615417957305908203125,\"size_upload\":0,\"size_download\":611,\"speed_download\":632,\"speed_upload\":0,\"download_content_length\":611,\"upload_content_length\":-1,\"starttransfer_time\":0.96616400000000002279421096318401396274566650390625,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"3.7.120.158\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":41514,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":670940,\"connect_time_us\":276847,\"namelookup_time_us\":85790,\"pretransfer_time_us\":671042,\"redirect_time_us\":0,\"starttransfer_time_us\":966164,\"total_time_us\":966252,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlTSooePGFbzhK\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1500000,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # \\\",\\\"card_id\\\":\\\"card_FlTSosR9J9GCg0\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"jayarajuv5@gmail.com\\\",\\\"contact\\\":\\\"+917207589349\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"301300\\\"},\\\"created_at\\\":1601956447}\"}', 'payment', '0', '2020-10-06 09:24:11', '', 'Purchase Order # ', 'true', 15000),
(37, 'pay_FlTSsS1oisJKJo', 4, 0, '20201006092329', 0, '0', 1601956450, 'Venkat Yadav ', 'hfgh@hgfg.bjh', '+919704842889', 30002, '2020-10-06 09:24:14', 'INR', '1601956425', 'authorized', '', '49.206.43.240', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlTSsS1oisJKJo\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.895553000000000043456793719087727367877960205078125,\"namelookup_time\":0.00033799999999999997581101585097940187552012503147125244140625,\"connect_time\":0.1940759999999999985131893254219903610646724700927734375,\"pretransfer_time\":0.59295500000000000984101689027738757431507110595703125,\"size_upload\":0,\"size_download\":632,\"speed_download\":706,\"speed_upload\":0,\"download_content_length\":632,\"upload_content_length\":-1,\"starttransfer_time\":0.89548700000000003296207751191104762256145477294921875,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"3.7.120.158\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":41516,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":592858,\"connect_time_us\":194076,\"namelookup_time_us\":338,\"pretransfer_time_us\":592955,\"redirect_time_us\":0,\"starttransfer_time_us\":895487,\"total_time_us\":895553,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlTSsS1oisJKJo\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":3000200,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201006092329\\\",\\\"card_id\\\":\\\"card_FlTSsV1IPHcSUx\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"hfgh@hgfg.bjh\\\",\\\"contact\\\":\\\"+919704842889\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201006092329\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"266461\\\"},\\\"created_at\\\":1601956450}\"}', 'payment', '0', '2020-10-06 09:24:14', '', 'Purchase Order # 20201006092329', 'true', 30002),
(38, 'pay_FlUavTasGIvfhu', 7, 0, '20201006102939', 0, '0', 1601960429, 'Jayaraju Vangapandu ', 'jayarajuv5@gmail.com', '+917207589349', 15018, '2020-10-06 10:30:33', 'INR', '1601960411', 'authorized', '', '202.83.28.235', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlUavTasGIvfhu\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":1.0049330000000000762128138376283459365367889404296875,\"namelookup_time\":0.0868430000000000035242919693700969219207763671875,\"connect_time\":0.2867450000000000276401124210678972303867340087890625,\"pretransfer_time\":0.70130400000000003846167828669422306120395660400390625,\"size_upload\":0,\"size_download\":639,\"speed_download\":636,\"speed_upload\":0,\"download_content_length\":639,\"upload_content_length\":-1,\"starttransfer_time\":1.00484900000000010322764865122735500335693359375,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"15.206.229.203\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":53936,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":701180,\"connect_time_us\":286745,\"namelookup_time_us\":86843,\"pretransfer_time_us\":701304,\"redirect_time_us\":0,\"starttransfer_time_us\":1004849,\"total_time_us\":1004933,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlUavTasGIvfhu\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1501800,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201006102939\\\",\\\"card_id\\\":\\\"card_FlUavY21irUOO0\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"jayarajuv5@gmail.com\\\",\\\"contact\\\":\\\"+917207589349\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201006102939\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"611404\\\"},\\\"created_at\\\":1601960429}\"}', 'payment', '0', '2020-10-06 10:30:33', '', 'Purchase Order # 20201006102939', 'true', 15018),
(39, 'pay_FlunNrrzw8UilD', 7, 0, '20201007115946', 0, '0', 1602052698, 'Jayaraju Vangapandu ', 'jayarajuv5@gmail.com', '+917207589349', 15018, '2020-10-07 12:08:23', 'INR', '1602052643', 'authorized', '', '202.83.28.235', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_FlunNrrzw8UilD\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":389,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":1.0554349999999999010213969086180441081523895263671875,\"namelookup_time\":0.142228999999999994319210827597999013960361480712890625,\"connect_time\":0.335971999999999992869703646647394634783267974853515625,\"pretransfer_time\":0.73591899999999998982502802391536533832550048828125,\"size_upload\":0,\"size_download\":687,\"speed_download\":651,\"speed_upload\":0,\"download_content_length\":687,\"upload_content_length\":-1,\"starttransfer_time\":1.05537100000000005906031219637952744960784912109375,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.234.174.206\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":36022,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":735821,\"connect_time_us\":335972,\"namelookup_time_us\":142229,\"pretransfer_time_us\":735919,\"redirect_time_us\":0,\"starttransfer_time_us\":1055371,\"total_time_us\":1055435,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_FlunNrrzw8UilD\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1501800,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"upi\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20201007115946\\\",\\\"card_id\\\":null,\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":\\\"72dfsfsa@upi\\\",\\\"email\\\":\\\"jayarajuv5@gmail.com\\\",\\\"contact\\\":\\\"+917207589349\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20201007115946\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"rrn\\\":\\\"195486373735\\\",\\\"upi_transaction_id\\\":\\\"B62914A4620F6613C707D2D42ACDF609\\\"},\\\"created_at\\\":1602052698}\"}', 'payment', '0', '2020-10-07 12:08:23', '', 'Purchase Order # 20201007115946', 'true', 15018);

-- --------------------------------------------------------

--
-- Table structure for table `productoptions`
--

CREATE TABLE `productoptions` (
  `OptionID` int(11) NOT NULL,
  `OptionGroupID` int(11) DEFAULT NULL,
  `OptionName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productoptions`
--

INSERT INTO `productoptions` (`OptionID`, `OptionGroupID`, `OptionName`) VALUES
(2, 2, '14 Kt'),
(3, 2, '18 Kt'),
(5, 3, '3'),
(6, 3, '1'),
(7, 3, '2'),
(8, 5, 'SI'),
(10, 1, 'IJ'),
(11, 1, 'GH'),
(12, 1, 'EF'),
(13, 5, 'VS'),
(14, 5, 'VVS'),
(15, 6, 'Yellow gold'),
(16, 6, 'White gold'),
(17, 7, 'Pearls'),
(18, 7, 'Diamond Beads'),
(19, 7, 'Black Beads'),
(20, 8, 'Rubies'),
(21, 8, 'Colour Stone'),
(22, 9, 'Round'),
(23, 10, 'IGI'),
(24, 9, 'Baguette'),
(25, 9, 'Marquis'),
(26, 9, 'Rosecut'),
(27, 6, 'Rose gold and white gold');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `MRP_Price` float NOT NULL,
  `Price` float NOT NULL,
  `Making_charges_unit` char(10) NOT NULL,
  `Making_charges` float NOT NULL,
  `Making_chg_On_Grs_Net_Weight` char(20) NOT NULL,
  `discount_percentage` float NOT NULL,
  `Width` float DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Length` float DEFAULT NULL,
  `CartDesc` varchar(250) NOT NULL,
  `ShortDesc` varchar(250) NOT NULL,
  `LongDesc` text NOT NULL,
  `Thumbnail` varchar(150) NOT NULL,
  `lmage` varchar(150) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Sub_CategorylD` int(11) NOT NULL,
  `UpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Stock` float DEFAULT NULL,
  `Productlive` tinyint(4) DEFAULT '0' COMMENT '1=Yes,0=No',
  `Provision_for_opening` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Gender` enum('Women','Men') NOT NULL,
  `Collection` varchar(100) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modifiedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` varchar(50) DEFAULT NULL,
  `AddedByIP` varchar(20) DEFAULT NULL,
  `OptionGroupID` int(11) NOT NULL,
  `Material_type` int(11) NOT NULL,
  `No_of_pieces` float NOT NULL,
  `Gross_weight` float NOT NULL,
  `Net_weight` float NOT NULL,
  `Polish_Details` varchar(250) NOT NULL,
  `SEOTitle` varchar(100) DEFAULT NULL,
  `SEODesc` varchar(200) DEFAULT NULL,
  `SEOKeywords` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `SEOTitle`, `SEODesc`, `SEOKeywords`) VALUES
(1, 'NVB30', 'NVB30', 'nvb30', 260032, 260032, 'gram', 875, 'gross_weight', 0, 26.76, 0, 26.7, '', 'A pair of bangles with rubies and diamonds', '', '', '', 1, 9, '2020-09-16 07:53:31', 4, 1, 'Yes', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 2, 49.53, 46.65, 'Yellow gold with white pen rodium', '', '', ''),
(2, 'NVB17', 'NVB17', 'nvb17', 143588, 143588, 'gram', 975, 'gross_weight', 0, 27.76, 0, 26.7, '', 'A single bangle in fancy cut diamonds', '', '', '', 1, 9, '2020-09-16 07:53:31', 1, 1, 'No', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 27.35, 26.198, 'Yellow gold with white and rose gold pen rodium', '', '', ''),
(3, 'NVB63', 'NVB63', 'nvb63', 335738, 335738, 'gram', 960, 'gross_weight', 0, 28.76, 0, 26.7, '', 'A pair of wide close setting bangles', '', '', '', 1, 10, '2020-09-16 07:53:31', 1, 1, 'No', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 2, 63.95, 62.732, 'Yellow gold  ', '', '', ''),
(4, 'NVB41', 'NVB41', 'nvb41', 36487.5, 36487.5, 'gram', 1375, 'gross_weight', 0, 29.76, 0, 26.7, '', 'Flexible bracelet', '', '', '', 2, 11, '2020-09-16 07:53:31', 1, 1, 'Yes', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 6.95, 6.78, 'Rose gold and white gold', '', '', ''),
(5, 'NVL 153', 'NVL 153', 'nvl-153', 61687.5, 61687.5, 'gram', 875, 'gross_weight', 0, 30.76, 0, 26.7, '', '', '', '', '', 3, 12, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 11.75, 10.624, 'Yellow gold', '', '', ''),
(6, 'NVL 206', 'NVL 206', 'nvl-206', 30922.5, 30922.5, 'gram', 875, 'gross_weight', 0, 31.76, 0, 26.7, '', '', '', '', '', 3, 12, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 5.89, 5.714, 'Yellow gold', '', '', ''),
(7, 'NVL 12', 'NVL 12', 'nvl-12', 74760, 74760, 'gram', 875, 'gross_weight', 0, 32.76, 0, 26.7, '', '', '', '', '', 3, 12, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 14.24, 11.558, 'Yellow gold', '', '', ''),
(8, 'NVL 143', 'NVL 143', 'nvl-143', 120855, 120855, 'gram', 960, 'gross_weight', 0, 33.76, 0, 26.7, '', '', '', '', '', 3, 13, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 23.02, 22.588, 'Yellow gold', '', '', ''),
(9, 'NVl112', 'NVl112', 'nvl112', 63420, 63420, 'gram', 960, 'gross_weight', 0, 34.76, 0, 26.7, '', '', '', '', '', 3, 13, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 12.08, 11.616, 'Yellow gold', '', '', ''),
(10, 'NVL174', 'NVL174', 'nvl174', 61162.5, 61162.5, 'gram', 960, 'gross_weight', 0, 35.76, 0, 26.7, '', '', '', '', '', 3, 13, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 11.65, 11.34, 'Yellow gold', '', '', ''),
(11, 'NDC4', 'NDC4', 'ndc4', 102480, 102480, 'gram', 860, 'gross_weight', 0, 36.76, 0, 26.7, '', '', '', '', '', 0, 12, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 19.52, 13.308, 'Yellow gold', '', '', ''),
(12, 'NVC2', 'NVC2', 'nvc2', 109515, 109515, 'gram', 875, 'gross_weight', 0, 37.76, 0, 26.7, '', '', '', '', '', 0, 12, '2020-09-16 07:53:31', 1, 1, '', 'Women', '0', '2020-09-16 07:53:31', '2020-09-16 01:23:31', 'Admin', '106.208.6.135', 0, 1, 1, 20.86, 14.082, 'Yellow gold', '', '', ''),
(13, 'NVL59', 'NVL59', 'nvl59', 55650, 55650, 'gram', 875, 'Net_weight', 0, 38.76, 0, 26.7, '', '', '', '', '', 0, 12, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 10.6, 10.398, 'Yellow gold', '', '', ''),
(14, 'NVL189', 'NVL189', 'nvl189', 31972.5, 31972.5, 'gram', 875, 'gross_weight', 0, 39.76, 0, 26.7, '', '', '', '', '', 3, 12, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 6.09, 5.836, 'Yellow gold', '', '', ''),
(15, 'NVT683', 'NVT683', 'nvt683', 31237.5, 31237.5, 'gram', 875, 'gross_weight', 0, 40.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 2, 5.95, 5.67, 'Yellow gold', '', '', ''),
(16, 'NVL17', 'NVL17', 'nvl17', 10605, 10605, 'gram', 1200, 'gross_weight', 0, 41.76, 0, 26.7, '', '', '', '', '', 3, 12, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 2.02, 1.966, 'Yellow gold', '', '', ''),
(17, 'NVT22', 'NVT22', 'nvt22', 17272.5, 17272.5, 'gram', 1031, 'gross_weight', 0, 42.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 3.29, 3.216, 'Yellow gold', '', '', ''),
(18, 'NVT122', 'NVT122', 'nvt122', 19687.5, 19687.5, 'gram', 875, 'gross_weight', 0, 43.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 3.75, 3.618, 'Yellow gold', '', '', ''),
(19, 'NVT580', 'NVT580', 'nvt580', 24622.5, 24622.5, 'gram', 875, '', 0, 44.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 4.69, 4, 'Yellow gold', '', '', ''),
(20, 'NVT616', 'NVT616', 'nvt616', 11077.5, 11077.5, 'Fix', 3000, 'Fix', 0, 45.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 2.11, 2.052, 'Yellow gold', '', '', ''),
(21, 'NZT2', 'NZT2', 'nzt2', 122115, 122115, 'gram', 1975, 'gross_weight', 0, 46.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 23.26, 18.814, 'Rose gold and white gold', '', '', ''),
(22, 'NVT596', 'NVT596', 'nvt596', 119227, 119227, 'gram', 875, 'gross_weight', 0, 47.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 22.71, 21.426, 'Yellow gold', '', '', ''),
(23, 'NVT 472 & NVJ 23', 'NVT 472 & NVJ 23', 'nvt-472-nvj-23', 240660, 240660, 'gram', 875, 'gross_weight', 0, 48.76, 0, 26.7, '', '', '', '', '', 5, 0, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 45.84, 41.03, 'Yellow gold', '', '', ''),
(24, 'NVT570', 'NVT570', 'nvt570', 36120, 36120, 'gram', 960, 'gross_weight', 0, 49.76, 0, 26.7, '', '', '', '', '', 4, 15, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 6.88, 6.676, 'Yellow gold', '', '', ''),
(25, 'NVN33', 'NVN33', 'nvn33', 93292.5, 93292.5, 'gram', 875, 'gross_weight', 0, 50.76, 0, 26.7, '', '', '', '', '', 6, 16, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 17.77, 17.198, 'Yellow gold', '', '', ''),
(26, 'NVT207', 'NVT207', 'nvt207', 31447.5, 31447.5, 'gram', 875, 'gross_weight', 0, 51.76, 0, 26.7, '', '', '', '', '', 4, 14, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 5.99, 5.646, 'Yellow gold', '', '', ''),
(27, 'NVR22', 'NVR22', 'nvr22', 10972.5, 10972.5, 'gram', 1330, 'gross_weight', 0, 52.76, 0, 26.7, '', '', '', '', '', 7, 17, '2020-09-16 07:53:32', 1, 1, '', 'Men', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 2.09, 2.02, 'White gold', '', '', ''),
(28, 'NVR165', 'NVR165', 'nvr165', 23520, 23520, 'gram', 1600, 'gross_weight', 0, 53.76, 0, 26.7, '', '', '', '', '', 7, 17, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 4.48, 4.454, 'Platinum', '', '', ''),
(29, 'NVR78', 'NVR78', 'nvr78', 36750, 36750, 'gram', 1675, 'gross_weight', 0, 54.76, 0, 26.7, '', '', '', '', '', 7, 17, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 7, 6.972, 'Rose gold and white gold', '', '', ''),
(30, 'NGC177', 'NGC177', 'ngc177', 13912.5, 13912.5, 'gram', 930, 'gross_weight', 0, 55.76, 0, 26.7, '', '', '', '', '', 8, 1, '2020-09-16 07:53:32', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-09-16 01:23:32', 'Admin', '106.208.6.135', 0, 1, 1, 2.65, 2.65, 'White gold', '', '', ''),
(31, 'NGC22', 'NGC22', 'ngc22', 71505, 71505, 'gram', 930, 'gross_weight', 0, 56.76, 0, 26.7, '', 'wetwertwertwert', '', '', '', 1, 10, '2020-10-12 10:09:25', 1, 1, '', 'Women', '0', '2020-09-16 07:53:32', '2020-10-12 10:09:25', '', '', 0, 1, 1, 13.62, 13.62, 'White gold', '', '', ''),
(34, 'open settings #### 343423', 'open settings #### 343423', 'open-settings-343423', 25000, 20000, 'gram', 2500, 'net_weight', 0, 12.5, 12.4, 12, '', 'open settings  343423', '', '', '', 7, 17, '2020-10-14 05:04:04', 2, 0, '', 'Women', '', '2020-10-14 04:58:49', '2020-10-14 05:04:04', '', '', 0, 2, 2, 12.5, 15.2, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `CategoryImage` varchar(220) DEFAULT NULL,
  `CategoryDesc` varchar(150) DEFAULT NULL,
  `CategorySlug` varchar(50) DEFAULT NULL,
  `SEOTitle` varchar(100) DEFAULT NULL,
  `SEODescription` varchar(200) DEFAULT NULL,
  `SEOKeywords` varchar(200) DEFAULT NULL,
  `is_customizable` tinyint(1) NOT NULL DEFAULT '0',
  `custom_size` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`CategoryID`, `CategoryName`, `ParentID`, `CategoryImage`, `CategoryDesc`, `CategorySlug`, `SEOTitle`, `SEODescription`, `SEOKeywords`, `is_customizable`, `custom_size`) VALUES
(1, 'Bangles', 0, '../uploads/categories/bangles.jpg', 'Bangles', 'bangles', 'Bangles', 'Bangles', 'Bangles', 1, '1,2,3.5,4'),
(2, 'Bracelets', 0, '../uploads/categories/bracelets.jpg', 'Bracelets', 'bracelets', 'Bracelets', 'Bracelets', 'Bracelets', 0, ''),
(3, 'Pendent', 0, '../uploads/categories/pendent.jpg', 'Pendent', 'pendent', 'Pendent', 'Pendent', 'Pendent', 0, ''),
(4, 'Tops', 0, '../uploads/categories/tops.jpg', 'Tops', 'tops', 'Tops', 'Tops', 'Tops', 0, ''),
(5, 'Jumki', 0, '../uploads/categories/jumki.jpg', 'Jumki', 'jumki', 'Jumki', 'Jumki', 'Jumki', 0, ''),
(6, 'Necklace', 0, '../uploads/categories/necklace.jpg', 'Necklace', 'necklace', 'Necklace', 'Necklace', '', 0, ''),
(7, 'Rings', 0, '../uploads/categories/rings.jpg', 'Ring', 'rings', 'Ring', 'Ring', 'Ring', 0, ''),
(8, 'Italian Chains', 0, '../uploads/categories/italian-chains.jpg', 'Italian Chain', 'italian-chains', 'Italian Chain', 'Italian Chain', 'Italian Chain', 0, ''),
(9, 'Open setting diamond bangles', 1, '../uploads/categories/open-setting-diamond-bangles.jpg', 'Open setting diamond bangles', 'open-setting-diamond-bangles', 'Open setting diamond bangles', 'Open setting diamond bangles', 'Open setting diamond bangles', 0, ''),
(10, 'Close setting bangles', 1, '../uploads/categories/close-setting-bangles.jpg', 'Close setting bangles', 'close-setting-bangles', 'Close setting bangles', 'Close setting bangles', 'Close setting bangles', 0, ''),
(11, 'Flexible Bracelet', 2, '../uploads/categories/flexible-bracelet.jpg', 'Flexible Bracelet', 'flexible-bracelet', 'Flexible Bracelet', 'Flexible Bracelet', 'Flexible Bracelet', 0, ''),
(12, 'Open setting Pendent', 3, '../uploads/categories/open-setting-pendent.jpg', 'Open setting Pendent', 'open-setting-pendent', 'Open setting Pendent', 'Open setting Pendent', 'Open setting Pendent', 0, ''),
(13, 'Close setting Pendent', 3, '../uploads/categories/close-setting-pendent.jpg', 'Close setting Pendent', 'close-setting-pendent', 'Close setting Pendent', 'Close setting Pendent', 'Close setting Pendent', 0, ''),
(14, 'Open setting Tops', 4, '../uploads/categories/open-setting-tops.jpg', 'Open setting Tops', 'open-setting-tops', 'Open setting Tops', 'Open setting Tops', 'Open setting Tops', 0, ''),
(15, 'Close setting tops', 4, '../uploads/categories/close-setting-tops.png', 'Close setting tops', 'close-setting-tops', 'Close setting tops', 'Close setting tops', 'Close setting tops', 0, ''),
(16, 'Open setting Necklace', 6, '../uploads/categories/open-setting-necklace.jpg', 'Open setting Necklace', 'open-setting-necklace', 'Open setting Necklace', 'Open setting Necklace', 'Open setting Necklace', 0, ''),
(17, 'Open setting Ring', 7, '../uploads/categories/open-setting-ring.jpg', 'Open setting Ring', 'open-setting-ring', 'Open setting Ring', 'Open setting Ring', 'Open setting Ring', 0, ''),
(19, 'demo', 19, '', 'demo', 'demo', 'demo', 'demo', 'demo', 1, '1,2,3');

-- --------------------------------------------------------

--
-- Table structure for table `product_custom_option`
--

CREATE TABLE `product_custom_option` (
  `ProductOptionID` int(11) NOT NULL,
  `Cart_DetailsID` int(11) NOT NULL,
  `OptionID` int(11) NOT NULL,
  `Combination_OptionID` int(11) NOT NULL,
  `Combination_OptionID_Secnd` int(11) NOT NULL,
  `OptionPriceincrement` float NOT NULL,
  `Quantity` float NOT NULL,
  `OptionWeight` char(15) NOT NULL,
  `OptionSize` char(20) NOT NULL,
  `OptionGroupID` int(11) NOT NULL,
  `attribute_type` enum('material','diamond','pearls','gemstone','diamond_shape') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_custom_option`
--

INSERT INTO `product_custom_option` (`ProductOptionID`, `Cart_DetailsID`, `OptionID`, `Combination_OptionID`, `Combination_OptionID_Secnd`, `OptionPriceincrement`, `Quantity`, `OptionWeight`, `OptionSize`, `OptionGroupID`, `attribute_type`) VALUES
(12, 6, 0, 3, 0, 0, 0, '', '.2.', 0, 'material'),
(13, 6, 11, 14, 0, 0, 0, '0', '0', 0, 'diamond'),
(14, 15, 0, 3, 0, 0, 0, '', '.2.', 0, 'material'),
(15, 15, 12, 14, 0, 0, 0, '0', '0', 0, 'diamond'),
(16, 20, 0, 3, 0, 0, 0, '', '.2.', 0, 'material'),
(17, 20, 12, 14, 0, 0, 0, '0', '0', 0, 'diamond');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `Product_imagesID` int(11) NOT NULL,
  `Image_filepath` varchar(255) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

CREATE TABLE `product_option` (
  `ProductOptionID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `OptionID` int(11) NOT NULL,
  `Combination_OptionID` int(11) NOT NULL,
  `Combination_OptionID_Secnd` int(11) NOT NULL,
  `OptionPriceincrement` float NOT NULL,
  `Quantity` float NOT NULL,
  `OptionWeight` char(15) NOT NULL,
  `OptionSize` char(20) NOT NULL,
  `OptionGroupID` int(11) NOT NULL,
  `attribute_type` enum('material','diamond','pearls','gemstone','diamond_shape') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`ProductOptionID`, `ProductID`, `OptionID`, `Combination_OptionID`, `Combination_OptionID_Secnd`, `OptionPriceincrement`, `Quantity`, `OptionWeight`, `OptionSize`, `OptionGroupID`, `attribute_type`) VALUES
(1, 1, 0, 3, 15, 0, 0, '0', '2.4', 0, 'material'),
(2, 1, 14, 12, 23, 51000, 265, '5.02', '', 0, 'diamond'),
(3, 1, 22, 0, 0, 42000, 265, '4.68', '', 0, 'diamond_shape'),
(4, 1, 24, 0, 0, 0, 0, '', '', 0, 'diamond_shape'),
(5, 1, 20, 0, 0, 1000, 10, '4.7', '', 0, 'gemstone'),
(6, 2, 0, 3, 15, 0, 0, '0', '2.5', 0, 'material'),
(7, 2, 14, 12, 23, 51000, 317, '3.52', '', 0, 'diamond'),
(8, 2, 22, 0, 0, 68000, 317, '0.82', '', 0, 'diamond_shape'),
(9, 2, 25, 0, 0, 75000, 22, '1.42', '', 0, 'diamond_shape'),
(10, 2, 17, 0, 0, 0, 0, '0', '', 0, 'diamond_shape'),
(11, 3, 14, 12, 23, 51000, 198, '6.09', '', 0, 'diamond'),
(12, 3, 22, 0, 0, 0, 198, 'NA', '', 0, 'diamond_shape'),
(13, 4, 0, 3, 27, 0, 0, '0', '2.2 and 2', 0, 'material'),
(14, 4, 14, 12, 23, 51000, 40, '0.39', '', 0, 'diamond'),
(15, 4, 22, 0, 0, 68000, 40, '0.46', '', 0, 'diamond_shape'),
(16, 4, 25, 0, 0, 0, 0, '', '', 0, 'diamond_shape'),
(17, 5, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(18, 5, 14, 12, 23, 51000, 113, '0.93', '', 0, 'diamond'),
(19, 5, 22, 0, 0, 42000, 113, '0.4', '', 0, 'diamond_shape'),
(20, 5, 24, 0, 0, 0, 0, '', '', 0, 'diamond_shape'),
(21, 5, 21, 0, 0, 1000, 2, '1.02', '', 0, 'gemstone'),
(22, 5, 17, 0, 0, 300, 1, '3.28', '', 0, 'pearls'),
(23, 6, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(24, 6, 14, 12, 23, 51000, 58, '0.88', '', 0, 'diamond'),
(25, 6, 22, 0, 0, 0, 58, '', '', 0, 'diamond_shape'),
(26, 7, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(27, 7, 14, 12, 23, 51000, 191, '1.43', '', 0, 'diamond'),
(28, 7, 22, 0, 0, 0, 191, '', '', 0, 'diamond_shape'),
(29, 7, 21, 0, 0, 1000, 2, '1.52', '', 0, 'gemstone'),
(30, 7, 17, 0, 0, 300, 5, '10.46', '', 0, 'pearls'),
(31, 8, 14, 12, 23, 51000, 60, '1.93', '', 0, 'diamond'),
(32, 8, 22, 0, 0, 0, 60, '', '', 0, 'diamond_shape'),
(33, 8, 21, 0, 0, 3000, 2, '0.23', '', 0, 'gemstone'),
(34, 9, 14, 12, 23, 51000, 56, '2.19', '', 0, 'diamond'),
(35, 9, 22, 0, 0, 0, 56, '', '', 0, 'diamond_shape'),
(36, 9, 21, 0, 0, 3000, 1, '0.13', '', 0, 'gemstone'),
(37, 10, 14, 12, 23, 51000, 44, '1.05', '', 0, 'diamond'),
(38, 10, 22, 0, 0, 0, 44, '', '', 0, 'diamond_shape'),
(39, 10, 21, 0, 0, 3000, 4, '0.5', '', 0, 'gemstone'),
(40, 11, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(41, 11, 14, 12, 23, 51000, 1, '0.97', '', 0, 'diamond'),
(42, 11, 22, 0, 0, 0, 1, '', '', 0, 'diamond_shape'),
(43, 11, 21, 0, 0, 3000, 1, '4.98', '', 0, 'gemstone'),
(44, 11, 18, 0, 0, 3000, 279, '25.11', '', 0, 'pearls'),
(45, 12, 14, 12, 23, 51000, 1, '1.13', '', 0, 'diamond'),
(46, 12, 22, 0, 0, 0, 1, '', '', 0, 'diamond_shape'),
(47, 12, 18, 0, 0, 3000, 364, '32.76', '', 0, 'pearls'),
(48, 13, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(49, 13, 14, 12, 23, 51000, 75, '0.97', '', 0, 'diamond'),
(50, 13, 22, 0, 0, 0, 75, '', '', 0, 'diamond_shape'),
(51, 13, 21, 0, 0, 1000, 2, '0.04', '', 0, 'gemstone'),
(52, 13, 19, 0, 0, 0, 1, '6.15', '', 0, 'pearls'),
(53, 14, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(54, 14, 14, 12, 23, 51000, 132, '1.27', '', 0, 'diamond'),
(55, 14, 22, 0, 0, 0, 132, '', '', 0, 'diamond_shape'),
(56, 15, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(57, 15, 14, 12, 23, 51000, 90, '1.4', '', 0, 'diamond'),
(58, 15, 22, 0, 0, 0, 90, '', '', 0, 'diamond_shape'),
(59, 16, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(60, 16, 14, 12, 23, 51000, 51, '0.27', '', 0, 'diamond'),
(61, 16, 22, 0, 0, 0, 51, '', '', 0, 'diamond_shape'),
(62, 17, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(63, 17, 14, 12, 23, 51000, 70, '0.37', '', 0, 'diamond'),
(64, 17, 22, 0, 0, 0, 70, '', '', 0, 'diamond_shape'),
(65, 18, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(66, 18, 14, 12, 23, 51000, 62, '0.66', '', 0, 'diamond'),
(67, 18, 22, 0, 0, 0, 62, '', '', 0, 'diamond_shape'),
(68, 19, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(69, 19, 14, 12, 23, 51000, 44, '0.39', '', 0, 'diamond'),
(70, 19, 22, 0, 0, 0, 44, '', '', 0, 'diamond_shape'),
(71, 19, 17, 0, 0, 300, 2, '2.71', '', 0, 'pearls'),
(72, 20, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(73, 20, 14, 12, 23, 51000, 18, '0.29', '', 0, 'diamond'),
(74, 20, 22, 0, 0, 0, 18, '', '', 0, 'diamond_shape'),
(75, 21, 0, 3, 27, 0, 0, '0', '', 0, 'material'),
(76, 21, 22, 0, 0, 38000, 204, '0.31', '', 0, 'diamond_shape'),
(77, 21, 26, 0, 0, 0, 0, '', '', 0, 'diamond_shape'),
(78, 21, 21, 0, 0, 8000, 28, '3.2', '', 0, 'gemstone'),
(79, 21, 17, 0, 0, 600, 2, '16.67', '', 0, 'pearls'),
(80, 22, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(81, 22, 14, 12, 23, 51000, 332, '2.57', '', 0, 'diamond'),
(82, 22, 22, 0, 0, 75000, 332, '0.79', '', 0, 'diamond_shape'),
(83, 22, 22, 0, 0, 0, 0, '', '', 0, 'diamond_shape'),
(84, 22, 21, 0, 0, 1000, 4, '3.06', '', 0, 'gemstone'),
(85, 23, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(86, 23, 14, 12, 23, 51000, 490, '4.69', '', 0, 'diamond'),
(87, 23, 22, 0, 0, 0, 490, '', '', 0, 'diamond_shape'),
(88, 23, 21, 0, 0, 1000, 6, '2.11', '', 0, 'gemstone'),
(89, 23, 17, 0, 0, 300, 2, '17.25', '', 0, 'pearls'),
(90, 24, 14, 12, 23, 68000, 14, '1.02', '', 0, 'diamond'),
(91, 24, 22, 0, 0, 0, 14, '', '', 0, 'diamond_shape'),
(92, 25, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(93, 25, 14, 12, 23, 51000, 139, '2.86', '', 0, 'diamond'),
(94, 25, 22, 0, 0, 0, 139, '', '', 0, 'diamond_shape'),
(95, 26, 0, 3, 15, 0, 0, '0', '', 0, 'material'),
(96, 26, 14, 12, 23, 51000, 44, '1.72', '', 0, 'diamond'),
(97, 26, 22, 0, 0, 0, 44, '', '', 0, 'diamond_shape'),
(98, 27, 0, 3, 16, 0, 0, '0', '11', 0, 'material'),
(99, 27, 14, 12, 23, 51000, 6, '0.04', '', 0, 'diamond'),
(100, 27, 22, 0, 0, 190000, 6, '0.31', '', 0, 'diamond_shape'),
(101, 27, 22, 0, 0, 0, 0, '', '', 0, 'diamond_shape'),
(102, 28, 0, 3, 0, 0, 0, '0', '11', 0, 'material'),
(103, 28, 14, 12, 23, 75000, 1, '0.13', '', 0, 'diamond'),
(104, 28, 22, 0, 0, 0, 1, '', '', 0, 'diamond_shape'),
(105, 29, 0, 3, 27, 0, 0, '0', '9', 0, 'material'),
(106, 29, 14, 12, 23, 51000, 20, '0.14', '', 0, 'diamond'),
(107, 29, 22, 0, 0, 0, 20, '', '', 0, 'diamond_shape'),
(108, 30, 0, 3, 16, 0, 0, '0', '', 0, 'material'),
(110, 32, 0, 2, 16, 0, 0, '25', '12', 0, 'material'),
(112, 33, 0, 2, 16, 0, 0, '25', '12', 0, 'material'),
(113, 31, 0, 3, 16, 0, 0, '0', '', 0, 'material');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `Name`) VALUES
(1, 'Admin'),
(2, 'Manager'),
(3, 'Accountant'),
(4, 'Executive');

-- --------------------------------------------------------

--
-- Table structure for table `seo_content`
--

CREATE TABLE `seo_content` (
  `id` int(11) NOT NULL,
  `SEOTitle` varchar(500) NOT NULL,
  `SEODesc` text NOT NULL,
  `SEOKeywords` text NOT NULL,
  `page` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seo_content`
--

INSERT INTO `seo_content` (`id`, `SEOTitle`, `SEODesc`, `SEOKeywords`, `page`) VALUES
(1, 'Anaya Jewellary', 'Anaya Jewellary description', 'Anaya Jewellary Keywords', 'home');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `issue_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `comments` text NOT NULL,
  `reply` text NOT NULL,
  `status` enum('pending','information requested','unclear','not applicable','closed') NOT NULL DEFAULT 'pending',
  `comments_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `issue_type`, `name`, `email`, `phone`, `subject`, `comments`, `reply`, `status`, `comments_date`, `reply_date`) VALUES
(1, 'Registration', 'jayaraju', 'jauaraju@deepredink.com', '9700334319', NULL, 'registration not working', '', 'pending', '2020-10-06 02:51:09', NULL),
(2, 'Registration', 'vamsi', 'vamsi@gmail.com', '9700334319', NULL, 'pleas fix', '', 'pending', '2020-10-07 05:55:14', NULL);

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
  `diam_shape_err_chk` varchar(100) NOT NULL,
  `W_no_of_diamonds` varchar(100) NOT NULL,
  `X_diamond_weight_in_ct` varchar(100) NOT NULL,
  `Y_diamond_rate` varchar(100) NOT NULL,
  `Z_diamond_shape` varchar(100) NOT NULL,
  `diam_shape_2_err_chk` varchar(100) NOT NULL,
  `AA_no_of_diamonds` varchar(100) NOT NULL,
  `AB_diamond_weight_in_ct` varchar(100) NOT NULL,
  `AC_diamond_rate` varchar(100) NOT NULL,
  `AD_diamond_shape` varchar(100) NOT NULL,
  `diam_shape_3_err_chk` varchar(100) NOT NULL,
  `AE_gemstone_type` varchar(100) NOT NULL,
  `gemstone_err_chk` varchar(100) NOT NULL,
  `AF_gemstone_quantity` varchar(100) NOT NULL,
  `AG_gemstone_weight` varchar(100) NOT NULL,
  `AH_gemstone_rate` varchar(100) NOT NULL,
  `AI_pearls` varchar(100) NOT NULL,
  `pearls_err_chk` varchar(100) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `UserPassword` varchar(150) NOT NULL,
  `UserFirstName` varchar(150) NOT NULL,
  `UserLastName` varchar(50) NOT NULL,
  `UserGender` varchar(50) DEFAULT NULL,
  `UserLastLoginIP` varchar(20) NOT NULL,
  `UserLastLoginDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserEmailVerified` tinyint(1) NOT NULL DEFAULT '1',
  `UserRegistrationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserVerificationCode` varchar(20) NOT NULL,
  `UserVerificationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserIP` varchar(20) NOT NULL,
  `UserPhone` varchar(20) DEFAULT NULL,
  `UserAltPhone` varchar(20) DEFAULT NULL,
  `UserCity` varchar(100) DEFAULT NULL,
  `UserCountry` varchar(20) DEFAULT NULL,
  `UserAddress` varchar(255) DEFAULT NULL,
  `UserAddress2` varchar(255) DEFAULT NULL,
  `UserFacebookID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserEmail`, `UserPassword`, `UserFirstName`, `UserLastName`, `UserGender`, `UserLastLoginIP`, `UserLastLoginDate`, `UserEmailVerified`, `UserRegistrationDate`, `UserVerificationCode`, `UserVerificationDate`, `UserIP`, `UserPhone`, `UserAltPhone`, `UserCity`, `UserCountry`, `UserAddress`, `UserAddress2`, `UserFacebookID`) VALUES
(1, 'rajkumar@deepredink.com', '43ab12269b21434ab9132e1bda2aa78d', 'Raja Kumar More', 'Kumar', '', '::1', '2020-09-29 05:05:50', 1, '2020-08-26 16:40:34', '', '2020-08-26 16:40:34', '', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju Vangapandu', '', '', '202.83.28.235', '2020-10-06 11:56:48', 1, '2020-09-03 07:58:57', '', '2020-09-03 07:58:57', '', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'venkat@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Venkat Yadav', '', '', '', '2020-09-03 09:15:37', 1, '2020-09-03 09:15:37', '', '2020-09-03 09:15:37', '', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'venkatyadav.1986@gmail.com', '', 'Venkat Yadav', '', '', '', '2020-09-29 01:00:05', 1, '2020-09-29 01:00:05', '', '2020-09-29 01:00:05', '', NULL, NULL, NULL, NULL, NULL, NULL, 2147483647),
(6, 'test@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'male', '', '2020-09-29 05:11:24', 1, '2020-09-29 05:11:24', '', '2020-09-29 05:11:24', '', '::1', NULL, '', NULL, NULL, NULL, 0),
(7, 'jayarajuv5@gmail.com', '', 'Jayaraju Vangapandu', '', '', '', '2020-09-30 03:10:44', 1, '2020-09-30 03:10:44', '', '2020-09-30 03:10:44', '', NULL, NULL, NULL, NULL, NULL, NULL, 2147483647),
(8, 'jayaraju@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'male', '', '2020-09-30 03:29:59', 1, '2020-09-30 03:29:59', '', '2020-09-30 03:29:59', '', '::1', NULL, NULL, NULL, NULL, NULL, 0),
(9, 'rkumar.more@gmail.com', '', 'Raj Kumar More', '', NULL, '', '2020-10-06 04:04:51', 1, '2020-10-06 04:04:51', '', '2020-10-06 04:04:51', '', NULL, NULL, NULL, NULL, NULL, NULL, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `WishlistID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`WishlistID`, `UserID`, `ProductID`, `Addedon`) VALUES
(13, 7, 19, '2020-10-06 04:59:27'),
(14, 7, 27, '2020-10-07 06:08:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_master`
--
ALTER TABLE `address_master`
  ADD PRIMARY KEY (`AddressID`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `available_locations`
--
ALTER TABLE `available_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`Order_DetailsID`);

--
-- Indexes for table `cart_master`
--
ALTER TABLE `cart_master`
  ADD PRIMARY KEY (`OrderlD`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`CouponID`);

--
-- Indexes for table `material_price`
--
ALTER TABLE `material_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_type_id` (`material_type_id`),
  ADD KEY `metal_color_id` (`metal_color_id`),
  ADD KEY `metal_clar_pur_id` (`metal_clar_pur_id`);

--
-- Indexes for table `material_type`
--
ALTER TABLE `material_type`
  ADD PRIMARY KEY (`MaterialID`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`m_item_id`),
  ADD KEY `m_id` (`m_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `metal_clar_purity`
--
ALTER TABLE `metal_clar_purity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_type_id` (`material_type_id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `metal_color`
--
ALTER TABLE `metal_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_type_id` (`material_type_id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options_group`
--
ALTER TABLE `options_group`
  ADD PRIMARY KEY (`OptionGroupID`),
  ADD KEY `material_type_id` (`material_type_id`),
  ADD KEY `OptionGroupName` (`OptionGroupName`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderlD`),
  ADD KEY `CartID` (`CartID`),
  ADD KEY `UserlD` (`UserlD`),
  ADD KEY `CouponID` (`CouponID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_DetailsID`);

--
-- Indexes for table `order_gift_messages`
--
ALTER TABLE `order_gift_messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `productoptions`
--
ALTER TABLE `productoptions`
  ADD PRIMARY KEY (`OptionID`),
  ADD KEY `OptionGroupID` (`OptionGroupID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `slug` (`slug`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `Sub_CategorylD` (`Sub_CategorylD`),
  ADD KEY `Collection` (`Collection`),
  ADD KEY `Gender` (`Gender`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `CategorySlug` (`CategorySlug`);

--
-- Indexes for table `product_custom_option`
--
ALTER TABLE `product_custom_option`
  ADD PRIMARY KEY (`ProductOptionID`),
  ADD KEY `ProductID` (`Cart_DetailsID`),
  ADD KEY `OptionID` (`OptionID`),
  ADD KEY `Combination_OptionID` (`Combination_OptionID`),
  ADD KEY `Combination_OptionID_Secnd` (`Combination_OptionID_Secnd`),
  ADD KEY `OptionGroupID` (`OptionGroupID`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`Product_imagesID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `product_option`
--
ALTER TABLE `product_option`
  ADD PRIMARY KEY (`ProductOptionID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `OptionID` (`OptionID`),
  ADD KEY `Combination_OptionID` (`Combination_OptionID`),
  ADD KEY `Combination_OptionID_Secnd` (`Combination_OptionID_Secnd`),
  ADD KEY `OptionGroupID` (`OptionGroupID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `seo_content`
--
ALTER TABLE `seo_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_product_import_table`
--
ALTER TABLE `temp_product_import_table`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`WishlistID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_master`
--
ALTER TABLE `address_master`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `available_locations`
--
ALTER TABLE `available_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cart_master`
--
ALTER TABLE `cart_master`
  MODIFY `OrderlD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `CouponID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `material_price`
--
ALTER TABLE `material_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `material_type`
--
ALTER TABLE `material_type`
  MODIFY `MaterialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `m_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=781;

--
-- AUTO_INCREMENT for table `metal_clar_purity`
--
ALTER TABLE `metal_clar_purity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `metal_color`
--
ALTER TABLE `metal_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `options_group`
--
ALTER TABLE `options_group`
  MODIFY `OptionGroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderlD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_gift_messages`
--
ALTER TABLE `order_gift_messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `productoptions`
--
ALTER TABLE `productoptions`
  MODIFY `OptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_custom_option`
--
ALTER TABLE `product_custom_option`
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `Product_imagesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seo_content`
--
ALTER TABLE `seo_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `temp_product_import_table`
--
ALTER TABLE `temp_product_import_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `WishlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

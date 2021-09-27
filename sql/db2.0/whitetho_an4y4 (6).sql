-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 09, 2021 at 05:49 AM
-- Server version: 10.3.28-MariaDB
-- PHP Version: 7.3.27

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
(1, 10, 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', '2021-03-17 16:01:17', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564', 'shipping', '', 1),
(2, 10, 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', '2021-03-17 16:01:17', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564', 'billing', 'on', 1);

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
  `EmailVerified` tinyint(1) NOT NULL DEFAULT 1,
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IP` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `Status` enum('Active','Deactive') NOT NULL,
  `LastLogin` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`AdminID`, `Email`, `Password`, `FirstName`, `LastName`, `EmailVerified`, `RegistrationDate`, `IP`, `Phone`, `Address`, `RoleID`, `Status`, `LastLogin`) VALUES
(1, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju', 'vangapandu', 1, '2020-08-13 08:55:18', '223.196.173.151', '9700334319', 'vijayawada', 1, 'Active', '2021-04-09 10:23:43'),
(2, 'venkat@deepredink.com', 'feb43797d2a30b2472d5f3d7604f8b70', 'venkat', 'Yadav', 1, '2020-08-20 06:18:38', '157.48.154.168', '9872458585', 'sdgfdg', 4, 'Active', '2020-08-31 16:54:10'),
(6, 'whitethoughts@deepredink.com', 'ef0b74627190164d1329920d3f10e8f0', '', '', 1, '2020-08-31 06:16:20', '157.47.26.47', '', '', 1, 'Active', '2021-04-09 10:21:06'),
(7, 'shanthi@whitethoughts.in', 'de1e0a63351b68f3112e2bce5024af7a', 'Shanti', 'WTB', 1, '2020-09-15 05:09:06', '49.205.231.142', 'shanti$$', '', 2, 'Active', '2021-03-15 17:34:46'),
(8, 'whitethoughts123@deepredink.com', 'ef0b74627190164d1329920d3f10e8f0', 'white', 'thoughts', 1, '2021-03-16 11:42:25', '', '9052691524', '', 2, 'Active', '2021-03-16 11:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `available_locations`
--

CREATE TABLE `available_locations` (
  `id` int(11) NOT NULL,
  `pincode` int(6) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 0,
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
(7, 'banner_images/left_back1.jpg', 'ANAYA GOLD - 2', '', 'Lorem ipsum dolor ipsum dolor - 2', 'Shop Now', 'http://www.anayajewellery.com/', 'Right_Image_Panel', 1, '2020-08-21 08:58:58', '1'),
(8, 'banner_images/Anaya_baner2-043.jpg', 'JBN', 'A new saga of elegance by Jewellery by Nikhita.', '', 'Shop Now', 'https://whitethoughtsdemos.com/anaya/products', 'Home_Banner_Panel', 1, '2020-12-02 03:12:17', '1');

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
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `CouponID` int(11) NOT NULL,
  `CouponCode` varchar(50) NOT NULL,
  `Amount` float NOT NULL,
  `MRP_Amount` float NOT NULL,
  `attribute_json_data` text NOT NULL,
  `customized_product_data` text NOT NULL,
  `discounted_amount` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`Order_DetailsID`, `OrderID`, `ProductID`, `order_method`, `ProductName`, `MRP_Price`, `ProductPrice`, `ProductSKU`, `Quantity`, `CouponID`, `CouponCode`, `Amount`, `MRP_Amount`, `attribute_json_data`, `customized_product_data`, `discounted_amount`) VALUES
(1, 1, 4, '', 'NVN 6', 245790, 245790, 'NVN 6', 1, 0, '', 245790, 245790, '', '', 0),
(3, 3, 775, '', 'Waist chain by Nikita', 500000, 399999, '232445', 1, 0, '', 399999, 500000, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart_master`
--

CREATE TABLE `cart_master` (
  `OrderlD` int(11) NOT NULL,
  `Order_Number` varchar(100) NOT NULL,
  `UserlD` varchar(120) NOT NULL,
  `OrderAmount` float NOT NULL,
  `Shipping_Charges_Amount` float DEFAULT NULL,
  `Handling_Charges_Amount` float NOT NULL DEFAULT 0,
  `OrderShipName` varchar(100) NOT NULL,
  `OrderPhone` varchar(20) NOT NULL,
  `OrderShipping` tinyint(1) NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmall` varchar(100) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
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

INSERT INTO `cart_master` (`OrderlD`, `Order_Number`, `UserlD`, `OrderAmount`, `Shipping_Charges_Amount`, `Handling_Charges_Amount`, `OrderShipName`, `OrderPhone`, `OrderShipping`, `OrderTax`, `OrderEmall`, `OrderDate`, `OrderShipped`, `OrderTrackingNumber`, `Delivery_Mode`, `DeliveryDate`, `Order_status`, `billing_Fullname`, `billing_Address1`, `billing_Address2`, `billing_LandMark`, `billing_City`, `billing_Pincode`, `billing_State`, `billing_Country`, `billing_Mobile`, `shipping_Fullname`, `shipping_Address1`, `shipping_Address2`, `shipping_LandMark`, `shipping_City`, `shipping_Pincode`, `shipping_State`, `shipping_Country`, `shipping_Mobile`) VALUES
(1, '20210317213006', '10', 245790, 0, 2000, 'Harish ', '', 0, 0, 'harish.babu@deepredink.com', '2021-03-17 16:00:06', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '09032555564', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564'),
(3, '20210317215731', '10', 399999, 0, 2000, 'Harish ', '', 0, 0, 'harish.babu@deepredink.com', '2021-03-17 16:27:31', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564');

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
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
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
  `CouponAddedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `CouponExpiryDate` date NOT NULL,
  `Description` varchar(100) NOT NULL,
  `DiscountType` char(10) NOT NULL,
  `Discount_value` float NOT NULL,
  `Cartamount` float NOT NULL,
  `Couponamount` float NOT NULL,
  `Is_Active` tinyint(1) NOT NULL DEFAULT 1,
  `Is_public` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`CouponID`, `Coupon_title`, `CouponCode`, `CouponAddedon`, `CouponExpiryDate`, `Description`, `DiscountType`, `Discount_value`, `Cartamount`, `Couponamount`, `Is_Active`, `Is_public`) VALUES
(7, 'fgdfg', 'gfg', '2020-09-29 01:45:51', '2020-09-30', 'sdgf', 'percent', 25, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_attributes`
--

CREATE TABLE `custom_attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_attributes`
--

INSERT INTO `custom_attributes` (`id`, `name`, `slug`, `code`) VALUES
(2, 'polish details', 'polish-details', ''),
(3, 'diamonds', 'diamonds', ''),
(4, 'Pearls', 'pearls', ''),
(5, 'Gemstone', 'gemstone', ''),
(6, 'Beads', 'beads', '');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_partners`
--

CREATE TABLE `delivery_partners` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_url` varchar(150) NOT NULL,
  `address` text DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `alt_mobile` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_partners`
--

INSERT INTO `delivery_partners` (`id`, `name`, `api_url`, `address`, `mobile`, `alt_mobile`) VALUES
(2, 'Blue Dart Express Limited', 'https://whitethoughtsdemos.com/anaya/', 'H.No.3-6-278/279 G2, Thomas Prabhu Reliance Residence, Street Number 11, AP State Housing Board, Himayatnagar, Hyderabad, Telangana 500029', '9700334319', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `material_price`
--

CREATE TABLE `material_price` (
  `id` int(11) NOT NULL,
  `material_type_id` int(11) NOT NULL,
  `metal_color_id` int(11) NOT NULL,
  `metal_clar_purity` int(11) NOT NULL,
  `price` float NOT NULL,
  `units` varchar(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_price`
--

INSERT INTO `material_price` (`id`, `material_type_id`, `metal_color_id`, `metal_clar_purity`, `price`, `units`, `date`) VALUES
(1, 1, 1, 14, 2941, 'gm', '2021-01-20 07:10:24'),
(2, 1, 1, 22, 4580, 'gm', '2021-01-20 00:00:00'),
(3, 1, 1, 24, 4496, 'gm', '2021-01-20 00:00:00'),
(4, 1, 1, 18, 3800, 'gm', '2021-01-20 10:39:35');

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
(4, 'Solitaire', 'solitaire');

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
  `m_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `m_position` varchar(50) DEFAULT NULL,
  `order_logic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`m_id`, `m_name`, `m_url`, `m_slug`, `m_desc`, `m_created_at`, `m_position`, `order_logic`) VALUES
(1, 'Primary Menu old', NULL, 'primary-menu-old', NULL, '2020-08-25 06:17:59', NULL, NULL),
(2, 'Footer menu', NULL, 'footer-menu', NULL, '2020-08-31 09:05:13', NULL, NULL),
(3, 'JBN Exclusive', NULL, 'jbn-exclusive', NULL, '2020-09-02 22:54:15', NULL, NULL),
(4, 'Solitaire', NULL, 'solitaire', NULL, '2020-12-22 09:13:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `m_item_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '0 if menu is root level or menuid if this is child on any menu',
  `m_item_name` varchar(255) NOT NULL,
  `m_item_url` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 for disabled menu or 1 for enabled menu',
  `m_item_desc` varchar(500) NOT NULL,
  `m_item_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`m_item_id`, `m_id`, `parent_id`, `m_item_name`, `m_item_url`, `status`, `m_item_desc`, `m_item_created_at`) VALUES
(779, 2, 0, 'Blog', 'https://whitethoughtsdemos.com/anaya/blog', '1', '', '2020-10-08 11:39:37'),
(780, 2, 0, 'Contact us', 'https://whitethoughtsdemos.com/anaya/contact_us', '1', '', '2020-10-08 11:39:37'),
(781, 4, 0, 'Men', '#', '1', '', '2020-12-22 09:14:55'),
(782, 4, 781, 'Rings', '#', '1', '', '2020-12-22 09:14:55'),
(783, 4, 0, 'Women', '', '1', '', '2020-12-22 09:14:55'),
(784, 4, 783, 'Rings', '', '1', '', '2020-12-22 09:14:55'),
(2075, 3, 0, 'Jbn Exclusive', '', '1', '', '2021-04-09 05:37:57'),
(2076, 3, 2075, 'Gold', '', '1', '', '2021-04-09 05:37:57'),
(2077, 3, 2076, 'Men', '', '1', '', '2021-04-09 05:37:57'),
(2078, 3, 2077, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-04-09 05:37:57'),
(2079, 3, 2077, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains', '1', '', '2021-04-09 05:37:57'),
(2080, 3, 2077, 'Bracelets', 'https://whitethoughtsdemos.com/anaya/products/category/bracelets', '1', '', '2021-04-09 05:37:57'),
(2081, 3, 2076, 'women', '', '1', '', '2021-04-09 05:37:57'),
(2082, 3, 2081, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/', '1', '', '2021-04-09 05:37:57'),
(2083, 3, 2081, 'Nose Pins', 'https://whitethoughtsdemos.com/anaya/products/category/nose-pins/gold/women/jbn', '1', '', '2021-04-09 05:37:57'),
(2084, 3, 2081, 'chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains', '1', '', '2021-04-09 05:37:57'),
(2085, 3, 2075, 'Diamonds', '', '1', '', '2021-04-09 05:37:57'),
(2086, 3, 2085, 'Men', '', '1', '', '2021-04-09 05:37:57'),
(2087, 3, 2086, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains', '1', '', '2021-04-09 05:37:57'),
(2088, 3, 2086, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-04-09 05:37:57'),
(2089, 3, 2086, 'solitairs', 'https://whitethoughtsdemos.com/anaya/products/category/solitairs', '1', '', '2021-04-09 05:37:57'),
(2090, 3, 2085, 'Women', '', '1', '', '2021-04-09 05:37:57'),
(2091, 3, 2090, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-04-09 05:37:57'),
(2092, 3, 2090, 'Earings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings', '1', '', '2021-04-09 05:37:57'),
(2093, 3, 2090, 'bangles', 'https://whitethoughtsdemos.com/anaya/products/category/bangles', '1', '', '2021-04-09 05:37:57'),
(2094, 3, 2090, 'tops', 'https://whitethoughtsdemos.com/anaya/products/category/tops', '1', '', '2021-04-09 05:37:57'),
(2095, 3, 2090, 'pendents', 'https://whitethoughtsdemos.com/anaya/products/category/pendents/', '1', '', '2021-04-09 05:37:57'),
(2096, 3, 2090, 'necklaces', 'https://whitethoughtsdemos.com/anaya/products/category/necklaces/', '1', '', '2021-04-09 05:37:57'),
(2097, 3, 2090, 'chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/', '1', '', '2021-04-09 05:37:57'),
(2098, 3, 2075, 'Polki', '', '1', '', '2021-04-09 05:37:57'),
(2099, 3, 2098, 'Men', '', '1', '', '2021-04-09 05:37:57'),
(2100, 3, 2099, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-04-09 05:37:57'),
(2101, 3, 2098, 'Women', '', '1', '', '2021-04-09 05:37:57'),
(2102, 3, 2101, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-04-09 05:37:57'),
(2103, 3, 2101, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-04-09 05:37:57'),
(2104, 3, 2101, 'Necklaces', 'https://whitethoughtsdemos.com/anaya/products/category/necklaces/', '1', '', '2021-04-09 05:37:57'),
(2105, 3, 2101, 'Pendent', 'https://whitethoughtsdemos.com/anaya/products/category/pendent', '1', '', '2021-04-09 05:37:57'),
(2106, 3, 2101, 'Bangles', 'https://whitethoughtsdemos.com/anaya/products/category/bangles', '1', '', '2021-04-09 05:37:57'),
(2107, 3, 0, 'Anaya', '', '1', '', '2021-04-09 05:37:57'),
(2108, 3, 2107, 'Gold', '', '1', '', '2021-04-09 05:37:57'),
(2109, 3, 2108, 'Men', '', '1', '', '2021-04-09 05:37:57'),
(2110, 3, 2108, 'Women', '', '1', '', '2021-04-09 05:37:57'),
(2111, 3, 2110, 'Bangle', 'https://whitethoughtsdemos.com/anaya/products/category/Bangle/', '1', '', '2021-04-09 05:37:57'),
(2112, 3, 2110, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/', '1', '', '2021-04-09 05:37:57'),
(2113, 3, 2110, 'Necklace', 'https://whitethoughtsdemos.com/anaya/products/category/necklace', '1', '', '2021-04-09 05:37:57'),
(2114, 3, 2110, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring', '1', '', '2021-04-09 05:37:57'),
(2115, 3, 2110, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-04-09 05:37:57'),
(2116, 3, 2107, 'Diamonds', '', '1', '', '2021-04-09 05:37:57'),
(2117, 3, 2116, 'Men', 'Women', '1', '', '2021-04-09 05:37:57'),
(2118, 3, 2117, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/Bangle/', '1', '', '2021-04-09 05:37:57'),
(2119, 3, 2117, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-04-09 05:37:57'),
(2120, 3, 2116, 'Women', '', '1', '', '2021-04-09 05:37:57'),
(2121, 3, 2120, 'Bangle', 'https://whitethoughtsdemos.com/anaya/products/category/Bangle/', '1', '', '2021-04-09 05:37:57'),
(2122, 3, 2120, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/', '1', '', '2021-04-09 05:37:57'),
(2123, 3, 2120, 'Pendents', 'https://whitethoughtsdemos.com/anaya/products/category/pendents/', '1', '', '2021-04-09 05:37:57'),
(2124, 3, 2120, 'Necklace', 'https://whitethoughtsdemos.com/anaya/products/category/necklace/', '1', '', '2021-04-09 05:37:57'),
(2125, 3, 2120, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-04-09 05:37:57'),
(2126, 3, 2120, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-04-09 05:37:57'),
(2127, 3, 2107, 'Polki', '', '1', '', '2021-04-09 05:37:57'),
(2128, 3, 2127, 'Men', '', '1', '', '2021-04-09 05:37:57'),
(2129, 3, 2128, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-04-09 05:37:57'),
(2130, 3, 2128, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/', '1', '', '2021-04-09 05:37:57'),
(2131, 3, 2127, 'Women', '', '1', '', '2021-04-09 05:37:57'),
(2132, 3, 2131, 'Bangle', 'https://whitethoughtsdemos.com/anaya/products/category/bangle/', '1', '', '2021-04-09 05:37:57'),
(2133, 3, 2131, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/polki/women', '1', '', '2021-04-09 05:37:57'),
(2134, 3, 2131, 'Pendent', 'https://whitethoughtsdemos.com/anaya/products/category/pendent/', '1', '', '2021-04-09 05:37:57'),
(2135, 3, 2131, 'Necklace', 'https://whitethoughtsdemos.com/anaya/products/category/necklace/', '1', '', '2021-04-09 05:37:57'),
(2136, 3, 2131, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-04-09 05:37:57'),
(2137, 3, 2131, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-04-09 05:37:57'),
(2138, 3, 0, 'Solitaires', '#', '1', '', '2021-04-09 05:37:57'),
(2139, 3, 2138, 'Gold', '#', '1', '', '2021-04-09 05:37:57'),
(2140, 3, 2139, 'Men', '#', '1', '', '2021-04-09 05:37:57'),
(2141, 3, 2139, 'Women', '', '1', '', '2021-04-09 05:37:57'),
(2142, 3, 2138, 'Diamonds', '#', '1', '', '2021-04-09 05:37:57'),
(2143, 3, 2142, 'Men', '#', '1', '', '2021-04-09 05:37:57'),
(2144, 3, 2142, 'Women', '#', '1', '', '2021-04-09 05:37:57');

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
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `status`, `added_on`) VALUES
(1, 'venkat@deepredink.com', '1', '2020-10-05 11:07:12'),
(2, 'jayaraju@deepredink.com', '1', '2020-10-05 12:45:03'),
(6, 'jayaraju123@gmail.com', '1', '2020-10-06 02:52:16'),
(7, 'jayaraju1234@gmail.com', '1', '2020-10-07 05:35:35'),
(8, 'rajkumar@deepredink.com', '1', '2021-01-21 08:39:38');

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
(2, 'Gold Purity', 'Yes', 1, 'gold-purity'),
(3, 'Size', 'No', 0, 'size'),
(5, 'Diamond Clarity', 'No', 4, 'diamond-clarity'),
(6, 'Polish Details', 'Yes', 1, 'polish-details'),
(7, 'Pearls', 'No', 0, 'pearls'),
(8, 'Gemstone', 'No', 0, 'gemstone'),
(9, 'Diamond Shape', 'No', 4, 'diamond-shape'),
(10, 'Diamond Certified', 'No', 4, 'diamond-certified'),
(11, 'Solitaire Color', 'Yes', 5, 'solitaire-color'),
(12, 'Solitaire Clarity', 'Yes', 5, 'solitaire-clarity'),
(13, 'Solitaire Cut', 'Yes', 5, 'solitaire-cut'),
(14, 'Solitaire Size', 'Yes', 5, 'solitaire-size'),
(15, 'Polki', 'Yes', 0, 'polki'),
(16, 'Beads', 'Yes', 0, 'beads'),
(17, 'Other', 'Yes', 0, 'other');

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
  `Shipping_Charges_Amount` float DEFAULT NULL,
  `Handling_Charges_Amount` float NOT NULL DEFAULT 0,
  `OrderShipName` varchar(100) NOT NULL,
  `OrderPhone` varchar(20) NOT NULL,
  `OrderShipping` tinyint(1) NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmall` varchar(100) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `shipping_Mobile` char(20) NOT NULL,
  `shipped_by_id` int(11) DEFAULT 0,
  `shipped_traking_no` varchar(50) DEFAULT NULL,
  `shipping_to_date` datetime DEFAULT current_timestamp(),
  `cancelled_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderlD`, `UserlD`, `CartID`, `PaymentID`, `Order_Number`, `CouponID`, `OrderAmount`, `Shipping_Charges_Amount`, `Handling_Charges_Amount`, `OrderShipName`, `OrderPhone`, `OrderShipping`, `OrderTax`, `OrderEmall`, `OrderDate`, `OrderShipped`, `OrderTrackingNumber`, `Delivery_Mode`, `DeliveryDate`, `Order_status`, `billing_Fullname`, `billing_Address1`, `billing_Address2`, `billing_LandMark`, `billing_City`, `billing_Pincode`, `billing_State`, `billing_Country`, `billing_Mobile`, `shipping_Fullname`, `shipping_Address1`, `shipping_Address2`, `shipping_LandMark`, `shipping_City`, `shipping_Pincode`, `shipping_State`, `shipping_Country`, `shipping_Mobile`, `shipped_by_id`, `shipped_traking_no`, `shipping_to_date`, `cancelled_remarks`) VALUES
(1, 10, 1, 'pay_GnmPr9Hp4SR4Uq', '20210317213006', 0, 245790, 0, 2000, 'Harish ', '', 0, 0, 'harish.babu@deepredink.com', '2021-03-17 16:00:06', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'confirmed', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '09032555564', 0, NULL, '2021-03-31 06:02:24', NULL),
(2, 10, 3, 'pay_Gnms91zqdzLV9W', '20210317215731', 0, 399999, 0, 2000, 'Harish ', '', 0, 0, 'harish.babu@deepredink.com', '2021-03-17 16:27:31', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'dispatched', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564', 'Harish Babu Gorantla', 'Fno 602, Block-3, Sri sairam gardens', 'Madhuranagar, Yousufguda', '', 'Hyderabad', '500038', 'Telangana', 'India', '9032555564', 0, NULL, '2021-03-31 06:02:24', NULL);

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
  `Quantity` int(11) NOT NULL DEFAULT 1,
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
(1, 1, '', '', 4, 'NVN 6', 245790, 245790, 'NVN 6', 1, 0, '', 245790, 245790, '', 0),
(2, 2, '', '', 775, 'Waist chain by Nikita', 500000, 399999, '232445', 1, 0, '', 399999, 500000, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_gift_messages`
--

CREATE TABLE `order_gift_messages` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `gift_special_message` text DEFAULT NULL,
  `gift_message_packaging` text DEFAULT NULL,
  `gift_email` varchar(150) DEFAULT NULL,
  `gift_for` char(20) DEFAULT NULL,
  `get_for_updates` char(5) DEFAULT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_gift_messages`
--

INSERT INTO `order_gift_messages` (`ID`, `UserID`, `OrderID`, `gift_special_message`, `gift_message_packaging`, `gift_email`, `gift_for`, `get_for_updates`, `Addedon`) VALUES
(1, 10, 0, '', '', 'harish.gorantla123@gmail.com', 'sister', 'on', '2021-03-17 16:01:01'),
(2, 10, 0, '', '', 'harish.gorantla123@gmail.com', 'sister', 'on', '2021-03-17 16:24:34'),
(3, 10, 0, '', '', 'harish.gorantla123@gmail.com', 'sister', 'on', '2021-03-17 16:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `order_status_log`
--

CREATE TABLE `order_status_log` (
  `id` int(11) NOT NULL,
  `OrderlD` int(11) NOT NULL,
  `UserlD` int(11) NOT NULL,
  `PaymentID` varchar(50) NOT NULL,
  `OrderEmall` varchar(100) NOT NULL,
  `OrderShipName` varchar(255) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `Order_status` varchar(50) NOT NULL,
  `shipped_by_id` int(11) DEFAULT NULL,
  `shipped_traking_no` varchar(50) DEFAULT NULL,
  `shipping_to_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `cancelled_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(5, 'Refund Policy', 'Refund Policy', 'refund-policy', '<p> </p>\r\n\r\n<p><span xss=removed><span xss=removed><span xss=removed>Return within 7 days will be accepted offering 100% refund deducting the shipping cost. </span></span></span></p>\r\n\r\n<ul>\r\n <li xss=removed><span xss=removed><span xss=removed><span xss=removed>The refund policy will be accepted only if the return request is made within 7 days and shipped back to us within 14 days.</span></span></span></li>\r\n <li xss=removed><span xss=removed><span xss=removed><span xss=removed>The return of the product will only be accepted with its product certificate and invoice. If either of them is not presented, it will result in a deduction of some amount depending on the product.</span></span></span></li>\r\n <li xss=removed><span xss=removed><span xss=removed><span xss=removed>The product has to be returned with its tag, without which the refund will be subjected to different conditions.</span></span></span></li>\r\n <li xss=removed><span xss=removed><span xss=removed><span xss=removed>The product can be returned either through website or at the store. </span></span></span></li>\r\n <li xss=removed><span xss=removed><span xss=removed><span xss=removed>This refund policy is not applicable on customized ornaments, gem stones and gift cards/gift vouchers.</span></span></span></li>\r\n <li xss=removed><span xss=removed><span xss=removed><span xss=removed>This refund policy will be applicable only on the basis of our quality inspection.</span></span></span></li>\r\n</ul>\r\n\r\n<p> </p>\r\n\r\n<p><span xss=removed><span xss=removed><span xss=removed>Before making a refund, contact our customer care team and inform the details of the item you wish to return along with the order no.</span></span></span></p>', 'Refund Policy', '', 0),
(6, 'Shipping and Delivery Policy', 'Shipping and Delivery Policy', 'shipping-and-delivery-policy', '<p> </p>\r\n\r\n<p>We offer FREE shipping on every order only within India. Your order will be shipped to you fully insured. We urge all customers to inspect the package for any damage or tamper before receiving or signing for receipt.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our Indian customers, after your item has been packaged, it will be shipped and delivered free via one of the following carriers.</div>\r\n\r\n<div class=\"col-sm-6 shipping-products\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/b0749d0d9b944e2cb5a90394c9263d4b.png\"></div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our International customers, after your item has been packaged, it will be shipped and delivered via the following carrier. The shipping charges for our international customers are charged at the time of order booking.</div>\r\n\r\n<div class=\"col-sm-6 shipping-products\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/a1e46a88e47b41a0be37d3f609ea1805.png\"></div>\r\n</div>\r\n<br>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'Shipping and delivery', '', 0),
(7, 'How it Works', 'How it works', 'how-it-works', '<p> </p>\r\n\r\n<h3><strong>Navigation:</strong></h3>\r\n\r\n<p>All the product Categories and Sub-categories as listed in the header on top. Choose the Categories or the sub-categories by clicking on them and all the products listed under those categories will be shown.</p>\r\n\r\n<p>The topmost navigation bar shows the number of products in your Cart, along with Wishlist and Login links.</p>\r\n\r\n<p>Click on the Login button to login or register on our website. After loging-in, the same button holds the links to your Account and Orders. Use these links to view and update your account details, change password, track/cancel orders etc.  </p>\r\n\r\n<p>You can return to the homepage anytime the clicking on the \"Anaya Logo\" in the header or by clicking on the \"home\" link.</p>\r\n\r\n<p>A lot of useful links have also been provided in the footer, including our helpline number and email.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Exploring Products:</strong></h3>\r\n\r\n<p>Click on your preferred category/sub-category link in the header to view products listed under them. You can also click on the \"Collections\" link in the header to explore the store and look at latest deals and new-arrivals.</p>\r\n\r\n<p>Clicking on individual product will take you to the product page, where you can get all the information about the product, like its price, discount, description, attributes, photographs etc.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Adding Products to your Cart:</strong></h3>\r\n\r\n<p>While on the product page, choose one of the available sizes(s,m,l,xl,xxl) and the desired quantity and click on the \"Add to Cart\" button to add that product to your virtual cart.</p>\r\n\r\n<p>A notification box will flash, confirming your product has been added to your cart and the number of products in your cart will get updated, which can be noticed in the header.</p>\r\n\r\n<p>You can review the items in your cart anytime, by clicking on the cart symbol in the top-most part of the header. The cart page will show you the list of products in your cart and their cost information.</p>\r\n\r\n<p>If you wish to increase or descrease the quantity of a product in your cart, simply edit the number in the column against that product and your cart will be updated automatically.</p>\r\n\r\n<p>You can remove a product from your cart, by simply clicking the X symbol in the last column against that product and it will be removed from your cart.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Wishlist:</strong></h3>\r\n\r\n<p>You can also click on the \"Add to wishlist\" button instead of \"Add to cart\", if you decide to make the purchase at a later date. Your wishlist will be saved in our system and you can access the list anytime by clicking on the \"heart\" symbol in the header.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Online Payment Process:</strong></h3>\r\n\r\n<p>Online payment options like credit-card, debit-card, VISA, Netbanking etc. are available in our payment gateway.</p>\r\n\r\n<p>PayPal option is available for international payments.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Cash on Delivery:</strong></h3>\r\n\r\n<p>In select cities, we offer the option of paying Cash on Delivery. Simply choose the \"Cash on Delivery\" option as your payment mode(if it is available in your city), and submit your order and you can pay for your order only after it arrives at your doorstep.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Tracking Your Orders:</strong></h3>\r\n\r\n<p>Once your order is dispatched, you can login to you account and track your package&#39;s location and the estimated time of arrival, almost in realtime. </p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Grievances and Feedback:</strong></h3>\r\n\r\n<p>You can email us your concerns, complaints and grievances to: <a href=\"mailto:eshop@taruni.in\">eshop@a</a>nayajwelley.com or Call us at: <strong>+91 9999999999</strong></p>\r\n\r\n<p> </p>', 'Anaya how its work', '', 0),
(12, 'Insurance policy', 'insurance', 'insurance-policy', '<p> </p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'insurance', '', 0),
(13, 'Life Time Exchange And Buyback Policy', 'LIFETIME EXCHANGE AND BUYBACK POLICY', 'life-time-exchange-and-buyback-policy', '<p> </p>\r\n\r\n<p>We offer a Lifetime Exchange & Buy-Back Policy on all purchases* made from our website, within India. The product along with the original product certificate, can be returned or exchanged at 90% of the diamond value, 100% of the current market value of gold with deductions towards making charges and taxes and no value for the gem stones.</p>\r\n\r\n<p>This means your product&#39;s current value of metal, diamonds and coloured stones, will be determined based on product specifications and the current price listed on our website. </p>\r\n\r\n<p>Lifetime Exchange: </p>\r\n\r\n<p>The value of the exchanged product after deductions towards making charges and discounts will be credited to your Anaya account. This remains valid for 90 days and can be used to purchase anything on our website. The value cannot be encashed. </p>\r\n\r\n<p>Lifetime Buy Back Policy:</p>\r\n\r\n<p>If you choose to return the product, we will refund 80% of the diamond value, 100% of the gold value with deductions towards making charges and taxes and no refund for the value of the gem stones. Refund will be made via online bank transfer within 10 to 12 days of receipt of the product.</p>\r\n\r\n<p>Jewellery returned showing signs of alteration by anyone other than Anaya shall not be accepted for return. Based on our quality inspection, we reserve the right to change the Buy-Back amount of the product.</p>', '', '', 0),
(14, 'Cancellation Policy', 'Cancellation Policy', 'cancellation-policy', '<p> </p>\r\n\r\n<p><span xss=removed><span xss=removed><span xss=removed>You can only cancel the product that you have ordered within 24 hours of placing it. After 24 hours, there is no option of cancellation and you could resort to refund policy after receiving your order. </span></span></span></p>\r\n\r\n<p><span xss=removed><span xss=removed><span xss=removed>Important Note: All packages shipped to our customers are insured by our delivery partner. In cases of missing parcels, you can reach out to us, however Jewellery by Nikitha does not take responsibility for goods damaged or missing from the sealed box in transit.</span></span></span></p>\r\n\r\n<p> </p>', '', '', 0);

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
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
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
(1, 'pay_GnmPr9Hp4SR4Uq', 10, 0, '20210317213006', 0, '0', 1615996956, 'Harish ', 'harish.gorantla123@gmail.com', '+919032555564', 247790, '2021-03-17 09:32:47', 'INR', '1615996878', 'authorized', '', '49.205.237.131', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_GnmPr9Hp4SR4Uq\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":409,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":3.504748999999999892196456130477599799633026123046875,\"namelookup_time\":0.282100999999999990652810311075882054865360260009765625,\"connect_time\":2.52396699999999984953547027544118463993072509765625,\"pretransfer_time\":3.107610999999999901177716310485266149044036865234375,\"size_upload\":0,\"size_download\":648,\"speed_download\":184,\"speed_upload\":0,\"download_content_length\":648,\"upload_content_length\":0,\"starttransfer_time\":3.5046569999999999112105797394178807735443115234375,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"15.207.141.186\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":52408,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":3107521,\"connect_time_us\":2523967,\"namelookup_time_us\":282101,\"pretransfer_time_us\":3107611,\"redirect_time_us\":0,\"starttransfer_time_us\":3504657,\"total_time_us\":3504749,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_GnmPr9Hp4SR4Uq\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":24779000,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20210317213006\\\",\\\"card_id\\\":\\\"card_GnmPrEU8OrBMJM\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"harish.gorantla123@gmail.com\\\",\\\"contact\\\":\\\"+919032555564\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20210317213006\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"531703\\\"},\\\"created_at\\\":1615996956}\"}', 'payment', '0', '2021-03-17 09:32:47', '', 'Purchase Order # 20210317213006', 'true', 247790),
(2, 'pay_Gnms91zqdzLV9W', 10, 0, '20210317215731', 0, '0', 1615998563, 'Harish ', 'harish.gorantla123@gmail.com', '+919032555564', 401999, '2021-03-17 10:00:17', 'INR', '1615998464', 'authorized', '', '49.205.237.131', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_Gnms91zqdzLV9W\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":409,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":1.7801810000000000133724142870050854980945587158203125,\"namelookup_time\":0.008791000000000000202948768901478615589439868927001953125,\"connect_time\":0.2040949999999999986410870178588083945214748382568359375,\"pretransfer_time\":1.3249679999999999235882341963588260114192962646484375,\"size_upload\":0,\"size_download\":648,\"speed_download\":364,\"speed_upload\":0,\"download_content_length\":648,\"upload_content_length\":0,\"starttransfer_time\":1.7801009999999999333653022404178045690059661865234375,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"13.235.184.242\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":43608,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":1324865,\"connect_time_us\":204095,\"namelookup_time_us\":8791,\"pretransfer_time_us\":1324968,\"redirect_time_us\":0,\"starttransfer_time_us\":1780101,\"total_time_us\":1780181,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_Gnms91zqdzLV9W\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":40199900,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20210317215731\\\",\\\"card_id\\\":\\\"card_GnmPrEU8OrBMJM\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"harish.gorantla123@gmail.com\\\",\\\"contact\\\":\\\"+919032555564\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20210317215731\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"756751\\\"},\\\"created_at\\\":1615998563}\"}', 'payment', '0', '2021-03-17 10:00:17', '', 'Purchase Order # 20210317215731', 'true', 401999);

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
(15, 6, 'Yellow gold'),
(16, 6, 'White gold'),
(17, 7, 'Pearls'),
(18, 7, 'Diamond Beads'),
(19, 7, 'Black Beads'),
(21, 8, 'Colour Stone'),
(22, 9, 'Round'),
(23, 10, 'IGI'),
(24, 9, 'Baguette'),
(25, 9, 'Marquise'),
(26, 9, 'Rosecut'),
(27, 6, 'Rose gold and white gold'),
(28, 10, 'Non Certified diamonds'),
(29, 9, 'Pears'),
(30, 6, 'Yellow gold and white gold'),
(31, 6, 'White gold and yellow gold'),
(32, 11, 'D'),
(33, 11, 'E'),
(34, 11, 'F'),
(35, 11, 'G'),
(36, 11, 'H'),
(37, 11, 'I'),
(38, 11, 'J'),
(39, 11, 'K'),
(40, 11, 'L'),
(41, 11, 'M'),
(42, 11, 'N'),
(43, 11, 'O'),
(44, 11, 'P'),
(45, 11, 'Q'),
(46, 11, 'R'),
(47, 11, 'S'),
(48, 11, 'T'),
(49, 11, 'U'),
(50, 11, 'V'),
(51, 11, 'W'),
(52, 11, 'X'),
(53, 11, 'Y'),
(54, 11, 'Z'),
(55, 11, 'Z+'),
(56, 12, 'FI'),
(57, 12, 'IF'),
(58, 12, 'VVS1'),
(59, 12, 'VVS2'),
(60, 12, 'VS1'),
(61, 12, 'VS2'),
(62, 12, 'SI1'),
(63, 12, 'SI2'),
(64, 12, 'I1'),
(65, 12, 'I2'),
(66, 12, 'I3'),
(67, 13, 'Excellent'),
(68, 13, 'Very Good'),
(69, 13, 'Good'),
(70, 13, 'Fair'),
(71, 14, '10 cents'),
(72, 14, '20 cents'),
(73, 14, '30 cents'),
(74, 14, '40 cents'),
(75, 14, '50 cents'),
(76, 14, '60 cents'),
(77, 14, '70 cents'),
(78, 14, '80 cents'),
(79, 14, '90 cents'),
(80, 14, '1 carat'),
(81, 15, 'Polki'),
(82, 15, 'Polki 1'),
(83, 15, 'Rosecut'),
(84, 16, 'Emerald beads'),
(85, 17, 'wax'),
(86, 5, 'VVS'),
(87, 2, '22 Kt'),
(88, 2, '24 Kt'),
(90, 8, 'Emerald'),
(91, 8, 'Tanzanites'),
(92, 8, 'Jade'),
(93, 8, 'coral'),
(94, 8, 'tormaline'),
(95, 8, 'blue sapphire'),
(96, 8, 'Ruby'),
(97, 9, 'Diamond'),
(99, 7, 'pearls - S'),
(100, 7, 'Pearl-S'),
(101, 9, 'Rose Cut'),
(102, 17, 'Dori'),
(103, 16, 'EM Bead'),
(105, 16, 'EM Beads'),
(106, 16, 'Dia Beads'),
(107, 8, 'COLOR STONE'),
(108, 6, 'white gold/rose gold'),
(109, 9, 'marquies'),
(110, 9, 'bagguate'),
(112, 6, 'white gold/yellow gold'),
(113, 2, '20 Kt'),
(114, 6, 'Yellow Gold/white gold'),
(115, 6, 'white gold/ rose gold'),
(116, 9, 'Oval'),
(117, 6, 'yellow gold,Rose gold'),
(118, 9, 'Princes'),
(119, 8, 'COLORSTONE'),
(120, 9, 'Princess');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `MRP_Price` double NOT NULL,
  `Price` double NOT NULL,
  `included_handling_charge` float DEFAULT 2000,
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
  `product_video_url` varchar(255) DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `Sub_CategorylD` int(11) NOT NULL,
  `UpdateDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Stock` float DEFAULT NULL,
  `Productlive` tinyint(4) DEFAULT 1 COMMENT '1=Yes,0=No',
  `Provision_for_opening` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Gender` enum('Women','Men') NOT NULL,
  `Collection` varchar(100) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modifiedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `AddedBy` varchar(50) DEFAULT NULL,
  `AddedByIP` varchar(20) DEFAULT NULL,
  `OptionGroupID` int(11) NOT NULL,
  `Material_type` int(11) NOT NULL,
  `No_of_pieces` float NOT NULL,
  `Gross_weight` float NOT NULL,
  `Net_weight` float NOT NULL,
  `Polish_Details` varchar(250) NOT NULL,
  `product_type` varchar(50) DEFAULT NULL,
  `sub_product_type` varchar(50) NOT NULL,
  `is_make_an_order` char(10) NOT NULL DEFAULT 'no',
  `chain_length` float DEFAULT NULL,
  `certificate_number` varchar(50) DEFAULT NULL,
  `mould_availability` tinyint(11) DEFAULT NULL,
  `cad_availability` tinyint(4) DEFAULT NULL,
  `SEOTitle` varchar(100) DEFAULT NULL,
  `SEODesc` varchar(200) DEFAULT NULL,
  `SEOKeywords` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `included_handling_charge`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `product_video_url`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `product_type`, `sub_product_type`, `is_make_an_order`, `chain_length`, `certificate_number`, `mould_availability`, `cad_availability`, `SEOTitle`, `SEODesc`, `SEOKeywords`) VALUES
(1, 'NVN 3', 'NVN 3', 'nvn-3', 568914.15, 568914.15, 0, 'gram', 875, 'gross_weight', 0, 1.812, 24, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:22', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:22', '2021-03-17 05:48:22', 'whitethoughts', '157.47.65.89', 0, 1, 1, 127.49, 120.358, 'Yellow Gold', '', '', '', 9, '17J455232005', 0, 0, '', '', ''),
(2, 'NVN 4', 'NVN 4', 'nvn-4', 520912.7, 520912.7, 0, 'gram', 875, 'gross_weight', 0, 1.347, 26, 0, '', 'Diamond Necklace', '', '', '', 'https://www.youtube.com/embed/QRpeLJ-jlN8', 6, 28, '2021-03-17 07:12:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 07:12:02', '', '', 0, 1, 1, 117.38, 110.054, 'Yellow Gold', 'anaya', '', '', 11, '17J698112005', 0, 0, '', '', ''),
(3, 'NVN 5', 'NVN 5', 'nvn-5', 579080.35, 579080.35, 0, 'gram', 875, 'gross_weight', 0, 2.656, 20, 0, '', 'Diamond Necklace', '', '', '', 'https://www.youtube.com/embed/-pe5tk2ft88', 6, 28, '2021-03-17 07:13:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 07:13:42', '', '', 0, 1, 1, 127.93, 122.932, 'Yellow Gold', 'anaya', '', '', 8, '17J836642006', 0, 0, '', '', ''),
(4, 'NVN 6', 'NVN 6', 'nvn-6', 245789.95, 245789.95, 0, 'gram', 875, 'gross_weight', 0, 1.36, 19, 1, '', 'Diamond Necklace', '', '', '', 'https://www.youtube.com/embed/WealuoAZ1fI', 6, 28, '2021-03-17 07:01:56', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 07:01:56', '', '', 0, 1, 1, 56.49, 51.674, 'Yellow Gold', 'anaya', '', '', 8, '28J223601809', 0, 0, '', '', ''),
(5, 'NVN 7', 'NVN 7', 'nvn-7', 552440.45, 552440.45, 0, 'gram', 875, 'gross_weight', 0, 1.359, 24, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 131.35, 115.134, 'Yellow Gold', '', '', '', 10, '18J034402006', 0, 0, '', '', ''),
(6, 'NVN 9', 'NVN 9', 'nvn-9', 439419.3, 439419.3, 0, 'gram', 875, 'gross_weight', 0, 1.6, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 97.5, 93.186, 'Yellow Gold', '', '', '', 9, '28J345471809', 0, 0, '', '', ''),
(7, 'NVN 10', 'NVN 10', 'nvn-10', 586843.75, 586843.75, 0, 'gram', 875, 'gross_weight', 0, 1.619, 24, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 133.25, 123.75, 'Yellow Gold', '', '', '', 10, '18J003552006', 0, 0, '', '', ''),
(8, 'NVN 11', 'NVN 11', 'nvn-11', 322821.2, 322821.2, 0, 'gram', 975, 'gross_weight', 0, 1.64, 6, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 72.8, 66.274, 'Rose gold and white gold', '', '', '', 8, '21J206231908', 0, 0, '', '', ''),
(9, 'NVN 13', 'NVN 13', 'nvn-13', 342004, 342004, 0, 'gram', 875, 'gross_weight', 0, 1.187, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 75.44, 72.63, 'Yellow Gold', '', '', '', 0, '18J043972006', 0, 0, '', '', ''),
(10, 'NVN 17', 'NVN 17', 'nvn-17', 504825.1, 504825.1, 0, 'gram', 875, 'gross_weight', 0, 1.607, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 112.9, 106.852, 'Yellow Gold', '', '', '', 7, '29J455201810/29J455191810', 0, 0, '', '', ''),
(11, 'NVN 23', 'NVN 23', 'nvn-23', 229440.2, 229440.2, 0, 'gram', 875, 'gross_weight', 0, 2.18, 4.5, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 57, 47.254, 'Yellow Gold', '', '', '', 10, '34J730021701', 0, 0, '', '', ''),
(12, 'NVN 27', 'NVN 27', 'nvn-27', 107949.45, 107949.45, 0, 'gram', 875, 'gross_weight', 0, 0.92, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 24.51, 22.764, 'Yellow Gold', '', '', '', 9, 'I5J595770916', 0, 0, '', '', ''),
(13, 'NVN 28', 'NVN 28', 'nvn-28', 202795.05, 202795.05, 0, 'gram', 875, 'gross_weight', 0, 1.01, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 46.43, 42.676, 'Yellow Gold', '', '', '', 8, '25J844341709', 0, 0, '', '', ''),
(14, 'NVN 30', 'NVN 30', 'nvn-30', 94039.5, 94039.5, 0, 'gram', 875, 'gross_weight', 0, 1.32, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 20.66, 19.99, 'Yellow Gold', '', '', '', 9, 'I2J292820615', 0, 0, '', '', ''),
(15, 'NVN 32', 'NVN 32', 'nvn-32', 149813.6, 149813.6, 0, 'gram', 875, 'gross_weight', 0, 1.2669, 17, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 34.32, 31.522, 'Yellow Gold', '', '', '', 8, '26J034281808', 0, 0, '', '', ''),
(16, 'NVN 33', 'NVN 33', 'nvn-33', 80901.15, 80901.15, 0, 'gram', 875, 'gross_weight', 0, 0.389, 17, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 17.77, 17.198, 'Yellow Gold', '', '', '', 9, 'I1J120940614', 0, 0, '', '', ''),
(17, 'NVN 35', 'NVN 35', 'nvn-35', 116286.6, 116286.6, 0, 'gram', 875, 'gross_weight', 0, 1.33, 14, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 26.36, 24.532, 'Yellow Gold', '', '', '', 7, '27J193641709', 0, 0, '', '', ''),
(18, 'NVN 38', 'NVN 38', 'nvn-38', 212001.5, 212001.5, 0, 'gram', 875, 'gross_weight', 0, 1.007, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 47.38, 44.88, 'Yellow Gold', '', '', '', 8, '23J505641807', 0, 0, '', '', ''),
(19, 'NVN 50', 'NVN 50', 'nvn-50', 286525, 286525, 0, 'gram', 875, 'gross_weight', 0, 1.703, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 67.32, 59.9, 'Yellow Gold', '', '', '', 9, '28J812081810', 0, 0, '', '', ''),
(20, 'NVN 52', 'NVN 52', 'nvn-52', 184052.85, 184052.85, 0, 'gram', 875, 'gross_weight', 0, 0.608, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 42.79, 38.582, 'Yellow Gold', '', '', '', 8, '28J618591809', 0, 0, '', '', ''),
(21, 'NVN 53', 'NVN 53', 'nvn-53', 249062.25, 249062.25, 0, 'gram', 875, 'gross_weight', 0, 1.209, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 56.99, 52.42, 'Yellow Gold', '', '', '', 8, '25J256071808', 0, 0, '', '', ''),
(22, 'NVN 58', 'NVN 58', 'nvn-58', 262332.4, 262332.4, 0, 'gram', 875, 'gross_weight', 0, 1.72, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 62.48, 54.648, 'Yellow Gold', '', '', '', 8, '25J080291808', 0, 0, '', '', ''),
(23, 'NVN 62', 'NVN 62', 'nvn-62', 378416.15, 378416.15, 0, 'gram', 875, 'gross_weight', 0, 1.775, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 87.01, 79.548, 'Yellow Gold', '', '', '', 9, 'I2J285050515', 0, 0, '', '', ''),
(24, 'NVN 63', 'NVN 63', 'nvn-63', 427388.6, 427388.6, 0, 'gram', 875, 'gross_weight', 0, 1.67, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 95.32, 90.522, 'Yellow Gold', '', '', '', 7, '33J086981712', 0, 0, '', '', ''),
(25, 'NVN 67', 'NVN 67', 'nvn-67', 456378.85, 456378.85, 0, 'gram', 875, 'gross_weight', 0, 2.484, 28, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 106.39, 95.602, 'Yellow Gold', '', '', '', 8, 'I5J573730816', 0, 0, '', '', ''),
(26, 'NVN 69', 'NVN 69', 'nvn-69', 127368.9, 127368.9, 0, 'gram', 875, 'gross_weight', 0, 0.87, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 30.14, 26.578, 'Yellow Gold', '', '', '', 8, 'I1J119250614', 0, 0, '', '', ''),
(27, 'NVN 71', 'NVN 71', 'nvn-71', 88414.35, 88414.35, 0, 'gram', 875, 'gross_weight', 0, 0.983, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 26.73, 17.112, 'Yellow Gold', '', '', '', 0, 'I5J541260616/I5J541260616', 0, 0, '', '', ''),
(28, 'NVN 73', 'NVN 73', 'nvn-73', 65505.9, 65505.9, 0, 'gram', 875, 'gross_weight', 0, 0.485, 17, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 14.42, 13.918, 'Yellow Gold', '', '', '', 9, 'I6J602671016', 0, 0, '', '', ''),
(29, 'NVN 78', 'NVN 78', 'nvn-78', 82555.6, 82555.6, 0, 'gram', 875, 'gross_weight', 0, 0.551, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 18.08, 17.562, 'Yellow Gold', '', '', '', 8, 'I5J584280916', 0, 0, '', '', ''),
(30, 'NVN 79', 'NVN 79', 'nvn-79', 127240.05, 127240.05, 0, 'gram', 875, 'gross_weight', 0, 0.612, 15, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 27.83, 27.076, 'Yellow Gold', '', '', '', 8, '27J020941709', 0, 0, '', '', ''),
(31, 'NVN 83', 'NVN 83', 'nvn-83', 149344.15, 149344.15, 0, 'gram', 875, 'gross_weight', 0, 0.716, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 34.93, 31.258, 'Yellow Gold', '', '', '', 9, 'I1J140460714', 0, 0, '', '', ''),
(32, 'NVN 87', 'NVN 87', 'nvn-87', 330721.25, 330721.25, 0, 'gram', 1375, 'gross_weight', 0, 1.25, 15, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 65.31, 63.4, 'Rose gold and white gold', '', '', '', 8, '33J922851911', 0, 0, '', '', ''),
(33, 'NVN 90', 'NVN 90', 'nvn-90', 497928.3, 497928.3, 0, 'gram', 875, 'gross_weight', 0, 2.64, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.38, 130.716, 'Yellow Gold', '', '', '', 9, '22J261281707', 0, 0, '', '', ''),
(34, 'NVN 91', 'NVN 91', 'nvn-91', 280425, 280425, 0, 'gram', 875, 'gross_weight', 0, 1.868, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 65.56, 58.7, 'Yellow Gold', '', '', '', 9, '27J131321809', 0, 0, '', '', ''),
(35, 'NVN 95', 'NVN 95', 'nvn-95', 309703.95, 309703.95, 0, 'gram', 875, 'gross_weight', 0, 2.4, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 68.17, 65.804, 'Yellow Gold', '', '', '', 8, 'I6J633521216', 0, 0, '', '', ''),
(36, 'NVN 99', 'NVN 99', 'nvn-99', 269168.05, 269168.05, 0, 'gram', 875, 'gross_weight', 0, 1.97, 7.5, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 59.27, 57.186, 'Yellow Gold', '', '', '', 7, '15J836161803', 0, 0, '', '', ''),
(37, 'NVN 100', 'NVN 100', 'nvn-100', 402906.45, 402906.45, 0, 'gram', 875, 'gross_weight', 0, 2.7, 9, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 89.35, 85.454, 'Yellow Gold', '', '', '', 7, '17J581611804', 0, 0, '', '', ''),
(38, 'NVN 102', 'NVN 102', 'nvn-102', 551103.75, 551103.75, 0, 'gram', 875, 'gross_weight', 0, 2.51, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 134.53, 114.05, 'Yellow Gold', '', '', '', 8, '10J951931711', 0, 0, '', '', ''),
(39, 'NVN 105', 'NVN 105', 'nvn-105', 393423.45, 393423.45, 0, 'gram', 875, 'gross_weight', 0, 2.26, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 86.59, 83.594, 'Yellow Gold', '', '', '', 10, '16J265841804', 0, 0, '', '', ''),
(40, 'NVN 107', 'NVN 107', 'nvn-107', 212563.85, 212563.85, 0, 'gram', 1075, 'gross_weight', 0, 0.726, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 50.11, 41.762, 'Rose gold and white gold', '', '', '', 10, '27J099681809', 0, 0, '', '', ''),
(41, 'NVN 110', 'NVN 110', 'nvn-110', 399743.7, 399743.7, 0, 'gram', 875, 'gross_weight', 0, 0.699, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 92.38, 83.924, 'Yellow Gold', '', '', '', 9, '', 0, 0, '', '', ''),
(42, 'NVN 111', 'NVN 111', 'nvn-111', 325038.95, 325038.95, 0, 'gram', 875, 'gross_weight', 0, 2.56, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 78.53, 67.454, 'Yellow Gold', '', '', '', 8, '13J893911703', 0, 0, '', '', ''),
(43, 'NVN 113', 'NVN 113', 'nvn-113', 496003, 496003, 0, 'gram', 875, 'gross_weight', 0, 1.83, 19, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 113.64, 104.36, 'Yellow Gold', '', '', '', 9, '22J589751707/22J589741707', 0, 0, '', '', ''),
(44, 'NVN 114', 'NVN 114', 'nvn-114', 249245, 249245, 0, 'gram', 875, 'gross_weight', 0, 1.95, 7.5, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 57.72, 52.3, 'Yellow Gold', '', '', '', 10, '13J161681703', 0, 0, '', '', ''),
(45, 'NVN 115', 'NVN 115', 'nvn-115', 250762.5, 250762.5, 0, 'gram', 875, 'gross_weight', 0, 1.524, 19, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 59.02, 52.4, 'Yellow Gold', '', '', '', 8, 'I2J277820515', 0, 0, '', '', ''),
(46, 'NVN 117', 'NVN 117', 'nvn-117', 414465.35, 414465.35, 0, 'gram', 875, 'gross_weight', 0, 2.63, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 92.45, 87.782, 'Yellow Gold', '', '', '', 8, '29J885351710', 0, 0, '', '', ''),
(47, 'NVN 125', 'NVN 125', 'nvn-125', 422748.65, 422748.65, 0, 'gram', 875, 'gross_weight', 0, 0.864, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 95.55, 89.248, 'Yellow Gold', '', '', '', 9, '18J616411705', 0, 0, '', '', ''),
(48, 'NVN127', 'NVN127', 'nvn127', 327745.3, 327745.3, 0, 'gram', 875, 'gross_weight', 0, 0.768, 22, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 73.58, 69.306, 'Yellow Gold', '', '', '', 8, 'I2J259360415', 0, 0, '', '', ''),
(49, 'NVN 131', 'NVN 131', 'nvn-131', 450506.45, 450506.45, 0, 'gram', 875, 'gross_weight', 0, 1.546, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 101.19, 95.254, 'Yellow Gold', '', '', '', 8, '34J452951701/34J452931701', 0, 0, '', '', ''),
(50, 'NVN 133', 'NVN 133', 'nvn-133', 519711.5, 519711.5, 0, 'gram', 875, 'gross_weight', 0, 3.95, 8, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:23', '2021-03-17 05:48:23', 'whitethoughts', '157.47.65.89', 0, 1, 1, 118.5, 109.48, 'Yellow Gold', '', '', '', 7, '33J532261812', 0, 0, '', '', ''),
(51, 'NVN 136', 'NVN 136', 'nvn-136', 583840.95, 583840.95, 0, 'gram', 875, 'gross_weight', 0, 2.9, 8, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 130.93, 123.494, 'Yellow Gold', '', '', '', 8, '32J308161811', 0, 0, '', '', ''),
(52, 'NVN 138', 'NVN 138', 'nvn-138', 381282.75, 381282.75, 0, 'gram', 875, 'gross_weight', 0, 2.25, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 86.89, 80.33, 'Yellow Gold', '', '', '', 7, '33J569241812', 0, 0, '', '', ''),
(53, 'NVN 142', 'NVN 142', 'nvn-142', 297886.3, 297886.3, 0, 'gram', 875, 'gross_weight', 0, 2.418, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 70.42, 62.176, 'Yellow Gold', '', '', '', 8, '12J688061902', 0, 0, '', '', ''),
(54, 'NVN 143', 'NVN 143', 'nvn-143', 258368, 258368, 0, 'gram', 875, 'gross_weight', 0, 2.45, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 60.72, 54.01, 'Yellow Gold', '', '', '', 8, '12J688071902', 0, 0, '', '', ''),
(55, 'NVN 145', 'NVN 145', 'nvn-145', 572836.65, 572836.65, 0, 'gram', 875, 'gross_weight', 0, 1.905, 26, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 126.11, 121.708, 'Yellow Gold', '', '', '', 8, '13J614761902', 0, 0, '', '', ''),
(56, 'NVN 148', 'NVN 148', 'nvn-148', 280825.8, 280825.8, 0, 'gram', 975, 'gross_weight', 0, 1.6, 6, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 60.12, 58.476, 'Rose gold and white gold', '', '', '', 10, '10J553031901', 0, 0, '', '', ''),
(57, 'NVN 151', 'NVN 151', 'nvn-151', 319641.5, 319641.5, 0, 'gram', 875, 'gross_weight', 0, 2.44, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 74.42, 66.98, 'Yellow Gold', '', '', '', 9, '14J681511902', 0, 0, '', '', ''),
(58, 'NVN155', 'NVN155', 'nvn155', 647422.15, 647422.15, 0, 'gram', 875, 'gross_weight', 0, 1.262, 19, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 150.29, 135.768, 'White Gold', '', '', '', 7, '', 0, 0, '', '', ''),
(59, 'NVN 161', 'NVN 161', 'nvn-161', 216966.7, 216966.7, 0, 'gram', 875, 'gross_weight', 0, 1.157, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 49.78, 45.634, 'Yellow Gold', '', '', '', 13, '19J725661905', 0, 0, '', '', ''),
(60, 'NVN 162', 'NVN 162', 'nvn-162', 837273.1, 837273.1, 0, 'gram', 875, 'gross_weight', 0, 4.48, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:41', '2021-03-17 05:48:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 187.06, 177.262, 'Yellow Gold', '', '', '', 8, '19J869731905/19J869741905/19J869721905', 0, 0, '', '', ''),
(61, 'NVN 163', 'NVN 163', 'nvn-163', 842716.75, 842716.75, 0, 'gram', 875, 'gross_weight', 0, 1.98, 30, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 190.25, 177.96, 'Yellow Gold', '', '', '', 10, '20J986271806/20J064681805', 0, 0, '', '', ''),
(62, 'NVN 164', 'NVN 164', 'nvn-164', 625388.32, 625388.32, 0, 'gram', 960, 'gross_weight', 0, 2.06, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 115.09, 112.424, 'Yellow Gold', '', '', '', 8, '21J306121906', 0, 0, '', '', ''),
(63, 'NVN 165', 'NVN 165', 'nvn-165', 407884.45, 407884.45, 0, 'gram', 875, 'gross_weight', 0, 1.612, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 96.95, 85.014, 'Yellow Gold', '', '', '', 10, '22J375721906', 0, 0, '', '', ''),
(64, 'NVN 168', 'NVN 168', 'nvn-168', 167294.65, 167294.65, 0, 'gram', 875, 'gross_weight', 0, 1.452, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 38.03, 35.268, 'Yellow Gold', '', '', '', 10, '21J201031906', 0, 0, '', '', ''),
(65, 'NVN 173', 'NVN 173', 'nvn-173', 1121008.52, 1121008.52, 0, 'gram', 960, 'gross_weight', 0, 2.573, 30, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 206.9, 201.394, 'Yellow Gold', '', '', '', 8, '26J333961908', 0, 0, '', '', ''),
(66, 'NVN 178', 'NVN 178', 'nvn-178', 795181.08, 795181.08, 0, 'gram', 960, 'gross_weight', 0, 2.5, 26, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 147.01, 142.806, 'Yellow Gold', '', '', '', 10, '27J688441908', 0, 0, '', '', ''),
(67, 'NVN 179', 'NVN 179', 'nvn-179', 155632.05, 155632.05, 0, 'gram', 975, 'gross_weight', 0, 1.073, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 33.79, 32.286, 'Rose gold and white gold', '', '', '', 9, '21J503941806', 0, 0, '', '', ''),
(68, 'NVN 182', 'NVN 182', 'nvn-182', 655200.4, 655200.4, 0, 'gram', 960, 'gross_weight', 0, 2.432, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 120.21, 117.86, 'Yellow Gold', '', '', '', 9, '28J924971909', 0, 0, '', '', ''),
(69, 'NVN 183', 'NVN 183', 'nvn-183', 639030.22, 639030.22, 0, 'gram', 875, 'gross_weight', 0, 2.5, 7, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 122.18, 116.184, 'Yellow Gold', '', '', '', 8, '29J751081909', 0, 0, '', '', ''),
(70, 'NVN 184', 'NVN 184', 'nvn-184', 223613.3, 223613.3, 0, 'gram', 875, 'gross_weight', 0, 1.032, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 49.42, 47.466, 'Yellow Gold', '', '', '', 8, '30J594151910', 0, 0, '', '', ''),
(71, 'NVN 188', 'NVN 188', 'nvn-188', 192630795, 192630795, 0, 'gram', 875, 'gross_weight', 0, 1.15, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 53.48, 50680, 'Yellow Gold', '', '', '', 8, '31J078691910', 0, 0, '', '', ''),
(72, 'NVN 190', 'NVN 190', 'nvn-190', 129228.8, 129228.8, 0, 'gram', 975, 'gross_weight', 0, 0.571, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 27.6, 26.926, 'Rose Gold ', '', '', '', 8, '31J078671910', 0, 0, '', '', ''),
(73, 'NVN 191', 'NVN 191', 'nvn-191', 656243.92, 656243.92, 0, 'gram', 960, 'gross_weight', 0, 2.099, 23, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 122.9, 117.524, 'Yellow Gold', '', '', '', 8, '31J348731910', 0, 0, '', '', ''),
(74, 'NVN 193', 'NVN 193', 'nvn-193', 171772.35, 171772.35, 0, 'gram', 875, 'gross_weight', 0, 1.109, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 38.57, 36.322, 'Yellow Gold', '', '', '', 9, '31J789411910', 0, 0, '', '', ''),
(75, 'NVN 195', 'NVN 195', 'nvn-195', 254791.45, 254791.45, 0, 'gram', 875, 'gross_weight', 0, 0.709, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 55.79, 54.204, 'Yellow Gold', '', '', '', 9, '13J222552001', 0, 0, '', '', ''),
(76, 'NVN 198', 'NVN 198', 'nvn-198', 387937.85, 387937.85, 0, 'gram', 875, 'gross_weight', 0, 1.116, 22, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 86.67, 82.132, 'Yellow Gold', '', '', '', 8, '16J681592003', 0, 0, '', '', ''),
(77, 'NVN 199', 'NVN 199', 'nvn-199', 621557.5, 621557.5, 0, 'gram', 875, 'gross_weight', 0, 2.453, 20, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 144.26, 130.35, 'Yellow Gold', '', '', '', 8, '21J892872010', 0, 0, '', '', ''),
(78, 'NVN 200', 'NVN 200', 'nvn-200', 82823.25, 82823.25, 0, 'gram', 875, 'gross_weight', 0, 0.335, 17, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 17.83, 17.69, 'Yellow Gold', '', '', '', 9, '23J207362010', 0, 0, '', '', ''),
(79, 'NVN 201', 'NVN 201', 'nvn-201', 98797.6, 98797.6, 0, 'gram', 1375, 'gross_weight', 0, 0.315, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 19.2, 19.052, 'Rose gold and white gold', '', '', '', 9, '23J207352010', 0, 0, '', '', ''),
(80, 'NVN 202', 'NVN 202', 'nvn-202', 194244.75, 194244.75, 0, 'gram', 975, 'gross_weight', 0, 1.256, 18, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 43.25, 40.02, 'Yellow Gold', '', '', '', 8, '23J436792010', 0, 0, '', '', ''),
(81, 'NVN 206', 'NVN 206', 'nvn-206', 186898.55, 186898.55, 0, 'gram', 975, 'gross_weight', 0, 1.98, 4, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 41.85, 38.446, 'Yellow Gold', '', '', '', 9, '23J437002010', 0, 0, '', '', ''),
(82, 'NVN 207', 'NVN 207', 'nvn-207', 81239.15, 81239.15, 0, 'gram', 1375, 'gross_weight', 0, 0.327, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 15.81, 15.658, 'Rose gold and white gold', '', '', '', 9, '23J436742010', 0, 0, '', '', ''),
(83, 'NZN 1', 'NZN 1', 'nzn-1', 107876.75, 107876.75, 0, 'gram', 1375, 'gross_weight', 0, 1.342, 25, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 22.05, 20.41, 'White Gold', '', '', '', 0, '', 0, 0, '', '', ''),
(84, 'NZN 2', 'NZN 2', 'nzn-2', 271999.5, 271999.5, 0, 'gram', 1375, 'gross_weight', 0, 1.255, 38, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 56.9, 50.99, 'White Gold', '', '', '', 29, '', 0, 0, '', '', ''),
(85, 'NZN 8', 'NZN 8', 'nzn-8', 239594.05, 239594.05, 0, 'gram', 875, 'gross_weight', 0, 0.773, 14, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 1, 56.87, 49.956, 'Yellow Gold', '', '', '', 8, '31J807321711', 0, 0, '', '', ''),
(86, 'NZN 13', 'NZN 13', 'nzn-13', 532993.8, 532993.8, 0, 'gram', 975, 'gross_weight', 0, 1.087, 16, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:18:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:18:42', '2021-03-17 05:48:42', 'whitethoughts', '157.47.65.89', 0, 1, 3, 117.88, 110.016, 'Yellow Gold', '', '', '', 7, '', 0, 0, '', '', ''),
(87, 'NVN 196', 'NVN 196', 'nvn-196', 866521.4, 866521.4, 0, 'gram', 1375, 'gross_weight', 0, 3.179, 25, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:23:15', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:23:15', '2021-03-17 05:53:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 180.2, 162.828, 'Yellow Gold', '', '', '', 8, '11J138821701', 0, 0, '', '', ''),
(88, 'NZN 3', 'NZN 3', 'nzn-3', 165398, 165398, 0, 'gram', 1375, 'gross_weight', 0, 0.461, 36, 0, '', 'Diamond Necklace', '', '', '', NULL, 6, 28, '2021-03-17 12:23:15', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:23:15', '2021-03-17 05:53:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 70.24, 18.11, 'White Gold', '', '', '', 25, '', 0, 0, '', '', ''),
(89, 'NVB 5', 'NVB 5', 'nvb-5', 65021.35, 65021.35, 0, 'gram', 875, 'gross_weight', 0, 22.1, 0, 59.4, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/PLRTvVeVzWc', 2, 0, '2021-04-07 12:48:44', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-04-07 12:48:44', '', '', 0, 1, 1, 14.37, 13.802, 'yellow gold', 'anaya', '', '', 0, '17J800462006', 0, 0, '', '', ''),
(90, 'NVB 57', 'NVB 57', 'nvb-57', 34957.65, 34957.65, 0, 'gram', 1375, 'gross_weight', 0, 18.3, 0, 20, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/z0GBbyI6kP0', 2, 0, '2021-04-07 12:45:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-04-07 12:45:20', '', '', 0, 1, 1, 6.83, 6.728, 'White gold and yellow gold', 'anaya', '', '', 0, '19J094012008', 0, 0, '', '', ''),
(91, 'NVB 97', 'NVB 97', 'nvb-97', 47934.6, 47934.6, 0, 'gram', 1375, 'gross_weight', 0, 4.1, 0, 48, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/OasWV_JpR9k', 2, 0, '2021-04-07 12:44:25', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-04-07 12:44:25', '', '', 0, 1, 1, 9.32, 9.242, 'Rose gold and white gold', 'anaya', '', '', 0, '19J988012009', 0, 0, '', '', ''),
(92, 'NVB 113', 'NVB 113', 'nvb-113', 51950.45, 51950.45, 0, 'gram', 1375, 'gross_weight', 0, 11.6, 0, 54.2, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/dhS0aUwYs-Y', 2, 0, '2021-04-07 12:42:32', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-04-07 12:42:32', '', '', 0, 1, 1, 10.19, 9.984, 'Rose gold and white gold', 'anaya', '', '', 0, '20J603202009', 0, 0, '', '', ''),
(93, 'NVB 114', 'NVB 114', 'nvb-114', 46546.75, 46546.75, 0, 'gram', 1375, 'gross_weight', 0, 12.2, 0, 2.9, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/4MmzKsVafFE', 2, 0, '2021-04-07 12:41:43', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-04-07 12:41:43', '', '', 0, 1, 1, 9.09, 8.96, 'Rose gold and white gold', 'anaya', '', '', 0, '20J603212009', 0, 0, '', '', ''),
(94, 'NVB 117', 'NVB 117', 'nvb-117', 59508.85, 59508.85, 0, 'gram', 1375, 'gross_weight', 0, 54.8, 0, 8.9, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/3955M9gNMFc', 2, 0, '2021-04-08 07:58:38', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-04-08 07:58:38', '', '', 0, 1, 1, 11.63, 11.452, 'Rose gold and white gold', 'anaya', '', '', 0, '20J591402009', 0, 0, '', '', ''),
(95, 'NVP 3', 'NVP 3', 'nvp-3', 2456.4, 2456.4, 0, 'gram', 6625, 'gross_weight', 0, 0, 0, 0, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.24, 0.228, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(96, 'NVP 6', 'NVP 6', 'nvp-6', 1885.2, 1885.2, 0, 'fix', 1500, 'fix', 0, 1.7, 8.3, 6.8, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.36, 0.354, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(97, 'NVP 7', 'NVP 7', 'nvp-7', 1885.2, 1885.2, 0, 'fix', 1500, 'fix', 0, 1.7, 8.3, 6.8, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.36, 0.354, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(98, 'NVP 8', 'NVP 8', 'nvp-8', 1885.2, 1885.2, 0, 'fix', 1500, 'fix', 0, 1.7, 8.3, 6.8, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.36, 0.354, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(99, 'NVP 9', 'NVP 9', 'nvp-9', 1885.2, 1885.2, 0, 'fix', 1500, 'fix', 0, 1.7, 8.3, 6.8, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.36, 0.354, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(100, 'NVP 10', 'NVP 10', 'nvp-10', 1832.2, 1832.2, 0, 'fix', 1500, 'fix', 0, 1.7, 8.3, 6.8, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.35, 0.344, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(101, 'NVP 14', 'NVP 14', 'nvp-14', 10236.4, 10236.4, 0, 'fix', 3000, 'fix', 0, 0, 0, 0, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.54, 1.478, 'yellow gold', '', '', '', 0, '24J677752011', 0, 0, '', '', ''),
(102, 'NVP 17', 'NVP 17', 'nvp-17', 15713.6, 15713.6, 0, 'fix', 3000, 'fix', 0, 0, 0, 0, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.36, 2.272, 'yellow gold', '', '', '', 0, '25J863582011', 0, 0, '', '', ''),
(103, 'NVP 18', 'NVP 18', 'nvp-18', 12268.8, 12268.8, 0, 'fix', 3000, 'fix', 0, 0, 0, 0, '', 'Diamond Nosepin', '', '', '', NULL, 29, 30, '2021-03-17 12:29:20', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.84, 1.776, 'yellow gold', '', '', '', 0, '25J863592011', 0, 0, '', '', ''),
(104, 'NVR 2', 'NVR 2', 'nvr-2', 34897.3, 34897.3, 0, 'gram', 1330, 'gross_weight', 0, 5, 0, 4.9, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.85, 6.786, 'White gold ', '', '', '', 0, '6272911604', 0, 0, '', '', ''),
(105, 'NVR 3', 'NVR 3', 'nvr-3', 52194.9, 52194.9, 0, 'gram', 1330, 'gross_weight', 0, 3.8, 0, 4.2, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 10.21, 10.162, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(106, 'NVR 4', 'NVR 4', 'nvr-4', 19186.2, 19186.2, 0, 'gram', 1330, 'gross_weight', 0, 4.1, 0, 4.1, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.78, 3.726, 'White gold ', '', '', '', 0, 'I1J164011014', 0, 0, '', '', ''),
(107, 'NVR 5', 'NVR 5', 'nvr-5', 41055.2, 41055.2, 0, 'gram', 1330, 'gross_weight', 0, 5.1, 0, 6.2, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.04, 7.99, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(108, 'NVR 6', 'NVR 6', 'nvr-6', 48450, 48450, 0, 'gram', 1330, 'gross_weight', 0, 3, 0, 6.8, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.48, 9.432, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(109, 'NVR 8', 'NVR 8', 'nvr-8', 23284.7, 23284.7, 0, 'gram', 875, 'gross_weight', 0, 20.8, 0, 10, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.14, 4.944, 'yellow gold', '', '', '', 0, '17J988412006', 0, 0, '', '', ''),
(110, 'NVR 9', 'NVR 9', 'nvr-9', 32598.3, 32598.3, 0, 'gram', 1330, 'gross_weight', 0, 11.5, 0, 5.8, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.39, 6.342, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(111, 'NVR 10', 'NVR 10', 'nvr-10', 41209.1, 41209.1, 0, 'gram', 1330, 'gross_weight', 0, 3.9, 0, 5.6, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.07, 8.02, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(112, 'NVR 11', 'NVR 11', 'nvr-11', 18059.5, 18059.5, 0, 'gram', 1330, 'gross_weight', 0, 20.4, 0, 22.5, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.55, 3.51, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(113, 'NVR 12', 'NVR 12', 'nvr-12', 19910.1, 19910.1, 0, 'gram', 1330, 'gross_weight', 0, 13.9, 0, 6.1, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.93, 3.864, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(114, 'NVR 13', 'NVR 13', 'nvr-13', 23161, 23161, 0, 'gram', 1330, 'gross_weight', 0, 21.8, 0, 4.5, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.66, 4.464, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(115, 'NVR 15', 'NVR 15', 'nvr-15', 18571.25, 18571.25, 0, 'gram', 875, 'gross_weight', 0, 12.5, 0, 12.6, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:29:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.07, 3.95, 'yellow gold', '', '', '', 0, '17J988422006', 0, 0, '', '', ''),
(116, 'NVR 16', 'NVR 16', 'nvr-16', 27863.2, 27863.2, 0, 'gram', 875, 'gross_weight', 0, 21.9, 0, 4.1, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.16, 5.914, 'White gold ', '', '', '', 0, 'I5J538281803', 0, 0, '', '', ''),
(117, 'NVR 18', 'NVR 18', 'nvr-18', 14632.4, 14632.4, 0, 'gram', 960, 'gross_weight', 0, 3.1, 0, 2.9, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.09, 3.07, 'yellow gold', '', '', '', 0, 'I5J584250916', 0, 0, '', '', ''),
(118, 'NVR 19', 'NVR 19', 'nvr-19', 21762, 21762, 0, 'gram', 875, 'gross_weight', 0, 18.8, 0, 6.7, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:20', '2021-03-17 05:59:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.72, 4.64, 'yellow gold', '', '', '', 0, '17J988432006', 0, 0, '', '', ''),
(119, 'NVR 20', 'NVR 20', 'nvr-20', 20254.25, 20254.25, 0, 'gram', 875, 'gross_weight', 0, 20.7, 0, 8.7, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.43, 4.31, 'yellow gold', '', '', '', 0, '17J988442006', 0, 0, '', '', ''),
(120, 'NVR 21', 'NVR 21', 'nvr-21', 22452.3, 22452.3, 0, 'gram', 1330, 'gross_weight', 0, 18.6, 0, 5.9, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.43, 4.358, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(121, 'NVR 22', 'NVR 22', 'nvr-22', 10455.7, 10455.7, 0, 'gram', 1330, 'gross_weight', 0, 12.5, 0, 5.6, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.09, 2.02, 'White gold ', '', '', '', 0, '6275836210', 0, 0, '', '', ''),
(122, 'NVR 23', 'NVR 23', 'nvr-23', 16313.2, 16313.2, 0, 'gram', 875, 'gross_weight', 0, 20.2, 0, 5.1, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.6, 3.464, 'White gold ', '', '', '', 0, '1169564389', 0, 0, '', '', ''),
(123, 'NVR 25', 'NVR 25', 'nvr-25', 9325.3, 9325.3, 0, 'gram', 1290, 'gross_weight', 0, 5.6, 0, 5.3, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.85, 1.826, 'yellow gold', '', '', '', 0, 'I5J576400816', 0, 0, '', '', ''),
(124, 'NVR 26', 'NVR 26', 'nvr-26', 9296.39, 9296.39, 0, 'gram', 1277, 'gross_weight', 0, 20, 0, 10.7, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.87, 1.818, 'yellow gold', '', '', '', 0, 'I5J581780916', 0, 0, '', '', ''),
(125, 'NVR 27', 'NVR 27', 'nvr-27', 17720.55, 17720.55, 0, 'gram', 875, 'gross_weight', 0, 3.1, 0, 4, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.81, 3.786, 'yellow gold', '', '', '', 0, '17J988452006', 0, 0, '', '', ''),
(126, 'NVR 28', 'NVR 28', 'nvr-28', 22909.1, 22909.1, 0, 'gram', 875, 'gross_weight', 0, 19.6, 0, 6.5, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:21', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:21', '2021-03-17 05:59:21', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.98, 4.882, 'yellow gold', '', '', '', 0, '7353137021/17J988502006', 0, 0, '', '', ''),
(127, 'NVR 29', 'NVR 29', 'nvr-29', 7189.96, 7189.96, 0, 'gram', 1594, 'gross_weight', 0, 5.1, 0, 3.6, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.34, 1.33, 'yellow gold', '', '', '', 0, 'I5J581970916', 0, 0, '', '', ''),
(128, 'NVR 30', 'NVR 30', 'nvr-30', 18258.05, 18258.05, 0, 'gram', 875, 'gross_weight', 0, 18.6, 0, 5.5, '', 'Solitaire Diamond Ring', '', '', '', 'https://www.youtube.com/embed/FNTpk7nV_bw', 22, 0, '2021-03-17 07:16:54', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 07:16:54', '', '', 0, 1, 1, 3.99, 3.886, 'yellow gold', 'anaya', '', '', 0, '7351137081/17J988482006', 0, 0, '', '', ''),
(129, 'NVR 31', 'NVR 31', 'nvr-31', 8835, 8835, 0, 'gram', 1330, 'gross_weight', 0, 14.1, 0, 4.9, '', 'Diamond Ring', '', '', '', 'https://www.youtube.com/embed/ZQx1-KV4q2w', 22, 0, '2021-03-17 07:15:29', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 07:15:29', '', '', 0, 1, 1, 1.74, 1.716, 'yellow gold', 'anaya', '', '', 0, 'I5J584190916', 0, 0, '', '', ''),
(130, 'NVR 32', 'NVR 32', 'nvr-32', 13788.5, 13788.5, 0, 'gram', 990, 'gross_weight', 0, 15.6, 0, 6.5, '', 'Diamond Ring', '', '', '', 'https://www.youtube.com/embed/VIYK56mg1mc', 22, 0, '2021-03-17 06:57:39', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 06:57:39', '', '', 0, 1, 1, 2.95, 2.86, 'yellow gold', 'anaya', '', '', 0, 'I1J164081014', 0, 0, '', '', ''),
(131, 'NVR 33', 'NVR 33', 'nvr-33', 10437.7, 10437.7, 0, 'gram', 1190, 'gross_weight', 0, 10.4, 0, 5.7, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.11, 2.086, 'yellow gold', '', '', '', 0, 'I5J581770916', 0, 0, '', '', ''),
(132, 'NVR 35', 'NVR 35', 'nvr-35', 12071.7, 12071.7, 0, 'gram', 1070, 'gross_weight', 0, 20, 0, 5.2, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.51, 2.47, 'yellow gold', '', '', '', 0, 'I5J584180916', 0, 0, '', '', ''),
(133, 'NVR 38', 'NVR 38', 'nvr-38', 10182.8, 10182.8, 0, 'gram', 1200, 'gross_weight', 0, 15.8, 0, 6.3, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.07, 2.026, 'yellow gold', '', '', '', 0, 'I5J582220916', 0, 0, '', '', '');
INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `included_handling_charge`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `product_video_url`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `product_type`, `sub_product_type`, `is_make_an_order`, `chain_length`, `certificate_number`, `mould_availability`, `cad_availability`, `SEOTitle`, `SEODesc`, `SEOKeywords`) VALUES
(134, 'NVR 39', 'NVR 39', 'nvr-39', 10546.4, 10546.4, 0, 'gram', 1160, 'gross_weight', 0, 4.4, 0, 8.3, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.16, 2.116, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(135, 'NVR 40', 'NVR 40', 'nvr-40', 14056.8, 14056.8, 0, 'gram', 990, 'gross_weight', 0, 4.9, 0, 13.1, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.96, 2.928, 'yellow gold', '', '', '', 0, 'I5J576380816', 0, 0, '', '', ''),
(136, 'NVR 44', 'NVR 44', 'nvr-44', 13606.8, 13606.8, 0, 'gram', 990, 'gross_weight', 0, 19, 0, 4.2, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.92, 2.82, 'yellow gold', '', '', '', 0, 'I1J164281014', 0, 0, '', '', ''),
(137, 'NVR 45', 'NVR 45', 'nvr-45', 19283.6, 19283.6, 0, 'gram', 1500, 'gross_weight', 0, 5.5, 0, 5.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.68, 3.622, 'White gold ', '', '', '', 0, '17J951942006', 0, 0, '', '', ''),
(138, 'NVR 46', 'NVR 46', 'nvr-46', 15698.55, 15698.55, 0, 'gram', 875, 'gross_weight', 0, 20.7, 0, 8.2, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.41, 3.346, 'yellow gold', '', '', '', 0, 'I5J582090916', 0, 0, '', '', ''),
(139, 'NVR 47', 'NVR 47', 'nvr-47', 15131.6, 15131.6, 0, 'gram', 960, 'gross_weight', 0, 6.8, 0, 9.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.23, 3.166, 'yellow gold', '', '', '', 0, 'I2J209300115', 0, 0, '', '', ''),
(140, 'NVR 50', 'NVR 50', 'nvr-50', 10676, 10676, 0, 'gram', 1160, 'gross_weight', 0, 8.5, 0, 10.1, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.18, 2.144, 'yellow gold', '', '', '', 0, 'I3J396160915', 0, 0, '', '', ''),
(141, 'NVR 54', 'NVR 54', 'nvr-54', 8611.85, 8611.85, 0, 'gram', 1375, 'gross_weight', 0, 5.9, 0, 4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.67, 1.662, 'yellow gold', '', '', '', 0, 'I5J581950916', 0, 0, '', '', ''),
(142, 'NVR 59', 'NVR 59', 'nvr-59', 15019.6, 15019.6, 0, 'gram', 960, 'gross_weight', 0, 21.5, 0, 8.2, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.24, 3.134, 'yellow gold', '', '', '', 0, 'I4J407301015', 0, 0, '', '', ''),
(143, 'NVR 64', 'NVR 64', 'nvr-64', 8751.7, 8751.7, 0, 'gram', 1357, 'gross_weight', 0, 4.6, 0, 3.3, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.7, 1.696, 'yellow gold', '', '', '', 0, 'I5J581820916', 0, 0, '', '', ''),
(144, 'NVR 65', 'NVR 65', 'nvr-65', 17330.2, 17330.2, 0, 'gram', 875, 'gross_weight', 0, 2.5, 0, 4.4, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.72, 3.704, 'yellow gold', '', '', '', 0, 'I5J581750916', 0, 0, '', '', ''),
(145, 'NVR 67', 'NVR 67', 'nvr-67', 9703.6, 9703.6, 0, 'gram', 1240, 'gross_weight', 0, 10.7, 0, 6.1, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.96, 1.914, 'yellow gold', '', '', '', 0, 'I5J581800916', 0, 0, '', '', ''),
(146, 'NVR 69', 'NVR 69', 'nvr-69', 49348.35, 49348.35, 0, 'gram', 1675, 'gross_weight', 0, 21.1, 0, 23, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.13, 8.962, 'Rose gold and white gold', '', '', '', 0, '19J560441706', 0, 0, '', '', ''),
(147, 'NVR 70', 'NVR 70', 'nvr-70', 11671.1, 11671.1, 0, 'gram', 1095, 'gross_weight', 0, 19.4, 0, 5.1, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.42, 2.374, 'yellow gold', '', '', '', 0, 'I5J582210916', 0, 0, '', '', ''),
(148, 'NVR 71', 'NVR 71', 'nvr-71', 9888.1, 9888.1, 0, 'gram', 1230, 'gross_weight', 0, 12.9, 0, 7.9, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.99, 1.958, 'yellow gold', '', '', '', 0, 'I5J576530816', 0, 0, '', '', ''),
(149, 'NVR 72', 'NVR 72', 'nvr-72', 11273.6, 11273.6, 0, 'gram', 1120, 'gross_weight', 0, 16.1, 0, 5.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.33, 2.28, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(150, 'NVR 74', 'NVR 74', 'nvr-74', 11796.4, 11796.4, 0, 'gram', 1080, 'gross_weight', 0, 12, 0, 8.1, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.45, 2.408, 'yellow gold', '', '', '', 0, 'I5J576670816', 0, 0, '', '', ''),
(151, 'NVR 75', 'NVR 75', 'nvr-75', 9675.4, 9675.4, 0, 'gram', 1250, 'gross_weight', 0, 10.5, 0, 7.3, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.94, 1.908, 'yellow gold', '', '', '', 0, 'I5J582160916', 0, 0, '', '', ''),
(152, 'NVR 77', 'NVR 77', 'nvr-77', 13207.2, 13207.2, 0, 'gram', 1020, 'gross_weight', 0, 13.2, 0, 9.8, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.8, 2.724, 'yellow gold', '', '', '', 0, 'I2J209440115', 0, 0, '', '', ''),
(153, 'NVR 78', 'NVR 78', 'nvr-78', 37780.6, 37780.6, 0, 'gram', 1675, 'gross_weight', 0, 21.1, 0, 10.6, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.92, 6.892, 'Rose gold and white gold', '', '', '', 0, '19J560471706', 0, 0, '', '', ''),
(154, 'NVR 79', 'NVR 79', 'nvr-79', 9685.7, 9685.7, 0, 'gram', 1250, 'gross_weight', 0, 7.2, 0, 8.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.93, 1.914, 'yellow gold', '', '', '', 0, 'I5J581940916', 0, 0, '', '', ''),
(155, 'NVR 81', 'NVR 81', 'nvr-81', 10649.2, 10649.2, 0, 'gram', 1160, 'gross_weight', 0, 6.5, 0, 10.7, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.17, 2.14, 'yellow gold', '', '', '', 0, 'I5J582170916', 0, 0, '', '', ''),
(156, 'NVR 82', 'NVR 82', 'nvr-82', 13376.8, 13376.8, 0, 'gram', 1010, 'gross_weight', 0, 19.2, 0, 3.7, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.8, 2.776, 'yellow gold', '', '', '', 0, 'I5J576450816', 0, 0, '', '', ''),
(157, 'NVR 83', 'NVR 83', 'nvr-83', 10723.02, 10723.02, 0, 'gram', 1166, 'gross_weight', 0, 3.6, 0, 4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.17, 2.156, 'yellow gold', '', '', '', 0, 'I5J581920916', 0, 0, '', '', ''),
(158, 'NVR 88', 'NVR 88', 'nvr-88', 25805.85, 25805.85, 0, 'gram', 1675, 'gross_weight', 0, 13.6, 0, 13.9, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.83, 4.662, 'Rose gold and white gold', '', '', '', 0, '19J560401706', 0, 0, '', '', ''),
(159, 'NVR 92', 'NVR 92', 'nvr-92', 79258, 79258, 0, 'gram', 1575, 'gross_weight', 0, 37.7, 0, 37.7, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 14.88, 14.69, 'Rose gold and white gold', '', '', '', 0, 'I6J620561116', 0, 0, '', '', ''),
(160, 'NVR 94', 'NVR 94', 'nvr-94', 48948.2, 48948.2, 0, 'gram', 1675, 'gross_weight', 0, 22.9, 0, 22.9, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9, 8.914, 'Rose gold and white gold', '', '', '', 0, 'I6J620571116', 0, 0, '', '', ''),
(161, 'NVR 95', 'NVR 95', 'nvr-95', 15553.3, 15553.3, 0, 'gram', 930, 'gross_weight', 0, 19.4, 0, 4.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.33, 3.278, 'yellow gold', '', '', '', 0, 'I5J576620816', 0, 0, '', '', ''),
(162, 'NVR 96', 'NVR 96', 'nvr-96', 10855.9, 10855.9, 0, 'gram', 1150, 'gross_weight', 0, 7.3, 0, 7.3, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.21, 2.188, 'yellow gold', '', '', '', 0, 'I5J576690816', 0, 0, '', '', ''),
(163, 'NVR 97', 'NVR 97', 'nvr-97', 25282.75, 25282.75, 0, 'gram', 875, 'gross_weight', 0, 22.4, 0, 22.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:38', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:38', '2021-03-17 05:59:38', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.53, 5.38, 'yellow gold', '', '', '', 0, 'I1J164221014', 0, 0, '', '', ''),
(164, 'NVR 103', 'NVR 103', 'nvr-103', 36030.85, 36030.85, 0, 'gram', 875, 'gross_weight', 0, 26.7, 0, 22.2, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.99, 7.642, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(165, 'NVR 105', 'NVR 105', 'nvr-105', 9728.5, 9728.5, 0, 'gram', 1230, 'gross_weight', 0, 19.6, 0, 6.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.99, 1.916, 'yellow gold', '', '', '', 0, '27J485101809', 0, 0, '', '', ''),
(166, 'NVR 109', 'NVR 109', 'nvr-109', 9503, 9503, 0, 'gram', 1275, 'gross_weight', 0, 3.7, 0, 5.4, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.88, 1.87, 'yellow gold', '', '', '', 0, 'I5J582120916', 0, 0, '', '', ''),
(167, 'NVR 110', 'NVR 110', 'nvr-110', 14504.8, 14504.8, 0, 'gram', 960, 'gross_weight', 0, 2.5, 0, 3.7, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.06, 3.044, 'yellow gold', '', '', '', 0, 'I5J576610916', 0, 0, '', '', ''),
(168, 'NVR 114', 'NVR 114', 'nvr-114', 9130, 9130, 0, 'gram', 1300, 'gross_weight', 0, 12.7, 0, 5.8, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.82, 1.78, 'yellow gold', '', '', '', 0, '26J939181809', 0, 0, '', '', ''),
(169, 'NVR 119', 'NVR 119', 'nvr-119', 8384.25, 8384.25, 0, 'gram', 1395, 'gross_weight', 0, 3.9, 0, 3.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.63, 1.608, 'yellow gold', '', '', '', 0, 'I5J582110916', 0, 0, '', '', ''),
(170, 'NVR 121', 'NVR 121', 'nvr-121', 8691.1, 8691.1, 0, 'gram', 1375, 'gross_weight', 0, 5.8, 0, 5.6, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.7, 1.672, 'yellow gold', '', '', '', 0, 'I1J196181214', 0, 0, '', '', ''),
(171, 'NVR 122', 'NVR 122', 'nvr-122', 10366.4, 10366.4, 0, 'gram', 1200, 'gross_weight', 0, 6.2, 0, 5.8, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.09, 2.068, 'yellow gold', '', '', '', 0, 'I5J576460816', 0, 0, '', '', ''),
(172, 'NVR 124', 'NVR 124', 'nvr-124', 11483, 11483, 0, 'gram', 1100, 'gross_weight', 0, 8.7, 0, 5.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.39, 2.33, 'yellow gold', '', '', '', 0, 'I2J209160115', 0, 0, '', '', ''),
(173, 'NVR 126', 'NVR 126', 'nvr-126', 8194.7, 8194.7, 0, 'gram', 1425, 'gross_weight', 0, 12.3, 0, 1.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.58, 1.564, 'yellow gold', '', '', '', 0, 'I5J582030916', 0, 0, '', '', ''),
(174, 'NVR 127', 'NVR 127', 'nvr-127', 8827.6, 8827.6, 0, 'gram', 1350, 'gross_weight', 0, 3.8, 0, 6.8, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.72, 1.712, 'yellow gold', '', '', '', 0, 'I5J582050916', 0, 0, '', '', ''),
(175, 'NVR 128', 'NVR 128', 'nvr-128', 7326.5, 7326.5, 0, 'gram', 1570, 'gross_weight', 0, 5, 0, 3.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.37, 1.362, 'yellow gold', '', '', '', 0, 'I5J581830916', 0, 0, '', '', ''),
(176, 'NVR 129', 'NVR 129', 'nvr-129', 9958.8, 9958.8, 0, 'gram', 1225, 'gross_weight', 0, 7.6, 0, 8, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2, 1.976, 'yellow gold', '', '', '', 0, 'I5J576420816', 0, 0, '', '', ''),
(177, 'NVR 130', 'NVR 130', 'nvr-130', 10683.6, 10683.6, 0, 'gram', 1160, 'gross_weight', 0, 9.7, 0, 11.7, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.18, 2.146, 'yellow gold', '', '', '', 0, 'I5J576640816', 0, 0, '', '', ''),
(178, 'NVR 132', 'NVR 132', 'nvr-132', 8869.2, 8869.2, 0, 'gram', 1330, 'gross_weight', 0, 17.1, 0, 6.4, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.76, 1.718, 'yellow gold', '', '', '', 0, 'I5J581850916', 0, 0, '', '', ''),
(179, 'NVR 133', 'NVR 133', 'nvr-133', 9093.7, 9093.7, 0, 'gram', 1310, 'gross_weight', 0, 3.5, 0, 7.6, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.79, 1.776, 'yellow gold', '', '', '', 0, 'I5J581890916', 0, 0, '', '', ''),
(180, 'NVR 135', 'NVR 135', 'nvr-135', 10970.4, 10970.4, 0, 'gram', 1145, 'gross_weight', 0, 11.5, 0, 7.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.24, 2.212, 'yellow gold', '', '', '', 0, 'I5J576650816', 0, 0, '', '', ''),
(181, 'NVR 136', 'NVR 136', 'nvr-136', 9811.7, 9811.7, 0, 'gram', 1250, 'gross_weight', 0, 6.7, 0, 8.7, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.97, 1.934, 'yellow gold', '', '', '', 0, 'I5J576550816', 0, 0, '', '', ''),
(182, 'NVR 138', 'NVR 138', 'nvr-138', 10676, 10676, 0, 'gram', 1160, 'gross_weight', 0, 15.1, 0, 7.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.18, 2.144, 'yellow gold', '', '', '', 0, 'I5J581930916', 0, 0, '', '', ''),
(183, 'NVR 139', 'NVR 139', 'nvr-139', 18577.7, 18577.7, 0, 'gram', 875, 'gross_weight', 0, 22.4, 0, 8.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.06, 3.954, 'yellow gold', '', '', '', 0, 'I1J195721214', 0, 0, '', '', ''),
(184, 'NVR 140', 'NVR 140', 'nvr-140', 7730.45, 7730.45, 0, 'gram', 1495, 'gross_weight', 0, 7.5, 0, 6.6, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.47, 1.456, 'yellow gold', '', '', '', 0, 'I5J576440816', 0, 0, '', '', ''),
(185, 'NVR 141', 'NVR 141', 'nvr-141', 8667.2, 8667.2, 0, 'gram', 1360, 'gross_weight', 0, 3.9, 0, 3.6, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.69, 1.676, 'yellow gold', '', '', '', 0, 'I5J576490816', 0, 0, '', '', ''),
(186, 'NVR 142', 'NVR 142', 'nvr-142', 13796.1, 13796.1, 0, 'gram', 990, 'gross_weight', 0, 8.9, 0, 8.8, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.95, 2.862, 'yellow gold', '', '', '', 0, 'I1J164351014', 0, 0, '', '', ''),
(187, 'NVR 143', 'NVR 143', 'nvr-143', 20128.8, 20128.8, 0, 'gram', 920, 'gross_weight', 0, 9.1, 0, 4.1, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.3, 4.256, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(188, 'NVR 145', 'NVR 145', 'nvr-145', 15578.8, 15578.8, 0, 'gram', 875, 'gross_weight', 0, 19.4, 0, 3.9, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.36, 3.326, 'yellow gold', '', '', '', 0, 'I5J581960916', 0, 0, '', '', ''),
(189, 'NVR 147', 'NVR 147', 'nvr-147', 41348.4, 41348.4, 0, 'gram', 875, 'gross_weight', 0, 9, 0, 6, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.96, 8.818, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(190, 'NVR 149', 'NVR 149', 'nvr-149', 21641.2, 21641.2, 0, 'gram', 920, 'gross_weight', 0, 10.7, 0, 6.9, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.68, 4.562, 'yellow gold', '', '', '', 0, 'I1J164291014', 0, 0, '', '', ''),
(191, 'NVR 150', 'NVR 150', 'nvr-150', 19936.9, 19936.9, 0, 'gram', 875, 'gross_weight', 0, 17.9, 0, 10.9, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.38, 4.238, 'yellow gold', '', '', '', 0, '33J569281811', 0, 0, '', '', ''),
(192, 'NVR 151', 'NVR 151', 'nvr-151', 16330.25, 16330.25, 0, 'gram', 875, 'gross_weight', 0, 10.9, 0, 5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.55, 3.48, 'yellow gold', '', '', '', 0, '33J734291811', 0, 0, '', '', ''),
(193, 'NVR 158', 'NVR 158', 'nvr-158', 16498.65, 16498.65, 0, 'gram', 1395, 'gross_weight', 0, 5.8, 0, 5.4, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.23, 3.156, 'White gold ', '', '', '', 0, '2247481736', 0, 0, '', '', ''),
(194, 'NVR 162', 'NVR 162', 'nvr-162', 37592.4, 37592.4, 0, 'gram', 1600, 'gross_weight', 0, 2.6, 0, 2.6, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.97, 6.958, 'White gold ', '', '', '', 0, '35J491011812', 0, 0, '', '', ''),
(195, 'NVR 163', 'NVR 163', 'nvr-163', 27024.4, 27024.4, 0, 'gram', 1600, 'gross_weight', 0, 3.2, 0, 3.3, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.02, 4.998, 'White gold ', '', '', '', 0, '35J491021812', 0, 0, '', '', ''),
(196, 'NVR 164', 'NVR 164', 'nvr-164', 25342.8, 25342.8, 0, 'gram', 1600, 'gross_weight', 0, 7.6, 0, 4.3, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.71, 4.686, 'White gold ', '', '', '', 0, '35J491041812', 0, 0, '', '', ''),
(197, 'NVR 165', 'NVR 165', 'nvr-165', 24093.2, 24093.2, 0, 'gram', 1600, 'gross_weight', 0, 4.3, 0, 4.3, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.48, 4.454, 'White gold ', '', '', '', 0, '35J419031812', 0, 0, '', '', ''),
(198, 'NVR 166', 'NVR 166', 'nvr-166', 38843.6, 38843.6, 0, 'gram', 1600, 'gross_weight', 0, 4.9, 0, 4.9, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.22, 7.182, 'White gold ', '', '', '', 0, '35J552541812', 0, 0, '', '', ''),
(199, 'NVR 167', 'NVR 167', 'nvr-167', 25239.6, 25239.6, 0, 'gram', 1330, 'gross_weight', 0, 7, 0, 6.3, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.96, 4.906, 'Rose gold and white gold', '', '', '', 0, '11J277451901', 0, 0, '', '', ''),
(200, 'NVR 168', 'NVR 168', 'nvr-168', 14022, 14022, 0, 'gram', 1330, 'gross_weight', 0, 7.4, 0, 5.7, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:29:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:29:51', '2021-03-17 05:59:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.76, 2.724, 'White gold ', '', '', '', 0, '11J277461901', 0, 0, '', '', ''),
(201, 'NVR 169', 'NVR 169', 'nvr-169', 16058, 16058, 0, 'gram', 1600, 'gross_weight', 0, 4.7, 0, 4.7, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:12', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:12', '2021-03-17 06:00:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.03, 2.95, 'Rose gold ', '', '', '', 0, '6312309165', 0, 0, '', '', ''),
(202, 'NVR 170', 'NVR 170', 'nvr-170', 31270.2, 31270.2, 0, 'gram', 1330, 'gross_weight', 0, 5.3, 0, 5, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:12', 1, 0, 'No', 'Men', '', '2021-03-17 12:30:12', '2021-03-17 06:00:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.14, 6.08, 'White gold ', '', '', '', 0, '7298188397', 0, 0, '', '', ''),
(203, 'NVR 171', 'NVR 171', 'nvr-171', 15217.1, 15217.1, 0, 'gram', 1330, 'gross_weight', 0, 19.2, 0, 5.6, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:12', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:12', '2021-03-17 06:00:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.03, 2.944, 'White gold ', '', '', '', 0, '2296291335', 0, 0, '', '', ''),
(204, 'NVR 187', 'NVR 187', 'nvr-187', 34607.2, 34607.2, 0, 'gram', 875, 'gross_weight', 0, 16.9, 0, 9.3, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Men', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.44, 7.394, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(205, 'NVR 189', 'NVR 189', 'nvr-189', 64446.4, 64446.4, 0, 'gram', 1600, 'gross_weight', 0, 3.5, 0, 5.7, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 11.95, 11.928, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(206, 'NVR 190', 'NVR 190', 'nvr-190', 29162.4, 29162.4, 0, 'gram', 920, 'gross_weight', 0, 10.3, 0, 4.9, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Men', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.23, 6.166, 'yellow gold', '', '', '', 0, 'I5J557610716', 0, 0, '', '', ''),
(207, 'NVR 199', 'NVR 199', 'nvr-199', 14346.25, 14346.25, 0, 'gram', 875, 'gross_weight', 0, 12, 0, 5.5, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.15, 3.05, 'yellow gold', '', '', '', 0, '30J103921909', 0, 0, '', '', ''),
(208, 'NVR 204', 'NVR 204', 'nvr-204', 29226.8, 29226.8, 0, 'gram', 875, 'gross_weight', 0, 5.7, 0, 5.6, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Men', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.32, 6.236, 'yellow gold', '', '', '', 0, '2216048899', 0, 0, '', '', ''),
(209, 'NVR 207', 'NVR 207', 'nvr-207', 18378.5, 18378.5, 0, 'gram', 875, 'gross_weight', 0, 12.8, 0, 6.2, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Men', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.98, 3.92, 'yellow gold', '', '', '', 0, '12J026792001', 0, 0, '', '', ''),
(210, 'NVR 213', 'NVR 213', 'nvr-213', 18222.9, 18222.9, 0, 'gram', 1735, 'gross_weight', 0, 20.9, 0, 7.2, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.42, 3.234, 'White gold ', '', '', '', 0, '', 0, 0, '', '', ''),
(211, 'NVR 215', 'NVR 215', 'nvr-215', 17058.4, 17058.4, 0, 'fix', 3000, 'fix', 0, 18.5, 0, 15.7, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.56, 2.468, 'yellow gold', '', '', '', 0, '23J194212010', 0, 0, '', '', ''),
(212, 'NVR 217', 'NVR 217', 'nvr-217', 18437, 18437, 0, 'gram', 875, 'gross_weight', 0, 2.1, 0, 8.8, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.96, 3.94, 'yellow gold', '', '', '', 0, '23J194182010', 0, 0, '', '', ''),
(213, 'NVR 220', 'NVR 220', 'nvr-220', 17546.85, 17546.85, 0, 'gram', 1375, 'gross_weight', 0, 20.4, 0, 27, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.47, 3.362, 'Rose gold and white gold', '', '', '', 0, '23J194222010', 0, 0, '', '', ''),
(214, 'NVR 226', 'NVR 226', 'nvr-226', 34164.85, 34164.85, 0, 'gram', 875, 'gross_weight', 0, 24, 0, 22.9, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.55, 7.022, 'yellow gold', '', '', '', 0, '23J427252010', 0, 0, '', '', ''),
(215, 'NVR 229', 'NVR 229', 'nvr-229', 45531.3, 45531.3, 0, 'gram', 1375, 'gross_weight', 0, 26, 0, 26, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.86, 8.776, 'Rose gold ', '', '', '', 0, '23J427232010', 0, 0, '', '', ''),
(216, 'NVR 233', 'NVR 233', 'nvr-233', 39592, 39592, 0, 'gram', 1375, 'gross_weight', 0, 3.6, 0, 4.1, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Men', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.68, 7.64, 'White gold ', '', '', '', 0, '25J871242011', 0, 0, '', '', ''),
(217, 'NVR 234', 'NVR 234', 'nvr-234', 11895.25, 11895.25, 0, 'gram', 1375, 'gross_weight', 0, 19.1, 0, 3.7, '', 'Solitaire Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.35, 2.28, 'white gold ', '', '', '', 0, '25J871252011', 0, 0, '', '', ''),
(218, 'NVR 228', 'NVR 228', 'nvr-228', 19090, 19090, 0, 'gram', 3000, 'gross_weight', 0, 20.5, 0, 25.4, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:30:13', 1, 0, 'No', 'Women', '', '2021-03-17 12:30:13', '2021-03-17 06:00:13', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.88, 2.75, 'Rose gold ', '', '', '', 0, '23J081232010', 0, 0, '', '', ''),
(219, 'NVL 1', 'NVL 1', 'nvl-1', 22410.5, 22410.5, 0, 'gram', 875, 'gross_weight', 0, 15.1, 0, 33.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.94, 4.76, 'Rose gold and white gold', '', '', '', 0, '21J523821806', 0, 0, '', '', ''),
(220, 'NVL 3', 'NVL 3', 'nvl-3', 10682.25, 10682.25, 0, 'gram', 875, 'gross_weight', 0, 10.2, 0, 26.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.35, 2.27, 'Rose gold and white gold', '', '', '', 0, '32J266411711', 0, 0, '', '', ''),
(221, 'NVL 7', 'NVL 7', 'nvl-7', 20940.75, 20940.75, 0, 'gram', 875, 'gross_weight', 0, 16.6, 0, 30.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.65, 4.44, 'Rose gold and white gold', '', '', '', 0, '27J425751709', 0, 0, '', '', ''),
(222, 'NVL 10', 'NVL 10', 'nvl-10', 15503.25, 15503.25, 0, 'gram', 875, 'gross_weight', 0, 12.9, 0, 31.9, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.43, 3.29, 'Rose gold and white gold', '', '', '', 0, '11J828881801', 0, 0, '', '', ''),
(223, 'NVL 16', 'NVL 16', 'nvl-16', 23773.4, 23773.4, 0, 'gram', 875, 'gross_weight', 0, 18, 0, 30.9, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.16, 5.068, 'yellow gold', '', '', '', 0, '19J076801805', 0, 0, '', '', ''),
(224, 'NVL 19', 'NVL 19', 'nvl-19', 13667.8, 13667.8, 0, 'gram', 875, 'gross_weight', 0, 19.4, 0, 28.57, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3, 2.906, 'yellow gold', '', '', '', 0, '23J001361807', 0, 0, '', '', ''),
(225, 'NVL 20', 'NVL 20', 'nvl-20', 28467.5, 28467.5, 0, 'gram', 875, 'gross_weight', 0, 26.6, 0, 35.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.26, 6.05, 'yellow gold', '', '', '', 0, 'I5J561320716', 0, 0, '', '', ''),
(226, 'NVL 27', 'NVL 27', 'nvl-27', 38561.6, 38561.6, 0, 'gram', 875, 'gross_weight', 0, 22.55, 0, 30.44, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.32, 8.232, 'yellow gold', '', '', '', 0, '19J076861805', 0, 0, '', '', ''),
(227, 'NVL 29', 'NVL 29', 'nvl-29', 18580, 18580, 0, 'gram', 875, 'gross_weight', 0, 14.5, 0, 33.28, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.08, 3.95, 'yellow gold', '', '', '', 0, 'I3J320430715', 0, 0, '', '', ''),
(228, 'NVL 30', 'NVL 30', 'nvl-30', 19947.95, 19947.95, 0, 'gram', 875, 'gross_weight', 0, 23.14, 0, 39.65, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.41, 4.234, 'yellow gold', '', '', '', 0, '11J577521802', 0, 0, '', '', ''),
(229, 'NVL 31', 'NVL 31', 'nvl-31', 11913.9, 11913.9, 0, 'gram', 1075, 'gross_weight', 0, 15.3, 0, 29.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.5, 2.428, 'yellow gold', '', '', '', 0, 'I5J561310716', 0, 0, '', '', ''),
(230, 'NVL 33', 'NVL 33', 'nvl-33', 13603.6, 13603.6, 0, 'gram', 1095, 'gross_weight', 0, 9.29, 0, 22.98, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.88, 2.75, 'yellow gold', '', '', '', 0, 'I1J160340914', 0, 0, '', '', ''),
(231, 'NVL 34', 'NVL 34', 'nvl-34', 28920.05, 28920.05, 0, 'gram', 875, 'gross_weight', 0, 25.7, 0, 35.82, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.23, 6.176, 'yellow gold', '', '', '', 0, '19J076841805', 0, 0, '', '', ''),
(232, 'NVL 39', 'NVL 39', 'nvl-39', 11126.87, 11126.87, 0, 'gram', 1119, 'gross_weight', 0, 16.9, 0, 27.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.33, 2.242, 'yellow gold', '', '', '', 0, '23J107991807', 0, 0, '', '', ''),
(233, 'NVL 42', 'NVL 42', 'nvl-42', 27862.3, 27862.3, 0, 'gram', 875, 'gross_weight', 0, 18.48, 0, 37.72, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.02, 5.946, 'yellow gold', '', '', '', 0, '11J577531802', 0, 0, '', '', ''),
(234, 'NVL 43', 'NVL 43', 'nvl-43', 12468.5, 12468.5, 0, 'gram', 1050, 'gross_weight', 0, 15.2, 0, 24.8, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.61, 2.56, 'yellow gold', '', '', '', 0, '23J108001807', 0, 0, '', '', ''),
(235, 'NVL 44', 'NVL 44', 'nvl-44', 10396.4, 10396.4, 0, 'gram', 1190, 'gross_weight', 0, 16.44, 0, 25.73, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.12, 2.072, 'yellow gold', '', '', '', 0, '22J690161807', 0, 0, '', '', ''),
(236, 'NVL 46', 'NVL 46', 'nvl-46', 19297.15, 19297.15, 0, 'gram', 875, 'gross_weight', 0, 19.8, 0, 23.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.17, 4.118, 'yellow gold', '', '', '', 0, '19J076791805', 0, 0, '', '', ''),
(237, 'NVL 47', 'NVL 47', 'nvl-47', 18652.55, 18652.55, 0, 'gram', 875, 'gross_weight', 0, 21.5, 0, 30.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.05, 3.976, 'yellow gold', '', '', '', 0, '19J076821805', 0, 0, '', '', ''),
(238, 'NVL 48', 'NVL 48', 'nvl-48', 15435.15, 15435.15, 0, 'gram', 975, 'gross_weight', 0, 18, 0, 27.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.25, 3.228, 'yellow gold', '', '', '', 0, '19J076811805', 0, 0, '', '', ''),
(239, 'NVL 49', 'NVL 49', 'nvl-49', 34493.65, 34493.65, 0, 'gram', 875, 'gross_weight', 0, 25.4, 0, 36.7, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.51, 7.348, 'yellow gold', '', '', '', 0, '22J690141807', 0, 0, '', '', ''),
(240, 'NVL 50', 'NVL 50', 'nvl-50', 28114.35, 28114.35, 0, 'gram', 1675, 'gross_weight', 0, 19.9, 0, 40.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:20', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:20', '2021-03-17 06:04:20', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.21, 5.102, 'Rose gold and white gold', '', '', '', 0, 'I6J620521116', 0, 0, '', '', ''),
(241, 'NVL 200', 'NVL 200', 'nvl-200', 7086.4, 7086.4, 0, 'fix', 3000, 'fix', 0, 7.2, 0, 21.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.06, 1.028, 'yellow gold', '', '', '', 0, '12J026822001', 0, 0, '', '', ''),
(242, 'NVL 201', 'NVL 201', 'nvl-201', 13695.6, 13695.6, 0, 'fix', 3000, 'fix', 0, 11.3, 0, 26.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.08, 1.962, 'yellow gold', '', '', '', 0, '13J110692001', 0, 0, '', '', ''),
(243, 'NVL 204', 'NVL 204', 'nvl-204', 13108.8, 13108.8, 0, 'fix', 3000, 'fix', 0, 14.66, 0, 21.24, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.93, 1.926, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(244, 'NVL 206', 'NVL 206', 'nvl-206', 26866.95, 26866.95, 0, 'gram', 875, 'gross_weight', 0, 17.6, 0, 22.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.89, 5.714, 'yellow gold', '', '', '', 0, '15J355032002', 0, 0, '', '', ''),
(245, 'NVL 208', 'NVL 208', 'nvl-208', 27215.85, 27215.85, 0, 'gram', 875, 'gross_weight', 0, 20.9, 0, 22.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.95, 5.792, 'yellow gold', '', '', '', 0, '15J355062002', 0, 0, '', '', ''),
(246, 'NVL 209', 'NVL 209', 'nvl-209', 32127.35, 32127.35, 0, 'gram', 875, 'gross_weight', 0, 25.8, 0, 26, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.09, 6.822, 'yellow gold', '', '', '', 0, '15J355072002', 0, 0, '', '', ''),
(247, 'NVL 219', 'NVL 219', 'nvl-219', 25283.45, 25283.45, 0, 'gram', 875, 'gross_weight', 0, 22.3, 0, 28.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.47, 5.394, 'yellow gold', '', '', '', 0, '15J355012002', 0, 0, '', '', ''),
(248, 'NVL 221', 'NVL 221', 'nvl-221', 91897.55, 91897.55, 0, 'gram', 875, 'gross_weight', 0, 38, 0, 58.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 20.01, 19.576, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(249, 'NVL 222', 'NVL 222', 'nvl-222', 120031.35, 120031.35, 0, 'gram', 875, 'gross_weight', 0, 42.6, 0, 65, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 26.21, 25.552, 'yellow gold', '', '', '', 0, '15J811102003', 0, 0, '', '', ''),
(250, 'NVL 228', 'NVL 228', 'nvl-228', 24164.7, 24164.7, 0, 'gram', 1375, 'gross_weight', 0, 21.86, 0, 39.14, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.74, 4.644, 'Rose gold and white gold', '', '', '', 0, '20J287642009', 0, 0, '', '', ''),
(251, 'NVL 229', 'NVL 229', 'nvl-229', 14700.6, 14700.6, 0, 'gram', 1375, 'gross_weight', 0, 14.16, 0, 24.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.92, 2.812, 'Rose gold and white gold', '', '', '', 0, '20J287752209', 0, 0, '', '', ''),
(252, 'NVL 230', 'NVL 230', 'nvl-230', 15962.75, 15962.75, 0, 'gram', 1375, 'gross_weight', 0, 14.3, 0, 33.73, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.65, 2.88, 'Rose gold and white gold', '', '', '', 0, '20J287732009', 0, 0, '', '', ''),
(253, 'NVL 232', 'NVL 232', 'nvl-232', 19569.8, 19569.8, 0, 'gram', 1375, 'gross_weight', 0, 17.4, 0, 24.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.88, 3.746, 'Rose gold and white gold', '', '', '', 0, '20J287822009', 0, 0, '', '', ''),
(254, 'NVL 233', 'NVL 233', 'nvl-233', 10750, 10750, 0, 'fix', 3000, 'fix', 0, 12.8, 0, 23, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.62, 1.55, 'yellow gold', '', '', '', 0, '20J287682009', 0, 0, '', '', ''),
(255, 'NVL 234', 'NVL 234', 'nvl-234', 5325.2, 5325.2, 0, 'fix', 3000, 'fix', 0, 10.4, 0, 20.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.82, 0.754, 'yellow gold', '', '', '', 0, '20J287722009', 0, 0, '', '', ''),
(256, 'NVL 236', 'NVL 236', 'nvl-236', 5001.2, 5001.2, 0, 'fix', 3000, 'fix', 0, 9.9, 0, 19.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.75, 0.724, 'yellow gold', '', '', '', 0, '20J287602009', 0, 0, '', '', ''),
(257, 'NVL 237', 'NVL 237', 'nvl-237', 5658, 5658, 0, 'fix', 3000, 'fix', 0, 11.2, 0, 51.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.86, 0.81, 'yellow gold', '', '', '', 0, '20J287662009', 0, 0, '', '', ''),
(258, 'NVL 239', 'NVL 239', 'nvl-239', 4631.2, 4631.2, 0, 'fix', 3000, 'fix', 0, 7.7, 0, 14.08, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.69, 0.674, 'yellow gold', '', '', '', 0, '20J287702009', 0, 0, '', '', ''),
(259, 'NVL 241', 'NVL 241', 'nvl-241', 8438, 8438, 0, 'fix', 3000, 'fix', 0, 15.6, 0, 22.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.28, 1.21, 'yellow gold', '', '', '', 0, '20J287652009', 0, 0, '', '', ''),
(260, 'NVL 242', 'NVL 242', 'nvl-242', 7485.2, 7485.2, 0, 'fix', 3000, 'fix', 0, 13.32, 0, 20.33, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.16, 1.054, 'yellow gold', '', '', '', 0, '20J287592009', 0, 0, '', '', ''),
(261, 'NVL 243', 'NVL 243', 'nvl-243', 10938, 10938, 0, 'fix', 3000, 'fix', 0, 18.1, 0, 24.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.67, 1.56, 'yellow gold', '', '', '', 0, '20J287612009', 0, 0, '', '', ''),
(262, 'NVL 244', 'NVL 244', 'nvl-244', 9716, 9716, 0, 'fix', 3000, 'fix', 0, 12.6, 0, 16.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.44, 1.42, 'yellow gold', '', '', '', 0, '20J287692009', 0, 0, '', '', ''),
(263, 'NVL 245', 'NVL 245', 'nvl-245', 16538.8, 16538.8, 0, 'fix', 3000, 'fix', 0, 12.1, 0, 30.7, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.44, 2.426, 'yellow gold', '', '', '', 0, '20J287712009', 0, 0, '', '', ''),
(264, 'NVL 248', 'NVL 248', 'nvl-248', 24371, 24371, 0, 'gram', 875, 'gross_weight', 0, 28.2, 0, 18.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.4, 5.17, 'yellow gold', '', '', '', 16, '20J591452009', 0, 0, '', '', ''),
(265, 'NVL 254', 'NVL 254', 'nvl-254', 59865, 59865, 0, 'gram', 1275, 'gross_weight', 0, 13.7, 0, 68.11, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Men', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 15.48, 10.56, 'yellow gold', '', '', '', 0, '22J502212010', 0, 0, '', '', ''),
(266, 'NVL 256', 'NVL 256', 'nvl-256', 34402, 34402, 0, 'gram', 875, 'gross_weight', 0, 19.2, 0, 32.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.44, 7.34, 'yellow gold', '', '', '', 0, '22J502192010', 0, 0, '', '', ''),
(267, 'NVL 257', 'NVL 257', 'nvl-257', 32279.35, 32279.35, 0, 'gram', 875, 'gross_weight', 0, 27, 0, 37.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.09, 6.862, 'yellow gold', '', '', '', 0, '22J382432010', 0, 0, '', '', ''),
(268, 'NVL 258', 'NVL 258', 'nvl-258', 34370.6, 34370.6, 0, 'gram', 1375, 'gross_weight', 0, 27.7, 0, 18.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7, 6.512, 'white gold', '', '', '', 16, '22J502102010', 0, 0, '', '', '');
INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `included_handling_charge`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `product_video_url`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `product_type`, `sub_product_type`, `is_make_an_order`, `chain_length`, `certificate_number`, `mould_availability`, `cad_availability`, `SEOTitle`, `SEODesc`, `SEOKeywords`) VALUES
(269, 'NVL 259', 'NVL 259', 'nvl-259', 15996.55, 15996.55, 0, 'gram', 875, 'gross_weight', 0, 15.6, 0, 23.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.49, 3.406, 'yellow gold', '', '', '', 0, '22J502132010', 0, 0, '', '', ''),
(270, 'NVL 260', 'NVL 260', 'nvl-260', 17821.6, 17821.6, 0, 'fix', 3000, 'fix', 0, 15.6, 0, 27.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.67, 2.582, 'yellow gold', '', '', '', 0, '22J502142010', 0, 0, '', '', ''),
(271, 'NVL 261', 'NVL 261', 'nvl-261', 25396.5, 25396.5, 0, 'gram', 875, 'gross_weight', 0, 27, 0, 49.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.66, 5.38, 'yellow gold', '', '', '', 0, '23J081342010', 0, 0, '', '', ''),
(272, 'NVL 262', 'NVL 262', 'nvl-262', 16711.15, 16711.15, 0, 'gram', 875, 'gross_weight', 0, 16.1, 0, 32.7, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:51', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:51', '2021-03-17 06:04:51', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.69, 3.548, 'yellow gold', '', '', '', 0, '22J786442010', 0, 0, '', '', ''),
(273, 'NVL 263', 'NVL 263', 'nvl-263', 21802.4, 21802.4, 0, 'fix', 3000, 'fix', 0, 17.04, 0, 21.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.28, 3.148, 'yellow gold', '', '', '', 0, '22J502172010', 0, 0, '', '', ''),
(274, 'NVL 264', 'NVL 264', 'nvl-264', 21537.2, 21537.2, 0, 'fix', 3000, 'fix', 0, 22.7, 0, 32.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.26, 3.094, 'yellow gold', '', '', '', 0, '23J081312010', 0, 0, '', '', ''),
(275, 'NVL 265', 'NVL 265', 'nvl-265', 30209, 30209, 0, 'gram', 875, 'gross_weight', 0, 21.7, 0, 33.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.6, 6.43, 'yellow gold', '', '', '', 0, '22J502122010', 0, 0, '', '', ''),
(276, 'NVL 266', 'NVL 266', 'nvl-266', 17973.6, 17973.6, 0, 'fix', 3000, 'fix', 0, 22, 0, 29.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.67, 2.622, 'yellow gold', '', '', '', 0, '22J786402010', 0, 0, '', '', ''),
(277, 'NVL 267', 'NVL 267', 'nvl-267', 10878.4, 10878.4, 0, 'fix', 3000, 'fix', 0, 16, 0, 29.7, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.64, 1.568, 'yellow gold', '', '', '', 0, '22J786412010', 0, 0, '', '', ''),
(278, 'NVL 268', 'NVL 268', 'nvl-268', 18462.8, 18462.8, 0, 'fix', 3000, 'fix', 0, 21.1, 0, 35.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.79, 2.656, 'yellow gold', '', '', '', 0, '22J786422010', 0, 0, '', '', ''),
(279, 'NVL 269', 'NVL 269', 'nvl-269', 20086.4, 20086.4, 0, 'fix', 3000, 'fix', 0, 17.42, 0, 36.99, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.05, 2.878, 'yellow gold', '', '', '', 0, '22J786452010', 0, 0, '', '', ''),
(280, 'NVL 270', 'NVL 270', 'nvl-270', 13288, 13288, 0, 'fix', 3000, 'fix', 0, 14.32, 0, 25.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.01, 1.91, 'Rose gold and white gold', '', '', '', 0, '23J081302010', 0, 0, '', '', ''),
(281, 'NVL 271', 'NVL 271', 'nvl-271', 26015.75, 26015.75, 0, 'gram', 1375, 'gross_weight', 0, 22.4, 0, 32.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.13, 4.99, 'Rose gold and white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(282, 'NVL 272', 'NVL 272', 'nvl-272', 14464.7, 14464.7, 0, 'gram', 875, 'gross_weight', 0, 14.71, 0, 26.43, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:34:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:34:52', '2021-03-17 06:04:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.18, 2.844, 'yellow gold', '', '', '', 0, '24J104732010', 0, 0, '', '', ''),
(283, 'NVT 749', 'NVT 749', 'nvt-749', 17775.35, 17775.35, 0, 'per gram', 875, 'gross_weight', 0, 11.9, 13.9, 15.4, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.89, 3.782, 'yellow gold', '', '', '', 0, '22J382452010', 0, 0, '', '', ''),
(284, 'NVT 750', 'NVT 750', 'nvt-750', 44035.45, 44035.45, 0, 'per gram', 875, 'gross_weight', 0, 19, 17.7, 19, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 9.79, 9.334, 'yellow gold', '', '', '', 0, '23J081212010', 0, 0, '', '', ''),
(285, 'NVT 751', 'NVT 751', 'nvt-751', 66238.25, 66238.25, 0, 'per gram', 875, 'gross_weight', 0, 22.2, 17.8, 22.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 14.51, 14.09, 'yellow gold', '', '', '', 0, '23J194152010', 0, 0, '', '', ''),
(286, 'NVT 755', 'NVT 755', 'nvt-755', 21599.2, 21599.2, 0, 'fix', 3000, 'fix', 0, 16.01, 13.4, 16.01, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.23, 3.134, 'yellow gold', '', '', '', 0, '23J081252010', 0, 0, '', '', ''),
(287, 'NVT 756', 'NVT 756', 'nvt-756', 17580.4, 17580.4, 0, 'fix', 3000, 'fix', 0, 8.2, 13.8, 18.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.62, 2.558, 'yellow gold', '', '', '', 0, '23J081292010', 0, 0, '', '', ''),
(288, 'NVT 757', 'NVT 757', 'nvt-757', 21093.2, 21093.2, 0, 'fix', 3000, 'fix', 0, 11.8, 14.6, 12.6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.15, 3.064, 'yellow gold', '', '', '', 0, '23J081372010', 0, 0, '', '', ''),
(289, 'NVT 764', 'NVT 764', 'nvt-764', 52177.3, 52177.3, 0, 'per gram', 875, 'gross_weight', 0, 20.6, 18.6, 20.6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.66, 11.046, 'yellow gold', '', '', '', 0, '23J194162010', 0, 0, '', '', ''),
(290, 'NVT 766', 'NVT 766', 'nvt-766', 19741.7, 19741.7, 0, 'per gram', 1375, 'gross_weight', 0, 9.9, 13.6, 14.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.9, 3.784, 'white gold/rose gold', '', '', '', 0, '23J940512010', 0, 0, '', '', ''),
(291, 'NVT 768', 'NVT 768', 'nvt-768', 65874.55, 65874.55, 0, 'per gram', 875, 'gross_weight', 0, 25.4, 17.2, 24.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 14.85, 13.916, 'yellow gold', '', '', '', 0, '24J677792011', 0, 0, '', '', ''),
(292, 'NVT 771', 'NVT 771', 'nvt-771', 49690.95, 49690.95, 0, 'per gram', 875, 'gross_weight', 0, 20.9, 19.6, 20.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.65, 10.394, 'yellow gold', '', '', '', 0, '24J995022011', 0, 0, '', '', ''),
(293, 'NVT 772', 'NVT 772', 'nvt-772', 55674.8, 55674.8, 0, 'per gram', 875, 'gross_weight', 0, 22.7, 17.1, 22.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 12.4, 11.796, 'yellow gold', '', '', '', 0, '24J995032011', 0, 0, '', '', ''),
(294, 'NVT 773', 'NVT 773', 'nvt-773', 47873.1, 47873.1, 0, 'per gram', 875, 'gross_weight', 0, 18.6, 17.7, 18.6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.58, 10.162, 'yellow gold', '', '', '', 0, '24J995012011', 0, 0, '', '', ''),
(295, 'NVT 775', 'NVT 775', 'nvt-775', 52924.1, 52924.1, 0, 'per gram', 875, 'gross_weight', 0, 22.9, 16.6, 22.6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 12.14, 11.132, 'yellow gold', '', '', '', 0, '26J214702011', 0, 0, '', '', ''),
(296, 'NVT 776', 'NVT 776', 'nvt-776', 58854.25, 58854.25, 0, 'per gram', 875, 'gross_weight', 0, 22.32, 12.8, 22.3, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.15, 12.46, 'yellow gold', '', '', '', 0, '26J214692011', 0, 0, '', '', ''),
(297, 'NZT 7', 'NZT 7', 'nzt-7', 35725.9, 35725.9, 0, 'per gram', 1975, 'gross_weight', 0, 16.2, 18.3, 16.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:53:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:53:55', '2021-03-17 06:23:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.26, 6.148, 'Rose gold', '', '', '', 0, '17J767491804', 0, 0, '', '', ''),
(298, 'NVT 401', 'NVT 401', 'nvt-401', 67126.05, 67126.05, 0, 'per gram', 875, 'gross_weight', 0, 19.1, 15.25, 24.06, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 16.15, 13.946, 'yellow gold', '', '', '', 0, 'I2J210450115', 0, 0, '', '', ''),
(299, 'NVT 404', 'NVT 404', 'nvt-404', 1991, 1991, 0, 'fix', 1500, 'fix', 0, 3.7, 10, 3.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Men', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 1, 0.39, 0.37, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(300, 'NVT 435', 'NVT 435', 'nvt-435', 89080.25, 89080.25, 0, 'per gram', 875, 'gross_weight', 0, 23.5, 19.6, 23.5, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 20.03, 18.83, 'yellow gold', '', '', '', 0, '10J099242001', 0, 0, '', '', ''),
(301, 'NVT 436', 'NVT 436', 'nvt-436', 141864.1, 141864.1, 0, 'per gram', 875, 'gross_weight', 0, 27, 20, 27, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 32.14, 29.932, 'yellow gold', '', '', '', 0, '10J099252001', 0, 0, '', '', ''),
(302, 'NVT 438', 'NVT 438', 'nvt-438', 91648.95, 91648.95, 0, 'per gram', 875, 'gross_weight', 0, 23.7, 19.9, 23.7, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 20.69, 19.354, 'yellow gold', '', '', '', 0, '10J099192001', 0, 0, '', '', ''),
(303, 'NVT 553', 'NVT 553', 'nvt-553', 7781.2, 7781.2, 0, 'fix', 3000, 'fix', 0, 4, 14.7, 4, '', 'Studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Men', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.17, 1.124, 'White gold', '', '', '', 0, '', 0, 0, '', '', ''),
(304, 'NVT 561', 'NVT 561', 'nvt-561', 15592, 15592, 0, 'fix', 3000, 'fix', 0, 4.5, 16.5, 4.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.36, 2.24, 'White gold', '', '', '', 0, '', 0, 0, '', '', ''),
(305, 'NVT 596', 'NVT 596', 'nvt-596', 101290.05, 101290.05, 0, 'per gram', 875, 'gross_weight', 0, 22.2, 17.9, 23.1, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 22.71, 21.426, 'yellow gold', '', '', '', 0, '28J564451909', 0, 0, '', '', ''),
(306, 'NVT 601', 'NVT 601', 'nvt-601', 20474.8, 20474.8, 0, 'fix', 3000, 'fix', 0, 10.23, 13.83, 10.23, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.03, 2.996, 'yellow gold', '', '', '', 0, '29J956541909', 0, 0, '', '', ''),
(307, 'NVT 604', 'NVT 604', 'nvt-604', 16629.2, 16629.2, 0, 'fix', 3000, 'fix', 0, 6.6, 13.9, 12.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.46, 2.434, 'yellow gold', '', '', '', 0, '29J956511909', 0, 0, '', '', ''),
(308, 'NVT 610', 'NVT 610', 'nvt-610', 16009.6, 16009.6, 0, 'fix', 3000, 'fix', 0, 7.6, 14.68, 9.36, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.37, 2.342, 'yellow gold', '', '', '', 0, '29J956521909', 0, 0, '', '', ''),
(309, 'NVT 612', 'NVT 612', 'nvt-612', 24085.6, 24085.6, 0, 'fix', 3000, 'fix', 0, 11.7, 15.5, 11.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.58, 3.512, 'yellow gold', '', '', '', 0, '29J956351909', 0, 0, '', '', ''),
(310, 'NVT 618', 'NVT 618', 'nvt-618', 16190.8, 16190.8, 0, 'fix', 3000, 'fix', 0, 6.6, 13.7, 11.26, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.4, 2.366, 'yellow gold', '', '', '', 0, '29J956401909', 0, 0, '', '', ''),
(311, 'NVT 620', 'NVT 620', 'nvt-620', 11022.4, 11022.4, 0, 'per gram', 875, 'gross_weight', 0, 9.7, 12.6, 10.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.4, 2.348, 'yellow gold', '', '', '', 0, '30J022041909', 0, 0, '', '', ''),
(312, 'NVT 621', 'NVT 621', 'nvt-621', 14732, 14732, 0, 'per gram', 875, 'gross_weight', 0, 13.6, 13.1, 16.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.2, 3.14, 'yellow gold', '', '', '', 0, '30J022051909', 0, 0, '', '', ''),
(313, 'NVT 626', 'NVT 626', 'nvt-626', 10242.85, 10242.85, 0, 'per gram', 875, 'gross_weight', 0, 7, 13.9, 11, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.23, 2.182, 'yellow gold', '', '', '', 0, '30J329221910', 0, 0, '', '', ''),
(314, 'NVT 644', 'NVT 644', 'nvt-644', 19608.05, 19608.05, 0, 'per gram', 875, 'gross_weight', 0, 11.7, 14.6, 14.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.23, 4.186, 'yellow gold', '', '', '', 0, '30J329171910', 0, 0, '', '', ''),
(315, 'NVT 642', 'NVT 642', 'nvt-642', 15110.8, 15110.8, 0, 'per gram', 3000, 'gross_weight', 0, 8.3, 14.7, 8.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.23, 2.216, 'yellow gold', '', '', '', 0, '30J329191910', 0, 0, '', '', ''),
(316, 'NVT 645', 'NVT 645', 'nvt-645', 19096.55, 19096.55, 0, 'per gram', 875, 'gross_weight', 0, 11.6, 15.4, 15.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.21, 4.056, 'yellow gold', '', '', '', 0, '30J329451910', 0, 0, '', '', ''),
(317, 'NVT 658', 'NVT 658', 'nvt-658', 19590.8, 19590.8, 0, 'per gram', 3000, 'gross_weight', 0, 8, 14.07, 14.4, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.9, 2.866, 'yellow gold', '', '', '', 0, '29J956531910', 0, 0, '', '', ''),
(318, 'NVT 661', 'NVT 661', 'nvt-661', 21403.6, 21403.6, 0, 'fix', 3000, 'fix', 0, 8.22, 14.5, 13.69, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.18, 3.122, 'yellow gold', '', '', '', 0, '29J956341910', 0, 0, '', '', ''),
(319, 'NVT 663', 'NVT 663', 'nvt-663', 62451, 62451, 0, 'per gram', 875, 'gross_weight', 0, 20.48, 19, 20.48, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:54:59', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:54:59', '2021-03-17 06:24:59', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.96, 13.22, 'yellow gold', '', '', '', 0, '30J404991910', 0, 0, '', '', ''),
(320, 'NVT 664', 'NVT 664', 'nvt-664', 46369.7, 46369.7, 0, 'per gram', 875, 'gross_weight', 0, 20.7, 19, 20.7, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.46, 9.794, 'yellow gold', '', '', '', 0, '30J405001910', 0, 0, '', '', ''),
(321, 'NVT 682', 'NVT 682', 'nvt-682', 12971.6, 12971.6, 0, 'fix', 3000, 'fix', 0, 6.5, 11.9, 13.6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.94, 1.882, 'yellow gold', '', '', '', 0, '12J026832001', 0, 0, '', '', ''),
(322, 'NVT 683', 'NVT 683', 'nvt-683', 26752.25, 26752.25, 0, 'per gram', 875, 'gross_weight', 0, 14.7, 15.6, 14.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.95, 5.67, 'yellow gold', '', '', '', 0, '13J110672002', 0, 0, '', '', ''),
(323, 'NVT 685', 'NVT 685', 'nvt-685', 21680.4, 21680.4, 0, 'fix', 3000, 'fix', 0, 9.42, 13.97, 13.72, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.29, 3.108, 'yellow gold', '', '', '', 0, '13J110652001', 0, 0, '', '', ''),
(324, 'NVT 687', 'NVT 687', 'nvt-687', 13319.6, 13319.6, 0, 'fix', 3000, 'fix', 0, 4.3, 14.2, 9.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.98, 1.942, 'yellow gold', '', '', '', 0, '12J026862001', 0, 0, '', '', ''),
(325, 'NVT 688', 'NVT 688', 'nvt-688', 14792.8, 14792.8, 0, 'fix', 3000, 'fix', 0, 4.5, 13.4, 11.03, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.2, 2.156, 'yellow gold', '', '', '', 0, '12J302132001', 0, 0, '', '', ''),
(326, 'NVT 689', 'NVT 689', 'nvt-689', 17142.4, 17142.4, 0, 'fix', 3000, 'fix', 0, 5.1, 14.1, 11.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.55, 2.498, 'yellow gold', '', '', '', 0, '13J011542001', 0, 0, '', '', ''),
(327, 'NVT 690', 'NVT 690', 'nvt-690', 20519.6, 20519.6, 0, 'fix', 3000, 'fix', 0, 7.4, 14.7, 13.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.05, 2.992, 'yellow gold', '', '', '', 0, '13J011532001', 0, 0, '', '', ''),
(328, 'NVT 692', 'NVT 692', 'nvt-692', 17165.6, 17165.6, 0, 'fix', 3000, 'fix', 0, 6.09, 13.2, 11.06, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.54, 2.512, 'yellow gold', '', '', '', 0, '12J302152001', 0, 0, '', '', ''),
(329, 'NVT 694', 'NVT 694', 'nvt-694', 15065.2, 15065.2, 0, 'fix', 3000, 'fix', 0, 5.7, 14.2, 11.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.23, 2.204, 'yellow gold', '', '', '', 0, '12J026852001', 0, 0, '', '', ''),
(330, 'NVT 702', 'NVT 702', 'nvt-702', 16370.4, 16370.4, 0, 'fix', 3000, 'fix', 0, 8.9, 14.3, 11.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.47, 2.358, 'yellow gold', '', '', '', 0, '13J838662002', 0, 0, '', '', ''),
(331, 'NVT 704', 'NVT 704', 'nvt-704', 11610, 11610, 0, 'per gram', 1275, 'gross_weight', 0, 9.9, 13.5, 9.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.4, 2.25, 'yellow gold', '', '', '', 0, '13J838722002', 0, 0, '', '', ''),
(332, 'NVT 726', 'NVT 726', 'nvt-726', 9692.8, 9692.8, 0, 'fix', 3000, 'fix', 0, 6.6, 12.7, 8.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.45, 1.406, 'yellow gold', '', '', '', 0, '19J486662008', 0, 0, '', '', ''),
(333, 'NVT 730', 'NVT 730', 'nvt-730', 55494.4, 55494.4, 0, 'per gram', 875, 'gross_weight', 0, 17.2, 18.9, 17.2, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 12.88, 11.638, 'yellow gold', '', '', '', 0, '21J322992010', 0, 0, '', '', ''),
(334, 'NVT 733', 'NVT 733', 'nvt-733', 69161.5, 69161.5, 0, 'per gram', 875, 'gross_weight', 0, 23.7, 19.1, 25.2, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.94, 14.53, 'yellow gold', '', '', '', 0, '21J322922010', 0, 0, '', '', ''),
(335, 'NVT 734', 'NVT 734', 'nvt-734', 72926.15, 72926.15, 0, 'per gram', 875, 'gross_weight', 0, 24.2, 18.9, 23.9, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 16.69, 15.348, 'yellow gold', '', '', '', 0, '21J322952010', 0, 0, '', '', ''),
(336, 'NVT 735', 'NVT 735', 'nvt-735', 80406.4, 80406.4, 0, 'per gram', 875, 'gross_weight', 0, 22.1, 18.4, 22.8, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 18.16, 16.978, 'yellow gold', '', '', '', 0, '21J322932010', 0, 0, '', '', ''),
(337, 'NVT 736', 'NVT 736', 'nvt-736', 69415.8, 69415.8, 0, 'per gram', 875, 'gross_weight', 0, 28.5, 21.3, 29.9, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.64, 14.666, 'yellow gold', '', '', '', 0, '21J322962010', 0, 0, '', '', ''),
(338, 'NVT 737', 'NVT 737', 'nvt-737', 63659.75, 63659.75, 0, 'per gram', 875, 'gross_weight', 0, 20.7, 19.04, 22.65, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 14.69, 13.37, 'yellow gold', '', '', '', 0, '21J322972010', 0, 0, '', '', ''),
(339, 'NVT 744', 'NVT 744', 'nvt-744', 24744.55, 24744.55, 0, 'per gram', 875, 'gross_weight', 0, 16.2, 13.3, 16.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.41, 5.266, 'yellow gold', '', '', '', 0, '22J382442010', 0, 0, '', '', ''),
(340, 'NVT 745', 'NVT 745', 'nvt-745', 19298.75, 19298.75, 0, 'per gram', 875, 'gross_weight', 0, 10.7, 13.07, 18.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.25, 4.1, 'yellow gold', '', '', '', 0, '23J081382010', 0, 0, '', '', ''),
(341, 'NVT 747', 'NVT 747', 'nvt-747', 16850.25, 16850.25, 0, 'per gram', 875, 'gross_weight', 0, 10.2, 15.7, 15.3, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.71, 3.58, 'yellow gold', '', '', '', 0, '22J502152010', 0, 0, '', '', ''),
(342, 'NVT 748', 'NVT 748', 'nvt-748', 19284.7, 19284.7, 0, 'per gram', 875, 'gross_weight', 0, 13.8, 12.1, 14.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 12:55:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:55:00', '2021-03-17 06:25:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.26, 4.094, 'yellow gold', '', '', '', 0, '23J081282010', 0, 0, '', '', ''),
(343, 'NVB 3', 'NVB 3', 'nvb-3', 70279.45, 70279.45, 0, 'gram', 875, 'gross_weight', 0, 15.1, 0, 61.7, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/TCaoNF5KUj0', 2, 0, '2021-04-07 12:49:32', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:57:37', '2021-04-07 12:49:32', '', '', 0, 1, 1, 15.55, 14.914, 'yellow gold', 'anaya', '', '', 0, '17J698102005', 0, 0, '', '', ''),
(344, 'NVB 9', 'NVB 9', 'nvb-9', 176213.95, 176213.95, 0, 'gram', 875, 'gross_weight', 0, 12.9, 0, 0, '', 'Diamond Bangle', '', '', '', 'https://www.youtube.com/embed/3yEz6yr9R-Y', 1, 0, '2021-04-07 12:47:57', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:57:37', '2021-04-07 12:47:57', '', '', 0, 1, 1, 40.25, 37.104, 'yellow gold', 'anaya', '', '', 0, '29J987291810', 0, 0, '', '', ''),
(345, 'NVB 41', 'NVB 41', 'nvb-41', 35320.25, 35320.25, 0, 'gram', 1375, 'gross_weight', 0, 17.4, 0, 18.5, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/51OVpZtHOs8', 2, 0, '2021-04-07 12:47:13', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:57:37', '2021-04-07 12:47:13', '', '', 0, 1, 1, 6.95, 6.78, 'Rose gold and white gold', 'anaya', '', '', 0, '19J094002008', 0, 0, '', '', ''),
(346, 'NVB 56', 'NVB 56', 'nvb-56', 27842.6, 27842.6, 0, 'gram', 1330, 'gross_weight', 0, 9, 0, 12, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/RQ-VqRcxyDg', 2, 0, '2021-04-07 12:46:10', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:57:37', '2021-04-07 12:46:10', '', '', 0, 1, 1, 5.54, 5.388, 'White gold', 'anaya', '', '', 0, '15J988301903', 0, 0, '', '', ''),
(347, 'NVB 124', 'NVB 124', 'nvb-124', 75921.2, 75921.2, 0, 'gram', 875, 'gross_weight', 0, 7.8, 0, 62.1, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/MLp8DUTi2U4', 2, 0, '2021-04-07 12:39:48', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:57:37', '2021-04-07 12:39:48', '', '', 0, 1, 1, 16.96, 16.074, 'Yellow gold', 'anaya', '', '', 0, '25J955322011', 0, 0, '', '', ''),
(348, 'NVR 208', 'NVR 208', 'nvr-208', 34997.3, 34997.3, 0, 'gram', 875, 'gross_weight', 0, 10.6, 0, 10.6, '', 'Diamond Ring', '', '', '', NULL, 22, 31, '2021-03-17 12:57:37', 1, 0, 'No', 'Men', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.66, 7.446, 'yellow gold', '', '', '', 0, '12J026782001', 0, 0, '', '', ''),
(349, 'NVR 218', 'NVR 218', 'nvr-218', 19165.6, 19165.6, 0, 'fix', 3000, 'fix', 0, 18.7, 0, 12.3, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.89, 2.762, 'yellow gold', '', '', '', 0, '23J194172010', 0, 0, '', '', ''),
(350, 'NVR 221', 'NVR 221', 'nvr-221', 21436.05, 21436.05, 0, 'gram', 1375, 'gross_weight', 0, 20.5, 0, 8.7, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.27, 4.096, 'Rose gold ', '', '', '', 0, '23J194202010', 0, 0, '', '', ''),
(351, 'NVR 224', 'NVR 224', 'nvr-224', 19505.6, 19505.6, 0, 'fix', 3000, 'fix', 0, 17.1, 0, 9.1, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.94, 2.812, 'Rose gold ', '', '', '', 0, '23J194232010', 0, 0, '', '', ''),
(352, 'NVR 225', 'NVR 225', 'nvr-225', 19294, 19294, 0, 'fix', 3000, 'fix', 0, 12.1, 0, 25.6, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.91, 2.78, 'yellow gold', '', '', '', 0, '23J427242010', 0, 0, '', '', ''),
(353, 'NVR 231', 'NVR 231', 'nvr-231', 25752.55, 25752.55, 0, 'gram', 875, 'gross_weight', 0, 24.2, 0, 18.9, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.65, 5.476, 'Rose gold ', '', '', '', 0, '23J683832010', 0, 0, '', '', ''),
(354, 'NVR 239', 'NVR 239', 'nvr-239', 38018.85, 38018.85, 0, 'gram', 1375, 'gross_weight', 0, 24.9, 0, 24.9, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.47, 7.302, 'Rose gold ', '', '', '', 0, '25J589562011', 0, 0, '', '', ''),
(355, 'NZR 3', 'NZR 3', 'nzr-3', 43929.9, 43929.9, 0, 'gram', 1375, 'gross_weight', 0, 20.6, 0, 30, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.74, 8.398, 'Rose gold ', '', '', '', 0, '27J099631809', 0, 0, '', '', ''),
(356, 'NVL 9', 'NVL 9', 'nvl-9', 5374.4, 5374.4, 0, 'gram', 875, 'gross_weight', 0, 8.5, 0, 19.08, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.2, 1.138, 'Rose gold and white gold', '', '', '', 0, '13J743631802', 0, 0, '', '', ''),
(357, 'NVL 52', 'NVL 52', 'nvl-52', 11486.4, 11486.4, 0, 'gram', 1100, 'gross_weight', 0, 11.7, 0, 27.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.4, 2.328, 'yellow gold', '', '', '', 0, 'I6J610931019', 0, 0, '', '', ''),
(358, 'NVL 63', 'NVL 63', 'nvl-63', 27046.65, 27046.65, 0, 'gram', 1675, 'gross_weight', 0, 21.3, 0, 31.8, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.99, 4.918, 'Rose gold and white gold', '', '', '', 0, 'I6J620461116', 0, 0, '', '', ''),
(359, 'NVL 73', 'NVL 73', 'nvl-73', 62206.5, 62206.5, 0, 'gram', 875, 'gross_weight', 0, 42.1, 0, 65.9, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 14.94, 12.93, 'yellow gold', '', '', '', 0, '23J107971907', 0, 0, '', '', ''),
(360, 'NVL 83', 'NVL 83', 'nvl-83', 91105.7, 91105.7, 0, 'gram', 875, 'gross_weight', 0, 46.92, 0, 67.15, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:57:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 23.5, 18.564, 'yellow gold', '', '', '', 0, 'I4J487630316', 0, 0, '', '', ''),
(361, 'NVL 85', 'NVL 85', 'nvl-85', 74283.75, 74283.75, 0, 'gram', 875, 'gross_weight', 0, 38.3, 0, 48.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:57:37', 1, 0, 'No', 'Women', '', '2021-03-17 12:57:37', '2021-03-17 06:27:37', 'whitethoughts', '157.47.65.89', 0, 1, 1, 16.93, 15.65, 'white gold and yellow gold', '', '', '', 0, '10J260291701', 0, 0, '', '', ''),
(362, 'NVL 133', 'NVL 133', 'nvl-133', 22354.9, 22354.9, 0, 'gram', 1675, 'gross_weight', 0, 13.2, 0, 33.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:59:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:59:52', '2021-03-17 06:29:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.14, 4.058, 'Rose gold and white gold', '', '', '', 0, '30J872431810', 0, 0, '', '', ''),
(363, 'NVL 134', 'NVL 134', 'nvl-134', 19384.9, 19384.9, 0, 'gram', 1675, 'gross_weight', 0, 16.2, 0, 33.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 12:59:52', 1, 0, 'No', 'Women', '', '2021-03-17 12:59:52', '2021-03-17 06:29:52', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.66, 3.488, 'Rose gold and white gold', '', '', '', 0, '30J8724501810', 0, 0, '', '', ''),
(364, 'NVL 136', 'NVL 136', 'nvl-136', 30780.35, 30780.35, 0, 'gram', 1675, 'gross_weight', 0, 20.7, 0, 38.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.69, 5.592, 'Rose gold and white gold', '', '', '', 0, '30J872451810', 0, 0, '', '', ''),
(365, 'NVL 138', 'NVL 138', 'nvl-138', 43341.2, 43341.2, 0, 'gram', 1675, 'gross_weight', 0, 22, 0, 42.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.08, 7.844, 'Rose gold and white gold', '', '', '', 0, '30J872461810', 0, 0, '', '', ''),
(366, 'NVL 139', 'NVL 139', 'nvl-139', 17585.6, 17585.6, 0, 'gram', 1675, 'gross_weight', 0, 18.6, 0, 27.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.28, 3.182, 'Rose gold and white gold', '', '', '', 0, '30J872471810', 0, 0, '', '', ''),
(367, 'NVL 148', 'NVL 148', 'nvl-148', 57544.7, 57544.7, 0, 'gram', 875, 'gross_weight', 0, 24.8, 0, 49.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 3, 13.46, 12.044, 'yellow gold', '', '', '', 0, '33J569271811', 0, 0, '', '', ''),
(368, 'NVL 155', 'NVL 155', 'nvl-155', 42971.6, 42971.6, 0, 'gram', 875, 'gross_weight', 0, 19.2, 0, 41.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.32, 8.932, 'yellow gold', '', '', '', 0, '10J911851901', 0, 0, '', '', ''),
(369, 'NVL 157', 'NVL 157', 'nvl-157', 63623.65, 63623.65, 0, 'gram', 875, 'gross_weight', 0, 31.36, 0, 60.28, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.83, 13.098, 'yellow gold', '', '', '', 0, '11J095111901', 0, 0, '', '', ''),
(370, 'NVL 159', 'NVL 159', 'nvl-159', 50050.15, 50050.15, 0, 'gram', 875, 'gross_weight', 0, 26.4, 0, 58.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 12.13, 10.378, 'yellow gold', '', '', '', 0, '11J095101901', 0, 0, '', '', ''),
(371, 'NVL 160', 'NVL 160', 'nvl-160', 58335.25, 58335.25, 0, 'gram', 875, 'gross_weight', 0, 33.29, 0, 60.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.99, 12.13, 'yellow gold', '', '', '', 0, '11J095121901', 0, 0, '', '', ''),
(372, 'NVL 161', 'NVL 161', 'nvl-161', 74256.65, 74256.65, 0, 'gram', 875, 'gross_weight', 0, 40.67, 0, 55.55, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 19.47, 15.058, 'yellow gold', '', '', '', 0, '12J002951901', 0, 0, '', '', ''),
(373, 'NVL 165', 'NVL 165', 'nvl-165', 42487.25, 42487.25, 0, 'gram', 875, 'gross_weight', 0, 25.4, 0, 45.8, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.47, 8.77, 'yellow gold', '', '', '', 0, '12J688091902', 0, 0, '', '', ''),
(374, 'NVL 183', 'NVL 183', 'nvl-183', 53629.15, 53629.15, 0, 'gram', 875, 'gross_weight', 0, 32.8, 0, 32, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.05, 11.108, 'yellow gold', '', '', '', 0, '16J564651904', 0, 0, '', '', ''),
(375, 'NVL 184', 'NVL 184', 'nvl-184', 52166.55, 52166.55, 0, 'gram', 875, 'gross_weight', 0, 38.5, 0, 68.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 14.21, 10.456, 'yellow gold', '', '', '', 0, '22J286511906', 0, 0, '', '', ''),
(376, 'NVL 188', 'NVL 188', 'nvl-188', 7645.2, 7645.2, 0, 'fix', 3000, 'fix', 0, 7.4, 0, 19.9, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.15, 1.104, 'yellow gold', '', '', '', 0, '12J026812001', 0, 0, '', '', ''),
(377, 'NVL 189', 'NVL 189', 'nvl-189', 27505.55, 27505.55, 0, 'gram', 875, 'gross_weight', 0, 19.1, 0, 29, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.09, 5.836, 'yellow gold', '', '', '', 0, '13J110682002', 0, 0, '', '', ''),
(378, 'NVL 191', 'NVL 191', 'nvl-191', 8838.8, 8838.8, 0, 'fix', 3000, 'fix', 0, 11.8, 0, 24.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Men', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.33, 1.276, 'yellow gold', '', '', '', 0, '13J110712001', 0, 0, '', '', ''),
(379, 'NVL 194', 'NVL 194', 'nvl-194', 15793.6, 15793.6, 0, 'fix', 3000, 'fix', 0, 20.6, 0, 28.5, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Men', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.45, 2.222, 'yellow gold', '', '', '', 0, '12J026802001', 0, 0, '', '', ''),
(380, 'NVL 196', 'NVL 196', 'nvl-196', 9002, 9002, 0, 'fix', 3000, 'fix', 0, 5.7, 0, 30.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.43, 1.24, 'yellow gold', '', '', '', 0, '13J110742001', 0, 0, '', '', ''),
(381, 'NVL 197', 'NVL 197', 'nvl-197', 10236.8, 10236.8, 0, 'fix', 3000, 'fix', 0, 7.2, 0, 25.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 1.53, 1.486, 'yellow gold', '', '', '', 0, '13J110752001', 0, 0, '', '', ''),
(382, 'NVL 218', 'NVL 218', 'nvl-218', 103995.15, 103995.15, 0, 'gram', 975, 'gross_weight', 0, 38.6, 0, 60.4, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 22.29, 21.648, 'yellow gold', '', '', '', 0, '15J811132003', 0, 0, '', '', ''),
(383, 'NVL 275', 'NVL 275', 'nvl-275', 13910.6, 13910.6, 0, 'gram', 1375, 'gross_weight', 0, 18.2, 0, 30.7, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 2.76, 2.662, 'Rose gold and white gold', '', '', '', 0, '22J786392010', 0, 0, '', '', ''),
(384, 'NVL 276', 'NVL 276', 'nvl-276', 47911.25, 47911.25, 0, 'gram', 875, 'gross_weight', 0, 23.9, 0, 37.7, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 3, 11.11, 10.05, 'yellow gold', '', '', '', 0, '27J335962012', 0, 0, '', '', ''),
(385, 'NVL 277', 'NVL 277', 'nvl-277', 14984.4, 14984.4, 0, 'gram', 875, 'gross_weight', 0, 14.6, 0, 18.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.28, 3.188, 'yellow gold', '', '', '', 0, '26J208482011', 0, 0, '', '', ''),
(386, 'NVL 278', 'NVL 278', 'nvl-278', 29383.85, 29383.85, 0, 'gram', 875, 'gross_weight', 0, 21.7, 0, 25.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 6.43, 6.252, 'yellow gold', '', '', '', 0, '26J208462011', 0, 0, '', '', ''),
(387, 'NVL 279', 'NVL 279', 'nvl-279', 22189.65, 22189.65, 0, 'gram', 875, 'gross_weight', 0, 21.07, 0, 23.9, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.87, 4.718, 'yellow gold', '', '', '', 0, '26J208472011', 0, 0, '', '', ''),
(388, 'NZL 1', 'NZL 1', 'nzl-1', 23681.85, 23681.85, 0, 'gram', 1975, 'gross_weight', 0, 17.6, 0, 36.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.31, 3.992, 'Rose gold and white gold', '', '', '', 0, '17J767651804', 0, 0, '', '', ''),
(389, 'NZL 3', 'NZL 3', 'nzl-3', 22350.7, 22350.7, 0, 'gram', 1975, 'gross_weight', 0, 21.9, 0, 27.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 3.94, 3.834, 'Rose gold and white gold', '', '', '', 0, '17J767871804', 0, 0, '', '', ''),
(390, 'NZL 4', 'NZL 4', 'nzl-4', 33870.25, 33870.25, 0, 'gram', 1975, 'gross_weight', 0, 28.1, 0, 40.1, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 13:01:41', 1, 0, 'No', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.99, 5.8, 'Rose gold and white gold', '', '', '', 0, '17J767481804', 0, 0, '', '', ''),
(391, 'NVT 2', 'NVT 2', 'nvt-2', 35313.7, 35313.7, 0, 'gram', 875, 'gross_weight', 0, 13.09, 18.4, 34.8, '', 'Diamond Hangings', '', '', '', 'https://www.youtube.com/embed/845gyI35Q2Y', 22, 35, '2021-04-07 12:28:34', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-04-07 12:28:34', '', '', 0, 1, 2, 7.9, 7.474, 'Rose gold and white gold', 'anaya', '', '', 0, '34J157401712', 0, 0, '', '', ''),
(392, 'NVT 3', 'NVT 3', 'nvt-3', 42943.15, 42943.15, 0, 'gram', 875, 'gross_weight', 0, 18.5, 17.8, 35.7, '', 'Diamond Hangings', '', '', '', 'https://www.youtube.com/embed/fSHv0-DQ5Ww', 22, 35, '2021-04-07 12:27:04', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-04-07 12:27:04', '', '', 0, 1, 2, 9.61, 9.088, 'Rose gold and white gold', 'anaya', '', '', 0, '22J656001707', 0, 0, '', '', ''),
(393, 'NVT 11', 'NVT 11', 'nvt-11', 56782.6, 56782.6, 0, 'gram', 1500, 'gross_weight', 0, 4.7, 21.3, 20.9, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.87, 10.652, 'Rose gold', '', '', '', 0, '17J986062006', 0, 0, '', '', ''),
(394, 'NVT 12', 'Anaya Yellow Gold Polki Studs ', 'anaya-yellow-gold-polki-studs', 286956.72, 286956.72, 0, 'gram', 960, 'gross_weight', 0, 34.8, 14.8, 82.6, '', 'Where there is diamond, there is woman. We aren’t kidding. Feast your eyes onto the freshly arrived fine-cut diamond earrings that are loud in every shade.', '', '', '', 'https://www.youtube.com/embed/7G9mWI01T8U', 22, 35, '2021-04-09 11:01:14', 1, 1, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-04-09 11:01:14', '', '', 0, 1, 2, 52.91, 51.564, 'Yellow gold', 'anaya', '', '', 0, '17J986082006', 0, 0, '', '', ''),
(395, 'NVT 13', 'Anaya Gold Polki Studs ', 'anaya-gold-polki-studs', 195074.2, 195074.2, 0, 'gram', 960, 'gross_weight', 0, 35.8, 15.3, 62.4, '', 'Where there is diamond, there is woman. We aren’t kidding. Feast your eyes onto the freshly arrived fine-cut diamond earrings that are loud in every shade.', '', '', '', 'https://www.youtube.com/embed/7G9mWI01T8U', 22, 35, '2021-04-09 10:58:07', 1, 1, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-04-09 10:58:07', '', '', 0, 1, 2, 36.08, 35.03, 'Yellow gold', 'anaya', '', '', 0, '17J986072006', 0, 0, '', '', ''),
(396, 'NVT 15', 'NVT 15', 'nvt-15', 16576.64, 16576.64, 0, 'gram', 888, 'gross_weight', 0, 7.7, 15.8, 16.9, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:41', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:41', '2021-03-17 06:31:41', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.63, 3.514, 'Rose gold and white gold', '', '', '', 0, '11J828941801', 0, 0, '', '', ''),
(397, 'NVT 16', 'NVT 16', 'nvt-16', 57337.9, 57337.9, 0, 'gram', 875, 'gross_weight', 0, 19.6, 17.9, 45.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.38, 12.008, 'Rose gold and white gold', '', '', '', 0, '34J567371712', 0, 0, '', '', ''),
(398, 'NVT 17', 'NVT 17', 'nvt-17', 49445.55, 49445.55, 0, 'gram', 975, 'gross_weight', 0, 15.08, 18.6, 33.8, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.17, 10.146, 'Yellow gold', '', '', '', 0, '18J244082007', 0, 0, '', '', ''),
(399, 'NVT 18', 'NVT 18', 'nvt-18', 87345.5, 87345.5, 0, 'gram', 875, 'gross_weight', 0, 21.1, 18.3, 46.9, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 19.22, 18.56, 'Rose gold and white gold', '', '', '', 0, '12J761491802', 0, 0, '', '', ''),
(400, 'NVT 32', 'NVT 32', 'nvt-32', 96983.45, 96983.45, 0, 'gram', 875, 'gross_weight', 0, 24, 16.6, 58, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.79, 20.044, 'Yellow gold', '', '', '', 0, '23J107981807', 0, 0, '', '', ''),
(401, 'NVT 50', 'NVT 50', 'nvt-50', 12415.55, 12415.55, 0, 'gram', 1045, 'gross_weight', 0, 4.9, 13.1, 13.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.63, 2.544, 'Yellow gold', '', '', '', 0, '18J272602007', 0, 0, '', '', '');
INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `included_handling_charge`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `product_video_url`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `product_type`, `sub_product_type`, `is_make_an_order`, `chain_length`, `certificate_number`, `mould_availability`, `cad_availability`, `SEOTitle`, `SEODesc`, `SEOKeywords`) VALUES
(402, 'NVT 58', 'NVT 58', 'nvt-58', 74706.1, 74706.1, 0, 'gram', 875, 'gross_weight', 0, 11.5, 10.4, 33.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 17.1, 15.722, 'Yellow gold', '', '', '', 0, '25J665591808', 0, 0, '', '', ''),
(403, 'NVT 63', 'NVT 63', 'nvt-63', 18164.55, 18164.55, 0, 'gram', 875, 'gross_weight', 0, 9.21, 14.21, 20.57, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.97, 3.866, 'Yellow gold', '', '', '', 0, '18J272542007', 0, 0, '', '', ''),
(404, 'NVT 64', 'NVT 64', 'nvt-64', 57533.45, 57533.45, 0, 'gram', 875, 'gross_weight', 0, 27.2, 11.1, 33.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.23, 12.094, 'Yellow gold', '', '', '', 0, '25J665601808', 0, 0, '', '', ''),
(405, 'NVT 69', 'NVT 69', 'nvt-69', 32105, 32105, 0, 'gram', 875, 'gross_weight', 0, 19.4, 13.3, 31.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 7.16, 6.8, 'Yellow gold', '', '', '', 0, '18J272640227', 0, 0, '', '', ''),
(406, 'NVT 75', 'NVT 75', 'nvt-75', 90989.2, 90989.2, 0, 'gram', 875, 'gross_weight', 0, 19, 15.5, 48.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 4, 21.76, 18.934, 'Yellow gold', '', '', '', 0, 'I2J299900615', 0, 0, '', '', ''),
(407, 'NVT 81', 'NVT 81', 'nvt-81', 54232.25, 54232.25, 0, 'gram', 875, 'gross_weight', 0, 21.3, 16.3, 29.5, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.95, 11.52, 'Yellow gold', '', '', '', 0, '18J336392007', 0, 0, '', '', ''),
(408, 'NVT 83', 'NVT 83', 'nvt-83', 10765.85, 10765.85, 0, 'gram', 875, 'gross_weight', 0, 9.5, 11.1, 18.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.35, 2.292, 'Yellow gold', '', '', '', 0, '18J689542007', 0, 0, '', '', ''),
(409, 'NVT 91', 'NVT 91', 'nvt-91', 21283.9, 21283.9, 0, 'gram', 875, 'gross_weight', 0, 9.7, 14.9, 26, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.66, 4.528, 'Yellow gold', '', '', '', 0, '18J689452007', 0, 0, '', '', ''),
(410, 'NVT 95', 'NVT 95', 'nvt-95', 10960.45, 10960.45, 0, 'gram', 875, 'gross_weight', 0, 4.8, 11.9, 23.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.39, 2.334, 'Yellow gold', '', '', '', 0, '18J689492007', 0, 0, '', '', ''),
(411, 'NVT 109', 'NVT 109', 'nvt-109', 18776.9, 18776.9, 0, 'gram', 875, 'gross_weight', 0, 8.5, 12.6, 36.5, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.14, 3.988, 'Yellow gold', '', '', '', 0, '18J689472007', 0, 0, '', '', ''),
(412, 'NVT 114', 'NVT 114', 'nvt-114', 9609.3, 9609.3, 0, 'gram', 875, 'gross_weight', 0, 9.2, 10.7, 20.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.14, 2.036, 'Yellow gold', '', '', '', 0, '18J689512007', 0, 0, '', '', ''),
(413, 'NVT 118', 'NVT 118', 'nvt-118', 18868.1, 18868.1, 0, 'gram', 1375, 'gross_weight', 0, 9.01, 12.8, 24.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:01:42', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:01:42', '2021-03-17 06:31:42', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.74, 3.612, 'White gold', '', '', '', 0, '19J409342008', 0, 0, '', '', ''),
(414, 'NVT 79', 'NVT 79', 'nvt-79', 14326.55, 14326.55, 0, 'per gram', 967, 'gross_weight', 0, 11.5, 12.47, 9.47, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.05, 2.994, 'yellow gold', '', '', '', 0, '18J616491705', 0, 0, '', '', ''),
(415, 'NVT 93', 'NVT 93', 'nvt-93', 20332.55, 20332.55, 0, 'per gram', 875, 'gross_weight', 0, 12.4, 16.5, 15.4, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.45, 4.326, 'yellow gold', '', '', '', 0, '15J378251803', 0, 0, '', '', ''),
(416, 'NVT 106', 'NVT 106', 'nvt-106', 16174.05, 16174.05, 0, 'per gram', 975, 'gross_weight', 0, 7.6, 12.3, 18.3, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.47, 3.366, 'yellow gold', '', '', '', 0, '20J712431706', 0, 0, '', '', ''),
(417, 'NVT 108', 'NVT 108', 'nvt-108', 6799.7, 6799.7, 0, 'per gram', 875, 'gross_weight', 0, 7.1, 13.6, 7.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.5, 1.444, 'yellow gold', '', '', '', 0, '18J689562007', 0, 0, '', '', ''),
(418, 'NVT 110', 'NVT 110', 'nvt-110', 21847.2, 21847.2, 0, 'per gram', 875, 'gross_weight', 0, 10.64, 14.4, 26.82, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.8, 4.644, 'yellow gold', '', '', '', 0, '18J689462007', 0, 0, '', '', ''),
(419, 'NVT 123', 'NVT 123', 'nvt-123', 12572.79, 12572.79, 0, 'per gram', 1037, 'gross_weight', 0, 9.28, 13.94, 12, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.67, 2.58, 'yellow gold', '', '', '', 0, 'I5J591370913', 0, 0, '', '', ''),
(420, 'NVT 133', 'NVT 133', 'nvt-133', 19660.55, 19660.55, 0, 'per gram', 875, 'gross_weight', 0, 7.04, 13.06, 15.08, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.29, 4.186, 'yellow gold', '', '', '', 0, 'I4J483690216', 0, 0, '', '', ''),
(421, 'NVT 136', 'NVT 136', 'nvt-136', 14334.9, 14334.9, 0, 'per gram', 959, 'gross_weight', 0, 8.04, 13.98, 16.95, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.1, 2.99, 'yellow gold', '', '', '', 0, 'I4J483780216', 0, 0, '', '', ''),
(422, 'NVT 156', 'NVT 156', 'nvt-156', 11785.2, 11785.2, 0, 'fix', 3000, 'fix', 0, 7.9, 13.9, 8.4, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.77, 1.704, 'yellow gold', '', '', '', 0, '19J486602008', 0, 0, '', '', ''),
(423, 'NVT 170', 'NVT 170', 'nvt-170', 18048.4, 18048.4, 0, 'fix', 3000, 'fix', 0, 11.7, 13.4, 11.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.7, 2.618, 'yellow gold', '', '', '', 0, '19J486652008', 0, 0, '', '', ''),
(424, 'NVT 202', 'NVT 202', 'nvt-202', 115547.15, 115547.15, 0, 'fix', 875, 'fix', 0, 27.4, 16.7, 27.4, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 26.01, 24.418, 'yellow gold', '', '', '', 0, '10J099232001', 0, 0, '', '', ''),
(425, 'NVT 242', 'NVT 242', 'nvt-242', 15031.78, 15031.78, 0, 'per gram', 934, 'gross_weight', 0, 7.1, 12.5, 16.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.27, 3.152, 'yellow gold', '', '', '', 0, 'I4J407351015', 0, 0, '', '', ''),
(426, 'NVT 305', 'NVT 305', 'nvt-305', 10024.98, 10024.98, 0, 'per gram', 1203, 'gross_weight', 0, 6.5, 12.5, 10.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.06, 1.986, 'yellow gold', '', '', '', 0, '16J265691803', 0, 0, '', '', ''),
(427, 'NVT 306', 'NVT 306', 'nvt-306', 11729.95, 11729.95, 0, 'per gram', 1087, 'gross_weight', 0, 6.8, 12.8, 10.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.45, 2.386, 'yellow gold', '', '', '', 0, '16J265741803', 0, 0, '', '', ''),
(428, 'NVT 312', 'NVT 312', 'nvt-312', 12656.1, 12656.1, 0, 'per gram', 1031, 'gross_weight', 0, 7.09, 13.31, 11.77, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.7, 2.598, 'yellow gold', '', '', '', 0, '18J357051804', 0, 0, '', '', ''),
(429, 'NVT 325', 'NVT 325', 'nvt-325', 38643.8, 38643.8, 0, 'per gram', 875, 'gross_weight', 0, 11.74, 20.3, 14.89, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 8.44, 8.226, 'yellow gold', '', '', '', 0, 'I1J160240914', 0, 0, '', '', ''),
(430, 'NVT 347', 'NVT 347', 'nvt-347', 52208.65, 52208.65, 0, 'per gram', 875, 'gross_weight', 0, 18.9, 17.3, 26.7, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.47, 11.098, 'yellow gold', '', '', '', 0, 'I2J286060515', 0, 0, '', '', ''),
(431, 'NVT 363', 'NVT 363', 'nvt-363', 8407.14, 8407.14, 0, 'per gram', 1379, 'gross_weight', 0, 6.3, 12.7, 9.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.66, 1.61, 'yellow gold', '', '', '', 0, '18J616431705', 0, 0, '', '', ''),
(432, 'NVT 385', 'NVT 385', 'nvt-385', 10192.17, 10192.17, 0, 'per gram', 1193, 'gross_weight', 0, 4.8, 14.6, 6.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.09, 2.026, 'yellow gold', '', '', '', 0, 'I5J591460916', 0, 0, '', '', ''),
(433, 'NVT 388', 'NVT 388', 'nvt-388', 9668.05, 9668.05, 0, 'per gram', 1271, 'gross_weight', 0, 5.7, 12.5, 10.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.95, 1.892, 'yellow gold', '', '', '', 0, '18J356961804', 0, 0, '', '', ''),
(434, 'NVT 399', 'NVT 399', 'nvt-399', 91318.35, 91318.35, 0, 'per gram', 875, 'gross_weight', 0, 24.8, 24.8, 25.7, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 13:03:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:02', '2021-03-17 06:33:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 21.45, 19.092, 'yellow gold', '', '', '', 0, '24J305771807', 0, 0, '', '', ''),
(435, 'NVT 134', 'NVT 134', 'nvt-134', 12484.14, 12484.14, 0, 'per gram', 1039, 'gross_weight', 0, 5.99, 14.08, 15.3, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.66, 2.558, 'yellow gold', '', '', '', 0, 'I5J589840916', 0, 0, '', '', ''),
(436, 'NVT 86', 'NVT 86', 'nvt-86', 17668.95, 17668.95, 0, 'per gram', 875, 'gross_weight', 0, 7.4, 12.9, 17.6, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.89, 3.754, 'yellow gold', '', '', '', 0, '18J689432007', 0, 0, '', '', ''),
(437, 'NVT 103', 'NVT 103', 'nvt-103', 16286.9, 16286.9, 0, 'per gram', 975, 'gross_weight', 0, 6.5, 11.6, 14.8, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.5, 3.388, 'yellow gold', '', '', '', 0, 'I4J407381015', 0, 0, '', '', ''),
(438, 'NVT 486', 'NVT 486', 'nvt-486', 35842.25, 35842.25, 0, 'per gram', 875, 'gross_weight', 0, 7.4, 15.7, 20.5, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 7.87, 7.62, 'white gold', '', '', '', 0, '11J832261901', 0, 0, '', '', ''),
(439, 'NVT 671', 'NVT 671', 'nvt-671', 22361.45, 22361.45, 0, 'per gram', 875, 'gross_weight', 0, 8.5, 13.4, 17.6, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.91, 4.754, 'yellow gold', '', '', '', 0, '17J910971705', 0, 0, '', '', ''),
(440, 'NVT 39', 'NVT 39', 'nvt-39', 15541.6, 15541.6, 0, 'per gram', 920, 'gross_weight', 0, 9.06, 14.5, 9.06, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.37, 3.274, 'yellow gold', '', '', '', 0, '18J616371705', 0, 0, '', '', ''),
(441, 'NVT 115', 'NVT 115', 'nvt-115', 17541.6, 17541.6, 0, 'per gram', 875, 'gross_weight', 0, 9.03, 13.6, 18.4, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.84, 3.732, 'yellow gold', '', '', '', 0, '17J911171705', 0, 0, '', '', ''),
(442, 'NVT 138', 'NVT 138', 'nvt-138', 16025.22, 16025.22, 0, 'per gram', 902, 'gross_weight', 0, 7.2, 11.8, 17.1, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.51, 3.384, 'yellow gold', '', '', '', 0, '17J911141705', 0, 0, '', '', ''),
(443, 'NVT 681', 'NVT 681', 'nvt-681', 11564.7, 11564.7, 0, 'per gram', 1095, 'gross_weight', 0, 4.65, 14.1, 14.7, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.42, 2.346, 'yellow gold', '', '', '', 0, '18J356861804', 0, 0, '', '', ''),
(444, 'NVT 71', 'NVT 71', 'nvt-71', 15998.89, 15998.89, 0, 'per gram', 907, 'gross_weight', 0, 8.8, 13.5, 18.9, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.47, 3.382, 'yellow gold', '', '', '', 0, '18J272612007', 0, 0, '', '', ''),
(445, 'NVT 80', 'NVT 80', 'nvt-80', 15146.99, 15146.99, 0, 'per gram', 931, 'gross_weight', 0, 6.29, 13.1, 17.8, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.29, 3.18, 'yellow gold', '', '', '', 0, '18J454552007', 0, 0, '', '', ''),
(446, 'NVT 139', 'NVT 139', 'nvt-139', 16213.12, 16213.12, 0, 'per gram', 901, 'gross_weight', 0, 5.9, 13.9, 19.3, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.52, 3.432, 'yellow gold', '', '', '', 0, '17J911151705', 0, 0, '', '', ''),
(447, 'NVT 121', 'NVT 121', 'nvt-121', 23736.55, 23736.55, 0, 'per gram', 875, 'gross_weight', 0, 4.8, 12.8, 18.4, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.17, 5.056, 'yellow gold', '', '', '', 0, 'I4J486450316', 0, 0, '', '', ''),
(448, 'NVT 111', 'NVT 111', 'nvt-111', 16729.35, 16729.35, 0, 'per gram', 875, 'gross_weight', 0, 8.1, 13.09, 17.8, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.65, 3.562, 'yellow gold', '', '', '', 0, '17J911121705', 0, 0, '', '', ''),
(449, 'NVT 128', 'NVT 128', 'nvt-128', 15870.3, 15870.3, 0, 'per gram', 885, 'gross_weight', 0, 8.86, 13.68, 18.12, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.66, 3.324, 'yellow gold', '', '', '', 0, '17J910941705', 0, 0, '', '', ''),
(450, 'NVT 112', 'NVT 112', 'nvt-112', 16845.84, 16845.84, 0, 'per gram', 883, 'gross_weight', 0, 6.5, 13.04, 16.7, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.68, 3.578, 'yellow gold', '', '', '', 0, '20J712421706', 0, 0, '', '', ''),
(451, 'NVT 66', 'NVT 66', 'nvt-66', 13359.86, 13359.86, 0, 'per gram', 998, 'gross_weight', 0, 5.8, 10.5, 17.9, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.87, 2.762, 'yellow gold', '', '', '', 0, '18J454562007', 0, 0, '', '', ''),
(452, 'NVT 245', 'NVT 245', 'nvt-245', 12362.1, 12362.1, 0, 'per gram', 1050, 'gross_weight', 0, 6.09, 11.7, 14.7, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.61, 2.532, 'yellow gold', '', '', '', 0, 'I4J483790216', 0, 0, '', '', ''),
(453, 'NVT 102', 'NVT 102', 'nvt-102', 23030, 23030, 0, 'per gram', 875, 'gross_weight', 0, 10.4, 12.6, 18.9, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.04, 4.9, 'yellow gold', '', '', '', 0, 'I4J483660216', 0, 0, '', '', ''),
(454, 'NVT 310', 'NVT 310', 'nvt-310', 21929.65, 21929.65, 0, 'per gram', 875, 'gross_weight', 0, 7.8, 13.5, 14.5, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.79, 4.668, 'yellow gold', '', '', '', 0, '15J378111803', 0, 0, '', '', ''),
(455, 'NVT 308', 'NVT 308', 'nvt-308', 22066.9, 22066.9, 0, 'per gram', 875, 'gross_weight', 0, 9.33, 13.8, 16.6, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.86, 4.688, 'yellow gold', '', '', '', 0, '15J378101803', 0, 0, '', '', ''),
(456, 'NVT 74', 'NVT 74', 'nvt-74', 14416.42, 14416.42, 0, 'per gram', 954, 'gross_weight', 0, 6.6, 12.4, 17.2, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.13, 3.008, 'yellow gold', '', '', '', 0, '18J272582007', 0, 0, '', '', ''),
(457, 'NVT 122', 'NVT 122', 'nvt-122', 17029.65, 17029.65, 0, 'per gram', 875, 'gross_weight', 0, 7.2, 12.5, 19.9, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.75, 3.618, 'yellow gold', '', '', '', 0, '17J910951705', 0, 0, '', '', ''),
(458, 'NVT 303', 'NVT 303', 'nvt-303', 23469.4, 23469.4, 0, 'per gram', 875, 'gross_weight', 0, 9.7, 14, 19.4, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.16, 4.988, 'yellow gold', '', '', '', 0, '15J378231803', 0, 0, '', '', ''),
(459, 'NVT 35', 'NVT 35', 'nvt-35', 14171.9, 14171.9, 0, 'per gram', 970, 'gross_weight', 0, 7.8, 13.1, 15.8, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.03, 2.956, 'yellow gold', '', '', '', 0, '18J272632007', 0, 0, '', '', ''),
(460, 'NVT 72', 'NVT 72', 'nvt-72', 11133.96, 11133.96, 0, 'per gram', 1111, 'gross_weight', 0, 6, 12.7, 15.4, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.36, 2.24, 'yellow gold', '', '', '', 0, '18J272622007', 0, 0, '', '', ''),
(461, 'NVT 26', 'NVT 26', 'nvt-26', 12103.24, 12103.24, 0, 'per gram', 1068, 'gross_weight', 0, 6.8, 12.2, 10.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.53, 2.474, 'yellow gold', '', '', '', 0, 'I6J610961016', 0, 0, '', '', ''),
(462, 'NVT 37', 'NVT 37', 'nvt-37', 18251.35, 18251.35, 0, 'per gram', 875, 'gross_weight', 0, 6.8, 12.2, 10.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.13, 3.852, 'yellow gold', '', '', '', 0, 'I1J140630714', 0, 0, '', '', ''),
(463, 'NVT 40', 'NVT 40', 'nvt-40', 14820.57, 14820.57, 0, 'per gram', 939, 'gross_weight', 0, 11.8, 12.9, 17.4, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.23, 3.102, 'yellow gold', '', '', '', 0, '18J454542007', 0, 0, '', '', ''),
(464, 'NVT 41', 'NVT 41', 'nvt-41', 14336.68, 14336.68, 0, 'per gram', 964, 'gross_weight', 0, 8.8, 14.4, 8.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.07, 2.994, 'yellow gold', '', '', '', 0, '17J910891705', 0, 0, '', '', ''),
(465, 'NVT 43', 'NVT 43', 'nvt-43', 19500.95, 19500.95, 0, 'per gram', 875, 'gross_weight', 0, 12.57, 15.76, 12.57, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.29, 4.144, 'yellow gold', '', '', '', 0, 'I2J220920115', 0, 0, '', '', ''),
(466, 'NVT 44', 'NVT 44', 'nvt-44', 20443.55, 20443.55, 0, 'per gram', 875, 'gross_weight', 0, 11.13, 15.87, 11.13, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.49, 4.346, 'yellow gold', '', '', '', 0, '17J910921705', 0, 0, '', '', ''),
(467, 'NVT 48', 'NVT 48', 'nvt-48', 14323.89, 14323.89, 0, 'per gram', 961, 'gross_weight', 0, 7.7, 12.8, 16.5, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.09, 2.988, 'yellow gold', '', '', '', 0, '18J272572007', 0, 0, '', '', ''),
(468, 'NVT 51', 'NVT 51', 'nvt-51', 15168.2, 15168.2, 0, 'per gram', 930, 'gross_weight', 0, 10.7, 14.09, 10.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.3, 3.184, 'yellow gold', '', '', '', 0, 'I5J531330516', 0, 0, '', '', ''),
(469, 'NVT 67', 'NVT 67', 'nvt-67', 9580.41, 9580.41, 0, 'per gram', 1269, 'gross_weight', 0, 9.4, 13.1, 9.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.89, 1.89, 'yellow gold', '', '', '', 0, '18J454572007', 0, 0, '', '', ''),
(470, 'NVT 78', 'NVT 78', 'nvt-78', 20646.9, 20646.9, 0, 'per gram', 875, 'gross_weight', 0, 12.8, 14.3, 12.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:03:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:03:49', '2021-03-17 06:33:49', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.54, 4.388, 'yellow gold', '', '', '', 0, '15J378211803', 0, 0, '', '', ''),
(471, 'NVT 140', 'NVT 140', 'nvt-140', 12865.52, 12865.52, 0, 'gram', 1024, 'gross_weight', 0, 5.6, 13.6, 19.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.73, 2.65, 'Yellow gold', '', '', '', 0, '18J616511705', 0, 0, '', '', ''),
(472, 'NVT 158', 'NVT 158', 'nvt-158', 39032.4, 39032.4, 0, 'gram', 875, 'gross_weight', 0, 11.1, 16.8, 30.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 2, 9.44, 8.098, 'Yellow gold', '', '', '', 0, '30J775041710', 0, 0, '', '', ''),
(473, 'NVT 181', 'NVT 181', 'nvt-181', 106433.95, 106433.95, 0, 'gram', 875, 'gross_weight', 0, 26.8, 16.4, 61.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 4, 25.21, 22.204, 'Yellow gold', '', '', '', 0, '28J223611809', 0, 0, '', '', ''),
(474, 'NVT 182', 'NVT 182', 'nvt-182', 61145.75, 61145.75, 0, 'gram', 875, 'gross_weight', 0, 15.6, 14.6, 45.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 4, 14.77, 12.69, 'Yellow gold', '', '', '', 0, 'I6J624391116', 0, 0, '', '', ''),
(475, 'NVT 183', 'NVT 183', 'nvt-183', 67020.55, 67020.55, 0, 'gram', 875, 'gross_weight', 0, 25.7, 17.7, 41.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 4, 17.81, 13.536, 'Yellow gold', '', '', '', 0, '15J679291803', 0, 0, '', '', ''),
(476, 'NVT 184', 'NVT 184', 'nvt-184', 139885.35, 139885.35, 0, 'gram', 875, 'gross_weight', 0, 23.7, 22.2, 55.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 4, 32.05, 29.432, 'Yellow gold', '', '', '', 0, '28J812101810', 0, 0, '', '', ''),
(477, 'NVT 185', 'NVT 185', 'nvt-185', 6776.4, 6776.4, 0, 'fix', 3000, 'fix', 0, 4.3, 11, 10.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.02, 0.978, 'Yellow gold', '', '', '', 0, '19J486632008', 0, 0, '', '', ''),
(478, 'NVT 191', 'NVT 191', 'nvt-191', 106024.3, 106024.3, 0, 'gram', 875, 'gross_weight', 0, 23.1, 19.6, 53.5, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 4, 24.82, 22.186, 'Yellow gold', '', '', '', 0, '20J719561805', 0, 0, '', '', ''),
(479, 'NVT 194', 'NVT 194', 'nvt-194', 121895.2, 121895.2, 0, 'gram', 875, 'gross_weight', 0, 23, 17.7, 46, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 4, 27.68, 25.704, 'Yellow gold', '', '', '', 0, '29J455211810', 0, 0, '', '', ''),
(480, 'NVT 196', 'NVT 196', 'nvt-196', 120737.1, 120737.1, 0, 'gram', 875, 'gross_weight', 0, 27, 18.7, 57.9, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 4, 28.58, 25.192, 'Yellow gold', '', '', '', 0, '24J627641808', 0, 0, '', '', ''),
(481, 'NVT 199', 'NVT 199', 'nvt-199', 129523.45, 129523.45, 0, 'gram', 875, 'gross_weight', 0, 25.1, 22.8, 53.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:35', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:35', '2021-03-17 06:35:35', 'whitethoughts', '157.47.65.89', 0, 1, 6, 31.23, 26.894, 'Yellow gold', '', '', '', 0, '26J939121809', 0, 0, '', '', ''),
(482, 'NVT 201', 'NVT 201', 'nvt-201', 54401.85, 54401.85, 0, 'gram', 875, 'gross_weight', 0, 20, 17.3, 36.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 12.83, 11.362, 'Yellow gold', '', '', '', 0, 'I5J595760916', 0, 0, '', '', ''),
(483, 'NVT 205', 'NVT 205', 'nvt-205', 70703.5, 70703.5, 0, 'gram', 875, 'gross_weight', 0, 15.8, 17.7, 50.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 16.66, 14.77, 'Yellow gold', '', '', '', 0, 'I2J246480315', 0, 0, '', '', ''),
(484, 'NVT 206', 'NVT 206', 'nvt-206', 50326.65, 50326.65, 0, 'gram', 875, 'gross_weight', 0, 12.5, 17.7, 48.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 12.75, 10.308, 'Yellow gold', '', '', '', 0, '26J034291808', 0, 0, '', '', ''),
(485, 'NVT 209', 'NVT 209', 'nvt-209', 32396.85, 32396.85, 0, 'gram', 875, 'gross_weight', 0, 14.4, 15.5, 33.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 8.31, 6.612, 'Yellow gold', '', '', '', 0, '27J193631709', 0, 0, '', '', ''),
(486, 'NVT 211', 'NVT 211', 'nvt-211', 99249.05, 99249.05, 0, 'gram', 875, 'gross_weight', 0, 22.3, 15.81, 40, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.07, 20.806, 'Yellow gold', '', '', '', 0, '23J5055651807', 0, 0, '', '', ''),
(487, 'NVT 213', 'NVT 213', 'nvt-213', 88418.8, 88418.8, 0, 'gram', 875, 'gross_weight', 0, 20.7, 17.7, 45.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 21.68, 18.276, 'Yellow gold', '', '', '', 0, '26J939091809', 0, 0, '', '', ''),
(488, 'NVT 214', 'NVT 214', 'nvt-214', 59076.85, 59076.85, 0, 'gram', 875, 'gross_weight', 0, 14.8, 16.8, 42.8, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.35, 12.012, 'Yellow gold', '', '', '', 0, '24J305741807', 0, 0, '', '', ''),
(489, 'NVT 215', 'NVT 215', 'nvt-215', 76625.55, 76625.55, 0, 'gram', 875, 'gross_weight', 0, 22.8, 16.1, 55.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 19.45, 15.686, 'Yellow gold', '', '', '', 0, '26J939071809', 0, 0, '', '', ''),
(490, 'NVT 222', 'NVT 222', 'nvt-222', 90970.15, 90970.15, 0, 'gram', 875, 'gross_weight', 0, 24.6, 15.6, 55.8, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 21.33, 19.028, 'Yellow gold', '', '', '', 0, 'I2J269550415', 0, 0, '', '', ''),
(491, 'NVT 223', 'NVT 223', 'nvt-223', 62106.05, 62106.05, 0, 'gram', 875, 'gross_weight', 0, 21.12, 18.29, 45.39, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.67, 13.196, 'Yellow gold', '', '', '', 0, '26J034311808', 0, 0, '', '', ''),
(492, 'NVT 224', 'NVT 224', 'nvt-224', 102078.35, 102078.35, 0, 'gram', 875, 'gross_weight', 0, 18.6, 16.9, 61.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 22.89, 21.592, 'Yellow gold', '', '', '', 0, '25J665581808', 0, 0, '', '', ''),
(493, 'NVT 225', 'NVT 225', 'nvt-225', 143338.15, 143338.15, 0, 'gram', 875, 'gross_weight', 0, 29.6, 16.6, 58.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 37.49, 29.088, 'Yellow gold', '', '', '', 0, '28J812091810', 0, 0, '', '', ''),
(494, 'NVT 226', 'NVT 226', 'nvt-226', 65236.2, 65236.2, 0, 'gram', 875, 'gross_weight', 0, 14.7, 19.57, 47.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 16.04, 13.474, 'Yellow gold', '', '', '', 0, '28J618601809', 0, 0, '', '', ''),
(495, 'NVT 232', 'NVT 232', 'nvt-232', 94487.9, 94487.9, 0, 'gram', 875, 'gross_weight', 0, 20.4, 19.2, 48.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:05:36', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:05:36', '2021-03-17 06:35:36', 'whitethoughts', '157.47.65.89', 0, 1, 2, 22.18, 19.758, 'Yellow gold', '', '', '', 0, 'I2J241690315', 0, 0, '', '', ''),
(496, 'NVT 235', 'NVT 235', 'nvt-235', 108815.45, 108815.45, 0, 'gram', 875, 'gross_weight', 0, 20, 17, 66.4, '', 'Diamond Hangings', '', '', '', 'https://www.youtube.com/embed/j57UsQeLOxo', 22, 35, '2021-04-08 08:15:10', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:10', '2021-04-08 08:15:10', '', '', 0, 1, 2, 24.11, 23.084, 'Yellow gold', 'anaya', '', '', 0, 'I1J117790614', 0, 0, '', '', ''),
(497, 'NVT 238', 'NVT 238', 'nvt-238', 89849.45, 89849.45, 0, 'gram', 875, 'gross_weight', 0, 18.4, 18.6, 43.8, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:10', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:10', '2021-03-17 06:36:10', 'whitethoughts', '157.47.65.89', 0, 1, 2, 20.11, 19.014, 'Yellow gold', '', '', '', 0, '28J223591809', 0, 0, '', '', ''),
(498, 'NVT 239', 'NVT 239', 'nvt-239', 102584.35, 102584.35, 0, 'gram', 875, 'gross_weight', 0, 23.9, 16.2, 46.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:10', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:10', '2021-03-17 06:36:10', 'whitethoughts', '157.47.65.89', 0, 1, 2, 24.25, 21.412, 'Yellow gold', '', '', '', 0, 'I2J285040515', 0, 0, '', '', ''),
(499, 'NVT 241', 'NVT 241', 'nvt-241', 65441.2, 65441.2, 0, 'gram', 875, 'gross_weight', 0, 15.2, 15.4, 44.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:10', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:10', '2021-03-17 06:36:10', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.84, 13.574, 'Yellow gold', '', '', '', 0, 'I3J390530915', 0, 0, '', '', ''),
(500, 'NVT 244', 'NVT 244', 'nvt-244', 23839.1, 23839.1, 0, 'gram', 875, 'gross_weight', 0, 10.6, 13.9, 29.05, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:10', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:10', '2021-03-17 06:36:10', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.26, 4.832, 'Yellow gold', '', '', '', 0, 'I1J130710714', 0, 0, '', '', ''),
(501, 'NVT 250', 'NVT 250', 'nvt-250', 87554.4, 87554.4, 0, 'gram', 875, 'gross_weight', 0, 18.4, 15.8, 49.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 20.64, 18.288, 'Yellow gold', '', '', '', 0, 'I1J156150914', 0, 0, '', '', ''),
(502, 'NVT 253', 'NVT 253', 'nvt-253', 93519.75, 93519.75, 0, 'gram', 875, 'gross_weight', 0, 19.7, 20.4, 68.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.41, 19.22, 'Yellow gold', '', '', '', 0, '20J712521706', 0, 0, '', '', ''),
(503, 'NVT 259', 'NVT 259', 'nvt-259', 152514.5, 152514.5, 0, 'gram', 775, 'gross_weight', 0, 21.7, 19.5, 75, '', 'Diamond Hangings', '', '', '', 'https://www.youtube.com/embed/ILyYoqH4sy4', 22, 35, '2021-04-08 08:14:09', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-04-08 08:14:09', '', '', 0, 1, 2, 35.82, 32.83, 'Yellow gold', 'anaya', '', '', 0, '17J581661804', 0, 0, '', '', ''),
(504, 'NVT 262', 'NVT 262', 'nvt-262', 113221.65, 113221.65, 0, 'gram', 875, 'gross_weight', 0, 23.3, 14.9, 56.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 26.87, 23.608, 'Yellow gold', '', '', '', 0, '26J231731808', 0, 0, '', '', ''),
(505, 'NVT 263', 'NVT 263', 'nvt-263', 140884.65, 140884.65, 0, 'gram', 875, 'gross_weight', 0, 23.5, 16.6, 62.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 33.47, 29.368, 'Yellow gold', '', '', '', 0, 'I1J120690614', 0, 0, '', '', ''),
(506, 'NVT 265', 'NVT 265', 'nvt-265', 67430.9, 67430.9, 0, 'gram', 875, 'gross_weight', 0, 16.7, 16.4, 46.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 16.62, 13.918, 'Yellow gold', '', '', '', 0, 'I1J130870714', 0, 0, '', '', ''),
(507, 'NVT 266', 'NVT 266', 'nvt-266', 101244.25, 101244.25, 0, 'gram', 875, 'gross_weight', 0, 22.4, 18.8, 58.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 22.51, 21.46, 'Yellow gold', '', '', '', 0, '15J836171803', 0, 0, '', '', ''),
(508, 'NVT 268', 'NVT 268', 'nvt-268', 128421.6, 128421.6, 0, 'gram', 875, 'gross_weight', 0, 22, 20.4, 62.2, '', 'Diamond Hangings', '', '', '', 'https://www.youtube.com/embed/EbQmVZFCnG4', 22, 35, '2021-04-08 08:12:14', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-04-08 08:12:14', '', '', 0, 1, 2, 28.72, 27.182, 'Yellow gold', 'anaya', '', '', 0, '17J581621804', 0, 0, '', '', ''),
(509, 'NVT 269', 'NVT 269', 'nvt-269', 177943.55, 177943.55, 0, 'gram', 875, 'gross_weight', 0, 25, 19.7, 78.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 44.65, 36.546, 'Yellow gold', '', '', '', 0, '10J951941711', 0, 0, '', '', ''),
(510, 'NVT 270', 'NVT 270', 'nvt-270', 104083.4, 104083.4, 0, 'gram', 875, 'gross_weight', 0, 18.1, 19.3, 61.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 24.2, 21.818, 'Yellow gold', '', '', '', 0, '24J006571708', 0, 0, '', '', ''),
(511, 'NVT 271', 'NVT 271', 'nvt-271', 68895.25, 68895.25, 0, 'gram', 875, 'gross_weight', 0, 17.02, 15.5, 43.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 16.07, 14.43, 'Yellow gold', '', '', '', 0, 'I1J130910714', 0, 0, '', '', ''),
(512, 'NVT 273', 'NVT 273', 'nvt-273', 156343.65, 156343.65, 0, 'gram', 875, 'gross_weight', 0, 40.8, 20.6, 66.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 38.63, 32.248, 'Yellow gold', '', '', '', 0, 'I2J232590215', 0, 0, '', '', ''),
(513, 'NVT 293', 'NVT 293', 'nvt-293', 14568.42, 14568.42, 0, 'gram', 954, 'gross_weight', 0, 6.03, 12.7, 20.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.13, 3.048, 'Yellow gold', '', '', '', 0, '15J378171803', 0, 0, '', '', ''),
(514, 'NVT 304', 'NVT 304', 'nvt-304', 18968.05, 18968.05, 0, 'gram', 875, 'gross_weight', 0, 7.9, 13.04, 21, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.15, 4.036, 'Yellow gold', '', '', '', 0, '15J378261803', 0, 0, '', '', ''),
(515, 'NVT 315', 'NVT 315', 'nvt-315', 32555.35, 32555.35, 0, 'gram', 875, 'gross_weight', 0, 11.2, 16.8, 30.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 7.97, 6.732, 'Yellow gold', '', '', '', 0, '22J167061707', 0, 0, '', '', ''),
(516, 'NVT 319', 'NVT 319', 'nvt-319', 35446.95, 35446.95, 0, 'gram', 875, 'gross_weight', 0, 12.9, 17.1, 29.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 8.53, 7.364, 'Yellow gold', '', '', '', 0, '30J774971710', 0, 0, '', '', ''),
(517, 'NVT 324', 'NVT 324', 'nvt-324', 38909.7, 38909.7, 0, 'gram', 875, 'gross_weight', 0, 11.5, 16.6, 30.8, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 9.1, 8.144, 'Yellow gold', '', '', '', 0, '30J775031710', 0, 0, '', '', ''),
(518, 'NVT 335', 'NVT 335', 'nvt-335', 59073.6, 59073.6, 0, 'gram', 875, 'gross_weight', 0, 18.9, 16.2, 48.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 14, 12.322, 'Yellow gold', '', '', '', 0, 'I1J184631114', 0, 0, '', '', ''),
(519, 'NVT 337', 'NVT 337', 'nvt-337', 42718.15, 42718.15, 0, 'gram', 875, 'gross_weight', 0, 18.1, 15.5, 29.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.09, 8.688, 'Yellow gold', '', '', '', 0, 'I2J215030115', 0, 0, '', '', ''),
(520, 'NVT 371', 'NVT 371', 'nvt-371', 22937.65, 22937.65, 0, 'gram', 875, 'gross_weight', 0, 5.1, 14.7, 33.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:11', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:11', '2021-03-17 06:36:11', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.03, 4.878, 'White gold', '', '', '', 0, 'I1J160130914', 0, 0, '', '', ''),
(521, 'NVT 387', 'NVT 387', 'nvt-387', 75185.85, 75185.85, 0, 'gram', 875, 'gross_weight', 0, 28.3, 11.1, 37.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 16.91, 15.892, 'Yellow gold', '', '', '', 0, '30J344141810', 0, 0, '', '', ''),
(522, 'NVT 400', 'NVT 400', 'nvt-400', 119959.4, 119959.4, 0, 'gram', 875, 'gross_weight', 0, 356, 19.7, 53.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 29.88, 24.688, 'Yellow gold', '', '', '', 0, '22J589761707', 0, 0, '', '', ''),
(523, 'NVT 402', 'NVT 402', 'nvt-402', 119144.05, 119144.05, 0, 'gram', 875, 'gross_weight', 0, 25.2, 17.4, 70.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 28.87, 24.706, 'Yellow gold', '', '', '', 0, '15J038991803', 0, 0, '', '', ''),
(524, 'NVT 403', 'NVT 403', 'nvt-403', 87883.45, 87883.45, 0, 'gram', 875, 'gross_weight', 0, 15.1, 15.3, 51.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 19.47, 18.644, 'Yellow gold', '', '', '', 0, '17J168801804', 0, 0, '', '', ''),
(525, 'NVT 406', 'NVT 406', 'nvt-406', 99308.8, 99308.8, 0, 'gram', 875, 'gross_weight', 0, 14, 17.8, 62.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 25.44, 20.276, 'Yellow gold', '', '', '', 0, 'I2J209550115', 0, 0, '', '', ''),
(526, 'NVT 409', 'NVT 409', 'nvt-409', 151350.8, 151350.8, 0, 'gram', 875, 'gross_weight', 0, 29.3, 18.9, 76.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 34.8, 31.816, 'Yellow gold', '', '', '', 0, '18J616421705', 0, 0, '', '', ''),
(527, 'NVT 410', 'NVT 410', 'nvt-410', 83544.9, 83544.9, 0, 'gram', 875, 'gross_weight', 0, 13.9, 15.7, 42.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 18.62, 17.698, 'Yellow gold', '', '', '', 0, 'I2J259340415', 0, 0, '', '', ''),
(528, 'NVT 413', 'NVT 413', 'nvt-413', 98684.5, 98684.5, 0, 'gram', 875, 'gross_weight', 0, 17.3, 16.1, 49.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 22.06, 20.89, 'Yellow gold', '', '', '', 0, 'I2J289320615', 0, 0, '', '', ''),
(529, 'NVT 414', 'NVT 414', 'nvt-414', 172904.45, 172904.45, 0, 'gram', 875, 'gross_weight', 0, 25.8, 18.4, 79.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 40.55, 36.164, 'Yellow gold', '', '', '', 0, '19J059051705', 0, 0, '', '', ''),
(530, 'NVT 423', 'NVT 423', 'nvt-423', 50229.15, 50229.15, 0, 'gram', 1675, 'gross_weight', 0, 19.4, 16.6, 33.8, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 9.37, 9.088, 'White gold/Rose gold', '', '', '', 0, '30J872391810', 0, 0, '', '', ''),
(531, 'NVT 426', 'NVT 426', 'nvt-426', 47368.35, 47368.35, 0, 'gram', 1675, 'gross_weight', 0, 14.8, 11.7, 34.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 8.81, 8.582, 'White gold/Rose gold', '', '', '', 0, '30J872411810', 0, 0, '', '', ''),
(532, 'NVT 433', 'NVT 433', 'nvt-433', 72843.05, 72843.05, 0, 'gram', 1675, 'gross_weight', 0, 24.8, 15.8, 41.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.71, 13.126, 'Rose gold', '', '', '', 0, '30J872401810', 0, 0, '', '', ''),
(533, 'NVT 441', 'NVT 441', 'nvt-441', 115945, 115945, 0, 'gram', 875, 'gross_weight', 0, 25.7, 18.8, 64.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 28.28, 24, 'Yellow gold', '', '', '', 0, '32J758541811', 0, 0, '', '', '');
INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `included_handling_charge`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `product_video_url`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `product_type`, `sub_product_type`, `is_make_an_order`, `chain_length`, `certificate_number`, `mould_availability`, `cad_availability`, `SEOTitle`, `SEODesc`, `SEOKeywords`) VALUES
(534, 'NVT 446', 'NVT 446', 'nvt-446', 198027.55, 198027.55, 0, 'gram', 875, 'gross_weight', 0, 34.6, 17.9, 70.8, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 46.41, 41.426, 'Yellow gold', '', '', '', 0, '32J308171811', 0, 0, '', '', ''),
(535, 'NVT 454', 'NVT 454', 'nvt-454', 95830, 95830, 0, 'gram', 875, 'gross_weight', 0, 17.5, 19.8, 55.5, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 21.36, 20.3, 'Yellow gold', '', '', '', 0, '35J637271812', 0, 0, '', '', ''),
(536, 'NVT 457', 'NVT 457', 'nvt-457', 180153.2, 180153.2, 0, 'gram', 875, 'gross_weight', 0, 28.9, 19.4, 62.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 43.84, 37.314, 'Yellow gold', '', '', '', 0, '33J569261811', 0, 0, '', '', ''),
(537, 'NVT 464', 'NVT 464', 'nvt-464', 86144.96, 86144.96, 0, 'gram', 960, 'gross_weight', 0, 23.7, 13.9, 33.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.92, 15.472, 'Yellow gold', '', '', '', 0, '35J240261812', 0, 0, '', '', ''),
(538, 'NVT 465', 'NVT 465', 'nvt-465', 82106.4, 82106.4, 0, 'gram', 960, 'gross_weight', 0, 24.6, 14.7, 33.5, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.11, 14.76, 'Yellow gold', '', '', '', 0, '35J240271812', 0, 0, '', '', ''),
(539, 'NVT 557', 'NVT 557', 'nvt-557', 195649.15, 195649.15, 0, 'gram', 875, 'gross_weight', 0, 45.4, 20.5, 69.4, '', 'Diamond Hangings', '', '', '', 'https://www.youtube.com/embed/DWorPrVN7ZY', 22, 35, '2021-04-08 08:10:45', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-04-08 08:10:45', '', '', 0, 1, 2, 43.77, 41.408, 'Yellow gold', 'anaya', '', '', 0, '21J238081905', 0, 0, '', '', ''),
(540, 'NVT 559', 'NVT 559', 'nvt-559', 172790.05, 172790.05, 0, 'gram', 875, 'gross_weight', 0, 30.9, 21.1, 72.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 41.67, 35.876, 'Yellow gold', '', '', '', 0, '22J286501906', 0, 0, '', '', ''),
(541, 'NVT 574', 'NVT 574', 'nvt-574', 116459.8, 116459.8, 0, 'gram', 1375, 'gross_weight', 0, 26, 16.9, 58.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.08, 22.296, 'White gold/Rose gold', '', '', '', 0, '33J922861911', 0, 0, '', '', ''),
(542, 'NVT 577', 'NVT 577', 'nvt-577', 23184.7, 23184.7, 0, 'gram', 875, 'gross_weight', 0, 6.9, 15.3, 26, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.46, 4.844, 'Yellow gold', '', '', '', 0, '26J334021908', 0, 0, '', '', ''),
(543, 'NVT 578', 'NVT 578', 'nvt-578', 21495.25, 21495.25, 0, 'gram', 875, 'gross_weight', 0, 7.21, 14.4, 29.4, '', 'Diamond Hangings', '', '', '', 'https://www.youtube.com/embed/nCcI6fGwySE', 22, 35, '2021-04-08 08:09:49', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-04-08 08:09:49', '', '', 0, 1, 2, 5.11, 4.48, 'Yellow gold', 'anaya', '', '', 0, '26J333981908', 0, 0, '', '', ''),
(544, 'NVT 579', 'NVT 579', 'nvt-579', 19827.45, 19827.45, 0, 'gram', 875, 'gross_weight', 0, 5.8, 14.3, 30.4, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.75, 4.124, 'Yellow gold', '', '', '', 0, '26J333991908', 0, 0, '', '', ''),
(545, 'NVT 580', 'NVT 580', 'nvt-580', 19242.5, 19242.5, 0, 'gram', 875, 'gross_weight', 0, 7.6, 13.1, 30.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:06:37', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:06:37', '2021-03-17 06:36:37', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.62, 4, 'Yellow gold', '', '', '', 0, '26J334001908', 0, 0, '', '', ''),
(546, 'NVT 591', 'NVT 591', 'nvt-591', 14342.72, 14342.72, 0, 'gram', 968, 'gross_weight', 0, 2.1, 13.2, 11.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.04, 3, 'Yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(547, 'NVT 592', 'NVT 592', 'nvt-592', 14173, 14173, 0, 'gram', 975, 'gross_weight', 0, 2.1, 13.1, 11.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3, 2.96, 'Yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(548, 'NVT 594', 'NVT 594', 'nvt-594', 84858.65, 84858.65, 0, 'gram', 875, 'gross_weight', 0, 21, 21.3, 46.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 19.47, 17.848, 'White gold/Rose gold', '', '', '', 0, '21J503951806', 0, 0, '', '', ''),
(549, 'NVT 666', 'NVT 666', 'nvt-666', 53266.65, 53266.65, 0, 'gram', 875, 'gross_weight', 0, 13.6, 19.6, 36.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.55, 11.358, 'White gold/Rose gold', '', '', '', 0, '31J078641910', 0, 0, '', '', ''),
(550, 'NVT 668', 'NVT 668', 'nvt-668', 99215.95, 99215.95, 0, 'gram', 875, 'gross_weight', 0, 18.9, 16.6, 58.42, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 22.65, 20.894, 'Yellow gold', '', '', '', 0, '31J078701910', 0, 0, '', '', ''),
(551, 'NVT 670', 'NVT 670', 'nvt-670', 43624.4, 43624.4, 0, 'gram', 875, 'gross_weight', 0, 11.5, 18.3, 45.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 9.52, 9.288, 'Rose gold', '', '', '', 0, '31J078681910', 0, 0, '', '', ''),
(552, 'NVT 674', 'NVT 674', 'nvt-674', 103433.2, 103433.2, 0, 'gram', 875, 'gross_weight', 0, 21.4, 19.1, 49.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.04, 21.914, 'Yellow gold', '', '', '', 0, '31J789421910', 0, 0, '', '', ''),
(553, 'NVT 680', 'NVT 680', 'nvt-680', 35160.95, 35160.95, 0, 'gram', 875, 'gross_weight', 0, 11.72, 13.9, 28.06, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 8.29, 7.344, 'Yellow gold', '', '', '', 0, 'I4J426161115', 0, 0, '', '', ''),
(554, 'NVT 722', 'NVT 722', 'nvt-722', 48582.1, 48582.1, 0, 'gram', 875, 'gross_weight', 0, 14.6, 16.2, 40.01, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.26, 10.192, 'Yellow gold', '', '', '', 0, '16J142052003', 0, 0, '', '', ''),
(555, 'NVT 754', 'NVT 754', 'nvt-754', 17621.05, 17621.05, 0, 'gram', 1375, 'gross_weight', 0, 6.8, 16.7, 18.99, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.43, 3.396, 'white gold', '', '', '', 0, '23J194242010', 0, 0, '', '', ''),
(556, 'NVT 761', 'NVT 761', 'nvt-761', 215377.15, 215377.15, 0, 'gram', 975, 'gross_weight', 0, 40.6, 20.8, 65.1, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 49.81, 43.898, 'Yellow gold', '', '', '', 0, '23J436892010', 0, 0, '', '', ''),
(557, 'NVT 774', 'NVT 774', 'nvt-774', 250746.65, 250746.65, 0, 'gram', 875, 'gross_weight', 0, 38.04, 20.3, 87.03, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 58.75, 52.458, 'Yellow gold', '', '', '', 0, '24J995002011', 0, 0, '', '', ''),
(558, 'NZT 8', 'NZT 8', 'nzt-8', 78376.45, 78376.45, 0, 'gram', 1375, 'gross_weight', 0, 25.3, 15.1, 40.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.95, 14.854, 'white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(559, 'NZT 9', 'NZT 9', 'nzt-9', 51055, 51055, 0, 'gram', 1375, 'gross_weight', 0, 14.06, 14.9, 49.9, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.6, 9.6, 'white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(560, 'NZT 10', 'NZT 10', 'nzt-10', 53894, 53894, 0, 'gram', 1375, 'gross_weight', 0, 10.1, 14.4, 45.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.2, 10.13, 'white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(561, 'NZT 11', 'NZT 11', 'nzt-11', 72862.5, 72862.5, 0, 'gram', 1375, 'gross_weight', 0, 23.8, 15.1, 74.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.42, 10.7, 'white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(562, 'NZT 12', 'NZT 12', 'nzt-12', 63977, 63977, 0, 'gram', 1375, 'gross_weight', 0, 18.7, 16.7, 57.7, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.88, 11.09, 'white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(563, 'NZT 13', 'NZT 13', 'nzt-13', 42101.25, 42101.25, 0, 'gram', 1375, 'gross_weight', 0, 7, 15.2, 40.01, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.55, 6.9, 'white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(564, 'NZT 20', 'NZT 20', 'nzt-20', 47971.25, 47971.25, 0, 'gram', 1375, 'gross_weight', 0, 19.7, 15.2, 30.5, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:08:51', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:08:51', '2021-03-17 06:38:51', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.43, 8.85, 'rose gold', '', '', '', 0, '27J099641809', 0, 0, '', '', ''),
(565, 'NZT 24', 'NZT 24', 'nzt-24', 71108.45, 71108.45, 0, 'gram', 1375, 'gross_weight', 0, 15.7, 18.4, 34.5, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 15.39, 13.144, 'rose gold', '', '', '', 0, '27J099691809', 0, 0, '', '', ''),
(566, 'NZT 25', 'NZT 25', 'nzt-25', 146049.15, 146049.15, 0, 'gram', 1375, 'gross_weight', 0, 29.3, 20.4, 68.3, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 29.09, 27.908, 'White gold/Rose gold', '', '', '', 0, '27J099721809', 0, 0, '', '', ''),
(567, 'NZT 31', 'NZT 31', 'nzt-31', 70527.35, 70527.35, 0, 'gram', 875, 'gross_weight', 0, 14.1, 19.7, 51.2, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 17.97, 14.422, 'Yellow gold', '', '', '', 0, '11J259431801', 0, 0, '', '', ''),
(568, 'NZT 43', 'NZT 43', 'nzt-43', 31963.27, 31963.27, 0, 'gram', 1300, 'gross_weight', 0, 12.3, 15.8, 31.6, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 9.95, 6.47, 'white gold', '', '', '', 0, '', 0, 0, '', '', ''),
(569, 'NVJ 2', 'NVJ 2', 'nvj-2', 63045.3, 63045.3, 0, 'gram', 875, 'gross_weight', 0, 16.5, 13.6, 56.7, '', 'Diamond Jumkis', '', '', '', 'https://www.youtube.com/embed/94gLQmLalRE', 22, 36, '2021-04-07 12:22:29', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-07 12:22:29', '', '', 0, 1, 2, 16.22, 12.856, 'Yellow gold', 'anaya', '', '', 0, '19J487362008', 0, 0, '', '', ''),
(570, 'NVJ 15', 'NVJ 15', 'nvj-15', 112940.25, 112940.25, 0, 'gram', 875, 'gross_weight', 0, 25.5, 19.1, 44.1, '', 'Diamond Jumkis', '', '', '', 'https://www.youtube.com/embed/V6GI78SZqis', 22, 36, '2021-04-07 12:21:06', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-07 12:21:06', '', '', 0, 1, 2, 25.15, 23.93, 'Yellow gold', 'anaya', '', '', 0, '26J854061709', 0, 0, '', '', ''),
(571, 'NVJ 29', 'Gold Polki Pendant - Ruby Gemstone ', 'gold-polki-pendant-ruby-gemstone', 57576.15, 57576.15, 0, 'gram', 975, 'gross_weight', 0, 16.2, 15, 28.6, '', 'Win it with the fine-toned polki earrings that arrive in every shade and diverse stones to make you the fashion diva. Pick your favorites here. ', '', '', '', 'https://www.youtube.com/embed/TTZphbsw-qs', 3, 34, '2021-04-09 11:03:45', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-09 11:03:45', '', '', 0, 1, 2, 12.33, 11.988, 'Yellow gold', 'anaya', '', '', 0, '12J288561902', 0, 0, '', '', ''),
(572, 'NVJ 32', 'NVJ 32', 'nvj-32', 71886.3, 71886.3, 0, 'gram', 975, 'gross_weight', 0, 17.4, 15.7, 37.5, '', 'Diamond Jumkis', '', '', '', 'https://www.youtube.com/embed/mDG8NBgHqMQ', 22, 36, '2021-04-07 12:19:05', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-07 12:19:05', '', '', 0, 1, 2, 17.7, 14.376, 'Yellow gold', 'anaya', '', '', 0, '23J702381906', 0, 0, '', '', ''),
(573, 'NVJ 33', 'NVJ 33', 'nvj-33', 56708.55, 56708.55, 0, 'gram', 975, 'gross_weight', 0, 16.8, 16.4, 39.2, '', 'Diamond Jumkis', '', '', '', 'https://www.youtube.com/embed/RKwnI1MgP54', 22, 36, '2021-04-07 12:18:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-07 12:18:02', '', '', 0, 1, 2, 14.41, 11.226, 'Yellow gold', 'anaya', '', '', 0, '22J814511906', 0, 0, '', '', ''),
(574, 'NVJ 38', 'Anaya Emerald Gemstone Polki Hangings', 'anaya-emerald-gemstone-polki-hangings', 39715.6, 39715.6, 0, 'gram', 875, 'gross_weight', 0, 19.5, 19.5, 24.4, '', 'Win it with the fine-toned polki earrings that arrive in every shade and diverse stones to make you the fashion diva. Pick your favorites here. ', '', '', '', 'https://www.youtube.com/embed/5W3uMq_I2qo', 22, 36, '2021-04-09 11:02:27', 1, 1, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-09 11:02:27', '', '', 0, 1, 2, 10.16, 8.112, 'Yellow gold', 'anaya', '', '', 0, '27J980391909', 0, 0, '', '', ''),
(575, 'NVJ 39', 'NVJ 39', 'nvj-39', 92359.75, 92359.75, 0, 'gram', 875, 'gross_weight', 0, 22.9, 14.5, 38.8, '', 'Diamond Jumkis', '', '', '', 'https://www.youtube.com/embed/uVWPFspdj-4', 22, 36, '2021-04-07 12:30:31', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-07 12:30:31', '', '', 0, 1, 2, 21.65, 19.32, 'Yellow gold', 'anaya', '', '', 0, '28J743461909', 0, 0, '', '', ''),
(576, 'NVJ 48', 'Anaya Ruby Gemstone Polki Studs ', 'anaya-ruby-gemstone-polki-studs', 106865.55, 106865.55, 0, 'gram', 975, 'gross_weight', 0, 19.1, 15.9, 46.8, '', 'Where there is diamond, there is woman. We aren’t kidding. Feast your eyes onto the freshly arrived fine-cut diamond earrings that are loud in every shade.', '', '', '', 'https://www.youtube.com/embed/uGjbSGqYhIs', 22, 36, '2021-04-09 11:01:49', 1, 1, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-04-09 11:01:49', '', '', 0, 1, 2, 24.93, 21.726, 'Yellow gold', 'anaya', '', '', 0, '23J436802010', 0, 0, '', '', ''),
(577, 'NVT 172', 'NVT 172', 'nvt-172', 19755.2, 19755.2, 0, 'fix', 3000, 'fix', 0, 15.8, 13.3, 16.4, '', ' studs', '', '', '', NULL, 22, 23, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.97, 2.854, 'yellow gold', '', '', '', 0, '19J486642008', 0, 0, '', '', ''),
(578, 'NVT 649', 'NVT 649', 'nvt-649', 37679.1, 37679.1, 0, 'per gram', 875, 'gross_weight', 0, 17.65, 18.47, 17.65, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 8.18, 8.032, 'yellow gold', '', '', '', 0, '30J329161910', 0, 0, '', '', ''),
(579, 'NVT 176', 'NVT 176', 'nvt-176', 42460.25, 42460.25, 0, 'per gram', 875, 'gross_weight', 0, 18.1, 16.2, 18.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 9.31, 9.03, 'yellow gold', '', '', '', 0, '20J132911706', 0, 0, '', '', ''),
(580, 'NVT 174', 'NVT 174', 'nvt-174', 26345.1, 26345.1, 0, 'per gram', 875, 'gross_weight', 0, 13.73, 14.63, 13.73, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.78, 5.602, 'yellow gold', '', '', '', 0, '13J609381703', 0, 0, '', '', ''),
(581, 'NVT 179', 'NVT 179', 'nvt-179', 27366, 27366, 0, 'per gram', 875, 'gross_weight', 0, 13.42, 15.71, 13.42, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:09:28', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:09:28', '2021-03-17 06:39:28', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6, 5.82, 'yellow gold', '', '', '', 0, '13J609401703', 0, 0, '', '', ''),
(582, 'NVT 708', 'NVT 708', 'nvt-708', 12728.8, 12728.8, 0, 'fix', 3000, 'fix', 0, 5.5, 14.5, 6.3, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:02', '2021-03-17 06:40:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.93, 1.826, 'yellow gold', '', '', '', 0, '13J838772002', 0, 0, '', '', ''),
(583, 'NVT 342', 'NVT 342', 'nvt-342', 6377.85, 6377.85, 0, 'per gram', 1779, 'gross_weight', 0, 7.1, 9.9, 7.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:02', '2021-03-17 06:40:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.15, 1.14, 'yellow gold', '', '', '', 0, '22J685701806', 0, 0, '', '', ''),
(584, 'NVT 369', 'NVT 369', 'nvt-369', 8688.32, 8688.32, 0, 'per gram', 1352, 'gross_weight', 0, 6.4, 12.4, 6.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:02', '2021-03-17 06:40:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.71, 1.678, 'yellow gold', '', '', '', 0, '18J357011804', 0, 0, '', '', ''),
(585, 'NVT 377', 'NVT 377', 'nvt-377', 8479.31, 8479.31, 0, 'per gram', 1373, 'gross_weight', 0, 6.1, 12.7, 6.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:02', '2021-03-17 06:40:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.67, 1.628, 'yellow gold', '', '', '', 0, '18J356911804', 0, 0, '', '', ''),
(586, 'NVT 97', 'NVT 97', 'nvt-97', 6612.7, 6612.7, 0, 'per gram', 875, 'gross_weight', 0, 7.3, 13.9, 7.3, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:02', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:02', '2021-03-17 06:40:02', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.46, 1.404, 'yellow gold', '', '', '', 0, '18J689572007', 0, 0, '', '', ''),
(587, 'NVT 643', 'NVT 643', 'nvt-643', 16923.6, 16923.6, 0, 'fix', 3000, 'fix', 0, 7.8, 14.4, 11, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.51, 2.472, 'yellow gold', '', '', '', 0, '30J329301910', 0, 0, '', '', ''),
(588, 'NVT 635', 'NVT 635', 'nvt-635', 18450, 18450, 0, 'fix', 3000, 'fix', 0, 9.3, 13.7, 11.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.73, 2.7, 'yellow gold', '', '', '', 0, '30J329291910', 0, 0, '', '', ''),
(589, 'NVT 650', 'NVT 650', 'nvt-650', 16878.4, 16878.4, 0, 'fix', 3000, 'fix', 0, 6.4, 14.3, 9.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.5, 2.468, 'yellow gold', '', '', '', 0, '30J329251910', 0, 0, '', '', ''),
(590, 'NVT 178', 'NVT 178', 'nvt-178', 11482.57, 11482.57, 0, 'per gram', 1097, 'gross_weight', 0, 6, 15, 6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.41, 2.326, 'yellow gold', '', '', '', 0, 'I5J591540916', 0, 0, '', '', ''),
(591, 'NVT 82', 'NVT 82', 'nvt-82', 6292, 6292, 0, 'fix', 3000, 'fix', 0, 3.6, 13.6, 3.6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.97, 0.89, 'yellow gold', '', '', '', 0, '15J378321803', 0, 0, '', '', ''),
(592, 'NVT 321', 'NVT 321', 'nvt-321', 9927.62, 9927.62, 0, 'per gram', 1214, 'gross_weight', 0, 8.25, 14.55, 10.97, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.03, 1.964, 'yellow gold', '', '', '', 0, '18J338841705', 0, 0, '', '', ''),
(593, 'NVT 87', 'NVT 87', 'nvt-87', 3806.57, 3806.57, 0, 'per gram', 1103, 'gross_weight', 0, 8.76, 14.82, 11.61, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.39, 0.308, 'yellow gold', '', '', '', 0, '28J119121809', 0, 0, '', '', ''),
(594, 'NVT 299', 'NVT 299', 'nvt-299', 10148.65, 10148.65, 0, 'per gram', 1221, 'gross_weight', 0, 7.9, 13.08, 7.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.05, 2.012, 'yellow gold', '', '', '', 0, '16J265731803', 0, 0, '', '', ''),
(595, 'NVT 603', 'NVT 603', 'nvt-603', 14936.4, 14936.4, 0, 'fix', 3000, 'fix', 0, 6.4, 14.4, 6.4, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.22, 2.178, 'yellow gold', '', '', '', 0, '29J956551909', 0, 0, '', '', ''),
(596, 'NVT 362', 'NVT 362', 'nvt-362', 7764.68, 7764.68, 0, 'per gram', 1468, 'gross_weight', 0, 6, 12.45, 6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.51, 1.46, 'yellow gold', '', '', '', 0, '18J357001804', 0, 0, '', '', ''),
(597, 'NVT 137', 'NVT 137', 'nvt-137', 10188.35, 10188.35, 0, 'per gram', 1207, 'gross_weight', 0, 6.09, 13.9, 11.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.05, 2.03, 'yellow gold', '', '', '', 0, '22J685631806', 0, 0, '', '', ''),
(598, 'NVT 367', 'NVT 367', 'nvt-367', 11497.77, 11497.77, 0, 'per gram', 1103, 'gross_weight', 0, 5.12, 11.94, 11.11, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.39, 2.332, 'yellow gold', '', '', '', 0, '18J338801705', 0, 0, '', '', ''),
(599, 'NVT 282', 'NVT 282', 'nvt-282', 5143.13, 5143.13, 0, 'per gram', 2199, 'gross_weight', 0, 7.3, 9.7, 5.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.87, 0.85, 'yellow gold', '', '', '', 0, '22J685691807', 0, 0, '', '', ''),
(600, 'NVT 380', 'NVT 380', 'nvt-380', 7538.45, 7538.45, 0, 'per gram', 1509, 'gross_weight', 0, 4.9, 12.1, 8.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.45, 1.408, 'yellow gold', '', '', '', 0, 'I5J589780916', 0, 0, '', '', ''),
(601, 'NVT 408', 'NVT 408', 'nvt-408', 7631.75, 7631.75, 0, 'per gram', 875, 'gross_weight', 0, 6.8, 12.7, 6.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.73, 1.61, 'yellow gold', '', '', '', 0, '12J302162001', 0, 0, '', '', ''),
(602, 'NVT 364', 'NVT 364', 'nvt-364', 9339.64, 9339.64, 0, 'per gram', 1273, 'gross_weight', 0, 6.5, 12.8, 6.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.88, 1.828, 'yellow gold', '', '', '', 0, '18J356831804', 0, 0, '', '', ''),
(603, 'NVT 384', 'NVT 384', 'nvt-384', 10375.04, 10375.04, 0, 'per gram', 1176, 'gross_weight', 0, 5.9, 14.8, 5.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.14, 2.068, 'yellow gold', '', '', '', 0, 'I5J591550916', 0, 0, '', '', ''),
(604, 'NVT  602', 'NVT  602', 'nvt-602', 16704.8, 16704.8, 0, 'fix', 3000, 'fix', 0, 6.9, 13.7, 12.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.47, 2.446, 'yellow gold', '', '', '', 0, '29J956421909', 0, 0, '', '', ''),
(605, 'NVT 323', 'NVT 323', 'nvt-323', 15734.28, 15734.28, 0, 'per gram', 914, 'gross_weight', 0, 8.6, 14.81, 12.61, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.42, 3.318, 'yellow gold', '', '', '', 0, 'SALE', 0, 0, '', '', ''),
(606, 'NVT 725', 'NVT 725', 'nvt-725', 7640.05, 7640.05, 0, 'per gram', 875, 'gross_weight', 0, 7.5, 13.2, 7.5, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.67, 1.626, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(607, 'NVT 186', 'NVT 186', 'nvt-186', 8544.4, 8544.4, 0, 'fix', 3000, 'fix', 0, 7.9, 13.7, 9.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.28, 1.238, 'yellow gold', '', '', '', 0, '19J486622008', 0, 0, '', '', ''),
(608, 'NVT 100', 'NVT 100', 'nvt-100', 15366.8, 15366.8, 0, 'per gram', 920, 'gross_weight', 0, 8.7, 13.4, 15.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.37, 3.228, 'yellow gold', '', '', '', 0, '18J357041804', 0, 0, '', '', ''),
(609, 'NVT 157', 'NVT 157', 'nvt-157', 8680, 8680, 0, 'fix', 3000, 'fix', 0, 6.2, 13.2, 6.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:10:03', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:10:03', '2021-03-17 06:40:03', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.31, 1.25, 'yellow gold', '', '', '', 0, '19J486672008', 0, 0, '', '', ''),
(610, 'NVT 634', 'NVT 634', 'nvt-634', 16591.6, 16591.6, 0, 'fix', 3000, 'fix', 0, 6.2, 15.4, 8.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.45, 2.432, 'yellow gold', '', '', '', 0, '30J3292121910', 0, 0, '', '', ''),
(611, 'NVT188', 'NVT188', 'nvt188', 12676.8, 12676.8, 0, 'fix', 3000, 'fix', 0, 7.9, 13.62, 7.9, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.9, 1.836, 'yellow gold', '', '', '', 0, '19J486612008', 0, 0, '', '', ''),
(612, 'NVT 105', 'NVT 105', 'nvt-105', 8342.45, 8342.45, 0, 'per gram', 875, 'gross_weight', 0, 8.1, 15, 8.3, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.83, 1.774, 'yellow gold', '', '', '', 0, '18J689522007', 0, 0, '', '', ''),
(613, 'NVT 309', 'NVT 309', 'nvt-309', 14895.02, 14895.02, 0, 'per gram', 942, 'gross_weight', 0, 6.98, 11.62, 15.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.21, 3.124, 'yellow gold', '', '', '', 0, '15J378201803', 0, 0, '', '', ''),
(614, 'NVT 622', 'NVT 622', 'nvt-622', 17233.6, 17233.6, 0, 'fix', 3000, 'fix', 0, 7.4, 12.2, 8.4, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.55, 2.522, 'yellow gold', '', '', '', 0, '30J329241910', 0, 0, '', '', ''),
(615, 'NVT 294', 'NVT 294', 'nvt-294', 9222.66, 9222.66, 0, 'per gram', 1281, 'gross_weight', 0, 8.3, 13.4, 8.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.86, 1.8, 'yellow gold', '', '', '', 0, '16J265701803', 0, 0, '', '', ''),
(616, 'NVT 672', 'NVT 672', 'nvt-672', 19341.2, 19341.2, 0, 'fix', 3000, 'fix', 0, 6.5, 13.7, 11.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.87, 2.824, 'yellow gold', '', '', '', 0, '30J329481910', 0, 0, '', '', ''),
(617, 'NVT 98', 'NVT 98', 'nvt-98', 16929.7, 16929.7, 0, 'per gram', 875, 'gross_weight', 0, 9.7, 16.6, 9.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.74, 3.594, 'yellow gold', '', '', '', 0, 'I2J223310115', 0, 0, '', '', ''),
(618, 'NVT 684', 'NVT 684', 'nvt-684', 17640, 17640, 0, 'fix', 3000, 'fix', 0, 9.01, 14.1, 12.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.65, 2.55, 'yellow gold', '', '', '', 0, '13J110662001', 0, 0, '', '', ''),
(619, 'NVT 616', 'NVT 616', 'nvt-616', 14127.6, 14127.6, 0, 'fix', 3000, 'fix', 0, 11.7, 15.5, 11.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.11, 2.052, 'yellow gold', '', '', '', 0, '29J956491909', 0, 0, '', '', ''),
(620, 'NVT 124', 'NVT 124', 'nvt-124', 11745.15, 11745.15, 0, 'per gram', 1087, 'gross_weight', 0, 6.4, 12.6, 18.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.45, 2.39, 'yellow gold', '', '', '', 0, '17J911231705', 0, 0, '', '', ''),
(621, 'NVT 55', 'NVT 55', 'nvt-55', 10674.74, 10674.74, 0, 'per gram', 1154, 'gross_weight', 0, 8, 12.24, 12.32, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.21, 2.138, 'yellow gold', '', '', '', 0, '18J339001705', 0, 0, '', '', ''),
(622, 'NVT 101', 'NVT 101', 'nvt-101', 15320, 15320, 0, 'per gram', 975, 'gross_weight', 0, 9, 13.09, 12.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.28, 3.19, 'yellow gold', '', '', '', 0, '18J338851705', 0, 0, '', '', ''),
(623, 'NVT 60', 'NVT 60', 'nvt-60', 17237.15, 17237.15, 0, 'per gram', 875, 'gross_weight', 0, 9.7, 16.2, 9.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.77, 3.668, 'yellow gold', '', '', '', 0, '17J910881705', 0, 0, '', '', ''),
(624, 'NVT 62', 'NVT 62', 'nvt-62', 11746.94, 11746.94, 0, 'per gram', 1082, 'gross_weight', 0, 10.2, 12.3, 11.1, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.47, 2.388, 'yellow gold', '', '', '', 0, '18J338991705', 0, 0, '', '', ''),
(625, 'NVT 92', 'NVT 92', 'nvt-92', 13477.65, 13477.65, 0, 'per gram', 1001, 'gross_weight', 0, 9.2, 13.7, 12.09, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.85, 2.796, 'yellow gold', '', '', '', 0, '15J378301803', 0, 0, '', '', ''),
(626, 'NVT  113', 'NVT  113', 'nvt-113', 23675.75, 23675.75, 0, 'per gram', 875, 'gross_weight', 0, 14.9, 13.6, 18.6, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.17, 5.04, 'yellow gold', '', '', '', 0, '18J689532007', 0, 0, '', '', ''),
(627, 'NVT 104', 'NVT 104', 'nvt-104', 7500.95, 7500.95, 0, 'per gram', 875, 'gross_weight', 0, 6.7, 14.6, 6.7, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.65, 1.594, 'yellow gold', '', '', '', 0, '18J689422007', 0, 0, '', '', ''),
(628, 'NVT 633', 'NVT 633', 'nvt-633', 24736.7, 24736.7, 0, 'per gram', 875, 'gross_weight', 0, 15.96, 16.5, 18, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.54, 5.234, 'yellow gold', '', '', '', 0, '30J329471910', 0, 0, '', '', ''),
(629, 'NVT 530', 'NVT 530', 'nvt-530', 26398.3, 26398.3, 0, 'per gram', 875, 'gross_weight', 0, 11.9, 15.3, 13.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.78, 5.616, 'yellow gold', '', '', '', 0, '18J059741904', 0, 0, '', '', ''),
(630, 'NVT 291', 'NVT 291', 'nvt-291', 31176, 31176, 0, 'per gram', 875, 'gross_weight', 0, 16.8, 17.7, 17.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.88, 6.62, 'yellow gold', '', '', '', 0, 'I1J128300614', 0, 0, '', '', ''),
(631, 'NVT 127', 'NVT 127', 'nvt-127', 51092.35, 51092.35, 0, 'per gram', 875, 'gross_weight', 0, 14.3, 17.7, 14.3, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:11:07', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:11:07', '2021-03-17 06:41:07', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.13, 10.422, 'yellow gold', '', '', '', 0, '31J403701711', 0, 0, '', '', ''),
(632, 'NVL 107', 'NVL 107', 'nvl-107', 80989.24, 80989.24, 0, 'gram', 960, 'gross_weight', 0, 34.3, 0, 38.9, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:12', 1, 0, 'No', 'Women', '', '2021-03-17 13:17:12', '2021-03-17 06:47:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 14.91, 14.558, 'yellow gold', '', '', '', 0, 'I6J630831216', 0, 0, '', '', ''),
(633, 'NVL 108', 'NVL 108', 'nvl-108', 112472.64, 112472.64, 0, 'gram', 960, 'gross_weight', 0, 49.4, 0, 45.7, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:12', 1, 0, 'No', 'Women', '', '2021-03-17 13:17:12', '2021-03-17 06:47:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 20.75, 20.208, 'yellow gold', '', '', '', 0, '24J792761808', 0, 0, '', '', ''),
(634, 'NVL 112', 'NVL 112', 'nvl-112', 64798.08, 64798.08, 0, 'gram', 960, 'gross_weight', 0, 26.8, 0, 49.5, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:12', 1, 0, 'No', 'Women', '', '2021-03-17 13:17:12', '2021-03-17 06:47:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 12.08, 11.616, 'yellow gold', '', '', '', 0, '24J792741808', 0, 0, '', '', ''),
(635, 'NVL 117', 'NVL 117', 'nvl-117', 55504.36, 55504.36, 0, 'gram', 960, 'gross_weight', 0, 27.3, 0, 46.4, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:12', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:17:12', '2021-03-17 06:47:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 10.29, 9.962, 'yellow gold', '', '', '', 0, '24J792751808', 0, 0, '', '', ''),
(636, 'NVL 118', 'NVL 118', 'nvl-118', 113260.6, 113260.6, 0, 'gram', 960, 'gross_weight', 0, 35.2, 0, 59, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:12', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:17:12', '2021-03-17 06:47:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 22.42, 20.03, 'yellow gold', '', '', '', 0, '25J663331708', 0, 0, '', '', ''),
(637, 'NVL 140', 'NVL 140', 'nvl-140', 92628.96, 92628.96, 0, 'gram', 960, 'gross_weight', 0, 36.7, 0, 57.8, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:12', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:17:12', '2021-03-17 06:47:12', 'whitethoughts', '157.47.65.89', 0, 1, 1, 17.14, 16.632, 'yellow gold', '', '', '', 0, '32J632181811', 0, 0, '', '', ''),
(638, 'NVL 143', 'NVL 143', 'nvl-143', 125552.24, 125552.24, 0, 'gram', 960, 'gross_weight', 0, 37.5, 0, 54.3, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:34', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:17:34', '2021-03-17 06:47:34', 'whitethoughts', '157.47.65.89', 0, 1, 1, 23.02, 22.588, 'yellow gold', '', '', '', 0, '32J632201811', 0, 0, '', '', ''),
(639, 'NVL 146', 'NVL 146', 'nvl-146', 68198.08, 68198.08, 0, 'gram', 960, 'gross_weight', 0, 22.2, 0, 46.5, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:34', 1, 0, 'No', 'Women', '', '2021-03-17 13:17:34', '2021-03-17 06:47:34', 'whitethoughts', '157.47.65.89', 0, 1, 1, 12.95, 12.176, 'yellow gold', '', '', '', 0, '32J632231811', 0, 0, '', '', ''),
(640, 'NVL 174', 'NVL 174', 'nvl-174', 63121.2, 63121.2, 0, 'gram', 960, 'gross_weight', 0, 23.2, 0, 34.3, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:34', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:17:34', '2021-03-17 06:47:34', 'whitethoughts', '157.47.65.89', 0, 1, 1, 11.65, 11.34, 'yellow gold', '', '', '', 0, '15J988411903', 0, 0, '', '', ''),
(641, 'NVL 175', 'NVL 175', 'nvl-175', 79439, 79439, 0, 'gram', 960, 'gross_weight', 0, 31.6, 0, 48.8, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:17:34', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:17:34', '2021-03-17 06:47:34', 'whitethoughts', '157.47.65.89', 0, 1, 1, 14.86, 14.23, 'yellow gold', '', '', '', 0, '15J988381903', 0, 0, '', '', ''),
(642, 'NVT 378', 'NVT 378', 'nvt-378', 9249.5, 9249.5, 0, 'per gram', 1286, 'gross_weight', 0, 4.02, 13.14, 11.49, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:18:26', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:18:26', '2021-03-17 06:48:26', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.85, 1.808, 'yellow gold', '', '', '', 0, '18J356931804', 0, 0, '', '', ''),
(643, 'NVT 482', 'NVT 482', 'nvt-482', 30515, 30515, 0, 'per gram', 960, 'gross_weight', 0, 10.2, 12.2, 10.2, '', 'Close settingDiamond studs', '', '', '', NULL, 22, 39, '2021-03-17 13:18:26', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:18:26', '2021-03-17 06:48:26', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.69, 5.47, 'yellow gold', '', '', '', 0, '11J574821901', 0, 0, '', '', ''),
(644, 'NVT 575', 'NVT 575', 'nvt-575', 91367.75, 91367.75, 0, 'per gram', 875, 'gross_weight', 0, 27.8, 17.5, 27, '', 'Cocktail studs', '', '', '', NULL, 22, 37, '2021-03-17 13:18:26', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:18:26', '2021-03-17 06:48:26', 'whitethoughts', '157.47.65.89', 0, 1, 2, 20.69, 19.28, 'yellow gold', '', '', '', 0, '25J534821908', 0, 0, '', '', ''),
(645, 'NVT 636', 'NVT 636', 'nvt-636', 6406, 6406, 0, 'fix', 3000, 'fix', 0, 6.06, 11.13, 6.06, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:18:26', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:18:26', '2021-03-17 06:48:26', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.97, 0.92, 'yellow gold', '', '', '', 0, '30J329311910', 0, 0, '', '', ''),
(646, 'NVT 740', 'NVT 740', 'nvt-740', 20684.8, 20684.8, 0, 'fix', 3000, 'fix', 0, 9.3, 16.2, 12.2, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:18:26', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:18:26', '2021-03-17 06:48:26', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.1, 2.996, 'white gold/yellow gold', '', '', '', 0, '22J502162010', 0, 0, '', '', ''),
(647, 'NVT 742', 'NVT 742', 'nvt-742', 34745.6, 34745.6, 0, 'per gram', 875, 'gross_weight', 0, 14.9, 15.8, 18.8, '', 'studs', '', '', '', NULL, 22, 23, '2021-03-17 13:18:26', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:18:26', '2021-03-17 06:48:26', 'whitethoughts', '157.47.65.89', 0, 1, 2, 7.52, 7.412, 'white gold/yellow gold', '', '', '', 0, '22J786432010', 0, 0, '', '', ''),
(648, 'NVL 185', 'NVL 185', 'nvl-185', 102877.52, 102877.52, 0, 'gram', 960, 'gross_weight', 0, 32.9, 0, 54.8, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:18:43', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:18:43', '2021-03-17 06:48:43', 'whitethoughts', '157.47.65.89', 0, 1, 1, 18.98, 18.484, 'yellow gold', '', '', '', 0, '15J840691803', 0, 0, '', '', ''),
(649, 'NVT 339', 'NVT 339', 'nvt-339', 4793.86, 4793.86, 0, 'per gram', 2374, 'gross_weight', 0, 4.7, 9.3, 4.7, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:22', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:22', '2021-03-17 06:49:22', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.79, 0.768, 'yellow gold', '', '', '', 0, '22J685771806', 0, 0, '', '', ''),
(650, 'NVT 629', 'NVT 629', 'nvt-629', 6186.8, 6186.8, 0, 'fix', 3000, 'fix', 0, 6.3, 11.1, 6.3, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:22', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:22', '2021-03-17 06:49:22', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.94, 0.886, 'yellow gold', '', '', '', 0, '30J329441910', 0, 0, '', '', ''),
(651, 'NVT 331', 'NVT 331', 'nvt-331', 5181.13, 5181.13, 0, 'per gram', 2199, 'gross_weight', 0, 4.5, 9.7, 6.3, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.87, 0.86, 'yellow gold', '', '', '', 0, '22J710031807', 0, 0, '', '', ''),
(652, 'NVT 353', 'NVT 353', 'nvt-353', 8626.67, 8626.67, 0, 'per gram', 1363, 'gross_weight', 0, 5.8, 13.5, 5.8, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.69, 1.664, 'yellow gold', '', '', '', 0, '26J223511812', 0, 0, '', '', ''),
(653, 'NVT 340', 'NVT 340', 'nvt-340', 5287, 5287, 0, 'per gram', 2142, 'gross_weight', 0, 5.4, 9.8, 5.4, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.9, 0.884, 'yellow gold', '', '', '', 0, '22J685711806', 0, 0, '', '', ''),
(654, 'NVT 358', 'NVT 358', 'nvt-358', 6835.36, 6835.36, 0, 'per gram', 1647, 'gross_weight', 0, 5.9, 12, 5.9, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.28, 1.244, 'yellow gold', '', '', '', 0, '18J356981804', 0, 0, '', '', ''),
(655, 'NVT 370', 'NVT 370', 'nvt-370', 8891.14, 8891.14, 0, 'per gram', 1322, 'gross_weight', 0, 6.1, 11.8, 8.1, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.77, 1.724, 'yellow gold', '', '', '', 0, '18J356941804', 0, 0, '', '', ''),
(656, 'NVT 341', 'NVT 341', 'nvt-341', 6135.68, 6135.68, 0, 'per gram', 1814, 'gross_weight', 0, 5.4, 9.09, 6.6, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.12, 1.08, 'yellow gold', '', '', '', 0, '22J68568180', 0, 0, '', '', ''),
(657, 'NVT 639', 'NVT 639', 'nvt-639', 6005.6, 6005.6, 0, 'fix', 3000, 'fix', 0, 5.4, 10.9, 6, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.91, 0.862, 'yellow gold', '', '', '', 0, '30J329141910', 0, 0, '', '', ''),
(658, 'NVT 177', 'NVT 177', 'nvt-177', 10108.4, 10108.4, 0, 'fix', 3000, 'fix', 0, 6.3, 13.9, 6.3, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.51, 1.468, 'yellow gold', '', '', '', 0, '19J486552008', 0, 0, '', '', ''),
(659, 'NVT 99', 'NVT 99', 'nvt-99', 7665.15, 7665.15, 0, 'per gram', 875, 'gross_weight', 0, 6.9, 14.6, 6.9, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.69, 1.628, 'yellow gold', '', '', '', 0, '18J689502007', 0, 0, '', '', ''),
(660, 'NVT 167', 'NVT 167', 'nvt-167', 7834, 7834, 0, 'fix', 3000, 'fix', 0, 4.5, 14.5, 8.2, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.18, 1.13, 'yellow gold', '', '', '', 0, '19J486582008', 0, 0, '', '', ''),
(661, 'NVT 625', 'NVT 625', 'nvt-625', 6798.8, 6798.8, 0, 'fix', 3000, 'fix', 0, 6.6, 11.6, 6.6, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.03, 0.976, 'yellow gold', '', '', '', 0, '30J329401910', 0, 0, '', '', ''),
(662, 'NVT 525', 'NVT 525', 'nvt-525', 21469.75, 21469.75, 0, 'per gram', 875, 'gross_weight', 0, 11.5, 14.9, 15.7, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.69, 4.57, 'yellow gold', '', '', '', 0, '13J022651902', 0, 0, '', '', ''),
(663, 'NVT 47', 'NVT 47', 'nvt-47', 6792.32, 6792.32, 0, 'per gram', 1656, 'gross_weight', 0, 6.9, 12.7, 6.5, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.27, 1.234, 'yellow gold', '', '', '', 0, '18J356991804', 0, 0, '', '', ''),
(664, 'NVT 281', 'NVT 281', 'nvt-281', 5188.73, 5188.73, 0, 'per gram', 2199, 'gross_weight', 0, 4.3, 8.7, 6.6, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.87, 0.862, 'yellow gold', '', '', '', 0, '22J685751806', 0, 0, '', '', ''),
(665, 'NVT 285', 'NVT 285', 'nvt-285', 5232, 5232, 0, 'per gram', 2180, 'gross_weight', 0, 5.9, 9.4, 5.6, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.88, 0.872, 'yellow gold', '', '', '', 0, '22J685791806', 0, 0, '', '', '');
INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `included_handling_charge`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `product_video_url`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `product_type`, `sub_product_type`, `is_make_an_order`, `chain_length`, `certificate_number`, `mould_availability`, `cad_availability`, `SEOTitle`, `SEODesc`, `SEOKeywords`) VALUES
(666, 'NVT 288', 'NVT 288', 'nvt-288', 6763.4, 6763.4, 0, 'per gram', 1685, 'gross_weight', 0, 5.9, 12.8, 6.5, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.24, 1.23, 'yellow gold', '', '', '', 0, '22J685661806', 0, 0, '', '', ''),
(667, 'NVT 328', 'NVT 328', 'nvt-328', 9605.96, 9605.96, 0, 'per gram', 1252, 'gross_weight', 0, 5.5, 14, 5.5, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.93, 1.892, 'yellow gold', '', '', '', 0, '28J223491809', 0, 0, '', '', ''),
(668, 'NVT 345', 'NVT 345', 'nvt-345', 6370.25, 6370.25, 0, 'per gram', 1779, 'gross_weight', 0, 4.6, 12.7, 7.2, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.15, 1.138, 'yellow gold', '', '', '', 0, '22J685641807', 0, 0, '', '', ''),
(669, 'NVT 352', 'NVT 352', 'nvt-352', 6830.32, 6830.32, 0, 'per gram', 1656, 'gross_weight', 0, 6.1, 13.3, 6.2, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.27, 1.244, 'yellow gold', '', '', '', 0, '22J685571807', 0, 0, '', '', ''),
(670, 'NVT 359', 'NVT 359', 'nvt-359', 6370.25, 6370.25, 0, 'per gram', 1779, 'gross_weight', 0, 5.1, 13.1, 6.7, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:19:23', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:19:23', '2021-03-17 06:49:23', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.15, 1.138, 'yellow gold', '', '', '', 0, '22J685601806', 0, 0, '', '', ''),
(671, 'NVL 224', 'NVL 224', 'nvl-224', 135110.48, 135110.48, 0, 'gram', 960, 'gross_weight', 0, 43, 0, 74.9, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 1, 28.74, 23.476, 'yellow gold', '', '', '', 0, '15J010622002', 0, 0, '', '', ''),
(672, 'NVT 584', 'NVT 584', 'nvt-584', 84218.1, 84218.1, 0, 'gram', 875, 'gross_weight', 0, 20.1, 18.03, 64.9, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 19.98, 17.562, 'White gold/yellow gold', '', '', '', 0, '26J646441908', 0, 0, '', '', ''),
(673, 'NVT 753', 'NVT 753', 'nvt-753', 16319.2, 16319.2, 0, 'gram', 875, 'gross_weight', 0, 7.2, 15.04, 16.9, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.52, 3.484, 'White gold/yellow gold', '', '', '', 0, '23J194262010', 0, 0, '', '', ''),
(674, 'NVT 148', 'NVT 148', 'nvt-148', 7539.6, 7539.6, 0, 'fix', 3000, 'fix', 0, 6.6, 12.5, 8.3, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.13, 1.092, 'yellow gold', '', '', '', 0, '19J467882008', 0, 0, '', '', ''),
(675, 'NVT 144', 'NVT 144', 'nvt-144', 15223.2, 15223.2, 0, 'fix', 3000, 'fix', 0, 7.7, 14.2, 8.1, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.27, 2.214, 'yellow gold', '', '', '', 0, '19J467822008', 0, 0, '', '', ''),
(676, 'NVT 142', 'NVT 142', 'nvt-142', 11014.8, 11014.8, 0, 'fix', 3000, 'fix', 0, 6.6, 14.2, 7.4, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.65, 1.596, 'yellow gold', '', '', '', 0, '19J467892008', 0, 0, '', '', ''),
(677, 'NVT 129', 'NVT 129', 'nvt-129', 9375.2, 9375.2, 0, 'fix', 3000, 'fix', 0, 8.8, 13.3, 8.3, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.41, 1.354, 'yellow gold', '', '', '', 0, '19J467792008', 0, 0, '', '', ''),
(678, 'NVT 125', 'NVT 125', 'nvt-125', 10523.6, 10523.6, 0, 'fix', 3000, 'fix', 0, 9.4, 13.7, 7.8, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.58, 1.522, 'yellow gold', '', '', '', 0, '19J467862008', 0, 0, '', '', ''),
(679, 'NVT 130', 'NVT 130', 'nvt-130', 13931.2, 13931.2, 0, 'fix', 3000, 'fix', 0, 9.4, 14.6, 9.4, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.08, 2.024, 'yellow gold', '', '', '', 0, '19J467912008', 0, 0, '', '', ''),
(680, 'NVT 146', 'NVT 146', 'nvt-146', 10659.6, 10659.6, 0, 'fix', 3000, 'fix', 0, 6.6, 14.4, 6.6, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.6, 1.542, 'yellow gold', '', '', '', 0, '19J467872008', 0, 0, '', '', ''),
(681, 'NVT 132', 'NVT 132', 'nvt-132', 9972.4, 9972.4, 0, 'fix', 3000, 'fix', 0, 6.5, 14.3, 6.5, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.49, 1.448, 'yellow gold', '', '', '', 0, '19J467902008', 0, 0, '', '', ''),
(682, 'NVT 147', 'NVT 147', 'nvt-147', 10538.4, 10538.4, 0, 'fix', 3000, 'fix', 0, 7.1, 14.3, 6.9, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.59, 1.518, 'yellow gold', '', '', '', 0, '19J467772008', 0, 0, '', '', ''),
(683, 'NVT 163', 'NVT 163', 'nvt-163', 10410, 10410, 0, 'fix', 3000, 'fix', 0, 8, 13.8, 8, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.57, 1.5, 'yellow gold', '', '', '', 0, '19J486692008', 0, 0, '', '', ''),
(684, 'NVT 150', 'NVT 150', 'nvt-150', 6927.6, 6927.6, 0, 'fix', 3000, 'fix', 0, 4, 12.8, 9.9, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.04, 1.002, 'yellow gold', '', '', '', 0, '19J467782008', 0, 0, '', '', ''),
(685, 'NVT 149', 'NVT 149', 'nvt-149', 10259.2, 10259.2, 0, 'fix', 3000, 'fix', 0, 5.7, 11.3, 9.9, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.54, 1.484, 'yellow gold', '', '', '', 0, '19J467812008', 0, 0, '', '', ''),
(686, 'NVT 126', 'NVT 126', 'nvt-126', 13455.6, 13455.6, 0, 'fix', 3000, 'fix', 0, 8.3, 14.7, 8.3, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2, 1.962, 'yellow gold', '', '', '', 0, '19J467842008', 0, 0, '', '', ''),
(687, 'NVT 141', 'NVT 141', 'nvt-141', 12941.2, 12941.2, 0, 'fix', 3000, 'fix', 0, 8.1, 13.6, 8.1, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.94, 1.874, 'yellow gold', '', '', '', 0, '19J467852008', 0, 0, '', '', ''),
(688, 'NVT 151', 'NVT 151', 'nvt-151', 10538.8, 10538.8, 0, 'fix', 3000, 'fix', 0, 6.3, 13.9, 6.4, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.58, 1.526, 'yellow gold', '', '', '', 0, '19J486572008', 0, 0, '', '', ''),
(689, 'NVT 160', 'NVT 160', 'nvt-160', 11724.8, 11724.8, 0, 'fix', 3000, 'fix', 0, 6.6, 11.9, 6.7, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.76, 1.696, 'yellow gold', '', '', '', 0, '19J486702008', 0, 0, '', '', ''),
(690, 'NVT 169', 'NVT 169', 'nvt-169', 7819.2, 7819.2, 0, 'fix', 3000, 'fix', 0, 6.1, 10.9, 8.9, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.17, 1.134, 'yellowgold', '', '', '', 0, '19J486592008', 0, 0, '', '', ''),
(691, 'NVT 155', 'NVT 155', 'nvt-155', 12972, 12972, 0, 'fix', 3000, 'fix', 0, 7.2, 13.6, 7.2, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.93, 1.89, 'yellowgold', '', '', '', 0, '19J486682008', 0, 0, '', '', ''),
(692, 'NVT 654', 'NVT 654', 'nvt-654', 17188, 17188, 0, 'fix', 3000, 'fix', 0, 8.1, 15.2, 8.5, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 2.55, 2.51, 'white gold', '', '', '', 0, '30J329201910', 0, 0, '', '', ''),
(693, 'NVT 646', 'NVT 646', 'nvt-646', 12186, 12186, 0, 'fix', 3000, 'fix', 0, 6.5, 11.6, 8.7, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.82, 1.77, 'yellowgold', '', '', '', 0, '30J329381910', 0, 0, '', '', ''),
(694, 'NVT 628', 'NVT 628', 'nvt-628', 6723.2, 6723.2, 0, 'fix', 3000, 'fix', 0, 6.5, 11.3, 6.5, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.02, 0.964, 'white gold', '', '', '', 0, '30J329341910', 0, 0, '', '', ''),
(695, 'NVT 333', 'NVT 333', 'nvt-333', 6420.88, 6420.88, 0, 'per gram', 1768, 'gross_weight', 0, 6.5, 10.3, 6.5, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.16, 1.15, 'yellow gold', '', '', '', 0, '22J685781806', 0, 0, '', '', ''),
(696, 'NVT 648', 'NVT 648', 'nvt-648', 7962.8, 7962.8, 0, 'fix', 3000, 'fix', 0, 5.8, 10.2, 5.8, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.19, 1.156, 'yellow gold', '', '', '', 0, '30J329361910', 0, 0, '', '', ''),
(697, 'NVT 647', 'NVT 647', 'nvt-647', 6255.2, 6255.2, 0, 'fix', 3000, 'fix', 0, 5.9, 10.5, 5.9, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.94, 0.904, 'yellow gold', '', '', '', 0, '30J329321910', 0, 0, '', '', ''),
(698, 'NVT 653', 'NVT 653', 'nvt-653', 7002.8, 7002.8, 0, 'fix', 3000, 'fix', 0, 6.3, 11.8, 6.3, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.06, 1.006, 'yellow gold', '', '', '', 0, '30J329351910', 0, 0, '', '', ''),
(699, 'NVT 289', 'NVT 289', 'nvt-289', 5359.53, 5359.53, 0, 'per gram', 2123, 'gross_weight', 0, 6.4, 9, 6.7, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.91, 0.902, 'yellow gold', '', '', '', 0, '22J685731806', 0, 0, '', '', ''),
(700, 'NVT 357', 'NVT 357', 'nvt-357', 6832.7, 6832.7, 0, 'per gram', 1665, 'gross_weight', 0, 7.4, 13.3, 7.4, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.26, 1.246, 'yellow gold', '', '', '', 0, '22J685561806', 0, 0, '', '', ''),
(701, 'NVT 624', 'NVT 624', 'nvt-624', 6678.4, 6678.4, 0, 'fix', 3000, 'fix', 0, 6.4, 11.1, 6.4, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1, 0.968, 'yellow gold', '', '', '', 0, '30J329411910', 0, 0, '', '', ''),
(702, 'NVT 623', 'NVT 623', 'nvt-623', 6254.8, 6254.8, 0, 'fix', 3000, 'fix', 0, 6.6, 10.7, 6.6, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 0.95, 0.896, 'yellow gold', '', '', '', 0, '30J329431910', 0, 0, '', '', ''),
(703, 'NVT 640', 'NVT 640', 'nvt-640', 6934.8, 6934.8, 0, 'fix', 3000, 'fix', 0, 6.2, 10.9, 6.2, '', 'Baby tops', '', '', '', NULL, 22, 38, '2021-03-17 13:20:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:20:18', '2021-03-17 06:50:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 1.05, 0.996, 'yellow gold', '', '', '', 0, '30J329371917', 0, 0, '', '', ''),
(704, 'NVL 187', 'NVL 187', 'nvl-187', 28516.2, 28516.2, 0, 'gram', 960, 'gross_weight', 0, 24.4, 0, 36.8, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:20:40', 1, 0, 'No', 'Women', '', '2021-03-17 13:20:40', '2021-03-17 06:50:40', 'whitethoughts', '157.47.65.89', 0, 1, 1, 5.23, 5.13, 'yellow gold', '', '', '', 0, '30J763011910', 0, 0, '', '', ''),
(705, 'NVT 203', 'NVT 203', 'nvt-203', 54508.48, 54508.48, 0, 'per gram', 960, 'gross_weight', 0, 15.85, 14.55, 18.48, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 10.14, 9.776, 'yellow gold', '', '', '', 0, '17J168771804', 0, 0, '', '', ''),
(706, 'NVT 171', 'NVT 171', 'nvt-171', 38178.08, 38178.08, 0, 'per gram', 960, 'gross_weight', 0, 17.3, 13.4, 15.5, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 7.06, 6.856, 'yellow gold', '', '', '', 0, '17J168751804', 0, 0, '', '', ''),
(707, 'NVT 76', 'NVT 76', 'nvt-76', 21989.04, 21989.04, 0, 'per gram', 960, 'gross_weight', 0, 9.2, 11.8, 9.2, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.07, 3.948, 'yellow gold', '', '', '', 0, '19J864191706', 0, 0, '', '', ''),
(708, 'NVT 485', 'NVT 485', 'nvt-485', 23591.76, 23591.76, 0, 'per gram', 960, 'gross_weight', 0, 9.4, 12.4, 9.4, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.48, 4.212, 'yellow gold', '', '', '', 0, '11J574851901', 0, 0, '', '', ''),
(709, 'NVT 716', 'NVT 716', 'nvt-716', 25721.36, 25721.36, 0, 'per gram', 960, 'gross_weight', 0, 10.38, 11.39, 10.38, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.79, 4.612, 'yellow gold', '', '', '', 0, '20J885401805', 0, 0, '', '', ''),
(710, 'NVT 522', 'NVT 522', 'nvt-522', 23118.88, 23118.88, 0, 'per gram', 960, 'gross_weight', 0, 10.32, 12.19, 10.32, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.35, 4.136, 'yellow gold', '', '', '', 0, '15J981961903', 0, 0, '', '', ''),
(711, 'NVT 720', 'NVT 720', 'nvt-720', 37368.04, 37368.04, 0, 'per gram', 960, 'gross_weight', 0, 12.3, 12.2, 12.3, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.97, 6.698, 'yellow gold', '', '', '', 0, '16J681572003', 0, 0, '', '', ''),
(712, 'NVT 165', 'NVT 165', 'nvt-165', 28628.08, 28628.08, 0, 'per gram', 920, 'gross_weight', 0, 10.46, 11.99, 10.46, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.35, 5.176, 'yellow gold', '', '', '', 0, 'I5J584000916', 0, 0, '', '', ''),
(713, 'NVT 187', 'NVT 187', 'nvt-187', 22850.6, 22850.6, 0, 'per gram', 960, 'gross_weight', 0, 9.09, 12.41, 9.09, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.29, 4.09, 'yellow gold', '', '', '', 0, '34J512571911', 0, 0, '', '', ''),
(714, 'NVT 154', 'NVT 154', 'nvt-154', 46637.28, 46637.28, 0, 'per gram', 960, 'gross_weight', 0, 15.4, 11.2, 15.4, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 8.62, 8.376, 'yellow gold', '', '', '', 0, '21J549511806', 0, 0, '', '', ''),
(715, 'NVT 434', 'NVT 434', 'nvt-434', 34468.04, 34468.04, 0, 'per gram', 960, 'gross_weight', 0, 10.81, 14.82, 10.81, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.43, 6.178, 'yellow gold', '', '', '', 0, '32J308101810', 0, 0, '', '', ''),
(716, 'NVT  496', 'NVT  496', 'nvt-496', 26754.32, 26754.32, 0, 'per gram', 960, 'gross_weight', 0, 7.92, 12.6, 7.92, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.95, 4.804, 'yellow gold', '', '', '', 0, '13J614791902', 0, 0, '', '', ''),
(717, 'NVT 478', 'NVT 478', 'nvt-478', 21215.64, 21215.64, 0, 'per gram', 960, 'gross_weight', 0, 8.11, 12.53, 8.11, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.98, 3.798, 'yellow gold', '', '', '', 0, '11J574781901', 0, 0, '', '', ''),
(718, 'NVT 515', 'NVT 515', 'nvt-515', 33987.76, 33987.76, 0, 'per gram', 960, 'gross_weight', 0, 11.5, 12.3, 11.5, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.34, 6.092, 'yellow gold', '', '', '', 0, '15J981891903', 0, 0, '', '', ''),
(719, 'NVT 152', 'NVT 152', 'nvt-152', 28132.8, 28132.8, 0, 'per gram', 960, 'gross_weight', 0, 9.32, 12.33, 9.32, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.26, 5.04, 'yellow gold', '', '', '', 0, '18J811201705', 0, 0, '', '', ''),
(720, 'NVT 164', 'NVT 164', 'nvt-164', 19327.36, 19327.36, 0, 'per gram', 977, 'gross_weight', 0, 7.7, 11.9, 7.7, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.6, 3.452, 'yellow gold', '', '', '', 0, '', 0, 0, '', '', ''),
(721, 'NVT 460', 'NVT 460', 'nvt-460', 61812.56, 61812.56, 0, 'per gram', 960, 'gross_weight', 0, 14.8, 15.6, 14.8, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 11.47, 11.092, 'yellow gold', '', '', '', 0, '34J608361812', 0, 0, '', '', ''),
(722, 'NVT 571', 'NVT 571', 'nvt-571', 35563.36, 35563.36, 0, 'per gram', 960, 'gross_weight', 0, 10.86, 13.8, 10.86, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.55, 6.392, 'yellow gold', '', '', '', 0, '24J352941907', 0, 0, '', '', ''),
(723, 'NVT 521', 'NVT 521', 'nvt-521', 25086.24, 25086.24, 0, 'per gram', 960, 'gross_weight', 0, 10, 15.3, 10, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.72, 4.488, 'yellow gold', '', '', '', 0, '15J981951903', 0, 0, '', '', ''),
(724, 'NVT 572', 'NVT 572', 'nvt-572', 33651.84, 33651.84, 0, 'per gram', 960, 'gross_weight', 0, 10.4, 14.8, 10.4, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.2, 6.048, 'yellow gold', '', '', '', 0, '24J352901907', 0, 0, '', '', ''),
(725, 'NVT 562', 'NVT 562', 'nvt-562', 34567.04, 34567.04, 0, 'per gram', 960, 'gross_weight', 0, 11.1, 15.5, 11.1, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:33:08', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:33:08', '2021-03-17 07:03:08', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.39, 6.208, 'yellow gold', '', '', '', 0, '24J352921907', 0, 0, '', '', ''),
(726, 'NVL 51', 'NVL 51', 'nvl-51', 54522.45, 54522.45, 0, 'gram', 875, 'gross_weight', 0, 40.9, 0, 15.6, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 11.83, 11.624, 'yellow gold', '', '', '', 16, '18J679231804', 0, 0, '', '', ''),
(727, 'NVL 58', 'NVL 58', 'nvl-58', 74251.15, 74251.15, 0, 'gram', 875, 'gross_weight', 0, 55.8, 0, 39.2, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 16.25, 15.798, 'yellow gold', '', '', '', 16, 'I4J429221115', 0, 0, '', '', ''),
(728, 'NVL 59', 'NVL 59', 'nvl-59', 48787.4, 48787.4, 0, 'gram', 875, 'gross_weight', 0, 32.3, 0, 18.7, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 10.6, 10.398, 'yellow gold', '', '', '', 16, '18J679211804', 0, 0, '', '', ''),
(729, 'NVL 62', 'NVL 62', 'nvl-62', 40964.95, 40964.95, 0, 'gram', 875, 'gross_weight', 0, 35, 0, 26.7, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.93, 8.724, 'yellow gold', '', '', '', 16, 'I5J541330616', 0, 0, '', '', ''),
(730, 'NVL 64', 'NVL 64', 'nvl-64', 45417.7, 45417.7, 0, 'gram', 875, 'gross_weight', 0, 53.2, 0, 28.8, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.98, 9.654, 'yellow gold', '', '', '', 16, 'I5J541270616', 0, 0, '', '', ''),
(731, 'NVL 67', 'NVL 67', 'nvl-67', 40026.5, 40026.5, 0, 'gram', 875, 'gross_weight', 0, 39.8, 0, 25.5, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.7, 8.53, 'yellow gold', '', '', '', 16, '17J499721704', 0, 0, '', '', ''),
(732, 'NVL 68', 'NVL 68', 'nvl-68', 34793.5, 34793.5, 0, 'gram', 875, 'gross_weight', 0, 31.6, 0, 15.2, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.54, 7.42, 'yellow gold', '', '', '', 16, '20J712491706', 0, 0, '', '', ''),
(733, 'NVL 72', 'NVL 72', 'nvl-72', 42294.45, 42294.45, 0, 'gram', 875, 'gross_weight', 0, 42.3, 0, 33.6, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.19, 9.014, 'yellow gold', '', '', '', 16, '17J499711704', 0, 0, '', '', ''),
(734, 'NVL 75', 'NVL 75', 'nvl-75', 44062.65, 44062.65, 0, 'gram', 875, 'gross_weight', 0, 38.7, 0, 23.5, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.63, 9.378, 'yellow gold', '', '', '', 16, '17J499741704', 0, 0, '', '', ''),
(735, 'NVL 76', 'NVL 76', 'nvl-76', 52503.45, 52503.45, 0, 'gram', 875, 'gross_weight', 0, 51.2, 0, 30.4, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 11.39, 11.194, 'yellow gold', '', '', '', 16, 'I4J429171115', 0, 0, '', '', ''),
(736, 'NVL 77', 'NVL 77', 'nvl-77', 49885.9, 49885.9, 0, 'gram', 875, 'gross_weight', 0, 44.5, 0, 28.8, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 10.9, 10.618, 'yellow gold', '', '', '', 16, '21J584261707', 0, 0, '', '', ''),
(737, 'NVL 80', 'NVL 80', 'nvl-80', 20224.55, 20224.55, 0, 'gram', 875, 'gross_weight', 0, 26.7, 0, 7.2, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 4.37, 4.316, 'yellow gold', '', '', '', 16, '18J679261804', 0, 0, '', '', ''),
(738, 'NVL 98', 'NVL 98', 'nvl-98', 41545.75, 41545.75, 0, 'gram', 875, 'gross_weight', 0, 37.6, 0, 32.9, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.09, 8.84, 'yellow gold', '', '', '', 16, '17J499701704', 0, 0, '', '', ''),
(739, 'NVL 101', 'NVL 101', 'nvl-101', 40166.75, 40166.75, 0, 'gram', 875, 'gross_weight', 0, 38.4, 0, 19.4, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.73, 8.56, 'yellow gold', '', '', '', 16, '20J712461707', 0, 0, '', '', ''),
(740, 'NVL 102', 'NVL 102', 'nvl-102', 36755.85, 36755.85, 0, 'gram', 875, 'gross_weight', 0, 38.6, 0, 14.5, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.95, 7.842, 'yellow gold', '', '', '', 16, '20J712481706', 0, 0, '', '', ''),
(741, 'NVL 164', 'NVL 164', 'nvl-164', 47975.15, 47975.15, 0, 'gram', 875, 'gross_weight', 0, 31.2, 0, 19.5, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:15', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:15', '2021-03-17 07:04:15', 'whitethoughts', '157.47.65.89', 0, 1, 1, 10.41, 10.228, 'yellow gold', '', '', '', 16, '12J688111902', 0, 0, '', '', ''),
(742, 'NVL 213', 'NVL 213', 'nvl-213', 47089.2, 47089.2, 0, 'gram', 875, 'gross_weight', 0, 34.8, 0, 14.4, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:47', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:47', '2021-03-17 07:04:47', 'whitethoughts', '157.47.65.89', 0, 1, 1, 10.24, 10.034, 'yellow gold', '', '', '', 16, '15J355092002', 0, 0, '', '', ''),
(743, 'NVL 215', 'NVL 215', 'nvl-215', 60789.25, 60789.25, 0, 'gram', 875, 'gross_weight', 0, 37.5, 0, 15.5, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:47', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:47', '2021-03-17 07:04:47', 'whitethoughts', '157.47.65.89', 0, 1, 1, 13.19, 12.96, 'yellow gold', '', '', '', 16, '15J355082002', 0, 0, '', '', ''),
(744, 'NVL 220', 'NVL 220', 'nvl-220', 33990.45, 33990.45, 0, 'gram', 875, 'gross_weight', 0, 34.1, 0, 18.4, '', 'diamond pendent with black beads', '', '', '', NULL, 3, 42, '2021-03-17 13:34:47', 1, 0, 'No', 'Women', '', '2021-03-17 13:34:47', '2021-03-17 07:04:47', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.43, 7.234, 'yellow gold', '', '', '', 16, '15J811122003', 0, 0, '', '', ''),
(745, 'NVN 208', 'Anaya Gold Polki Necklace - Ruby Gemstone', 'anaya-gold-polki-necklace-ruby-gemstone', 78420.4, 78420.4, 0, 'gram', 1375, 'gross_weight', 0, 38, 19, 0, '', 'Polki necklaces from JBN Exclusive are embellished with emeralds, faux pearls and stones that lay on your neck like a masterpiece- we bet you’d fall for it.', '', '', '', 'https://www.youtube.com/embed/G-htUJW56x4', 6, 28, '2021-04-09 11:17:08', 1, 1, 'Yes', 'Women', '', '2021-03-17 13:43:55', '2021-04-09 11:17:08', '', '', 0, 1, 1, 15.28, 15.108, 'Yellow Gold/white gold', 'anaya', '', '', 8, '23J683812010', 0, 0, '', '', ''),
(746, 'NVL 124', 'NVL 124', 'nvl-124', 38990.48, 38990.48, 0, 'gram', 960, 'gross_weight', 0, 14.4, 0, 33.8, '', 'Diamond pendent close setting With Black Beads', '', '', '', NULL, 3, 43, '2021-03-17 13:43:55', 1, 0, 'No', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.62, 6.916, 'yellow gold', '', '', '', 16, '13J232391802', 0, 0, '', '', ''),
(747, 'NVL 128', 'NVL 128', 'nvl-128', 33690.4, 33690.4, 0, 'gram', 920, 'gross_weight', 0, 42.2, 0, 62.5, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 13:43:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 1, 36.62, 32.184, 'yellow gold', '', '', '', 0, 'I3J313570715', 0, 0, '', '', ''),
(748, 'NVL 142', 'NVL 142', 'nvl-142', 45087.8, 45087.8, 0, 'gram', 960, 'gross_weight', 0, 14.4, 0, 40.6, '', 'Diamond pendent close setting With Black Beads', '', '', '', NULL, 3, 43, '2021-03-17 13:43:55', 1, 0, 'No', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.42, 7.87, 'yellow gold', '', '', '', 16, '16J186511803', 0, 0, '', '', ''),
(749, 'NVL 177', 'NVL 177', 'nvl-177', 49530.2, 49530.2, 0, 'gram', 960, 'gross_weight', 0, 19.1, 0, 39.7, '', 'Diamond pendent close setting With Black Beads', '', '', '', NULL, 3, 43, '2021-03-17 13:43:55', 1, 0, 'No', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 1, 10.04, 8.71, 'yellow gold', '', '', '', 16, '15J988421903', 0, 0, '', '', ''),
(750, 'NVL 178', 'NVL 178', 'nvl-178', 41100.08, 41100.08, 0, 'gram', 960, 'gross_weight', 0, 14.3, 0, 31.8, '', 'Diamond pendent close setting With Black Beads', '', '', '', NULL, 3, 43, '2021-03-17 13:43:55', 1, 0, 'No', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.1, 7.276, 'yellow gold', '', '', '', 16, '15J988441903', 0, 0, '', '', ''),
(751, 'NVL 179', 'NVL 179', 'nvl-179', 41291.56, 41291.56, 0, 'gram', 960, 'gross_weight', 0, 15, 0, 32.9, '', 'Diamond pendent close setting With Black Beads', '', '', '', NULL, 3, 43, '2021-03-17 13:43:55', 1, 0, 'No', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.08, 7.322, 'yellow gold', '', '', '', 16, '15J988451903', 0, 0, '', '', ''),
(752, 'NVL 180', 'NVL 180', 'nvl-180', 41115.76, 41115.76, 0, 'gram', 960, 'gross_weight', 0, 14.3, 0, 35.3, '', 'Diamond pendent close setting With Black Beads', '', '', '', NULL, 3, 43, '2021-03-17 13:43:55', 1, 0, 'No', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 1, 8.04, 7.292, 'yellow gold', '', '', '', 16, '15J988431903', 0, 0, '', '', ''),
(753, 'NVT 153', 'NVT 153', 'nvt-153', 4618.4, 4618.4, 0, 'per gram', 920, 'gross_weight', 0, 9.21, 13.28, 9.21, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:43:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.02, 4.882, 'yellow gold', '', '', '', 0, 'I5J557620716', 0, 0, '', '', ''),
(754, 'NVT 145', 'NVT 145', 'nvt-145', 7323.2, 7323.2, 0, 'per gram', 920, 'gross_weight', 0, 18.1, 11.4, 18.1, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:43:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 7.96, 7.552, 'yellow gold', '', '', '', 0, 'I4J401911015', 0, 0, '', '', ''),
(755, 'NVT 166', 'NVT 166', 'nvt-166', 5253.2, 5253.2, 0, 'per gram', 920, 'gross_weight', 0, 10.21, 11.97, 10.21, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:43:55', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:43:55', '2021-03-17 07:13:55', 'whitethoughts', '157.47.65.89', 0, 1, 2, 5.71, 5.566, 'yellow gold', '', '', '', 0, 'I5J584020916', 0, 0, '', '', ''),
(756, 'NVT 143', 'NVT 143', 'nvt-143', 2999.2, 2999.2, 0, 'per gram', 920, 'gross_weight', 0, 8.41, 11.66, 8.41, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:44:13', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:44:13', '2021-03-17 07:14:13', 'whitethoughts', '157.47.65.89', 0, 1, 2, 3.26, 3.134, 'yellow gold', '', '', '', 0, 'I5J573690816', 0, 0, '', '', ''),
(757, 'NVT 168', 'NVT 168', 'nvt-168', 5851.2, 5851.2, 0, 'per gram', 920, 'gross_weight', 0, 10.2, 15, 10.2, '', 'Close setting studs', '', '', '', NULL, 22, 41, '2021-03-17 13:44:13', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:44:13', '2021-03-17 07:14:13', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.36, 6.202, 'yellow gold', '', '', '', 0, 'I5J584010916', 0, 0, '', '', ''),
(758, 'NVR 227', 'NVR 227', 'nvr-227', 49187.8, 49187.8, 0, 'gram', 1375, 'gross_weight', 0, 28.1, 0, 28.1, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 13:56:00', 1, 0, 'No', 'Women', '', '2021-03-17 13:56:00', '2021-03-17 07:26:00', 'whitethoughts', '157.47.65.89', 0, 1, 1, 9.64, 9.456, 'yellow gold,Rose gold', '', '', '', 0, '23J427222010', 0, 0, '', '', ''),
(759, 'NZR 4', 'NZR 4', 'nzr-4', 38523.65, 38523.65, 0, 'gram', 1375, 'gross_weight', 0, 25.2, 0, 27, '', 'Cocktail Ring', '', '', '', NULL, 22, 27, '2021-03-17 13:56:00', 1, 0, 'No', 'Women', '', '2021-03-17 13:56:00', '2021-03-17 07:26:00', 'whitethoughts', '157.47.65.89', 0, 1, 1, 7.71, 7.348, 'Rose gold ', '', '', '', 0, '27J099611809', 0, 0, '', '', ''),
(760, 'NVT 5', 'NVT 5', 'nvt-5', 28662.55, 28662.55, 0, 'per gram', 875, 'gross_weight', 0, 13.8, 12.1, 20.8, '', 'J bali', '', '', '', NULL, 22, 26, '2021-03-17 13:56:00', 1, 0, 'Yes', 'Women', '', '2021-03-17 13:56:00', '2021-03-17 07:26:00', 'whitethoughts', '157.47.65.89', 0, 1, 2, 6.37, 6.076, 'white gold/ rose gold', '', '', '', 0, '11J661441702', 0, 0, '', '', ''),
(761, 'NVT 20', 'NVT 20', 'nvt-20', 21852.45, 21852.45, 0, 'gram', 1275, 'gross_weight', 0, 15.7, 14.2, 20, '', 'Diamond Hangings', '', '', '', NULL, 22, 35, '2021-03-17 14:01:18', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:01:18', '2021-03-17 07:31:18', 'whitethoughts', '157.47.65.89', 0, 1, 2, 4.55, 4.224, 'White gold', '', '', '', 0, '18J616852007', 0, 0, '', '', ''),
(762, 'NVL 6', 'NVL 6', 'nvl-6', 85799.85, 85799.85, 0, 'gram', 875, 'gross_weight', 0, 37.7, 0, 61.2, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:05', 1, 0, 'No', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 21.31, 17.672, 'yellow gold', '', '', '', 0, '17J846192006', 0, 0, '', '', ''),
(763, 'NVL 12', 'NVL 12', 'nvl-12', 56380.4, 56380.4, 0, 'gram', 875, 'gross_weight', 0, 31.3, 0, 45.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:05', 1, 0, 'No', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 14.24, 11.558, 'yellow gold', '', '', '', 0, '17J846172006', 0, 0, '', '', ''),
(764, 'NVL 82', 'NVL 82', 'nvl-82', 154529.4, 154529.4, 0, 'gram', 875, 'gross_weight', 0, 43.6, 0, 77.56, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:05', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 36.6, 32.238, 'yellow gold', '', '', '', 0, '23J505631807', 0, 0, '', '', ''),
(765, 'NVL 84', 'NVL 84', 'nvl-84', 57847.8, 57847.8, 0, 'gram', 875, 'gross_weight', 0, 29.4, 0, 45.6, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:05', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 13.32, 12.156, 'yellow gold', '', '', '', 0, '19J560871706', 0, 0, '', '', ''),
(766, 'NVL 87', 'NVL 87', 'nvl-87', 103170.1, 103170.1, 0, 'gram', 875, 'gross_weight', 0, 34.9, 0, 60.3, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:05', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.66, 21.702, 'yellow gold', '', '', '', 0, '21J828021807', 0, 0, '', '', ''),
(767, 'NVL 92', 'NVL 92', 'nvl-92', 82186.45, 82186.45, 0, 'gram', 875, 'gross_weight', 0, 34.5, 0, 62.9, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:05', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 20.95, 16.804, 'yellow gold', '', '', '', 0, '12J442762001', 0, 0, '', '', ''),
(768, 'NVL 94', 'NVL 94', 'nvl-94', 94366.35, 94366.35, 0, 'gram', 875, 'gross_weight', 0, 40.31, 0, 52.35, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:05', 1, 0, 'No', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 23.37, 19.452, 'yellow gold', '', '', '', 0, 'I2J210430115', 0, 0, '', '', ''),
(769, 'NVL 104', 'NVL 104', 'nvl-104', 117517.12, 117517.12, 0, 'gram', 960, 'gross_weight', 0, 36.8, 0, 71.1, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 14:04:05', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:05', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 1, 21.73, 21.104, 'yellow gold', '', '', '', 0, '24J792791808', 0, 0, '', '', ''),
(770, 'NVL 105', 'NVL 105', 'nvl-105', 141484.7, 141484.7, 0, 'gram', 875, 'gross_weight', 0, 41.3, 0, 74.9, '', 'Diamond pendent', '', '', '', NULL, 3, 34, '2021-03-17 14:04:06', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:06', '2021-03-17 07:34:05', 'whitethoughts', '157.47.65.89', 0, 1, 2, 32.74, 29.694, 'yellow gold', '', '', '', 0, '24J305681807', 0, 0, '', '', ''),
(771, 'NVL 106', 'NVL 106', 'nvl-106', 170561.68, 170561.68, 0, 'gram', 960, 'gross_weight', 0, 51.3, 0, 71.8, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 14:04:06', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:06', '2021-03-17 07:34:06', 'whitethoughts', '157.47.65.89', 0, 1, 1, 31.7, 30.596, 'yellow gold', '', '', '', 0, '27J131341809', 0, 0, '', '', ''),
(772, 'NVL 110', 'NVL 110', 'nvl-110', 84575.88, 84575.88, 0, 'gram', 960, 'gross_weight', 0, 31.8, 0, 47.2, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 14:04:06', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:06', '2021-03-17 07:34:06', 'whitethoughts', '157.47.65.89', 0, 1, 1, 15.65, 15.186, 'yellow gold', '', '', '', 0, '24J792721808', 0, 0, '', '', ''),
(773, 'NVL 113', 'NVL 113', 'nvl-113', 90498.84, 90498.84, 0, 'gram', 960, 'gross_weight', 0, 31.7, 0, 51.5, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 14:04:06', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:06', '2021-03-17 07:34:06', 'whitethoughts', '157.47.65.89', 0, 1, 1, 16.61, 16.278, 'yellow gold', '', '', '', 0, '25J167231808', 0, 0, '', '', ''),
(774, 'NVL 115', 'NVL 115', 'nvl-115', 186715.4, 186715.4, 0, 'gram', 960, 'gross_weight', 0, 56.5, 0, 64.5, '', 'Diamond pendent close setting', '', '', '', NULL, 3, 40, '2021-03-17 14:04:06', 1, 0, 'Yes', 'Women', '', '2021-03-17 14:04:06', '2021-03-17 07:34:06', 'whitethoughts', '157.47.65.89', 0, 1, 1, 34.72, 33.49, 'yellow gold', '', '', '', 0, '27J131361809', 0, 0, '', '', ''),
(775, '232445', 'Waist chain by Nikita', 'waist-chain-by-nikita', 500000, 399999, 0, 'gram', 1500, 'net_weight', 10, 150, 0, 0, '', 'Waist chain by Nikita.....', '', '', '../uploads/products/232445_thumbnail.jpg', '', 45, 46, '2021-03-17 09:57:16', 20, 0, 'Yes', 'Women', '', '2021-03-17 09:50:45', '2021-03-17 09:57:16', '', '', 0, 1, 20, 200, 200, '', 'anaya', '', 'yes', 0, 'GQA12F3342', 1, 1, 'Waist chain designs by Nikita', '', 'Waist, chain, belt, waist belt, gold, platinum, diamond');

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
  `is_customizable` tinyint(1) NOT NULL DEFAULT 0,
  `custom_size` varchar(100) NOT NULL,
  `custom_attributes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`CategoryID`, `CategoryName`, `ParentID`, `CategoryImage`, `CategoryDesc`, `CategorySlug`, `SEOTitle`, `SEODescription`, `SEOKeywords`, `is_customizable`, `custom_size`, `custom_attributes`) VALUES
(1, 'Bangles', 0, '../uploads/categories/bangles.jpg', 'Bangles', 'bangles', 'Bangles', 'Bangles', 'Bangles', 1, '10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25', 'null'),
(2, 'Bracelet', 0, '../uploads/categories/bracelet.jpg', 'Bracelets', 'bracelet', 'Bracelets', 'Bracelets', 'Bracelets', 0, '', NULL),
(3, 'Pendents', 0, '../uploads/categories/pendents.jpg', 'Pendent', 'pendents', 'Pendent', 'Pendent', 'Pendent', 0, '', 'null'),
(6, 'Necklace', 0, '../uploads/categories/necklace.jpg', 'Necklace', 'necklace', 'Necklace', 'Necklace', '', 1, '21,25,28,35', '[\"polish\",\"diamonds\"]'),
(7, 'Rings', 0, '../uploads/categories/rings.jpg', 'Ring', 'rings', 'Ring', 'Ring', 'Ring', 1, '15,16,17,18,19,20,21,22,23,24,25,26', 'null'),
(10, 'kada', 1, '../uploads/categories/kada.jpg', 'Kada', 'kada', 'kada', 'kada', 'kada', 0, '', NULL),
(19, 'demo', 19, '', 'demo', 'demo', 'demo', 'demo', 'demo', 1, '1,2,3', NULL),
(21, 'Snake shaped Platinum & Gold Bracelet', 20, '../uploads/categories/snake-shaped-platinum-gold-bracelet.jpeg', 'Exclusively designed limited period product.', 'snake-shaped-platinum-gold-bracelet', 'Platinum & Gold Bracelet', '', '', 1, '20 gms, 30 gms, 60 gms', NULL),
(22, 'Earrings', 0, '', 'earrings', 'earrings', 'earrings', 'earrings', 'earrings', 1, '15,16,17,18,19,20,21,22,23,24,25,26', 'null'),
(23, 'Studs', 22, '../uploads/categories/0', 'studs', 'studs', 'studs', 'studs', 'studs', 0, '', NULL),
(24, 'Hangings', 22, '../uploads/categories/0', 'Hangings', 'hangings', 'Hangings', 'Hangings', 'Hangings', 0, '', NULL),
(25, 'Close settings Studs', 22, '../uploads/categories/0', 'Close settings Studs', 'close-settings-studs', 'Close settings Studs', 'Close settings Studs\r\n', 'Close settings Studs', 0, '', NULL),
(26, 'J bali', 22, '', 'J bali', 'j-bali', 'J bali', 'J bali\r\n', 'J bali', 0, '', 'null'),
(27, 'Cocktail Ring', 7, '../uploads/categories/0', 'Cocktail Ring', 'cocktail-ring', '', '', '', 0, '', NULL),
(28, 'Diamond Necklace', 6, '../uploads/categories/0', 'Diamond Necklace', 'diamond-necklace', '', '', '', 0, '', 'null'),
(29, 'Nosepin', 0, '../uploads/categories/0', 'Nosepin', 'nosepin', '', '', '', 0, '', 'null'),
(30, 'Diamond Nosepin', 29, '../uploads/categories/0', 'Diamond Nosepin', 'diamond-nosepin', '', '', '', 0, '', 'null'),
(31, 'Solitaire Diamond Ring', 7, '../uploads/categories/0', 'Solitaire Diamond Ring', 'solitaire-diamond-ring', '', '', '', 0, '', 'null'),
(32, 'Chain', 0, '../uploads/categories/0', 'Chain', 'chain', '', '', '', 0, '', 'null'),
(33, 'Diamond Chai', 32, '../uploads/categories/0', 'Diamond Chai', 'diamond-chai', '', '', '', 0, '', 'null'),
(34, 'Diamond pendent', 3, '../uploads/categories/0', 'Diamond pendent', 'diamond-pendent', '', '', '', 0, '', 'null'),
(35, 'Diamond Hangings', 22, '../uploads/categories/0', 'Diamond Hangings', 'diamond-hangings', '', '', '', 0, '', 'null'),
(36, 'Diamond Jumkis', 22, '../uploads/categories/0', 'Diamond Jumkis', 'diamond-jumkis', '', '', '', 0, '', 'null'),
(37, 'Cocktail studs', 22, '../uploads/categories/0', 'Cocktail studs', 'cocktail-studs', '', '', '', 0, '', 'null'),
(38, 'Baby tops', 22, '../uploads/categories/0', 'Baby tops', 'baby-tops', '', '', '', 0, '', 'null'),
(39, 'Close settingDiamond studs', 22, '../uploads/categories/0', 'Close settingDiamond studs', 'close-settingdiamond-studs', '', '', '', 0, '', 'null'),
(40, 'Diamond pendent close setting', 3, '../uploads/categories/0', 'Diamond pendent close setting', 'diamond-pendent-close-setting', '', '', '', 0, '', 'null'),
(41, 'Close setting studs', 22, '../uploads/categories/0', 'Close setting studs', 'close-setting-studs', '', '', '', 0, '', 'null'),
(42, 'diamond pendent with black beads', 3, '../uploads/categories/0', 'diamond pendent with black beads', 'diamond-pendent-with-black-beads', '', '', '', 0, '', 'null'),
(43, 'Diamond pendent close setting With Black Beads', 3, '../uploads/categories/0', 'Diamond pendent close setting With Black Beads', 'diamond-pendent-close-setting-with-black-beads', '', '', '', 0, '', 'null'),
(44, 'Diamond Chain', 32, '../uploads/categories/0', 'Diamond Chain', 'diamond-chain', '', '', '', 0, '', 'null'),
(45, 'Waist Chain', 0, '../uploads/categories/waist-chain.png', 'Explore  board Gold waist belt on Pinterest.', 'waist-chain', 'Waist chain designs by Nikita', ' Explore board Gold waist belt on Pinterest. See more ideas about vaddanam designs gold waist belt waist jewelry. Gold waist belt Collection by Nikita Last updated 3 weeks ago. 74 Pins 30 followers. I', 'Waist, chain, belt, waist belt, gold, platinum, diamond', 0, '', 'null'),
(46, 'Waist Chain Gold', 45, '../uploads/categories/waist-chain-gold.png', 'Waist Chain made of gold with diamonds embedded', 'waist-chain-gold', 'Waist chain designs by Nikita', ' Explore board Gold waist belt on Pinterest. See more ideas about vaddanam designs gold waist belt waist jewelry. ', 'Waist, chain, belt, waist belt, gold, platinum, diamond', 0, '', 'null');

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

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `Product_imagesID` int(11) NOT NULL,
  `Image_filepath` varchar(255) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedon` timestamp NOT NULL DEFAULT current_timestamp()
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
  `Diamond_Shape_Id` int(11) NOT NULL,
  `OptionPriceincrement` float NOT NULL,
  `Quantity` float NOT NULL,
  `OptionWeight` char(15) NOT NULL,
  `OptionSize` char(20) NOT NULL,
  `OptionGroupID` int(11) NOT NULL,
  `attribute_type` enum('material','diamond','pearls','gemstone','diamond_shape','polki','other','beads') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`ProductOptionID`, `ProductID`, `OptionID`, `Combination_OptionID`, `Combination_OptionID_Secnd`, `Diamond_Shape_Id`, `OptionPriceincrement`, `Quantity`, `OptionWeight`, `OptionSize`, `OptionGroupID`, `attribute_type`) VALUES
(1, 1, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2, 1, 58, 12, 23, 22, 51000, 2144, '18.43', '', 0, 'diamond'),
(3, 1, 96, 0, 0, 0, 1000, 13, '17.23', '', 0, 'gemstone'),
(14, 5, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(15, 5, 58, 12, 23, 22, 51000, 2069, '25.77', '', 0, 'diamond'),
(16, 5, 100, 0, 0, 0, 300, 43, '55.31', '', 0, 'pearls'),
(17, 6, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(18, 6, 58, 12, 23, 22, 51000, 1302, '12.83', '', 0, 'diamond'),
(19, 6, 21, 0, 0, 0, 1000, 2, '8.74', '', 0, 'gemstone'),
(20, 7, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(21, 7, 58, 12, 23, 22, 51000, 2633, '23.47', '', 0, 'diamond'),
(22, 7, 21, 0, 0, 0, 1000, 37, '24.03', '', 0, 'gemstone'),
(23, 8, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(24, 8, 58, 12, 23, 22, 51000, 2283, '10.81', '', 0, 'diamond'),
(25, 8, 21, 0, 0, 0, 1000, 11, '21.82', '', 0, 'gemstone'),
(26, 9, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(27, 9, 58, 12, 23, 22, 51000, 1249, '8.2200000000000', '', 0, 'diamond'),
(28, 9, 21, 0, 0, 0, 1000, 10, '5.83', '', 0, 'gemstone'),
(29, 10, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(30, 10, 58, 12, 23, 22, 51000, 1584, '17.24', '', 0, 'diamond'),
(31, 10, 21, 0, 0, 0, 1000, 4, '13', '', 0, 'gemstone'),
(32, 11, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(33, 11, 58, 12, 23, 22, 51000, 464, '4.91', '', 0, 'diamond'),
(34, 11, 21, 0, 0, 0, 1000, 6, '6.2', '', 0, 'gemstone'),
(35, 11, 100, 0, 0, 0, 300, 11, '37.62', '', 0, 'pearls'),
(36, 12, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(37, 12, 58, 12, 23, 22, 51000, 313, '5.65', '', 0, 'diamond'),
(38, 12, 21, 0, 0, 0, 1000, 1, '3.08', '', 0, 'gemstone'),
(39, 13, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(40, 13, 58, 12, 23, 22, 51000, 370, '7.92', '', 0, 'diamond'),
(41, 13, 58, 12, 23, 24, 42000, 37, '0.67', '', 0, 'diamond'),
(42, 13, 21, 0, 0, 0, 1000, 2, '10.18', '', 0, 'gemstone'),
(43, 14, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(44, 14, 58, 12, 23, 22, 51000, 286, '3.01', '', 0, 'diamond'),
(45, 14, 58, 12, 23, 24, 42000, 42, '0.34', '', 0, 'diamond'),
(46, 15, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(47, 15, 58, 12, 23, 22, 51000, 378, '3.92', '', 0, 'diamond'),
(48, 15, 21, 0, 0, 0, 1000, 7, '2', '', 0, 'gemstone'),
(49, 15, 100, 0, 0, 0, 300, 1, '8.07', '', 0, 'pearls'),
(50, 16, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(51, 16, 58, 12, 23, 22, 51000, 139, '2.86', '', 0, 'diamond'),
(52, 17, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(53, 17, 58, 12, 23, 22, 51000, 361, '3.99', '', 0, 'diamond'),
(54, 17, 100, 0, 0, 0, 300, 1, '5.15', '', 0, 'pearls'),
(55, 18, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(56, 18, 58, 12, 23, 22, 51000, 726, '5.09', '', 0, 'diamond'),
(57, 18, 21, 0, 0, 0, 1000, 2, '7.41', '', 0, 'gemstone'),
(58, 19, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(59, 19, 58, 12, 23, 22, 51000, 575, '7.4', '', 0, 'diamond'),
(60, 19, 21, 0, 0, 0, 1000, 2, '14.47', '', 0, 'gemstone'),
(61, 19, 100, 0, 0, 0, 300, 6, '15.23', '', 0, 'pearls'),
(62, 20, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(63, 20, 58, 12, 23, 22, 51000, 425, '4.71', '', 0, 'diamond'),
(64, 20, 21, 0, 0, 0, 1000, 2, '1', '', 0, 'gemstone'),
(65, 20, 100, 0, 0, 0, 300, 1, '15.33', '', 0, 'pearls'),
(66, 21, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(67, 21, 58, 12, 23, 22, 51000, 650, '7.68', '', 0, 'diamond'),
(68, 21, 58, 12, 23, 24, 42000, 44, '0.9399999999999', '', 0, 'diamond'),
(69, 21, 21, 0, 0, 0, 1000, 2, '14.23', '', 0, 'gemstone'),
(70, 22, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(71, 22, 58, 12, 23, 22, 51000, 1033, '10.41', '', 0, 'diamond'),
(72, 22, 58, 12, 23, 24, 42000, 41, '0.74', '', 0, 'diamond'),
(73, 22, 21, 0, 0, 0, 1000, 2, '6.05', '', 0, 'gemstone'),
(74, 22, 100, 0, 0, 0, 300, 5, '21.96', '', 0, 'pearls'),
(75, 23, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(76, 23, 58, 12, 23, 22, 51000, 788, '10.51', '', 0, 'diamond'),
(77, 23, 21, 0, 0, 0, 1000, 2, '6.21', '', 0, 'gemstone'),
(78, 23, 100, 0, 0, 0, 300, 5, '20.59', '', 0, 'pearls'),
(79, 24, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(80, 24, 58, 12, 23, 22, 51000, 1092, '11.65', '', 0, 'diamond'),
(81, 24, 21, 0, 0, 0, 1000, 6, '4.09', '', 0, 'gemstone'),
(82, 24, 100, 0, 0, 0, 300, 1, '8.25', '', 0, 'pearls'),
(83, 25, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(84, 25, 58, 12, 23, 22, 51000, 980, '13.76', '', 0, 'diamond'),
(85, 25, 21, 0, 0, 0, 1000, 6, '12.35', '', 0, 'gemstone'),
(86, 25, 100, 0, 0, 0, 300, 25, '27.83', '', 0, 'pearls'),
(87, 26, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(88, 26, 58, 12, 23, 22, 51000, 175, '3.19', '', 0, 'diamond'),
(89, 26, 21, 0, 0, 0, 1000, 2, '1.42', '', 0, 'gemstone'),
(90, 26, 100, 0, 0, 0, 300, 1, '13.2', '', 0, 'pearls'),
(91, 27, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(92, 27, 58, 12, 23, 22, 51000, 1, '3.15', '', 0, 'diamond'),
(93, 27, 100, 0, 0, 0, 300, 1, '4.84', '', 0, 'pearls'),
(94, 27, 102, 0, 0, 0, 0, 1, '40.1', '', 0, 'other'),
(95, 28, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(96, 28, 58, 12, 23, 22, 51000, 238, '2.51', '', 0, 'diamond'),
(97, 29, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(98, 29, 58, 12, 23, 22, 51000, 457, '2.59', '', 0, 'diamond'),
(99, 30, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(100, 30, 58, 12, 23, 22, 51000, 725, '3.77', '', 0, 'diamond'),
(101, 31, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(102, 31, 58, 12, 23, 22, 51000, 209, '2.27', '', 0, 'diamond'),
(103, 31, 21, 0, 0, 0, 2500, 1, '16.09', '', 0, 'gemstone'),
(104, 32, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(105, 32, 58, 12, 23, 22, 51000, 1375, '9.5500000000000', '', 0, 'diamond'),
(106, 33, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(107, 33, 58, 12, 23, 22, 51000, 1680, '18.86', '', 0, 'diamond'),
(108, 33, 58, 12, 23, 24, 42000, 28, '0.62', '', 0, 'diamond'),
(109, 33, 21, 0, 0, 0, 1000, 2, '3.64', '', 0, 'gemstone'),
(110, 33, 100, 0, 0, 0, 300, 1, '13.3', '', 0, 'pearls'),
(111, 34, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(112, 34, 58, 12, 23, 22, 51000, 569, '7.18', '', 0, 'diamond'),
(113, 34, 21, 0, 0, 0, 1000, 2, '10.28', '', 0, 'gemstone'),
(114, 34, 100, 0, 0, 0, 300, 1, '16.84', '', 0, 'pearls'),
(115, 35, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(116, 35, 58, 12, 23, 22, 51000, 860, '11.83', '', 0, 'diamond'),
(117, 36, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(118, 36, 58, 12, 23, 22, 51000, 696, '6.86', '', 0, 'diamond'),
(119, 36, 21, 0, 0, 0, 1000, 2, '3.56', '', 0, 'gemstone'),
(120, 37, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(121, 37, 58, 12, 23, 22, 51000, 1324, '13.49', '', 0, 'diamond'),
(122, 37, 21, 0, 0, 0, 1000, 2, '5.99', '', 0, 'gemstone'),
(123, 38, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(124, 38, 58, 12, 23, 22, 51000, 1213, '13.84', '', 0, 'diamond'),
(125, 38, 21, 0, 0, 0, 1000, 2, '8.52', '', 0, 'gemstone'),
(126, 38, 100, 0, 0, 0, 300, 17, '80.040000000000', '', 0, 'pearls'),
(127, 39, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(128, 39, 58, 12, 23, 22, 51000, 1285, '8.9600000000000', '', 0, 'diamond'),
(129, 39, 21, 0, 0, 0, 1000, 2, '6.02', '', 0, 'gemstone'),
(130, 40, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(131, 40, 58, 12, 23, 22, 51000, 582, '4.36', '', 0, 'diamond'),
(132, 40, 58, 12, 23, 25, 68000, 24, '1.09', '', 0, 'diamond'),
(133, 40, 58, 12, 23, 29, 68000, 10, '0.59', '', 0, 'diamond'),
(134, 40, 21, 0, 0, 0, 1200, 6, '13.73', '', 0, 'gemstone'),
(135, 40, 100, 0, 0, 0, 300, 11, '21.97', '', 0, 'pearls'),
(136, 41, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(137, 41, 58, 12, 23, 22, 51000, 226, '36.94', '', 0, 'diamond'),
(138, 41, 21, 0, 0, 0, 1000, 4, '5.34', '', 0, 'gemstone'),
(139, 42, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(140, 42, 58, 12, 23, 22, 51000, 730, '7.51', '', 0, 'diamond'),
(141, 42, 58, 12, 23, 24, 42000, 27, '0.5', '', 0, 'diamond'),
(142, 42, 21, 0, 0, 0, 1000, 2, '3.35', '', 0, 'gemstone'),
(143, 42, 100, 0, 0, 0, 300, 11, '44.02', '', 0, 'pearls'),
(144, 43, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(145, 43, 58, 12, 23, 22, 51000, 884, '17.06', '', 0, 'diamond'),
(146, 43, 58, 12, 23, 24, 42000, 40, '0.78', '', 0, 'diamond'),
(147, 43, 21, 0, 0, 0, 1000, 4, '12.42', '', 0, 'gemstone'),
(148, 43, 100, 0, 0, 0, 300, 7, '16.14', '', 0, 'pearls'),
(149, 44, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(150, 44, 58, 12, 23, 22, 51000, 353, '4.65', '', 0, 'diamond'),
(151, 44, 21, 0, 0, 0, 1000, 2, '2.74', '', 0, 'gemstone'),
(152, 44, 100, 0, 0, 0, 300, 5, '19.71', '', 0, 'pearls'),
(153, 45, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(154, 45, 58, 12, 23, 22, 51000, 487, '6.92', '', 0, 'diamond'),
(155, 45, 58, 12, 23, 24, 42000, 16, '0.18', '', 0, 'diamond'),
(156, 45, 21, 0, 0, 0, 1000, 2, '6.68', '', 0, 'gemstone'),
(157, 45, 100, 0, 0, 0, 300, 5, '19.32', '', 0, 'pearls'),
(158, 46, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(159, 46, 58, 12, 23, 22, 51000, 737, '13.78', '', 0, 'diamond'),
(160, 46, 21, 0, 0, 0, 1000, 2, '9.56', '', 0, 'gemstone'),
(161, 47, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(162, 47, 58, 12, 23, 22, 51000, 1181, '12.44', '', 0, 'diamond'),
(163, 47, 58, 12, 23, 24, 42000, 38, '0.33', '', 0, 'diamond'),
(164, 47, 21, 0, 0, 0, 1000, 2, '2.43', '', 0, 'gemstone'),
(165, 47, 100, 0, 0, 0, 300, 1, '16.31', '', 0, 'pearls'),
(166, 48, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(167, 48, 58, 12, 23, 22, 51000, 412, '16.6', '', 0, 'diamond'),
(168, 48, 21, 0, 0, 0, 1000, 8, '4.77', '', 0, 'gemstone'),
(169, 49, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(170, 49, 58, 12, 23, 22, 51000, 1353, '14.05', '', 0, 'diamond'),
(171, 49, 58, 12, 23, 24, 42000, 40, '0.77', '', 0, 'diamond'),
(172, 49, 2, 2, 23, 101, 42000, 11, '1.06', '', 0, 'diamond'),
(173, 49, 21, 0, 0, 0, 1000, 2, '13.8', '', 0, 'gemstone'),
(174, 50, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(175, 50, 58, 12, 23, 22, 51000, 1747, '17.1', '', 0, 'diamond'),
(176, 50, 21, 0, 0, 0, 1000, 4, '11.73', '', 0, 'gemstone'),
(177, 50, 100, 0, 0, 0, 300, 5, '16.27', '', 0, 'pearls'),
(178, 51, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(179, 51, 58, 12, 23, 22, 51000, 1515, '17.73', '', 0, 'diamond'),
(180, 51, 21, 0, 0, 0, 1000, 2, '19.45', '', 0, 'gemstone'),
(181, 52, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(182, 52, 58, 12, 23, 22, 51000, 980, '12.4', '', 0, 'diamond'),
(183, 52, 21, 0, 0, 0, 1000, 2, '4.04', '', 0, 'gemstone'),
(184, 52, 100, 0, 0, 0, 300, 1, '16.36', '', 0, 'pearls'),
(185, 53, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(186, 53, 58, 12, 23, 22, 51000, 829, '7.33', '', 0, 'diamond'),
(187, 53, 21, 0, 0, 0, 1000, 2, '6.34', '', 0, 'gemstone'),
(188, 53, 100, 0, 0, 0, 300, 7, '27.55', '', 0, 'pearls'),
(189, 54, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(190, 54, 58, 12, 23, 22, 51000, 534, '6.04', '', 0, 'diamond'),
(191, 54, 21, 0, 0, 0, 1000, 2, '6.77', '', 0, 'gemstone'),
(192, 54, 100, 0, 0, 0, 300, 5, '20.74', '', 0, 'pearls'),
(193, 55, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(194, 55, 58, 12, 23, 22, 51000, 2143, '18.67', '', 0, 'diamond'),
(195, 55, 21, 0, 0, 0, 1000, 6, '3.34', '', 0, 'gemstone'),
(196, 56, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(197, 56, 58, 12, 23, 22, 51000, 1166, '8.2200000000000', '', 0, 'diamond'),
(198, 57, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(199, 57, 58, 12, 23, 22, 51000, 811, '6.86', '', 0, 'diamond'),
(200, 57, 58, 12, 23, 24, 42000, 31, '0.77', '', 0, 'diamond'),
(201, 57, 21, 0, 0, 0, 1000, 2, '4.28', '', 0, 'gemstone'),
(202, 57, 100, 0, 0, 0, 300, 7, '25.29', '', 0, 'pearls'),
(203, 58, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(204, 58, 58, 12, 2, 22, 51000, 515, '10.08', '', 0, 'diamond'),
(205, 58, 2, 2, 2, 26, 42000, 61, '9.4', '', 0, 'diamond'),
(206, 58, 58, 12, 2, 25, 68000, 119, '6.38', '', 0, 'diamond'),
(207, 58, 58, 12, 2, 29, 105000, 27, '5.91', '', 0, 'diamond'),
(208, 58, 21, 0, 0, 0, 18000, 47, '40.84', '', 0, 'gemstone'),
(209, 59, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(210, 59, 58, 12, 23, 22, 51000, 1, '4.7', '', 0, 'diamond'),
(211, 59, 100, 0, 0, 0, 300, 1, '3.78', '', 0, 'pearls'),
(212, 60, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(213, 60, 58, 12, 23, 22, 51000, 2082, '22.58', '', 0, 'diamond'),
(214, 60, 21, 0, 0, 0, 1000, 10, '17.36', '', 0, 'gemstone'),
(215, 60, 100, 0, 0, 0, 300, 1, '9.0500000000000', '', 0, 'pearls'),
(216, 61, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(217, 61, 58, 12, 23, 22, 51000, 2404, '23.09', '', 0, 'diamond'),
(218, 61, 21, 0, 0, 0, 1000, 6, '16.29', '', 0, 'gemstone'),
(219, 61, 100, 0, 0, 0, 300, 3, '22.07', '', 0, 'pearls'),
(220, 62, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(221, 62, 58, 12, 23, 22, 51000, 375, '9.33', '', 0, 'diamond'),
(222, 62, 96, 0, 0, 0, 3000, 3, '2.18', '', 0, 'gemstone'),
(223, 62, 90, 0, 0, 0, 3000, 3, '1.82', '', 0, 'gemstone'),
(224, 63, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(225, 63, 58, 12, 23, 22, 51000, 2309, '17.07', '', 0, 'diamond'),
(226, 63, 21, 0, 0, 0, 8000, 7, '7.303', '', 0, 'gemstone'),
(227, 63, 100, 0, 0, 0, 300, 9, '35.18', '', 0, 'pearls'),
(228, 64, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(229, 64, 58, 12, 23, 22, 51000, 497, '3.57', '', 0, 'diamond'),
(230, 64, 21, 0, 0, 0, 1000, 2, '3.94', '', 0, 'gemstone'),
(231, 64, 100, 0, 0, 0, 300, 5, '6.3', '', 0, 'pearls'),
(232, 65, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(233, 65, 58, 12, 23, 22, 51000, 726, '22.64', '', 0, 'diamond'),
(234, 65, 96, 0, 0, 0, 3000, 26, '2.73', '', 0, 'gemstone'),
(235, 65, 90, 0, 0, 0, 3000, 23, '2.16', '', 0, 'gemstone'),
(236, 66, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(237, 66, 58, 12, 23, 22, 51000, 550, '13.32', '', 0, 'diamond'),
(238, 66, 96, 0, 0, 0, 3000, 24, '2.41', '', 0, 'gemstone'),
(239, 66, 90, 0, 0, 0, 3000, 22, '5.29', '', 0, 'gemstone'),
(240, 67, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(241, 67, 58, 12, 23, 22, 51000, 318, '3.64', '', 0, 'diamond'),
(242, 67, 58, 12, 23, 24, 42000, 25, '0.42', '', 0, 'diamond'),
(243, 67, 21, 0, 0, 0, 1000, 2, '3.46', '', 0, 'gemstone'),
(244, 68, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(245, 68, 58, 12, 23, 22, 51000, 494, '9.67', '', 0, 'diamond'),
(246, 68, 96, 0, 0, 0, 3000, 6, '0.15', '', 0, 'gemstone'),
(247, 68, 90, 0, 0, 0, 3000, 2, '1.93', '', 0, 'gemstone'),
(248, 69, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(249, 69, 58, 12, 23, 22, 51000, 2273, '21.8', '', 0, 'diamond'),
(250, 69, 21, 0, 0, 0, 1000, 2, '8.18', '', 0, 'gemstone'),
(251, 70, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(252, 70, 58, 12, 23, 22, 51000, 418, '4.68', '', 0, 'diamond'),
(253, 70, 21, 0, 0, 0, 1000, 2, '5.09', '', 0, 'gemstone'),
(254, 71, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(255, 71, 58, 12, 23, 22, 51000, 451, '5.92', '', 0, 'diamond'),
(256, 71, 21, 0, 0, 0, 1000, 4, '8.08', '', 0, 'gemstone'),
(257, 72, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(258, 72, 58, 12, 23, 22, 51000, 243, '3.37', '', 0, 'diamond'),
(259, 73, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(260, 73, 58, 12, 23, 22, 51000, 426, '11.42', '', 0, 'diamond'),
(261, 73, 21, 0, 0, 0, 3000, 13, '1.2', '', 0, 'gemstone'),
(262, 73, 100, 0, 0, 0, 300, 14, '14.26', '', 0, 'pearls'),
(263, 74, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(264, 74, 58, 12, 23, 22, 51000, 299, '4.64', '', 0, 'diamond'),
(265, 74, 21, 0, 0, 0, 1000, 2, '6.6', '', 0, 'gemstone'),
(266, 75, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(267, 75, 58, 12, 23, 22, 51000, 223, '5.43', '', 0, 'diamond'),
(268, 75, 21, 0, 0, 0, 1000, 2, '2.5', '', 0, 'gemstone'),
(269, 76, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(270, 76, 58, 12, 23, 22, 51000, 2483, '22.69', '', 0, 'diamond'),
(271, 77, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(272, 77, 58, 12, 23, 22, 51000, 1645, '21.47', '', 0, 'diamond'),
(273, 77, 21, 0, 0, 0, 1000, 2, '10.55', '', 0, 'gemstone'),
(274, 77, 100, 0, 0, 0, 300, 7, '37.53', '', 0, 'pearls'),
(275, 78, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(276, 78, 58, 12, 23, 22, 51000, 136, '0.6899999999999', '', 0, 'diamond'),
(277, 79, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(278, 79, 58, 12, 23, 22, 51000, 76, '0.74', '', 0, 'diamond'),
(279, 80, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(280, 80, 58, 12, 23, 22, 51000, 704, '4.94', '', 0, 'diamond'),
(281, 80, 21, 0, 0, 0, 1000, 3, '4.6', '', 0, 'gemstone'),
(282, 80, 100, 0, 0, 0, 300, 1, '6.61', '', 0, 'pearls'),
(283, 81, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(284, 81, 58, 12, 23, 22, 51000, 539, '3.9', '', 0, 'diamond'),
(285, 81, 21, 0, 0, 0, 1000, 3, '9.93', '', 0, 'gemstone'),
(286, 81, 100, 0, 0, 0, 300, 1, '3.19', '', 0, 'pearls'),
(287, 82, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(288, 82, 58, 12, 23, 22, 51000, 171, '0.76', '', 0, 'diamond'),
(289, 83, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(290, 83, 58, 12, 2, 22, 42000, 1, '3.79', '', 0, 'diamond'),
(291, 83, 21, 0, 0, 0, 15000, 1, '1.47', '', 0, 'gemstone'),
(292, 83, 93, 0, 0, 0, 4000, 1, '2.94', '', 0, 'gemstone'),
(293, 84, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(294, 84, 58, 12, 2, 22, 42000, 1, '12.48', '', 0, 'diamond'),
(295, 84, 90, 0, 0, 0, 15000, 1, '11.69', '', 0, 'gemstone'),
(296, 84, 91, 0, 0, 0, 25000, 1, '5.38', '', 0, 'gemstone'),
(297, 85, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(298, 85, 58, 12, 23, 22, 51000, 231, '7.33', '', 0, 'diamond'),
(299, 85, 58, 12, 23, 24, 42000, 141, '5.3', '', 0, 'diamond'),
(300, 85, 2, 2, 2, 26, 40000, 42, '5.79', '', 0, 'diamond'),
(301, 85, 21, 0, 0, 0, 20000, 11, '16.15', '', 0, 'gemstone'),
(302, 86, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(303, 86, 58, 12, 23, 29, 42000, 1, '32.46', '', 0, 'diamond'),
(304, 86, 21, 0, 0, 0, 20000, 1, '6.86', '', 0, 'gemstone'),
(305, 87, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(306, 87, 58, 12, 23, 22, 51000, 3576, '18.04', '', 0, 'diamond'),
(307, 87, 96, 0, 0, 0, 3000, 632, '5.85', '', 0, 'gemstone'),
(308, 87, 90, 0, 0, 0, 25000, 38, '41.77', '', 0, 'gemstone'),
(309, 87, 105, 0, 0, 0, 800, 1, '21.2', '', 0, 'beads'),
(310, 88, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(311, 88, 58, 12, 2, 22, 42000, 1, '3.19', '', 0, 'diamond'),
(312, 88, 100, 0, 0, 0, 400, 1, '166.42', '', 0, 'pearls'),
(313, 88, 106, 0, 0, 0, 3000, 1, '91.040000000000', '', 0, 'beads'),
(327, 95, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(328, 95, 58, 12, 2, 22, 56000, 1, '0.06', '', 0, 'diamond'),
(329, 96, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(330, 96, 58, 12, 2, 22, 51000, 4, '0.03', '', 0, 'diamond'),
(331, 97, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(332, 97, 58, 12, 2, 22, 51000, 4, '0.03', '', 0, 'diamond'),
(333, 98, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(334, 98, 58, 12, 2, 22, 51000, 4, '0.03', '', 0, 'diamond'),
(335, 99, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(336, 99, 58, 12, 2, 22, 51000, 4, '0.03', '', 0, 'diamond'),
(337, 100, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(338, 100, 58, 12, 2, 22, 51000, 4, '0.03', '', 0, 'diamond'),
(339, 101, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(340, 101, 58, 12, 23, 22, 51000, 42, '0.31', '', 0, 'diamond'),
(341, 102, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(342, 102, 58, 12, 23, 22, 51000, 67, '0.44', '', 0, 'diamond'),
(343, 103, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(344, 103, 58, 12, 23, 22, 51000, 58, '0.32', '', 0, 'diamond'),
(345, 104, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(346, 104, 58, 12, 23, 22, 190000, 1, '0.32', '', 0, 'diamond'),
(347, 105, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(348, 105, 58, 12, 23, 22, 150000, 1, '0.24', '', 0, 'diamond'),
(349, 106, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(350, 106, 58, 12, 23, 22, 150000, 1, '0.27', '', 0, 'diamond'),
(351, 107, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(352, 107, 58, 12, 23, 22, 150000, 1, '0.25', '', 0, 'diamond'),
(353, 108, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(354, 108, 58, 12, 23, 22, 150000, 1, '0.24', '', 0, 'diamond'),
(355, 109, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(356, 109, 58, 12, 23, 22, 150000, 1, '0.25', '', 0, 'diamond'),
(357, 109, 58, 12, 23, 22, 51000, 98, '0.73', '', 0, 'diamond'),
(358, 110, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(359, 110, 58, 12, 23, 22, 150000, 1, '0.25', '', 0, 'diamond'),
(360, 111, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(361, 111, 58, 12, 23, 22, 150000, 1, '0.25', '', 0, 'diamond'),
(362, 112, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(363, 112, 58, 12, 23, 22, 130000, 1, '0.2', '', 0, 'diamond'),
(364, 113, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(365, 113, 58, 12, 23, 22, 150000, 1, '0.27', '', 0, 'diamond'),
(366, 113, 58, 12, 23, 22, 51000, 4, '0.06', '', 0, 'diamond'),
(367, 114, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(368, 114, 58, 12, 23, 22, 150000, 1, '0.24', '', 0, 'diamond'),
(369, 114, 58, 12, 23, 22, 51000, 62, '0.74', '', 0, 'diamond'),
(370, 115, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(371, 115, 58, 12, 23, 22, 150000, 1, '0.27', '', 0, 'diamond'),
(372, 115, 58, 12, 23, 22, 51000, 67, '0.33', '', 0, 'diamond'),
(373, 116, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(374, 116, 58, 12, 23, 22, 51000, 25, '1.23', '', 0, 'diamond'),
(375, 117, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(376, 117, 58, 12, 23, 22, 75000, 1, '0.1', '', 0, 'diamond'),
(377, 118, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(378, 118, 58, 12, 23, 22, 150000, 1, '0.23', '', 0, 'diamond'),
(379, 118, 58, 12, 23, 22, 51000, 34, '0.17', '', 0, 'diamond'),
(380, 119, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(381, 119, 58, 12, 23, 22, 130000, 1, '0.19', '', 0, 'diamond'),
(382, 119, 58, 12, 23, 22, 51000, 40, '0.41', '', 0, 'diamond'),
(383, 120, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(384, 120, 58, 12, 23, 22, 150000, 1, '0.26', '', 0, 'diamond'),
(385, 120, 58, 12, 23, 22, 51000, 8, '0.1', '', 0, 'diamond'),
(386, 121, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(387, 121, 58, 12, 23, 22, 190000, 1, '0.31', '', 0, 'diamond'),
(388, 121, 58, 12, 23, 22, 51000, 6, '0.04', '', 0, 'diamond'),
(389, 122, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(390, 122, 58, 12, 23, 22, 300000, 1, '0.5', '', 0, 'diamond'),
(391, 122, 58, 12, 23, 22, 51000, 40, '0.18', '', 0, 'diamond'),
(392, 123, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(393, 123, 58, 12, 23, 22, 51000, 5, '0.12', '', 0, 'diamond'),
(394, 124, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(395, 124, 58, 12, 23, 22, 51000, 37, '0.26', '', 0, 'diamond'),
(396, 125, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(397, 125, 58, 12, 23, 22, 75000, 1, '0.12', '', 0, 'diamond'),
(398, 126, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(399, 126, 58, 12, 23, 22, 190000, 1, '0.34', '', 0, 'diamond'),
(400, 126, 58, 12, 23, 22, 51000, 38, '0.15', '', 0, 'diamond'),
(401, 127, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(402, 127, 58, 12, 23, 22, 51000, 5, '0.05', '', 0, 'diamond'),
(409, 131, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(410, 131, 58, 12, 23, 22, 51000, 8, '0.12', '', 0, 'diamond'),
(411, 132, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(412, 132, 58, 12, 23, 22, 51000, 13, '0.2', '', 0, 'diamond'),
(413, 133, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(414, 133, 58, 12, 23, 22, 51000, 11, '0.22', '', 0, 'diamond'),
(415, 134, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(416, 134, 58, 12, 23, 22, 51000, 14, '0.22', '', 0, 'diamond'),
(417, 135, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(418, 135, 58, 12, 23, 22, 51000, 21, '0.16', '', 0, 'diamond'),
(419, 136, 0, 3, 15, 0, 0, 0, '0', '5', 0, 'material'),
(420, 136, 58, 12, 23, 22, 51000, 60, '0.5', '', 0, 'diamond'),
(421, 137, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(422, 137, 58, 12, 23, 22, 68000, 4, '0.29', '', 0, 'diamond'),
(423, 138, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(424, 138, 58, 12, 23, 22, 51000, 63, '0.32', '', 0, 'diamond'),
(425, 139, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(426, 139, 58, 12, 23, 22, 51000, 13, '0.32', '', 0, 'diamond'),
(427, 140, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(428, 140, 58, 12, 23, 22, 51000, 14, '0.18', '', 0, 'diamond'),
(429, 141, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(430, 141, 58, 12, 23, 22, 51000, 3, '0.04', '', 0, 'diamond'),
(431, 142, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(432, 142, 58, 12, 23, 22, 51000, 33, '0.53', '', 0, 'diamond'),
(433, 143, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(434, 143, 58, 12, 23, 22, 51000, 2, '0.02', '', 0, 'diamond'),
(435, 144, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(436, 144, 58, 12, 23, 22, 68000, 1, '0.08', '', 0, 'diamond'),
(437, 145, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(438, 145, 58, 12, 23, 22, 51000, 19, '0.23', '', 0, 'diamond'),
(439, 146, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(440, 146, 58, 12, 23, 22, 51000, 137, '0.84', '', 0, 'diamond'),
(441, 147, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(442, 147, 58, 12, 23, 22, 51000, 13, '0.23', '', 0, 'diamond'),
(443, 148, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(444, 148, 58, 12, 23, 22, 51000, 12, '0.16', '', 0, 'diamond'),
(445, 149, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(446, 149, 58, 12, 23, 22, 51000, 2, '0.25', '', 0, 'diamond'),
(447, 150, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(448, 150, 58, 12, 23, 22, 51000, 14, '0.21', '', 0, 'diamond'),
(449, 151, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(450, 151, 58, 12, 23, 22, 51000, 18, '0.16', '', 0, 'diamond'),
(451, 152, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(452, 152, 58, 12, 23, 22, 51000, 12, '0.38', '', 0, 'diamond'),
(453, 153, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(454, 153, 58, 12, 23, 22, 51000, 20, '0.14', '', 0, 'diamond'),
(455, 154, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(456, 154, 58, 12, 23, 22, 51000, 12, '0.08', '', 0, 'diamond'),
(457, 155, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(458, 155, 58, 12, 23, 22, 51000, 18, '0.15', '', 0, 'diamond'),
(459, 156, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(460, 156, 58, 12, 23, 22, 75000, 1, '0.12', '', 0, 'diamond'),
(461, 157, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(462, 157, 58, 12, 23, 22, 51000, 4, '0.0700000000000', '', 0, 'diamond'),
(463, 158, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(464, 158, 58, 12, 23, 22, 51000, 65, '0.84', '', 0, 'diamond'),
(465, 159, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(466, 159, 58, 12, 23, 22, 51000, 33, '0.95', '', 0, 'diamond'),
(467, 160, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(468, 160, 58, 12, 23, 22, 51000, 43, '0.43', '', 0, 'diamond'),
(469, 161, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(470, 161, 58, 12, 23, 22, 51000, 40, '0.26', '', 0, 'diamond'),
(471, 162, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(472, 162, 58, 12, 23, 22, 75000, 1, '0.11', '', 0, 'diamond'),
(473, 163, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(474, 163, 58, 12, 23, 22, 51000, 39, '0.75', '', 0, 'diamond'),
(475, 164, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(476, 164, 58, 12, 23, 22, 51000, 134, '1.26', '', 0, 'diamond'),
(477, 164, 58, 12, 23, 24, 42000, 17, '0.18', '', 0, 'diamond'),
(478, 165, 0, 3, 15, 0, 0, 0, '0', '9', 0, 'material'),
(479, 165, 58, 12, 23, 22, 51000, 26, '0.37', '', 0, 'diamond'),
(480, 166, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(481, 166, 58, 12, 23, 22, 51000, 4, '0.05', '', 0, 'diamond'),
(482, 167, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(483, 167, 58, 12, 23, 22, 68000, 1, '0.08', '', 0, 'diamond'),
(484, 168, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(485, 168, 58, 12, 23, 22, 51000, 15, '0.2', '', 0, 'diamond'),
(486, 169, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(487, 169, 58, 12, 23, 22, 75000, 1, '0.11', '', 0, 'diamond'),
(488, 170, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(489, 170, 58, 12, 23, 22, 90000, 1, '0.14', '', 0, 'diamond'),
(490, 171, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(491, 171, 58, 12, 23, 22, 75000, 1, '0.11', '', 0, 'diamond'),
(492, 172, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(493, 172, 58, 12, 23, 22, 51000, 8, '0.3', '', 0, 'diamond'),
(494, 173, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(495, 173, 58, 12, 23, 22, 51000, 9, '0.08', '', 0, 'diamond'),
(496, 174, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(497, 174, 58, 12, 23, 22, 51000, 7, '0.04', '', 0, 'diamond'),
(498, 175, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(499, 175, 58, 12, 23, 22, 51000, 4, '0.04', '', 0, 'diamond'),
(500, 176, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(501, 176, 58, 12, 23, 22, 51000, 12, '0.12', '', 0, 'diamond'),
(502, 177, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(503, 177, 58, 12, 23, 22, 51000, 14, '0.17', '', 0, 'diamond'),
(504, 178, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(505, 178, 58, 12, 23, 22, 51000, 13, '0.21', '', 0, 'diamond'),
(506, 179, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(507, 179, 58, 12, 23, 22, 51000, 6, '0.0700000000000', '', 0, 'diamond'),
(508, 180, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(509, 180, 58, 12, 23, 22, 51000, 11, '0.14', '', 0, 'diamond'),
(510, 181, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(511, 181, 58, 12, 23, 22, 51000, 15, '0.18', '', 0, 'diamond'),
(512, 182, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(513, 182, 58, 12, 23, 22, 51000, 28, '0.18', '', 0, 'diamond'),
(514, 183, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(515, 183, 58, 12, 23, 22, 51000, 16, '0.53', '', 0, 'diamond'),
(516, 184, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(517, 184, 58, 12, 23, 22, 68000, 1, '0.0700000000000', '', 0, 'diamond'),
(518, 185, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(519, 185, 58, 12, 23, 22, 51000, 1, '0.0700000000000', '', 0, 'diamond'),
(520, 186, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(521, 186, 58, 12, 23, 22, 51000, 9, '0.44', '', 0, 'diamond'),
(522, 187, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(523, 187, 58, 12, 23, 22, 51000, 3, '0.22', '', 0, 'diamond'),
(524, 188, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(525, 188, 58, 12, 23, 22, 130000, 1, '0.17', '', 0, 'diamond'),
(526, 189, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(527, 190, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(528, 190, 58, 12, 23, 22, 68000, 6, '0.59', '', 0, 'diamond'),
(529, 191, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(530, 191, 58, 12, 23, 22, 51000, 21, '0.71', '', 0, 'diamond'),
(531, 192, 0, 3, 15, 0, 0, 0, '0', '8', 0, 'material'),
(532, 192, 58, 12, 23, 22, 51000, 10, '0.35', '', 0, 'diamond'),
(533, 193, 0, 3, 16, 0, 0, 0, '0', '8', 0, 'material'),
(534, 193, 58, 12, 23, 22, 220000, 1, '0.37', '', 0, 'diamond'),
(535, 194, 0, 3, 16, 0, 0, 0, '0', '2', 0, 'material'),
(536, 194, 58, 12, 23, 22, 56000, 1, '0.06', '', 0, 'diamond'),
(537, 195, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(538, 195, 58, 12, 23, 22, 75000, 1, '0.11', '', 0, 'diamond'),
(539, 196, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(540, 196, 58, 12, 23, 22, 51000, 3, '0.12', '', 0, 'diamond'),
(541, 197, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(542, 197, 58, 12, 23, 22, 75000, 1, '0.13', '', 0, 'diamond'),
(543, 198, 0, 3, 16, 0, 0, 0, '0', '2', 0, 'material'),
(544, 198, 58, 12, 23, 22, 130000, 1, '0.19', '', 0, 'diamond'),
(545, 199, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(546, 199, 58, 12, 23, 22, 150000, 1, '0.26', '', 0, 'diamond'),
(547, 199, 58, 12, 23, 22, 51000, 2, '0.01', '', 0, 'diamond'),
(548, 200, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(549, 200, 58, 12, 23, 22, 130000, 1, '0.18', '', 0, 'diamond'),
(550, 201, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(551, 201, 58, 12, 23, 22, 240000, 1, '0.4', '', 0, 'diamond'),
(552, 202, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(553, 202, 58, 12, 23, 22, 190000, 1, '0.3', '', 0, 'diamond'),
(554, 203, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(555, 203, 58, 12, 23, 22, 190000, 1, '0.33', '', 0, 'diamond'),
(556, 203, 58, 12, 23, 22, 51000, 24, '0.1', '', 0, 'diamond'),
(557, 204, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(558, 204, 58, 12, 23, 22, 51000, 8, '0.23', '', 0, 'diamond'),
(559, 205, 0, 3, 16, 0, 0, 0, '0', '2', 0, 'material'),
(560, 205, 58, 12, 23, 22, 75000, 1, '0.11', '', 0, 'diamond'),
(561, 206, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(562, 206, 58, 12, 23, 22, 75000, 3, '0.32', '', 0, 'diamond'),
(563, 207, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(564, 207, 58, 12, 23, 22, 56000, 8, '0.5', '', 0, 'diamond'),
(565, 208, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(566, 208, 58, 12, 23, 22, 260000, 1, '0.42', '', 0, 'diamond'),
(567, 209, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(568, 209, 58, 12, 23, 22, 75000, 3, '0.3', '', 0, 'diamond'),
(569, 210, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(570, 210, 58, 12, 23, 22, 200000, 1, '0.7', '', 0, 'diamond'),
(571, 210, 58, 12, 23, 22, 51000, 1, '0.23', '', 0, 'diamond'),
(572, 211, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(573, 211, 58, 12, 23, 22, 51000, 73, '0.46', '', 0, 'diamond'),
(574, 212, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(575, 212, 58, 12, 23, 22, 51000, 10, '0.1', '', 0, 'diamond'),
(576, 213, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(577, 213, 58, 12, 23, 22, 51000, 66, '0.54', '', 0, 'diamond'),
(578, 214, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(579, 214, 58, 12, 23, 22, 51000, 95, '0.77', '', 0, 'diamond'),
(580, 214, 100, 0, 0, 0, 300, 1, '6.87', '', 0, 'pearls'),
(581, 215, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(582, 215, 58, 12, 23, 22, 51000, 55, '0.42', '', 0, 'diamond'),
(583, 216, 0, 3, 16, 0, 0, 0, '0', '1', 0, 'material'),
(584, 216, 58, 12, 23, 22, 130000, 1, '0.2', '', 0, 'diamond'),
(585, 217, 0, 3, 16, 0, 0, 0, '0', '9', 0, 'material'),
(586, 217, 58, 12, 23, 22, 51000, 1, '0.16', '', 0, 'diamond'),
(587, 217, 58, 12, 23, 22, 130000, 1, '0.19', '', 0, 'diamond'),
(588, 218, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(589, 218, 58, 12, 23, 22, 51000, 7, '0.65', '', 0, 'diamond'),
(590, 219, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(591, 219, 58, 12, 23, 22, 51000, 79, '0.48', '', 0, 'diamond'),
(592, 219, 58, 12, 23, 29, 65000, 11, '0.42', '', 0, 'diamond'),
(593, 220, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(594, 220, 58, 12, 23, 22, 51000, 14, '0.13', '', 0, 'diamond'),
(595, 220, 58, 12, 23, 29, 65000, 9, '0.27', '', 0, 'diamond'),
(596, 221, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(597, 221, 58, 12, 23, 22, 51000, 108, '0.57', '', 0, 'diamond'),
(598, 221, 58, 12, 23, 29, 75000, 8, '0.48', '', 0, 'diamond'),
(599, 222, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(600, 222, 58, 12, 23, 22, 51000, 62, '0.58', '', 0, 'diamond'),
(601, 222, 58, 12, 23, 29, 75000, 2, '0.12', '', 0, 'diamond'),
(602, 223, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(603, 223, 58, 12, 23, 22, 51000, 38, '0.46', '', 0, 'diamond'),
(604, 224, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(605, 224, 58, 12, 23, 22, 51000, 22, '0.47', '', 0, 'diamond'),
(606, 225, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(607, 225, 58, 12, 23, 22, 51000, 77, '1.05', '', 0, 'diamond'),
(608, 226, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(609, 226, 58, 12, 23, 22, 51000, 48, '0.44', '', 0, 'diamond'),
(610, 227, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(611, 227, 58, 12, 23, 22, 51000, 60, '0.65', '', 0, 'diamond'),
(612, 228, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(613, 228, 58, 12, 23, 22, 51000, 100, '0.88', '', 0, 'diamond'),
(614, 229, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(615, 229, 58, 12, 23, 22, 51000, 51, '0.36', '', 0, 'diamond'),
(616, 230, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(617, 230, 58, 12, 23, 22, 51000, 31, '0.65', '', 0, 'diamond'),
(618, 231, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(619, 231, 58, 12, 23, 22, 51000, 52, '0.27', '', 0, 'diamond'),
(620, 232, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(621, 232, 58, 12, 23, 22, 51000, 34, '0.44', '', 0, 'diamond'),
(622, 233, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(623, 233, 58, 12, 23, 22, 51000, 59, '0.37', '', 0, 'diamond'),
(624, 234, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(625, 234, 58, 12, 23, 22, 51000, 30, '0.25', '', 0, 'diamond'),
(626, 235, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(627, 235, 58, 12, 23, 22, 51000, 30, '0.24', '', 0, 'diamond'),
(628, 236, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(629, 236, 58, 12, 23, 22, 51000, 30, '0.26', '', 0, 'diamond'),
(630, 237, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(631, 237, 58, 12, 23, 22, 51000, 37, '0.37', '', 0, 'diamond'),
(632, 238, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(633, 238, 58, 12, 23, 22, 51000, 21, '0.11', '', 0, 'diamond'),
(634, 239, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(635, 239, 58, 12, 23, 22, 51000, 78, '0.8100000000000', '', 0, 'diamond'),
(636, 240, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(637, 240, 58, 12, 23, 22, 51000, 66, '0.54', '', 0, 'diamond'),
(638, 241, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(639, 241, 58, 12, 23, 22, 51000, 10, '0.16', '', 0, 'diamond'),
(640, 242, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(641, 242, 58, 12, 23, 22, 51000, 36, '0.59', '', 0, 'diamond'),
(642, 243, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(643, 243, 58, 12, 2, 22, 51000, 3, '0.02', '', 0, 'diamond'),
(644, 244, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(645, 244, 58, 12, 23, 22, 51000, 58, '0.88', '', 0, 'diamond'),
(646, 245, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(647, 245, 58, 12, 23, 22, 51000, 56, '0.77', '', 0, 'diamond'),
(648, 245, 96, 0, 0, 0, 1000, 2, '0.02', '', 0, 'gemstone'),
(649, 246, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(650, 246, 58, 12, 23, 22, 51000, 99, '1.32', '', 0, 'diamond'),
(651, 246, 96, 0, 0, 0, 1000, 2, '0.02', '', 0, 'gemstone'),
(652, 247, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(653, 247, 58, 12, 2, 22, 51000, 17, '0.21', '', 0, 'diamond'),
(654, 247, 96, 0, 0, 0, 1000, 2, '0.17', '', 0, 'gemstone'),
(655, 248, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(656, 248, 58, 12, 23, 22, 56000, 76, '1.97', '', 0, 'diamond'),
(657, 248, 90, 0, 0, 0, 3000, 1, '0.2', '', 0, 'gemstone'),
(658, 249, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(659, 249, 58, 12, 23, 22, 51000, 132, '2.66', '', 0, 'diamond'),
(660, 249, 96, 0, 0, 0, 1000, 3, '0.63', '', 0, 'gemstone'),
(661, 250, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(662, 250, 58, 12, 23, 22, 51000, 102, '0.48', '', 0, 'diamond'),
(663, 251, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(664, 251, 58, 12, 23, 22, 51000, 45, '0.37', '', 0, 'diamond'),
(665, 251, 58, 12, 23, 24, 42000, 7, '0.17', '', 0, 'diamond'),
(666, 252, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(667, 252, 58, 12, 23, 22, 51000, 81, '0.55', '', 0, 'diamond'),
(668, 252, 100, 0, 0, 0, 300, 1, '3.3', '', 0, 'pearls'),
(669, 253, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(670, 253, 58, 12, 23, 22, 51000, 97, '0.67', '', 0, 'diamond'),
(671, 254, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(672, 254, 58, 12, 23, 22, 51000, 33, '0.35', '', 0, 'diamond'),
(673, 255, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(674, 255, 58, 12, 23, 22, 51000, 23, '0.33', '', 0, 'diamond'),
(675, 256, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(676, 256, 58, 12, 23, 22, 51000, 18, '0.13', '', 0, 'diamond'),
(677, 257, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(678, 257, 58, 12, 23, 22, 51000, 24, '0.25', '', 0, 'diamond'),
(679, 258, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(680, 258, 58, 12, 23, 22, 51000, 8, '0.08', '', 0, 'diamond'),
(681, 259, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(682, 259, 58, 12, 23, 22, 51000, 30, '0.35', '', 0, 'diamond'),
(683, 260, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(684, 260, 58, 12, 23, 22, 51000, 38, '0.53', '', 0, 'diamond'),
(685, 261, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(686, 261, 58, 12, 23, 22, 51000, 73, '0.47', '', 0, 'diamond'),
(687, 261, 96, 0, 0, 0, 1000, 1, '0.08', '', 0, 'gemstone'),
(688, 262, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(689, 262, 58, 12, 23, 22, 51000, 7, '0.1', '', 0, 'diamond'),
(690, 263, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(691, 263, 58, 12, 23, 22, 51000, 10, '0.0700000000000', '', 0, 'diamond'),
(692, 264, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(693, 264, 58, 12, 23, 22, 51000, 49, '1.15', '', 0, 'diamond'),
(694, 265, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(695, 265, 58, 12, 23, 22, 51000, 143, '0.77', '', 0, 'diamond'),
(696, 265, 91, 0, 0, 0, 3000, 4, '14.81', '', 0, 'gemstone'),
(697, 265, 90, 0, 0, 0, 4000, 2, '8.8699999999999', '', 0, 'gemstone'),
(698, 265, 100, 0, 0, 0, 300, 1, '0.15', '', 0, 'pearls'),
(699, 266, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(700, 266, 58, 12, 23, 22, 51000, 45, '0.5', '', 0, 'diamond'),
(701, 267, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(702, 267, 58, 12, 23, 22, 51000, 192, '1.14', '', 0, 'diamond'),
(703, 268, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(704, 268, 58, 12, 23, 22, 51000, 177, '2.44', '', 0, 'diamond'),
(705, 269, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(706, 269, 58, 12, 23, 22, 51000, 72, '0.42', '', 0, 'diamond'),
(707, 270, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(708, 270, 58, 12, 23, 22, 51000, 60, '0.44', '', 0, 'diamond'),
(709, 271, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(710, 271, 58, 12, 23, 22, 51000, 167, '1.4', '', 0, 'diamond'),
(711, 272, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(712, 272, 58, 12, 23, 22, 51000, 53, '0.71', '', 0, 'diamond'),
(713, 273, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(714, 273, 58, 12, 23, 22, 51000, 64, '0.66', '', 0, 'diamond'),
(715, 274, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(716, 274, 58, 12, 23, 22, 51000, 94, '0.83', '', 0, 'diamond'),
(717, 275, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(718, 275, 58, 12, 23, 22, 51000, 128, '0.85', '', 0, 'diamond'),
(719, 276, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(720, 276, 58, 12, 23, 22, 51000, 21, '0.24', '', 0, 'diamond'),
(721, 277, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(722, 277, 58, 12, 23, 22, 51000, 36, '0.36', '', 0, 'diamond'),
(723, 278, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(724, 278, 58, 12, 23, 22, 51000, 52, '0.67', '', 0, 'diamond'),
(725, 279, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(726, 279, 58, 12, 23, 22, 51000, 114, '0.86', '', 0, 'diamond'),
(727, 280, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(728, 280, 58, 12, 23, 22, 51000, 66, '0.5', '', 0, 'diamond'),
(729, 281, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(730, 281, 58, 12, 23, 22, 51000, 71, '0.7', '', 0, 'diamond'),
(731, 282, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(732, 282, 58, 12, 23, 22, 51000, 57, '0.37', '', 0, 'diamond'),
(733, 282, 96, 0, 0, 0, 1000, 1, '6.31', '', 0, 'gemstone'),
(734, 283, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(735, 283, 58, 12, 23, 22, 51000, 76, '0.54', '', 0, 'diamond'),
(736, 284, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(737, 284, 58, 12, 23, 22, 51000, 16, '0.6000000000000', '', 0, 'diamond'),
(738, 284, 58, 12, 23, 22, 130000, 2, '0.39', '', 0, 'diamond'),
(739, 284, 58, 12, 23, 22, 68000, 16, '1.29', '', 0, 'diamond'),
(740, 285, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(741, 285, 58, 12, 23, 22, 51000, 80, '1.98', '', 0, 'diamond'),
(742, 285, 107, 0, 0, 0, 1000, 2, '0.12', '', 0, 'gemstone'),
(743, 286, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(744, 286, 58, 12, 23, 22, 51000, 18, '0.48', '', 0, 'diamond'),
(745, 287, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(746, 287, 58, 12, 23, 22, 51000, 26, '0.31', '', 0, 'diamond'),
(747, 288, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(748, 288, 58, 12, 23, 22, 51000, 52, '0.43', '', 0, 'diamond'),
(749, 289, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(750, 289, 58, 12, 23, 22, 51000, 80, '2.31', '', 0, 'diamond'),
(751, 289, 107, 0, 0, 0, 1000, 2, '0.76', '', 0, 'gemstone'),
(752, 290, 0, 3, 108, 0, 0, 0, '0', '0', 0, 'material'),
(753, 290, 58, 12, 23, 22, 51000, 94, '0.5800000000000', '', 0, 'diamond'),
(754, 291, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(755, 291, 58, 12, 23, 22, 56000, 14, '0.87', '', 0, 'diamond'),
(756, 291, 58, 12, 23, 22, 51000, 74, '3.22', '', 0, 'diamond'),
(757, 291, 107, 0, 0, 0, 3000, 2, '0.5800000000000', '', 0, 'gemstone'),
(758, 292, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(759, 292, 58, 12, 23, 22, 51000, 70, '2.27', '', 0, 'diamond'),
(760, 292, 107, 0, 0, 0, 1000, 2, '4.01', '', 0, 'gemstone'),
(761, 293, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(762, 293, 58, 12, 23, 22, 51000, 48, '1.42', '', 0, 'diamond'),
(763, 293, 58, 12, 23, 22, 68000, 16, '1.6', '', 0, 'diamond'),
(764, 294, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(765, 294, 58, 12, 23, 22, 51000, 60, '1.91', '', 0, 'diamond'),
(766, 294, 107, 0, 0, 0, 3000, 2, '0.18', '', 0, 'gemstone'),
(767, 295, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(768, 295, 58, 12, 23, 22, 68000, 4, '0.3', '', 0, 'diamond'),
(769, 295, 58, 12, 23, 22, 51000, 72, '2.46', '', 0, 'diamond'),
(770, 295, 107, 0, 0, 0, 1000, 4, '2.28', '', 0, 'gemstone'),
(771, 296, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(772, 296, 58, 12, 23, 22, 68000, 2, '0.16', '', 0, 'diamond'),
(773, 296, 58, 12, 23, 22, 51000, 100, '3.29', '', 0, 'diamond'),
(774, 297, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(775, 297, 2, 2, 2, 22, 42000, 1, '0.5600000000000', '', 0, 'diamond'),
(776, 298, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(777, 298, 58, 12, 23, 22, 51000, 72, '2.57', '', 0, 'diamond'),
(778, 298, 107, 0, 0, 0, 1000, 1, '8.4499999999999', '', 0, 'gemstone'),
(779, 299, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(780, 299, 58, 12, 2, 22, 75000, 1, '0.1', '', 0, 'diamond'),
(781, 300, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(782, 300, 58, 12, 23, 22, 51000, 210, '2.32', '', 0, 'diamond'),
(783, 300, 107, 0, 0, 0, 1000, 4, '3.68', '', 0, 'gemstone'),
(784, 301, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(785, 301, 58, 12, 23, 22, 51000, 140, '3.17', '', 0, 'diamond'),
(786, 301, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(787, 301, 58, 12, 23, 24, 42000, 58, '1.47', '', 0, 'diamond'),
(788, 301, 107, 0, 0, 0, 1000, 4, '6.12', '', 0, 'gemstone'),
(789, 302, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(790, 302, 58, 12, 23, 22, 51000, 224, '2.41', '', 0, 'diamond'),
(791, 302, 107, 0, 0, 0, 1000, 4, '4.27', '', 0, 'gemstone'),
(792, 303, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(793, 303, 58, 12, 2, 22, 150000, 1, '0.23', '', 0, 'diamond'),
(794, 304, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(795, 304, 58, 12, 2, 22, 150000, 2, '0.6000000000000', '', 0, 'diamond'),
(796, 305, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(797, 305, 58, 12, 23, 22, 51000, 332, '2.57', '', 0, 'diamond'),
(798, 305, 58, 12, 23, 22, 75000, 8, '0.79', '', 0, 'diamond'),
(799, 305, 107, 0, 0, 0, 1000, 4, '3.06', '', 0, 'gemstone'),
(800, 306, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(801, 306, 58, 12, 23, 22, 51000, 6, '0.17', '', 0, 'diamond'),
(802, 307, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(803, 307, 58, 12, 23, 22, 51000, 18, '0.13', '', 0, 'diamond'),
(804, 308, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(805, 308, 58, 12, 23, 22, 51000, 20, '0.14', '', 0, 'diamond'),
(806, 309, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(807, 309, 58, 12, 23, 22, 51000, 12, '0.34', '', 0, 'diamond'),
(808, 310, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(809, 310, 58, 12, 23, 22, 51000, 28, '0.17', '', 0, 'diamond'),
(810, 311, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(811, 311, 58, 12, 23, 22, 51000, 60, '0.26', '', 0, 'diamond'),
(812, 312, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(813, 312, 58, 12, 23, 22, 51000, 32, '0.3', '', 0, 'diamond'),
(814, 313, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(815, 313, 58, 12, 23, 22, 51000, 24, '0.24', '', 0, 'diamond'),
(816, 314, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(817, 314, 58, 12, 23, 22, 51000, 24, '0.22', '', 0, 'diamond'),
(818, 315, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(819, 315, 58, 12, 23, 22, 51000, 14, '0.0700000000000', '', 0, 'diamond'),
(820, 316, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(821, 316, 58, 12, 23, 22, 51000, 38, '0.31', '', 0, 'diamond'),
(822, 316, 58, 12, 23, 109, 51000, 12, '0.46', '', 0, 'diamond'),
(823, 317, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(824, 317, 58, 12, 23, 22, 51000, 28, '0.17', '', 0, 'diamond'),
(825, 318, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(826, 318, 58, 12, 23, 22, 51000, 42, '0.29', '', 0, 'diamond'),
(827, 319, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(828, 319, 58, 12, 23, 22, 51000, 232, '1.82', '', 0, 'diamond'),
(829, 319, 107, 0, 0, 0, 1000, 4, '1.88', '', 0, 'gemstone'),
(830, 320, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(831, 320, 58, 12, 23, 22, 51000, 110, '1.32', '', 0, 'diamond'),
(832, 320, 107, 0, 0, 0, 1000, 4, '2.01', '', 0, 'gemstone'),
(833, 321, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(834, 321, 58, 12, 23, 22, 51000, 26, '0.29', '', 0, 'diamond'),
(835, 322, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(836, 322, 58, 12, 23, 22, 51000, 90, '1.4', '', 0, 'diamond'),
(837, 323, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(838, 323, 58, 12, 23, 22, 51000, 58, '0.91', '', 0, 'diamond'),
(839, 324, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(840, 324, 58, 12, 23, 22, 51000, 16, '0.19', '', 0, 'diamond'),
(841, 325, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(842, 325, 58, 12, 23, 22, 51000, 22, '0.22', '', 0, 'diamond'),
(843, 326, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(844, 326, 58, 12, 23, 22, 51000, 22, '0.26', '', 0, 'diamond'),
(845, 327, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(846, 327, 58, 12, 23, 22, 51000, 22, '0.29', '', 0, 'diamond'),
(847, 328, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(848, 328, 58, 12, 23, 22, 51000, 12, '0.14', '', 0, 'diamond'),
(849, 329, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(850, 329, 58, 12, 23, 22, 51000, 14, '0.13', '', 0, 'diamond'),
(851, 330, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(852, 330, 58, 12, 23, 22, 51000, 52, '0.5600000000000', '', 0, 'diamond'),
(853, 331, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(854, 331, 58, 12, 23, 22, 51000, 54, '0.75', '', 0, 'diamond'),
(855, 332, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(856, 332, 58, 12, 23, 22, 75000, 2, '0.22', '', 0, 'diamond'),
(857, 333, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(858, 333, 58, 12, 23, 22, 51000, 112, '1.38', '', 0, 'diamond'),
(859, 333, 107, 0, 0, 0, 1000, 4, '4.83', '', 0, 'gemstone'),
(860, 334, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(861, 334, 58, 12, 23, 22, 51000, 168, '2.05', '', 0, 'diamond'),
(862, 334, 107, 0, 0, 0, 1000, 4, '5', '', 0, 'gemstone'),
(863, 335, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(864, 335, 58, 12, 23, 22, 51000, 198, '2.1', '', 0, 'diamond'),
(865, 335, 107, 0, 0, 0, 1000, 4, '4.6', '', 0, 'gemstone'),
(866, 336, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(867, 336, 58, 12, 23, 22, 51000, 180, '1.84', '', 0, 'diamond'),
(868, 336, 107, 0, 0, 0, 1000, 4, '4.07', '', 0, 'gemstone'),
(869, 337, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(870, 337, 58, 12, 23, 22, 51000, 148, '1.86', '', 0, 'diamond'),
(871, 337, 107, 0, 0, 0, 1000, 4, '3.01', '', 0, 'gemstone'),
(872, 338, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(873, 338, 58, 12, 23, 22, 51000, 148, '1.64', '', 0, 'diamond'),
(874, 338, 107, 0, 0, 0, 1000, 4, '4.96', '', 0, 'gemstone'),
(875, 339, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(876, 339, 58, 12, 23, 22, 51000, 112, '0.72', '', 0, 'diamond');
INSERT INTO `product_option` (`ProductOptionID`, `ProductID`, `OptionID`, `Combination_OptionID`, `Combination_OptionID_Secnd`, `Diamond_Shape_Id`, `OptionPriceincrement`, `Quantity`, `OptionWeight`, `OptionSize`, `OptionGroupID`, `attribute_type`) VALUES
(877, 340, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(878, 340, 58, 12, 23, 22, 51000, 67, '0.75', '', 0, 'diamond'),
(879, 341, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(880, 341, 58, 12, 23, 22, 51000, 89, '0.65', '', 0, 'diamond'),
(881, 342, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(882, 342, 58, 12, 23, 22, 51000, 92, '0.83', '', 0, 'diamond'),
(898, 348, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(899, 348, 58, 12, 23, 22, 68000, 1, '0.08', '', 0, 'diamond'),
(900, 348, 107, 0, 0, 0, 3000, 8, '0.99', '', 0, 'gemstone'),
(901, 349, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(902, 349, 58, 12, 23, 22, 51000, 27, '0.32', '', 0, 'diamond'),
(903, 349, 107, 0, 0, 0, 1000, 1, '0.32', '', 0, 'gemstone'),
(904, 350, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(905, 350, 58, 12, 23, 22, 51000, 68, '0.73', '', 0, 'diamond'),
(906, 350, 107, 0, 0, 0, 1000, 4, '0.14', '', 0, 'gemstone'),
(907, 351, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(908, 351, 58, 12, 23, 22, 51000, 53, '0.49', '', 0, 'diamond'),
(909, 351, 107, 0, 0, 0, 1000, 6, '0.15', '', 0, 'gemstone'),
(910, 352, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(911, 352, 58, 12, 23, 22, 51000, 32, '0.32', '', 0, 'diamond'),
(912, 352, 107, 0, 0, 0, 3000, 2, '0.33', '', 0, 'gemstone'),
(913, 353, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(914, 353, 58, 12, 23, 22, 51000, 20, '0.16', '', 0, 'diamond'),
(915, 353, 107, 0, 0, 0, 1000, 13, '0.71', '', 0, 'gemstone'),
(916, 354, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(917, 354, 58, 12, 23, 22, 51000, 75, '0.59', '', 0, 'diamond'),
(918, 354, 107, 0, 0, 0, 1000, 24, '0.25', '', 0, 'gemstone'),
(919, 355, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(920, 355, 58, 12, 23, 22, 51000, 91, '0.57', '', 0, 'diamond'),
(921, 355, 58, 12, 23, 109, 68000, 2, '0.15', '', 0, 'diamond'),
(922, 355, 58, 12, 23, 29, 85000, 12, '0.99', '', 0, 'diamond'),
(923, 356, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(924, 356, 58, 12, 23, 22, 51000, 10, '0.05', '', 0, 'diamond'),
(925, 356, 58, 12, 23, 29, 65000, 4, '0.13', '', 0, 'diamond'),
(926, 356, 58, 12, 23, 109, 75000, 3, '0.13', '', 0, 'diamond'),
(927, 357, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(928, 357, 58, 12, 23, 22, 51000, 41, '0.36', '', 0, 'diamond'),
(929, 358, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(930, 358, 58, 12, 23, 22, 51000, 13, '0.36', '', 0, 'diamond'),
(931, 359, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(932, 359, 58, 12, 23, 22, 51000, 930, '1.16', '', 0, 'diamond'),
(933, 359, 58, 12, 23, 24, 42000, 33, '1.41', '', 0, 'diamond'),
(934, 359, 96, 0, 0, 0, 1000, 24, '7.48', '', 0, 'gemstone'),
(935, 360, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(936, 360, 58, 12, 23, 22, 51000, 368, '2.85', '', 0, 'diamond'),
(937, 360, 96, 0, 0, 0, 1000, 1, '0.54', '', 0, 'gemstone'),
(938, 360, 100, 0, 0, 0, 300, 15, '21.29', '', 0, 'pearls'),
(939, 361, 0, 3, 31, 0, 0, 0, '0', '0', 0, 'material'),
(940, 361, 58, 12, 23, 22, 51000, 152, '2.21', '', 0, 'diamond'),
(941, 361, 90, 0, 0, 0, 1000, 28, '1.49', '', 0, 'gemstone'),
(942, 361, 90, 0, 0, 0, 3000, 1, '2.7', '', 0, 'gemstone'),
(943, 362, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(944, 362, 58, 12, 23, 22, 51000, 42, '0.41', '', 0, 'diamond'),
(945, 363, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(946, 363, 58, 12, 23, 22, 51000, 70, '0.86', '', 0, 'diamond'),
(947, 364, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(948, 364, 58, 12, 23, 22, 51000, 54, '0.49', '', 0, 'diamond'),
(949, 365, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(950, 365, 58, 12, 23, 22, 51000, 51, '1.18', '', 0, 'diamond'),
(951, 366, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(952, 366, 58, 12, 23, 22, 51000, 24, '0.49', '', 0, 'diamond'),
(953, 367, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(954, 367, 58, 12, 23, 22, 51000, 102, '1.25', '', 0, 'diamond'),
(955, 367, 107, 0, 0, 0, 1000, 3, '2.68', '', 0, 'gemstone'),
(956, 367, 100, 0, 0, 0, 300, 1, '3.15', '', 0, 'pearls'),
(957, 368, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(958, 368, 58, 12, 23, 22, 51000, 121, '1.43', '', 0, 'diamond'),
(959, 368, 107, 0, 0, 0, 1000, 2, '1.97', '', 0, 'gemstone'),
(960, 368, 100, 0, 0, 0, 300, 1, '3.54', '', 0, 'pearls'),
(961, 369, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(962, 369, 58, 12, 23, 22, 51000, 187, '2.48', '', 0, 'diamond'),
(963, 369, 107, 0, 0, 0, 1000, 2, '5.65', '', 0, 'gemstone'),
(964, 369, 100, 0, 0, 0, 300, 1, '5.53', '', 0, 'pearls'),
(965, 370, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(966, 370, 58, 12, 23, 22, 51000, 161, '2.26', '', 0, 'diamond'),
(967, 370, 107, 0, 0, 0, 1000, 2, '1.18', '', 0, 'gemstone'),
(968, 370, 100, 0, 0, 0, 300, 1, '5.32', '', 0, 'pearls'),
(969, 371, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(970, 371, 58, 12, 23, 22, 51000, 214, '2.32', '', 0, 'diamond'),
(971, 371, 58, 12, 23, 24, 42000, 26, '0.37', '', 0, 'diamond'),
(972, 371, 107, 0, 0, 0, 1000, 3, '1.33', '', 0, 'gemstone'),
(973, 371, 100, 0, 0, 0, 300, 1, '5.28', '', 0, 'pearls'),
(974, 372, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(975, 372, 58, 12, 23, 22, 51000, 329, '3.32', '', 0, 'diamond'),
(976, 372, 107, 0, 0, 0, 1000, 4, '5.98', '', 0, 'gemstone'),
(977, 372, 100, 0, 0, 0, 300, 3, '12.76', '', 0, 'pearls'),
(978, 373, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(979, 373, 58, 12, 23, 22, 51000, 125, '1.41', '', 0, 'diamond'),
(980, 373, 107, 0, 0, 0, 1000, 2, '1.4', '', 0, 'gemstone'),
(981, 373, 100, 0, 0, 0, 300, 3, '5.69', '', 0, 'pearls'),
(982, 374, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(983, 374, 58, 12, 23, 22, 51000, 94, '0.98', '', 0, 'diamond'),
(984, 374, 107, 0, 0, 0, 1000, 2, '1.5', '', 0, 'gemstone'),
(985, 374, 100, 0, 0, 0, 300, 82, '7.23', '', 0, 'pearls'),
(986, 375, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(987, 375, 58, 12, 23, 22, 51000, 304, '3.5', '', 0, 'diamond'),
(988, 375, 96, 0, 0, 0, 3000, 1, '15.12', '', 0, 'gemstone'),
(989, 375, 90, 0, 0, 0, 4000, 1, '0.15', '', 0, 'gemstone'),
(990, 376, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(991, 376, 58, 12, 23, 22, 51000, 18, '0.23', '', 0, 'diamond'),
(992, 377, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(993, 377, 58, 12, 23, 22, 51000, 132, '1.27', '', 0, 'diamond'),
(994, 378, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(995, 378, 58, 12, 23, 22, 51000, 27, '0.27', '', 0, 'diamond'),
(996, 379, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(997, 379, 58, 12, 23, 22, 51000, 67, '0.68', '', 0, 'diamond'),
(998, 379, 96, 0, 0, 0, 3000, 1, '0.46', '', 0, 'gemstone'),
(999, 380, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1000, 380, 58, 12, 23, 22, 51000, 15, '0.18', '', 0, 'diamond'),
(1001, 380, 100, 0, 0, 0, 300, 1, '0.77', '', 0, 'pearls'),
(1002, 381, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1003, 381, 58, 12, 23, 22, 51000, 26, '0.22', '', 0, 'diamond'),
(1004, 382, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1005, 382, 58, 12, 23, 22, 56000, 129, '2.24', '', 0, 'diamond'),
(1006, 382, 107, 0, 0, 0, 3000, 5, '0.97', '', 0, 'gemstone'),
(1007, 383, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1008, 383, 58, 12, 23, 22, 51000, 84, '0.49', '', 0, 'diamond'),
(1009, 384, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1010, 384, 58, 12, 23, 22, 51000, 151, '1.15', '', 0, 'diamond'),
(1011, 384, 107, 0, 0, 0, 1000, 2, '1.86', '', 0, 'gemstone'),
(1012, 384, 100, 0, 0, 0, 300, 1, '2.29', '', 0, 'pearls'),
(1013, 385, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1014, 385, 58, 12, 23, 22, 51000, 39, '0.46', '', 0, 'diamond'),
(1015, 386, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1016, 386, 58, 12, 23, 22, 51000, 83, '0.89', '', 0, 'diamond'),
(1017, 387, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1018, 387, 58, 12, 23, 22, 51000, 79, '0.76', '', 0, 'diamond'),
(1019, 388, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1020, 388, 2, 2, 2, 22, 42000, 1, '1.59', '', 0, 'diamond'),
(1021, 389, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1022, 389, 2, 2, 2, 22, 42000, 1, '0.53', '', 0, 'diamond'),
(1023, 390, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1024, 390, 2, 2, 2, 22, 42000, 1, '0.95', '', 0, 'diamond'),
(1031, 393, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1032, 393, 58, 12, 23, 22, 51000, 86, '1.09', '', 0, 'diamond'),
(1039, 396, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1040, 396, 58, 12, 23, 22, 51000, 38, '0.46', '', 0, 'diamond'),
(1041, 396, 58, 12, 23, 29, 75000, 2, '0.12', '', 0, 'diamond'),
(1042, 397, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1043, 397, 58, 12, 23, 22, 51000, 306, '1.48', '', 0, 'diamond'),
(1044, 397, 100, 0, 0, 0, 300, 2, '5.38', '', 0, 'pearls'),
(1045, 398, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1046, 398, 58, 12, 23, 22, 51000, 224, '1.19', '', 0, 'diamond'),
(1047, 398, 90, 0, 0, 0, 25000, 2, '3.93', '', 0, 'gemstone'),
(1048, 399, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1049, 399, 58, 12, 23, 22, 51000, 332, '3.3', '', 0, 'diamond'),
(1050, 400, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1051, 400, 58, 12, 23, 22, 51000, 88, '0.91', '', 0, 'diamond'),
(1052, 400, 58, 12, 23, 24, 42000, 6, '0.14', '', 0, 'diamond'),
(1053, 400, 96, 0, 0, 0, 1500, 58, '17.68', '', 0, 'gemstone'),
(1054, 401, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1055, 401, 58, 12, 23, 22, 51000, 46, '0.43', '', 0, 'diamond'),
(1056, 402, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1057, 402, 58, 12, 23, 22, 51000, 218, '4.23', '', 0, 'diamond'),
(1058, 402, 96, 0, 0, 0, 3000, 59, '2.66', '', 0, 'gemstone'),
(1059, 403, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1060, 403, 58, 12, 23, 22, 51000, 52, '0.52', '', 0, 'diamond'),
(1061, 404, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1062, 404, 58, 12, 23, 22, 51000, 202, '2.49', '', 0, 'diamond'),
(1063, 404, 96, 0, 0, 0, 3000, 42, '3.19', '', 0, 'gemstone'),
(1064, 405, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1065, 405, 58, 12, 23, 22, 51000, 164, '1.8', '', 0, 'diamond'),
(1066, 406, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1067, 406, 58, 12, 23, 22, 51000, 122, '1.86', '', 0, 'diamond'),
(1068, 406, 107, 0, 0, 0, 1000, 8, '4.13', '', 0, 'gemstone'),
(1069, 406, 100, 0, 0, 0, 300, 2, '8.1400000000000', '', 0, 'pearls'),
(1070, 407, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1071, 407, 58, 12, 23, 22, 51000, 270, '2.15', '', 0, 'diamond'),
(1072, 408, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1073, 408, 58, 12, 23, 22, 51000, 52, '0.29', '', 0, 'diamond'),
(1074, 409, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1075, 409, 58, 12, 23, 22, 51000, 66, '0.66', '', 0, 'diamond'),
(1076, 410, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1077, 410, 58, 12, 23, 22, 51000, 36, '0.28', '', 0, 'diamond'),
(1078, 411, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1079, 411, 58, 12, 23, 22, 51000, 82, '0.76', '', 0, 'diamond'),
(1080, 412, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1081, 412, 58, 12, 23, 22, 51000, 50, '0.52', '', 0, 'diamond'),
(1082, 413, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1083, 413, 58, 12, 23, 22, 51000, 128, '0.64', '', 0, 'diamond'),
(1084, 414, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1085, 414, 58, 12, 23, 22, 51000, 34, '0.2800000000000', '', 0, 'diamond'),
(1086, 415, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1087, 415, 58, 12, 23, 22, 51000, 40, '0.62', '', 0, 'diamond'),
(1088, 416, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1089, 416, 58, 12, 23, 22, 51000, 46, '0.52', '', 0, 'diamond'),
(1090, 417, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1091, 417, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1092, 418, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1093, 418, 58, 12, 23, 22, 51000, 74, '0.78', '', 0, 'diamond'),
(1094, 419, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1095, 419, 58, 12, 23, 22, 51000, 46, '0.45', '', 0, 'diamond'),
(1096, 420, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1097, 420, 58, 12, 23, 22, 51000, 50, '0.52', '', 0, 'diamond'),
(1098, 421, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1099, 421, 58, 12, 23, 22, 51000, 54, '0.55', '', 0, 'diamond'),
(1100, 422, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1101, 422, 58, 12, 23, 22, 90000, 2, '0.33', '', 0, 'diamond'),
(1102, 423, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1103, 423, 58, 12, 23, 22, 51000, 32, '0.41', '', 0, 'diamond'),
(1104, 424, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1105, 424, 58, 12, 23, 22, 51000, 278, '2.63', '', 0, 'diamond'),
(1106, 424, 107, 0, 0, 0, 1000, 6, '5.33', '', 0, 'gemstone'),
(1107, 425, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1108, 425, 58, 12, 23, 22, 51000, 54, '0.59', '', 0, 'diamond'),
(1109, 426, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1110, 426, 58, 12, 23, 22, 51000, 38, '0.37', '', 0, 'diamond'),
(1111, 427, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1112, 427, 58, 12, 23, 22, 51000, 30, '0.32', '', 0, 'diamond'),
(1113, 428, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1114, 428, 58, 12, 23, 22, 51000, 32, '0.33', '', 0, 'diamond'),
(1115, 428, 58, 12, 23, 29, 68000, 2, '0.18', '', 0, 'diamond'),
(1116, 429, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1117, 429, 58, 12, 23, 22, 51000, 102, '0.64', '', 0, 'diamond'),
(1118, 429, 107, 0, 0, 0, 1000, 50, '0.43', '', 0, 'gemstone'),
(1119, 430, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1120, 430, 58, 12, 23, 22, 51000, 102, '0.72', '', 0, 'diamond'),
(1121, 430, 107, 0, 0, 0, 1000, 1, '1.14', '', 0, 'gemstone'),
(1122, 431, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1123, 431, 58, 12, 23, 22, 51000, 36, '0.25', '', 0, 'diamond'),
(1124, 432, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1125, 432, 58, 12, 23, 22, 90000, 2, '0.32', '', 0, 'diamond'),
(1126, 433, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1127, 433, 58, 12, 23, 22, 51000, 38, '0.29', '', 0, 'diamond'),
(1128, 434, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1129, 434, 58, 12, 23, 22, 51000, 188, '3.26', '', 0, 'diamond'),
(1130, 434, 107, 0, 0, 0, 1000, 6, '8.5299999999999', '', 0, 'gemstone'),
(1131, 435, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1132, 435, 58, 12, 23, 22, 51000, 34, '0.51', '', 0, 'diamond'),
(1133, 436, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1134, 436, 58, 12, 23, 22, 51000, 42, '0.68', '', 0, 'diamond'),
(1135, 437, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1136, 437, 58, 12, 23, 22, 51000, 50, '0.5600000000000', '', 0, 'diamond'),
(1137, 438, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1138, 438, 58, 12, 23, 22, 51000, 148, '1.25', '', 0, 'diamond'),
(1139, 439, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1140, 439, 58, 12, 23, 22, 51000, 54, '0.78', '', 0, 'diamond'),
(1141, 440, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1142, 440, 58, 12, 23, 22, 51000, 58, '0.48', '', 0, 'diamond'),
(1143, 441, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1144, 441, 58, 12, 23, 22, 51000, 62, '0.54', '', 0, 'diamond'),
(1145, 442, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1146, 442, 58, 12, 23, 22, 51000, 55, '0.63', '', 0, 'diamond'),
(1147, 443, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1148, 443, 58, 12, 23, 22, 51000, 42, '0.37', '', 0, 'diamond'),
(1149, 444, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1150, 444, 58, 12, 23, 22, 51000, 38, '0.44', '', 0, 'diamond'),
(1151, 445, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1152, 445, 58, 12, 23, 22, 51000, 48, '0.55', '', 0, 'diamond'),
(1153, 446, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1154, 446, 58, 12, 23, 22, 51000, 46, '0.44', '', 0, 'diamond'),
(1155, 447, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1156, 447, 58, 12, 23, 22, 51000, 32, '0.5700000000000', '', 0, 'diamond'),
(1157, 448, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1158, 448, 58, 12, 23, 22, 51000, 22, '0.44', '', 0, 'diamond'),
(1159, 449, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1160, 449, 58, 12, 23, 22, 51000, 60, '1.68', '', 0, 'diamond'),
(1161, 450, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1162, 450, 58, 12, 23, 22, 51000, 50, '0.51', '', 0, 'diamond'),
(1163, 451, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1164, 451, 58, 12, 23, 22, 51000, 46, '0.54', '', 0, 'diamond'),
(1165, 452, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1166, 452, 58, 12, 23, 22, 51000, 48, '0.39', '', 0, 'diamond'),
(1167, 453, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1168, 453, 58, 12, 23, 22, 51000, 54, '0.7', '', 0, 'diamond'),
(1169, 454, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1170, 454, 58, 12, 23, 22, 51000, 60, '0.61', '', 0, 'diamond'),
(1171, 455, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1172, 455, 58, 12, 23, 22, 51000, 60, '0.86', '', 0, 'diamond'),
(1173, 456, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1174, 456, 58, 12, 23, 22, 51000, 26, '0.61', '', 0, 'diamond'),
(1175, 457, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1176, 457, 58, 12, 23, 22, 51000, 62, '0.66', '', 0, 'diamond'),
(1177, 458, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1178, 458, 58, 12, 23, 22, 51000, 72, '0.86', '', 0, 'diamond'),
(1179, 459, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1180, 459, 58, 12, 23, 22, 51000, 34, '0.37', '', 0, 'diamond'),
(1181, 460, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1182, 460, 58, 12, 23, 22, 51000, 38, '0.6000000000000', '', 0, 'diamond'),
(1183, 461, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1184, 461, 58, 12, 23, 22, 51000, 36, '0.2800000000000', '', 0, 'diamond'),
(1185, 462, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1186, 462, 58, 12, 23, 22, 51000, 38, '1.39', '', 0, 'diamond'),
(1187, 463, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1188, 463, 58, 12, 23, 22, 51000, 52, '0.64', '', 0, 'diamond'),
(1189, 464, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1190, 464, 58, 12, 23, 22, 51000, 10, '0.38', '', 0, 'diamond'),
(1191, 465, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1192, 465, 58, 12, 23, 22, 51000, 26, '0.73', '', 0, 'diamond'),
(1193, 466, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1194, 466, 58, 12, 23, 22, 51000, 18, '0.72', '', 0, 'diamond'),
(1195, 467, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1196, 467, 58, 12, 23, 22, 51000, 50, '0.51', '', 0, 'diamond'),
(1197, 468, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1198, 468, 58, 12, 23, 22, 51000, 14, '0.5800000000000', '', 0, 'diamond'),
(1199, 469, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1200, 469, 58, 12, 23, 22, 75000, 2, '0.2', '', 0, 'diamond'),
(1201, 470, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1202, 470, 58, 12, 23, 22, 51000, 60, '0.76', '', 0, 'diamond'),
(1203, 471, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1204, 471, 58, 12, 23, 22, 51000, 44, '0.4', '', 0, 'diamond'),
(1205, 472, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1206, 472, 58, 12, 23, 22, 51000, 30, '0.61', '', 0, 'diamond'),
(1207, 472, 107, 0, 0, 0, 1000, 4, '3.21', '', 0, 'gemstone'),
(1208, 472, 100, 0, 0, 0, 300, 2, '2.89', '', 0, 'pearls'),
(1209, 473, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1210, 473, 58, 12, 23, 22, 51000, 340, '3.85', '', 0, 'diamond'),
(1211, 473, 107, 0, 0, 0, 1000, 4, '3.32', '', 0, 'gemstone'),
(1212, 473, 100, 0, 0, 0, 300, 2, '8.8599999999999', '', 0, 'pearls'),
(1213, 474, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1214, 474, 58, 12, 23, 22, 51000, 90, '0.9', '', 0, 'diamond'),
(1215, 474, 107, 0, 0, 0, 1000, 4, '3.25', '', 0, 'gemstone'),
(1216, 474, 100, 0, 0, 0, 300, 2, '6.25', '', 0, 'pearls'),
(1217, 475, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1218, 475, 58, 12, 23, 22, 51000, 150, '1.53', '', 0, 'diamond'),
(1219, 475, 107, 0, 0, 0, 1000, 4, '0.84', '', 0, 'gemstone'),
(1220, 475, 100, 0, 0, 0, 300, 12, '19', '', 0, 'pearls'),
(1221, 476, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1222, 476, 58, 12, 23, 22, 51000, 464, '4.33', '', 0, 'diamond'),
(1223, 476, 107, 0, 0, 0, 1000, 4, '8.76', '', 0, 'gemstone'),
(1224, 477, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1225, 477, 58, 12, 23, 22, 75000, 2, '0.21', '', 0, 'diamond'),
(1226, 478, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1227, 478, 58, 12, 23, 22, 51000, 326, '3.03', '', 0, 'diamond'),
(1228, 478, 107, 0, 0, 0, 1000, 4, '2.63', '', 0, 'gemstone'),
(1229, 478, 100, 0, 0, 0, 300, 2, '7.51', '', 0, 'pearls'),
(1230, 479, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1231, 479, 58, 12, 23, 22, 51000, 444, '3.78', '', 0, 'diamond'),
(1232, 479, 107, 0, 0, 0, 1000, 4, '6.1', '', 0, 'gemstone'),
(1233, 480, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1234, 480, 58, 12, 23, 22, 51000, 472, '4.34', '', 0, 'diamond'),
(1235, 480, 107, 0, 0, 0, 1000, 4, '4.94', '', 0, 'gemstone'),
(1236, 480, 100, 0, 0, 0, 300, 2, '7.66', '', 0, 'pearls'),
(1237, 481, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1238, 481, 58, 12, 23, 22, 51000, 309, '3.16', '', 0, 'diamond'),
(1239, 481, 58, 12, 23, 24, 42000, 69, '1.43', '', 0, 'diamond'),
(1240, 481, 107, 0, 0, 0, 1000, 8, '17.09', '', 0, 'gemstone'),
(1241, 482, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1242, 482, 58, 12, 23, 22, 51000, 220, '3.16', '', 0, 'diamond'),
(1243, 482, 107, 0, 0, 0, 1000, 2, '4.18', '', 0, 'gemstone'),
(1244, 483, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1245, 483, 58, 12, 23, 22, 51000, 150, '1.75', '', 0, 'diamond'),
(1246, 483, 107, 0, 0, 0, 1000, 4, '2.78', '', 0, 'gemstone'),
(1247, 483, 100, 0, 0, 0, 300, 2, '4.92', '', 0, 'pearls'),
(1248, 484, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1249, 484, 58, 12, 23, 22, 51000, 188, '1.62', '', 0, 'diamond'),
(1250, 484, 107, 0, 0, 0, 1000, 8, '2.9', '', 0, 'gemstone'),
(1251, 484, 100, 0, 0, 0, 300, 2, '7.62', '', 0, 'pearls'),
(1252, 485, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1253, 485, 58, 12, 23, 22, 51000, 130, '0.93', '', 0, 'diamond'),
(1254, 485, 100, 0, 0, 0, 300, 2, '7.56', '', 0, 'pearls'),
(1255, 486, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1256, 486, 58, 12, 23, 22, 51000, 376, '2.33', '', 0, 'diamond'),
(1257, 486, 107, 0, 0, 0, 1000, 4, '8.99', '', 0, 'gemstone'),
(1258, 487, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1259, 487, 58, 12, 23, 22, 51000, 330, '2.78', '', 0, 'diamond'),
(1260, 487, 107, 0, 0, 0, 1000, 4, '4.96', '', 0, 'gemstone'),
(1261, 487, 100, 0, 0, 0, 300, 2, '9.2799999999999', '', 0, 'pearls'),
(1262, 488, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1263, 488, 58, 12, 23, 22, 51000, 144, '1.11', '', 0, 'diamond'),
(1264, 488, 58, 12, 23, 24, 42000, 6, '0.16', '', 0, 'diamond'),
(1265, 488, 107, 0, 0, 0, 1000, 4, '3.39', '', 0, 'gemstone'),
(1266, 488, 100, 0, 0, 0, 300, 2, '12.03', '', 0, 'pearls'),
(1267, 489, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1268, 489, 58, 12, 23, 22, 51000, 310, '2.64', '', 0, 'diamond'),
(1269, 489, 107, 0, 0, 0, 1000, 2, '6.77', '', 0, 'gemstone'),
(1270, 489, 100, 0, 0, 0, 300, 2, '9.41', '', 0, 'pearls'),
(1271, 490, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1272, 490, 58, 12, 23, 22, 51000, 148, '2.16', '', 0, 'diamond'),
(1273, 490, 58, 12, 23, 24, 42000, 61, '0.43', '', 0, 'diamond'),
(1274, 490, 107, 0, 0, 0, 1000, 1, '1.3', '', 0, 'gemstone'),
(1275, 490, 100, 0, 0, 0, 300, 1, '7.62', '', 0, 'pearls'),
(1276, 491, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1277, 491, 58, 12, 23, 22, 51000, 261, '2.37', '', 0, 'diamond'),
(1278, 492, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1279, 492, 58, 12, 23, 22, 51000, 356, '2.74', '', 0, 'diamond'),
(1280, 492, 107, 0, 0, 0, 1000, 6, '3.75', '', 0, 'gemstone'),
(1281, 493, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1282, 493, 58, 12, 23, 22, 51000, 410, '5.32', '', 0, 'diamond'),
(1283, 493, 107, 0, 0, 0, 1000, 4, '17.06', '', 0, 'gemstone'),
(1284, 493, 100, 0, 0, 0, 300, 6, '19.63', '', 0, 'pearls'),
(1285, 494, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1286, 494, 58, 12, 23, 22, 51000, 154, '1.48', '', 0, 'diamond'),
(1287, 494, 107, 0, 0, 0, 1000, 4, '1.79', '', 0, 'gemstone'),
(1288, 494, 100, 0, 0, 0, 300, 2, '9.56', '', 0, 'pearls'),
(1289, 495, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1290, 495, 58, 12, 23, 22, 51000, 158, '2.48', '', 0, 'diamond'),
(1291, 495, 107, 0, 0, 0, 1000, 1, '3.99', '', 0, 'gemstone'),
(1292, 495, 100, 0, 0, 0, 300, 2, '5.64', '', 0, 'pearls'),
(1296, 497, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1297, 497, 58, 12, 23, 22, 51000, 310, '3.25', '', 0, 'diamond'),
(1298, 497, 107, 0, 0, 0, 1000, 4, '2.23', '', 0, 'gemstone'),
(1299, 498, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1300, 498, 58, 12, 23, 22, 51000, 204, '2.61', '', 0, 'diamond'),
(1301, 498, 107, 0, 0, 0, 1000, 4, '1.92', '', 0, 'gemstone'),
(1302, 498, 100, 0, 0, 0, 300, 2, '9.66', '', 0, 'pearls'),
(1303, 499, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1304, 499, 58, 12, 23, 22, 51000, 92, '1.08', '', 0, 'diamond'),
(1305, 499, 107, 0, 0, 0, 1000, 4, '2.11', '', 0, 'gemstone'),
(1306, 499, 100, 0, 0, 0, 300, 2, '8.1400000000000', '', 0, 'pearls'),
(1307, 500, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1308, 500, 58, 12, 23, 22, 51000, 54, '0.16', '', 0, 'diamond'),
(1309, 500, 107, 0, 0, 0, 1000, 1, '0.43', '', 0, 'gemstone'),
(1310, 500, 100, 0, 0, 0, 300, 1, '6.1', '', 0, 'pearls'),
(1311, 501, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1312, 501, 58, 12, 23, 22, 51000, 114, '1.59', '', 0, 'diamond'),
(1313, 501, 107, 0, 0, 0, 1000, 6, '4.04', '', 0, 'gemstone'),
(1314, 501, 100, 0, 0, 0, 300, 2, '6.13', '', 0, 'pearls'),
(1315, 502, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1316, 502, 58, 12, 23, 22, 51000, 246, '3.09', '', 0, 'diamond'),
(1317, 502, 107, 0, 0, 0, 1000, 2, '7.92', '', 0, 'gemstone'),
(1318, 502, 100, 0, 0, 0, 300, 2, '9.94', '', 0, 'pearls'),
(1324, 504, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1325, 504, 58, 12, 23, 22, 51000, 270, '2.55', '', 0, 'diamond'),
(1326, 504, 58, 12, 23, 24, 42000, 53, '1.03', '', 0, 'diamond'),
(1327, 504, 107, 0, 0, 0, 1000, 4, '3.15', '', 0, 'gemstone'),
(1328, 504, 100, 0, 0, 0, 300, 2, '9.58', '', 0, 'pearls'),
(1329, 505, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1330, 505, 58, 12, 23, 22, 51000, 208, '3.11', '', 0, 'diamond'),
(1331, 505, 107, 0, 0, 0, 1000, 4, '5.65', '', 0, 'gemstone'),
(1332, 505, 100, 0, 0, 0, 300, 2, '11.75', '', 0, 'pearls'),
(1333, 506, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1334, 506, 58, 12, 23, 22, 51000, 162, '1.97', '', 0, 'diamond'),
(1335, 506, 100, 0, 0, 0, 300, 1, '11.54', '', 0, 'pearls'),
(1336, 507, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1337, 507, 58, 12, 23, 22, 51000, 316, '3.21', '', 0, 'diamond'),
(1338, 507, 107, 0, 0, 0, 1000, 4, '2.04', '', 0, 'gemstone'),
(1342, 509, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1343, 509, 58, 12, 23, 22, 51000, 466, '3.95', '', 0, 'diamond'),
(1344, 509, 107, 0, 0, 0, 1000, 8, '15.46', '', 0, 'gemstone'),
(1345, 509, 100, 0, 0, 0, 300, 6, '21.11', '', 0, 'pearls'),
(1346, 510, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1347, 510, 58, 12, 23, 22, 51000, 468, '2.95', '', 0, 'diamond'),
(1348, 510, 107, 0, 0, 0, 1000, 2, '0.8', '', 0, 'gemstone'),
(1349, 510, 100, 0, 0, 0, 300, 2, '8.16', '', 0, 'pearls'),
(1350, 511, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1351, 511, 58, 12, 23, 22, 51000, 127, '1.93', '', 0, 'diamond'),
(1352, 511, 107, 0, 0, 0, 1000, 4, '1.8', '', 0, 'gemstone'),
(1353, 511, 100, 0, 0, 0, 300, 2, '4.47', '', 0, 'pearls'),
(1354, 512, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1355, 512, 58, 12, 23, 22, 51000, 314, '3.83', '', 0, 'diamond'),
(1356, 512, 107, 0, 0, 0, 1000, 4, '5.97', '', 0, 'gemstone'),
(1357, 512, 100, 0, 0, 0, 300, 4, '22.11', '', 0, 'pearls'),
(1358, 513, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1359, 513, 58, 12, 23, 22, 51000, 44, '0.41', '', 0, 'diamond'),
(1360, 514, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1361, 514, 58, 12, 23, 22, 51000, 52, '0.57', '', 0, 'diamond'),
(1362, 515, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1363, 515, 58, 12, 23, 22, 51000, 70, '0.61', '', 0, 'diamond'),
(1364, 515, 107, 0, 0, 0, 1000, 4, '0.41', '', 0, 'gemstone'),
(1365, 515, 100, 0, 0, 0, 300, 2, '5.17', '', 0, 'pearls'),
(1366, 516, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1367, 516, 58, 12, 23, 22, 51000, 46, '0.62', '', 0, 'diamond'),
(1368, 516, 107, 0, 0, 0, 1000, 4, '2.45', '', 0, 'gemstone'),
(1369, 516, 100, 0, 0, 0, 300, 2, '2.76', '', 0, 'pearls'),
(1370, 517, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1371, 517, 58, 12, 23, 22, 51000, 66, '0.73', '', 0, 'diamond'),
(1372, 517, 107, 0, 0, 0, 1000, 4, '0.52', '', 0, 'gemstone'),
(1373, 517, 100, 0, 0, 0, 300, 2, '3.53', '', 0, 'pearls'),
(1374, 518, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1375, 518, 58, 12, 23, 22, 51000, 144, '2.7', '', 0, 'diamond'),
(1376, 518, 100, 0, 0, 0, 300, 2, '5.69', '', 0, 'pearls'),
(1377, 519, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1378, 519, 58, 12, 23, 22, 51000, 98, '1.39', '', 0, 'diamond'),
(1379, 519, 100, 0, 0, 0, 300, 6, '10.62', '', 0, 'pearls'),
(1380, 520, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1381, 520, 58, 12, 23, 22, 51000, 24, '0.76', '', 0, 'diamond'),
(1382, 521, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1383, 521, 58, 12, 23, 22, 51000, 130, '2.05', '', 0, 'diamond'),
(1384, 521, 107, 0, 0, 0, 1000, 16, '3.04', '', 0, 'gemstone'),
(1385, 522, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1386, 522, 58, 12, 23, 22, 51000, 266, '3.35', '', 0, 'diamond'),
(1387, 522, 107, 0, 0, 0, 1000, 8, '3.07', '', 0, 'gemstone'),
(1388, 522, 100, 0, 0, 0, 300, 10, '19.54', '', 0, 'pearls'),
(1389, 523, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1390, 523, 58, 12, 23, 22, 51000, 524, '3.24', '', 0, 'diamond'),
(1391, 523, 100, 0, 0, 0, 300, 2, '17.58', '', 0, 'pearls'),
(1392, 524, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1393, 524, 58, 12, 23, 22, 51000, 228, '2.44', '', 0, 'diamond'),
(1394, 524, 107, 0, 0, 0, 1000, 4, '1.69', '', 0, 'gemstone'),
(1395, 525, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1396, 525, 58, 12, 23, 22, 51000, 1, '2.12', '', 0, 'diamond'),
(1397, 525, 107, 0, 0, 0, 1000, 1, '5.25', '', 0, 'gemstone'),
(1398, 525, 100, 0, 0, 0, 300, 1, '18.45', '', 0, 'pearls'),
(1399, 526, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1400, 526, 58, 12, 23, 22, 51000, 496, '4.83', '', 0, 'diamond'),
(1401, 526, 107, 0, 0, 0, 1000, 4, '2.36', '', 0, 'gemstone'),
(1402, 526, 100, 0, 0, 0, 300, 2, '7.73', '', 0, 'pearls'),
(1403, 527, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1404, 527, 58, 12, 23, 22, 51000, 148, '2.9', '', 0, 'diamond'),
(1405, 527, 107, 0, 0, 0, 1000, 1, '1.71', '', 0, 'gemstone'),
(1406, 528, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1407, 528, 58, 12, 23, 22, 51000, 266, '4.06', '', 0, 'diamond'),
(1408, 528, 58, 12, 23, 24, 42000, 12, '0.6', '', 0, 'diamond'),
(1409, 528, 107, 0, 0, 0, 1000, 1, '1.19', '', 0, 'gemstone'),
(1410, 529, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1411, 529, 58, 12, 23, 22, 51000, 502, '5.18', '', 0, 'diamond'),
(1412, 529, 107, 0, 0, 0, 1000, 8, '7.64', '', 0, 'gemstone'),
(1413, 529, 100, 0, 0, 0, 300, 2, '9.1099999999999', '', 0, 'pearls'),
(1414, 530, 0, 3, 108, 0, 0, 0, '0', '0', 0, 'material'),
(1415, 530, 58, 12, 23, 22, 51000, 198, '1.41', '', 0, 'diamond'),
(1416, 531, 0, 3, 108, 0, 0, 0, '0', '0', 0, 'material'),
(1417, 531, 58, 12, 23, 22, 51000, 125, '1.14', '', 0, 'diamond'),
(1418, 532, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1419, 532, 58, 12, 23, 22, 51000, 228, '2.92', '', 0, 'diamond'),
(1420, 533, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1421, 533, 58, 12, 23, 22, 51000, 426, '3.15', '', 0, 'diamond'),
(1422, 533, 107, 0, 0, 0, 1000, 4, '0.89', '', 0, 'gemstone'),
(1423, 533, 100, 0, 0, 0, 300, 2, '17.36', '', 0, 'pearls'),
(1424, 534, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1425, 534, 58, 12, 23, 22, 51000, 626, '6.52', '', 0, 'diamond'),
(1426, 534, 107, 0, 0, 0, 1000, 4, '18.4', '', 0, 'gemstone'),
(1427, 535, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1428, 535, 58, 12, 23, 22, 51000, 114, '2.55', '', 0, 'diamond'),
(1429, 535, 58, 12, 23, 24, 42000, 45, '0.47', '', 0, 'diamond'),
(1430, 535, 107, 0, 0, 0, 1000, 4, '2.28', '', 0, 'gemstone'),
(1431, 536, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1432, 536, 58, 12, 23, 22, 51000, 454, '5.06', '', 0, 'diamond'),
(1433, 536, 107, 0, 0, 0, 1000, 8, '3.85', '', 0, 'gemstone'),
(1434, 536, 100, 0, 0, 0, 300, 6, '23.72', '', 0, 'pearls'),
(1435, 537, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1436, 537, 58, 12, 23, 22, 51000, 80, '1.9', '', 0, 'diamond'),
(1437, 537, 107, 0, 0, 0, 3000, 2, '0.34', '', 0, 'gemstone'),
(1438, 538, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1439, 538, 58, 12, 23, 22, 51000, 48, '1.34', '', 0, 'diamond'),
(1440, 538, 107, 0, 0, 0, 3000, 2, '0.41', '', 0, 'gemstone'),
(1444, 540, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1445, 540, 58, 12, 23, 22, 51000, 366, '3.75', '', 0, 'diamond'),
(1446, 540, 107, 0, 0, 0, 1000, 4, '1.84', '', 0, 'gemstone'),
(1447, 540, 100, 0, 0, 0, 300, 12, '23.38', '', 0, 'pearls'),
(1448, 541, 0, 3, 108, 0, 0, 0, '0', '0', 0, 'material'),
(1449, 541, 58, 12, 23, 22, 51000, 542, '3.92', '', 0, 'diamond'),
(1450, 542, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1451, 542, 58, 12, 23, 22, 51000, 26, '0.44', '', 0, 'diamond'),
(1452, 542, 100, 0, 0, 0, 300, 2, '2.64', '', 0, 'pearls'),
(1456, 544, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1457, 544, 58, 12, 23, 22, 51000, 50, '0.4', '', 0, 'diamond'),
(1458, 544, 100, 0, 0, 0, 300, 2, '2.73', '', 0, 'pearls'),
(1459, 545, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1460, 545, 58, 12, 23, 22, 51000, 44, '0.39', '', 0, 'diamond'),
(1461, 545, 100, 0, 0, 0, 300, 2, '2.71', '', 0, 'pearls'),
(1462, 546, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1463, 546, 2, 2, 2, 22, 51000, 16, '0.2', '', 0, 'diamond'),
(1464, 547, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1465, 547, 2, 2, 2, 22, 51000, 16, '0.2', '', 0, 'diamond'),
(1466, 548, 0, 3, 108, 0, 0, 0, '0', '0', 0, 'material'),
(1467, 548, 58, 12, 23, 22, 51000, 282, '2.85', '', 0, 'diamond'),
(1468, 548, 58, 12, 23, 24, 42000, 30, '0.33', '', 0, 'diamond'),
(1469, 548, 107, 0, 0, 0, 1000, 4, '4.93', '', 0, 'gemstone'),
(1470, 549, 0, 3, 108, 0, 0, 0, '0', '0', 0, 'material'),
(1471, 549, 58, 12, 23, 22, 51000, 150, '0.96', '', 0, 'diamond'),
(1472, 550, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1473, 550, 58, 12, 23, 22, 51000, 174, '2.48', '', 0, 'diamond'),
(1474, 550, 107, 0, 0, 0, 1000, 4, '6.3', '', 0, 'gemstone'),
(1475, 551, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1476, 551, 58, 12, 23, 22, 51000, 120, '1.16', '', 0, 'diamond'),
(1477, 552, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1478, 552, 58, 12, 23, 22, 51000, 244, '3', '', 0, 'diamond'),
(1479, 552, 107, 0, 0, 0, 1000, 4, '2.63', '', 0, 'gemstone'),
(1480, 553, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1481, 553, 58, 12, 23, 22, 51000, 46, '0.67', '', 0, 'diamond'),
(1482, 553, 107, 0, 0, 0, 1000, 4, '1.07', '', 0, 'gemstone'),
(1483, 553, 100, 0, 0, 0, 300, 2, '2.99', '', 0, 'pearls'),
(1484, 554, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1485, 554, 58, 12, 23, 22, 51000, 2, '0.06', '', 0, 'diamond'),
(1486, 554, 58, 12, 23, 109, 68000, 52, '3.67', '', 0, 'diamond'),
(1487, 554, 58, 12, 23, 29, 75000, 12, '1.61', '', 0, 'diamond'),
(1488, 555, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1489, 555, 58, 12, 23, 22, 51000, 34, '0.17', '', 0, 'diamond'),
(1490, 556, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1491, 556, 58, 12, 23, 22, 51000, 690, '4.13', '', 0, 'diamond'),
(1492, 556, 107, 0, 0, 0, 1000, 2, '3.55', '', 0, 'gemstone'),
(1493, 556, 100, 0, 0, 0, 300, 10, '21.88', '', 0, 'pearls'),
(1494, 557, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1495, 557, 58, 12, 23, 22, 51000, 918, '7.1', '', 0, 'diamond'),
(1496, 557, 107, 0, 0, 0, 1000, 12, '24.36', '', 0, 'gemstone'),
(1497, 558, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1498, 558, 2, 2, 2, 22, 42000, 1, '3.34', '', 0, 'diamond'),
(1499, 558, 107, 0, 0, 0, 15000, 1, '2.14', '', 0, 'gemstone'),
(1500, 559, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1501, 559, 2, 2, 2, 22, 42000, 1, '2.21', '', 0, 'diamond'),
(1502, 559, 107, 0, 0, 0, 15000, 1, '2.79', '', 0, 'gemstone'),
(1503, 560, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1504, 560, 2, 2, 2, 22, 42000, 1, '1.01', '', 0, 'diamond'),
(1505, 560, 107, 0, 0, 0, 15000, 1, '4.34', '', 0, 'gemstone'),
(1506, 561, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1507, 561, 2, 2, 2, 22, 42000, 1, '2.56', '', 0, 'diamond'),
(1508, 561, 100, 0, 0, 0, 400, 1, '61.04', '', 0, 'pearls'),
(1509, 562, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1510, 562, 2, 2, 2, 22, 42000, 1, '3.12', '', 0, 'diamond'),
(1511, 562, 100, 0, 0, 0, 400, 1, '20.83', '', 0, 'pearls'),
(1512, 563, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1513, 563, 2, 2, 2, 22, 42000, 1, '1.58', '', 0, 'diamond'),
(1514, 563, 100, 0, 0, 0, 400, 1, '21.67', '', 0, 'pearls'),
(1515, 564, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1516, 564, 2, 2, 2, 22, 51000, 126, '0.9399999999999', '', 0, 'diamond'),
(1517, 564, 2, 2, 2, 109, 68000, 2, '0.15', '', 0, 'diamond'),
(1518, 564, 2, 2, 2, 29, 68000, 16, '1.12', '', 0, 'diamond'),
(1519, 564, 2, 2, 2, 24, 51000, 6, '0.2', '', 0, 'diamond'),
(1520, 564, 2, 2, 2, 24, 38000, 4, '0.05', '', 0, 'diamond'),
(1521, 564, 100, 0, 0, 0, 300, 2, '5.41', '', 0, 'pearls'),
(1522, 565, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(1523, 565, 58, 12, 23, 22, 51000, 186, '1.19', '', 0, 'diamond'),
(1524, 565, 58, 12, 23, 109, 56000, 24, '0.68', '', 0, 'diamond'),
(1525, 565, 107, 0, 0, 0, 1200, 6, '5.44', '', 0, 'gemstone'),
(1526, 565, 100, 0, 0, 0, 300, 2, '3.92', '', 0, 'pearls'),
(1527, 566, 0, 3, 108, 0, 0, 0, '0', '0', 0, 'material'),
(1528, 566, 58, 12, 23, 22, 51000, 392, '3.44', '', 0, 'diamond'),
(1529, 566, 58, 12, 23, 109, 56000, 26, '0.97', '', 0, 'diamond'),
(1530, 566, 58, 12, 23, 29, 68000, 26, '1.43', '', 0, 'diamond'),
(1531, 566, 58, 12, 23, 22, 51000, 1, '0.0700000000000', '', 0, 'diamond'),
(1532, 567, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1533, 567, 58, 12, 23, 22, 51000, 158, '2.8', '', 0, 'diamond'),
(1534, 567, 90, 0, 0, 0, 4000, 2, '3.3', '', 0, 'gemstone'),
(1535, 567, 91, 0, 0, 0, 4000, 2, '11.64', '', 0, 'gemstone'),
(1536, 568, 0, 2, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1537, 568, 2, 2, 2, 22, 50000, 4, '0.5600000000000', '', 0, 'diamond'),
(1538, 568, 2, 2, 2, 22, 80000, 2, '0.5', '', 0, 'diamond'),
(1539, 568, 96, 0, 0, 0, 1500, 2, '16.34', '', 0, 'gemstone'),
(1565, 577, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1566, 577, 58, 12, 23, 22, 51000, 50, '0.5800000000000', '', 0, 'diamond'),
(1567, 578, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1568, 578, 58, 12, 23, 22, 51000, 86, '0.74', '', 0, 'diamond'),
(1569, 579, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1570, 579, 58, 12, 23, 22, 68000, 2, '0.18', '', 0, 'diamond'),
(1571, 579, 58, 12, 23, 22, 51000, 14, '0.22', '', 0, 'diamond'),
(1572, 579, 58, 12, 23, 22, 78000, 14, '1', '', 0, 'diamond'),
(1573, 580, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1574, 580, 58, 12, 23, 22, 56000, 14, '0.89', '', 0, 'diamond'),
(1575, 581, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1576, 581, 58, 12, 23, 22, 51000, 4, '0.15', '', 0, 'diamond'),
(1577, 581, 58, 12, 23, 22, 56000, 8, '0.5', '', 0, 'diamond'),
(1578, 581, 58, 12, 23, 22, 75000, 2, '0.25', '', 0, 'diamond'),
(1579, 582, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(1580, 582, 58, 12, 23, 22, 51000, 14, '0.52', '', 0, 'diamond'),
(1581, 583, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1582, 583, 58, 12, 23, 22, 51000, 2, '0.05', '', 0, 'diamond'),
(1583, 584, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1584, 584, 58, 12, 23, 22, 51000, 18, '0.16', '', 0, 'diamond'),
(1585, 585, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1586, 585, 58, 12, 23, 22, 51000, 14, '0.2800000000000', '', 0, 'diamond'),
(1587, 586, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1588, 586, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1589, 587, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1590, 587, 58, 12, 23, 22, 51000, 6, '0.19', '', 0, 'diamond'),
(1591, 588, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1592, 588, 58, 12, 23, 22, 51000, 30, '0.15', '', 0, 'diamond'),
(1593, 589, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1594, 589, 58, 12, 23, 22, 51000, 12, '0.16', '', 0, 'diamond'),
(1595, 590, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1596, 590, 58, 12, 23, 22, 130000, 2, '0.42', '', 0, 'diamond'),
(1597, 591, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1598, 591, 58, 12, 23, 22, 130000, 2, '0.4', '', 0, 'diamond'),
(1599, 592, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1600, 592, 58, 12, 23, 22, 51000, 22, '0.33', '', 0, 'diamond'),
(1601, 593, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1602, 593, 58, 12, 23, 22, 51000, 28, '0.41', '', 0, 'diamond'),
(1603, 594, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1604, 594, 58, 12, 23, 22, 51000, 24, '0.19', '', 0, 'diamond'),
(1605, 595, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1606, 595, 58, 12, 23, 22, 51000, 28, '0.21', '', 0, 'diamond'),
(1607, 596, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1608, 596, 58, 12, 23, 22, 51000, 32, '0.25', '', 0, 'diamond'),
(1609, 597, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1610, 597, 58, 12, 23, 22, 51000, 14, '0.1', '', 0, 'diamond'),
(1611, 598, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1612, 598, 58, 12, 23, 22, 68000, 4, '0.29', '', 0, 'diamond'),
(1613, 599, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1614, 599, 58, 12, 23, 22, 51000, 2, '0.1', '', 0, 'diamond'),
(1615, 600, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1616, 600, 58, 12, 23, 22, 51000, 28, '0.21', '', 0, 'diamond'),
(1617, 601, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1618, 601, 58, 12, 23, 22, 51000, 14, '0.6000000000000', '', 0, 'diamond'),
(1619, 602, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1620, 602, 58, 12, 23, 22, 51000, 18, '0.6000000000000', '', 0, 'diamond'),
(1621, 603, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1622, 603, 58, 12, 23, 22, 130000, 2, '0.36', '', 0, 'diamond'),
(1623, 604, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1624, 604, 58, 12, 23, 22, 51000, 16, '0.12', '', 0, 'diamond'),
(1625, 605, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1626, 605, 58, 12, 23, 22, 56000, 8, '0.51', '', 0, 'diamond'),
(1627, 606, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1628, 606, 58, 12, 23, 22, 75000, 2, '0.22', '', 0, 'diamond'),
(1629, 607, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1630, 607, 58, 12, 23, 22, 75000, 2, '0.21', '', 0, 'diamond'),
(1631, 608, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1632, 608, 58, 12, 23, 22, 51000, 42, '0.71', '', 0, 'diamond'),
(1633, 609, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1634, 609, 58, 12, 23, 22, 90000, 2, '0.3', '', 0, 'diamond'),
(1635, 610, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1636, 610, 58, 12, 23, 22, 51000, 14, '0.09', '', 0, 'diamond'),
(1637, 611, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1638, 611, 58, 12, 23, 22, 90000, 2, '0.32', '', 0, 'diamond'),
(1639, 612, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1640, 612, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1641, 613, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1642, 613, 58, 12, 23, 22, 51000, 50, '0.43', '', 0, 'diamond'),
(1643, 614, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1644, 614, 58, 12, 23, 22, 51000, 14, '0.14', '', 0, 'diamond'),
(1645, 615, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1646, 615, 58, 12, 23, 22, 51000, 38, '0.3', '', 0, 'diamond'),
(1647, 616, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1648, 616, 58, 12, 23, 22, 51000, 28, '0.23', '', 0, 'diamond'),
(1649, 617, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1650, 617, 58, 12, 23, 22, 51000, 43, '0.73', '', 0, 'diamond'),
(1651, 618, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1652, 618, 58, 12, 23, 22, 51000, 56, '0.5', '', 0, 'diamond'),
(1653, 619, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1654, 619, 58, 12, 23, 22, 51000, 18, '0.29', '', 0, 'diamond'),
(1655, 620, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1656, 620, 58, 12, 23, 22, 51000, 40, '0.3', '', 0, 'diamond'),
(1657, 621, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1658, 621, 58, 12, 23, 22, 51000, 24, '0.36', '', 0, 'diamond'),
(1659, 622, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1660, 622, 58, 12, 23, 22, 75000, 2, '0.26', '', 0, 'diamond'),
(1661, 622, 58, 12, 23, 22, 51000, 16, '0.19', '', 0, 'diamond'),
(1662, 623, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1663, 623, 58, 12, 23, 22, 51000, 26, '0.51', '', 0, 'diamond'),
(1664, 624, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1665, 624, 58, 12, 23, 22, 51000, 34, '0.41', '', 0, 'diamond'),
(1666, 625, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1667, 625, 58, 12, 23, 22, 51000, 26, '0.27', '', 0, 'diamond'),
(1668, 626, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1669, 626, 58, 12, 23, 22, 51000, 76, '0.65', '', 0, 'diamond'),
(1670, 627, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1671, 627, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1672, 628, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1673, 628, 58, 12, 23, 22, 51000, 96, '0.43', '', 0, 'diamond'),
(1674, 628, 107, 0, 0, 0, 1000, 12, '1.1', '', 0, 'gemstone'),
(1675, 629, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1676, 629, 58, 12, 23, 22, 51000, 1, '0.51', '', 0, 'diamond'),
(1677, 629, 107, 0, 0, 0, 1000, 2, '0.31', '', 0, 'gemstone'),
(1678, 630, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1679, 630, 58, 12, 23, 22, 51000, 100, '0.72', '', 0, 'diamond'),
(1680, 630, 107, 0, 0, 0, 1000, 2, '0.5800000000000', '', 0, 'gemstone'),
(1681, 631, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1682, 631, 58, 12, 23, 22, 68000, 20, '1.63', '', 0, 'diamond'),
(1683, 631, 107, 0, 0, 0, 1000, 6, '11.91', '', 0, 'gemstone'),
(1684, 632, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1685, 632, 58, 12, 23, 22, 51000, 41, '1.45', '', 0, 'diamond'),
(1686, 632, 90, 0, 0, 0, 3000, 1, '0.31', '', 0, 'gemstone'),
(1687, 633, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1688, 633, 58, 12, 23, 22, 51000, 52, '2.05', '', 0, 'diamond'),
(1689, 633, 90, 0, 0, 0, 3000, 1, '0.66', '', 0, 'gemstone'),
(1690, 634, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1691, 634, 58, 12, 23, 22, 51000, 56, '2.19', '', 0, 'diamond'),
(1692, 634, 96, 0, 0, 0, 3000, 1, '0.13', '', 0, 'gemstone'),
(1693, 635, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1694, 635, 58, 12, 23, 22, 51000, 40, '1.38', '', 0, 'diamond'),
(1695, 635, 96, 0, 0, 0, 3000, 1, '0.26', '', 0, 'gemstone'),
(1696, 636, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1697, 636, 58, 12, 23, 22, 51000, 49, '2.14', '', 0, 'diamond'),
(1698, 636, 96, 0, 0, 0, 3000, 1, '0.24', '', 0, 'gemstone'),
(1699, 636, 100, 0, 0, 0, 300, 10, '9.57', '', 0, 'pearls'),
(1700, 637, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1701, 637, 58, 12, 23, 22, 51000, 44, '1.26', '', 0, 'diamond'),
(1702, 637, 96, 0, 0, 0, 3000, 3, '1.28', '', 0, 'gemstone'),
(1703, 638, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1704, 638, 58, 12, 23, 22, 51000, 60, '1.93', '', 0, 'diamond'),
(1705, 638, 107, 0, 0, 0, 3000, 2, '0.23', '', 0, 'gemstone'),
(1706, 639, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1707, 639, 58, 12, 23, 22, 51000, 22, '0.59', '', 0, 'diamond'),
(1708, 639, 107, 0, 0, 0, 3000, 14, '3.28', '', 0, 'gemstone'),
(1709, 640, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1710, 640, 58, 12, 23, 22, 51000, 44, '1.05', '', 0, 'diamond'),
(1711, 640, 107, 0, 0, 0, 3000, 4, '0.5', '', 0, 'gemstone'),
(1712, 641, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1713, 641, 58, 12, 23, 22, 51000, 58, '1.78', '', 0, 'diamond'),
(1714, 641, 96, 0, 0, 0, 3000, 1, '1.37', '', 0, 'gemstone'),
(1715, 642, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1716, 642, 58, 12, 23, 22, 51000, 24, '0.21', '', 0, 'diamond'),
(1717, 643, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1718, 643, 58, 12, 23, 22, 75000, 10, '1.1', '', 0, 'diamond'),
(1719, 644, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1720, 644, 58, 12, 23, 22, 51000, 317, '2.66', '', 0, 'diamond'),
(1721, 644, 58, 12, 23, 110, 42000, 54, '0.93', '', 0, 'diamond'),
(1722, 644, 107, 0, 0, 0, 1000, 4, '3.46', '', 0, 'gemstone'),
(1723, 645, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1724, 645, 58, 12, 23, 22, 51000, 2, '0.25', '', 0, 'diamond'),
(1725, 646, 0, 3, 112, 0, 0, 0, '0', '0', 0, 'material'),
(1726, 646, 58, 12, 23, 22, 51000, 72, '0.52', '', 0, 'diamond'),
(1727, 647, 0, 3, 112, 0, 0, 0, '0', '0', 0, 'material'),
(1728, 647, 58, 12, 23, 22, 51000, 72, '0.54', '', 0, 'diamond'),
(1729, 648, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1730, 648, 58, 12, 23, 22, 51000, 61, '1.71', '', 0, 'diamond'),
(1731, 648, 107, 0, 0, 0, 3000, 3, '0.77', '', 0, 'gemstone'),
(1732, 649, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1733, 649, 58, 12, 23, 22, 56000, 2, '0.11', '', 0, 'diamond'),
(1734, 650, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1735, 650, 58, 12, 23, 22, 90000, 2, '0.27', '', 0, 'diamond'),
(1736, 651, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1737, 651, 58, 12, 23, 22, 51000, 2, '0.05', '', 0, 'diamond'),
(1738, 652, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1739, 652, 58, 12, 23, 22, 51000, 6, '0.13', '', 0, 'diamond'),
(1740, 653, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1741, 653, 58, 12, 23, 22, 51000, 2, '0.08', '', 0, 'diamond'),
(1742, 654, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1743, 654, 58, 12, 23, 22, 51000, 14, '0.18', '', 0, 'diamond'),
(1744, 655, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1745, 655, 58, 12, 23, 22, 51000, 28, '0.23', '', 0, 'diamond'),
(1746, 656, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1747, 656, 58, 12, 23, 22, 51000, 22, '0.2', '', 0, 'diamond'),
(1748, 657, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1749, 657, 58, 12, 23, 22, 75000, 5, '0.24', '', 0, 'diamond'),
(1750, 658, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1751, 658, 58, 12, 23, 22, 75000, 2, '0.21', '', 0, 'diamond'),
(1752, 659, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1753, 659, 58, 12, 23, 22, 90000, 2, '0.31', '', 0, 'diamond'),
(1754, 660, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1755, 660, 58, 12, 23, 22, 75000, 2, '0.25', '', 0, 'diamond'),
(1756, 661, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1757, 661, 58, 12, 23, 22, 90000, 2, '0.27', '', 0, 'diamond'),
(1758, 662, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1759, 662, 58, 12, 23, 22, 51000, 1, '0.26', '', 0, 'diamond'),
(1760, 662, 58, 12, 23, 110, 42000, 1, '0.34', '', 0, 'diamond'),
(1761, 663, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1762, 663, 58, 12, 23, 22, 51000, 20, '0.18', '', 0, 'diamond'),
(1763, 664, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1764, 664, 58, 12, 23, 22, 51000, 2, '0.04', '', 0, 'diamond'),
(1765, 665, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1766, 665, 58, 12, 23, 22, 51000, 2, '0.04', '', 0, 'diamond'),
(1767, 666, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1768, 666, 58, 12, 23, 22, 51000, 8, '0.05', '', 0, 'diamond'),
(1769, 667, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1770, 667, 58, 12, 23, 22, 51000, 10, '0.19', '', 0, 'diamond'),
(1771, 668, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1772, 668, 58, 12, 23, 22, 51000, 4, '0.06', '', 0, 'diamond'),
(1773, 669, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1774, 669, 58, 12, 23, 22, 51000, 6, '0.13', '', 0, 'diamond');
INSERT INTO `product_option` (`ProductOptionID`, `ProductID`, `OptionID`, `Combination_OptionID`, `Combination_OptionID_Secnd`, `Diamond_Shape_Id`, `OptionPriceincrement`, `Quantity`, `OptionWeight`, `OptionSize`, `OptionGroupID`, `attribute_type`) VALUES
(1775, 670, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1776, 670, 58, 12, 23, 22, 51000, 6, '0.06', '', 0, 'diamond'),
(1777, 671, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1778, 671, 58, 12, 23, 22, 51000, 151, '3.72', '', 0, 'diamond'),
(1779, 671, 96, 0, 0, 0, 3000, 1, '2.75', '', 0, 'gemstone'),
(1780, 671, 100, 0, 0, 0, 300, 7, '19.85', '', 0, 'pearls'),
(1781, 672, 0, 3, 112, 0, 0, 0, '0', '0', 0, 'material'),
(1782, 672, 58, 12, 23, 22, 51000, 230, '2.14', '', 0, 'diamond'),
(1783, 672, 2, 2, 23, 26, 30000, 24, '1.44', '', 0, 'diamond'),
(1784, 672, 107, 0, 0, 0, 4000, 4, '8.51', '', 0, 'gemstone'),
(1785, 673, 0, 3, 112, 0, 0, 0, '0', '0', 0, 'material'),
(1786, 673, 58, 12, 23, 22, 51000, 28, '0.18', '', 0, 'diamond'),
(1787, 674, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1788, 674, 58, 12, 23, 22, 75000, 2, '0.19', '', 0, 'diamond'),
(1789, 675, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1790, 675, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1791, 676, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1792, 676, 58, 12, 23, 22, 90000, 2, '0.27', '', 0, 'diamond'),
(1793, 677, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1794, 677, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1795, 678, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1796, 678, 58, 12, 23, 22, 90000, 2, '0.29', '', 0, 'diamond'),
(1797, 679, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1798, 679, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1799, 680, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1800, 680, 58, 12, 23, 22, 90000, 2, '0.29', '', 0, 'diamond'),
(1801, 681, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1802, 681, 58, 12, 23, 22, 75000, 2, '0.21', '', 0, 'diamond'),
(1803, 682, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1804, 682, 58, 12, 23, 22, 130000, 2, '0.36', '', 0, 'diamond'),
(1805, 683, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1806, 683, 58, 12, 23, 22, 130000, 2, '0.35', '', 0, 'diamond'),
(1807, 684, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1808, 684, 58, 12, 23, 22, 75000, 2, '0.19', '', 0, 'diamond'),
(1809, 685, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1810, 685, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1811, 686, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1812, 686, 58, 12, 23, 22, 75000, 2, '0.19', '', 0, 'diamond'),
(1813, 687, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1814, 687, 58, 12, 23, 22, 130000, 2, '0.33', '', 0, 'diamond'),
(1815, 688, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1816, 688, 58, 12, 23, 22, 90000, 2, '0.27', '', 0, 'diamond'),
(1817, 689, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1818, 689, 58, 12, 23, 22, 90000, 2, '0.32', '', 0, 'diamond'),
(1819, 690, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1820, 690, 58, 12, 23, 22, 68000, 2, '0.18', '', 0, 'diamond'),
(1821, 691, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1822, 691, 58, 12, 23, 22, 75000, 2, '0.2', '', 0, 'diamond'),
(1823, 692, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1824, 692, 58, 12, 23, 22, 51000, 12, '0.2', '', 0, 'diamond'),
(1825, 693, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1826, 693, 58, 12, 23, 22, 68000, 2, '0.16', '', 0, 'diamond'),
(1827, 693, 58, 12, 23, 22, 51000, 4, '0.9', '', 0, 'diamond'),
(1828, 694, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1829, 694, 58, 12, 23, 22, 90000, 2, '0.2800000000000', '', 0, 'diamond'),
(1830, 695, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1831, 695, 58, 12, 23, 22, 51000, 2, '0.05', '', 0, 'diamond'),
(1832, 696, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1833, 696, 58, 12, 23, 22, 51000, 8, '0.17', '', 0, 'diamond'),
(1834, 697, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1835, 697, 58, 12, 23, 22, 68000, 2, '0.18', '', 0, 'diamond'),
(1836, 698, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1837, 698, 58, 12, 23, 22, 75000, 2, '0.27', '', 0, 'diamond'),
(1838, 699, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1839, 699, 58, 12, 23, 22, 51000, 2, '0.04', '', 0, 'diamond'),
(1840, 700, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1841, 700, 58, 12, 23, 22, 51000, 6, '0.0700000000000', '', 0, 'diamond'),
(1842, 701, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1843, 701, 58, 12, 23, 22, 68000, 2, '0.16', '', 0, 'diamond'),
(1844, 702, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1845, 702, 58, 12, 23, 22, 75000, 2, '0.27', '', 0, 'diamond'),
(1846, 703, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1847, 703, 58, 12, 23, 22, 90000, 2, '0.27', '', 0, 'diamond'),
(1848, 704, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1849, 704, 58, 12, 23, 22, 51000, 23, '0.45', '', 0, 'diamond'),
(1850, 704, 96, 0, 0, 0, 3000, 1, '0.05', '', 0, 'gemstone'),
(1851, 130, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(1852, 130, 0, 12, 23, 22, 51000, 25, '0.45', '', 0, 'diamond'),
(1853, 4, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1854, 4, 0, 12, 23, 22, 51000, 668, '8.5500000000000', '', 0, 'diamond'),
(1855, 4, 21, 0, 0, 0, 1000, 2, '1.82', '', 0, 'gemstone'),
(1856, 4, 100, 0, 0, 0, 300, 1, '13.71', '', 0, 'pearls'),
(1857, 705, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1858, 705, 58, 12, 23, 22, 51000, 44, '1.16', '', 0, 'diamond'),
(1859, 705, 107, 0, 0, 0, 3000, 2, '0.66', '', 0, 'gemstone'),
(1860, 706, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1861, 706, 58, 12, 23, 22, 51000, 16, '0.53', '', 0, 'diamond'),
(1862, 706, 107, 0, 0, 0, 3000, 2, '0.49', '', 0, 'gemstone'),
(1863, 707, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1864, 707, 58, 12, 23, 22, 51000, 14, '0.61', '', 0, 'diamond'),
(1865, 708, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1866, 708, 58, 12, 23, 22, 75000, 10, '1.34', '', 0, 'diamond'),
(1867, 709, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1868, 709, 58, 12, 23, 22, 56000, 14, '0.89', '', 0, 'diamond'),
(1869, 710, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1870, 710, 58, 12, 23, 22, 75000, 10, '1.07', '', 0, 'diamond'),
(1871, 711, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1872, 711, 58, 12, 23, 22, 68000, 18, '1.36', '', 0, 'diamond'),
(1873, 712, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1874, 712, 58, 12, 23, 22, 75000, 8, '0.87', '', 0, 'diamond'),
(1875, 713, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1876, 713, 58, 12, 23, 22, 75000, 10, '1', '', 0, 'diamond'),
(1877, 714, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1878, 714, 58, 12, 23, 22, 68000, 2, '0.17', '', 0, 'diamond'),
(1879, 714, 58, 12, 23, 22, 51000, 24, '1.05', '', 0, 'diamond'),
(1880, 715, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1881, 715, 58, 12, 23, 22, 68000, 14, '1.26', '', 0, 'diamond'),
(1882, 716, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1883, 716, 58, 12, 23, 22, 51000, 2, '0.02', '', 0, 'diamond'),
(1884, 716, 58, 12, 23, 22, 68000, 8, '0.71', '', 0, 'diamond'),
(1885, 717, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1886, 717, 58, 12, 23, 22, 68000, 10, '0.91', '', 0, 'diamond'),
(1887, 718, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1888, 718, 58, 12, 23, 22, 68000, 14, '1.24', '', 0, 'diamond'),
(1889, 719, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1890, 719, 58, 12, 23, 22, 68000, 14, '1.1', '', 0, 'diamond'),
(1891, 720, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1892, 720, 58, 12, 23, 22, 68000, 10, '0.74', '', 0, 'diamond'),
(1893, 721, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1894, 721, 58, 12, 23, 22, 51000, 16, '0.53', '', 0, 'diamond'),
(1895, 721, 58, 12, 23, 22, 68000, 18, '1.36', '', 0, 'diamond'),
(1896, 722, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1897, 722, 58, 12, 23, 22, 56000, 14, '0.79', '', 0, 'diamond'),
(1898, 723, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1899, 723, 58, 12, 23, 22, 75000, 10, '1.16', '', 0, 'diamond'),
(1900, 724, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1901, 724, 58, 12, 23, 22, 56000, 14, '0.76', '', 0, 'diamond'),
(1902, 725, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1903, 725, 58, 12, 23, 22, 56000, 14, '0.91', '', 0, 'diamond'),
(1904, 726, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1905, 726, 58, 12, 23, 22, 51000, 87, '1.03', '', 0, 'diamond'),
(1906, 727, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1907, 727, 58, 12, 23, 22, 51000, 254, '2.26', '', 0, 'diamond'),
(1908, 728, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1909, 728, 58, 12, 23, 22, 51000, 75, '0.97', '', 0, 'diamond'),
(1910, 728, 96, 0, 0, 0, 1000, 2, '0.04', '', 0, 'gemstone'),
(1911, 729, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1912, 729, 58, 12, 23, 22, 51000, 83, '1.03', '', 0, 'diamond'),
(1913, 730, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1914, 730, 58, 12, 23, 22, 51000, 95, '1.63', '', 0, 'diamond'),
(1915, 731, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1916, 731, 58, 12, 23, 22, 51000, 131, '0.85', '', 0, 'diamond'),
(1917, 732, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1918, 732, 58, 12, 23, 22, 51000, 52, '0.6', '', 0, 'diamond'),
(1919, 733, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1920, 733, 58, 12, 23, 22, 51000, 109, '0.88', '', 0, 'diamond'),
(1921, 734, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1922, 734, 58, 12, 23, 22, 51000, 95, '1.26', '', 0, 'diamond'),
(1923, 735, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1924, 735, 58, 12, 23, 22, 51000, 115, '0.98', '', 0, 'diamond'),
(1925, 736, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1926, 736, 58, 12, 23, 22, 51000, 84, '1.03', '', 0, 'diamond'),
(1927, 736, 58, 12, 23, 109, 58000, 8, '0.38', '', 0, 'diamond'),
(1928, 737, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1929, 737, 58, 12, 23, 22, 51000, 23, '0.27', '', 0, 'diamond'),
(1930, 738, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1931, 738, 58, 12, 23, 22, 51000, 124, '1.25', '', 0, 'diamond'),
(1932, 739, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1933, 739, 58, 12, 23, 22, 51000, 75, '0.85', '', 0, 'diamond'),
(1934, 740, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1935, 740, 58, 12, 23, 22, 51000, 29, '0.54', '', 0, 'diamond'),
(1936, 741, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1937, 741, 58, 12, 23, 22, 51000, 76, '0.91', '', 0, 'diamond'),
(1938, 742, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1939, 742, 58, 12, 23, 22, 51000, 83, '1.01', '', 0, 'diamond'),
(1940, 742, 96, 0, 0, 0, 1000, 2, '0.02', '', 0, 'gemstone'),
(1941, 743, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1942, 743, 58, 12, 23, 22, 51000, 79, '1.15', '', 0, 'diamond'),
(1943, 744, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1944, 744, 58, 12, 23, 22, 51000, 74, '0.96', '', 0, 'diamond'),
(1945, 744, 96, 0, 0, 0, 1000, 2, '0.02', '', 0, 'gemstone'),
(1946, 2, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1947, 2, 0, 12, 23, 22, 51000, 2535, '19.19', '', 0, 'diamond'),
(1948, 2, 21, 0, 0, 0, 1000, 16, '17.44', '', 0, 'gemstone'),
(1949, 3, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1950, 3, 0, 12, 23, 22, 51000, 1755, '14.95', '', 0, 'diamond'),
(1951, 3, 21, 0, 0, 0, 1000, 7, '10.04', '', 0, 'gemstone'),
(1954, 746, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1955, 746, 58, 12, 23, 22, 51000, 23, '0.77', '', 0, 'diamond'),
(1956, 747, 0, 113, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1957, 747, 58, 12, 23, 22, 51000, 106, '3.67', '', 0, 'diamond'),
(1958, 747, 96, 0, 0, 0, 3000, 3, '2.32', '', 0, 'gemstone'),
(1959, 747, 100, 0, 0, 0, 300, 7, '16.19', '', 0, 'pearls'),
(1960, 748, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1961, 748, 58, 12, 23, 22, 51000, 26, '0.63', '', 0, 'diamond'),
(1962, 748, 96, 0, 0, 0, 3000, 1, '0.16', '', 0, 'gemstone'),
(1963, 748, 100, 0, 0, 0, 300, 1, '0.84', '', 0, 'pearls'),
(1964, 748, 106, 0, 0, 0, 3000, 75, '6.12', '', 0, 'beads'),
(1965, 749, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1966, 749, 58, 12, 23, 22, 51000, 22, '0.67', '', 0, 'diamond'),
(1967, 749, 107, 0, 0, 0, 4000, 2, '0.28', '', 0, 'gemstone'),
(1968, 750, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1969, 750, 58, 12, 23, 22, 51000, 19, '0.77', '', 0, 'diamond'),
(1970, 750, 96, 0, 0, 0, 3000, 1, '0.4', '', 0, 'gemstone'),
(1971, 751, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1972, 751, 58, 12, 23, 22, 51000, 24, '0.62', '', 0, 'diamond'),
(1973, 751, 96, 0, 0, 0, 3000, 1, '0.42', '', 0, 'gemstone'),
(1974, 752, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1975, 752, 58, 12, 23, 22, 51000, 26, '0.68', '', 0, 'diamond'),
(1976, 752, 96, 0, 0, 0, 3000, 1, '0.11', '', 0, 'gemstone'),
(1977, 753, 0, 113, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1978, 753, 58, 12, 23, 22, 51000, 14, '0.6899999999999', '', 0, 'diamond'),
(1979, 754, 0, 113, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1980, 754, 58, 12, 23, 22, 68000, 26, '2.04', '', 0, 'diamond'),
(1981, 755, 0, 113, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1982, 755, 58, 12, 23, 22, 68000, 8, '0.72', '', 0, 'diamond'),
(1983, 756, 0, 113, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1984, 756, 58, 12, 23, 22, 75000, 6, '0.63', '', 0, 'diamond'),
(1985, 757, 0, 113, 15, 0, 0, 0, '0', '0', 0, 'material'),
(1986, 757, 58, 12, 23, 22, 75000, 8, '0.79', '', 0, 'diamond'),
(1987, 129, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(1988, 129, 0, 12, 23, 22, 51000, 15, '0.12', '', 0, 'diamond'),
(1989, 128, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(1990, 128, 0, 12, 23, 22, 190000, 1, '0.33', '', 0, 'diamond'),
(2000, 758, 0, 3, 117, 0, 0, 0, '0', '1', 0, 'material'),
(2001, 758, 58, 12, 23, 22, 51000, 115, '0.89', '', 0, 'diamond'),
(2002, 758, 107, 0, 0, 0, 1000, 1, '0.03', '', 0, 'gemstone'),
(2003, 759, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(2004, 759, 58, 12, 23, 22, 51000, 106, '0.86', '', 0, 'diamond'),
(2005, 759, 58, 12, 23, 29, 68000, 12, '0.75', '', 0, 'diamond'),
(2006, 759, 58, 12, 23, 116, 110000, 1, '0.2', '', 0, 'diamond'),
(2007, 760, 0, 3, 115, 0, 0, 0, '0', '0', 0, 'material'),
(2008, 760, 58, 12, 23, 22, 51000, 108, '0.59', '', 0, 'diamond'),
(2009, 760, 58, 12, 23, 109, 65000, 20, '0.88', '', 0, 'diamond'),
(2010, 761, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(2011, 761, 58, 12, 23, 22, 51000, 54, '0.31', '', 0, 'diamond'),
(2012, 761, 58, 12, 23, 29, 65000, 4, '0.37', '', 0, 'diamond'),
(2013, 761, 58, 12, 23, 109, 65000, 14, '0.74', '', 0, 'diamond'),
(2014, 761, 58, 12, 23, 118, 65000, 4, '0.21', '', 0, 'diamond'),
(2015, 762, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2016, 762, 58, 12, 23, 22, 51000, 302, '2.55', '', 0, 'diamond'),
(2017, 762, 119, 0, 0, 0, 1000, 2, '2.98', '', 0, 'gemstone'),
(2018, 762, 100, 0, 0, 0, 300, 5, '12.66', '', 0, 'pearls'),
(2019, 763, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2020, 763, 58, 12, 23, 22, 51000, 191, '1.43', '', 0, 'diamond'),
(2021, 763, 119, 0, 0, 0, 1000, 2, '1.52', '', 0, 'gemstone'),
(2022, 763, 100, 0, 0, 0, 300, 5, '10.46', '', 0, 'pearls'),
(2023, 764, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2024, 764, 58, 12, 23, 22, 51000, 494, '4.5', '', 0, 'diamond'),
(2025, 764, 119, 0, 0, 0, 1000, 2, '8.1199999999999', '', 0, 'gemstone'),
(2026, 764, 100, 0, 0, 0, 300, 1, '9.19', '', 0, 'pearls'),
(2027, 765, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2028, 765, 58, 12, 23, 22, 51000, 95, '1.8', '', 0, 'diamond'),
(2029, 765, 119, 0, 0, 0, 1000, 2, '1.54', '', 0, 'gemstone'),
(2030, 765, 100, 0, 0, 0, 300, 1, '2.48', '', 0, 'pearls'),
(2031, 766, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2032, 766, 58, 12, 23, 22, 51000, 365, '2.84', '', 0, 'diamond'),
(2033, 766, 58, 12, 23, 24, 42000, 58, '0.6', '', 0, 'diamond'),
(2034, 766, 119, 0, 0, 0, 1000, 2, '1.71', '', 0, 'gemstone'),
(2035, 766, 100, 0, 0, 0, 300, 1, '4.64', '', 0, 'pearls'),
(2036, 767, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2037, 767, 58, 12, 23, 22, 51000, 316, '2.59', '', 0, 'diamond'),
(2038, 767, 119, 0, 0, 0, 1000, 2, '3.27', '', 0, 'gemstone'),
(2039, 767, 100, 0, 0, 0, 300, 3, '14.87', '', 0, 'pearls'),
(2040, 768, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2041, 768, 58, 12, 23, 22, 51000, 209, '3.5', '', 0, 'diamond'),
(2042, 768, 119, 0, 0, 0, 1000, 2, '3.54', '', 0, 'gemstone'),
(2043, 768, 100, 0, 0, 0, 300, 6, '12.55', '', 0, 'pearls'),
(2044, 769, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2045, 769, 58, 12, 23, 22, 51000, 80, '2.32', '', 0, 'diamond'),
(2046, 769, 119, 0, 0, 0, 3000, 6, '0.8100000000000', '', 0, 'gemstone'),
(2047, 770, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2048, 770, 58, 12, 23, 22, 51000, 458, '3.93', '', 0, 'diamond'),
(2049, 770, 58, 12, 23, 24, 42000, 32, '0.55', '', 0, 'diamond'),
(2050, 770, 119, 0, 0, 0, 1000, 2, '3.43', '', 0, 'gemstone'),
(2051, 770, 100, 0, 0, 0, 300, 1, '7.32', '', 0, 'pearls'),
(2052, 771, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2053, 771, 58, 12, 23, 22, 51000, 125, '4.6', '', 0, 'diamond'),
(2054, 771, 119, 0, 0, 0, 3000, 3, '0.92', '', 0, 'gemstone'),
(2055, 772, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2056, 772, 58, 12, 23, 22, 51000, 59, '1.29', '', 0, 'diamond'),
(2057, 772, 119, 0, 0, 0, 3000, 5, '1.03', '', 0, 'gemstone'),
(2058, 773, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2059, 773, 58, 12, 23, 22, 51000, 50, '1.29', '', 0, 'diamond'),
(2060, 773, 119, 0, 0, 0, 3000, 2, '0.37', '', 0, 'gemstone'),
(2061, 774, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2062, 774, 58, 12, 23, 22, 51000, 82, '3.46', '', 0, 'diamond'),
(2063, 774, 119, 0, 0, 0, 3000, 5, '2.69', '', 0, 'gemstone'),
(2065, 775, 0, 88, 15, 0, 0, 0, '200', '30 inches', 0, 'material'),
(2066, 573, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2067, 573, 0, 12, 23, 22, 51000, 208, '1.67', '', 0, 'diamond'),
(2068, 573, 100, 0, 0, 0, 300, 2, '14.25', '', 0, 'pearls'),
(2069, 572, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2070, 572, 0, 12, 23, 22, 51000, 326, '2.28', '', 0, 'diamond'),
(2071, 572, 100, 0, 0, 0, 300, 2, '14.34', '', 0, 'pearls'),
(2074, 570, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2075, 570, 0, 12, 23, 22, 51000, 369, '3.57', '', 0, 'diamond'),
(2076, 570, 107, 0, 0, 0, 1000, 4, '2.53', '', 0, 'gemstone'),
(2077, 569, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2078, 569, 0, 12, 23, 22, 51000, 244, '2.2', '', 0, 'diamond'),
(2079, 569, 107, 0, 0, 0, 1000, 2, '1.36', '', 0, 'gemstone'),
(2080, 569, 100, 0, 0, 0, 300, 2, '13.26', '', 0, 'pearls'),
(2081, 392, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(2082, 392, 0, 12, 23, 22, 51000, 93, '0.6899999999999', '', 0, 'diamond'),
(2083, 392, 0, 12, 23, 29, 75000, 42, '1.92', '', 0, 'diamond'),
(2084, 391, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(2085, 391, 0, 12, 23, 22, 51000, 137, '0.83', '', 0, 'diamond'),
(2086, 391, 0, 12, 23, 29, 75000, 22, '1.3', '', 0, 'diamond'),
(2091, 575, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2092, 575, 0, 12, 23, 22, 51000, 304, '2.9', '', 0, 'diamond'),
(2093, 575, 100, 0, 0, 0, 300, 2, '8.75', '', 0, 'pearls'),
(2097, 347, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(2098, 347, 0, 12, 23, 22, 51000, 54, '0.57', '', 0, 'diamond'),
(2099, 347, 107, 0, 0, 0, 3000, 18, '3.86', '', 0, 'gemstone'),
(2102, 93, 0, 3, 27, 0, 0, 0, '0', '2', 0, 'material'),
(2103, 93, 0, 12, 23, 22, 51000, 59, '0.65', '', 0, 'diamond'),
(2104, 92, 0, 3, 27, 0, 0, 0, '0', '2', 0, 'material'),
(2105, 92, 0, 12, 23, 22, 51000, 79, '1.03', '', 0, 'diamond'),
(2106, 91, 0, 3, 27, 0, 0, 0, '0', '2', 0, 'material'),
(2107, 91, 0, 12, 23, 22, 51000, 49, '0.39', '', 0, 'diamond'),
(2108, 90, 0, 3, 31, 0, 0, 0, '0', '2', 0, 'material'),
(2109, 90, 0, 12, 23, 22, 51000, 36, '0.51', '', 0, 'diamond'),
(2110, 346, 0, 3, 16, 0, 0, 0, '0', '2', 0, 'material'),
(2111, 346, 0, 12, 23, 22, 51000, 23, '0.12', '', 0, 'diamond'),
(2112, 346, 107, 0, 0, 0, 3000, 1, '0.64', '', 0, 'gemstone'),
(2113, 345, 0, 3, 27, 0, 0, 0, '0', '2', 0, 'material'),
(2114, 345, 0, 12, 23, 22, 51000, 40, '0.39', '', 0, 'diamond'),
(2115, 345, 0, 12, 23, 109, 68000, 11, '0.46', '', 0, 'diamond'),
(2116, 344, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(2117, 344, 0, 12, 23, 22, 51000, 600, '5.81', '', 0, 'diamond'),
(2118, 344, 107, 0, 0, 0, 1000, 6, '9.92', '', 0, 'gemstone'),
(2119, 89, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(2120, 89, 0, 12, 23, 22, 51000, 224, '2.6', '', 0, 'diamond'),
(2121, 89, 0, 12, 23, 22, 12000, 32, '0.24', '', 0, 'diamond'),
(2122, 343, 0, 3, 15, 0, 0, 0, '0', '2', 0, 'material'),
(2123, 343, 0, 12, 23, 22, 51000, 220, '1.62', '', 0, 'diamond'),
(2124, 343, 107, 0, 0, 0, 1000, 4, '1.56', '', 0, 'gemstone'),
(2141, 94, 0, 3, 27, 0, 0, 0, '0', '2', 0, 'material'),
(2142, 94, 0, 12, 23, 22, 51000, 64, '0.89', '', 0, 'diamond'),
(2158, 543, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2159, 543, 0, 12, 23, 22, 51000, 38, '0.47', '', 0, 'diamond'),
(2160, 543, 100, 0, 0, 0, 300, 2, '2.68', '', 0, 'pearls'),
(2161, 539, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2162, 539, 0, 12, 23, 22, 51000, 494, '5.65', '', 0, 'diamond'),
(2163, 539, 107, 0, 0, 0, 1000, 8, '6.16', '', 0, 'gemstone'),
(2164, 508, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2165, 508, 0, 12, 23, 22, 51000, 394, '3.29', '', 0, 'diamond'),
(2166, 508, 107, 0, 0, 0, 1000, 4, '4.4', '', 0, 'gemstone'),
(2167, 503, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2168, 503, 0, 12, 23, 22, 51000, 656, '3.7', '', 0, 'diamond'),
(2169, 503, 0, 12, 23, 24, 42000, 72, '3.5', '', 0, 'diamond'),
(2170, 503, 107, 0, 0, 0, 1000, 4, '2.25', '', 0, 'gemstone'),
(2171, 503, 100, 0, 0, 0, 300, 2, '8.65', '', 0, 'pearls'),
(2172, 496, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2173, 496, 0, 12, 23, 22, 51000, 490, '2.78', '', 0, 'diamond'),
(2174, 496, 107, 0, 0, 0, 6000, 6, '2.35', '', 0, 'gemstone'),
(2190, 395, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2191, 395, 0, 12, 23, 22, 51000, 176, '3.72', '', 0, 'diamond'),
(2192, 395, 107, 0, 0, 0, 3000, 6, '1.53', '', 0, 'gemstone'),
(2193, 394, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2194, 394, 0, 12, 23, 22, 51000, 261, '5.51', '', 0, 'diamond'),
(2195, 394, 107, 0, 0, 0, 3000, 4, '1.22', '', 0, 'gemstone'),
(2196, 576, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2197, 576, 0, 12, 23, 22, 51000, 354, '2.79', '', 0, 'diamond'),
(2198, 576, 107, 0, 0, 0, 1000, 2, '1.08', '', 0, 'gemstone'),
(2199, 576, 100, 0, 0, 0, 300, 2, '12.15', '', 0, 'pearls'),
(2200, 574, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2201, 574, 0, 12, 23, 22, 51000, 154, '1.37', '', 0, 'diamond'),
(2202, 574, 100, 0, 0, 0, 300, 2, '8.8699999999999', '', 0, 'pearls'),
(2203, 571, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2204, 571, 0, 12, 23, 22, 51000, 176, '1.71', '', 0, 'diamond'),
(2205, 745, 0, 3, 114, 0, 0, 0, '0', '0', 0, 'material'),
(2206, 745, 0, 12, 23, 22, 51000, 197, '0.86', '', 0, 'diamond');

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
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `from_price` varchar(100) DEFAULT NULL,
  `to_price` varchar(100) DEFAULT NULL,
  `charges` float DEFAULT NULL,
  `is_enable` enum('enable','disable') NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_charges`
--

INSERT INTO `shipping_charges` (`id`, `slug`, `from_price`, `to_price`, `charges`, `is_enable`) VALUES
(2, 'handling_charges', NULL, NULL, 2000, 'enable'),
(3, 'shipping_charge_1', '0', '100000', 1500, 'enable'),
(4, 'shipping_charge_2', '100001', '1000000', 0, 'enable');

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
  `comments_date` datetime NOT NULL DEFAULT current_timestamp(),
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
  `sub_product_type` varchar(100) NOT NULL,
  `is_make_an_order` char(10) NOT NULL,
  `provision_for_opening` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `purity_kt` varchar(100) NOT NULL,
  `metal_types` varchar(100) NOT NULL,
  `polish_details` varchar(100) NOT NULL,
  `widthmm` float NOT NULL,
  `lengthmm` float NOT NULL,
  `heightmm` float NOT NULL,
  `chain_length` float NOT NULL,
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
  `polki_1` varchar(100) NOT NULL,
  `polki_quantity_1` varchar(100) NOT NULL,
  `polki_weight_1` varchar(100) NOT NULL,
  `polki_rate_1` varchar(100) NOT NULL,
  `polki_2` varchar(100) NOT NULL,
  `polki_quantity_2` varchar(100) NOT NULL,
  `polki_weight_2` varchar(100) NOT NULL,
  `polki_rate_2` varchar(100) NOT NULL,
  `polki_3` varchar(100) NOT NULL,
  `polki_quantity_3` varchar(100) NOT NULL,
  `polki_weight_3` varchar(100) NOT NULL,
  `polki_rate_3` varchar(100) NOT NULL,
  `polki_4` varchar(100) NOT NULL,
  `polki_quantity_4` varchar(100) NOT NULL,
  `polki_weight_4` varchar(100) NOT NULL,
  `polki_rate_4` varchar(100) NOT NULL,
  `polki_5` varchar(100) NOT NULL,
  `polki_quantity_5` varchar(100) NOT NULL,
  `polki_weight_5` varchar(100) NOT NULL,
  `polki_rate_5` varchar(100) NOT NULL,
  `beads_1` varchar(100) NOT NULL,
  `beads_quantity_1` varchar(100) NOT NULL,
  `beads_weight_1` varchar(100) NOT NULL,
  `beads_rate_1` varchar(100) NOT NULL,
  `beads_2` varchar(100) NOT NULL,
  `beads_quantity_2` varchar(100) NOT NULL,
  `beads_weight_2` varchar(100) NOT NULL,
  `beads_rate_2` varchar(100) NOT NULL,
  `beads_3` varchar(100) NOT NULL,
  `beads_quantity_3` varchar(100) NOT NULL,
  `beads_weight_3` varchar(100) NOT NULL,
  `beads_rate_3` varchar(100) NOT NULL,
  `beads_4` varchar(100) NOT NULL,
  `beads_quantity_4` varchar(100) NOT NULL,
  `beads_weight_4` varchar(100) NOT NULL,
  `beads_rate_4` varchar(100) NOT NULL,
  `beads_5` varchar(100) NOT NULL,
  `beads_quantity_5` varchar(100) NOT NULL,
  `beads_weight_5` varchar(100) NOT NULL,
  `beads_rate_5` varchar(100) NOT NULL,
  `other_1` varchar(100) NOT NULL,
  `other_quantity_1` varchar(100) NOT NULL,
  `other_weight_1` varchar(100) NOT NULL,
  `other_rate_1` varchar(100) NOT NULL,
  `other_2` varchar(100) NOT NULL,
  `other_quantity_2` varchar(100) NOT NULL,
  `other_weight_2` varchar(100) NOT NULL,
  `other_rate_2` varchar(100) NOT NULL,
  `other_3` varchar(100) NOT NULL,
  `other_quantity_3` varchar(100) NOT NULL,
  `other_weight_3` varchar(100) NOT NULL,
  `other_rate_3` varchar(100) NOT NULL,
  `other_4` varchar(100) NOT NULL,
  `other_quantity_4` varchar(100) NOT NULL,
  `other_weight_4` varchar(100) NOT NULL,
  `other_rate_4` varchar(100) NOT NULL,
  `other_5` varchar(100) NOT NULL,
  `other_quantity_5` varchar(100) NOT NULL,
  `other_weight_5` varchar(100) NOT NULL,
  `other_rate_5` varchar(100) NOT NULL,
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

INSERT INTO `temp_product_import_table` (`ID`, `is_error`, `category_name`, `sub_category_name`, `no_of_pieces`, `product_code`, `product_name`, `product_description`, `gender`, `stock`, `material`, `gross_weight`, `net_weight`, `product_type`, `sub_product_type`, `is_make_an_order`, `provision_for_opening`, `size`, `purity_kt`, `metal_types`, `polish_details`, `widthmm`, `lengthmm`, `heightmm`, `chain_length`, `making_charges`, `making_charges_unit`, `making_charges_on_gross_weightnet_weight`, `discount_percentage`, `diamond_color_purity_1`, `diamond_shape_1`, `no_of_diamonds_1`, `certified_by_1`, `diamond_weight_1`, `diamond_rate_1`, `diamond_color_purity_2`, `diamond_shape_2`, `no_of_diamonds_2`, `certified_by_2`, `diamond_weight_2`, `diamond_rate_2`, `diamond_color_purity_3`, `diamond_shape_3`, `no_of_diamonds_3`, `certified_by_3`, `diamond_weight_3`, `diamond_rate_3`, `diamond_color_purity_4`, `diamond_shape_4`, `no_of_diamonds_4`, `certified_by_4`, `diamond_weight_4`, `diamond_rate_4`, `diamond_color_purity_5`, `diamond_shape_5`, `no_of_diamonds_5`, `certified_by_5`, `diamond_weight_5`, `diamond_rate_5`, `gemstone_type_1`, `gemstone_quantity_1`, `gemstone_weight_1`, `gemstone_rate_1`, `gemstone_type_2`, `gemstone_quantity_2`, `gemstone_weight_2`, `gemstone_rate_2`, `gemstone_type_3`, `gemstone_quantity_3`, `gemstone_weight_3`, `gemstone_rate_3`, `gemstone_type_4`, `gemstone_quantity_4`, `gemstone_weight_4`, `gemstone_rate_4`, `gemstone_type_5`, `gemstone_quantity_5`, `gemstone_weight_5`, `gemstone_rate_5`, `pearls_1`, `pearls_quantity_1`, `pearl_weight_1`, `pearls_rate_1`, `pearls_2`, `pearls_quantity_2`, `pearl_weight_2`, `pearls_rate_2`, `pearls_3`, `pearls_quantity_3`, `pearl_weight_3`, `pearls_rate_3`, `pearls_4`, `pearls_quantity_4`, `pearl_weight_4`, `pearls_rate_4`, `pearls_5`, `pearls_quantity_5`, `pearl_weight_5`, `pearls_rate_5`, `polki_1`, `polki_quantity_1`, `polki_weight_1`, `polki_rate_1`, `polki_2`, `polki_quantity_2`, `polki_weight_2`, `polki_rate_2`, `polki_3`, `polki_quantity_3`, `polki_weight_3`, `polki_rate_3`, `polki_4`, `polki_quantity_4`, `polki_weight_4`, `polki_rate_4`, `polki_5`, `polki_quantity_5`, `polki_weight_5`, `polki_rate_5`, `beads_1`, `beads_quantity_1`, `beads_weight_1`, `beads_rate_1`, `beads_2`, `beads_quantity_2`, `beads_weight_2`, `beads_rate_2`, `beads_3`, `beads_quantity_3`, `beads_weight_3`, `beads_rate_3`, `beads_4`, `beads_quantity_4`, `beads_weight_4`, `beads_rate_4`, `beads_5`, `beads_quantity_5`, `beads_weight_5`, `beads_rate_5`, `other_1`, `other_quantity_1`, `other_weight_1`, `other_rate_1`, `other_2`, `other_quantity_2`, `other_weight_2`, `other_rate_2`, `other_3`, `other_quantity_3`, `other_weight_3`, `other_rate_3`, `other_4`, `other_quantity_4`, `other_weight_4`, `other_rate_4`, `other_5`, `other_quantity_5`, `other_weight_5`, `other_rate_5`, `mrp_price`, `actual_price`, `collection`, `special_notes`, `screw_type`, `certificate_number`, `mould_availability`, `cad_availability`) VALUES
(88, '<ol><li>This OptionName [EM  Beads] does not exist.</li></ol>', 'Necklace', 'Diamond Necklace', '1', 'NZN 4', '', 'Diamond Necklace', 'Female', '1', 'Gold ', 47.12, 31.462, '', '', '', 'YES', '', '18', 'White Gold', 'White Gold', 2.118, 0, 38, 28, '1375', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '1', '', '7.33', '42000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Colour stone', '1', '7.62', '15000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'EM  Beads', '1', '63.34', '900', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '184345.6', '', '', '', '', '', ''),
(102, '<ol><li>This purity (Kt) [22/18 Kt] does not exist.</li></ol>', 'Chain ', 'Diamond Chain', '1', 'NDC 1', '', 'Diamond Chain', 'Female', '1', 'Gold ', 33.97, 33.77, '', '', '', 'YES', '', '22/18', 'yellow gold', 'yellow gold', 5.1, 52.1, 0, 23, '760', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '56', 'IGI', '1', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '180483.8', '', '', '', '', '', ''),
(103, '<ol><li>This category [Blackbeads ] does not exist.</li><li>This sub category [Blackbeads ] does not exist.</li><li>This purity (Kt) [22/18 Kt] does not exist.</li></ol>', 'Blackbeads ', 'Blackbeads ', '1', 'NDC 3', '', 'Dia Black beads Chain', 'Female', '1', 'Gold ', 11.424, 8.7, '', '', '', 'YES', '', '22/18', 'yellow gold', 'yellow gold', 10.4, 10.4, 0, 26, '860', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '1', 'IGI', '1.26', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Diamond beads', '309', '12.36', '3000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '49670.64', '', '', '', '13J240871902', '', ''),
(104, '<ol><li>This category [Blackbeads ] does not exist.</li><li>This sub category [Blackbeads ] does not exist.</li><li>This purity (Kt) [22/18 Kt] does not exist.</li></ol>', 'Blackbeads ', 'Blackbeads ', '1', 'NDC 4', '', 'Dia Black beads Chain', 'Female', '1', 'Gold ', 19.52, 13.308, '', '', '', 'YES', '', '22/18', 'yellow gold', 'yellow gold', 28.8, 36.7, 0, 16, '860', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '1', 'IGI', '0.97', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Coral', '1', '4.98', '3000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Diamond beads', '279', '25.11', '3000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '77737.84', '', '', '', '15J793761903', '', ''),
(105, '<ol><li>Product code is not valid.</li><li>This purity (Kt) [22/18 Kt] does not exist.</li></ol>', 'Chain ', 'Diamond Chain', '1', 'NVC 4, NGC 127', '', 'Diamond Chain', 'Female', '1', 'Gold ', 33.17, 33.026, '', '', '', 'YES', '', '22/18', 'yellow gold', 'yellow gold', 5.3, 34, 0, 24, '875/446', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '74', 'IGI', '0.72', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '180282.83', '', '', '', '31J789431910', '', ''),
(106, '<ol><li>This category [Mati] does not exist.</li><li>This sub category [Diamond Mati] does not exist.</li></ol>', 'Mati', 'Diamond Mati', '1', 'NVM 2', '', 'Diamond Mati', 'Female', '1', 'Gold ', 14.46, 13.934, '', '', '', 'NO', '', '18', 'yellow gold', 'yellow gold', 19.7, 103.8, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '270', 'IGI', '1.74', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Color stone', '2', '0.89', '1000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '65601.7', '', '', '', '26J055832011', '', ''),
(167, '<ol><li>This OptionName [0.18] does not exist.</li></ol>', 'Rings', 'Cocktail Ring', '1', 'NVR 80', '', 'Cocktail Ring', 'Female', '1', 'Gold ', 10.37, 10.212, '', '', '', 'NO', '16', '18', 'yellow gold', 'yellow gold', 15.6, 15.6, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '10', 'IGI', '0.12', '51000', 'EF-VVS', 'Baguette', '20', 'IGI', '0.45', '42000', 'EF-VVS', 'Round', '1', 'IGI', '0.04', '51000', 'EF-VVS', 'Marquies', '4', '0.18', '58000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '47879.35', '', '', '', '', '', ''),
(242, '<ol><li>This category [Brooches] does not exist.</li><li>This sub category [Diamond Brooches] does not exist.</li><li>This metal color [Yelloe gold] does not exist.</li></ol>', 'Brooches', 'Diamond Brooches', '1', 'NVS 5', '', 'Diamond Brooches', 'Male', '1', 'Gold ', 11.44, 10.908, '', '', '', 'YES', '', '18', 'Yelloe gold', 'Yellow gold', 22.6, 42.8, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '154', 'IGI', '1.36', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Color stone', '3', '1.3', '4000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '51460.4', '', '', '', '30J691991810', '', ''),
(243, '<ol><li>This category [Brooches] does not exist.</li><li>This sub category [Diamond Brooches] does not exist.</li><li>This metal color [Yelloe gold] does not exist.</li></ol>', 'Brooches', 'Diamond Brooches', '1', 'NVS 7', '', 'Diamond Brooches', 'Male', '1', 'Gold ', 8.31, 8.006, '', '', '', 'YES', '', '18', 'Yelloe gold', 'Yellow gold', 42.01, 28.7, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '90', 'IGI', '0.91', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Color stone', '5', '0.61', '4000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '37694.05', '', '', '', '34J617661812', '', ''),
(292, '<ol><li>This OptionName [PERAL-S] does not exist.</li></ol>', 'pendent', 'Diamond pendent', '2', 'NVL 99', '', 'Diamond pendent', 'Female', '1', 'Gold ', 35.35, 27.812, '', '', '', 'YES', '', '18', 'yellow gold', 'yellow gold', 67.39, 67.4, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '526', 'IGI', '5.78', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'COLORSTONE', '2', '5.45', '1000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PERAL-S', '5', '26.46', '300', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '136616.85', '', '', '', '28J119091809', '', ''),
(343, '<ol><li>This metal color [white and yellow gold] does not exist.</li></ol>', 'pendent', 'Diamond pendent', '1', 'NVL 203', '', 'Diamond pendent', 'Female', '1', 'Gold', 26.28, 21.226, '', '', '', 'YES', '', '18', 'white and yellow gold', 'white and yellow gold', 60.6, 81.2, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '271', 'IGI', '4.51', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'EMERALD', '2', '2.36', '6000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PEARL-S', '11', '18.4', '300', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '103653.8', '', '', '', '13J540872002', '', ''),
(362, '<ol><li>This metal color [white and yellow gold] does not exist.</li></ol>', 'pendent', 'Diamond pendent', '1', 'NVL 235', '', 'Diamond pendent', 'Female', '1', 'Gold', 0.7, 0.696, '', '', '', 'NO', '', '18', 'white and yellow gold', 'white and yellow gold', 6.8, 13.2, 0, 0, '3000', 'fix', 'fix', '', 'EF-VVS', 'Round', '1', 'IGI', '0.02', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '4744.8', '', '', '', '20J287622009', '', ''),
(372, '<ol><li>This OptionName [TOURMALINE] does not exist.</li></ol>', 'pendent', 'Diamond pendent', '1', 'NVL 253', '', 'Diamond pendent', 'Male', '1', 'Gold', 17.73, 12.168, '', '', '', 'NO', '', '18', 'yellow gold', 'yellow gold', 17.92, 73.4, 0, 0, '1275', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '171', 'IGI', '0.92', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'TANZANITE', '4', '15.53', '3000', 'TOURMALINE', '2', '11.21', '3000', '', '', '', '', '', '', '', '', '', '', '', '', 'PEARL-S', '1', '0.15', '300', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '68844.15', '', '', '', '', '', ''),
(396, '<ol><li>This OptionName [PERAL-S] does not exist.</li></ol>', 'pendent', 'Diamond pendent', '2', 'NVL 280', '', 'Diamond pendent', 'Female', '1', 'Gold', 23.15, 19.274, '', '', '', 'YES', '', '18', 'yellow gold', 'yellow gold', 38.55, 53.41, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '254', 'IGI', '2.03', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'COLOR STONE', '2', '3.84', '1000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PERAL-S', '5', '13.51', '300', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '93497.45', '', '', '', '', '', ''),
(397, '<ol><li>This OptionName [PERAL-S] does not exist.</li></ol>', 'pendent', 'Diamond pendent', '2', 'NVL 281', '', 'Diamond pendent', 'Female', '1', 'Gold', 20.87, 18.722, '', '', '', 'YES', '', '18', 'yellow gold', 'yellow gold', 42.6, 55.26, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '258', 'IGI', '2.28', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'COLOR STONE', '2', '3.2', '1000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PERAL-S', '1', '5.26', '300', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '89404.85', '', '', '', '', '', ''),
(398, '<ol><li>This OptionName [PERAL-S] does not exist.</li></ol>', 'pendent', 'Diamond pendent', '2', 'NVL 282', '', 'Diamond pendent', 'Female', '1', 'Gold', 12.13, 18.722, '', '', '', 'YES', '', '18', 'yellow gold', 'yellow gold', 27.21, 44.6, 0, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '116', 'IGI', '1.35', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'COLOR STONE', '2', '2.11', '1000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PERAL-S', '1', '5.51', '300', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '81757.35', '', '', '', '26J208442011', '', ''),
(402, '<ol><li>Product code is not valid.</li></ol>', '', '', '', '', '', '', '', '', '', 0, 0, '', '', '', '', '', '', '', '', 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', ''),
(405, '<ol><li>This metal color [Rose gold and yellow gold] does not exist.</li></ol>', 'Earrings', 'Diamond Hangings', '2', 'NVT 6', '', 'Diamond Hangings', 'Female', '1', 'Gold', 20.45, 19.764, '', '', '', 'YES', '', '18', 'Rose gold and yellow gold', 'Rose gold and yellow gold', 26.7, 42.4, 18.9, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '506', 'IGI', '2.84', '51000', 'EF-VVS', 'PEAR', '22', 'IGI', '0.59', '65000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '92996.95', '', '', 'Push', '17J771641705', '', ''),
(452, '<ol><li>This OptionName [0.9] does not exist.</li></ol>', 'Earrings', 'Diamond Hangings', '2', 'NVT 227', '', 'Diamond Hangings', 'Female', '1', 'Gold', 23.79, 21.874, '', '', '', 'YES', '', '18', 'Yellow gold', 'Yellow gold', 21, 47.3, 18.9, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '304', 'IGI', '2.84', '51000', 'EF-VVS', 'BAGUETTE', '62', '0.9', 'I', '42000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'COLOR STONE', '4', '5.84', '1000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '103937.45', '', '', 'Bombay Screw', '25J256081808', '', ''),
(518, '<ol><li>This OptionName [Marquies/pear/Baguette] does not exist.</li></ol>', 'Earrings', 'Diamond Hangings', '2', 'NZT 1', '', 'Diamond Hangings', 'Female', '1', 'Gold', 24.35, 22.796, '', '', '', 'YES', '', '18', 'white gold', 'white gold', 20.8, 45.2, 18.7, 0, '1975', 'per gram', 'Gross weight', '', '', 'Round', '49', '', '0.48', '38000', '', 'Marquies/pear/Baguette', '76', '', '2.65', '56000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Ruby', '122', '4.12', '8000', 'Emerald', '2', '0.52', '15000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '134716.05', '', '', 'Push', '', '', ''),
(519, '<ol><li>This OptionName [Pear/Baguette] does not exist.</li></ol>', 'Earrings', 'Diamond Hangings', '2', 'NZT 2', '', 'Diamond Hangings', 'Female', '1', 'Gold', 23.26, 18.814, '', '', '', 'YES', '', '18', 'White gold/Rose gold', 'White gold/Rose gold', 10.9, 53.6, 16.8, 0, '1975', 'per gram', 'Gross weight', '', '', 'Round', '204', '', '2.05', '56000', '', 'Pear/Baguette', '12', '', '0.31', '38000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Ruby', '28', '3.2', '8000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PEARL-S', '2', '16.67', '600', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '117431.7', '', '', 'Clip', '', '', ''),
(520, '<ol><li>This OptionName [Pear/Baguette] does not exist.</li></ol>', 'Earrings', 'Diamond Hangings', '2', 'NZT 3', '', 'Diamond Hangings', 'Female', '1', 'Gold', 24.81, 16.81, '', '', '', 'YES', '', '18', 'White gold/yellow gold', 'White gold/yellow gold', 27.08, 40.8, 15.7, 0, '1975', 'per gram', 'Gross weight', '', '', 'Round', '34', '', '0.87', '38000', '', 'Pear/Baguette', '100', '', '2.15', '56000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Ruby', '92', '2.28', '8000', 'ruby', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PEARL-S', '2', '34.7', '600', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '112877.75', '', '', 'Clip', '', '', ''),
(527, '<ol><li>This OptionName [Tanza Beads] does not exist.</li></ol>', 'Earrings', 'Diamond Hangings', '2', 'NZT 14', '', 'Diamond Hangings', 'Female', '1', 'Gold', 23.5, 13.34, '', '', '', 'YES', '', '18', 'white gold', 'white gold', 16.7, 82, 11, 0, '1375', 'per gram', 'Gross weight', '', '', 'Round', '1', '', '2.95', '42000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'COLOR STONE', '1', '1.09', '15000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PEARL-S', '1', '34.56', '400', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Tanza Beads', '1', '12.2', '1500', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '83004.5', '', '', 'Clip', '', '', ''),
(798, '', 'Earrings', 'studs', '2', 'NZT 22', '', 'studs', 'Female', '1', 'Gold', 9.16, 8.71, '', '', '', 'YES', '', '18', 'Rose gold', 'Rose gold', 17, 17, 18.3, 0, '1375', 'Per gram', 'Gross weight', '', 'EF-VVS', 'Round', '110', 'IGI', '1.01', '51000', 'EF-VVS', 'marquies', '8', 'IGI', '0.36', '68000', 'EF-VVS', 'marquies', '8', 'IGI', '0.79', '85000', 'EF-VVS', 'Princess', '2', 'IGI', '0.09', '68000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '45693', '', '', 'Bombay Screw', '27J099651809', '', '');

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
  `UserLastLoginDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserEmailVerified` tinyint(1) NOT NULL DEFAULT 1,
  `UserRegistrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserVerificationCode` varchar(20) NOT NULL,
  `UserVerificationDate` timestamp NOT NULL DEFAULT current_timestamp(),
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
(3, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju Vangapandu', '', '', '223.196.172.199', '2021-03-16 17:22:25', 1, '2020-09-03 07:58:57', '', '2020-09-03 07:58:57', '', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'venkat@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Venkat Yadav', '', '', '', '2020-09-03 09:15:37', 1, '2020-09-03 09:15:37', '', '2020-09-03 09:15:37', '', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'venkatyadav.1986@gmail.com', '', 'Venkat Yadav', '', '', '', '2020-09-29 01:00:05', 1, '2020-09-29 01:00:05', '', '2020-09-29 01:00:05', '', NULL, NULL, NULL, NULL, NULL, NULL, 2147483647),
(6, 'test@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'male', '', '2020-09-29 05:11:24', 1, '2020-09-29 05:11:24', '', '2020-09-29 05:11:24', '', '::1', NULL, '', NULL, NULL, NULL, 0),
(7, 'jayarajuv5@gmail.com', '', 'Jayaraju Vangapandu', '', '', '', '2020-09-30 03:10:44', 1, '2020-09-30 03:10:44', '', '2020-09-30 03:10:44', '', NULL, NULL, NULL, NULL, NULL, NULL, 2147483647),
(8, 'jayaraju@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'male', '', '2020-09-30 03:29:59', 1, '2020-09-30 03:29:59', '', '2020-09-30 03:29:59', '', '::1', NULL, NULL, NULL, NULL, NULL, 0),
(9, 'rkumar.more@gmail.com', '', 'Raj More', '', '', '', '2020-10-06 04:04:51', 1, '2020-10-06 04:04:51', '', '2020-10-06 04:04:51', '', NULL, NULL, NULL, NULL, NULL, NULL, 2147483647),
(10, 'harish.babu@deepredink.com', '', 'Harish', '', '', '', '2020-11-26 09:11:43', 1, '2020-11-26 09:11:43', '', '2020-11-26 09:11:43', '', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'shanthi@whitethoughts.in', '', 'Shanthirmayee Ragam', '', '', '', '2021-03-15 12:36:54', 1, '2021-03-15 12:36:54', '', '2021-03-15 12:36:54', '', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 'ranjith@deepredink.com', '', 'Ranjith Ramanujam', '', 'male', '', '2021-03-16 15:35:27', 1, '2021-03-16 15:35:27', '', '2021-03-16 15:35:27', '', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `WishlistID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `custom_attributes`
--
ALTER TABLE `custom_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_price`
--
ALTER TABLE `material_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_type_id` (`material_type_id`),
  ADD KEY `metal_color_id` (`metal_color_id`),
  ADD KEY `metal_clar_pur_id` (`metal_clar_purity`);

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
-- Indexes for table `order_status_log`
--
ALTER TABLE `order_status_log`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
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
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `available_locations`
--
ALTER TABLE `available_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_master`
--
ALTER TABLE `cart_master`
  MODIFY `OrderlD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `CouponID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_attributes`
--
ALTER TABLE `custom_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `material_price`
--
ALTER TABLE `material_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `material_type`
--
ALTER TABLE `material_type`
  MODIFY `MaterialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `m_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2145;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `options_group`
--
ALTER TABLE `options_group`
  MODIFY `OptionGroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderlD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_gift_messages`
--
ALTER TABLE `order_gift_messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_status_log`
--
ALTER TABLE `order_status_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productoptions`
--
ALTER TABLE `productoptions`
  MODIFY `OptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=776;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product_custom_option`
--
ALTER TABLE `product_custom_option`
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `Product_imagesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2207;

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
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `temp_product_import_table`
--
ALTER TABLE `temp_product_import_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=799;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `WishlistID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

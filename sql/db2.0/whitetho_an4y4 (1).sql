-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2021 at 07:50 AM
-- Server version: 10.3.28-MariaDB
-- PHP Version: 7.3.26

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
(1, 4, 'Venkat', 'Bc Colony', '', '', '2021-03-16 06:06:04', 'hyderabad', '500034', 'Telangana', 'india', '9052691535', 'shipping', '', 1),
(2, 4, 'Venkat', 'Bc Colony', '', '', '2021-03-16 06:06:04', 'hyderabad', '500034', 'Telangana', 'india', '9052691535', 'billing', 'on', 1),
(3, 3, 'jayaraju', '102', '', '', '2021-03-16 11:54:45', 'vijayawada', '520004', 'AP', 'India', '9700334319', 'shipping', '', 1),
(4, 3, 'jayaraju', '102', '', '', '2021-03-16 11:54:45', 'vijayawada', '520004', 'AP', 'India', '9700334319', 'billing', 'on', 1),
(5, 12, 'Ranjith', 'FLAT 401, BOPPANA ENCLAVE', 'C-38, MADHURA NAGAR', '', '2021-03-16 15:40:45', 'Hyderabad', '500038', 'Telangana', 'India', '9885047096', 'shipping', '', 1);

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
(1, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju', 'vangapandu', 1, '2020-08-13 08:55:18', '223.196.173.153', '9700334319', 'vijayawada', 1, 'Active', '2021-03-17 11:23:13'),
(2, 'venkat@deepredink.com', 'feb43797d2a30b2472d5f3d7604f8b70', 'venkat', 'Yadav', 1, '2020-08-20 06:18:38', '157.48.154.168', '9872458585', 'sdgfdg', 4, 'Active', '2020-08-31 16:54:10'),
(6, 'whitethoughts@deepredink.com', 'ef0b74627190164d1329920d3f10e8f0', '', '', 1, '2020-08-31 06:16:20', '183.82.104.149', '', '', 1, 'Active', '2021-03-17 09:26:16'),
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
(1, 1, 1, '', 'Kia11', 53115.2, 53115.2, 'NPT 37', 1, 0, '', 53115.2, 53115.2, '', '', 0),
(2, 2, 19, '', 'Kia5', 11271.1, 11271.1, 'NVT 36', 1, 0, '', 11271.1, 11271.1, '', '', 0),
(4, 3, 19, '', 'Kia5', 11271.1, 11271.1, 'NVT 36', 1, 0, '', 11271.1, 11271.1, '', '', 0),
(5, 4, 6, '', 'Kia17', 72047.4, 72047.4, 'NPR 20', 1, 0, '', 72047.4, 72047.4, '', '', 0);

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
(1, '20210316113432', '4', 53115.2, 1500, 2000, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2021-03-16 06:04:32', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Venkat', 'Bc Colony', '', '', 'hyderabad', '500034', 'Telangana', 'india', '9052691535', 'Venkat', 'Bc Colony', '', '', 'hyderabad', '500034', 'Telangana', 'india', '9052691535'),
(2, '20210316172351', '3', 11271.1, 1500, 2000, 'Jayaraju Vangapandu ', '', 0, 0, 'jayaraju@deepredink.com', '2021-03-16 11:53:51', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'jayaraju', '102', '', '', 'vijayawada', '520004', 'AP', 'India', '9700334319', 'jayaraju', '102', '', '', 'vijayawada', '520004', 'AP', 'India', '9700334319'),
(3, '20210316204435', '12', 11271.1, 1500, 2000, 'Ranjith Ramanujam ', '', 0, 0, 'ranjith@deepredink.com', '2021-03-16 15:14:35', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', 'Ranjith', 'FLAT 401, BOPPANA ENCLAVE', 'C-38, MADHURA NAGAR', '', 'Hyderabad', '500038', 'Telangana', 'India', '9885047096'),
(4, '20210317072633', '4', 72047.4, 1500, 2000, '', '', 0, 0, '', '2021-03-17 01:56:33', 0, '', '', '0000-00-00 00:00:00', 'on Hold', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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
(1441, 3, 0, 'Jbn Exclusive', '', '1', '', '2021-03-16 03:10:42'),
(1442, 3, 1441, 'Gold', '', '1', '', '2021-03-16 03:10:42'),
(1443, 3, 1442, 'Men', '', '1', '', '2021-03-16 03:10:42'),
(1444, 3, 1443, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-03-16 03:10:42'),
(1445, 3, 1443, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains', '1', '', '2021-03-16 03:10:42'),
(1446, 3, 1443, 'Bracelets', 'https://whitethoughtsdemos.com/anaya/products/category/bracelets', '1', '', '2021-03-16 03:10:42'),
(1447, 3, 1442, 'women', '', '1', '', '2021-03-16 03:10:42'),
(1448, 3, 1447, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings/', '1', '', '2021-03-16 03:10:42'),
(1449, 3, 1447, 'Nose Pins', 'https://whitethoughtsdemos.com/anaya/products/category/nose-pins/gold/women/jbn', '1', '', '2021-03-16 03:10:42'),
(1450, 3, 1447, 'chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains', '1', '', '2021-03-16 03:10:42'),
(1451, 3, 1441, 'Diamonds', '', '1', '', '2021-03-16 03:10:42'),
(1452, 3, 1451, 'Men', '', '1', '', '2021-03-16 03:10:42'),
(1453, 3, 1452, 'Chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains', '1', '', '2021-03-16 03:10:42'),
(1454, 3, 1452, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-03-16 03:10:42'),
(1455, 3, 1452, 'solitairs', 'https://whitethoughtsdemos.com/anaya/products/category/solitairs', '1', '', '2021-03-16 03:10:42'),
(1456, 3, 1451, 'Women', '', '1', '', '2021-03-16 03:10:42'),
(1457, 3, 1456, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-03-16 03:10:42'),
(1458, 3, 1456, 'Earings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings', '1', '', '2021-03-16 03:10:42'),
(1459, 3, 1456, 'bangles', 'https://whitethoughtsdemos.com/anaya/products/category/bangles', '1', '', '2021-03-16 03:10:42'),
(1460, 3, 1456, 'tops', 'https://whitethoughtsdemos.com/anaya/products/category/tops', '1', '', '2021-03-16 03:10:42'),
(1461, 3, 1456, 'pendents', 'https://whitethoughtsdemos.com/anaya/products/category/pendents/', '1', '', '2021-03-16 03:10:42'),
(1462, 3, 1456, 'necklaces', 'https://whitethoughtsdemos.com/anaya/products/category/necklaces/', '1', '', '2021-03-16 03:10:42'),
(1463, 3, 1456, 'chains', 'https://whitethoughtsdemos.com/anaya/products/category/chains/', '1', '', '2021-03-16 03:10:42'),
(1464, 3, 1441, 'Polki', '', '1', '', '2021-03-16 03:10:42'),
(1465, 3, 1464, 'Men', '', '1', '', '2021-03-16 03:10:42'),
(1466, 3, 1465, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-03-16 03:10:42'),
(1467, 3, 1464, 'Women', '', '1', '', '2021-03-16 03:10:42'),
(1468, 3, 1467, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-03-16 03:10:42'),
(1469, 3, 1467, 'Rings', 'https://whitethoughtsdemos.com/anaya/products/category/rings', '1', '', '2021-03-16 03:10:42'),
(1470, 3, 1467, 'Necklaces', 'https://whitethoughtsdemos.com/anaya/products/category/necklaces/', '1', '', '2021-03-16 03:10:42'),
(1471, 3, 1467, 'Pendent', 'https://whitethoughtsdemos.com/anaya/products/category/pendent', '1', '', '2021-03-16 03:10:42'),
(1472, 3, 1467, 'Bangles', 'https://whitethoughtsdemos.com/anaya/products/category/bangles', '1', '', '2021-03-16 03:10:42'),
(1473, 3, 0, 'Anaya', '', '1', '', '2021-03-16 03:10:42'),
(1474, 3, 1473, 'Gold', '', '1', '', '2021-03-16 03:10:42'),
(1475, 3, 1474, 'Men', '', '1', '', '2021-03-16 03:10:42'),
(1476, 3, 1474, 'Women', '', '1', '', '2021-03-16 03:10:42'),
(1477, 3, 1476, 'Bangle', 'https://whitethoughtsdemos.com/anaya/products/category/Bangle/', '1', '', '2021-03-16 03:10:42'),
(1478, 3, 1476, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/', '1', '', '2021-03-16 03:10:42'),
(1479, 3, 1476, 'Necklace', 'https://whitethoughtsdemos.com/anaya/products/category/necklace', '1', '', '2021-03-16 03:10:42'),
(1480, 3, 1476, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring', '1', '', '2021-03-16 03:10:42'),
(1481, 3, 1476, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-03-16 03:10:42'),
(1482, 3, 1473, 'Diamonds', '', '1', '', '2021-03-16 03:10:42'),
(1483, 3, 1482, 'Men', 'Women', '1', '', '2021-03-16 03:10:42'),
(1484, 3, 1483, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/Bangle/', '1', '', '2021-03-16 03:10:42'),
(1485, 3, 1483, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-03-16 03:10:42'),
(1486, 3, 1482, 'Women', '', '1', '', '2021-03-16 03:10:42'),
(1487, 3, 1486, 'Bangle', 'https://whitethoughtsdemos.com/anaya/products/category/Bangle/', '1', '', '2021-03-16 03:10:42'),
(1488, 3, 1486, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/', '1', '', '2021-03-16 03:10:42'),
(1489, 3, 1486, 'Pendent', 'https://whitethoughtsdemos.com/anaya/products/category/pendent/', '1', '', '2021-03-16 03:10:42'),
(1490, 3, 1486, 'Necklace', 'https://whitethoughtsdemos.com/anaya/products/category/necklace/', '1', '', '2021-03-16 03:10:42'),
(1491, 3, 1486, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-03-16 03:10:42'),
(1492, 3, 1486, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-03-16 03:10:42'),
(1493, 3, 1473, 'Polki', '', '1', '', '2021-03-16 03:10:42'),
(1494, 3, 1493, 'Men', '', '1', '', '2021-03-16 03:10:42'),
(1495, 3, 1494, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-03-16 03:10:42'),
(1496, 3, 1494, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/', '1', '', '2021-03-16 03:10:42'),
(1497, 3, 1493, 'Women', '', '1', '', '2021-03-16 03:10:42'),
(1498, 3, 1497, 'Bangle', 'https://whitethoughtsdemos.com/anaya/products/category/bangle/', '1', '', '2021-03-16 03:10:42'),
(1499, 3, 1497, 'Bracelet', 'https://whitethoughtsdemos.com/anaya/products/category/bracelet/polki/women', '1', '', '2021-03-16 03:10:42'),
(1500, 3, 1497, 'Pendent', 'https://whitethoughtsdemos.com/anaya/products/category/pendent/', '1', '', '2021-03-16 03:10:42'),
(1501, 3, 1497, 'Necklace', 'https://whitethoughtsdemos.com/anaya/products/category/necklace/', '1', '', '2021-03-16 03:10:42'),
(1502, 3, 1497, 'Ring', 'https://whitethoughtsdemos.com/anaya/products/category/ring/', '1', '', '2021-03-16 03:10:42'),
(1503, 3, 1497, 'Earrings', 'https://whitethoughtsdemos.com/anaya/products/category/earrings/', '1', '', '2021-03-16 03:10:42'),
(1504, 3, 0, 'Solitaires', '#', '1', '', '2021-03-16 03:10:42'),
(1505, 3, 1504, 'Gold', '#', '1', '', '2021-03-16 03:10:42'),
(1506, 3, 1505, 'Men', '#', '1', '', '2021-03-16 03:10:42'),
(1507, 3, 1505, 'Women', '', '1', '', '2021-03-16 03:10:42'),
(1508, 3, 1504, 'Diamonds', '#', '1', '', '2021-03-16 03:10:42'),
(1509, 3, 1508, 'Men', '#', '1', '', '2021-03-16 03:10:42'),
(1510, 3, 1508, 'Women', '#', '1', '', '2021-03-16 03:10:42');

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
  `shipping_Mobile` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderlD`, `UserlD`, `CartID`, `PaymentID`, `Order_Number`, `CouponID`, `OrderAmount`, `Shipping_Charges_Amount`, `Handling_Charges_Amount`, `OrderShipName`, `OrderPhone`, `OrderShipping`, `OrderTax`, `OrderEmall`, `OrderDate`, `OrderShipped`, `OrderTrackingNumber`, `Delivery_Mode`, `DeliveryDate`, `Order_status`, `billing_Fullname`, `billing_Address1`, `billing_Address2`, `billing_LandMark`, `billing_City`, `billing_Pincode`, `billing_State`, `billing_Country`, `billing_Mobile`, `shipping_Fullname`, `shipping_Address1`, `shipping_Address2`, `shipping_LandMark`, `shipping_City`, `shipping_Pincode`, `shipping_State`, `shipping_Country`, `shipping_Mobile`) VALUES
(1, 4, 1, 'pay_GnDio4YOvGY0aa', '20210316113432', 0, 53115.2, 1500, 2000, 'Venkat Yadav ', '', 0, 0, 'venkat@deepredink.com', '2021-03-16 06:04:32', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'Venkat', 'Bc Colony', '', '', 'hyderabad', '500034', 'Telangana', 'india', '9052691535', 'Venkat', 'Bc Colony', '', '', 'hyderabad', '500034', 'Telangana', 'india', '9052691535'),
(2, 3, 2, 'pay_GnJfO79VXwdEbs', '20210316172351', 0, 11271.1, 1500, 2000, 'Jayaraju Vangapandu ', '', 0, 0, 'jayaraju@deepredink.com', '2021-03-16 11:53:51', 0, '', 'delivery_at_address', '0000-00-00 00:00:00', 'placed', 'jayaraju', '102', '', '', 'vijayawada', '520004', 'AP', 'India', '9700334319', 'jayaraju', '102', '', '', 'vijayawada', '520004', 'AP', 'India', '9700334319');

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
(1, 1, '', '', 1, 'Kia11', 53115.2, 53115.2, 'NPT 37', 1, 0, '', 53115.2, 53115.2, '', 0),
(2, 2, '', '', 19, 'Kia5', 11271.1, 11271.1, 'NVT 36', 1, 0, '', 11271.1, 11271.1, '', 0);

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
(12, 'Insurance policy', 'insurance', 'insurance-policy', '<p> </p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'insurance', '', 0);

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
(1, 'pay_GnDio4YOvGY0aa', 4, 0, '20210316113432', 0, '0', 1615874776, 'Venkat Yadav ', 'test@gmail.com', '+919052691535', 56615.2, '2021-03-16 11:36:21', 'INR', '1615874764', 'authorized', '', '157.48.161.154', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_GnDio4YOvGY0aa\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":409,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":1.313728999999999924597204881138168275356292724609375,\"namelookup_time\":0.02286799999999999943867123874952085316181182861328125,\"connect_time\":0.2199190000000000033697489243422751314938068389892578125,\"pretransfer_time\":0.8764739999999999753299562144093215465545654296875,\"size_upload\":0,\"size_download\":633,\"speed_download\":482,\"speed_upload\":0,\"download_content_length\":633,\"upload_content_length\":0,\"starttransfer_time\":1.3136479999999999268567307808552868664264678955078125,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"15.207.141.186\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":41102,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":876387,\"connect_time_us\":219919,\"namelookup_time_us\":22868,\"pretransfer_time_us\":876474,\"redirect_time_us\":0,\"starttransfer_time_us\":1313648,\"total_time_us\":1313729,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_GnDio4YOvGY0aa\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":5661520,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20210316113432\\\",\\\"card_id\\\":\\\"card_GnDio8FfXXC7lv\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"test@gmail.com\\\",\\\"contact\\\":\\\"+919052691535\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20210316113432\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"972506\\\"},\\\"created_at\\\":1615874776}\"}', 'payment', '0', '2021-03-16 11:36:21', '', 'Purchase Order # 20210316113432', 'true', 56615.2),
(2, 'pay_GnJfO79VXwdEbs', 3, 0, '20210316172351', 0, '0', 1615895711, 'Jayaraju Vangapandu ', 'jayaraju@deepredink.com', '+919700334319', 14771.1, '2021-03-16 05:25:16', 'INR', '1615895685', 'authorized', '', '223.196.169.32', '0', '{\"url\":\"https:\\/\\/rzp_test_G92xYDmMuRSOQ5:WyVPOHfqObiGC54AR5ldmFVc@api.razorpay.com\\/v1\\/payments\\/pay_GnJfO79VXwdEbs\",\"content_type\":\"application\\/json\",\"http_code\":200,\"header_size\":409,\"request_size\":228,\"filetime\":-1,\"ssl_verify_result\":0,\"redirect_count\":0,\"total_time\":0.94442499999999995896615700985421426594257354736328125,\"namelookup_time\":0.0310460000000000006792344464656707714311778545379638671875,\"connect_time\":0.22613600000000000367350594387971796095371246337890625,\"pretransfer_time\":0.627901000000000042433612179593183100223541259765625,\"size_upload\":0,\"size_download\":642,\"speed_download\":680,\"speed_upload\":0,\"download_content_length\":642,\"upload_content_length\":0,\"starttransfer_time\":0.9443479999999999652260385119006969034671783447265625,\"redirect_time\":0,\"redirect_url\":\"\",\"primary_ip\":\"3.7.110.154\",\"certinfo\":[],\"primary_port\":443,\"local_ip\":\"205.251.145.13\",\"local_port\":51994,\"http_version\":2,\"protocol\":2,\"ssl_verifyresult\":0,\"scheme\":\"HTTPS\",\"appconnect_time_us\":627811,\"connect_time_us\":226136,\"namelookup_time_us\":31046,\"pretransfer_time_us\":627901,\"redirect_time_us\":0,\"starttransfer_time_us\":944348,\"total_time_us\":944425,\"errno\":0,\"errmsg\":\"\",\"content\":\"{\\\"id\\\":\\\"pay_GnJfO79VXwdEbs\\\",\\\"entity\\\":\\\"payment\\\",\\\"amount\\\":1477110,\\\"currency\\\":\\\"INR\\\",\\\"status\\\":\\\"authorized\\\",\\\"order_id\\\":null,\\\"invoice_id\\\":null,\\\"international\\\":false,\\\"method\\\":\\\"card\\\",\\\"amount_refunded\\\":0,\\\"refund_status\\\":null,\\\"captured\\\":false,\\\"description\\\":\\\"Purchase Order # 20210316172351\\\",\\\"card_id\\\":\\\"card_FjJMDT10uynbS4\\\",\\\"bank\\\":null,\\\"wallet\\\":null,\\\"vpa\\\":null,\\\"email\\\":\\\"jayaraju@deepredink.com\\\",\\\"contact\\\":\\\"+919700334319\\\",\\\"notes\\\":{\\\"soolegal_order_id\\\":\\\"20210316172351\\\"},\\\"fee\\\":null,\\\"tax\\\":null,\\\"error_code\\\":null,\\\"error_description\\\":null,\\\"error_source\\\":null,\\\"error_step\\\":null,\\\"error_reason\\\":null,\\\"acquirer_data\\\":{\\\"auth_code\\\":\\\"600834\\\"},\\\"created_at\\\":1615895711}\"}', 'payment', '0', '2021-03-16 05:25:16', '', 'Purchase Order # 20210316172351', 'true', 14771.1);

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
(99, 7, 'pearls - S');

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
(1, 'NPT 37', 'Kia11', 'kia11', 53115.24, 53115.24, 0, 'gram', 760, 'gross_weight', 0, 17.5, 20.4, 22.5, '', 'Polki Studs', '', '', '', NULL, 22, 23, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Wedding', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 2, 10.24, 9.898, 'Yellow gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(2, 'NPT 261', 'Kia12', 'kia12', 32755.24, 32755.24, 0, 'gram', 760, 'gross_weight', 0, 16.7, 17.9, 6.118, '', 'Polki Studs', '', '', '', NULL, 22, 23, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Bridal Wear', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 2, 6.23, 6.118, 'Yellow gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(3, 'NPT 144', 'Kia13', 'kia13', 87945.25, 87945.25, 0, 'gram', 975, 'gross_weight', 0, 25.1, 23.1, 26.6, '', 'Polki Studs', '', '', '', NULL, 22, 23, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Sisters', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 2, 20.67, 17.84, 'Yellow gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(4, 'NPT 87', 'Kia14', 'kia14', 117342.24, 117342.24, 0, 'gram', 760, 'gross_weight', 0, 23.3, 18.5, 60.8, '', 'Polki Hangings', '', '', '', NULL, 22, 24, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Gifting', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 2, 23.94, 21.648, 'Yellow gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(5, 'NPL 7', 'Kia15', 'kia15', 96678.32, 96678.32, 0, 'gram', 760, 'gross_weight', 0, 39.72, 0, 49.65, '', 'Polki pendent', '', '', '', NULL, 3, 3, '2021-03-16 06:03:19', 1, 1, 'No', 'Women', 'Wedding', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 1, 18.59, 18.024, 'Yellow gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(6, 'NPR 20', 'Kia17', 'kia17', 72047.35, 72047.35, 0, 'gram', 975, 'gross_weight', 0, 31.2, 0, 32.2, '', 'Polki Ring', '', '', '', 'https://www.youtube.com/embed/nceekOd99PA', 7, 27, '2021-03-16 04:22:07', 1, 1, 'No', 'Women', 'Sisters', '2021-03-16 06:03:19', '2021-03-16 04:22:07', '', '', 0, 1, 1, 16.01, 14.852, 'Yellow gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(7, 'NPR 9', 'Kia18', 'kia18', 20052.85, 20052.85, 0, 'gram', 675, 'gross_weight', 0, 23.3, 0, 26.8, '', 'Polki Ring', '', '', '', NULL, 7, 27, '2021-03-16 06:03:19', 1, 1, 'No', 'Women', 'Gifting', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 1, 6.39, 4.142, 'Yellow  gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(8, 'NPN 106', 'Kia21', 'kia21', 195817.55, 195817.55, 0, 'gram', 875, 'gross_weight', 0, 44.2, 0, 56.6, '', 'Coral emerald Necklace', '', '', '', NULL, 6, 6, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Wedding', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 1, 64.73, 36.626, 'Yellow gold', 'jbn', 'polki', 'yes', 16, '', 0, 0, '', '', ''),
(9, 'NPN 128', 'Kia23', 'kia23', 543832.76, 543832.76, 0, 'gram', 760, 'gross_weight', 0, 65.4, 0, 123.9, '', 'Jade emerald beads haram', '', '', '', 'https://www.youtube.com/embed/-pe5tk2ft88', 6, 0, '2021-03-16 04:26:00', 1, 1, 'Yes', 'Women', 'Sisters', '2021-03-16 06:03:19', '2021-03-16 04:26:00', '', '', 0, 1, 1, 194.04, 86.542, 'Yellow gold', 'jbn', 'polki', 'yes', 36, '', 0, 0, '', '', ''),
(10, 'NPN 140', 'Kia24', 'kia24', 375811.22, 375811.22, 0, 'gram', 875, 'gross_weight', 0, 36.8, 0, 35.7, '', 'carved emerald  polki Neckalce', '', '', '', NULL, 6, 6, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Gifting', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 1, 96.42, 63.634, 'Yellow gold', 'jbn', 'polki', 'no', 18, '', 0, 0, '', '', ''),
(11, 'NPN 141', 'Kia25', 'kia25', 397555.84, 397555.84, 0, 'gram', 875, 'gross_weight', 0, 67.7, 0, 61.5, '', 'carved emerald  polki Neckalce', '', '', '', NULL, 6, 6, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Wedding', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 1, 97.12, 68.248, 'Yellow gold', 'jbn', 'polki', 'no', 18, '', 0, 0, '', '', ''),
(12, 'NPN 144', 'Kia26', 'kia26', 195827.95, 195827.95, 0, 'gram', 775, 'gross_weight', 0, 57.9, 0, 82.6, '', 'Craved ganesha necklace', '', '', '', NULL, 6, 6, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Bridal Wear', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 1, 57.13, 33.09, 'Yellow gold', 'jbn', 'polki', 'no', 22, '', 0, 0, '', '', ''),
(13, 'NPN 149', 'Kia27', 'kia27', 124333.55, 124333.55, 0, 'gram', 875, 'gross_weight', 0, 20, 0, 30.6, '', 'ruby necklace', '', '', '', NULL, 6, 6, '2021-03-16 06:03:19', 1, 1, 'Yes', 'Women', 'Sisters', '2021-03-16 06:03:19', '2021-03-16 11:33:19', 'whitethoughts', '157.48.161.154', 0, 1, 1, 34.41, 24.796, 'rodhium polish', 'jbn', 'polki', 'no', 20, '', 0, 0, '', '', ''),
(14, 'NPN 150', 'Kia28', 'kia28', 102960.9, 102960.9, 0, 'gram', 875, 'gross_weight', 0, 30.7, 0, 21.5, '', 'Craved coral  necklace', '', '', '', 'https://www.youtube.com/embed/QRpeLJ-jlN8', 6, 0, '2021-03-16 04:29:11', 1, 1, 'Yes', 'Women', 'Gifting', '2021-03-16 06:03:19', '2021-03-16 04:29:11', '', '', 0, 1, 1, 25.74, 21.168, 'rodhium polish', 'jbn', 'polki', 'no', 21, '', 0, 0, '', '', ''),
(15, 'NPN 156', 'Kia29', 'kia29', 454484.92, 454484.92, 0, 'gram', 760, 'gross_weight', 0, 39.6, 0, 66.9, '', 'Carved bule shapphire necklace ', '', '', '', 'https://www.youtube.com/embed/QRpeLJ-jlN8', 6, 0, '2021-03-16 04:18:31', 1, 1, 'Yes', 'Women', 'Wedding', '2021-03-16 06:03:19', '2021-03-16 04:18:31', '', '', 0, 1, 1, 98.22, 82.934, 'Yellow gold', 'jbn', 'polki', 'no', 20, '', 0, 0, '', '', ''),
(16, 'NVR 69', 'Kia1', 'kia1', 49348.35, 49348.35, 0, 'gram', 1675, 'gross_weight', 0, 3.08, 0, 27.01, '', 'Diamond ring', '', '', '', 'https://www.youtube.com/embed/FNTpk7nV_bw', 7, 27, '2021-03-16 04:20:29', 1, 1, 'No', 'Women', 'Wedding', '2021-03-16 06:03:19', '2021-03-16 04:20:29', '', '', 0, 1, 1, 9.13, 8.962, 'Rose gold and white gold', 'anaya', 'diamond', 'no', 0, '19J560441706', 0, 0, '', '', ''),
(17, 'NVT 2', 'Kia2', 'kia2', 35313.7, 35313.7, 0, 'gram', 875, 'gross_weight', 0, 13.09, 18.4, 34.8, '', 'Diamond hangings', '', '', '', NULL, 22, 24, '2021-03-16 06:03:20', 1, 1, 'Yes', 'Women', 'Anniversary', '2021-03-16 06:03:20', '2021-03-16 11:33:20', 'whitethoughts', '157.48.161.154', 0, 1, 2, 7.9, 7.474, 'Rose gold and white gold', 'anaya', 'diamond', 'no', 0, '34J157401712', 0, 0, '', '', ''),
(18, 'NVT 720', 'Kia4', 'kia4', 32143.6, 32143.6, 0, 'gram', 960, 'gross_weight', 0, 12.3, 12.2, 12.3, '', 'Close settind studs', '', '', '', NULL, 22, 25, '2021-03-16 06:03:20', 1, 1, 'Yes', 'Women', 'Sisters', '2021-03-16 06:03:20', '2021-03-16 11:33:20', 'whitethoughts', '157.48.161.154', 0, 1, 2, 6.97, 6.698, 'Yellow gold', 'anaya', 'diamond', 'no', 0, '16J681572003', 0, 0, '', '', ''),
(19, 'NVT 36', 'Kia5', 'kia5', 11271.1, 11271.1, 0, 'gram', 1105, 'gross_weight', 0, 5.7, 13.01, 17.3, '', 'J bali ', '', '', '', 'https://www.youtube.com/embed/VIYK56mg1mc', 22, 26, '2021-03-16 04:16:09', 1, 1, 'Yes', 'Women', 'Gifting', '2021-03-16 06:03:20', '2021-03-16 04:16:09', '', '', 0, 1, 2, 2.38, 2.274, 'Yellow gold', 'anaya', 'diamond', 'no', 0, '18J454532007', 0, 0, '', '', ''),
(20, 'NVT 118', 'Kia6', 'kia6', 18868.1, 18868.1, 0, 'gram', 1375, 'gross_weight', 0, 9.01, 12.8, 24.6, '', 'Diamond hangings', '', '', '', NULL, 22, 24, '2021-03-16 06:03:20', 1, 1, 'Yes', 'Women', 'Daughters', '2021-03-16 06:03:20', '2021-03-16 11:33:20', 'whitethoughts', '157.48.161.154', 0, 1, 2, 3.74, 3.612, 'white gold', 'anaya', 'diamond', 'no', 0, '19J409342008', 0, 0, '', '', ''),
(21, 'NVR 39', 'Kia7', 'kia7', 10546.4, 10546.4, 0, 'gram', 1160, 'gross_weight', 0, 4.4, 0, 8.3, '', 'Diamond ring', '', '', '', 'https://www.youtube.com/embed/ZQx1-KV4q2w', 7, 0, '2021-03-16 04:19:29', 1, 1, 'No', 'Women', 'Wedding', '2021-03-16 06:03:20', '2021-03-16 04:19:29', '', '', 0, 1, 1, 2.16, 2.116, 'Yellow gold', 'anaya', 'diamond', 'no', 0, '15J576700816', 0, 0, '', '', ''),
(22, 'NVB 104', 'Kia8', 'kia8', 20266.8, 20266.8, 0, 'gram', 1375, 'gross_weight', 0, 21.3, 0, 13.6, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/gGRr5Lij6Xk\"', 2, 0, '2021-03-16 04:23:44', 1, 1, 'Yes', 'Women', 'Anniversary', '2021-03-16 06:03:20', '2021-03-16 04:23:44', '', '', 0, 1, 1, 4, 3.886, 'Rose gold and white gold', 'anaya', 'diamond', 'no', 0, '20J287792009', 0, 0, '', '', ''),
(23, 'NVB 117', 'Kia9', 'kia9', 59508.85, 59508.85, 0, 'gram', 1375, 'gross_weight', 0, 54.8, 0, 8.9, '', 'Diamond Bracelet', '', '', '', 'https://www.youtube.com/embed/lXcHABpP8SE', 2, 0, '2021-03-16 04:21:28', 1, 1, 'Yes', 'Women', 'Birthday', '2021-03-16 06:03:20', '2021-03-16 04:21:28', '', '', 0, 1, 1, 11.63, 11.452, 'Rose gold and white gold', 'anaya', 'diamond', 'no', 0, '20J591402009', 0, 0, '', '', ''),
(24, 'NVN 33', 'Kia10', 'kia10', 80901.15, 80901.15, 0, 'gram', 875, 'gross_weight', 0, 9.8, 0, 35.8, '', 'Diamond Necklace', '', '', '', 'https://www.youtube.com/embed/WealuoAZ1fI', 6, 0, '2021-03-16 04:17:15', 1, 1, 'Yes', 'Women', 'Sisters', '2021-03-16 06:03:20', '2021-03-16 04:17:15', '', '', 0, 1, 1, 17.77, 17.198, 'Yellow gold', 'anaya', 'diamond', 'no', 16, 'I1J120940614', 0, 0, '', '', ''),
(25, 'NPL 23', 'Kia16', 'kia16', 110522.24, 110522.24, 0, 'gram', 760, 'gross_weight', 0, 19.988, 0, 64.81, '', 'Polki pendent', '', '', '', NULL, 3, 3, '2021-03-16 06:18:17', 1, 1, 'No', 'Women', 'Bridal Wear', '2021-03-16 06:18:17', '2021-03-16 11:48:17', 'whitethoughts', '157.48.161.154', 0, 1, 1, 24.97, 19.988, 'Yellow gold', 'anaya', 'polki', 'yes', 0, '', 0, 0, '', '', ''),
(26, 'NPN 29', 'Kia20', 'kia20', 214084.28, 214084.28, 0, 'gram', 760, 'gross_weight', 0, 22.5, 0, 35.1, '', 'polki Necklace', '', '', '', 'https://www.youtube.com/embed/0vpeyqlYZ9A', 6, 0, '2021-03-16 04:12:00', 1, 1, 'Yes', 'Women', 'Anniversary', '2021-03-16 06:18:17', '2021-03-16 04:12:00', '', '', 0, 1, 1, 51.81, 38.146, 'Yellow gold', 'anaya', 'polki', 'yes', 16, '', 0, 0, '', '', '');

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
(1, 'Bangle', 0, '../uploads/categories/bangle.jpg', 'Bangles', 'bangle', 'Bangles', 'Bangles', 'Bangles', 1, '10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25', 'null'),
(2, 'Bracelet', 0, '../uploads/categories/bracelet.jpg', 'Bracelets', 'bracelet', 'Bracelets', 'Bracelets', 'Bracelets', 0, '', NULL),
(3, 'Pendent', 0, '../uploads/categories/pendent.jpg', 'Pendent', 'pendent', 'Pendent', 'Pendent', 'Pendent', 0, '', NULL),
(6, 'Necklace', 0, '../uploads/categories/necklace.jpg', 'Necklace', 'necklace', 'Necklace', 'Necklace', '', 1, '21,25,28,35', '[\"polish\",\"diamonds\"]'),
(7, 'Ring', 0, '../uploads/categories/ring.jpg', 'Ring', 'ring', 'Ring', 'Ring', 'Ring', 1, '15,16,17,18,19,20,21,22,23,24,25,26', 'null'),
(10, 'kada', 1, '../uploads/categories/kada.jpg', 'Kada', 'kada', 'kada', 'kada', 'kada', 0, '', NULL),
(19, 'demo', 19, '', 'demo', 'demo', 'demo', 'demo', 'demo', 1, '1,2,3', NULL),
(21, 'Snake shaped Platinum & Gold Bracelet', 20, '../uploads/categories/snake-shaped-platinum-gold-bracelet.jpeg', 'Exclusively designed limited period product.', 'snake-shaped-platinum-gold-bracelet', 'Platinum & Gold Bracelet', '', '', 1, '20 gms, 30 gms, 60 gms', NULL),
(22, 'Earrings', 0, '', 'earrings', 'earrings', 'earrings', 'earrings', 'earrings', 1, '15,16,17,18,19,20,21,22,23,24,25,26', 'null'),
(23, 'Studs', 22, '../uploads/categories/0', 'studs', 'studs', 'studs', 'studs', 'studs', 0, '', NULL),
(24, 'Hangings', 22, '../uploads/categories/0', 'Hangings', 'hangings', 'Hangings', 'Hangings', 'Hangings', 0, '', NULL),
(25, 'Close settings Studs', 22, '../uploads/categories/0', 'Close settings Studs', 'close-settings-studs', 'Close settings Studs', 'Close settings Studs\r\n', 'Close settings Studs', 0, '', NULL),
(26, 'J bali', 22, '', 'J bali', 'j-bali', 'J bali', 'J bali\r\n', 'J bali', 0, '', 'null'),
(27, 'Cocktail Ring', 7, '../uploads/categories/0', 'Cocktail Ring', 'cocktail-ring', '', '', '', 0, '', NULL);

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
(1, 1, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(2, 1, 90, 0, 0, 0, 1500, 1, '0.72', '', 0, 'gemstone'),
(3, 1, 81, 0, 0, 0, 14000, 1, '0.99', '', 0, 'polki'),
(4, 2, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(5, 2, 81, 0, 0, 0, 14000, 16, '0.5600000000000', '', 0, 'polki'),
(6, 3, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(7, 3, 2, 2, 2, 97, 24000, 1, '1.82', '', 0, 'diamond'),
(8, 3, 96, 0, 0, 0, 1500, 1, '11.56', '', 0, 'gemstone'),
(9, 3, 81, 0, 0, 0, 18000, 1, '0.77', '', 0, 'polki'),
(10, 4, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(11, 4, 90, 0, 0, 0, 1500, 36, '7.04', '', 0, 'gemstone'),
(12, 4, 81, 0, 0, 0, 14000, 52, '4.42', '', 0, 'polki'),
(13, 5, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(14, 5, 96, 0, 0, 0, 1000, 9, '1.8', '', 0, 'gemstone'),
(15, 5, 81, 0, 0, 0, 14000, 34, '1.03', '', 0, 'polki'),
(20, 7, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(21, 7, 2, 2, 2, 97, 22000, 1, '0.02', '', 0, 'diamond'),
(22, 7, 90, 0, 0, 0, 4000, 1, '11.08', '', 0, 'gemstone'),
(23, 7, 81, 0, 0, 0, 14000, 1, '0.14', '', 0, 'polki'),
(24, 8, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(25, 8, 90, 0, 0, 0, 1500, 1, '36.87', '', 0, 'gemstone'),
(26, 8, 93, 0, 0, 0, 800, 1, '95.45', '', 0, 'gemstone'),
(27, 8, 81, 0, 0, 0, 18000, 1, '8.1999999999999', '', 0, 'polki'),
(33, 10, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(34, 10, 2, 2, 2, 97, 22000, 327, '2.74', '', 0, 'diamond'),
(35, 10, 90, 0, 0, 0, 2500, 1, '99.77', '', 0, 'gemstone'),
(36, 10, 91, 0, 0, 0, 1800, 18, '17.89', '', 0, 'gemstone'),
(37, 10, 81, 0, 0, 0, 14000, 54, '3.15', '', 0, 'polki'),
(38, 10, 82, 0, 0, 0, 18000, 32, '6.9', '', 0, 'polki'),
(39, 10, 84, 0, 0, 0, 800, 10, '27.06', '', 0, 'beads'),
(40, 10, 85, 0, 0, 0, 0, 1, '6.42', '', 0, 'other'),
(41, 11, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(42, 11, 2, 2, 2, 97, 22000, 95, '3.79', '', 0, 'diamond'),
(43, 11, 90, 0, 0, 0, 2500, 1, '130.97', '', 0, 'gemstone'),
(44, 11, 81, 0, 0, 0, 14000, 111, '9.6', '', 0, 'polki'),
(45, 12, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(46, 12, 2, 2, 2, 97, 22000, 104, '1.09', '', 0, 'diamond'),
(47, 12, 91, 0, 0, 0, 1800, 1, '20.24', '', 0, 'gemstone'),
(48, 12, 81, 0, 0, 0, 18000, 30, '4.71', '', 0, 'polki'),
(49, 12, 83, 0, 0, 0, 15000, 17, '1.29', '', 0, 'polki'),
(50, 12, 84, 0, 0, 0, 800, 77, '78.72', '', 0, 'beads'),
(51, 12, 85, 0, 0, 0, 0, 1, '14.15', '', 0, 'other'),
(52, 13, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(53, 13, 2, 2, 2, 97, 22000, 1, '0.68', '', 0, 'diamond'),
(54, 13, 96, 0, 0, 0, 2000, 1, '45.24', '', 0, 'gemstone'),
(55, 13, 81, 0, 0, 0, 23000, 5, '2.15', '', 0, 'polki'),
(68, 17, 0, 3, 27, 0, 0, 0, '0', '0', 0, 'material'),
(69, 17, 58, 12, 23, 22, 51000, 137, '0.83', '', 0, 'diamond'),
(70, 18, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(71, 18, 58, 12, 23, 22, 68000, 18, '1.36', '', 0, 'diamond'),
(74, 20, 0, 3, 16, 0, 0, 0, '0', '0', 0, 'material'),
(75, 20, 58, 12, 23, 22, 51000, 128, '0.64', '', 0, 'diamond'),
(84, 25, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(85, 25, 2, 2, 2, 97, 22000, 24, '0.2', '', 0, 'diamond'),
(86, 25, 90, 0, 0, 0, 1000, 7, '0.93', '', 0, 'gemstone'),
(87, 25, 99, 0, 0, 0, 200, 7, '22.39', '', 0, 'pearls'),
(88, 25, 81, 0, 0, 0, 14000, 29, '1.39', '', 0, 'polki'),
(93, 26, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(94, 26, 96, 0, 0, 0, 1000, 12, '4.66', '', 0, 'gemstone'),
(95, 26, 99, 0, 0, 0, 200, 23, '62.54', '', 0, 'pearls'),
(96, 26, 81, 0, 0, 0, 14000, 10, '1.12', '', 0, 'polki'),
(97, 19, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(98, 19, 0, 12, 23, 22, 51000, 46, '0.53', '', 0, 'diamond'),
(99, 24, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(100, 24, 0, 12, 23, 22, 51000, 139, '0.86', '', 0, 'diamond'),
(101, 15, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(102, 15, 0, 0, 0, 97, 22000, 36, '0.6', '', 0, 'diamond'),
(103, 15, 90, 0, 0, 0, 2000, 41, '8.33', '', 0, 'gemstone'),
(104, 15, 95, 0, 0, 0, 1500, 2, '59.79', '', 0, 'gemstone'),
(105, 15, 81, 0, 0, 0, 14000, 105, '5.57', '', 0, 'polki'),
(106, 15, 82, 0, 0, 0, 18000, 20, '2.14', '', 0, 'polki'),
(107, 21, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(108, 21, 0, 12, 23, 22, 51000, 14, '0.22', '', 0, 'diamond'),
(109, 16, 0, 3, 27, 0, 0, 0, '0', '1', 0, 'material'),
(110, 16, 0, 12, 23, 22, 51000, 137, '0.84', '', 0, 'diamond'),
(111, 23, 0, 3, 27, 0, 0, 0, '0', '2', 0, 'material'),
(112, 23, 0, 12, 23, 22, 51000, 64, '0.89', '', 0, 'diamond'),
(113, 6, 0, 3, 15, 0, 0, 0, '0', '1', 0, 'material'),
(114, 6, 0, 0, 0, 97, 24000, 1, '1.03', '', 0, 'diamond'),
(115, 6, 91, 0, 0, 0, 1000, 1, '3.73', '', 0, 'gemstone'),
(116, 6, 81, 0, 0, 0, 14000, 1, '1.03', '', 0, 'polki'),
(117, 22, 0, 3, 27, 0, 0, 0, '0', '2', 0, 'material'),
(118, 22, 0, 12, 23, 22, 51000, 46, '0.57', '', 0, 'diamond'),
(119, 9, 0, 87, 15, 0, 0, 0, '0', '0', 0, 'material'),
(120, 9, 0, 0, 0, 97, 22000, 142, '1.93', '', 0, 'diamond'),
(121, 9, 92, 0, 0, 0, 1500, 1, '87.05', '', 0, 'gemstone'),
(122, 9, 81, 0, 0, 0, 14000, 76, '5.16', '', 0, 'polki'),
(123, 9, 84, 0, 0, 0, 600, 1, '443.35', '', 0, 'beads'),
(124, 14, 0, 3, 15, 0, 0, 0, '0', '0', 0, 'material'),
(125, 14, 0, 0, 0, 97, 22000, 1, '0.2', '', 0, 'diamond'),
(126, 14, 93, 0, 0, 0, 3500, 1, '18.57', '', 0, 'gemstone'),
(127, 14, 81, 0, 0, 0, 14000, 1, '4.09', '', 0, 'polki');

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
(99, '<ol><li>This OptionName [max] does not exist.</li></ol>', 'Bangle', 'kada', '1', 'NPB 45', 'Kia19', 'Polki kada', 'Female', '1', 'Gold', 23.85, 22.482, 'Anaya', 'Polki', 'Yes', 'YES', '2.3', '22', 'Yellow gold', 'Yellow gold', 62.9, 17, 0, 0, '760', 'per gram', 'Gross weight', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'pearls - S', '1', '5.43', '300', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'polki', '20', '1.41', '14000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'max', '1', '10.25', '500', '', '121093.56', 'Wedding', '', '', '', '', ''),
(102, '<ol><li>This OptionName [rubies] does not exist.</li></ol>', 'Necklace', 'Necklace', '1', 'NPN 114', 'Kia22', 'carved emerald polki haram', 'Female', '1', 'Gold', 115.36, 99.084, 'JBN', 'Polki', 'Yes', 'YES', '', '22', 'Yellow gold', 'Yellow gold', 63.3, 74.2, 0, 24, '760', 'per gram', 'Gross weight', '', '', 'Diamond', '80', '', '2.1', '22000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'rubies', '22', '0.39', '1000', 'Tanzanites', '27', '45.29', '200', 'Emerald', '24', '28.04', '3000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'polki', '107', '5.56', '14000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '541478.32', 'Bridal Wear', '', '', '', '', ''),
(110, '<ol><li>This OptionName [pearls-s] does not exist.</li></ol>', 'Necklace', 'Necklace', '1', 'NN 181', 'Kia30', 'Carved emerald krishna necklace ', 'Female', '1', 'Gold', 129.46, 82.692, 'JBN', 'Polki', 'No', 'YES', '', '22', 'Yellow gold', 'Yellow gold', 136.8, 61.65, 0, 20, '975', 'per gram', 'Gross weight', '', '', 'Diamond', '1', '', '0.1', '51000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'tormaline', '1', '153.43', '1500', 'emerald', '1', '71.20999999999999', '3500', '', '', '', '', '', '', '', '', '', '', '', '', 'pearls-s', '1', '0.04', '200', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'polki', '1', '9.06', '14000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '504952.86', 'Anniversary', '', '', '', '', ''),
(113, '<ol><li>This OptionName [Bagguate] does not exist.</li></ol>', 'Earrings', 'Studs', '2', 'NVT 94', 'Kia3', 'Diamond studs', 'Female', '1', 'Gold ', 3.91, 3.724, 'Anaya', 'Diamond', 'No', 'YES', '', '18', 'Yellow gold', 'Yellow gold', 12.2, 12.2, 15.7, 0, '875', 'per gram', 'Gross weight', '', 'EF-VVS', 'Round', '14', 'IGI', '0.37', '51000', '', 'Bagguate', '60', 'IGI', '0.5600000000000001', '42000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '17572.45', 'Birthday', '', '', '18J616631705', '', '');

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
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`WishlistID`, `UserID`, `ProductID`, `Addedon`) VALUES
(13, 7, 19, '2020-10-06 04:59:27'),
(14, 7, 27, '2020-10-07 06:08:10'),
(15, 1, 7, '2021-01-22 09:17:42');

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
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_master`
--
ALTER TABLE `cart_master`
  MODIFY `OrderlD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `m_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1511;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productoptions`
--
ALTER TABLE `productoptions`
  MODIFY `OptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `WishlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

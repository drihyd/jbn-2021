-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 14, 2020 at 06:37 AM
-- Server version: 10.0.38-MariaDB
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
-- Database: `deepred_anaya`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_master`
--

CREATE TABLE `address_master` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(12) NOT NULL,
  `Address1` varchar(150) NOT NULL,
  `Address2` varchar(150) NOT NULL,
  `LandMark` varchar(100) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `City` varchar(50) NOT NULL,
  `Pincode` varchar(20) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Country` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju', 'vangapandu', 1, '2020-08-13 08:55:18', '202.83.28.235', '9700334319', 'vijayawada', 1, 'Active', '2020-09-09 23:40:54'),
(2, 'venkat@deepredink.com', 'feb43797d2a30b2472d5f3d7604f8b70', 'venkat', 'Yadav', 1, '2020-08-20 06:18:38', '157.48.154.168', '9872458585', 'sdgfdg', 4, 'Active', '2020-08-31 16:54:10'),
(6, 'rajkumar@deepredink.com', '43ab12269b21434ab9132e1bda2aa78d', '', '', 1, '2020-08-31 06:16:20', '49.205.229.18', '', '', 1, 'Active', '2020-09-09 22:18:23');

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
(1, 'banner_images/JR00313-WGP900_11_listfront.jpg', 'Platinum rings', 'You\'re worth it.', 'Lorem Ipsum', 'Shop Now', 'https://deepredink.com/demos/anaya/product/platinum-rings', 'Home_Banner_Panel', 3, '2020-08-20 10:35:12', '1'),
(2, 'banner_images/JR00050-WRP200_11_listfront.jpg', 'Diamond Collection', 'You\'re worth it.', 'Lorem Ipsum', 'Shop Now', 'https://deepredink.com/demos/anaya/product/enagagement-rings', 'Home_Banner_Panel', 2, '2020-08-20 10:35:12', '1'),
(4, 'banner_images/JR00322-YGP900_11_listfront.jpg', 'Gold Rings', 'Gold Rings', 'Lorem Ipsum', 'shop now', 'https://deepredink.com/demos/anaya/product/alocasia-root-earring', 'Home_Banner_Panel', 1, '2020-08-20 02:59:44', '1'),
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
  `ProductName` varchar(150) NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductSKU` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `CouponID` int(11) NOT NULL,
  `CouponCode` varchar(50) NOT NULL,
  `Amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`Order_DetailsID`, `OrderID`, `ProductID`, `ProductName`, `ProductPrice`, `ProductSKU`, `Quantity`, `CouponID`, `CouponCode`, `Amount`) VALUES
(9, 3, 3, 'open setting diamond bangles', 47000, 'NVB30', 0, 0, '', 0),
(10, 4, 3, 'open setting diamond bangles', 47000, 'NVB30', 0, 0, '', 0),
(11, 4, 7, 'open stylish', 16000, 'NVR78', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart_master`
--

CREATE TABLE `cart_master` (
  `OrderlD` int(11) NOT NULL,
  `UserlD` int(11) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  `OrderAmount` float NOT NULL,
  `OrderShipName` varchar(100) NOT NULL,
  `OrderPhone` varchar(20) NOT NULL,
  `OrderShipping` tinyint(1) NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmall` varchar(100) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` tinyint(1) NOT NULL,
  `OrderTrackingNumber` varchar(80) NOT NULL,
  `ShippingAddressID` int(11) NOT NULL,
  `BillingAddressID` int(11) NOT NULL,
  `DeliveryDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_master`
--

INSERT INTO `cart_master` (`OrderlD`, `UserlD`, `session_id`, `OrderAmount`, `OrderShipName`, `OrderPhone`, `OrderShipping`, `OrderTax`, `OrderEmall`, `OrderDate`, `OrderShipped`, `OrderTrackingNumber`, `ShippingAddressID`, `BillingAddressID`, `DeliveryDate`) VALUES
(1, 0, '42e2248b6e34ba12bc6cfdba313f4a7b81aefcc2', 0, '', '', 0, 0, '', '2020-09-09 12:22:29', 0, '', 0, 0, '0000-00-00 00:00:00'),
(2, 0, '55903c83ce7b47f9a55ce8eaaf57c9cbedc40d81', 0, '', '', 0, 0, '', '2020-09-09 12:38:19', 0, '', 0, 0, '0000-00-00 00:00:00'),
(3, 0, '9297c30cf4b806cc2246cf3688ca1c91c2cfb64d', 0, '', '', 0, 0, '', '2020-09-09 13:12:26', 0, '', 0, 0, '0000-00-00 00:00:00'),
(4, 0, '7e8bd960835d8020babc156f7a3cc519cc773843', 0, '', '', 0, 0, '', '2020-09-10 02:12:53', 0, '', 0, 0, '0000-00-00 00:00:00');

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
  `CouponCode` varchar(20) NOT NULL,
  `CouponAddedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CouponExpiryDate` datetime NOT NULL,
  `Description` varchar(100) NOT NULL,
  `DiscountType` char(10) NOT NULL,
  `Cartamount` float NOT NULL,
  `Couponamount` float NOT NULL,
  `Is_Enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(222, 2, 0, 'Blog', 'blog', '1', '', '2020-08-31 10:00:08'),
(223, 2, 0, 'Contact us', '', '1', '', '2020-08-31 10:00:08'),
(363, 3, 0, 'Jbn', '', '1', '', '2020-09-02 23:16:54'),
(364, 3, 363, 'Gold', '', '1', '', '2020-09-02 23:16:54'),
(365, 3, 364, 'Men', '', '1', '', '2020-09-02 23:16:54'),
(366, 3, 365, 'Rings', '', '1', '', '2020-09-02 23:16:54'),
(367, 3, 365, 'Chains', '', '1', '', '2020-09-02 23:16:55'),
(368, 3, 365, 'Bracelets', '', '1', '', '2020-09-02 23:16:55'),
(369, 3, 364, 'women', '', '1', '', '2020-09-02 23:16:55'),
(370, 3, 369, 'Rings', '', '1', '', '2020-09-02 23:16:55'),
(371, 3, 369, 'Nose Pins', '', '1', '', '2020-09-02 23:16:56'),
(372, 3, 369, 'chains', '', '1', '', '2020-09-02 23:16:56'),
(373, 3, 363, 'Diamonds', '', '1', '', '2020-09-02 23:16:56'),
(374, 3, 373, 'Men', '', '1', '', '2020-09-02 23:16:56'),
(375, 3, 374, 'Chains', '', '1', '', '2020-09-02 23:16:56'),
(376, 3, 374, 'Rings', '', '1', '', '2020-09-02 23:16:57'),
(377, 3, 374, 'solitairs', '', '1', '', '2020-09-02 23:16:57'),
(378, 3, 373, 'Women', '', '1', '', '2020-09-02 23:16:57'),
(379, 3, 378, 'Rings', '', '1', '', '2020-09-02 23:16:57'),
(380, 3, 378, 'Earings', '', '1', '', '2020-09-02 23:16:58'),
(381, 3, 378, 'bangles', '', '1', '', '2020-09-02 23:16:58'),
(382, 3, 378, 'tops', '', '1', '', '2020-09-02 23:16:58'),
(383, 3, 378, 'pendents', '', '1', '', '2020-09-02 23:16:58'),
(384, 3, 378, 'necklaces', '', '1', '', '2020-09-02 23:16:58'),
(385, 3, 378, 'chains', '', '1', '', '2020-09-02 23:16:59'),
(583, 1, 0, 'Gold', '#', '1', '', '2020-09-09 12:33:48'),
(584, 1, 583, 'Men', '', '1', '', '2020-09-09 12:33:48'),
(585, 1, 584, 'Rings', 'https://deepredink.com/demos/anaya/products/category/rings/gold/men', '1', '', '2020-09-09 12:33:48'),
(586, 1, 584, 'Pendents', 'https://deepredink.com/demos/anaya/products/category/pendents/gold/men', '1', '', '2020-09-09 12:33:48'),
(587, 1, 584, 'Ear rings', 'https://deepredink.com/demos/anaya/products/category/ear-rings/gold/men', '1', '', '2020-09-09 12:33:48'),
(588, 1, 583, 'Women', '', '1', '', '2020-09-09 12:33:48'),
(589, 1, 588, 'Rings', 'https://deepredink.com/demos/anaya/products/category/rings/gold/women', '1', '', '2020-09-09 12:33:48'),
(590, 1, 588, 'Ear rings', 'https://deepredink.com/demos/anaya/products/category/ear-rings/gold/women', '1', '', '2020-09-09 12:33:48'),
(591, 1, 588, 'Chains', 'https://deepredink.com/demos/anaya/products/category/chains/gold/women', '1', '', '2020-09-09 12:33:48'),
(592, 1, 588, 'Bangles', 'https://deepredink.com/demos/anaya/products/category/bangles/gold/women', '1', '', '2020-09-09 12:33:48'),
(593, 1, 588, 'Bracelets', 'https://deepredink.com/demos/anaya/products/category/bracelets/gold/women', '1', '', '2020-09-09 12:33:48'),
(594, 1, 0, 'Diamonds', '', '1', '', '2020-09-09 12:33:48'),
(595, 1, 594, 'Men', '', '1', '', '2020-09-09 12:33:48'),
(596, 1, 595, 'Rings', 'https://deepredink.com/demos/anaya/products/category/rings/diamonds/men', '1', '', '2020-09-09 12:33:48'),
(597, 1, 595, 'Ear rings', 'https://deepredink.com/demos/anaya/products/category/ear-rings/diamonds/men', '1', '', '2020-09-09 12:33:48'),
(598, 1, 595, 'solitairs', 'https://deepredink.com/demos/anaya/products/category/solitairs/diamonds/men', '1', '', '2020-09-09 12:33:48'),
(599, 1, 594, 'Women', '', '1', '', '2020-09-09 12:33:48'),
(600, 1, 599, 'Rings', 'https://deepredink.com/demos/anaya/products/category/rings/diamonds/women', '1', '', '2020-09-09 12:33:48'),
(601, 1, 599, 'Ear rings', 'https://deepredink.com/demos/anaya/products/category/ear-rings/diamonds/women', '1', '', '2020-09-09 12:33:48'),
(602, 1, 599, 'Solitairs', 'https://deepredink.com/demos/anaya/products/category/solitairs/diamonds/women', '1', '', '2020-09-09 12:33:48'),
(603, 1, 599, 'Pendents', 'https://deepredink.com/demos/anaya/products/category/pendents/diamonds/women', '1', '', '2020-09-09 12:33:48'),
(604, 1, 599, 'Chains', 'https://deepredink.com/demos/anaya/products/category/chains/diamonds/women', '1', '', '2020-09-09 12:33:48'),
(605, 1, 599, 'Bangles', 'https://deepredink.com/demos/anaya/products/category/bangles/diamonds/women', '1', '', '2020-09-09 12:33:48'),
(606, 1, 599, 'Bracelets', 'https://deepredink.com/demos/anaya/products/category/bracelets/diamonds/women', '1', '', '2020-09-09 12:33:48');

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
(1, 'jayaraju@deepredink.com', '1', '2020-09-07 15:08:15'),
(2, 'balaraju@deepredink.com', '1', '2020-09-07 15:13:38'),
(3, 'kolluvamsi981@gmail.com', '1', '2020-09-10 12:45:34');

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
  `OrderAmount` float NOT NULL,
  `OrderShipName` varchar(100) NOT NULL,
  `OrderPhone` varchar(20) NOT NULL,
  `OrderShipping` tinyint(1) NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmall` varchar(100) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` tinyint(1) NOT NULL,
  `OrderTrackingNumber` varchar(80) NOT NULL,
  `ShippingAddressID` int(11) NOT NULL,
  `BillingAddressID` int(11) NOT NULL,
  `DeliveryDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_coupons`
--

CREATE TABLE `order_coupons` (
  `OrderCouponID` int(11) NOT NULL,
  `ProductID` int(12) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_DetailsID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(150) NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductSKU` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `CouponID` int(11) NOT NULL,
  `CouponCode` varchar(50) NOT NULL,
  `Amount` float NOT NULL
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
(5, 'Refund Policy', 'Refund Policy', 'refund-policy', '<p> </p>\r\n\r\n<h4>Refund:</h4>\r\n\r\n<p>The customer will require the bill and the product to be returned along with the price tag. </p>\r\n\r\n<ul>\r\n <li>Customised Jewellery (including personalised/ engraved products) is not eligible for a 15 Day Money-Back or a 15 Day Exchange. Lifetime Exchange and Buyback are applicable.</li>\r\n <li>Once your returned item is received, our Quality Assurance Department will review it.</li>\r\n <li>Any item that shows sign of wear or has been altered, resized (by a jeweller other than the company) or damaged cannot be accepted for 15 Day Money-Back.</li>\r\n <li>The product should be accompanied by the original product certificate and the original/ copy of the invoice for all exchange within the 15 Day Money-Back period.</li>\r\n <li>In case the customer cannot produce the original certificate, the company will send the solitaire/ jewellery to the lab for recertification, the shipping and certification cost of which shall be borne by the customer.</li>\r\n <li>The Money-Back amount will be 100% of the actual amount paid. In case, any coupon, discount or promo codes were used during the original purchase, the exchange amount will be reduced by an amount equivalent to the coupon, discount or promo codes, as applicable.</li>\r\n <li>In case, any coupon, discount or promo codes were used during the original purchase, the BuyBack / Exchange amount will be reduced by an amount equivalent to the coupon, discount or promo codes, as applicable.</li>\r\n <li>If the discount was on making charges, the discount will not be deducted while arriving at the Lifetime Exchange (LTE) value.</li>\r\n <li>If the discount was on the gold value or diamond value then the entire discount will be deducted while arriving at the LTE value.</li>\r\n <li>If the discount was on MRP then 70% of the discount will be deducted while arriving at the final LTE value.</li>\r\n <li>In case of a refund on 15 Day Money-Back, payment of the refund amount shall be done via online bank transfer to the customer&#39;s bank account within 10 days of receipt of the product. If the mode of the payment was through online debit/ credit card/ net banking, the refund will be processed by reversal of the transaction.</li>\r\n <li>In case the exchange value is higher than the value of the old product, the customer will have to pay the difference.</li>\r\n <li>In case the exchanged value is lesser than the value of the old product, the difference will be refunded in case of a 15 Day exchange, but if it’s a Lifetime Exchange then the difference will be held as a credit for future purchase.</li>\r\n <li>The prevailing market value will be determined by the company.</li>\r\n <li>This feature is not available for international orders (orders that will be shipped abroad from India).</li>\r\n <li>CaratLane reserves the right to change the terms and conditions for specific customers. In such a situation, the customer will always be informed of the decision prior to the purchase.</li>\r\n <li>15 Day Money-Back is not applicable on a product purchased in exchange of gold coins (15 day exchange at 100% of the invoice value is still applicable).</li>\r\n <li>Lifetime Exchange and Buyback values are calculated excluding the making charges and taxes.</li>\r\n <li>Any new product purchased against LTE value or Old Gold Exchange Credit will be eligible for 100% exchange (15 days), LTE and Buyback but not eligible for 15 day money-back.</li>\r\n <li>Additional 10% will be deducted from the LTE value if the customer does not have the Invoice.</li>\r\n <li>You can exchange your design within 15 days for the full value only once. If you wish to exchange the design the second time, it will be considered as a Lifetime Exchange.</li>\r\n <li>15 Day Money-Back is not applicable on orders that have been exchanged earlier under the 15 Day Exchange Policy.</li>\r\n</ul>\r\n\r\n<p> </p>\r\n\r\n<h4>Resizing & Repairs:</h4>\r\n\r\n<ul>\r\n <li>If you want to resize your ring, the company will resize it free of cost except in certain cases where the resizing is not possible.</li>\r\n <li>If the resized ring costs more than the existing ring, the incremental cost shall be borne by the customer.</li>\r\n <li>If the resized ring costs less than the existing ring, the differential amount shall be refunded to the customer.</li>\r\n <li>In case of a refund, the payment of the same shall be made by way of an online bank transfer within 10 days of dispatch of the resized product.</li>\r\n <li>If for some reasons, your product needs to be repaired, the company shall repair / replace the product for charges which would be determined by the company on a case to case basis.</li>\r\n <li>Shipping charges under Repairs & Resizing policy shall be borne by the customer.</li>\r\n <li>This feature is not available for international orders (orders that will be shipped abroad from India).</li>\r\n</ul>', 'Refund Policy', '', 0),
(6, 'Shipping and Delivery Policy', 'Shipping and Delivery Policy', 'shipping-and-delivery-policy', '<p> </p>\r\n\r\n<p>We offer FREE shipping on every order only within India. Your order will be shipped to you fully insured. We urge all customers to inspect the package for any damage or tamper before receiving or signing for receipt.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our Indian customers, after your item has been packaged, it will be shipped and delivered free via one of the following carriers.</div>\r\n\r\n<div class=\"col-sm-6 shipping-products\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/b0749d0d9b944e2cb5a90394c9263d4b.png\"></div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our International customers, after your item has been packaged, it will be shipped and delivered via the following carrier. The shipping charges for our international customers are charged at the time of order booking.</div>\r\n\r\n<div class=\"col-sm-6 shipping-products\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/a1e46a88e47b41a0be37d3f609ea1805.png\"></div>\r\n</div>\r\n<br>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'Shipping and delivery', '', 0),
(7, 'How it Works', 'How it works', 'how-it-works', '<p> </p>\r\n\r\n<h3><strong>Navigation:</strong></h3>\r\n\r\n<p>All the product Categories and Sub-categories as listed in the header on top. Choose the Categories or the sub-categories by clicking on them and all the products listed under those categories will be shown.</p>\r\n\r\n<p>The topmost navigation bar shows the number of products in your Cart, along with Wishlist and Login links.</p>\r\n\r\n<p>Click on the Login button to login or register on our website. After loging-in, the same button holds the links to your Account and Orders. Use these links to view and update your account details, change password, track/cancel orders etc.  </p>\r\n\r\n<p>You can return to the homepage anytime the clicking on the \"Anaya Logo\" in the header or by clicking on the \"home\" link.</p>\r\n\r\n<p>A lot of useful links have also been provided in the footer, including our helpline number and email.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Exploring Products:</strong></h3>\r\n\r\n<p>Click on your preferred category/sub-category link in the header to view products listed under them. You can also click on the \"Collections\" link in the header to explore the store and look at latest deals and new-arrivals.</p>\r\n\r\n<p>Clicking on individual product will take you to the product page, where you can get all the information about the product, like its price, discount, description, attributes, photographs etc.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Adding Products to your Cart:</strong></h3>\r\n\r\n<p>While on the product page, choose one of the available sizes(s,m,l,xl,xxl) and the desired quantity and click on the \"Add to Cart\" button to add that product to your virtual cart.</p>\r\n\r\n<p>A notification box will flash, confirming your product has been added to your cart and the number of products in your cart will get updated, which can be noticed in the header.</p>\r\n\r\n<p>You can review the items in your cart anytime, by clicking on the cart symbol in the top-most part of the header. The cart page will show you the list of products in your cart and their cost information.</p>\r\n\r\n<p>If you wish to increase or descrease the quantity of a product in your cart, simply edit the number in the column against that product and your cart will be updated automatically.</p>\r\n\r\n<p>You can remove a product from your cart, by simply clicking the X symbol in the last column against that product and it will be removed from your cart.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Wishlist:</strong></h3>\r\n\r\n<p>You can also click on the \"Add to wishlist\" button instead of \"Add to cart\", if you decide to make the purchase at a later date. Your wishlist will be saved in our system and you can access the list anytime by clicking on the \"heart\" symbol in the header.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Online Payment Process:</strong></h3>\r\n\r\n<p>Online payment options like credit-card, debit-card, VISA, Netbanking etc. are available in our payment gateway.</p>\r\n\r\n<p>PayPal option is available for international payments.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Cash on Delivery:</strong></h3>\r\n\r\n<p>In select cities, we offer the option of paying Cash on Delivery. Simply choose the \"Cash on Delivery\" option as your payment mode(if it is available in your city), and submit your order and you can pay for your order only after it arrives at your doorstep.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Tracking Your Orders:</strong></h3>\r\n\r\n<p>Once your order is dispatched, you can login to you account and track your package&#39;s location and the estimated time of arrival, almost in realtime. </p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Grievances and Feedback:</strong></h3>\r\n\r\n<p>You can email us your concerns, complaints and grievances to: <a href=\"mailto:eshop@taruni.in\">eshop@a</a>nayajwelley.com or Call us at: <strong>+91 9999999999</strong></p>\r\n\r\n<p> </p>', 'Anaya how its work', '', 0),
(12, 'Insurance policy', 'insurance', 'insurance-policy', '<p> </p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'insurance', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `amount` float NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currency` varchar(20) NOT NULL,
  `TransactionID` varchar(100) NOT NULL,
  `PaymentStatus` enum('Sucess','failed','On Hold','declined','pending') DEFAULT NULL,
  `Payment_method` enum('COD','Credit Card','Debit','Netbanking','APIS') DEFAULT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IP` varchar(20) NOT NULL,
  `BankRefNumber` varchar(50) NOT NULL,
  `JsonData` text NOT NULL,
  `response_code` varchar(20) NOT NULL,
  `invoice_number` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Width` char(12) NOT NULL,
  `Height` char(10) NOT NULL,
  `Length` char(10) NOT NULL,
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
  `Collection` int(11) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modifiedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AddedBy` varchar(50) DEFAULT NULL,
  `AddedByIP` varchar(20) DEFAULT NULL,
  `OptionGroupID` int(11) NOT NULL,
  `Material_type` int(11) NOT NULL,
  `No_of_pieces` float NOT NULL,
  `Gross_weight` char(20) NOT NULL,
  `Net_weight` char(20) NOT NULL,
  `Polish_Details` varchar(250) NOT NULL,
  `SEOTitle` varchar(100) DEFAULT NULL,
  `SEODesc` varchar(200) DEFAULT NULL,
  `SEOKeywords` varchar(200) DEFAULT NULL,
  `CouponID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `SKU`, `Name`, `slug`, `MRP_Price`, `Price`, `Making_charges_unit`, `Making_charges`, `Making_chg_On_Grs_Net_Weight`, `discount_percentage`, `Width`, `Height`, `Length`, `CartDesc`, `ShortDesc`, `LongDesc`, `Thumbnail`, `lmage`, `CategoryID`, `Sub_CategorylD`, `UpdateDate`, `Stock`, `Productlive`, `Provision_for_opening`, `Gender`, `Collection`, `Addedon`, `Modifiedon`, `AddedBy`, `AddedByIP`, `OptionGroupID`, `Material_type`, `No_of_pieces`, `Gross_weight`, `Net_weight`, `Polish_Details`, `SEOTitle`, `SEODesc`, `SEOKeywords`, `CouponID`) VALUES
(2, 'NVT22', 'Open setting Tops', 'open-setting-tops-1', 30000, 26000, 'gram', 1031, 'gross weight', 0, '42.76', '26.7', '', '', 'NA', '', '', '', 4, 14, '2020-09-09 09:34:21', 1, 1, 'Yes', 'Women', 0, '2020-09-09 08:59:19', '2020-09-09 09:34:21', '', '', 0, 1, 1, '3.29', '3.216', 'NA', '', '', '', '0'),
(3, 'NVB30', 'open setting diamond bangles', 'open-setting-diamond-bangles-1', 51000, 47000, 'gram', 5000, 'net_weight', 0, '9.22', '0', '11.66', '', 'A pair of bangles with rubies and diamonds\r\n', '', '', '', 1, 9, '2020-09-09 09:04:22', 2, 1, 'Yes', 'Women', 0, '2020-09-09 09:04:22', '2020-09-09 11:34:22', '', '', 0, 1, 2, '49.53', '46.65', 'Yellow gold with white pen rodium', 'open setting diamond bangles', 'open setting diamond bangles', 'open setting diamond bangles', '0'),
(4, 'NVT122', 'Open setting Tops', 'open-setting-tops-2', 45000, 40000, 'gram', 875, 'gross weight', 0, '43.76', '26.7', '', '', 'NA', '', '', '', 4, 14, '2020-09-09 09:26:37', 1, 1, 'Yes', 'Women', 0, '2020-09-09 09:08:32', '2020-09-09 09:26:37', '', '', 0, 1, 1, '3.75', '3.618', 'NA', '', '', '', '0'),
(5, 'NVB63', 'close setting bangles', 'close-setting-bangles', 36000, 30000, 'gram', 960, 'gross_weight', 0, '11.4', '5.6', '2.5', '', 'A pair of wide close setting bangles', '', '', '', 1, 10, '2020-09-09 09:12:25', 2, 1, 'Yes', 'Women', 0, '2020-09-09 09:12:25', '2020-09-09 11:42:25', '', '', 0, 1, 2, '63.95', '62.73', 'Yellow gold ', 'close setting bangles', 'close setting bangles', 'close setting bangles', '0'),
(6, 'NVT580', 'Open setting Tops', 'open-setting-tops-3', 36000, 20000, 'gram', 875, 'gross weight', 0, '44.76', '26.7', '', '', 'NA', '', '', '', 4, 14, '2020-09-09 09:26:15', 1, 1, 'Yes', 'Women', 0, '2020-09-09 09:12:25', '2020-09-09 09:26:15', '', '', 0, 1, 1, '4.69', '4', 'Yellow gold', '', '', '', '0'),
(7, 'NVR78', 'open stylish', 'open-stylish', 18000, 16000, 'gram', 1675, 'gross weight', 0, '54.76', '26.7', '', '', 'NA', '', '', '', 7, 17, '2020-09-09 10:19:20', 1, 1, 'Yes', 'Women', 0, '2020-09-09 09:24:04', '2020-09-09 10:19:20', '', '', 0, 1, 1, '7', '6.972', 'Rose gold and white gold', '', '', '', '0'),
(8, 'NVL153', 'open setting pendent', 'open-setting-pendent', 45000, 55000, 'gram', 875, 'gross_weight', 0, '27.02', '41.0', '0', '', 'open setting pendent', '', '', '', 3, 12, '2020-09-09 09:24:12', 1, 1, 'Yes', 'Women', 0, '2020-09-09 09:24:12', '2020-09-09 11:54:12', '', '', 0, 1, 1, '11.75', '10.62', 'yellow gold', 'open setting pendent', 'open setting pendent', 'open setting pendent', '0'),
(9, 'NVL143', 'Close setting Pendent', 'close-setting-pendent', 75000, 51000, 'gram', 960, 'gross_weight', 0, '30', '40', '45', '', 'Close setting Pendent', '', '', '', 3, 13, '2020-09-09 09:31:19', 2, 1, 'Yes', 'Women', 0, '2020-09-09 09:31:19', '2020-09-09 12:01:19', '', '', 0, 1, 1, '23.022', '22.58', 'Yellow gold', 'Close setting Pendent', 'Close setting Pendent', 'Close setting Pendent', '0'),
(10, 'NVR165', ' Engagement Ring', 'engagement-ring', 90000, 100000, 'gram', 1600, 'gross_weight', 0, '53.76', '26.7', '', '', 'Engagement Ring', '', '', '', 7, 17, '2020-09-09 09:37:49', 1, 1, 'Yes', 'Women', 0, '2020-09-09 09:37:49', '2020-09-09 12:07:49', '', '', 0, 2, 1, '4.48', '4.454', 'Platinum', '', '', '', '0'),
(11, 'NVR22', 'Engagement  Ring', 'engagement-ring', 150000, 180000, 'gram', 1330, 'gross weight', 0, '52.76', '26.7', '', '', 'Engagement  Ring', '', '', '', 7, 17, '2020-09-09 09:47:02', 1, 1, 'Yes', 'Women', 0, '2020-09-09 09:46:12', '2020-09-09 09:47:02', '', '', 0, 1, 1, '2.09', '2.02', 'White gold', '', '', '', '0');

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
  `SEOKeywords` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`CategoryID`, `CategoryName`, `ParentID`, `CategoryImage`, `CategoryDesc`, `CategorySlug`, `SEOTitle`, `SEODescription`, `SEOKeywords`) VALUES
(1, 'Bangles', 0, '../uploads/categories/bangles.jpg', 'Bangles', 'bangles', 'Bangles', 'Bangles', 'Bangles'),
(2, 'Bracelets', 0, '../uploads/categories/bracelets.jpg', 'Bracelets', 'bracelets', 'Bracelets', 'Bracelets', 'Bracelets'),
(3, 'Pendent', 0, '../uploads/categories/pendent.jpg', 'Pendent', 'pendent', 'Pendent', 'Pendent', 'Pendent'),
(4, 'Tops', 0, '../uploads/categories/tops.jpg', 'Tops', 'tops', 'Tops', 'Tops', 'Tops'),
(5, 'Jumki', 0, '../uploads/categories/jumki.jpg', 'Jumki', 'jumki', 'Jumki', 'Jumki', 'Jumki'),
(6, 'Necklace', 0, '../uploads/categories/necklace.jpg', 'Necklace', 'necklace', 'Necklace', 'Necklace', ''),
(7, 'Rings', 0, '../uploads/categories/rings.jpg', 'Ring', 'rings', 'Ring', 'Ring', 'Ring'),
(8, 'Italian Chains', 0, '../uploads/categories/italian-chains.jpg', 'Italian Chain', 'italian-chains', 'Italian Chain', 'Italian Chain', 'Italian Chain'),
(9, 'Open setting diamond bangles', 1, '../uploads/categories/open-setting-diamond-bangles.jpg', 'Open setting diamond bangles', 'open-setting-diamond-bangles', 'Open setting diamond bangles', 'Open setting diamond bangles', 'Open setting diamond bangles'),
(10, 'Close setting bangles', 1, '../uploads/categories/close-setting-bangles.jpg', 'Close setting bangles', 'close-setting-bangles', 'Close setting bangles', 'Close setting bangles', 'Close setting bangles'),
(11, 'Flexible Bracelet', 2, '../uploads/categories/flexible-bracelet.jpg', 'Flexible Bracelet', 'flexible-bracelet', 'Flexible Bracelet', 'Flexible Bracelet', 'Flexible Bracelet'),
(12, 'Open setting Pendent', 3, '../uploads/categories/open-setting-pendent.jpg', 'Open setting Pendent', 'open-setting-pendent', 'Open setting Pendent', 'Open setting Pendent', 'Open setting Pendent'),
(13, 'Close setting Pendent', 3, '../uploads/categories/close-setting-pendent.jpg', 'Close setting Pendent', 'close-setting-pendent', 'Close setting Pendent', 'Close setting Pendent', 'Close setting Pendent'),
(14, 'Open setting Tops', 4, '../uploads/categories/open-setting-tops.jpg', 'Open setting Tops', 'open-setting-tops', 'Open setting Tops', 'Open setting Tops', 'Open setting Tops'),
(15, 'Close setting tops', 4, '../uploads/categories/close-setting-tops.png', 'Close setting tops', 'close-setting-tops', 'Close setting tops', 'Close setting tops', 'Close setting tops'),
(16, 'Open setting Necklace', 6, '../uploads/categories/open-setting-necklace.jpg', 'Open setting Necklace', 'open-setting-necklace', 'Open setting Necklace', 'Open setting Necklace', 'Open setting Necklace'),
(17, 'Open setting Ring', 7, '../uploads/categories/open-setting-ring.jpg', 'Open setting Ring', 'open-setting-ring', 'Open setting Ring', 'Open setting Ring', 'Open setting Ring');

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
(1, 1, 0, 3, 0, 0, 0, '0', '2.4', 0, 'material'),
(2, 3, 0, 3, 15, 0, 0, '', '2.4', 0, 'material'),
(3, 3, 14, 12, 23, 51000, 265, '5.02', '2.4', 0, 'diamond'),
(4, 3, 20, 0, 0, 1000, 10, '4.70', '2.4', 0, 'gemstone'),
(5, 3, 22, 0, 0, 0, 269, '4.68', '2.4', 0, 'diamond_shape'),
(12, 5, 0, 3, 15, 0, 0, '', '2.6', 0, 'material'),
(13, 5, 14, 12, 23, 51000, 198, '6.09', '2.6', 0, 'diamond'),
(14, 5, 22, 0, 0, 0, 0, '', '2.6', 0, 'diamond_shape'),
(21, 0, 0, 0, 0, 0, 0, '', 'Gold', 0, 'material'),
(22, 0, 14, 12, 23, 75000, 1, '0.13', 'Gold', 0, 'diamond'),
(23, 0, 22, 0, 0, 0, 0, '', 'Gold', 0, 'diamond_shape'),
(24, 8, 0, 3, 15, 0, 0, '11.0', '4', 0, 'material'),
(25, 8, 14, 12, 23, 51000, 113, '0.93', '4', 0, 'diamond'),
(26, 8, 21, 0, 0, 1000, 2, '1.02', '4', 0, 'gemstone'),
(27, 8, 22, 0, 0, 0, 22, '040', '4', 0, 'diamond_shape'),
(28, 8, 17, 0, 0, 300, 3.28, '1.02', '4', 0, 'pearls'),
(29, 6, 0, 3, 15, 0, 0, '4', '1', 0, 'material'),
(30, 6, 14, 12, 23, 51000, 44, '0.39', '1', 0, 'diamond'),
(31, 4, 0, 3, 15, 0, 0, '3.618', '1', 0, 'material'),
(32, 4, 14, 12, 23, 51000, 62, '0.66', '1', 0, 'diamond'),
(33, 4, 22, 0, 0, 0, 0, '', '1', 0, 'diamond_shape'),
(34, 4, 17, 0, 0, 300, 2, '2.71', '1', 0, 'pearls'),
(38, 9, 0, 3, 15, 0, 0, '', '1', 0, 'material'),
(39, 9, 14, 12, 23, 51000, 60, '1.93', '1', 0, 'diamond'),
(40, 9, 21, 0, 0, 3000, 2, '0.23', '1', 0, 'gemstone'),
(41, 9, 22, 0, 0, 0, 0, '', '1', 0, 'diamond_shape'),
(42, 2, 0, 2, 27, 0, 0, '2.0', '2.2', 0, 'material'),
(43, 2, 19, 0, 0, 1, 1, '1', '2.2', 0, 'pearls'),
(44, 10, 0, 0, 0, 0, 0, '4.454', '11', 0, 'material'),
(45, 10, 14, 12, 23, 75000, 1, '0.13', '11', 0, 'diamond'),
(46, 10, 22, 0, 0, 0, 0, '', '11', 0, 'diamond_shape'),
(51, 11, 0, 3, 16, 0, 0, '2.02', '11', 0, 'material'),
(52, 11, 14, 12, 23, 51000, 6, '0.04', '11', 0, 'diamond'),
(53, 11, 22, 0, 0, 0, 1, '0.31', '11', 0, 'diamond_shape'),
(54, 11, 22, 0, 0, 0, 0, '', '11', 0, 'diamond_shape'),
(55, 7, 0, 3, 27, 0, 0, '', '9', 0, 'material'),
(56, 7, 14, 12, 23, 51000, 20, '0.14', '9', 0, 'diamond'),
(57, 7, 22, 0, 0, 0, 0, '', '9', 0, 'diamond_shape');

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
(2, 'Login', 'jayaraju', 'jayaraju@deepredink.com', '9700334319', NULL, 'Hi unable to login please fixHi unable to login please fix\r\n', 'your problem is fixed', 'closed', '2020-09-10 15:20:49', '2020-09-10 17:14:14');

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
(1, 'Bangles', '{\"status\":\"success\",\"ID\":\"1\"}', 'Open setting diamond bangles', '{\"status\":\"success\",\"ID\":\"9\"}', '2', 'NVB30', 'Open setting diamond bangles', 'A pair of bangles with rubies and diamonds', 'Women', '', '1', 'gold', '{\"status\":\"success\",\"ID\":\"1\"}', '18', '{\"status\":\"success\",\"ID\":\"3\"}', '49.53', '46.65', 'Yes', '2.4', 'Yellow gold ', '{\"status\":\"failed\",\"ID\":0}', 'IGI', '', 'EF-VVS', '', '', '265', '5.02', '51000', 'Round', '269', '4.68', '42000', 'Baguette', '', '', '', '', 'Rubies', '10', '4.7', '1000 per carat', '', '', '', '', '26.76', '26.7', '', '', '875', 'gram', 'on gross weight', '', '', '', 'Yellow gold with white pen rodium', '', '', 'Not done', 'Yes', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `UserPassword` varchar(150) NOT NULL,
  `UserFirstName` varchar(50) NOT NULL,
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
  `UserCountry` varchar(20) DEFAULT NULL,
  `UserAddress` varchar(255) DEFAULT NULL,
  `UserAddress2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserEmail`, `UserPassword`, `UserFirstName`, `UserLastName`, `UserGender`, `UserLastLoginIP`, `UserLastLoginDate`, `UserEmailVerified`, `UserRegistrationDate`, `UserVerificationCode`, `UserVerificationDate`, `UserIP`, `UserPhone`, `UserAltPhone`, `UserCountry`, `UserAddress`, `UserAddress2`) VALUES
(1, 'rajkumar@deepredink.com', '43ab12269b21434ab9132e1bda2aa78d', 'Raj', 'Kumar', NULL, '', '2020-08-26 16:40:34', 1, '2020-08-26 16:40:34', '', '2020-08-26 16:40:34', '', NULL, NULL, NULL, NULL, NULL),
(3, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'male', '202.83.28.235', '2020-09-07 13:02:47', 1, '2020-09-03 07:58:57', '', '2020-09-03 07:58:57', '', '9700334319', NULL, NULL, NULL, NULL),
(4, 'venkat@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'male', '', '2020-09-03 09:15:37', 1, '2020-09-03 09:15:37', '', '2020-09-03 09:15:37', '', '9848343362', NULL, NULL, NULL, NULL);

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
  ADD PRIMARY KEY (`AdminID`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_type`
--
ALTER TABLE `material_type`
  ADD PRIMARY KEY (`MaterialID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`m_item_id`);

--
-- Indexes for table `metal_clar_purity`
--
ALTER TABLE `metal_clar_purity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metal_color`
--
ALTER TABLE `metal_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options_group`
--
ALTER TABLE `options_group`
  ADD PRIMARY KEY (`OptionGroupID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderlD`);

--
-- Indexes for table `order_coupons`
--
ALTER TABLE `order_coupons`
  ADD PRIMARY KEY (`OrderCouponID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_DetailsID`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `productoptions`
--
ALTER TABLE `productoptions`
  ADD PRIMARY KEY (`OptionID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`Product_imagesID`);

--
-- Indexes for table `product_option`
--
ALTER TABLE `product_option`
  ADD PRIMARY KEY (`ProductOptionID`);

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
  ADD PRIMARY KEY (`WishlistID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_master`
--
ALTER TABLE `address_master`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `CouponID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `m_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `options_group`
--
ALTER TABLE `options_group`
  MODIFY `OptionGroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderlD` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_coupons`
--
ALTER TABLE `order_coupons`
  MODIFY `OrderCouponID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productoptions`
--
ALTER TABLE `productoptions`
  MODIFY `OptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `Product_imagesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `WishlistID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

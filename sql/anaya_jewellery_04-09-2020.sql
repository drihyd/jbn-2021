-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 04, 2020 at 05:47 AM
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
(1, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju', 'vangapandu', 1, '2020-08-13 08:55:18', '202.83.28.235', '9700334319', 'vijayawada', 1, 'Active', '2020-09-04 16:58:58'),
(2, 'venkat@deepredink.com', 'feb43797d2a30b2472d5f3d7604f8b70', 'venkat', 'Yadav', 1, '2020-08-20 06:18:38', '157.48.154.168', '9872458585', 'sdgfdg', 4, 'Active', '2020-08-31 16:54:10'),
(6, 'rajkumar@deepredink.com', '43ab12269b21434ab9132e1bda2aa78d', '', '', 1, '2020-08-31 06:16:20', '202.83.28.235', '', '', 1, 'Active', '2020-09-04 17:00:50');

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

-- --------------------------------------------------------

--
-- Table structure for table `cart_master`
--

CREATE TABLE `cart_master` (
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
(1, 'Gold', ''),
(2, 'Platinum', ''),
(3, 'Silver', ''),
(4, 'Diamonds', '');

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
(410, 1, 0, 'Gold', '#', '1', '', '2020-09-04 07:41:27'),
(411, 1, 410, 'Men', '', '1', '', '2020-09-04 07:41:27'),
(412, 1, 411, 'Rings', '', '1', '', '2020-09-04 07:41:27'),
(413, 1, 411, 'Pendents', '', '1', '', '2020-09-04 07:41:27'),
(414, 1, 411, 'Ear rings', '', '1', '', '2020-09-04 07:41:27'),
(415, 1, 410, 'Women', '', '1', '', '2020-09-04 07:41:27'),
(416, 1, 415, 'Rings', '', '1', '', '2020-09-04 07:41:27'),
(417, 1, 415, 'Ear rings', '', '1', '', '2020-09-04 07:41:27'),
(418, 1, 415, 'Chains', '', '1', '', '2020-09-04 07:41:27'),
(419, 1, 415, 'Bangles', '', '1', '', '2020-09-04 07:41:27'),
(420, 1, 415, 'Bracelets', '', '1', '', '2020-09-04 07:41:27'),
(421, 1, 0, 'Diamonds', '', '1', '', '2020-09-04 07:41:27'),
(422, 1, 421, 'Men', '', '1', '', '2020-09-04 07:41:27'),
(423, 1, 422, 'Rings', '', '1', '', '2020-09-04 07:41:27'),
(424, 1, 422, 'Ear rings', '', '1', '', '2020-09-04 07:41:27'),
(425, 1, 422, 'solitairs', '', '1', '', '2020-09-04 07:41:27'),
(426, 1, 422, 'fddfgh', '#', '1', '', '2020-09-04 07:41:27'),
(427, 1, 421, 'Women', '', '1', '', '2020-09-04 07:41:27'),
(428, 1, 427, 'Rings', '', '1', '', '2020-09-04 07:41:27'),
(429, 1, 427, 'Ear rings', '', '1', '', '2020-09-04 07:41:27'),
(430, 1, 427, 'Solitairs', '', '1', '', '2020-09-04 07:41:27'),
(431, 1, 427, 'Pendents', '', '1', '', '2020-09-04 07:41:27'),
(432, 1, 427, 'Chains', '', '1', '', '2020-09-04 07:41:27'),
(433, 1, 427, 'Bangles', '', '1', '', '2020-09-04 07:41:27'),
(434, 1, 427, 'Bracelets', '', '1', '', '2020-09-04 07:41:27');

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
(1, 'Diamond Color', 'Yes', 4, '0'),
(2, 'Metal', 'Yes', 1, '0'),
(3, 'Size', 'No', 0, '0'),
(5, 'Diamond Clarity', 'No', 4, '0'),
(6, 'Gold Color', 'No', 1, '0'),
(7, 'Pearls', 'No', 0, '0'),
(8, 'Gemstone', 'No', 0, '0'),
(9, 'Diamond Shape', 'No', 4, '0'),
(10, 'Diamond Certified', 'No', 4, '0');

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
(5, 'Cancellation and Refund Policy', 'Cancellation Policy', 'cancellation-and-refund-policy', '<p style=\"text-align: justify;\">&nbsp;</p>\n<h3><strong>Cancellation Policy</strong></h3>\n<p>Taruni believes in helping its customers as far as possible, and has therefore a liberal cancellation policy. Under this policy</p>\n<ul>\n<li>Cancellations will be considered only if the request is made within 36&nbsp;hours of placing an order (after which the &lsquo;cancel&rsquo; button will be disabled) However, the cancellation request will not be entertained if the orders have been communicated to the vendors/merchants and they have initiated the process of shipping them.</li>\n<li>There is no cancellation of orders placed under the Same Day Delivery category.</li>\n<li>No cancellations are entertained for those products that the <strong>Taruni</strong>&nbsp;marketing team has obtained on special occasions like Pongal, Diwali, Valentine&rsquo;s Day etc. These are limited occasion offers and therefore cancellations are not possible.</li>\n<li>In case of receipt of damaged or defective, please report the same to our Customer Service E-mail ID. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within 3 days of receipt of the products.</li>\n<li>In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within 24 hours of receiving the product. The Customer Service Team after looking into your complaint will take an appropriate decision.</li>\n</ul>\n<p>&nbsp;</p>\n<h3><strong>Exchange Policy -</strong></h3>\n<p>We will accept exchanges <strong>(but no refunds)&nbsp;</strong></p>\n<p>The customer will require the bill and the product to be returned along with the price tag.&nbsp;</p>\n<ul>\n<li>Exchange will be considered only for any physical damages during shipping.</li>\n<li>You must make your return within 3 days of the delivery date if the delivery has been made to India / 14 days if the delivery has been made elsewhere.</li>\n<li>Shipping charges are not refundable.</li>\n<li>Unless delivered goods are damaged, customers are required to bear two way shipping costs for exchange of clothes.</li>\n<li>We will not accept merchandise that has been worn, altered, or washed.</li>\n<li>The customer will be required to produce the bill and the product to be returned along with the price tag.</li>\n<li>Upon receipt of returned products, we reserve the right to deny a refund if the merchandise does not meet return policy requirements.</li>\n<li>Please note that while we want you to be happy with your purchases, an excessive number of returns in a twelve-month period may cause us to reject future orders from you.</li>\n<li>Products once altered cannot be exchanged.</li>\n</ul>\n<p>The products must be returned to the following address:</p>\n<p>Taruni Clothing Pvt. Ltd.<br />Malani Excel,<br />10-3-150 &amp; 151, 4th Floor, St. Johns Road,<br />Beside Ratnadeep Sup. Market,<br />East Marredpally, Secunderabad,<br />Telangana. Pin: 500026.</p>\n<p>Ph:&nbsp;+91 9492021805</p>', 'cancellation policy', '', 0),
(6, 'Shipping and Delivery Policy', 'Shipping and Delivery Policy', 'shipping-and-delivery-policy', '<p> </p>\r\n\r\n<p>We offer FREE shipping on every order only within India. Your order will be shipped to you fully insured. We urge all customers to inspect the package for any damage or tamper before receiving or signing for receipt.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our Indian customers, after your item has been packaged, it will be shipped and delivered free via one of the following carriers.</div>\r\n\r\n<div class=\"col-sm-6\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/b0749d0d9b944e2cb5a90394c9263d4b.png\"></div>\r\n</div>\r\n\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-6\">For our International customers, after your item has been packaged, it will be shipped and delivered via the following carrier. The shipping charges for our international customers are charged at the time of order booking.</div>\r\n\r\n<div class=\"col-sm-6\"><img class=\"img-responsive\" src=\"https://images.cltstatic.com/live-images/a1e46a88e47b41a0be37d3f609ea1805.png\"></div>\r\n</div>', 'Shipping and delivery', '', 0),
(7, 'How it Works', 'How it works', 'how-it-works', '<p>&nbsp;</p>\n<h3><strong>Navigation:</strong></h3>\n<p>All the product Categories and Sub-categories as listed in the header on top. Choose&nbsp;the Categories or the sub-categories by clicking on them and all the products listed under those categories will be shown.</p>\n<p>The topmost navigation bar shows the number of products in your Cart, along with Wishlist and Login links.</p>\n<p>Click on the Login button to login or register on our website. After loging-in, the same button holds the links to your Account and Orders. Use these links to view and update your account details, change password, track/cancel orders etc.&nbsp;&nbsp;</p>\n<p>You can return to the homepage anytime the clicking on the \"Taruni Logo\" in the header or by clicking on the \"home\" link.</p>\n<p>A lot of useful links have also been provided in the footer, including our helpline number and email.</p>\n<p>&nbsp;</p>\n<h3><strong>Exploring Products:</strong></h3>\n<p>Click on your&nbsp;preferred category/sub-category link in the header to view products listed under them. You can also click on the \"Collections\" link in the header to explore the store and look at latest deals and new-arrivals.</p>\n<p>Clicking on individual product will take you to the product page, where you can get all the information about the product, like its price, discount, description, attributes, photographs etc.</p>\n<p>&nbsp;</p>\n<h3><strong>Adding Products to your Cart:</strong></h3>\n<p>While on the product page, choose one of the available sizes(s,m,l,xl,xxl) and the desired quantity and click on the \"Add to Cart\" button to add that product&nbsp;to your virtual cart.</p>\n<p>A&nbsp;notification box will flash,&nbsp;confirming your&nbsp;product has been added to your cart and the number of products in your cart will get updated, which can be noticed in the header.</p>\n<p>You can review the items in your cart anytime, by clicking on the cart symbol in the top-most part of the header. The cart page will show you the list of products in your cart and their cost information.</p>\n<p>If you wish to increase or descrease the quantity of a product in your cart, simply edit the number in the column against that product and your cart will be updated&nbsp;automatically.</p>\n<p>You can remove a product from your cart, by simply clicking the X symbol in the last column against that product and it will be removed from your cart.</p>\n<p>&nbsp;</p>\n<h3><strong>Wishlist:</strong></h3>\n<p>You can also click on the \"Add to wishlist\" button instead of \"Add to cart\", if you decide to make the purchase at a later date. Your wishlist will be saved in our system and you can access the list anytime by clicking on the \"heart\" symbol in the header.</p>\n<p>&nbsp;</p>\n<h3><strong>Online Payment Process:</strong></h3>\n<p>Online payment&nbsp;options like credit-card, debit-card, VISA, Netbanking etc. are available in our payment gateway.</p>\n<p>PayPal option is available for international payments.</p>\n<p>&nbsp;</p>\n<h3><strong>Cash on Delivery:</strong></h3>\n<p>In select cities, we offer the option of paying Cash on Delivery. Simply choose the \"Cash on Delivery\" option as&nbsp;your&nbsp;payment mode(if it is available in&nbsp;your city), and submit your order and you can pay for your order only after&nbsp;it arrives at your doorstep.</p>\n<p>&nbsp;</p>\n<h3><strong>Tracking Your Orders:</strong></h3>\n<p>Once your order is dispatched, you can login to you account and&nbsp;track your package\'s&nbsp;location and the estimated time of arrival,&nbsp;almost in&nbsp;realtime.&nbsp;</p>\n<p>&nbsp;</p>\n<h3><strong>Grievances and Feedback:</strong></h3>\n<p>You can email us your concerns, complaints and grievances to: <a href=\"mailto:eshop@taruni.in\">eshop@taruni.in</a>&nbsp;or Call us at: <strong>+91&nbsp;9492021805</strong></p>\n<p>&nbsp;</p>', 'Taruni, how it works', '', 0),
(12, 'Insurance policy', 'insurance', 'insurance-policy', '<p>Insurance</p>\r\n\r\n<p>insurance</p>', 'insurance', '', 0);

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
(23, 10, 'IGI');

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
(2, 'ER0001', 'Gold Rings', 'gold-rings', 3850, 2000, 'fix', 801, 'fix', 1, '15.26', '14.26', '26.23', '', 'Alocasia Root Earring', '', '', 'product_images/JR00196-YGP9RG_11_listfront.jpg', 1, 2, '2020-08-31 16:51:33', 3, 1, 'No', 'Women', 0, '2020-08-19 11:07:59', '2020-08-31 16:51:33', '', '', 0, 1, 5, '49.530gms', '46.650gms', 'Yellow gold with white pen rodium', '', '', '', '0'),
(3, 'B0001', 'Enagagement Rings', 'enagagement-rings', 21000, 23000, 'gram', 1000, 'gross weight', 2, '15.26', '14.26', '26.23', '', 'Alocasia Root Earring', '', '', 'product_images/JR00300-WGP9TO_12_listhover.jpg', 1, 10, '2020-09-04 14:36:03', 10, 1, 'Yes', 'Women', 0, '2020-08-19 11:07:59', '2020-09-04 14:36:03', '', '', 0, 2, 1, '', '', 'Testing', '', '', '', '0'),
(4, 'PR0001', 'Platinum Rings', 'platinum-rings', 12000, 15000, 'fix', 1000, 'fix', 1, '15.26', '14.26', '26.23', '', 'Alocasia Root Earring', '', '', 'product_images/JR00313-WGP900_11_listfront.jpg', 1, 10, '2020-09-04 14:36:15', 3, 1, 'Yes', 'Women', 0, '2020-08-19 11:07:59', '2020-09-04 14:36:15', '', '', 0, 2, 0, '', '', 'Testing', '', '', '', '0'),
(8, 'BODB001', 'Edged Chevron Gold Bangle', 'edged-chevron-gold-bangle', 200000, 195000, 'gram', 5000, 'gross_weight', 5, '100', '500', '300', '', 'Edged Chevron Gold Bangle', '', '', '', 1, 9, '2020-09-04 05:18:38', 5, 1, 'No', 'Women', 0, '2020-09-04 05:18:38', '2020-09-04 05:18:38', 'Admin', '124.123.172.204', 0, 1, 1, '500', '506', 'White gold', '', '', '', '0');

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
(1, 'Bangles', 0, '../uploads/categories/0', 'Bangles', 'bangles', 'Bangles', 'Bangles', 'Bangles'),
(2, 'Bracelets', 0, '../uploads/categories/0', 'Bracelets', 'bracelets', 'Bracelets', 'Bracelets', 'Bracelets'),
(3, 'Pendent', 0, '../uploads/categories/0', 'Pendent', 'pendent', 'Pendent', 'Pendent', 'Pendent'),
(4, 'Tops', 0, '../uploads/categories/0', 'Tops', 'tops', 'Tops', 'Tops', 'Tops'),
(5, 'Jumki', 0, '../uploads/categories/0', 'Jumki', 'jumki', 'Jumki', 'Jumki', 'Jumki'),
(6, 'Necklace', 0, '../uploads/categories/0', 'Necklace', 'necklace', 'Necklace', 'Necklace', ''),
(7, 'Rings', 0, '../uploads/categories/0', 'Ring', 'rings', 'Ring', 'Ring', 'Ring'),
(8, 'Italian Chains', 0, '../uploads/categories/0', 'Italian Chain', 'italian-chains', 'Italian Chain', 'Italian Chain', 'Italian Chain'),
(9, 'Open setting diamond bangles', 1, '../uploads/categories/0', 'Open setting diamond bangles', 'open-setting-diamond-bangles', 'Open setting diamond bangles', 'Open setting diamond bangles', 'Open setting diamond bangles'),
(10, 'Close setting bangles', 1, '../uploads/categories/0', 'Close setting bangles', 'close-setting-bangles', 'Close setting bangles', 'Close setting bangles', 'Close setting bangles'),
(11, 'Flexible Bracelet', 2, '../uploads/categories/0', 'Flexible Bracelet', 'flexible-bracelet', 'Flexible Bracelet', 'Flexible Bracelet', 'Flexible Bracelet'),
(12, 'Open setting Pendent', 3, '../uploads/categories/0', 'Open setting Pendent', 'open-setting-pendent', 'Open setting Pendent', 'Open setting Pendent', 'Open setting Pendent'),
(13, 'Close setting Pendent', 3, '../uploads/categories/0', 'Close setting Pendent', 'close-setting-pendent', 'Close setting Pendent', 'Close setting Pendent', 'Close setting Pendent'),
(14, 'Open setting Tops', 4, '../uploads/categories/0', 'Open setting Tops', 'open-setting-tops', 'Open setting Tops', 'Open setting Tops', 'Open setting Tops'),
(15, 'Close setting tops', 4, '../uploads/categories/0', 'Close setting tops', 'close-setting-tops', 'Close setting tops', 'Close setting tops', 'Close setting tops'),
(16, 'Open setting Necklace', 6, '../uploads/categories/0', 'Open setting Necklace', 'open-setting-necklace', 'Open setting Necklace', 'Open setting Necklace', 'Open setting Necklace'),
(17, 'Open setting Ring', 7, '../uploads/categories/0', 'Open setting Ring', 'open-setting-ring', 'Open setting Ring', 'Open setting Ring', 'Open setting Ring'),
(18, 'Test', 0, '../uploads/categories/0', 'Test', 'test', '', '', '');

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
(41, 1, 6, 0, 0, 0, 0, '15', '', 0, 'material'),
(42, 1, 7, 0, 0, 0, 0, '10', '', 0, 'material'),
(43, 1, 6, 0, 0, 0, 0, '15', '', 0, 'material'),
(44, 1, 13, 11, 0, 0, 0, '12', '', 0, 'diamond'),
(45, 1, 14, 10, 0, 0, 0, '18', '', 0, 'diamond'),
(46, 1, 8, 12, 0, 0, 0, '10', '', 0, 'diamond'),
(65, 5, 7, 2, 0, 0, 0, '15', '', 0, 'material'),
(391, 6, 0, 2, 16, 0, 0, '0', '8', 0, 'material'),
(392, 6, 0, 3, 15, 0, 0, '0', '10', 0, 'material'),
(393, 6, 8, 12, 8, 15, 10, '20', '10', 0, 'diamond'),
(394, 6, 13, 11, 13, 500, 20, '5.36', '10', 0, 'diamond'),
(395, 6, 21, 0, 0, 1000, 10, '2.36', '10', 0, 'gemstone'),
(396, 6, 20, 0, 0, 2000, 20, '3.36', '10', 0, 'gemstone'),
(397, 6, 22, 0, 0, 0, 20, '2.36', '10', 0, 'diamond_shape'),
(398, 6, 19, 0, 0, 2000, 10, '2.36', '10', 0, 'pearls'),
(407, 7, 0, 2, 16, 0, 0, '2.36', '23', 0, 'material'),
(408, 7, 8, 12, 23, 2000, 10, '2.6', '23', 0, 'diamond'),
(409, 2, 0, 3, 16, 0, 0, '0', '2.3', 0, 'material'),
(410, 2, 0, 2, 15, 0, 0, '0', '2.2', 0, 'material'),
(411, 2, 8, 12, 0, 10, 10, '2.36', '2.2', 0, 'diamond'),
(412, 2, 13, 10, 0, 20, 20, '3.69', '2.2', 0, 'diamond'),
(413, 2, 21, 0, 0, 36, 20, '2.36', '2.2', 0, 'gemstone'),
(414, 2, 20, 0, 0, 46, 30, '1.36', '2.2', 0, 'gemstone'),
(415, 2, 22, 0, 0, 0, 10, '2.36', '2.2', 0, 'diamond_shape'),
(416, 2, 19, 0, 0, 100, 100, '3.6', '2.2', 0, 'pearls'),
(421, 3, 0, 0, 0, 0, 0, '10', '2.3', 0, 'material'),
(422, 3, 8, 12, 23, 50000, 12, '5', '2.3', 0, 'diamond'),
(423, 3, 22, 0, 0, 0, 5, '3', '2.3', 0, 'diamond_shape'),
(424, 4, 0, 0, 0, 0, 0, '2', '3', 0, 'material'),
(425, 8, 0, 2, 16, 0, 0, '5.3', '2.3', 0, 'material'),
(426, 8, 0, 3, 16, 0, 0, '6', '3.5', 0, 'material'),
(427, 8, 8, 12, 23, 20000, 1, '0.5', '3.5', 0, 'diamond'),
(428, 8, 13, 11, 23, 50000, 5, '0.87', '3.5', 0, 'diamond'),
(429, 8, 22, 0, 0, 0, 50, '1', '3.5', 0, 'diamond_shape');

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
(3, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'male', '::1', '2020-09-04 16:08:10', 1, '2020-09-03 07:58:57', '', '2020-09-03 07:58:57', '', '9700334319', NULL, NULL, NULL, NULL),
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
  MODIFY `Order_DetailsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_master`
--
ALTER TABLE `cart_master`
  MODIFY `OrderlD` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `m_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

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
  MODIFY `OptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

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

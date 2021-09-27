-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2020 at 08:17 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

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
-- Table structure for table `address_master`
--

CREATE TABLE `address_master` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(12) NOT NULL,
  `Address1` varchar(150) NOT NULL,
  `Address2` varchar(150) NOT NULL,
  `LandMark` varchar(100) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp(),
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
(1, 'jayaraju@deepredink.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jayaraju', 'vangapandu', 1, '2020-08-13 08:55:18', '::1', '9700334319', 'vijayawada', 1, 'Active', '2020-08-31 05:14:57'),
(2, 'venkat@deepredink.com', 'd41d8cd98f00b204e9800998ecf8427e', 'venkat', 'Yadav', 1, '2020-08-20 06:18:38', '::1', '9872458585', 'sdgfdg', 4, 'Active', '2020-08-23 15:46:39'),
(6, 'rajkumar@deepredink.com', '43ab12269b21434ab9132e1bda2aa78d', '', '', 1, '2020-08-31 06:16:20', '', '', '', 1, 'Active', '2020-08-31 06:16:20');

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
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `CouponAddedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `CouponExpiryDate` datetime NOT NULL,
  `Description` varchar(100) NOT NULL,
  `DiscountType` char(10) NOT NULL,
  `Cartamount` float NOT NULL,
  `Couponamount` float NOT NULL,
  `Is_Enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `material_type`
--

CREATE TABLE `material_type` (
  `MaterialID` int(11) NOT NULL,
  `MaterialName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material_type`
--

INSERT INTO `material_type` (`MaterialID`, `MaterialName`) VALUES
(1, 'Gold'),
(2, 'Platinum'),
(3, 'Silver');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `m_id` int(11) NOT NULL,
  `m_name` varchar(50) NOT NULL,
  `m_url` varchar(255) DEFAULT NULL,
  `m_desc` varchar(255) DEFAULT NULL,
  `m_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `m_position` varchar(50) DEFAULT NULL,
  `order_logic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`m_id`, `m_name`, `m_url`, `m_desc`, `m_created_at`, `m_position`, `order_logic`) VALUES
(1, 'Primary Menu', NULL, NULL, '2020-08-25 06:17:59', NULL, NULL);

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
(173, 1, 0, 'Gold', '#', '1', '', '2020-08-28 12:49:43'),
(174, 1, 173, 'Men', '', '1', '', '2020-08-28 12:49:43'),
(175, 1, 174, 'Rings', '', '1', '', '2020-08-28 12:49:43'),
(176, 1, 174, 'Pendents', '', '1', '', '2020-08-28 12:49:43'),
(177, 1, 174, 'Ear rings', '', '1', '', '2020-08-28 12:49:43'),
(178, 1, 173, 'Women', '', '1', '', '2020-08-28 12:49:43'),
(179, 1, 178, 'Rings', '', '1', '', '2020-08-28 12:49:43'),
(180, 1, 178, 'Ear rings', '', '1', '', '2020-08-28 12:49:43'),
(181, 1, 178, 'Chains', '', '1', '', '2020-08-28 12:49:43'),
(182, 1, 178, 'Bangles', '', '1', '', '2020-08-28 12:49:43'),
(183, 1, 178, 'Bracelets', '', '1', '', '2020-08-28 12:49:43'),
(184, 1, 0, 'Diamonds', '', '1', '', '2020-08-28 12:49:43'),
(185, 1, 184, 'Men', '', '1', '', '2020-08-28 12:49:43'),
(186, 1, 185, 'Rings', '', '1', '', '2020-08-28 12:49:43'),
(187, 1, 185, 'Ear rings', '', '1', '', '2020-08-28 12:49:43'),
(188, 1, 185, 'solitairs', '', '1', '', '2020-08-28 12:49:44'),
(189, 1, 184, 'Women', '', '1', '', '2020-08-28 12:49:44'),
(190, 1, 189, 'Rings', '', '1', '', '2020-08-28 12:49:44'),
(191, 1, 189, 'Ear rings', '', '1', '', '2020-08-28 12:49:44'),
(192, 1, 189, 'Solitairs', '', '1', '', '2020-08-28 12:49:44'),
(193, 1, 189, 'Pendents', '', '1', '', '2020-08-28 12:49:44'),
(194, 1, 189, 'Chains', '', '1', '', '2020-08-28 12:49:44'),
(195, 1, 189, 'Bangles', '', '1', '', '2020-08-28 12:49:44'),
(196, 1, 189, 'Bracelets', '', '1', '', '2020-08-28 12:49:44'),
(197, 1, 0, 'JBN', '', '1', '', '2020-08-28 12:49:44'),
(198, 1, 197, 'Gold', '', '1', '', '2020-08-28 12:49:44'),
(199, 1, 198, 'Men', '', '1', '', '2020-08-28 12:49:44'),
(200, 1, 199, 'Rings', '', '1', '', '2020-08-28 12:49:44'),
(201, 1, 199, 'Ear rings', '', '1', '', '2020-08-28 12:49:44'),
(202, 1, 199, 'Solitairs', '', '1', '', '2020-08-28 12:49:44'),
(203, 1, 197, 'Diamonds', '', '1', '', '2020-08-28 12:49:44'),
(204, 1, 203, 'Women', '', '1', '', '2020-08-28 12:49:45'),
(205, 1, 204, 'Rings', 'Ear rings', '1', '', '2020-08-28 12:49:45'),
(206, 1, 204, 'Pendents', '', '1', '', '2020-08-28 12:49:45'),
(207, 1, 204, 'Solitairs', '', '1', '', '2020-08-28 12:49:45'),
(208, 1, 204, 'Chains', '', '1', '', '2020-08-28 12:49:45'),
(209, 1, 204, 'Bangles', '', '1', '', '2020-08-28 12:49:45'),
(210, 1, 204, 'Bracelets', '', '1', '', '2020-08-28 12:49:45'),
(211, 1, 204, 'Motifs', '', '1', '', '2020-08-28 12:49:45'),
(212, 1, 204, 'Necklaces', '', '1', '', '2020-08-28 12:49:45'),
(213, 1, 204, 'Pendent sets', '', '1', '', '2020-08-28 12:49:45'),
(214, 1, 204, 'Nose pins', '', '1', '', '2020-08-28 12:49:45'),
(215, 1, 204, 'waist belts', '', '1', '', '2020-08-28 12:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `options_group`
--

CREATE TABLE `options_group` (
  `OptionGroupID` int(11) NOT NULL,
  `OptionGroupName` varchar(50) DEFAULT NULL,
  `Display` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options_group`
--

INSERT INTO `options_group` (`OptionGroupID`, `OptionGroupName`, `Display`) VALUES
(1, 'Diamond Color', 'Yes'),
(2, 'Metal', 'Yes'),
(3, 'Size', 'No'),
(4, 'Color', 'No'),
(5, 'Diamond Clarity', 'No'),
(6, 'Gold Color', 'No'),
(7, 'Pearls', 'No'),
(8, 'Gemstone', 'No'),
(9, 'Diamond Shape', 'No');

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
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, 'about', 'about', 'about', '<p> </p>\r\n\r\n<h3><strong>Profile</strong></h3>\r\n\r\n<p>Taruni is a brand that has been addressing the fashion needs of the modern woman for 25 years. Since its inception, Taruni has always been a clothing brand for the contemporary Indian woman who believes in being her own. Taruni outfits are for the woman who practices and propagates traditional values, and yet is contemporary in her own ways.<br>\r\n<br>\r\nTo define the personality of Brand Taruni, it’s a name that is quintessentially progressive, upbeat and forward-looking. The Taruni woman stands on a pedestal she has created. She’s a personification of changing times who ushers in her own trends and shies away from adapting what exists and is dated.</p>\r\n\r\n<p>Detailing the tangible product aspects, Taruni is always led by designs and colours that the current-day woman can relate to. Bold, bright, experimentative, Taruni is known to unleash a barrage of variety at prices that are convenient and purse-friendly.</p>\r\n\r\n<p>Over the years, Taruni has established itself as a brand known to offer a variety of mix ‘n’ match kurtis made with minute detailing and style that makes space in the wardrobe of the everyday stylish woman.</p>\r\n\r\n<p>That part, Taruni offers a large variety of Indian colours in un-stitched and ready-to-wear salwars formats. Designer wear (only one piece in design style and colour) ghagras and wedding gowns are relatively new additions. All of these have made Taruni a unique destination for women in twin cities.</p>\r\n\r\n<p>At Taruni, NRIs find themselves to be at home, so much so that they purchase their entire year’s ethnic wardrobe during their annual visit to Hyderabad, and at fixed prices unlike any other store.</p>\r\n\r\n<p> Quality is another vital feature that Taruni’s merchandise feature. With its apparel, a woman looks beautiful even in simple cotton outfits.<br>\r\n<br>\r\nThe recent re-launch of Taruni has brought the brand closer to the younger generation. Taruni is a sough-after store by the women folk looking to carve a place for themselves in the world – from college students with a distinct outlook at their future, confident career women drawing out a defining future for themselves, to young women next door who is always looking out for new, contemporary and cutting-edge fashion.<br>\r\n<br>\r\nTaruni caters to an array of women. It is growing and fast. The store has a marked presence in Hyderabad, Vijayawada, Vishakhapatnam and Hanumakonda and is constantly looking to satiate the fashion cravings of women by its presence.</p>\r\n\r\n<p><br>\r\n </p>', 'Women, Clothing, Brand, Taruni, Kurti, Lehengas, Ethnic wear,  Indian dresses, Party wear, Online shop, Buy, Online, Shop online', 'page_images/cropper.jpg', 1),
(2, 'terms of use', 'terms and conditions', 'terms-and-conditions', '<p> </p>\r\n\r\n<h3><strong>Introduction: </strong></h3>\r\n\r\n<p>Under this category, we aim to provide information contained on the website or any of the pages comprising the website-(<a href=\"http://www.taruni.in\">www.taruni.in</a>) [<em>cumulatively referred to “Website” or “Website Owner” or “we” or “us” or “our”</em>] to visitors (“visitors”) [<em>cumulatively referred to as “you” or “your” hereinafter</em>] subject to the privacy policy and any other relevant policies and notices which may be applicable to a specific section or module of the website/visitor.</p>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Terms & Conditions </strong></h3>\r\n\r\n<p>Welcome to our website(<a href=\"http://www.taruni.in\">www.taruni.in</a>) . If you continue to browse and use this website you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern [business name]&#39;s relationship with you in relation to this website.</p>\r\n\r\n<p>The term &#39;Taruni&#39; or &#39;us&#39; or &#39;we&#39; belongs to the owner of the website whose registered offices is located in Secunderabad, Ameerpet, Kukatpally, Jubilee Hills, Saroor Nagar, ECIL, Visakhapatnam, Hanumakonda, Vijayawada. Our company registration number is U17121AP2008PTC057876. The term &#39;you&#39; refers to the user or viewer of our website.</p>\r\n\r\n<p>The use of this website is subject to the following terms of use:</p>\r\n\r\n<ul>\r\n <li>Every shipment comes with a Taruni bill within the parcel, please remember to read the terms and conditions printed on the back of the bill.</li>\r\n <li>The content of the pages of this website is for your general information and use only. It is subject to change without notice.</li>\r\n</ul>\r\n\r\n<ul>\r\n <li>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>\r\n <li>Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.</li>\r\n <li>This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</li>\r\n <li>All trademarks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.</li>\r\n <li>Unauthorised use of this website may give rise to a claim for damages and/or be a criminal offence.</li>\r\n <li>From time to time this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).</li>\r\n <li>You may not create a link to this website from another website or document without Taruni&#39;s prior written consent.</li>\r\n <li>Your use of this website and any dispute arising out of such use of the website is subject to the laws of India or other regulatory authority.</li>\r\n</ul>\r\n\r\n<p> </p>\r\n\r\n<h3><strong>Coupon Redemption Terms</strong></h3>\r\n\r\n<p>Coupon redemption is purely subjected to specified terms and conditions on taruni.in. Taruni.in does not have an existing partnership with any ecommerce websites & affiliate advertising agencies. Taruni.in will not accept any coupons listed on third party websites. Coupons/Vouchers cannot be posted or shared by recipients on social or public forums as these are personal coupons.</p>', 'terms and conditions', '', 2),
(3, 'privacy policy', 'our privacy policy', 'privacy-policy', '<p>&nbsp;</p>\n<h3><strong>Website privacy</strong></h3>\n<p>This privacy policy sets out how Taruni uses and protects any information that you give Taruni when you use this website.</p>\n<p>Taruni is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website, then you can be assured that it will only be used in accordance with this privacy statement.</p>\n<p>Taruni may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes. This policy is effective from April 15, 2015.</p>\n<h3><strong>What we collect</strong></h3>\n<p>We may collect the following information:</p>\n<ul>\n<li>name and job title</li>\n<li>contact information including email address</li>\n<li>demographic information such as postcode, preferences and interests</li>\n<li>other information relevant to customer surveys and/or offers</li>\n</ul>\n<h3><strong>What we do with the information we gather</strong></h3>\n<p>We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:</p>\n<ul>\n<li>Internal record keeping.</li>\n<li>We may use the information to improve our products and services.</li>\n<li>We may periodically send promotional emails about new products, special offers or other information which we think you may find interesting using the email address which you have provided.</li>\n<li>From time to time, we may also use your information to contact you for market research purposes. We may contact you by email, phone, fax or mail. We may use the information to customise the website according to your interests.</li>\n</ul>\n<h3><strong>Security</strong></h3>\n<p>We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online.</p>\n<h3><strong>How we use cookies</strong></h3>\n<p>A cookie is a small file which asks permission to be placed on your computer\'s hard drive. Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit a particular site. Cookies allow web applications to respond to you as an individual. The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering information about your preferences.</p>\n<p>We use traffic log cookies to identify which pages are being used. This helps us analyse data about webpage traffic and improve our website in order to tailor it to customer needs. We only use this information for statistical analysis purposes and then the data is removed from the system.</p>\n<p>Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful and which you do not. A cookie in no way gives us access to your computer or any information about you, other than the data you choose to share with us.</p>\n<p>You can choose to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. This may prevent you from taking full advantage of the website.</p>\n<h3><strong>Links to other websites</strong></h3>\n<p>Our website may contain links to other websites of interest. However, once you have used these links to leave our site, you should note that we do not have any control over that other website. Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst visiting such sites and such sites are not governed by this privacy statement. You should exercise caution and look at the privacy statement applicable to the website in question.</p>\n<h3><strong>Controlling your personal information</strong></h3>\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n<ul>\n<li>whenever you are asked to fill in a form on the website, look for the box that you can click to indicate that you do not want the information to be used by anybody for direct marketing purposes</li>\n<li>if you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time by writing to or emailing us at [email address]</li>\n</ul>\n<p>We will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law to do so.</p>\n<p>You may request details of personal information which we hold about you under the Data Protection Act 1998. A small fee will be payable. If you would like a copy of the information held on you please write to [address].</p>\n<p>If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible, at the above address. We will promptly correct any information found to be incorrect.</p>\n<h3><strong>Contacting Us</strong></h3>\n<p>If there are any questions regarding this privacy policy you may contact us using the information below:</p>\n<p>Company Name: Taruni Clothing Private Limited</p>\n<p>Address: 1-7-347 to 349, 401 &amp; 402, 4th floor, Mahmood Chinoy Complex, Parklane, Sec\'Bad - 500003</p>\n<p>Telephone No - +91 9492021805</p>\n<p>E-Mail ID - <a href=\"mailto:eshop@taruni.in\">eshop@taruni.in</a></p>', '', '', 0),
(4, 'Disclaimer', 'Disclaimer', 'disclaimer', '<p>&nbsp;</p>\n<h3><strong>Taruni.in Disclaimer policy</strong>&nbsp;&nbsp;</h3>\n<p>Every shipment comes with a Taruni bill within the parcel, please remember to read the terms and conditions printed on the back of the bill.</p>\n<p>The information contained in this website is for general information purposes only. The information is provided by [business name] and while we endeavor to keep the information up to date and correct, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability or availability with respect to the website or the information, products, services, or related graphics contained on the website for any purpose. Any reliance you place on such information is therefore strictly at your own risk.</p>\n<p>In no event will we be liable for any loss or damage including without limitation, indirect or consequential loss or damage, or any loss or damage whatsoever arising from loss of data or profits arising out of, or in connection with, the use of this website.</p>\n<p>Through this website you are able to link to other websites which are not under the control of Taruni. We have no control over the nature, content and availability of those sites. The inclusion of any links does not necessarily imply a recommendation or endorse the views expressed within them.</p>\n<p>Every effort is made to keep the website up and running smoothly. However, Taruni takes no responsibility for, and will not be liable for, the website being temporarily unavailable due to technical issues beyond our control.</p>\n<p>All orders are subject to Custom duty and customers may/may not be charged by the government/department of customs of the respective country to which parcel is being delivered. these duties do not come under the jurisdiction of Taruni.in and will be borne/paid by the customer.</p>', 'disclaimer', '', 0),
(5, 'Cancellation and Refund Policy', 'Cancellation Policy', 'cancellation-and-refund-policy', '<p style=\"text-align: justify;\">&nbsp;</p>\n<h3><strong>Cancellation Policy</strong></h3>\n<p>Taruni believes in helping its customers as far as possible, and has therefore a liberal cancellation policy. Under this policy</p>\n<ul>\n<li>Cancellations will be considered only if the request is made within 36&nbsp;hours of placing an order (after which the &lsquo;cancel&rsquo; button will be disabled) However, the cancellation request will not be entertained if the orders have been communicated to the vendors/merchants and they have initiated the process of shipping them.</li>\n<li>There is no cancellation of orders placed under the Same Day Delivery category.</li>\n<li>No cancellations are entertained for those products that the <strong>Taruni</strong>&nbsp;marketing team has obtained on special occasions like Pongal, Diwali, Valentine&rsquo;s Day etc. These are limited occasion offers and therefore cancellations are not possible.</li>\n<li>In case of receipt of damaged or defective, please report the same to our Customer Service E-mail ID. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within 3 days of receipt of the products.</li>\n<li>In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within 24 hours of receiving the product. The Customer Service Team after looking into your complaint will take an appropriate decision.</li>\n</ul>\n<p>&nbsp;</p>\n<h3><strong>Exchange Policy -</strong></h3>\n<p>We will accept exchanges <strong>(but no refunds)&nbsp;</strong></p>\n<p>The customer will require the bill and the product to be returned along with the price tag.&nbsp;</p>\n<ul>\n<li>Exchange will be considered only for any physical damages during shipping.</li>\n<li>You must make your return within 3 days of the delivery date if the delivery has been made to India / 14 days if the delivery has been made elsewhere.</li>\n<li>Shipping charges are not refundable.</li>\n<li>Unless delivered goods are damaged, customers are required to bear two way shipping costs for exchange of clothes.</li>\n<li>We will not accept merchandise that has been worn, altered, or washed.</li>\n<li>The customer will be required to produce the bill and the product to be returned along with the price tag.</li>\n<li>Upon receipt of returned products, we reserve the right to deny a refund if the merchandise does not meet return policy requirements.</li>\n<li>Please note that while we want you to be happy with your purchases, an excessive number of returns in a twelve-month period may cause us to reject future orders from you.</li>\n<li>Products once altered cannot be exchanged.</li>\n</ul>\n<p>The products must be returned to the following address:</p>\n<p>Taruni Clothing Pvt. Ltd.<br />Malani Excel,<br />10-3-150 &amp; 151, 4th Floor, St. Johns Road,<br />Beside Ratnadeep Sup. Market,<br />East Marredpally, Secunderabad,<br />Telangana. Pin: 500026.</p>\n<p>Ph:&nbsp;+91 9492021805</p>', 'cancellation policy', '', 0),
(6, 'Shipping and Delivery Policy', 'Shipping and Delivery Policy', 'shipping-and-delivery-policy', '<p>&nbsp;</p>\n<h3><strong>Shipping &amp; Delivery Policy</strong></h3>\n<p>Taruni.in follows a delivery time frame for national and international orders and takes into considerations any restrictions that could be imposed on delivering these products. Our policy entails information for the products and services we offer.</p>\n<h3><strong>Shipping &amp; Delivery Policy (Products)</strong></h3>\n<p>At taruni.in, shipping will be done on weight and not on per piece basis.(Cost / Weight Policy)<br />We will be charging 1500/kg on shipments. Weights will be standard for each vertical: Ready to wear - 1.5Kgs, Kurtis - 0.5Kg, Leggings- no charge, Lehengas - 2.5Kg, Dress Materials - 1Kg.</p>\n<p>For domestic buyers, orders are shipped through registered domestic courier companies/ speed post and/or Taruni&rsquo;s own delivery system.</p>\n<ul>\n<li>Shipping free in India (2-3 Days for Metros, 7 days)</li>\n</ul>\n<p>For International buyers, orders are shipped and delivered through registered international courier companies and/or International speed post only. (Shipping Internationally - Rs. 1500/kg increases with number of products and the weight)</p>\n<p>Taruni is not liable for any delay in delivery by the courier company / postal authorities and only guarantees to hand over the consignment to the courier company or postal authorities within 15 working days from the date of the order and payment or as per the delivery date agreed at the time of order confirmation. Delivery of all orders will be to registered address of the buyer as per the credit/debit card only at all times(Unless specified at the time of Order). Taruni &nbsp;is in no way responsible for any damage to the order while in transit to the buyer.</p>\n<h3><strong>Payments</strong></h3>\n<p>Taruni is proud to use credible payment gateways for fast, easy and efficient secure payments. All major credit cards are accepted.</p>\n<h3><strong>Shipping and Delivery Policy (services)</strong></h3>\n<p>Delivery of our services will be confirmed on your mail ID as specified during registration. For any issues in utilizing our services you may contact our helpdesk on +91 9492021805.</p>\n<p>Unless delivered goods are damaged, customers are required to bear two way shipping costs for exchange of clothes.</p>\n<p>All orders are subject to Custom duty and customers may/may not be charged by the government/department of customs of the respective country to which parcel is being delivered. these duties do not come under the jurisdiction of Taruni.in and will be borne/paid by the customer.</p>', 'Shipping and delivery', '', 0),
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
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `currency` varchar(20) NOT NULL,
  `TransactionID` varchar(100) NOT NULL,
  `PaymentStatus` enum('Sucess','failed','On Hold','declined','pending') DEFAULT NULL,
  `Payment_method` enum('COD','Credit Card','Debit','Netbanking','APIS') DEFAULT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp(),
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
(22, 9, 'Round');

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
  `UpdateDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Stock` float DEFAULT NULL,
  `Productlive` tinyint(4) DEFAULT 0 COMMENT '1=Yes,0=No',
  `Provision_for_opening` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Gender` enum('Women','Men') NOT NULL,
  `Collection` int(11) NOT NULL,
  `Addedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modifiedon` timestamp NOT NULL DEFAULT current_timestamp(),
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
(2, 'ER0001', 'Gold Rings', 'gold-rings', 4, 2000, 'fix', 801, 'fix', 1, '15.26', '14.26', '26.23', '', 'Alocasia Root Earring', '', '', 'product_images/JR00196-YGP9RG_11_listfront.jpg', 13, 15, '2020-08-29 05:22:02', 3, 1, 'No', 'Women', 0, '2020-08-19 11:07:59', '2020-08-29 05:22:02', '', '', 0, 1, 5, '49.530gms', '46.650gms', 'Yellow gold with white pen rodium', '', '', '', '0'),
(3, 'ER0001', 'Enagagement Rings', 'enagagement-rings', 0, 0, '', 1000, '', 0, '15.26', '14.26', '26.23', '', 'Alocasia Root Earring', '', '', 'product_images/JR00300-WGP9TO_12_listhover.jpg', 5, 6, '2020-08-20 07:50:56', 0, 1, 'Yes', 'Women', 0, '2020-08-19 11:07:59', '2020-08-20 07:50:56', '', '', 0, 2, 0, '', '', '', '', '', '', '0'),
(4, 'ER0001', 'Platinum Rings', 'platinum-rings', 0, 0, '', 1000, '', 0, '15.26', '14.26', '26.23', '', 'Alocasia Root Earring', '', '', 'product_images/JR00313-WGP900_11_listfront.jpg', 5, 6, '2020-08-20 07:51:48', 0, 1, 'Yes', 'Women', 0, '2020-08-19 11:07:59', '2020-08-20 07:51:48', '', '', 0, 2, 0, '', '', '', '', '', '', '0'),
(6, 'ABCD002', 'Chaing', 'chaing', 0, 0, 'gram', 200, 'gross weight', 0, '1.26', '6.36', '5.36', '', '', '', '', 'product_images/diskfull1.png', 13, 15, '2020-08-28 02:54:56', 20, 1, 'Yes', 'Women', 0, '2020-08-28 02:17:22', '2020-08-28 02:54:56', '', '', 0, 1, 20, '2.36', '3.62', 'Tesitng', '', '', '', '0'),
(7, 'SP001', 'Silver Product', 'silver-product', 35000, 30000, 'fix', 3000, 'fix', 5, '1.25', '10.26', '10.2', '', 'Testing', '', '', '', 7, 11, '2020-08-31 03:37:54', 20, 1, 'Yes', 'Women', 0, '2020-08-31 03:37:54', '2020-08-31 03:37:54', 'Admin', '::1', 0, 1, 2, '10.32', '12.36', 'Testing', '', '', '', '0');

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
(1, 'Gold', 0, 'categeory_images/8c84ff115abe410e8769a238bdacc994.jpg', 'gold', 'gold', 'gold', 'gold', 'gold');

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
(61, 3, 7, 0, 0, 0, 0, '25', '', 0, 'material'),
(62, 3, 0, 0, 0, 0, 0, '', '', 0, 'diamond'),
(63, 4, 7, 0, 0, 0, 0, '15', '', 0, 'material'),
(64, 4, 0, 0, 0, 0, 0, '', '', 0, 'diamond'),
(65, 5, 7, 2, 0, 0, 0, '15', '', 0, 'material'),
(391, 6, 0, 2, 16, 0, 0, '0', '8', 0, 'material'),
(392, 6, 0, 3, 15, 0, 0, '0', '10', 0, 'material'),
(393, 6, 8, 12, 8, 15, 10, '20', '10', 0, 'diamond'),
(394, 6, 13, 11, 13, 500, 20, '5.36', '10', 0, 'diamond'),
(395, 6, 21, 0, 0, 1000, 10, '2.36', '10', 0, 'gemstone'),
(396, 6, 20, 0, 0, 2000, 20, '3.36', '10', 0, 'gemstone'),
(397, 6, 22, 0, 0, 0, 20, '2.36', '10', 0, 'diamond_shape'),
(398, 6, 19, 0, 0, 2000, 10, '2.36', '10', 0, 'pearls'),
(399, 2, 0, 3, 16, 0, 0, '0', '2.3', 0, 'material'),
(400, 2, 0, 2, 15, 0, 0, '0', '2.2', 0, 'material'),
(401, 2, 8, 12, 8, 10, 10, '2.36', '2.2', 0, 'diamond'),
(402, 2, 13, 10, 13, 20, 20, '3.69', '2.2', 0, 'diamond'),
(403, 2, 21, 0, 0, 36, 20, '2.36', '2.2', 0, 'gemstone'),
(404, 2, 20, 0, 0, 46, 30, '1.36', '2.2', 0, 'gemstone'),
(405, 2, 22, 0, 0, 0, 10, '2.36', '2.2', 0, 'diamond_shape'),
(406, 2, 19, 0, 0, 100, 100, '3.6', '2.2', 0, 'pearls');

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
  `UserLastLoginIP` varchar(20) NOT NULL,
  `UserLastLoginDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserEmailVerified` tinyint(1) NOT NULL,
  `UserRegistrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserVerificationCode` varchar(20) NOT NULL,
  `UserVerificationDate` timestamp NOT NULL DEFAULT current_timestamp(),
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

INSERT INTO `users` (`UserID`, `UserEmail`, `UserPassword`, `UserFirstName`, `UserLastName`, `UserLastLoginIP`, `UserLastLoginDate`, `UserEmailVerified`, `UserRegistrationDate`, `UserVerificationCode`, `UserVerificationDate`, `UserIP`, `UserPhone`, `UserAltPhone`, `UserCountry`, `UserAddress`, `UserAddress2`) VALUES
(1, 'rajkumar@deepredink.com', '43ab12269b21434ab9132e1bda2aa78d', 'Raj', 'Kumar', '', '2020-08-26 16:40:34', 1, '2020-08-26 16:40:34', '', '2020-08-26 16:40:34', '', NULL, NULL, NULL, NULL, NULL);

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
-- AUTO_INCREMENT for table `material_type`
--
ALTER TABLE `material_type`
  MODIFY `MaterialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `m_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `options_group`
--
ALTER TABLE `options_group`
  MODIFY `OptionGroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `OptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `Product_imagesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `ProductOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

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
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `WishlistID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

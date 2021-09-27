-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2020 at 11:37 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`m_item_id`),
  ADD KEY `m_id` (`m_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `m_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=781;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

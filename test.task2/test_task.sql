-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 10, 2019 at 01:04 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test.task`
--

-- --------------------------------------------------------

--
-- Table structure for table `main_category`
--

CREATE TABLE `main_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_category`
--

INSERT INTO `main_category` (`id`, `name`) VALUES
(1, 'Phone'),
(2, 'Tab'),
(3, 'Laptop'),
(4, 'PC');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`) VALUES
(1, 'Iphone 6s', '200'),
(2, 'Iphone 8', '400'),
(3, 'Asus Pro', '800'),
(4, 'Asus Home', '700'),
(5, 'SupCom', '9000'),
(6, 'Ipad 200', '300'),
(7, 'Apple Mag', '5465'),
(8, 'PC Gt', '549'),
(9, 'Asus Laptop Pro', '254'),
(10, 'Mac Book Gda', '54546'),
(11, 'HK PC', '45'),
(12, 'Loj PC', '45'),
(13, 'Tab New', '1524'),
(14, 'Tab old', '4554');

-- --------------------------------------------------------

--
-- Table structure for table `product_to_category`
--

CREATE TABLE `product_to_category` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `sub_cat1_id` int(11) NOT NULL,
  `sub_cat2_id` int(11) NOT NULL,
  `sub_cat3_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_to_category`
--

INSERT INTO `product_to_category` (`id`, `product_id`, `main_category_id`, `sub_cat1_id`, `sub_cat2_id`, `sub_cat3_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 1, 2),
(3, 1, 1, 1, 2, 3),
(5, 2, 1, 1, 2, 4),
(7, 2, 1, 1, 2, 3),
(9, 3, 3, 3, 3, 5),
(10, 3, 3, 3, 3, 6),
(11, 4, 3, 3, 4, 8),
(12, 4, 3, 3, 4, 7),
(13, 5, 3, 2, 5, 10),
(14, 5, 3, 2, 5, 11),
(15, 5, 3, 2, 6, 13),
(16, 5, 3, 2, 6, 14),
(17, 6, 2, 4, 7, 15),
(18, 8, 4, 5, 10, 22),
(19, 8, 4, 5, 10, 23),
(20, 9, 4, 5, 10, 23),
(21, 10, 3, 3, 3, 5),
(22, 10, 3, 3, 4, 7),
(23, 11, 4, 6, 13, 29),
(24, 12, 4, 6, 12, 26),
(25, 13, 4, 5, 10, 23),
(26, 14, 4, 5, 11, 24),
(27, 7, 3, 3, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `sub_cat_1`
--

CREATE TABLE `sub_cat_1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `main_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_cat_1`
--

INSERT INTO `sub_cat_1` (`id`, `name`, `main_category_id`) VALUES
(1, 'Iphone', 1),
(2, 'Asus', 3),
(3, 'Mac', 3),
(4, 'Ipad', 2),
(5, 'Pro', 4),
(6, 'Home', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sub_cat_2`
--

CREATE TABLE `sub_cat_2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sub_cat1_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_cat_2`
--

INSERT INTO `sub_cat_2` (`id`, `name`, `sub_cat1_id`) VALUES
(1, '64Gb', 1),
(2, '128Gb', 1),
(3, '15d', 3),
(4, '13d', 3),
(5, 'Intel', 2),
(6, 'Celeron', 2),
(7, '16Gb', 4),
(8, '32Gb', 4),
(9, '64Gb', 4),
(10, 'Game', 5),
(11, 'Business', 5),
(12, 'Game', 6),
(13, 'Business', 6),
(14, 'Music', 6);

-- --------------------------------------------------------

--
-- Table structure for table `sub_cat_3`
--

CREATE TABLE `sub_cat_3` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sub_cat2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_cat_3`
--

INSERT INTO `sub_cat_3` (`id`, `name`, `sub_cat2_id`) VALUES
(1, 'Black', 1),
(2, 'White', 1),
(3, 'Black', 2),
(4, 'White', 2),
(5, '64Gb RAM', 3),
(6, '128Gb RAM', 3),
(7, '64Gb RAM', 4),
(8, '128Gb RAM', 4),
(9, 'Win7', 5),
(10, 'Mac OS', 5),
(11, 'Win10', 5),
(12, 'Win7', 6),
(13, 'Linux', 6),
(14, 'Win10', 6),
(15, 'Black', 7),
(16, 'White', 7),
(17, 'Black', 8),
(18, 'White', 8),
(19, 'Black', 9),
(20, 'White', 9),
(21, 'Small', 10),
(22, 'Big', 10),
(23, 'Box', 10),
(24, 'Small', 11),
(25, 'Box', 11),
(26, 'Light', 12),
(27, 'Dark', 12),
(28, 'Light', 13),
(29, 'Dark', 13),
(30, 'Light', 14),
(31, 'Dark', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `main_category`
--
ALTER TABLE `main_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_to_category`
--
ALTER TABLE `product_to_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_category_id` (`main_category_id`),
  ADD KEY `sub_cat1_id` (`sub_cat1_id`),
  ADD KEY `sub_cat2_id` (`sub_cat2_id`),
  ADD KEY `sub_cat3_id` (`sub_cat3_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `main_category_id_2` (`main_category_id`);

--
-- Indexes for table `sub_cat_1`
--
ALTER TABLE `sub_cat_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_category_id` (`main_category_id`);

--
-- Indexes for table `sub_cat_2`
--
ALTER TABLE `sub_cat_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_cat1_id` (`sub_cat1_id`);

--
-- Indexes for table `sub_cat_3`
--
ALTER TABLE `sub_cat_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_cat2_id` (`sub_cat2_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `main_category`
--
ALTER TABLE `main_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `product_to_category`
--
ALTER TABLE `product_to_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `sub_cat_1`
--
ALTER TABLE `sub_cat_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sub_cat_2`
--
ALTER TABLE `sub_cat_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sub_cat_3`
--
ALTER TABLE `sub_cat_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_to_category`
--
ALTER TABLE `product_to_category`
  ADD CONSTRAINT `product_to_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_to_category_ibfk_5` FOREIGN KEY (`sub_cat3_id`) REFERENCES `sub_cat_3` (`id`);

--
-- Constraints for table `sub_cat_1`
--
ALTER TABLE `sub_cat_1`
  ADD CONSTRAINT `sub_cat_1_ibfk_1` FOREIGN KEY (`main_category_id`) REFERENCES `main_category` (`id`);

--
-- Constraints for table `sub_cat_2`
--
ALTER TABLE `sub_cat_2`
  ADD CONSTRAINT `sub_cat_2_ibfk_1` FOREIGN KEY (`sub_cat1_id`) REFERENCES `sub_cat_1` (`id`);

--
-- Constraints for table `sub_cat_3`
--
ALTER TABLE `sub_cat_3`
  ADD CONSTRAINT `sub_cat_3_ibfk_1` FOREIGN KEY (`sub_cat2_id`) REFERENCES `sub_cat_2` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

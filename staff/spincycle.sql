-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 12, 2024 at 09:46 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spincycle`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `name`, `password`) VALUES
(1, 'vikas@gmail.com', 'admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `dress_type` varchar(50) NOT NULL,
  `material` varchar(50) NOT NULL,
  `wash_method` varchar(50) NOT NULL,
  `delivery_form` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `dress_type`, `material`, `wash_method`, `delivery_form`, `quantity`) VALUES
(48, 5, 'Shirt', 'silk', 'Washing', 'fold', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carted`
--

DROP TABLE IF EXISTS `carted`;
CREATE TABLE IF NOT EXISTS `carted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `dress_type` varchar(20) NOT NULL,
  `material` varchar(20) NOT NULL,
  `wash_method` varchar(20) NOT NULL,
  `delivery_form` varchar(20) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `carted`
--

INSERT INTO `carted` (`id`, `user_id`, `dress_type`, `material`, `wash_method`, `delivery_form`, `quantity`) VALUES
(1, 1, 'T-Shirt', 'Cotton', 'Washing', 'fold', 3),
(2, 1, 'Short', 'Cotton', 'Washing', 'fold', 3),
(3, 1, 'Shirt', 'Cotton', 'Washing', 'fold', 3),
(4, 4, 'Bed Sheet (S)', 'Nylon', 'Dry Cleaning', 'fold', 3),
(5, 4, 'Short', 'Cotton', 'Dry Cleaning', 'fold', 2),
(6, 1, 'Short', 'Cotton', 'Dry Cleaning', 'fold', 4),
(7, 1, 'Shirt', 'Cotton', 'Washing', 'fold', 5),
(8, 5, 'Short', 'Cotton', 'Washing', 'fold', 3),
(9, 5, 'Shirt', 'silk', 'Washing', 'fold', 4),
(10, 1, 'Shirt', 'Wool', 'Washing', 'fold', 1),
(11, 1, 'Shirt', 'Cotton', 'Washing', 'fold', 3),
(12, 1, 'Shirt', 'Cotton', 'Washing', 'fold', 1),
(13, 2, 'Shirt', 'silk', 'Washing', 'fold', 4),
(14, 1, 'Shirt', 'Cotton', 'Washing', 'fold', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `number`, `password`) VALUES
(1, 'Yathursan', 'yathu@gmail.com', '0763534626', 'yathu@31'),
(2, 'Alex', 'alex@gmail.com', '0771234567', 'alex@31'),
(3, 'Harshanth', 'harsha@gmail.com', '0777654321', '1234'),
(4, 'hh', 'hg@gmail.com', '1234567890', '123'),
(5, 'Harshanth', 'podasonki@gmail.com', '0761819289', 'sonki@31');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_method`
--

DROP TABLE IF EXISTS `delivery_method`;
CREATE TABLE IF NOT EXISTS `delivery_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `delivery_method`
--

INSERT INTO `delivery_method` (`id`, `name`, `price`) VALUES
(1, 'Standard Delivery', 100),
(2, 'Express Delivery', 300);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `messages` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `subject`, `messages`) VALUES
(1, 'Alex', 'alex@gmail.com', 'Hello', 'Hi vro!'),
(2, 'Alex', 'alex@gmail.com', 'Hello', 'Poda Pandi');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
CREATE TABLE IF NOT EXISTS `form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id`, `name`, `price`) VALUES
(1, 'fold', 50),
(2, 'hang', 20);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `name`, `price`) VALUES
(1, 'Cotton', 50),
(2, 'silk', 50),
(3, 'Wool', 20),
(4, 'Linen', 30),
(5, 'Denim', 60),
(6, 'Nylon', 45);

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
CREATE TABLE IF NOT EXISTS `method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `method`
--

INSERT INTO `method` (`id`, `name`, `price`) VALUES
(1, 'Washing', 70),
(2, 'Dry Cleaning', 50),
(3, 'Pressing', 40);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `mobile` int NOT NULL,
  `orders` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `total_amount` int NOT NULL,
  `pickup_address` varchar(500) NOT NULL,
  `delivery_address` varchar(500) NOT NULL,
  `delivery_method` varchar(20) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `mobile`, `orders`, `total_amount`, `pickup_address`, `delivery_address`, `delivery_method`, `payment_method`, `order_date`, `status`) VALUES
(1, 1, 0, 'short (4), shirt (2)', 2580, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-09-30 21:51:14', 'pickedup'),
(2, 2, 0, 'short (6), shirt (4)', 4420, 'Colombo 2', 'Colombo 2', 'Express Delivery', 'Cash on Delivery', '2024-09-30 21:52:56', 'Pending'),
(3, 1, 0, 'shirt (2)', 900, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-01 19:00:54', 'Paid'),
(4, 1, 0, 'short (4), shirt (5)', 3680, 'Colombo 1', 'Colombo 1', 'Express Delivery', 'Cash on Delivery', '2024-10-01 19:21:38', 'Pending'),
(5, 1, 0, 'Shirt (5), Short (6), Trousers (10)', 7920, 'Colombo 1', 'Colombo 1', 'Express Delivery', 'Cash on Delivery', '2024-10-02 12:11:37', 'Pending'),
(6, 3, 0, 'Shirt (6), Trousers (6)', 4600, 'No 69. Wattala kurukku sandhu, Gambaha, Sri lanka.', 'No 69. Wattala kurukku sandhu, Gambaha, Sri lanka.', 'Standard Delivery', 'Cash on Delivery', '2024-10-02 12:25:47', 'Pending'),
(7, 1, 0, 'Shirt (5), T-Shirt (6)', 2890, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-02 13:28:38', 'Pending'),
(8, 1, 0, 'Shirt (3), Short (5), Suit (6)', 5975, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-04 19:02:32', 'Pending'),
(9, 1, 0, 'Shirt (3), Short (5), Suit (6)', 5975, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-04 19:04:34', 'Pending'),
(10, 1, 0, 'Shirt (3), Short (3), T-Shirt (3)', 2365, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-04 19:22:11', 'Pending'),
(11, 4, 0, 'Short (2), Bed Sheet (S) (3)', 1185, '10 colombo rd, colombo', '10 colombo rd, colombo', 'Express Delivery', 'Credit Card', '2024-10-07 10:51:47', 'Pending'),
(12, 1, 0, 'Shirt (5), Short (4)', 2350, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-07 13:11:35', 'Pending'),
(13, 5, 0, 'Shirt (4), Short (3)', 1915, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-08 12:13:43', 'Paid'),
(14, 1, 0, 'Shirt (1)', 340, 'ascasc', 'sdfdf', 'Standard Delivery', 'Cash on Delivery', '2024-10-10 12:22:59', 'Pending'),
(15, 1, 0, 'Shirt (3)', 910, 'aas', 'sdfs', 'Standard Delivery', 'Cash on Delivery', '2024-10-10 12:36:27', 'Pending'),
(16, 1, 763534626, 'Shirt (1)', 370, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-10 15:00:58', 'Pending'),
(17, 2, 771234567, 'Shirt (4)', 1180, 'Colombo 2', 'Colombo 2', 'Standard Delivery', 'Cash on Delivery', '2024-10-10 15:02:18', 'Pending'),
(18, 1, 763534626, 'Shirt (3)', 910, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-12 13:26:50', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `gmail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile_picture` varchar(500) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `gmail`, `password`, `profile_picture`, `date`) VALUES
(1, 'yathursan', 'yathu@gmail.com', 'yathu@31', 'default.jpg', '2024-10-11 18:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`, `price`, `image`) VALUES
(1, 'Shirt', 100, 'Shirt.png'),
(2, 'Short', 75, 'Shorts.png'),
(3, 'T-Shirt', 70, 'T-Shirt.png'),
(4, 'Suit', 500, 'Suit.png'),
(5, 'Trousers', 300, 'Trouser.png'),
(6, 'Blouse', 70, 'Blouse.png'),
(7, 'Bottom', 75, 'Bottom.png'),
(8, 'Bed Sheet (L)', 200, 'BedSheet(L).png'),
(9, 'Bed Sheet (S)', 150, 'BedSheet(S).png'),
(15, 'Pillow Cover', 30, 'Cover.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

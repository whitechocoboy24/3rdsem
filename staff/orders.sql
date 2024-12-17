-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 20, 2024 at 07:59 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `mobile`, `orders`, `total_amount`, `pickup_address`, `delivery_address`, `delivery_method`, `payment_method`, `order_date`, `status`) VALUES
(1, 1, 763534626, 'Shirt (2), Short (4), T-Shirt (3)', 2280, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-14 19:39:49', 'delivered'),
(2, 1, 763534626, 'Suit (1)', 740, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-14 19:44:17', 'pickedup'),
(3, 2, 123456789, 'Shirt (1), Short (1), T-Shirt (1)', 745, 'no 10 colombo road, colombo', 'no 10 colombo road, colombo', 'Standard Delivery', 'Credit Card', '2024-10-15 10:00:27', 'pickedup'),
(4, 2, 123456789, 'T-Shirt (3), Suit (3), Trousers (3)', 4180, 'no 10 colombo road, colombo', 'no 10 colombo road, colombo', 'Standard Delivery', 'Cash on Delivery', '2024-10-15 10:02:05', 'pickedup'),
(5, 2, 123456789, 'Shirt (3), Trousers (3)', 2550, 'no 10 colombo road, colombo', 'no 10 colombo road, colombo', 'Express Delivery', 'Cash on Delivery', '2024-10-15 10:02:56', 'pickedup'),
(6, 1, 763534626, 'Suit (1)', 720, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-15 10:04:01', 'paid'),
(7, 1, 763534626, 'Shirt (3)', 910, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-15 10:36:27', 'Pending'),
(8, 1, 763534626, 'T-Shirt (3), Trousers (3)', 2245, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-15 10:37:26', 'Pending'),
(9, 1, 763534626, 'Shirt (1), Shirt (2)', 890, 'Colombo 1', 'Colombo 1', 'Standard Delivery', 'Cash on Delivery', '2024-10-15 10:51:32', 'Pending');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 09:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--
CREATE DATABASE IF NOT EXISTS `ecom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecom`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(0, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(8, 'PC\'s', 1),
(9, 'SmartPhone', 1),
(10, 'Tablets', 1),
(11, 'Accessories', 1),
(12, 'SmartWatches', 1),
(13, 'Audio', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(255) NOT NULL,
  `mihpayid` varchar(255) NOT NULL,
  `payu_status` varchar(255) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `payu_status`, `added_on`) VALUES
(1, 2, '10', 'Agra', 282005, 'COD', 12999, 'Success', 5, '', '', '', '2022-11-08 12:53:39'),
(2, 2, '10 amit vihar', 'Agra', 282005, 'payu', 38997, 'Success', 5, '83614874da1ce5c805d3', '', '', '2022-11-08 04:23:04'),
(3, 2, '10', 'Agra', 282005, 'COD', 459990, 'pending', 1, 'a6391ed8be388469c117', '', '', '2022-11-08 05:28:19'),
(4, 2, '10', 'Agra', 282005, 'payu', 45999, 'pending', 1, 'e5135a7c1f6e595a7c4c', '', '', '2022-11-09 05:16:22'),
(5, 2, '10', 'Agra', 282005, 'payu', 45999, 'pending', 1, 'fb60b63d9878b6455aa2', '', '', '2022-11-18 07:08:02'),
(6, 4, '10', 'Agra', 282005, 'COD', 139994, 'pending', 2, '858857ffaf476a2dfdd8', '', '', '2022-11-22 10:49:05'),
(7, 5, 'kamla nagar', 'Agra', 282005, 'COD', 1799, 'Success', 5, '5cac0f14eb3b6d77357d', '', '', '2022-11-23 06:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`, `added_on`) VALUES
(1, 1, 3, 1, 12999, '0000-00-00 00:00:00'),
(2, 2, 3, 3, 12999, '0000-00-00 00:00:00'),
(3, 3, 7, 10, 45999, '0000-00-00 00:00:00'),
(4, 4, 7, 1, 45999, '0000-00-00 00:00:00'),
(5, 5, 7, 1, 45999, '0000-00-00 00:00:00'),
(6, 6, 7, 2, 45999, '0000-00-00 00:00:00'),
(7, 6, 6, 4, 11999, '0000-00-00 00:00:00'),
(8, 7, 11, 1, 1799, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` text NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(11, 11, 'Apple 20W USB-C Power Adapter', 1900, 1799, 99, '162501573_525308999_41h1WcGLUnL.jpg', 'Apple 20W USB-C Power Adapter', 'Apple 20W USB-C Power Adapter', 'Apple 20W USB-C Power Adapter', 'Apple 20W USB-C Power Adapter', 'Apple 20W USB-C Power Adapter', 1),
(12, 11, 'Case For iPhone 14 Pro Max', 3998, 1299, 99, '247373317_548569067_61OC-JKmYdL._SX522_.jpg', 'Case For iPhone 14 Pro Max', 'Case For iPhone 14 Pro Max', 'Case For iPhone 14 Pro Max', 'Case For iPhone 14 Pro Max', 'Case For iPhone 14 Pro Max', 1),
(13, 11, 'Cover For OnePlus 10 Pro', 2099, 1299, 99, '889667695_997462656_61HNzvCn76L._SX522_.jpg', 'Cover For OnePlus 10 Pro', 'Cover For OnePlus 10 Pro', 'Cover For OnePlus 10 Pro', 'Cover For OnePlus 10 Pro', 'Cover For OnePlus 10 Pro', 1),
(14, 11, 'Case For Samsung Galaxy S22 Ultra', 1699, 1299, 99, '980807169_472878549_71M22NKiV3L._SX522_.jpg', 'Case For Samsung Galaxy S22 Ultra', 'Case For Samsung Galaxy S22 Ultra', 'Case For Samsung Galaxy S22 Ultra', 'Case For Samsung Galaxy S22 Ultra', 'Case For Samsung Galaxy S22 Ultra', 1),
(15, 11, 'Logitech MX Keys', 14999, 12995, 99, '670549430_975989864_71ELb9vTikS._SX522_.jpg', 'Logitech MX Keys', 'Logitech MX Keys', 'Logitech MX Keys', 'Logitech MX Keys', 'Logitech MX Keys', 1),
(16, 11, 'Logitech B170', 599, 795, 99, '405347627_937698967_516LU0H963L._SX679_.jpg', 'Logitech B170', 'Logitech B170', 'Logitech B170', 'Logitech B170', 'Logitech B170', 1),
(17, 11, 'Logitech MX Master 3S', 10995, 9750, 99, '718132797_212159837_616ljqKS+xL._SX522_.jpg', 'Logitech MX Master 3S', 'Logitech MX Master 3S', 'Logitech MX Master 3S', 'Logitech MX Master 3S', 'Logitech MX Master 3S', 1),
(18, 8, 'Apple IMac With 4.5K Retina Display', 119900, 113990, 99, '386791197_670469620_61LNnZPoKPS._SX679_.jpg', 'Apple IMac With 4.5K Retina Display', 'Apple IMac With 4.5K Retina Display', 'Apple IMac With 4.5K Retina Display', 'Apple IMac With 4.5K Retina Display', 'Apple IMac With 4.5K Retina Display', 1),
(19, 8, 'OMEN By HP-12th Gen Intel Core I7 16.1-Inch', 192980, 166650, 99, '519367621_332461649_61OdiPUZ6YL._SX522_.jpg', 'OMEN By HP-12th Gen Intel Core I7 16.1-Inch', 'OMEN By HP-12th Gen Intel Core I7 16.1-Inch', 'OMEN By HP-12th Gen Intel Core I7 16.1-Inch', 'OMEN By HP-12th Gen Intel Core I7 16.1-Inch', 'OMEN By HP-12th Gen Intel Core I7 16.1-Inch', 1),
(20, 8, 'ASUS ROG Zephyrus Duo 16', 431990, 361990, 99, '656191685_323726607_71JFMDI0tOL._SX679_.jpg', 'ASUS ROG Zephyrus Duo 16', 'ASUS ROG Zephyrus Duo 16', 'ASUS ROG Zephyrus Duo 16', 'ASUS ROG Zephyrus Duo 16', 'ASUS ROG Zephyrus Duo 16', 1),
(21, 8, 'ASUS VivoBook 15 F515', 67602, 54081, 99, '366806141_440771795_51JnduSOURL._SX679_.jpg', 'ASUS VivoBook 15 F515', 'ASUS VivoBook 15 F515', 'ASUS VivoBook 15 F515', 'ASUS VivoBook 15 F515', 'ASUS VivoBook 15 F515', 1),
(22, 9, 'OnePlus 10 Pro 5G', 71999, 66999, 99, '498717159_146931248_61mIUCd-37L._SX679_.jpg', 'OnePlus 10 Pro 5G', 'OnePlus 10 Pro 5G', 'OnePlus 10 Pro 5G', 'OnePlus 10 Pro 5G', 'OnePlus 10 Pro 5G', 1),
(23, 9, 'OnePlus Nord CE 2 5G', 27999, 24999, 99, '124427725_252063950_61+Q6Rh3OQL._SX679_.jpg', 'OnePlus Nord CE 2 5G', 'OnePlus Nord CE 2 5G', 'OnePlus Nord CE 2 5G', 'OnePlus Nord CE 2 5G', 'OnePlus Nord CE 2 5G', 1),
(24, 9, 'Xiaomi 11 Lite NE 5G', 31999, 23999, 99, '906365315_355079851_71XmlboxNZL._SX679_.jpg', 'Xiaomi 11 Lite NE 5G', 'Xiaomi 11 Lite NE 5G', 'Xiaomi 11 Lite NE 5G', 'Xiaomi 11 Lite NE 5G', 'Xiaomi 11 Lite NE 5G', 1),
(25, 9, 'Samsung Galaxy S22 Ultra 5G', 131999, 108999, 99, '179873926_280803420_71PvHfU+pwL._SX679_.jpg', 'Samsung Galaxy S22 Ultra 5G', 'Samsung Galaxy S22 Ultra 5G', 'Samsung Galaxy S22 Ultra 5G', 'Samsung Galaxy S22 Ultra 5G', 'Samsung Galaxy S22 Ultra 5G', 1),
(26, 12, 'Samsung Galaxy Watch5', 33999, 30999, 99, '867440078_382562614_61Guilj8MEL._SX522_.jpg', 'Samsung Galaxy Watch5', 'Samsung Galaxy Watch5', 'Samsung Galaxy Watch5', 'Samsung Galaxy Watch5', 'Samsung Galaxy Watch5', 1),
(27, 12, 'OnePlus Nord', 6999, 4999, 99, '280793420_621062671_61qCEMaDEbL._SX679_.jpg', 'OnePlus Nord', 'OnePlus Nord', 'OnePlus Nord', 'OnePlus Nord', 'OnePlus Nord', 1),
(28, 12, 'Noise ColorFit Pro 4', 5999, 2999, 99, '930232425_335204606_61u2dhY-JBL._SX522_.jpg', 'Noise ColorFit Pro 4', 'Noise ColorFit Pro 4', 'Noise ColorFit Pro 4', 'Noise ColorFit Pro 4', 'Noise ColorFit Pro 4', 1),
(29, 12, 'Fire-Boltt Ring 3', 9999, 2999, 99, '860545837_325377276_61OM3oqbXRL._SX522_.jpg', 'Fire-Boltt Ring 3', 'Fire-Boltt Ring 3', 'Fire-Boltt Ring 3', 'Fire-Boltt Ring 3', 'Fire-Boltt Ring 3', 1),
(30, 12, 'Fire-Boltt Talk 2', 9999, 2199, 99, '120230343_366455507_61j67IC2mnL._SX522_.jpg', 'Fire-Boltt Talk 2', 'Fire-Boltt Talk 2', 'Fire-Boltt Talk 2', 'Fire-Boltt Talk 2', 'Fire-Boltt Talk 2', 1),
(31, 10, 'Xiaomi MI Pad 5', 37999, 25999, 99, '894098528_559885103_61Eb9vtdSML._SX679_.jpg', 'Xiaomi MI Pad 5', 'Xiaomi MI Pad 5', 'Xiaomi MI Pad 5', 'Xiaomi MI Pad 5', 'Xiaomi MI Pad 5', 1),
(33, 10, 'Samsung Galaxy Tab A8', 23999, 17999, 99, '470838871_951884672_91veRYPjpeL._SX679_.jpg', 'Samsung Galaxy Tab A8', 'Samsung Galaxy Tab A8', 'Samsung Galaxy Tab A8', 'Samsung Galaxy Tab A8', 'Samsung Galaxy Tab A8', 1),
(34, 10, 'Samsung Galaxy Tab S8 Ultra', 125999, 100999, 99, '859567494_901533707_91bMDtxybOL._SX522_.jpg', 'Samsung Galaxy Tab S8 Ultra', 'Samsung Galaxy Tab S8 Ultra', 'Samsung Galaxy Tab S8 Ultra', 'Samsung Galaxy Tab S8 Ultra', 'Samsung Galaxy Tab S8 Ultra', 1),
(35, 10, 'Apple 2022 IPad Air M1 Chip', 54900, 52490, 99, '695216969_201327634_61XZQXFQeVL._SX679_.jpg', 'Apple 2022 IPad Air M1 Chip', 'Apple 2022 IPad Air M1 Chip', 'Apple 2022 IPad Air M1 Chip', 'Apple 2022 IPad Air M1 Chip', 'Apple 2022 IPad Air M1 Chip', 1),
(36, 13, 'BoAt Stone 620', 3990, 1699, 99, '262047122_683257720_71Q0Egb3TXL._SX522_.jpg', 'BoAt Stone 620', 'BoAt Stone 620', 'BoAt Stone 620', 'BoAt Stone 620', 'BoAt Stone 620', 1),
(37, 13, 'JBL Charge 5', 18999, 16150, 99, '906802972_447252645_810z2xbBTWL._SX522_.jpg', 'JBL Charge 5', 'JBL Charge 5', 'JBL Charge 5', 'JBL Charge 5', 'JBL Charge 5', 1),
(38, 13, 'Sony SRS-XB33', 15990, 12164, 99, '701996563_620372422_91KZ1i1DG1L._SX522_.jpg', 'Sony SRS-XB33', 'Sony SRS-XB33', 'Sony SRS-XB33', 'Sony SRS-XB33', 'Sony SRS-XB33', 1),
(39, 13, 'Oneplus Bullets Z2', 2299, 1999, 99, '478637155_116436996_51ZWE9W53fL._SX679_.jpg', 'Oneplus Bullets Z2', 'Oneplus Bullets Z2', 'Oneplus Bullets Z2', '', 'Oneplus Bullets Z2', 1),
(40, 13, 'OnePlus Buds Z2', 5999, 4999, 99, '452868440_693848259_51Ip185nxKL._SX522_.jpg', 'OnePlus Buds Z2', 'OnePlus Buds Z2', 'OnePlus Buds Z2', 'OnePlus Buds Z2', 'OnePlus Buds Z2', 1),
(41, 13, 'Apple AirPods Pro', 24999, 20900, 99, '992200219_985547948_71bhWgQK-cL._SX679_.jpg', 'Apple AirPods Pro', 'Apple AirPods Pro', 'Apple AirPods Pro', 'Apple AirPods Pro', 'Apple AirPods Pro', 1),
(42, 13, 'JBL Tune 760NC', 7999, 5498, 99, '650670308_824675441_61HXCeozUjL._SX522_.jpg', 'JBL Tune 760NC', 'JBL Tune 760NC', 'JBL Tune 760NC', 'JBL Tune 760NC', 'JBL Tune 760NC', 1),
(43, 13, 'Sony WH-XB910N', 19990, 12990, 99, '148615364_501541060_61WFNqf8hVL._SX522_.jpg', 'Sony WH-XB910N', 'Sony WH-XB910N', 'Sony WH-XB910N', 'Sony WH-XB910N', 'Sony WH-XB910N', 1),
(44, 12, 'Apple Watch Ultra GPS + Cellular', 89900, 89899, 99, '906558449_786095984_91v9yAPw3-L._SX679_.jpg', 'Apple Watch Ultra GPS + Cellular', 'Apple Watch Ultra GPS + Cellular', 'Apple Watch Ultra GPS + Cellular', 'Apple Watch Ultra GPS + Cellular', 'Apple Watch Ultra GPS + Cellular', 1),
(45, 10, 'Apple 2021 IPad Pro M1 Chip', 79900, 71900, 99, '122877273_530593701_81Y5WuARqpS._SX679_.jpg', 'Apple 2021 IPad Pro M1 Chip', 'Apple 2021 IPad Pro M1 Chip', 'Apple 2021 IPad Pro M1 Chip', 'Apple 2021 IPad Pro M1 Chip', 'Apple 2021 IPad Pro M1 Chip', 1),
(46, 8, '2021 Apple MacBook Pro', 239900, 222990, 99, '249496472_190325534_61aUBxqc5PL._SX679_.jpg', '2021 Apple MacBook Pro', '2021 Apple MacBook Pro', '2021 Apple MacBook Pro', '', '2021 Apple MacBook Pro', 1),
(47, 9, 'Apple IPhone 14 Pro Max', 149900, 139900, 99, '798849054_805897803_download.jpeg', 'Apple IPhone 14 Pro Max', 'Apple IPhone 14 Pro Max', 'Apple IPhone 14 Pro Max', 'Apple IPhone 14 Pro Max', 'Apple IPhone 14 Pro Max', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(6, '1', '11', '1', '111', '2022-12-30 08:23:32'),
(7, '1', '11', '2', '111', '2022-12-30 08:23:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `onlinevotingsystem`
--
CREATE DATABASE IF NOT EXISTS `onlinevotingsystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `onlinevotingsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_details`
--

CREATE TABLE `candidate_details` (
  `id` int(11) NOT NULL,
  `election_id` int(11) DEFAULT NULL,
  `candidate_name` varchar(255) DEFAULT NULL,
  `candidate_details` text DEFAULT NULL,
  `candidate_photo` text DEFAULT NULL,
  `inserted_by` varchar(255) DEFAULT NULL,
  `inserted_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elections`
--

CREATE TABLE `elections` (
  `id` int(11) NOT NULL,
  `election_topic` varchar(255) DEFAULT NULL,
  `no_of_candidates` int(11) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `inserted_by` varchar(255) DEFAULT NULL,
  `inserted_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `user_role` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `contact_no`, `password`, `user_role`) VALUES
(6, 'KingSlayer', '8791422151', '22b9c231e86e73b6822f10a284ad53e606c09e6d', 'Admin'),
(7, 'kshitij', '9917358640', '33d51ad27db2fd3609357663358825f8e5ea9855', 'Voter'),
(13, 'divyansh', '7310999886', '9a37a29fc4c5b5c112ce3376da5d0e13b59bdcff', 'Admin'),
(15, 'xyz', '0123456789', '9a37a29fc4c5b5c112ce3376da5d0e13b59bdcff', 'Voter');

-- --------------------------------------------------------

--
-- Table structure for table `votings`
--

CREATE TABLE `votings` (
  `id` int(11) NOT NULL,
  `election_id` int(11) DEFAULT NULL,
  `voters_id` int(11) DEFAULT NULL,
  `candidate_id` int(11) NOT NULL,
  `vote_date` date DEFAULT NULL,
  `vote_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votings`
--

INSERT INTO `votings` (`id`, `election_id`, `voters_id`, `candidate_id`, `vote_date`, `vote_time`) VALUES
(7, 11, 7, 9, '2023-04-26', '09:13:01'),
(8, 11, 15, 10, '2023-04-26', '09:14:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate_details`
--
ALTER TABLE `candidate_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elections`
--
ALTER TABLE `elections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votings`
--
ALTER TABLE `votings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate_details`
--
ALTER TABLE `candidate_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `elections`
--
ALTER TABLE `elections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `votings`
--
ALTER TABLE `votings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-12-30 19:18:09', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `votesystem`
--
CREATE DATABASE IF NOT EXISTS `votesystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `votesystem`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

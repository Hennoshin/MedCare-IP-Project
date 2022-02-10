-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2022 at 11:15 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `manufacturertbl`
--

CREATE TABLE `manufacturertbl` (
  `name` varchar(50) NOT NULL,
  `address` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturertbl`
--

INSERT INTO `manufacturertbl` (`name`, `address`) VALUES
('MediMeds Ltd.', 'Indonesia'),
('Pharmacy Medical Ltd.', 'Malaysia');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_item`
--

CREATE TABLE `ordered_item` (
  `orderID` varchar(12) CHARACTER SET utf8 NOT NULL,
  `itemID` varchar(10) CHARACTER SET utf8 NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordered_item`
--

INSERT INTO `ordered_item` (`orderID`, `itemID`, `quantity`) VALUES
('ORD000000001', 'AA00000001', 1),
('ORD000000001', 'AA00000002', 1),
('ORD000000001', 'AA00000003', 1),
('ORD000000001', 'AA00000004', 4),
('ORD000000002', 'AA00000001', 1),
('ORD000000002', 'AA00000002', 1),
('ORD000000002', 'AA00000003', 2),
('ORD000000002', 'AA00000004', 4),
('ORD000000003', 'AA00000002', 1),
('ORD000000003', 'AA00000003', 2),
('ORD000000004', 'AA00000002', 1),
('ORD000000004', 'AA00000003', 2),
('ORD000000005', 'AA00000003', 1),
('ORD000000006', 'AA00000003', 3),
('ORD000000007', 'AA00000002', 1),
('ORD000000007', 'AA00000003', 1),
('ORD000000008', 'AA00000002', 1),
('ORD000000008', 'AA00000003', 2),
('ORD000000008', 'AA00000006', 1),
('ORD000000008', 'AA00000007', 2),
('ORD000000009', 'AA00000001', 2),
('ORD000000009', 'AA00000007', 5),
('ORD000000009', 'AA00000010', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `orderID` varchar(12) NOT NULL,
  `userID` varchar(50) NOT NULL,
  `orderDate` date NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`orderID`, `userID`, `orderDate`, `address`) VALUES
('ORD000000001', 'm.irfan.hilmi@gmail.com', '2021-07-10', ''),
('ORD000000002', 'm.irfan.hilmi@gmail.com', '2021-07-10', ''),
('ORD000000003', 'm.irfan.hilmi@gmail.com', '2021-07-10', ''),
('ORD000000004', 'm.irfan.hilmi@gmail.com', '2021-07-10', ''),
('ORD000000005', 'm.irfan.hilmi@gmail.com', '2021-07-15', 'JLJKLk'),
('ORD000000006', 'm.irfan.hilmi@gmail.com', '2021-07-15', 'JLJKLk'),
('ORD000000007', 'm.irfan.hilmi@gmail.com', '2021-07-15', 'Test addr'),
('ORD000000008', 'm@mail.com', '2022-02-10', 'Test Addr'),
('ORD000000009', 'm@mail.com', '2022-02-10', 'Test Addr');

-- --------------------------------------------------------

--
-- Table structure for table `producttbl`
--

CREATE TABLE `producttbl` (
  `id` varchar(10) NOT NULL,
  `prodname` varchar(50) NOT NULL,
  `description` varchar(70) NOT NULL,
  `price` double NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `imageURL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producttbl`
--

INSERT INTO `producttbl` (`id`, `prodname`, `description`, `price`, `manufacturer`, `imageURL`) VALUES
('AA00000001', 'Cetyl Pure', 'Something else', 120, 'MediMeds Ltd.', 'cetylpure.png'),
('AA00000002', 'Bioderma', 'Ini Bioderma', 50, 'Pharmacy Medical Ltd.', 'bioderma.png'),
('AA00000003', 'CLA', 'Test details', 100, 'MediMeds Ltd.', 'clacore.png'),
('AA00000004', 'Chanca Piedra', 'Ini obat Chanca Piedra', 95, 'MediMeds Ltd.', 'chanca.png'),
('AA00000005', 'Poo-Purri', 'Ini obat Poo-purri', 50, 'Pharmacy Medical Ltd.', 'purri.png'),
('AA00000006', 'Umcka', 'Ini obat Umcka', 25, 'MediMeds Ltd.', 'umcka.png'),
('AA00000007', 'Blackmores', 'Ini obat Blackmores', 300, 'Pharmacy Medical Ltd.', 'blackmorse.png'),
('AA00000008', 'Sanitizer', 'Ini sanitizer', 35, 'Pharmacy Medical Ltd.', 'sanitizer.png'),
('AA00000009', 'Toilet Seat Sanitizer', 'Ini untuk toilet seat', 30, 'MediMeds Ltd.', 'seatsanitizer.png'),
('AA00000010', 'Ibuprofen', 'Ini obat Ibuprofen', 25, 'Pharmacy Medical Ltd.', 'ibuprofen.png'),
('AA00000011', 'Test', 'Test', 100, 'MediMeds Ltd.', 'Tree.png');

-- --------------------------------------------------------

--
-- Table structure for table `suppliertbl`
--

CREATE TABLE `suppliertbl` (
  `email` varchar(50) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `manufacturer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliertbl`
--

INSERT INTO `suppliertbl` (`email`, `password`, `manufacturer`) VALUES
('user1@medimeds.com', 'pIl9EKHwxz++Zi78NX08zQ==', 'MediMeds Ltd.'),
('user1@pharmameds.com', 'pIl9EKHwxz++Zi78NX08zQ==', 'Pharmacy Medical Ltd.');

-- --------------------------------------------------------

--
-- Table structure for table `usertbl`
--

CREATE TABLE `usertbl` (
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`email`, `password`, `name`, `address`) VALUES
('admin@gmail.com', 'pIl9EKHwxz++Zi78NX08zQ==', 'Irfan', 'Jalan Test'),
('hilmi.irfan', '$2y$10$R3DM4PfbUuwrw95TsjPBE.aSznXKxmVIL.AbeZKfqlMunpQF6Ycj.', 'price', 'asdf'),
('irfan.hilmi', '$2y$10$h0LPEWUymHpfeRX8x9c7m.bXIFNofZsOvwz7.v2jIN1kQ.0D5Oeca', 'asdf', 'asdf'),
('irfan.hilmi@graduate.utm.my', '$2y$10$rsTd/dbu5yHObXbrtnQqWuCDCS6wDBJj2N1LuyluTOJ4z/hFTwaGe', 'a name', 'an address'),
('m.irfan.hilmi@gmail.com', '$2y$10$hzG7EClH1eVttSkuLOlTzOelo9Y6j4E0tB5p98vwDRXO.AVOkvEmS', 'Muhammad Irfan Hilmi', 'JLJKLk'),
('m@mail.com', 'KaUc5gOSiJvKu90TurppVw==', 'Muhammad Irfan', 'Test Addr');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufacturertbl`
--
ALTER TABLE `manufacturertbl`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `ordered_item`
--
ALTER TABLE `ordered_item`
  ADD PRIMARY KEY (`orderID`,`itemID`),
  ADD KEY `ITEM_REF` (`itemID`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `USER_REF` (`userID`);

--
-- Indexes for table `producttbl`
--
ALTER TABLE `producttbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IMNF_REF` (`manufacturer`);

--
-- Indexes for table `suppliertbl`
--
ALTER TABLE `suppliertbl`
  ADD PRIMARY KEY (`email`),
  ADD KEY `MNF_REF` (`manufacturer`);

--
-- Indexes for table `usertbl`
--
ALTER TABLE `usertbl`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ordered_item`
--
ALTER TABLE `ordered_item`
  ADD CONSTRAINT `ITEM_REF` FOREIGN KEY (`itemID`) REFERENCES `producttbl` (`id`),
  ADD CONSTRAINT `ORDER_REF` FOREIGN KEY (`orderID`) REFERENCES `order_history` (`orderID`);

--
-- Constraints for table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `USER_REF` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `producttbl`
--
ALTER TABLE `producttbl`
  ADD CONSTRAINT `IMNF_REF` FOREIGN KEY (`manufacturer`) REFERENCES `manufacturertbl` (`name`);

--
-- Constraints for table `suppliertbl`
--
ALTER TABLE `suppliertbl`
  ADD CONSTRAINT `MNF_REF` FOREIGN KEY (`manufacturer`) REFERENCES `manufacturertbl` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

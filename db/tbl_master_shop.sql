-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2022 at 04:55 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-rs-p1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_shop`
--

CREATE TABLE `tbl_master_shop` (
  `id` int(11) NOT NULL,
  `shop_name` varchar(15) DEFAULT NULL,
  `cost_center` varchar(15) DEFAULT NULL,
  `gr_code` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_master_shop`
--

INSERT INTO `tbl_master_shop` (`id`, `shop_name`, `cost_center`, `gr_code`) VALUES
(1, 'IRM', 'L-203-0451', 'LPB'),
(2, 'DTMM', 'S-607-0451', 'LPB'),
(3, 'MEM', 'S-608-0451', 'LPB'),
(4, 'PRODPRESS', 'P-804-0451', 'LPB'),
(5, 'PRODWELD', 'P-805-0451', 'LPB'),
(6, 'PRODSUPPORT', 'P-806-0451', 'LPB'),
(8, 'QES', 'S-505-0451', 'LPB'),
(9, 'PE', 'S-302-0451', 'LPB'),
(11, 'IFP', 'L-202-0451', 'LPB'),
(22, 'WHPRESS', '-', '-'),
(13, 'GA', 'P-807-0451', 'LPB'),
(14, 'MDIC', 'L-203-0451', 'LPB'),
(15, 'PRESSDIVISION', '-', '-'),
(16, 'LPB', '-', '-'),
(17, 'PRODUCTION', '-', '-'),
(18, 'DIEMAINTENANCE', '-', '-'),
(19, 'DIEMAKING', '-', '-'),
(20, 'LPP', '-', 'LPB'),
(21, 'PPC', 'S-402-0451', 'LPB'),
(23, 'WH Docking', '-', '-'),
(24, 'WH Door Assy', '-', '-'),
(26, 'PPL', '-', 'LPB');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

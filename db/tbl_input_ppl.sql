-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2022 at 12:37 PM
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
-- Table structure for table `tbl_input_ppl`
--

CREATE TABLE `tbl_input_ppl` (
  `id` int(11) NOT NULL,
  `job_no` varchar(10) DEFAULT NULL,
  `part_no` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `maks_shift` int(11) DEFAULT NULL,
  `ps` varchar(10) DEFAULT NULL,
  `patan` varchar(20) DEFAULT NULL,
  `t_t` int(11) DEFAULT NULL,
  `shift` varchar(1) DEFAULT NULL,
  `shop_name` varchar(30) DEFAULT NULL,
  `sto_ppl` int(11) DEFAULT NULL,
  `ss_ppl` decimal(10,0) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `proses` varchar(20) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `machine` varchar(15) NOT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_input_ppl`
--

INSERT INTO `tbl_input_ppl` (`id`, `job_no`, `part_no`, `part_name`, `maks_shift`, `ps`, `patan`, `t_t`, `shift`, `shop_name`, `sto_ppl`, `ss_ppl`, `area`, `proses`, `model`, `machine`, `create_by`, `create_date`) VALUES
(1, 'J-2084', '61111-BZA60   ', 'J-2084, PANEL, SIDE, OUTER RH', 2, 'TEIRYO', NULL, 233, 'A', 'PPL', 15, '60', 'WH Docking', 'Inhouse', 'D17D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(2, 'J-2057', '61112-BZ581', 'J-2057, PANEL, SIDE, OUTER LH', 5, 'TEIRYO', NULL, 93, 'A', 'PPL', 50, '80', 'WH Docking', 'Inhouse', 'D17D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(3, 'K-2122', '61613-BZ093', 'K-2122, PANEL, QUARTER, INNER FR RH', 41, 'B', NULL, 11, 'A', 'PPL', 90, '18', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(4, 'K-2124', '61613-BZ103', 'K-2124, PANEL, QUARTER, INNER FR RH', 28, 'B', NULL, 17, 'A', 'PPL', 100, '29', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(5, 'K-2126', '61613-BZ123', 'K-2126, PANEL, QUARTER, INNER FR RH', 13, 'B', NULL, 36, 'A', 'PPL', 150, '92', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(6, 'K-2128', '61613-BZ142', 'K-2128, PANEL, QUARTER, INNER FR RH', 5, 'B', NULL, 93, 'A', 'PPL', 20, '32', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(7, 'K-2123', '61614-BZ093', 'K-2123, PANEL, QUARTER, INNER FR LH', 31, 'B', NULL, 15, 'A', 'PPL', 50, '13', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(8, 'K-2125', '61614-BZ103', 'K-2125, PANEL, QUARTER, INNER FR LH', 40, 'B', NULL, 12, 'A', 'PPL', 17, '3', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(9, 'K-2127', '61614-BZ123', 'K-2127, PANEL, QUARTER, INNER FR LH', 10, 'B', NULL, 47, 'A', 'PPL', 20, '16', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(10, 'K-2129', '61614-BZ142', 'K-2129, PANEL, QUARTER, INNER FR LH', 5, 'B', NULL, 93, 'A', 'PPL', 30, '48', 'WH Docking', 'Inhouse', 'D40D', '4A', 'User PPL', '2022-03-05 11:01:56'),
(11, 'J-4053', '53811-BZ350', 'J-4053, PANEL, FR FENDER, RH', 1, 'TERIYOU', NULL, 465, 'A', 'PPL', 15, '120', 'WH Docking', 'Inhouse', 'D17D', '5A', 'User PPL', '2022-03-05 16:59:12'),
(12, 'K-3007', '63111-BZ150', 'K-3007, PANEL ROOF', 91, 'B', NULL, 5, 'A', 'PPL', 50, '4', 'WH Docking', 'Inhouse', 'D40D', '5A', 'User PPL', '2022-03-05 16:59:12'),
(13, 'K-3005', '63111-BZ120', 'K-3005, PANEL ROOF', 20, 'B', NULL, 23, 'A', 'PPL', 90, '36', 'WH Docking', 'Inhouse', 'D40D', '5A', 'User PPL', '2022-03-05 16:59:12'),
(14, 'T-4032', '61745-BZ110', 'T-4032, REINF, BACK DOOR OPENING, LWR RH', 285, 'AC', NULL, 2, 'A', 'PPL', 100, '3', 'WH Docking', 'Inhouse', 'D14N', '3B', 'User PPL', '2022-03-05 16:59:12'),
(15, 'J-4060', '53812-BZ380', 'J-4060, PANEL, FR FENDER, LH', 1, 'TERIYOU', NULL, 465, 'A', 'PPL', 150, '1200', 'WH Docking', 'Inhouse', 'D17D', '5A', 'User PPL', '2022-03-05 16:59:12'),
(16, 'J-4054', '53812-BZ350', 'J-4054, PANEL, FR FENDER, LH', 1, 'TERIYOU', NULL, 465, 'A', 'PPL', 50, '400', 'WH Docking', 'Inhouse', 'D17D', '5A', 'User PPL', '2022-03-05 16:59:12'),
(17, 'J-4059', '53811-BZ380', 'J-4059, PANEL, FR FENDER, RH', 1, 'TERIYOU', NULL, 465, 'A', 'PPL', 17, '136', 'WH Docking', 'Inhouse', 'D17D', '5A', 'User PPL', '2022-03-05 16:59:12'),
(18, 'K-3007', '63111-BZ150', 'K-3007, PANEL ROOF', 91, 'B', NULL, 5, 'A', 'PPL', 30, '3', 'WH Docking', 'Inhouse', 'D40D', '5A', 'User PPL', '2022-03-05 16:59:12'),
(19, 'J-2084', '61111-BZA60   ', 'J-2084, PANEL, SIDE, OUTER RH', 2, 'TEIRYO', NULL, 233, 'A', 'PPL', 15, '60', 'WH Docking', 'Inhouse', 'D17D', '4A', 'User PPL', '2022-03-05 16:59:12'),
(20, 'J-2057', '61112-BZ581', 'J-2057, PANEL, SIDE, OUTER LH', 5, 'TEIRYO', NULL, 93, 'A', 'PPL', 50, '80', 'WH Docking', 'Inhouse', 'D17D', '4A', 'User PPL', '2022-03-05 16:59:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_input_ppl`
--
ALTER TABLE `tbl_input_ppl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_input_ppl`
--
ALTER TABLE `tbl_input_ppl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

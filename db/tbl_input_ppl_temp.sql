-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2022 at 03:38 AM
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
-- Table structure for table `tbl_input_ppl_temp`
--

CREATE TABLE `tbl_input_ppl_temp` (
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
-- Dumping data for table `tbl_input_ppl_temp`
--

INSERT INTO `tbl_input_ppl_temp` (`id`, `job_no`, `part_no`, `part_name`, `maks_shift`, `ps`, `patan`, `t_t`, `shift`, `shop_name`, `sto_ppl`, `ss_ppl`, `area`, `proses`, `model`, `machine`, `create_by`, `create_date`) VALUES
(1, 'A4041', '67149-BZ590', 'A-4041, PANEL, BACK DOOR, INSIDE', 317, 'ABCD', 'A', 1, 'A', 'PPL', 20, '1', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'User PPL', '2022-03-08 08:04:02'),
(2, 'A4042', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 102, 'ABCD', 'A', 5, 'A', 'PPL', 70, '5', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'User PPL', '2022-03-08 08:04:02'),
(3, 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 414, 'AC', 'A', 1, 'A', 'PPL', 30, '1', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'User PPL', '2022-03-08 08:04:02'),
(4, 'A4040', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 414, 'AC', 'A', 1, 'A', 'PPL', 10, '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'User PPL', '2022-03-08 08:04:02'),
(5, 'A4031', '67133-BZ100', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 414, 'AC', 'A', 1, 'A', 'PPL', 15, '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'User PPL', '2022-03-08 08:04:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_input_ppl_temp`
--
ALTER TABLE `tbl_input_ppl_temp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_input_ppl_temp`
--
ALTER TABLE `tbl_input_ppl_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

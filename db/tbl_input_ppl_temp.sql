-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 04:12 AM
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
  `job_master` varchar(20) DEFAULT NULL,
  `part_no` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `part_category` varchar(30) DEFAULT NULL,
  `shop_name` varchar(30) DEFAULT NULL,
  `shift` varchar(10) DEFAULT NULL,
  `prod_shift` int(11) DEFAULT NULL,
  `plan_jam` int(11) DEFAULT NULL,
  `sto_ppl` int(11) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `otw` int(11) DEFAULT NULL,
  `ss_ppl` decimal(10,0) DEFAULT NULL,
  `ss_r` decimal(10,0) DEFAULT NULL,
  `ss_otw` decimal(10,0) DEFAULT NULL,
  `ss` decimal(10,0) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `vendor` varchar(15) DEFAULT NULL,
  `routing` varchar(30) DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_input_ppl_temp`
--

INSERT INTO `tbl_input_ppl_temp` (`id`, `job_no`, `job_master`, `part_no`, `part_name`, `part_category`, `shop_name`, `shift`, `prod_shift`, `plan_jam`, `sto_ppl`, `receive`, `otw`, `ss_ppl`, `ss_r`, `ss_otw`, `ss`, `area`, `model`, `vendor`, `routing`, `jam`, `create_by`, `create_date`) VALUES
(1, 'A4041', 'A4041', '67149-BZ590-00', 'A-4041, PANEL, BACK DOOR, INSIDE', '-', 'PPL', 'D', 42, 5, 80, 10, NULL, '15', '2', '0', '17', 'PPL', 'WELD1', 'PLANT-1', 'PL1-PPL', '00:33:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(2, 'A4042', 'A4041', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', '-', 'PPL', 'D', 102, 13, 100, 20, 20, '8', '2', '2', '11', 'PPL', 'D26A', 'PLANT-1', 'PL1-PPL', '18:23:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(3, 'A4039', 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', '-', 'PPL', 'D', 414, 52, 10, NULL, 80, '0', '0', '2', '2', 'PPL', 'D26A', 'PLANT-1', 'PL1-PPL', '09:09:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(4, 'A4040', 'A4039', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', '-', 'PPL', 'D', 414, 52, 16, 100, NULL, '0', '2', '0', '2', 'PPL', 'D26A', 'PLANT-1', 'PL1-PPL', '09:39:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(5, 'NX0531', 'NX0531', '61628-BZ080-00', 'NX-0531, REINFORCEMENT, QUARTER INNER PA', '-', 'PPL', 'D', 11, 1, 10, 30, 30, '7', '22', '22', '51', 'PPL2', 'WELD1', 'ASALTA', 'SP-PL4[W1]', '10:08:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(6, 'AX3089', 'AX3089', '52185-BZ080-00', 'AX-3089, BRACKET, RR BUMPER SIDE MOUNTIN', '-', 'PPL', 'D', 21, 3, 16, NULL, 10, '6', '0', '4', '10', 'PPL2', 'WELD1', 'YOSKA', 'SP-PL4[W1]', '17:18:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(7, 'NT0320', 'NT0320', '58033-BZ030-00', 'NT-0320, REINFORCE SUB-ASSY, BODY LWR BA', '-', 'PPL', 'D', 289, 36, 20, 20, 16, '1', '1', '0', '2', 'PPL2', 'WELD1', 'NAMICOH (CKR)', 'SP-PL4[W1]', '08:57:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(8, 'NT0321', 'NT0321', '58034-BZ030-00', 'NT-0321, REINFORCE SUB-ASSY, BODY LWR BA', '-', 'PPL', 'D', 289, 36, 40, 40, NULL, '1', '1', '0', '2', 'PPL2', 'WELD1', 'NAMICOH (CKR)', 'SP-PL4[W1]', '09:37:00', 'Aji Wibowo', '2022-03-16 09:20:21'),
(9, 'NT0144', 'NT0144', '52185-BZ120-00', 'NT-0144, BRACKET, RR BUMPER SIDE MOUNTIN', '-', 'PPL', 'D', 578, 72, 100, NULL, 40, '1', '0', '1', '2', 'PPL2', 'WELD1', 'YOSKA', 'SP-PL4[W1]', '09:21:00', 'Aji Wibowo', '2022-03-16 09:20:21');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

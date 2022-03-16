-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 04:13 AM
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
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('fb7ae56134f78c999cd519d4abf60907', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 1647399935, 'a:3:{s:9:\"user_data\";s:0:\"\";s:7:\"isLogin\";b:1;s:7:\"timeout\";i:1647403684;}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_area`
--

CREATE TABLE `tbl_area` (
  `id` int(11) NOT NULL,
  `area` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_area`
--

INSERT INTO `tbl_area` (`id`, `area`) VALUES
(1, 'Production'),
(2, 'Logistic'),
(9, 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_day`
--

CREATE TABLE `tbl_day` (
  `id` int(11) NOT NULL,
  `day` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_day`
--

INSERT INTO `tbl_day` (`id`, `day`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

CREATE TABLE `tbl_group` (
  `id` int(11) NOT NULL,
  `user_group` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`id`, `user_group`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_general`
--

CREATE TABLE `tbl_input_general` (
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
  `sto_p1` int(11) DEFAULT NULL,
  `sto_p4` int(11) DEFAULT NULL,
  `sto_kap` int(11) DEFAULT NULL,
  `sto_ppl` int(11) DEFAULT NULL,
  `sto_process` int(11) DEFAULT NULL,
  `ss_p1` decimal(10,1) DEFAULT NULL,
  `ss_p4` decimal(10,1) DEFAULT NULL,
  `ss_kap` decimal(10,1) DEFAULT NULL,
  `ss_ppl` decimal(10,1) DEFAULT NULL,
  `ss_process` decimal(10,1) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `proses` varchar(20) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `machine` varchar(15) NOT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_ppc`
--

CREATE TABLE `tbl_input_ppc` (
  `id` int(11) NOT NULL,
  `job_no` varchar(10) DEFAULT NULL,
  `job_master` varchar(20) DEFAULT NULL,
  `part_no` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `maks_shift` int(11) DEFAULT NULL,
  `ps` varchar(10) DEFAULT NULL,
  `patan` varchar(20) DEFAULT NULL,
  `t_t` int(11) DEFAULT NULL,
  `shift` varchar(1) DEFAULT NULL,
  `shop_name` varchar(30) DEFAULT NULL,
  `sto_p1` int(11) DEFAULT NULL,
  `sto_p4` int(11) DEFAULT NULL,
  `sto_kap` int(11) DEFAULT NULL,
  `sto_ppl` int(11) DEFAULT NULL,
  `sto_process` int(11) DEFAULT NULL,
  `ss_p1` decimal(10,0) DEFAULT NULL,
  `ss_p4` decimal(10,0) DEFAULT NULL,
  `ss_kap` decimal(10,0) DEFAULT NULL,
  `ss_ppl` decimal(10,0) DEFAULT NULL,
  `ss_process` decimal(10,0) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `proses` varchar(20) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `machine` varchar(15) NOT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_input_ppc`
--

INSERT INTO `tbl_input_ppc` (`id`, `job_no`, `job_master`, `part_no`, `part_name`, `maks_shift`, `ps`, `patan`, `t_t`, `shift`, `shop_name`, `sto_p1`, `sto_p4`, `sto_kap`, `sto_ppl`, `sto_process`, `ss_p1`, `ss_p4`, `ss_kap`, `ss_ppl`, `ss_process`, `area`, `proses`, `model`, `machine`, `create_by`, `create_date`) VALUES
(1, 'A4041', 'A4041', '67149-BZ590', 'A-4041, PANEL, BACK DOOR, INSIDE', 42, 'WHPPL1-BIG', 'C', 11, 'B', 'PPC', 80, NULL, NULL, NULL, NULL, '15', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'WELD1', 'PLANT-1', 'Yuli Wibowo', '2022-03-16 09:25:46'),
(2, 'A4042', 'A4041', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 102, 'ABCD', 'C', 5, 'B', 'PPC', 100, NULL, NULL, NULL, NULL, '8', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'Yuli Wibowo', '2022-03-16 09:25:46'),
(3, 'A4039', 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 414, 'AC', 'C', 1, 'B', 'PPC', 10, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'Yuli Wibowo', '2022-03-16 09:25:46'),
(4, 'A4040', 'A4039', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 414, 'AC', 'C', 1, 'B', 'PPC', 16, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'Yuli Wibowo', '2022-03-16 09:25:46'),
(5, 'A4041', 'A4041', '67149-BZ590', 'A-4041, PANEL, BACK DOOR, INSIDE', 42, 'A', 'C', 11, 'B', 'PPC', 80, NULL, NULL, 80, NULL, '15', '0', '0', '15', '0', 'WH Door Assy', 'Inhouse', 'WELD1', '4A', 'Yuli Wibowo', '2022-03-16 09:28:09'),
(6, 'A4042', 'A4041', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 102, 'A', 'C', 5, 'B', 'PPC', 100, NULL, NULL, 100, NULL, '8', '0', '0', '8', '0', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'Yuli Wibowo', '2022-03-16 09:28:09'),
(7, 'A4039', 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 414, 'AC', 'C', 1, 'B', 'PPC', 10, NULL, NULL, 10, NULL, '0', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'Yuli Wibowo', '2022-03-16 09:28:09'),
(8, 'A4040', 'A4039', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 414, 'AC', 'C', 1, 'B', 'PPC', 16, NULL, NULL, 16, NULL, '0', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'Yuli Wibowo', '2022-03-16 09:28:09'),
(9, 'A4041', 'A4041', '67149-BZ590', 'A-4041, PANEL, BACK DOOR, INSIDE', 42, 'A', 'C', 11, 'B', 'PPC', 100, NULL, NULL, 80, NULL, '19', '0', '0', '15', '0', 'WH Door Assy', 'Inhouse', 'WELD1', '4A', 'Yuli Wibowo', '2022-03-16 10:07:29'),
(10, 'A4042', 'A4041', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 102, 'A', 'C', 5, 'B', 'PPC', 90, NULL, NULL, 100, NULL, '7', '0', '0', '8', '0', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'Yuli Wibowo', '2022-03-16 10:07:29'),
(11, 'A4039', 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 414, 'AC', 'C', 1, 'B', 'PPC', 50, NULL, NULL, 10, NULL, '1', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'Yuli Wibowo', '2022-03-16 10:07:29'),
(12, 'A4040', 'A4039', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 414, 'AC', 'C', 1, 'B', 'PPC', 150, NULL, NULL, 16, NULL, '3', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'Yuli Wibowo', '2022-03-16 10:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_ppl`
--

CREATE TABLE `tbl_input_ppl` (
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
-- Dumping data for table `tbl_input_ppl`
--

INSERT INTO `tbl_input_ppl` (`id`, `job_no`, `job_master`, `part_no`, `part_name`, `part_category`, `shop_name`, `shift`, `prod_shift`, `plan_jam`, `sto_ppl`, `receive`, `otw`, `ss_ppl`, `ss_r`, `ss_otw`, `ss`, `area`, `model`, `vendor`, `routing`, `jam`, `create_by`, `create_date`) VALUES
(1, 'A4041', 'A4041', '67149-BZ590-00', 'A-4041, PANEL, BACK DOOR, INSIDE', '-', 'PPL', 'D', 42, 11, 80, 10, NULL, '15', '2', '0', '17', 'PPL', 'WELD1', 'PLANT-1', 'PL1-PPL', '00:33:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(2, 'A4042', 'A4041', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', '-', 'PPL', 'D', 102, 5, 100, 20, 20, '8', '2', '2', '11', 'PPL', 'D26A', 'PLANT-1', 'PL1-PPL', '18:23:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(3, 'A4039', 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', '-', 'PPL', 'D', 414, 1, 10, NULL, 80, '0', '0', '2', '2', 'PPL', 'D26A', 'PLANT-1', 'PL1-PPL', '09:09:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(4, 'A4040', 'A4039', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', '-', 'PPL', 'D', 414, 1, 16, 100, NULL, '0', '2', '0', '2', 'PPL', 'D26A', 'PLANT-1', 'PL1-PPL', '09:39:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(5, 'NX0531', 'NX0531', '61628-BZ080-00', 'NX-0531, REINFORCEMENT, QUARTER INNER PA', '-', 'PPL', 'D', 11, 42, 10, 30, 30, '7', '22', '22', '51', 'PPL2', 'WELD1', 'ASALTA', 'SP-PL4[W1]', '10:19:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(6, 'AX3089', 'AX3089', '52185-BZ080-00', 'AX-3089, BRACKET, RR BUMPER SIDE MOUNTIN', '-', 'PPL', 'D', 21, 22, 16, NULL, 10, '6', '0', '4', '10', 'PPL2', 'WELD1', 'YOSKA', 'SP-PL4[W1]', '17:19:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(7, 'NT0320', 'NT0320', '58033-BZ030-00', 'NT-0320, REINFORCE SUB-ASSY, BODY LWR BA', '-', 'PPL', 'D', 289, 2, 20, 20, 16, '1', '1', '0', '2', 'PPL2', 'WELD1', 'NAMICOH (CKR)', 'SP-PL4[W1]', '08:58:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(8, 'NT0321', 'NT0321', '58034-BZ030-00', 'NT-0321, REINFORCE SUB-ASSY, BODY LWR BA', '-', 'PPL', 'D', 289, 2, 40, 40, NULL, '1', '1', '0', '2', 'PPL2', 'WELD1', 'NAMICOH (CKR)', 'SP-PL4[W1]', '09:37:00', 'Aji Wibowo', '2022-03-16 09:05:43'),
(9, 'NT0144', 'NT0144', '52185-BZ120-00', 'NT-0144, BRACKET, RR BUMPER SIDE MOUNTIN', '-', 'PPL', 'D', 578, 1, 100, NULL, 40, '1', '0', '1', '2', 'PPL2', 'WELD1', 'YOSKA', 'SP-PL4[W1]', '09:20:00', 'Aji Wibowo', '2022-03-16 09:05:43');

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ip_address`
--

CREATE TABLE `tbl_ip_address` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_level` varchar(30) NOT NULL,
  `user_lane` varchar(30) NOT NULL,
  `login_methode` varchar(20) NOT NULL,
  `url` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ip_address`
--

INSERT INTO `tbl_ip_address` (`id`, `ip_address`, `user_level`, `user_lane`, `login_methode`, `url`) VALUES
(58, '192.168.43.1', 'MobileScan', '-', 'Manual', 'mobile');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_level`
--

CREATE TABLE `tbl_level` (
  `id` int(11) NOT NULL,
  `user_level` varchar(20) NOT NULL,
  `user_group` varchar(20) NOT NULL,
  `user_area` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_level`
--

INSERT INTO `tbl_level` (`id`, `user_level`, `user_group`, `user_area`) VALUES
(1, 'Administrator', 'Admin', 'Admin'),
(19, 'Admin_area', 'Admin', 'Admin'),
(21, 'User', 'Admin', 'Production'),
(25, 'Management', 'Admin', 'Admin'),
(28, 'WH Docking', 'Admin', 'Admin'),
(27, 'PPC', 'Admin', 'Admin'),
(30, 'WH Door Assy', 'Admin', 'Admin'),
(31, 'PPL', 'Admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_part`
--

CREATE TABLE `tbl_master_part` (
  `id` int(11) NOT NULL,
  `job_no` varchar(30) DEFAULT NULL,
  `job_master` varchar(20) DEFAULT NULL,
  `part_no` varchar(30) DEFAULT NULL,
  `part_name` varchar(50) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `proses` varchar(20) DEFAULT NULL,
  `pcs_month` int(11) DEFAULT NULL,
  `maks_shift` int(11) DEFAULT NULL,
  `machine` varchar(30) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
  `routing` varchar(30) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_part`
--

INSERT INTO `tbl_master_part` (`id`, `job_no`, `job_master`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `maks_shift`, `machine`, `model`, `patan`, `routing`, `create_by`, `create_date`) VALUES
(1, 'J2084', 'J2022', '61111-BZA60   ', 'J-2084, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 300, 9, '4A', 'D17D', 'TEIRYO', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:16'),
(2, 'J2057', 'J2002', '61112-BZ581', 'J-2057, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 300, 10, '4A', 'D17D', 'TEIRYO', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:16'),
(3, 'K2122', 'K2061', '61613-BZ093', 'K-2122, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 1389, 33, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(4, 'K2124', 'K2061', '61613-BZ103', 'K-2124, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 980, 23, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(5, 'K2126', 'K2061', '61613-BZ123', 'K-2126, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 546, 13, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(6, 'K2128', 'K2061', '61613-BZ142', 'K-2128, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 320, 9, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(7, 'K2123', 'K2062', '61614-BZ093', 'K-2123, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 1142, 27, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(8, 'K2125', 'K2062', '61614-BZ103', 'K-2125, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 1526, 36, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(9, 'K2127', 'K2062', '61614-BZ123', 'K-2127, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 247, 6, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(10, 'K2129', 'K2062', '61614-BZ142', 'K-2129, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 320, 9, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(11, 'K3008', 'K3001', '63111-BZ021', 'K-3008, PANEL, ROOF', 'WH Docking', 'Inhouse', 1439, 34, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(12, 'K3003', 'K3001', '63111-BZ140', 'K-3003, PANEL, ROOF', 'WH Docking', 'Inhouse', 247, 6, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(13, 'K3010', 'K3001', '63111-BZ171', 'K-3010, PANEL, ROOF', 'WH Docking', 'Inhouse', 1549, 36, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(14, 'K4051', 'K4051', '67149-BZ210', 'K-4051,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', 320, 9, '4A', 'D40D', '-', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(15, 'K2113', 'K2023', '61111-BZ331', 'K-2113, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 4400, 103, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(16, 'K2114', 'K2023', '61111-BZ341', 'K-2114, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 514, 13, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(17, 'K2115', 'K2023', '61111-BZ361', 'K-2115, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 245, 6, '4A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(18, 'K2136', 'K2024', '61112-BZC90', 'K-2136, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 4400, 102, '4A', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(19, 'K2137', 'K2024', '61112-BZD00', 'K-2137, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 514, 13, '4A', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(20, 'K2138', 'K2024', '61112-BZD10', 'K-2138, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 245, 6, '4A', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(21, 'K2116', 'K2001', '61111-BZ241', 'K-2116, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 1022, 25, '4A', 'D40D', 'D', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(22, 'K2117', 'K2001', '61111-BZ251', 'K-2117, PANEL SIDE OUTER RH', 'WH Docking', 'Inhouse', 342, 9, '4A', 'D40D', 'D', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(23, 'K2118', 'K2001', '61111-BZ282', 'K-2118, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 120, 4, '4A', 'D40D', '-', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(24, 'K2119', 'K2001', '61111-BZ302', 'K-2119, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 885, 21, '4A', 'D40D', 'D', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(25, 'K2120', 'K2001', '61111-BZ322', 'K-2120, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 546, 14, '4A', 'D40D', 'D', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(26, 'K2121', 'K2001', '61111-BZ701', 'K-2121, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 320, 9, '4A', 'D40D', 'D', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(27, 'K2132', 'K2002', '61112-BZC40', 'K-2132, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 1022, 25, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(28, 'K2133', 'K2002', '61112-BZC50', 'K-2133, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 342, 9, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(29, 'K2140', 'K2002', '61112-BZD20', 'K-2140, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 320, 9, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(30, 'K2139', 'K2002', '61112-BZC80', 'K-2139, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 120, 4, '4A', 'D40D', '-', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(31, 'K2134', 'K2002', '61112-BZC60', 'K-2134, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 885, 21, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(32, 'K2135', 'K2002', '61112-BZC70', 'K-2135, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 546, 13, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(33, 'J3004', 'J3001', '63111-BZ300', 'J-3004, PANEL, ROOF', 'WH Docking', 'Inhouse', 450, 12, '4A', 'D17D', 'TERIYOU', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:16'),
(34, 'T2043', 'T2001', '61111-BZA00', 'T-2043, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 9923, 230, '4A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(35, 'T2045', 'T2001', '61111-BZA10', 'T-2045, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 2087, 49, '4A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(36, 'T2002', 'T2002', '61112-BZB00', 'T-2002, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 9923, 230, '4A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(37, 'T2004', 'T2002', '61112-BZB10', 'T-2004, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 2087, 49, '4A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(38, 'T3001', 'T3001', '63111-BZ290', 'T-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 12010, 278, '4A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(39, 'K2053', 'K2053', '61611-BZ181', 'K-2053, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 1142, 27, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(40, 'K2055', 'K2053', '61611-BZ201', 'K-2055, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 1431, 35, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(41, 'K2079', 'K2053', '61611-BZ241', 'K-2079, PANEL QUARTER, RH', 'WH Docking', 'Inhouse', 342, 9, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(42, 'K2104', 'K2053', '61611-BZ330', 'K-2104, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 320, 9, '4A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(43, 'K2054', 'K2054', '61612-BZ191', 'K-2054, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 1142, 27, '4A', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(44, 'K2056', 'K2054', '61612-BZ211', 'K-2056, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 1431, 35, '4A', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(45, 'K2080', 'K2054', '61612-BZ251', 'K-2080, PANEL QUARTER, LH', 'WH Docking', 'Inhouse', 342, 9, '4A', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(46, 'K2105', 'K2054', '61612-BZ360', 'K-2105, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 320, 9, '4A', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(47, 'K4013', 'K4013', '67113-BZ140', 'K-4013,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 342, 9, '5A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(48, 'K4015', 'K4013', '67113-BZ150', 'K-4015,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 1431, 34, '5A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(49, 'K4017', 'K4013', '67113-BZ160', 'K-4017,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 1142, 27, '5A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(50, 'K4074', 'K4013', '67113-BZ350', 'K-4074;PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 320, 9, '5A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(51, 'K4014', 'K4014', '67114-BZ140', 'K-4014,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 342, 9, '5A', 'D40D', 'A', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(52, 'K4016', 'K4014', '67114-BZ150', 'K-4016,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 1431, 35, '5A', 'D40D', 'A', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(53, 'K4018', 'K4014', '67114-BZ160', 'K-4018,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 1142, 27, '5A', 'D40D', 'A', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(54, 'K4075', 'K4014', '67114-BZ350', 'K-4075;PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 320, 9, '5A', 'D40D', 'A', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(55, 'K4070', 'K4053', '53311-BZ220', 'K-4070;PANEL, HOOD', 'WH Door Assy', 'Outhouse', 320, 9, '5A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(56, 'J1042', 'J1021', '55111-BZ721', 'J-1042, PANEL, DASH', 'WH Docking', 'Inhouse', 300, 7, '2A', 'D17D', 'AC', 'PL1-GM', 'DMUKTICO', '2022-03-15 07:16:16'),
(57, 'T1001', 'J1021', '55111-BZB10', 'T-1001, PANEL, DASH', 'WH Docking', 'Inhouse', 4890, 113, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:16'),
(58, 'T1002', 'J1021', '55111-BZB20', 'T-1002, PANEL, DASH', 'WH Docking', 'Inhouse', 2805, 66, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(59, 'T1003', 'J1021', '55111-BZB30', 'T-1003, PANEL, DASH', 'WH Docking', 'Inhouse', 754, 19, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(60, 'T1004', 'J1021', '55111-BZB40', 'T-1004, PANEL, DASH', 'WH Docking', 'Inhouse', 3561, 83, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(61, 'A2001', 'A2001', '61111-BZB50', 'A-2001, PANEL SIDE OUTER RH', 'WH Docking', 'Inhouse', 6526, 151, '4A', 'D26A', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(62, 'A2002', 'A2002', '61112-BZD40', 'A-2002, PANEL SIDE OUTER LH', 'WH Docking', 'Inhouse', 6526, 151, '4A', 'D26A', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(63, 'A3001', 'A3001', '63111-BZ320', 'A-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 6526, 151, '4A', 'D26A', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(64, 'A1014', 'A1014', '58311-BZ430', 'A-1014, PAN, REAR FLOOR', 'WH Docking', 'Inhouse', 15607, 371, '4A', 'D26A', 'ABCD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(65, 'A1015', 'A1014', '58311-BZ440', 'A-1015, PAN, REAR FLOOR', 'WH Docking', 'Inhouse', 1869, 50, '4A', 'D26A', '-', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(66, 'K1130', 'K1130', '65621-BZ020', 'K-1130,PANEL, SIDE GATE, RH', 'WH Docking', 'Inhouse', 734, 18, '2A', 'D40D', 'TEIRYO', 'PL1-GM-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(67, 'K1131', 'K1131', '65622-BZ020', 'K-1131,PANEL, SIDE GATE, LH', 'WH Docking', 'Inhouse', 734, 18, '2A', 'D40D', 'TEIRYO', 'PL1-GM-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(68, 'K1132', 'K1132', '65751-BZ020', 'K-1132,PANEL, TAIL GATE', 'WH Docking', 'Inhouse', 734, 18, '2A', 'D40D', 'TEIRYO', 'PL1-GM-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(69, 'K4005', 'K4005', '53811-BZ172', 'K-4005, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 5884, 141, '2A', 'D40D', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(70, 'K4007', 'K4005', '53811-BZ182', 'K-4007, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 2190, 55, '2A', 'D40D', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(71, 'K4006', 'K4006', '53812-BZ172', 'K-4006, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 5884, 141, '2A', 'D40D', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(72, 'K4008', 'K4006', '53812-BZ182', 'K-4008, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 2190, 55, '2A', 'D40D', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(73, 'T2018', 'T2018', '61632-BZ160', 'T-2018, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(74, 'T2017', 'T2017', '61631-BZ160', 'T-2017, PANEL, QTR WHEEL HOUSE, OUTER RH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(75, 'T2013', 'T2013', '61345-BZ150', 'T-2013, PILLAR, CTR BODY, INNER LWR RH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(76, 'T2014', 'T2014', '61346-BZ150', 'T-2014, PILLAR, CTR BODY, INNER LWR LH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(77, 'T2010', 'T2010', '61248-BZ090', 'T-2010, REINF, ROOF SIDE RAIL, INNER LH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(78, 'T2011', 'T2011', '61343-BZ200', 'T-2011, PILLAR, CTR BODY, INNER RH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(79, 'T2012', 'T2012', '61344-BZ210', 'T-2012, PILLAR, CTR BODY, INNER LH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(80, 'T2041', 'T2018', '61632-BZ180', 'T-2041, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D14N', '-', 'PL1-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(81, 'S1007', 'S1007', '57411-BZ250', 'S-1007, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 3787, 88, '2A', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(82, 'S1008', 'S1008', '57412-BZ320', 'S-1008, MEMBER, FLOOR SIDE, INNER LH', 'WH Docking', 'Inhouse', 3787, 88, '2A', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(83, 'S1009', 'S1007', '57411-BZ330', 'S-1009, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 4847, 112, '2A', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(84, 'S1010', 'S1008', '57412-BZ400', 'S-1010, MEMBER, FLOOR SIDE, INNER LH', 'WH Docking', 'Inhouse', 4847, 112, '2A', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(85, 'S1011', 'S1011', '57111-BZ270', 'S-1011, MEMBER, FR SIDE, FR RH', 'WH Docking', 'Inhouse', 8634, 199, '2A', 'D55L', 'D', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(86, 'S1012', 'S1012', '57112-BZ210', 'S-1012, MEMBER, FR SIDE, FR LH', 'WH Docking', 'Inhouse', 8634, 199, '2A', 'D55L', 'A', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(87, 'S2011', 'S2011', '61771-BZ080', 'S-2011,FRAME,BACKDOOR OPEN UPR CORNER,RH', 'WH Docking', 'Inhouse', 8634, 199, '2A', 'D55L', 'C', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(88, 'S2012', 'S2012', '61772-BZ060', 'S-2012,FRAME,BACKDOOR OPEN UPR CORNER,LH', 'WH Docking', 'Inhouse', 8634, 199, '2A', 'D55L', 'D', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(89, 'S4030', 'S4030', '67147-BZ180', 'S4030, PANEL, RR DOOR HINGE SIDE, RH', 'WH Docking', 'Inhouse', 8634, 199, '2A', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(90, 'S4031', 'S4031', '67148-BZ180', 'S4031, PANEL, RR DOOR HINGE SIDE, LH', 'WH Docking', 'Inhouse', 8634, 199, '2A', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(91, 'T2007', 'T2007', '61161-BZ260', 'T-2007, PILLAR, FR BODY, INNER RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(92, 'T2008', 'T2008', '61162-BZ280', 'T-2008, PILLAR, FR BODY, INNER LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(93, 'A1008', 'A1008', '57411-BZ310', 'A-1008, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 13020, 320, '2A', 'D26A', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(94, 'A1009', 'A1009', '57412-BZ360', 'A-1009, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 13020, 320, '2A', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(95, 'A1010', 'A1008', '57411-BZ310', 'A-1010, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 4456, 111, '2A', 'D26A', 'AC', '-', 'DMUKTICO', '2022-03-15 07:16:17'),
(96, 'A1011', 'A1009', '57412-BZ360', 'A-1011, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 4456, 111, '2A', 'D26A', 'BD', '-', 'DMUKTICO', '2022-03-15 07:16:17'),
(97, 'A2013', 'A2013', '61731-BZ260', 'A-2013, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 17476, 414, '2A', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(98, 'A2014', 'A2013', '61732-BZ250', 'A-2014, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 17476, 414, '2A', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(99, 'A2015', 'A2015', '61745-BZ090', 'A-2015, REINF, BACK DOOR OPENING, LWR RH', 'WH Docking', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(100, 'A2016', 'A2015', '61746-BZ050', 'A-2016, REINF, BACK DOOR OPENING, LWR LH', 'WH Docking', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(101, 'K4045', 'K4045', '67145-BZ050', 'K-4045,PANEL, FR DOOR HINGE SIDE,RH', 'WH Door Assy', 'Inhouse', 6204, 144, '2A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(102, 'K4046', 'K4046', '67146-BZ050', 'K-4046, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 6204, 144, '2A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(103, 'K4047', 'K4045', '67145-BZ060', 'K-4047,PANEL, FR DOOR HINGE SIDE,RH', 'WH Door Assy', 'Inhouse', 2190, 52, '2A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(104, 'K4048', 'K4046', '67146-BZ060', 'K-4048, PANEL, FR DOOR HINGE SIDE,LH', 'WH Door Assy', 'Inhouse', 2190, 52, '2A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(105, 'T2005', 'T2005', '61175-BZ150', 'T-2005, REIN FR BODY PLR,UPR OUT NO.2 RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(106, 'T2006', 'T2006', '61176-BZ150', 'T-2006, REIN FR BODY PLR,UPR OUT NO.2 LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(107, 'T2007', 'T2007', '61161-BZ260', 'T-2007, PILLAR, FR BODY, INNER RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(108, 'T2008', 'T2008', '61162-BZ280', 'T-2008, PILLAR, FR BODY, INNER LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(109, 'T2009', 'T2009', '61247-BZ090', 'T-2009, REINF, ROOF SIDE RAIL, INNER RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(110, 'T2010', 'T2010', '61248-BZ090', 'T-2010, REINF, ROOF SIDE RAIL, INNER LH', 'WH Docking', 'Inhouse', 12010, 278, '2A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(111, 'K1017', 'K1016', '55741-BZ150', 'K-1017,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 2190, 51, '3B', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(112, 'K1119', 'K1016', '55741-BZ200', 'K-1119,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 5924, 137, '3B', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(113, 'K1016', 'K1016', '55741-BZ130', 'K-1016,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 280, 7, '3B', 'D40D', 'A', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(114, 'T1005', 'T1005', '55741-BZ510', 'T-1005, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 7695, 178, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(115, 'T1006', 'T1005', '55741-BZ520', 'T-1006, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 4315, 101, '2A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(116, 'T4032', 'T4032', '61745-BZ110', 'T-4032, REINF, BACK DOOR OPENING, LWR RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(117, 'T4033', 'T4033', '61746-BZ080', 'T-4033, REINF, BACK DOOR OPENING, LWR LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(118, 'K4003', 'K4003', '53321-BZ130', 'K-4003,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 5884, 142, '3B', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(119, 'K4004', 'K4003', '53321-BZ140', 'K-4004,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 2190, 51, '3B', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(120, 'T3003', 'T3003', '63134-BZ260', 'T-3003, FRAME, BACK DOOR OPENING, INNER', 'WH Docking', 'Inhouse', 3147, 73, '3B', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(121, 'T4036', 'T3003', '63134-BZ220', 'T-4036, FRAME, BACK DOOR OPENING, INNER', 'WH Docking', 'Inhouse', 8863, 205, '3B', 'D14N', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(122, 'S1013', 'S1013', '52131-BZ170', 'S-1013, REINFORCEMENT, FR BUMPER', 'WH Docking', 'Inhouse', 8634, 199, '3B', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(123, 'S2007', 'S2007', '61613-BZ070', 'S-2007, PANEL, QUARTER, INNER RH', 'WH Docking', 'Inhouse', 8634, 199, '3B', 'D55L', 'B', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(124, 'S2008', 'S2008', '61614-BZ070', 'S-2008, PANEL, QUARTER, INNER LH', 'WH Docking', 'Inhouse', 8634, 199, '3B', 'D55L', 'D', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(125, 'S2009', 'S2009', '61733-BZ030', 'S-2009, PANEL, ROOF SIDE, INNER FR RH', 'WH Docking', 'Inhouse', 8634, 199, '3B', 'D55L', 'C', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(126, 'S2010', 'S2010', '61734-BZ030', 'S-2010, PANEL, ROOF SIDE, INNER FR LH', 'WH Docking', 'Inhouse', 8634, 199, '3B', 'D55L', 'A', 'SAP-KAP', 'DMUKTICO', '2022-03-15 07:16:17'),
(127, 'A1006', 'A1006', '57111-BZ290', 'A-1006, MEMBER, FR SIDE, FR RH/LH', 'WH Docking', 'Inhouse', 17476, 414, '3B', 'D26A', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(128, 'A1007', 'A1007', '57112-BZ310', 'A-1007, MEMBER, FR SIDE, FR LH', 'WH Docking', 'Inhouse', 17476, 414, '3B', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:17'),
(129, 'J4051', 'J4051', '53811-BZ340', 'J-4051, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 300, 11, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(130, 'J4053', 'J4051', '53811-BZ350', 'J-4053, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 3, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(131, 'J4057', 'J4051', '53811-BZ370', 'J-4057, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(132, 'J4059', 'J4051', '53811-BZ380', 'J-4059, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 150, 5, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(133, 'J4052', 'J4052', '53812-BZ280', 'J-4052, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 300, 11, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(134, 'J4054', 'J4052', '53812-BZ350', 'J-4054, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(135, 'J4058', 'J4052', '53812-BZ370', 'J-4058, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(136, 'J4060', 'J4052', '53812-BZ380', 'J-4060, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 150, 5, '5A', 'D17D', 'TERIYOU', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:17'),
(137, 'K1051', 'K1050', '64111-BZ020', 'K-1051, PANEL BACK', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(138, 'K1134', 'K1050', '64111-BZ060', 'K-1134, PANEL BACK', 'WH Docking', 'Inhouse', 271, 7, '5A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(139, 'K1052', 'K1050', '64111-BZ030', 'K-1052, PANEL BACK', 'WH Docking', 'Inhouse', 734, 18, '5A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(140, 'K1147', 'K1050', '64111-BZ051', 'K-1147, PANEL BACK', 'WH Docking', 'Inhouse', 170, 5, '5A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(141, 'K1158', 'K1050', '64111-BZ090', 'K-1158; PANEL BACK', 'WH Docking', 'Inhouse', 25, 2, '5A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(142, 'K1148', 'K1050', '64111-BZ061', 'K-1148, PANEL BACK', 'WH Docking', 'Inhouse', 3959, 92, '5A', 'D40D', 'C', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(143, 'K3005', 'K3005', '63111-BZ120', 'K-3005, PANEL ROOF', 'WH Docking', 'Inhouse', 919, 22, '5A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(144, 'K3007', 'K3005', '63111-BZ150', 'K-3007, PANEL ROOF', 'WH Docking', 'Inhouse', 4240, 98, '5A', 'D40D', 'B', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(145, 'K4001', 'K4001', '53311-BZ090', 'K-4001, PANEL HOOD', 'WH Door Assy', 'Inhouse', 5884, 142, '5A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(146, 'K4002', 'K4001', '53311-BZ100', 'K-4002,PANEL, HOOD', 'WH Door Assy', 'Inhouse', 2190, 51, '5A', 'D40D', 'D', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(147, 'K4009', 'K4009', '67111-BZ110', 'K-4009,PANEL FR DOOR OUTSIDE, RH', 'WH Door Assy', 'Inhouse', 5884, 137, '5A', 'D40D', 'A', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(148, 'K4011', 'K4009', '67111-BZ120', 'K-4011,PANEL FR DOOR OUTSIDE, RH', 'WH Door Assy', 'Inhouse', 2190, 52, '5A', 'D40D', 'A', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(149, 'K4072', 'K4009', '67111-BZ320', 'K-4072;PANEL, FR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 320, 9, '5A', 'D40D', 'A', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(150, 'K4010', 'K4010', '67112-BZ110', 'K-4010, PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 5831, 135, '5A', 'D40D', 'C', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(151, 'K4012', 'K4010', '67112-BZ120', 'K-4012,PANEL FR DOOR OUTSIDE, LH', 'WH Door Assy', 'Inhouse', 2190, 52, '5A', 'D40D', 'C', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(152, 'K4073', 'K4010', '67112-BZ320', 'K-4073;PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 320, 9, '5A', 'D40D', 'C', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(153, 'K4076', 'K4057', '67115-BZ620', 'K-4076;PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 269, 7, '5A', 'D40D', 'TERIYOU', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(154, 'K4077', 'K4057', '67115-BZ630', 'K-4077;PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 51, 3, '5A', 'D40D', 'TERIYOU', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(155, 'T4003', 'T4003', '53811-BZ560', 'T-4003, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 12010, 280, '5A', 'D14N', 'AC', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(156, 'T4004', 'T4004', '53812-BZ550', 'T-4004, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 12010, 281, '5A', 'D14N', 'BD', 'PL1-PL4-WELD', 'DMUKTICO', '2022-03-15 07:16:17'),
(157, 'T4034', 'T4034', '67115-BZA20', 'T-4034, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 2721, 62, 'PLANT-1', 'WELD1', 'WHPPL1-BIG', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:17'),
(158, 'T4035', 'T4035', '67115-BZA30', 'T-4035, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 6387, 145, 'PLANT-1', 'WELD1', 'WHPPL1-BIG', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:17'),
(159, 'J3001', 'J3001', '63111-BZ210', 'J-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 0, 2, '4A', 'D17D', '-', 'PL1-PL4-WELD1', 'DMUKTICO', '2022-03-15 07:16:18'),
(160, 'J3004', 'J3001', '63111-BZ300', 'J-3004, PANEL, ROOF', 'WH Docking', 'Inhouse', 450, 12, '4A', 'D17D', 'TERIYOU', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(161, 'A1002', 'A1001', '55111-BZD40', 'A-1002, PANEL, DASH', 'WH Docking', 'Inhouse', 6961, 189, '5A', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(162, 'A1003', 'A1001', '55111-BZD50', 'A-1003, PANEL, DASH', 'WH Docking', 'Inhouse', 6054, 132, '5A', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(163, 'A4006', 'A4006', '53812-BZ570', 'A-4006, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 7283, 176, '5A', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(164, 'A4010', 'A4006', '53812-BZ590', 'A-4010, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 1869, 50, '5A', 'D26A', '-', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(165, 'A4005', 'A4005', '53811-BZ570', 'A-4005, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 7283, 176, '5A', 'D26A', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(166, 'A4009', 'A4005', '53811-BZ590', 'A-4009, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 1869, 50, '5A', 'D26A', '-', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(167, 'A3003', 'A4019', '63132-BZ290', 'A-3003, WINDSHIELD HEADER, INNER', 'WH Docking', 'Inhouse', 17476, 414, '5A', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(168, 'A4019', 'A4019', '67118-BZ010', 'A-4019, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 8324, 205, '5A', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(169, 'A4021', 'A4019', '67118-BZ040', 'A-4021, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 1869, 50, '5A', 'D26A', '0', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(170, 'A2011', 'A2011', '61631-BZ220', 'A-2011, PANEL, QTR WHEEL HOUSE, OUTER RH', 'WH Docking', 'Inhouse', 17476, 414, '2A', 'D26A', 'BD', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(171, 'A2012', 'A2012', '61632-BZ220', 'A-2012, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:18'),
(172, 'A1012', 'A1012', '58111-BZ380', 'A1012,PAN, FR FLOOR', 'WH Docking', 'Outhouse', 9152, 257, '6A', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(173, 'K4055', 'K4055', '53811-BZ190', 'K-4055,PANEL, FR FENDER, RH', 'WH Docking', 'Outhouse', 320, 9, '2A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(174, 'K4056', 'K4056', '53812-BZ190', 'K-4056,PANEL, FR FENDER, LH', 'WH Docking', 'Outhouse', 320, 9, '2A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(175, 'K4071', 'K4054', '53321-BZ220', 'K-4071, PANEL, HOOD, INNER', 'WH Door Assy', 'Outhouse', 320, 9, '2A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(176, 'K4019', 'K4019', '67115-BZ220', 'K-4019,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Outhouse', 1022, 26, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(177, 'K4023', 'K4023', '67115-BZ280', 'K-4023,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Outhouse', 247, 7, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(178, 'K4032', 'K4032', '67143-BZ131', 'K-4032, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Outhouse', 662, 17, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(179, 'K4033', 'K4033', '67144-BZ121', 'K-4033, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Outhouse', 782, 19, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(180, 'K4042', 'K4032', '67143-BZ181', 'K-4042, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Outhouse', 1142, 27, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(181, 'K4043', 'K4033', '67144-BZ171', 'K-4043, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Outhouse', 1142, 27, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(182, 'K4049', 'K4049', '67149-BZ170', 'K-4049,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', 1237, 30, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(183, 'K4052', 'K4052', '67149-BZ200', 'K-4052,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', 247, 7, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(184, 'K4059', 'K4019', '67115-BZ340', 'K-4059,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Outhouse', 95, 3, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(185, 'K4062', 'K4019', '67115-BZ241', 'K-4062,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Outhouse', 202, 6, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(186, 'K4063', 'K4019', '67115-BZ251', 'K-4063,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Outhouse', 1229, 32, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(187, 'K4064', 'K4049', '67149-BZ181', 'K-4064,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', 1229, 32, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(188, 'K4067', 'K4049', '67149-BZ190', 'K-4067,PANEL BACK DOOR INSIDE', 'WH Door Assy', 'Outhouse', 202, 6, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(189, 'K4068', 'K4032', '67143-BZ152', 'K-4068, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Outhouse', 1431, 34, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(190, 'K4069', 'K4033', '67144-BZ142', 'K-4069, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Outhouse', 1431, 35, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(191, 'K4070', 'K4053', '53311-BZ220', 'K-4070;PANEL, HOOD', 'WH Door Assy', 'Outhouse', 320, 9, '5A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(192, 'K4051', 'K4051', '67149-BZ210', 'K-4051,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', 320, 9, '4A', 'D40D', '-', 'PL1-PL1-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(193, 'K4078', 'K4024', '67141-BZ081', 'K-4078,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Outhouse', 5884, 137, 'IPPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(194, 'K4079', 'K4025', '67142-BZ081', 'K-4079,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Outhouse', 5884, 136, 'IPPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(195, 'K4080', 'K4024', '67141-BZ091', 'K-4080,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Outhouse', 2190, 52, 'IPPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(196, 'K4081', 'K4025', '67142-BZ091', 'K-4081,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Outhouse', 2190, 52, 'IPPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(197, 'K4082', 'K4024', '67141-BZ121', 'K-4082,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Outhouse', 320, 9, 'IPPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(198, 'K4083', 'K4025', '67142-BZ121', 'K-4083,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Outhouse', 320, 9, 'IPPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(199, 'Y1033', 'Y1033', '53261-87Z02', 'Y-1033, BRKT RADIATOR RESERVE TAN', 'WH Docking', 'Outhouse', 5924, 137, 'MKSD', NULL, '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(200, 'A4042', 'A4041', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 4779, 102, '4A', 'D26A', 'A', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(201, 'A4041', 'A4041', '67149-BZ590', 'A-4041, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 1838, 42, '4A', 'WELD1', 'A', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(202, 'A4039', 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(203, 'A4040', 'A4039', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(204, 'A4031', 'A4031', '67133-BZ100', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(205, 'A4032', 'A4031', '67134-BZ110', 'A-4032, EXT,FR DOOR OUTS PNL REINF,RR LH', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(206, 'T2015', 'T2015', '61433-BZ190', 'T-2015, REINFORCEMENT, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(207, 'T2016', 'T2016', '61434-BZ180', 'T-2016, REINFORCEMENT, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(208, 'A4020', 'A4019', '67118-BZ020', 'A-4020, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 7283, 176, '5A', 'D26A', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(209, 'A4022', 'A4022', '67119-BZ040', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 'WH Door Assy', 'Inhouse', 17476, 414, '5A', 'D26A', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(210, 'T4023', 'T4023', '67147-BZ170', 'T-4023, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(211, 'T4024', 'T4024', '67148-BZ170', 'T-4024, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(212, 'T4021', 'T4021', '67135-BZ090', 'T-4021, EXT,RR DOOR OUTSIDE REINFORCE,RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(213, 'T4022', 'T4022', '67136-BZ070', 'T-4022, EXT,RR DOOR OUTSIDE REINFORCE,LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(214, 'T4013', 'T4013', '67145-BZ160', 'T-4013, PANEL, FR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(215, 'T4014', 'T4014', '67146-BZ150', 'T-4014, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(216, 'J4041', 'J4041', '53311-BZ230', 'J-4041, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 450, 22, '5A', 'D17D', 'TERIYOU', 'SP-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(217, 'J4042', 'J4042', '53321-BZ230', 'J-4042,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 450, 22, '5A', 'D17D', 'TERIYOU', 'SP-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(218, 'J4017', 'J4017', '67111-BZ210', 'J-4017, PANEL, FR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(219, 'J4018', 'J4018', '67112-BZ220', 'J-4018, PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(220, 'J4021', 'J4021', '67113-BZ240', 'J-4021, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 450, 14, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(221, 'J4022', 'J4022', '67114-BZ240', 'J-4022, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 450, 12, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(222, 'J4031', 'J4031', '67141-BZ180', 'J-4031, PANEL, FR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(223, 'J4032', 'J4032', '67142-BZ180', 'J-4032, PANEL, FR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-15 07:16:18'),
(224, 'T4015', 'T4015', '67113-BZ410', 'T-4015, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 12010, 278, '5A', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(225, 'T4016', 'T4016', '67114-BZ410', 'T-4016, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 12010, 278, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(226, 'T4029', 'T4029', '67115-BZ820', 'T-4029, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 1998, 50, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(227, 'T4030', 'T4029', '67115-BZ840', 'T-4030, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 1149, 27, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(228, 'T4002', 'T4002', '53321-BZ280', 'T-4002, PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 12010, 283, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(229, 'T4001', 'T4001', '53311-BZ290', 'T-4001, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 12010, 283, '5A', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:18'),
(230, 'GBA0001', 'GBA0001', '55168-BZ310', 'GBA-0001, BRACKET, FR FENDER MOUNTING', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(231, 'GBA0002', 'GBA0002', '55169-BZ210', 'GBA-0002, BRACKET,FR FENDER MOUNTING, LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(232, 'GK0026', 'GK0026', '67164-BZ020', 'GK-0026, EXT, FR DR INS PNL REINF, RR LH', 'WH Door Assy', 'Outhouse', 8394, 195, 'ASALTA', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(233, 'GK0055', 'GK0055', '67351-BZ010', 'GK-0055, REINF, FR DOOR FR UPR FRAME, RH', 'WH Door Assy', 'Outhouse', 8394, 195, 'ASALTA', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(234, 'GK0056', 'GK0056', '67352-BZ010', 'GK-0056, REINF, FR DOOR FR UPR FRAME, LH', 'WH Door Assy', 'Outhouse', 8394, 195, 'ASALTA', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(235, 'GK0057', 'GK0057', '67353-BZ010', 'GK-0057, REIN, FR DR FR UPR FRME, NO.2 R', 'WH Door Assy', 'Outhouse', 8394, 195, 'ASALTA', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(236, 'GK0058', 'GK0058', '67354-BZ010', 'GK-0058, REINF, FR DR FR UPR FRM, NO.2 L', 'WH Door Assy', 'Outhouse', 8394, 195, 'ASALTA', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(237, 'GA0001', 'GA0001', '57803-BZ060', 'GA-0001, REINF S/A, RR FLR SI MBR, RR RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(238, 'GA0002', 'GA0002', '57804-BZ040', 'GA-0002, REINF S/A, RR FLR SI MBR, RR LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(239, 'GA0003', 'GA0003', '61675-BZ100', 'GA-0003, REINF, RR SUSP SPRING SUPT, RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(240, 'GBA0003', 'GBA0003', '57033-BZ060', 'GBA-0003,BRACKET S/A,RR FLOOR MTG,NO.2RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(241, 'GBA0004', 'GBA0004', '57034-BZ050', 'GBA-0004,BRACKET S/A,RR FLOOR MTG,NO.2LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(242, 'GBA0005', 'GBA0005', '57403-BZ150', 'GBA-0005, MEMBER S/A,FLR SIDE,INNR RR RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(243, 'GBA0006', 'GBA0006', '57404-BZ140', 'GBA-0006, MEMBER S/A,FLR SIDE,INNR RR LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(244, 'GBA0007', 'GBA0007', '57603-BZ230', 'GBA-0007, MEMBER S/A,RR FLOOR SIDE,RR RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(245, 'GBA0008', 'GBA0008', '57604-BZ200', 'GBA-0008, MEMBER S/A,RR FLOOR SIDE,RR LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(246, 'GA0004', 'GA0004', '57188-BZ080', 'GA-0004, REINF, FR SIDE MEMBER EXT, RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(247, 'GBA0009', 'GBA0009', '51501-BZ090', 'GBA-0009, REINF SUB-ASSY,FR SUSP MBR, RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(248, 'GBA0010', 'GBA0010', '51502-BZ080', 'GBA-0010, SUPPORT S/A,SUSPENSION ARM, LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(249, 'GBA0011', 'GBA0011', '51543-BZ020', 'GBA-0011, REINF,LWR CTRL LINK BRACKET,RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(250, 'GBA0012', 'GBA0012', '51544-BZ020', 'GBA-0012, REINF,LWR CTRL LINK BRACKET,LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(251, 'GBA0013', 'GBA0013', '51904-BZ040', 'GBA-0013, HANGER S/A, EXHAUST PIPE, NO.4', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(252, 'GBA0014', 'GBA0014', '57117-BZ080', 'GBA-0014, PLATE, FR SIDE MEMBER, NO.2 RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(253, 'GBA0015', 'GBA0015', '57118-BZ080', 'GBA-0015, PLATE, FR SIDE MEMBER, NO.2 LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(254, 'GBA0016', 'GBA0016', '57801-BZ130', 'GBA-0016, REINF S/A,RR FLR SI MBR, FR RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(255, 'GBA0017', 'GBA0017', '57802-BZ030', 'GBA-0017, REINF S/A,RR FLR SI MBR, FR LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(256, 'GK0086', 'GK0086', '67331-BZ050', 'GK-0086, RETAINER, SLIDE DOOR LOCK, RH', 'WH Door Assy', 'Outhouse', 2862, 68, 'DPM', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(257, 'GK0010', 'GK0010', '67051-BZ020', 'GK-0010, REINF SUB-ASSY, FR DOOR, RH', 'WH Door Assy', 'Outhouse', 2190, 52, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(258, 'GK0013', 'GK0013', '67121-BZ040', 'GK-0013, REINF, FR DOOR OUTSIDE PNL, RH', 'WH Door Assy', 'Outhouse', 6204, 144, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(259, 'GK0014', 'GK0014', '67121-BZ050', 'GK-0014, REINF, FR DOOR OUTSIDE PNL, RH', 'WH Door Assy', 'Outhouse', 2190, 52, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(260, 'GK0015', 'GK0015', '67122-BZ030', 'GK-0015, REINF, FR DOOR OUTSIDE PANEL,LH', 'WH Door Assy', 'Outhouse', 6204, 144, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:18'),
(261, 'GK0016', 'GK0016', '67122-BZ040', 'GK-0016, REINF, FR DOOR OUTSIDE PNL, LH', 'WH Door Assy', 'Outhouse', 2190, 52, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(262, 'GK0019', 'GK0019', '67125-BZ050', 'GK-0019, REINF, RR DOOR OUTSIDE PANEL, R', 'WH Door Assy', 'Outhouse', 3235, 75, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(263, 'GK0020', 'GK0020', '67126-BZ050', 'GK-0020,REINF, RR DOOR OUTSIDE PANEL, LH', 'WH Door Assy', 'Outhouse', 3235, 76, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(264, 'GK0022', 'GK0022', '67131-BZ020', 'GK-0022, EXT, FR DR OUT PNL REINF, FR RH', 'WH Door Assy', 'Outhouse', 16788, 389, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(265, 'GK0023', 'GK0023', '67135-BZ010', 'GK-0023, REINF, SLIDE DOOR OUTER PANEL', 'WH Door Assy', 'Outhouse', 6470, 151, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(266, 'GK0024', 'GK0024', '67155-BZ060', 'GK-0024, REINF, RR DOOR INSIDE PANEL, RH', 'WH Door Assy', 'Outhouse', 3235, 75, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(267, 'GK0025', 'GK0025', '67156-BZ050', 'GK-0025, REINF, RR DOOR INSIDE PANEL, LH', 'WH Door Assy', 'Outhouse', 3235, 76, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(268, 'GK0027', 'GK0027', '67166-BZ040', 'GK-0027, EXT, FR DR INS PNL REINF, FR LH', 'WH Door Assy', 'Outhouse', 2190, 52, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(269, 'GK0030', 'GK0030', '67173-BZ020', 'GK-0030, REINF, FR DOOR LWR HINGE, RH', 'WH Door Assy', 'Outhouse', 6109, 142, 'P3T', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(270, 'GK0038', 'GK0038', '67183-BZ030', 'GK-0038, PATCH, FR DR REINF, RH', 'WH Door Assy', 'Outhouse', 8394, 195, 'P3T', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(271, 'GK0039', 'GK0039', '67261-BZ010', 'GK-0039, PLATE, B/ DR REINFRON, NO.1 RH', 'WH Door Assy', 'Outhouse', 320, 9, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(272, 'GK0040', 'GK0040', '67262-BZ010', 'GK-0040, PLATE, B / D REINFOR, NO.1 LH', 'WH Door Assy', 'Outhouse', 320, 9, 'MAJ', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(273, 'GA0005', 'GA0005', '52141-BZ100', 'GA-0005, ARM, FR BUMPER, RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(274, 'GA0006', 'GA0006', '57025-BZ070', 'GA-0006, MEMBER S/A,FR SIDE,OUTER RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(275, 'GA0007', 'GA0007', '57026-BZ060', 'GA-0007, MEMBER S/A,FR SIDE,OUTER LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(276, 'GBA0018', 'GBA0018', '57105-BZ200', 'GBA-0018, PLATE S/A, FR SIDE MEMBER, RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(277, 'GBA0175', 'GBA0175', '57106-BZ240', 'GBA-0175, PLATE S/A, FR SIDE MEMBER, LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(278, 'GBA0020', 'GBA0020', '57406-BZ270', 'GBA-0020, MEMBER S/A,MAIN FLOOR SIDE, RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(279, 'GBA0021', 'GBA0021', '57409-BZ240', 'GBA-0021, MEMBER S/A,MAIN FLOOR SIDE, LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(280, 'GA0008', 'GA0008', '53202-BZ140', 'GA-0008, SUPPORT SUB-ASSY, RADIATOR, RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19');
INSERT INTO `tbl_master_part` (`id`, `job_no`, `job_master`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `maks_shift`, `machine`, `model`, `patan`, `routing`, `create_by`, `create_date`) VALUES
(281, 'GA0009', 'GA0009', '53203-BZ240', 'GA-0009, SUPPORT SUB-ASSY, RADIATOR, LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(282, 'GA0010', 'GA0010', '53213-BZ130', 'GA-0010, SUPPORT, RADIATOR, UPR RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(283, 'GA0011', 'GA0011', '53214-BZ110', 'GA-0011, SUPPORT, RADIATOR, UPR LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(284, 'GK0009', 'GK0009', '61773-BZ010', 'GK-0009, REINF, RR WIPER MOUNTING', 'WH Door Assy', 'Outhouse', 247, 7, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(285, 'GK0041', 'GK0041', '67301-BZ050', 'GK-0041, BEAM S/A, DR SI-IMP PROTECT, RH', 'WH Door Assy', 'Outhouse', 2285, 55, 'P3T', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(286, 'GK0042', 'GK0042', '67302-BZ040', 'GK-0042, BEAM S/A, DR SI-IMP PROTECT, LH', 'WH Door Assy', 'Outhouse', 2285, 55, 'P3T', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(287, 'GK0043', 'GK0043', '67303-BZ030', 'GK-0043, BEAM S/A, RR DR PROTECTION, RH', 'WH Door Assy', 'Outhouse', 434, 11, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(288, 'GK0044', 'GK0044', '67304-BZ030', 'GK-0044, BEAM S/A, RR DR PROTECTION, LH', 'WH Door Assy', 'Outhouse', 434, 11, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(289, 'GK0052', 'GK0052', '67347-BZ010', 'GK-0052, RETAIN, SLIDE DR CTR ROLLER, RH', 'WH Door Assy', 'Outhouse', 1431, 34, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(290, 'GK0053', 'GK0053', '67348-BZ010', 'GK-0053, RETAIN, SLIDE DR CTR ROLLER, LH', 'WH Door Assy', 'Outhouse', 1431, 35, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(291, 'GK0067', 'GK0067', '67391-BZ050', 'GK-0067,REINF, BACK DOOR LOCK', 'WH Door Assy', 'Outhouse', 2668, 66, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(292, 'GK0068', 'GK0068', '67391-BZ060', 'GK-0068, REINF, BACK DOOR LOCK', 'WH Door Assy', 'Outhouse', 247, 7, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(293, 'GK0069', 'GK0069', '67391-BZ070', 'GK-0069, REINF, BACK DOOR LOCK', 'WH Door Assy', 'Outhouse', 320, 9, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(294, 'GK0070', 'GK0070', '67395-BZ010', 'GK-0070, RETAINER, BACK DOOR GRIP', 'WH Door Assy', 'Outhouse', 494, 13, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(295, 'GK0071', 'GK0071', '68601-BZ010', 'GK-0071,REINF S / A, BACK DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', 247, 7, 'MES', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(296, 'GK0083', 'GK0083', '67347-BZ020', 'GK-0083 RETAIN,SLIDE DOOR CTR ROLLER,RH', 'WH Door Assy', 'Outhouse', 0, 0, '-', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(297, 'GK0084', 'GK0084', '67348-BZ020', 'GK-0084 RETAIN,SLIDE DOOR CTR ROLLER, LH', 'WH Door Assy', 'Outhouse', 0, 0, '-', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(298, 'GK0081', 'GK0081', '68131-BZ270', 'GK-0081,PANEL, BACK DOOR GLASS', 'WH Door Assy', 'Outhouse', 1022, 26, 'MKSD', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(299, 'GA0032', 'GA0032', '53078-BZ140', 'GA-0032,EXTENSION S/A,FR FENDER APRON,LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(300, 'GA0033', 'GA0033', '58269-BZ050', 'GA-0033, BRACKET,PRKG BRK CBL GUIDE,NO.3', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(301, 'GA0034', 'GA0034', '58289-BZ120', 'GA-0034, BRACKET,FLOOR BRAKE HOSE, RR RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(302, 'GK0007', 'GK0007', '53401-BZ030', 'GK-0007, HINGE SUB-ASSY, HOOD, RH', 'WH Door Assy', 'Outhouse', 8394, 199, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(303, 'GK0008', 'GK0008', '53402-BZ030', 'GK-0008, HINGE SUB-ASSY, HOOD, LH', 'WH Door Assy', 'Outhouse', 8394, 199, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(304, 'GK0028', 'GK0028', '67171-BZ010', 'GK-0028, REINF, FR DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', 8394, 195, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(305, 'GK0029', 'GK0029', '67172-BZ010', 'GK-0029, REINF, FR DOOR HINGE, LH', 'WH Door Assy', 'Outhouse', 8394, 195, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(306, 'GK0050', 'GK0050', '67335-BZ050', 'GK-0050,REINFORCEMENT, FR DOOR LOCK, RH', 'WH Door Assy', 'Outhouse', 8394, 195, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(307, 'GK0051', 'GK0051', '67336-BZ060', 'GK-0051, REINF, FR DOOR LOCK, LH', 'WH Door Assy', 'Outhouse', 8394, 195, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(308, 'GK0054', 'GK0054', '67349-BZ030', 'GK-0054, REINF, RR DOOR UPR FRAME', 'WH Door Assy', 'Outhouse', 2093, 50, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(309, 'GK0059', 'GK0059', '67355-BZ010', 'GK-0059, REINF, FR DOOR RR FRAME, RH', 'WH Door Assy', 'Outhouse', 8394, 195, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(310, 'GK0060', 'GK0060', '67356-BZ010', 'GK-0060, REINF, FR DOOR RR FRAME, LH', 'WH Door Assy', 'Outhouse', 8394, 195, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(311, 'GK0063', 'GK0063', '67359-BZ030', 'GK-0063, REINF, RR DOOR UPR FRAME, LH', 'WH Door Assy', 'Outhouse', 2093, 50, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(312, 'GK0076', 'GK0076', '68801-BZ091', 'GK-0076,HINGE SUB ASSY, BACK DOOR', 'WH Door Assy', 'Outhouse', 5976, 138, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(313, 'GK0085', 'GK0085', '67127-BZ031', 'GK-0085, REINF, RR DOOR OUTS PANEL, NO.2', 'WH Door Assy', 'Outhouse', 6470, 150, 'NAMICOH', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(314, 'GA0036', 'GA0036', '51401-BZ110', 'GA-0036, BRACKET S/A, ENGINE FR MOUNTING', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(315, 'GBK0152', 'GBK0152', '53331-BZ190', 'GBK-0152,PLATE, HOOD HINGE MOUNTING', 'WH Door Assy', 'Outhouse', 0, 0, '-', 'D40L', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(316, 'GK0002', 'GK0002', '53307-BZ071', 'GK-0002, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Outhouse', 5884, 142, 'STEP', 'E4-03', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(317, 'GK0004', 'GK0004', '53307-BZ081', 'GK-0004, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Outhouse', 2190, 51, 'STEP', 'E3-40A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(318, 'GK0005', 'GK0005', '53307-BZ090', 'GK-0005, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Outhouse', 320, 9, 'STEP', 'E3-26', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(319, 'GK0006', 'GK0006', '53331-BZ050', 'GK-0006, PLATE, HOOD HINGE MOUNTING', 'WH Door Assy', 'Outhouse', 12408, 297, 'STEP', 'E2-36B', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(320, 'GK0011', 'GK0011', '67053-BZ030', 'GK-0011,REINF S / A, FR DOOR INS PNL, RH', 'WH Door Assy', 'Outhouse', 8394, 195, 'STEP', 'E3-29', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(321, 'GK0012', 'GK0012', '67117-BZ010', 'GK-0012, REINF, RR WIPER MOUNTING', 'WH Door Assy', 'Outhouse', 2668, 66, 'STEP', 'E3-24', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(322, 'GK0017', 'GK0017', '67123-BZ040', 'GK-0017, RETAIN, SLIDE D UPR ROLLER, RH', 'WH Door Assy', 'Outhouse', 3235, 75, 'STEP', 'E3-40B', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(323, 'GK0018', 'GK0018', '67124-BZ030', 'GK-0018, RETAIN, SLIDE DR UPR ROLLER, LH', 'WH Door Assy', 'Outhouse', 3235, 76, 'STEP', 'E3-42A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(324, 'GK0031', 'GK0031', '67175-BZ040', 'GK-0031, REINFOR, BACK DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', 2668, 66, 'STEP', 'E4-01', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(325, 'GK0032', 'GK0032', '67175-BZ060', 'GK-0032, REINF, BACK DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', 320, 9, 'STEP', 'E3-04C', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(326, 'GK0033', 'GK0033', '67176-BZ030', 'GK-0033, REINF, BACK DOOR HINGE, LH', 'WH Door Assy', 'Outhouse', 2668, 66, 'STEP', 'E2-33', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(327, 'GK0034', 'GK0034', '67176-BZ050', 'GK-0034, REINF, BACK DOOR HINGE, LH', 'WH Door Assy', 'Outhouse', 320, 9, 'STEP', 'E3-44B', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(328, 'GK0035', 'GK0035', '67177-BZ030', 'GK-0035, REINF, RR DOOR LWR ROLLER, RH', 'WH Door Assy', 'Outhouse', 3235, 75, 'STEP', 'E3-31', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(329, 'GK0036', 'GK0036', '67178-BZ020', 'GK-0036, REINF, RR DOOR LWR ROLLER, LH', 'WH Door Assy', 'Outhouse', 3235, 76, 'STEP', 'E3-36', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(330, 'GK0046', 'GK0046', '67317-BZ020', 'GK-0046, REINF, RR DOOR SIDE, RH', 'WH Door Assy', 'Outhouse', 4186, 98, 'STEP', 'E3-42B', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(331, 'GK0048', 'GK0048', '67333-BZ040', 'GK-0048, RETAINER, SLIDE DOOR LOCK, RH', 'WH Door Assy', 'Outhouse', 1551, 37, 'STEP', 'E3-43C', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(332, 'GK0049', 'GK0049', '67334-BZ030', 'GK-0049, RETAINER, SLIDE DOOR LOCK, LH', 'WH Door Assy', 'Outhouse', 1551, 37, 'STEP', 'E3-45B', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(333, 'GK0061', 'GK0061', '67357-BZ010', 'GK-0061, REINF, RR DOOR FR UPR FRAME, RH', 'WH Door Assy', 'Outhouse', 3235, 75, 'STEP', 'E3-44C', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(334, 'GK0062', 'GK0062', '67358-BZ010', 'GK-0062, REINF, RR DOOR FR UPR FRAME, LH', 'WH Door Assy', 'Outhouse', 3235, 76, 'STEP', 'E3-09B', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(335, 'GK0064', 'GK0064', '67361-BZ030', 'GK-0064,RETAINER, BACK DOOR HINGE', 'WH Door Assy', 'Outhouse', 30952, 739, 'STEP', 'E4-07', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(336, 'GA0038', 'GA0038', '61677-BZ090', 'GA-0038, BRACKET,RR SUSPENSION BUMPER,RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(337, 'GA0040', 'GA0040', '57153-BZ140', 'GA-0040, REINF, FR SIDE MEMBER, NO.2 RH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(338, 'GA0041', 'GA0041', '57154-BZ130', 'GA-0041, REINF, FR SIDE MEMBER, NO.2 LH', 'WH Docking', 'Outhouse', 0, 0, '-', 'D26A', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(339, 'GK0037', 'GK0037', '67181-BZ090', 'GK-0037, RETAINER, DOOR HINGE', 'WH Door Assy', 'Outhouse', 33576, 777, 'YPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(340, 'GK0079', 'GK0079', '67245-BZ010', 'GK-0079,RETAINER, OUTSIDE MIRROR BASE', 'WH Door Assy', 'Outhouse', 1431, 36, 'YPI', 'D40D', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(341, 'GK0087', 'GK0087', '67975-BZ060', 'GK-0087, REINF, BACK DOOR INSIDE PANEL', 'WH Door Assy', 'Outhouse', 0, 0, '-', 'D40L', '-', '-', 'DMUKTICO', '2022-03-15 07:16:19'),
(342, 'GBJ0030', 'GBJ0030', '58372-BZ100', 'GBJ-0030, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Inhouse', 300, 9, '3B', 'D17D', 'TEIRYO', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:19'),
(343, 'GBJ0031', 'GBJ0031', '58372-BZ110', 'GBJ-0031, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Inhouse', 150, 5, '3B', 'D17D', 'TEIRYO', 'PL1-PPL', 'DMUKTICO', '2022-03-15 07:16:19'),
(344, 'T1008', 'T1008', '58311-BZ380', 'T1008, PAN, RR FLOOR', 'WH Docking', 'Inhouse', 12010, 278, '4A', 'D14N', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:19'),
(345, 'T3002', 'T4031', '63132-BZ280', 'T3002, PANEL, WINDSHIELD HEADER, INNER', 'WH Docking', 'Inhouse', 12010, 278, '5A', 'D14N', 'AC', 'PL1-PL4', 'DMUKTICO', '2022-03-15 07:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_part_ppl`
--

CREATE TABLE `tbl_master_part_ppl` (
  `id` int(11) NOT NULL,
  `job_no` varchar(30) DEFAULT NULL,
  `job_master` varchar(20) DEFAULT NULL,
  `part_no` varchar(30) DEFAULT NULL,
  `part_name` varchar(50) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `proses` varchar(20) DEFAULT NULL,
  `pcs_month` int(11) DEFAULT NULL,
  `prod_shift` int(11) DEFAULT NULL,
  `vendor` varchar(30) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `part_category` varchar(30) DEFAULT NULL,
  `routing` varchar(30) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_part_ppl`
--

INSERT INTO `tbl_master_part_ppl` (`id`, `job_no`, `job_master`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `prod_shift`, `vendor`, `model`, `part_category`, `routing`, `create_by`, `create_date`) VALUES
(2, 'A4042', 'A4041', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 'PPL', 'Inhouse', 4779, 102, 'PLANT-1', 'D26A', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(3, 'A4039', 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 'PPL', 'Inhouse', 17476, 414, 'PLANT-1', 'D26A', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(4, 'A4040', 'A4039', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 'PPL', 'Inhouse', 17476, 414, 'PLANT-1', 'D26A', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(5, 'A4031', 'A4031', '67133-BZ100', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 'PPL', 'Inhouse', 17476, 414, 'PLANT-1', 'D26A', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(6, 'A4032', 'A4031', '67134-BZ110', 'A-4032, EXT,FR DOOR OUTS PNL REINF,RR LH', 'PPL', 'Inhouse', 17476, 414, 'PLANT-1', 'D26A', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(7, 'T2015', 'T2015', '61433-BZ190', 'T-2015, REINFORCEMENT, ROCKER, OUTER RH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(8, 'T2016', 'T2016', '61434-BZ180', 'T-2016, REINFORCEMENT, ROCKER, OUTER LH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(9, 'A4020', 'A4019', '67118-BZ020', 'A-4020, PANEL, BACK DOOR, LWR OUTSIDE', 'PPL', 'Inhouse', 7283, 176, 'PLANT-1', 'D26A', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(10, 'A4022', 'A4022', '67119-BZ040', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 'PPL', 'Inhouse', 17476, 414, 'PLANT-1', 'D26A', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(11, 'T4023', 'T4023', '67147-BZ170', 'T-4023, PANEL, RR DOOR HINGE SIDE, RH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(12, 'T4024', 'T4024', '67148-BZ170', 'T-4024, PANEL, RR DOOR HINGE SIDE, LH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(13, 'T4021', 'T4021', '67135-BZ090', 'T-4021, EXT,RR DOOR OUTSIDE REINFORCE,RH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(14, 'T4022', 'T4022', '67136-BZ070', 'T-4022, EXT,RR DOOR OUTSIDE REINFORCE,LH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(15, 'T4013', 'T4013', '67145-BZ160', 'T-4013, PANEL, FR DOOR HINGE SIDE, RH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(16, 'T4014', 'T4014', '67146-BZ150', 'T-4014, PANEL, FR DOOR HINGE SIDE, LH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(17, 'J4041', 'J4041', '53311-BZ230', 'J-4041, PANEL, HOOD', 'PPL', 'Inhouse', 450, 22, 'PLANT-1', 'D17D', '-', 'SP-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(18, 'J4042', 'J4042', '53321-BZ230', 'J-4042,PANEL, HOOD, INNER', 'PPL', 'Inhouse', 450, 22, 'PLANT-1', 'D17D', '-', 'SP-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(19, 'J4017', 'J4017', '67111-BZ210', 'J-4017, PANEL, FR DOOR, OUTSIDE RH', 'PPL', 'Inhouse', 450, 13, 'PLANT-1', 'D17D', '-', 'PL1-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(20, 'J4018', 'J4018', '67112-BZ220', 'J-4018, PANEL, FR DOOR, OUTSIDE LH', 'PPL', 'Inhouse', 450, 13, 'PLANT-1', 'D17D', '-', 'PL1-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(21, 'J4021', 'J4021', '67113-BZ240', 'J-4021, PANEL, RR DOOR, OUTSIDE RH', 'PPL', 'Inhouse', 450, 14, 'PLANT-1', 'D17D', '-', 'PL1-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(22, 'J4022', 'J4022', '67114-BZ240', 'J-4022, PANEL, RR DOOR, OUTSIDE LH', 'PPL', 'Inhouse', 450, 12, 'PLANT-1', 'D17D', '-', 'PL1-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(23, 'J4031', 'J4031', '67141-BZ180', 'J-4031, PANEL, FR DOOR, INSIDE RH', 'PPL', 'Inhouse', 450, 13, 'PLANT-1', 'D17D', '-', 'PL1-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(24, 'J4032', 'J4032', '67142-BZ180', 'J-4032, PANEL, FR DOOR, INSIDE LH', 'PPL', 'Inhouse', 450, 13, 'PLANT-1', 'D17D', '-', 'PL1-PPL-WELD', 'Aji Wibowo', '2022-03-15 14:45:26'),
(25, 'T4015', 'T4015', '67113-BZ410', 'T-4015, PANEL, RR DOOR, OUTSIDE RH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(26, 'T4016', 'T4016', '67114-BZ410', 'T-4016, PANEL, RR DOOR, OUTSIDE LH', 'PPL', 'Inhouse', 12010, 278, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(27, 'T4029', 'T4029', '67115-BZ820', 'T-4029, PANEL, BACK DOOR, OUTSIDE', 'PPL', 'Inhouse', 1998, 50, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(28, 'T4030', 'T4029', '67115-BZ840', 'T-4030, PANEL, BACK DOOR, OUTSIDE', 'PPL', 'Inhouse', 1149, 27, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(29, 'T4002', 'T4002', '53321-BZ280', 'T-4002, PANEL, HOOD, INNER', 'PPL', 'Inhouse', 12010, 283, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(30, 'T4001', 'T4001', '53311-BZ290', 'T-4001, PANEL, HOOD', 'PPL', 'Inhouse', 12010, 283, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(31, 'T4031', 'T4031', '67149-BZ540', 'PANEL, BACK DOOR, INSIDE', 'PPL', 'Inhouse', 12010, 281, 'PLANT-1', 'D14N', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(32, 'GBJ0030', 'GBJ0030', '58372-BZ100', 'GBJ-0030, PANEL, BODY LWR BACK, INNER', 'PPL', 'Inhouse', 300, 9, 'PLANT-1', 'D17D', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(33, 'GBJ0031', 'GBJ0031', '58372-BZ110', 'GBJ-0031, PANEL, BODY LWR BACK, INNER', 'PPL', 'Inhouse', 150, 5, 'PLANT-1', 'D17D', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(34, 'A4041', 'A4041', '67149-BZ590-00', 'A-4041, PANEL, BACK DOOR, INSIDE', 'PPL', 'Inhouse', 1838, 42, 'PLANT-1', 'WELD1', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(35, 'T4035', 'T4035', '67115-BZA30-00', 'T-4035, PANEL, BACK DOOR, OUTSIDE', 'PPL', 'Inhouse', 6387, 145, 'PLANT-1', 'WELD1', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(36, 'T4034', 'T4034', '67115-BZA20-00', 'T-4034, PANEL, BACK DOOR, OUTSIDE', 'PPL', 'Inhouse', 2721, 62, 'PLANT-1', 'WELD1', '-', 'PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:26'),
(37, 'NX0531', 'NX0531', '61628-BZ080-00', 'NX-0531, REINFORCEMENT, QUARTER INNER PANEL, LH', 'PPL2', 'Outhouse', 450, 11, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(38, 'AX3089', 'AX3089', '52185-BZ080-00', 'AX-3089, BRACKET, RR BUMPER SIDE MOUNTING', 'PPL2', 'Outhouse', 900, 21, 'YOSKA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(39, 'NT0320', 'NT0320', '58033-BZ030-00', 'NT-0320, REINFORCE SUB-ASSY, BODY LWR BACK, RH', 'PPL2', 'Outhouse', 12832, 289, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(40, 'NT0321', 'NT0321', '58034-BZ030-00', 'NT-0321, REINFORCE SUB-ASSY, BODY LWR BACK, LH', 'PPL2', 'Outhouse', 12832, 289, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(41, 'NT0144', 'NT0144', '52185-BZ120-00', 'NT-0144, BRACKET, RR BUMPER SIDE MOUNTING', 'PPL2', 'Outhouse', 25664, 578, 'YOSKA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(42, 'NX2794', 'NX2794', '53213-BZ120-00', 'NX-2794, SUPPORT, RADIATOR, UPR RH', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(43, 'NX2795', 'NX2795', '53214-BZ080-00', 'NX-2795, SUPPORT, RADIATOR, UPR LH', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(44, 'NT0179', 'NT0179', '53205-BZ190-00', 'NT-0179, SUPPORT SUB-ASSY, RADIATOR, UPR', 'PPL2', 'Outhouse', 12832, 289, 'TRIMITRA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(45, 'NT0182', 'NT0182', '53220-BZ030-00', 'NT-0182, SUPPORT ASSY, RADIATOR, LH', 'PPL2', 'Outhouse', 12832, 289, 'TRIMITRA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(46, 'NT0181', 'NT0181', '53213-BZ090-00', 'NT-0181, SUPPORT, RADIATOR, UPR RH', 'PPL2', 'Outhouse', 12832, 289, 'TRIMITRA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(47, 'NX2716', 'NX2716', '51902-BZ080-00', 'NX-2716, HANGER SUB-ASSY, EXHAUST PIPE, NO.2', 'PPL2', 'Outhouse', 13282, 300, 'DCI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(48, 'NX2789', 'NX2789', '53078-BZ090-00', 'NX-2789, EXTENSION SUB-ASSY, FR FENDER APRON, LH', 'PPL2', 'Outhouse', 13282, 300, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(49, 'NX2765', 'NX2765', '52141-BZ060-00', 'NX-2765, ARM, FR BUMPER, RH', 'PPL2', 'Outhouse', 13282, 300, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(50, 'AX2246', 'AX2246', '57157-BZ010-00', 'AX-2246, BRACKET, FLEXIBLE HOSE, FR RH', 'PPL2', 'Outhouse', 13282, 300, 'YOSKA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(51, 'AX2247', 'AX2247', '57158-BZ010-00', 'AX-2247, BRACKET, FLEXIBLE HOSE, FR LH', 'PPL2', 'Outhouse', 13282, 300, 'YOSKA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(52, 'NX2814', 'NX2814', '53725-BZ020-00', 'NX-2814, APRON, FR FENDER NO.2 SIDE, RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(53, 'NX2815', 'NX2815', '53726-BZ020-00', 'NX-2815, APRON, FR FENDER NO.2 SIDE, LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(54, 'AX3057', 'AX3057', '53714-BZ010-00', 'AX-3057, APRON, FR FENDER, RR LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(55, 'AX3056', 'AX3056', '53713-BZ010-00', 'AX-3056, APRON, FR FENDER, RR RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(56, 'NX2808', 'NX2808', '53711-BZ160-00', 'NX-2808, APRON, FR FENDER, FR RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(57, 'NX3529', 'NX3529', '53703-BZ080-00', 'NX-3529, SUPPORT SUB-ASSY BATTERY CARRIER, RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(58, 'NX2818', 'NX2818', '53737-BZ080-00', 'NX-2818, PLATE, FR APRON TO COWL SIDE MEMBER, RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(59, 'NX2819', 'NX2819', '53738-BZ080-00', 'NX-2819, PLATE, FR APRON TO COWL SIDE MEMBER, LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(60, 'TR1495', 'TR1495', '57186-BZ010-00', 'TR-1495, REINFORCE, FR SIDE MBR, RR NO.1 INN RH', 'PPL2', 'Outhouse', 2045, 47, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(61, 'TR1495T', 'TR1495T', '57186-BZ010-00-T', 'TR-1495-T, REINFORCE, FR SIDE MBR, RR NO.1 INN RH', 'PPL2', 'Outhouse', 6134, 139, 'Almindo', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(62, 'TR0418', 'TR0418', '57185-BZ010-00', 'TR-0418, REINFORCE, FR SIDE MBR, RR NO.1 INN RH', 'PPL2', 'Outhouse', 3321, 76, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(63, 'TR0418T', 'TR0418T', '57185-BZ010-00-T', 'TR-0418-T, REINFORCE, FR SIDE MBR, RR NO.1 INN RH', 'PPL2', 'Outhouse', 9962, 225, 'Almindo', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(64, 'NT0295', 'NT0295', '57156-BZ020-00', 'NT-0295, REINFORCEMENT, FR SIDE MEMBER, NO.3 LH', 'PPL2', 'Outhouse', 12832, 289, 'STEP', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(65, 'NX0427', 'NX0427', '57153-BZ020-00', 'NX-0427, REINFORCEMENT, FR SIDE MEMBER, NO.2 RH', 'PPL2', 'Outhouse', 13282, 300, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(66, 'NX0428', 'NX0428', '57154-BZ070-00', 'NX-0428, REINFORCEMENT, FR SIDE MEMBER, NO.2 LH', 'PPL2', 'Outhouse', 13282, 300, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(67, 'AX2013', 'AX2013', '57196-BZ030-00', 'AX-2013, REINFORCEMENT, FR SIDE MEMBER, FR LH', 'PPL2', 'Outhouse', 13282, 300, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(68, 'AX2100', 'AX2100', '57148-BZ010-00', 'AX-2100, PLATE, FR SIDE MEMBER, RR LH', 'PPL2', 'Outhouse', 13282, 300, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(69, 'AX2099', 'AX2099', '57147-BZ010-00', 'AX-2099, PLATE, FR SIDE MEMBER, RR RH', 'PPL2', 'Outhouse', 13282, 300, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(70, 'NX0229', 'NX0229', '51502-BZ070-00', 'NX-0229, REINFORCEMENT SUB-ASSY, FR SUSP MBR, LH', 'PPL2', 'Outhouse', 13282, 300, 'DHARMA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(71, 'NX0228', 'NX0228', '51501-BZ060-00', 'NX-0228, REINFORCEMENT SUB-ASSY, FR SUSP MBR, RH', 'PPL2', 'Outhouse', 13282, 300, 'DHARMA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(72, 'AX2012', 'AX2012', '57195-BZ050-00', 'AX-2012, REINFORCEMENT, FR SIDE MEMBER, FR RH', 'PPL2', 'Outhouse', 13282, 300, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(73, 'AX2103', 'AX2103', '57219-BZ010-00', 'AX-2103, GUSSET, FR SIDE MEMBER, RR RH', 'PPL2', 'Outhouse', 26564, 598, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(74, 'NX2717', 'NX2717', '51960-BZ140-00', 'NX-2717, HOOK ASSY, FR', 'PPL2', 'Outhouse', 450, 11, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]-PL4[T1]-PL4[A1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(75, 'NT0118', 'NT0118', '51960-BZ230-00', 'NT-0118, HOOK ASSY, FR', 'PPL2', 'Outhouse', 12832, 289, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]-PL4[T1]-PL4[A1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(76, 'NT0195', 'NT0195', '53723-BZ100-00', 'NT-0195, REINFORCEMENT, FR SPRING SUPPORT, RH', 'PPL2', 'Outhouse', 12832, 289, 'TRIMITRA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(77, 'NT0196', 'NT0196', '53724-BZ050-00', 'NT-0196, REINFORCEMENT, FR SPRING SUPPORT, LH', 'PPL2', 'Outhouse', 12832, 289, 'TRIMITRA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(78, 'NT0300', 'NT0300', '57307-BZ010-00', 'NT-0300, OUTRIGGER SUB-ASSY, NO.4 RH', 'PPL2', 'Outhouse', 12832, 289, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(79, 'NT0301', 'NT0301', '57308-BZ010-00', 'NT-0301, OUTRIGGER SUB-ASSY, NO.4 LH', 'PPL2', 'Outhouse', 12832, 289, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(80, 'NT0304', 'NT0304', '57335-BZ040-00', 'NT-0304, OUTRIGGER, NO.2 FR RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(81, 'NT0305', 'NT0305', '57336-BZ040-00', 'NT-0305, OUTRIGGER, NO.2 FR LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(82, 'NX2816', 'NX2816', '53733-BZ070-00', 'NX-2816, MEMBER, FR APRON TO COWL SIDE, OUT FR RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(83, 'NX2817', 'NX2817', '53734-BZ070-00', 'NX-2817, MEMBER, FR APRON TO COWL SIDE, OUT FR LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(84, 'NT0297', 'NT0297', '57186-BZ020-00', 'NT-0297, REINFORCE, FR SIDE MBR, RR NO.1 INN LH', 'PPL2', 'Outhouse', 5103, 116, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(85, 'AX0456', 'AX0456', '51095-BZ010-00', 'AX-0456, HOOK S/A, RR', 'PPL2', 'Outhouse', 450, 11, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(86, 'AX0616', 'AX0616', '51096-BZ010-00', 'AX-0616, HOOK S/A, TRANSPORT, RR LH', 'PPL2', 'Outhouse', 26564, 598, 'STEP', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(87, 'AX0617', 'AX0617', '57688-BZ010-00', 'AX-0617, REINFORCEMENT, RR FLOOR CROSSMEMBER', 'PPL2', 'Outhouse', 13282, 300, 'STEP', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(88, 'AX0618', 'AX0618', '58351-BZ010-00', 'AX-0618, REINFORCEMENT, RR FLOOR PANEL, RH', 'PPL2', 'Outhouse', 13282, 300, 'STEP', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(89, 'NT0329', 'NT0329', '58352-BZ010-00', 'NT-0329, REINFORCEMENT, RR FLOOR PANEL, LH', 'PPL2', 'Outhouse', 12832, 289, 'STEP', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(90, 'NX2699', 'NX2699', '48547-BZ030-00', 'NX-2699, REINFORCEMENT, RR SHOCK ABSR BRACKET, LH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(91, 'AX0583', 'AX0583', '48505-BZ010-00', 'AX-0583, BRACKET SUB-ASSY, RR SHOCK ABSORBER, UPR', 'PPL2', 'Outhouse', 26564, 598, 'SGS', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(92, 'NT0298', 'NT0298', '57305-BZ010-00', 'NT-0298, OUTRIGGER SUB-ASSY, NO.3 RH', 'PPL2', 'Outhouse', 13282, 300, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(93, 'NT0299', 'NT0299', '57306-BZ010-00', 'NT-0299, OUTRIGGER SUB-ASSY, NO.3 LH', 'PPL2', 'Outhouse', 13282, 300, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(94, 'NT0097', 'NT0097', '48547-BZ050-00', 'NT-0097, REINFORCEMENT, RR SHOCK ABSR BRACKET, LH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(95, 'AX3080', 'AX3080', '51593-BZ040-00', 'AX-3080, BRACKET, RR SPRING BUMPER, RH', 'PPL2', 'Outhouse', 26564, 598, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(96, 'NT0096', 'NT0096', '48546-BZ080-00', 'NT-0096, REINFORCEMENT, RR SHOCK ABSR BRACKET, RH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:26'),
(97, 'NX2714', 'NX2714', '51511-BZ070-00', 'NX-2714, GUSSET, UPR CONTROL ARM SUPPORT, RH', 'PPL2', 'Outhouse', 13282, 300, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(98, 'NX2715', 'NX2715', '51512-BZ030-00', 'NX-2715, GUSSET, UPR CONTROL ARM SUPPORT, LH', 'PPL2', 'Outhouse', 13282, 300, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(99, 'NT0116', 'NT0116', '51906-BZ040-00', 'NT-0116, HANGER SUB-ASSY, EXHAUST PIPE, NO.6', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(100, 'AX2112', 'AX2112', '57641-BZ010-00', 'AX-2112, REINFORCEMENT, RR FLOOR SIDE MEMBER, INS', 'PPL2', 'Outhouse', 26564, 598, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(101, 'NX2951', 'NX2951', '57672-BZ040-00', 'NX-2951, MEMBER, RR FLOOR CROSS, NO.1 LH', 'PPL2', 'Outhouse', 13282, 300, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(102, 'AX2084', 'AX2084', '48546-BZ010-00', 'AX-2084, REINFORCEMENT, RR SHOCK ABSR BRACKET, RH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(103, 'NX2950', 'NX2950', '57671-BZ050-00', 'NX-2950, MEMBER, RR FLOOR CROSS, NO.1 RH', 'PPL2', 'Outhouse', 13282, 300, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(104, 'NX2713', 'NX2713', '51506-BZ020-00', 'NX-2713, SUPPORT SUB-ASSY, UPR CONTROL ARM, LH', 'PPL2', 'Outhouse', 13282, 300, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(105, 'NX2712', 'NX2712', '51505-BZ020-00', 'NX-2712, SUPPORT SUB-ASSY, UPR CONTROL ARM, RH', 'PPL2', 'Outhouse', 13282, 300, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(106, 'NT0303', 'NT0303', '57316-BZ160-00', 'NT-0303, OUTRIGGER, NO.3 LH', 'PPL2', 'Outhouse', 13282, 300, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(107, 'NT0302', 'NT0302', '57315-BZ170-00', 'NT-0302, OUTRIGGER, NO.3 RH', 'PPL2', 'Outhouse', 13282, 300, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(108, 'NX4072', 'NX4072', '57771-BZ030-00', 'NX-4072, PLATE, RR SPRING, RH', 'PPL2', 'Outhouse', 1036, 24, 'TOSAMA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(109, 'NT0316', 'NT0316', '57625-BZ040-00', 'NT-0316, REINFORCE, RR FLOOR SIDE MEMBER, RR NO.2', 'PPL2', 'Outhouse', 25664, 578, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(110, 'AX0150', 'AX0150', '51994-BZ010-00', 'AX-0150, HANGER, EXHAUST PIPE, NO.4', 'PPL2', 'Outhouse', 450, 11, 'DCI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(111, 'NX2820', 'NX2820', '53751-BZ140-00', 'NX-2820, BRACKET, CHARCOAL CANISTER MOUNTING', 'PPL2', 'Outhouse', 8029, 181, 'STEP', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(112, 'NX2821', 'NX2821', '53751-BZ150-00', 'NX-2821, BRACKET, CHARCOAL CANISTER MOUNTING', 'PPL2', 'Outhouse', 5253, 119, 'STEP', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(113, 'NX0340', 'NX0340', '55116-BZ020-00', 'NX-0340, PLATE, BRAKE PEDAL SUPPORT MOUNTING', 'PPL2', 'Outhouse', 300, 8, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(114, 'NX0341', 'NX0341', '55116-BZ030-00', 'NX-0341, PLATE, BRAKE PEDAL SUPPORT MOUNTING', 'PPL2', 'Outhouse', 4892, 111, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(115, 'NX2834', 'NX2834', '55132-BZ060-00', 'NX-2834, REINFORCEMENT, DASH PANEL, LH', 'PPL2', 'Outhouse', 5253, 119, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(116, 'NX0343', 'NX0343', '55185-BZ090-00', 'NX-0343, BRACE, DASH PANEL TO COWL', 'PPL2', 'Outhouse', 13282, 300, 'DHARMA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(117, 'NT0215', 'NT0215', '55133-BZ040-00', 'NT-0215, REINFORCEMENT, DASH TO FLOOR, RH', 'PPL2', 'Outhouse', 12832, 289, 'YOSKA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(118, 'NT0216', 'NT0216', '55134-BZ030-00', 'NT-0216, REINFORCEMENT, DASH TO FLOOR, LH', 'PPL2', 'Outhouse', 12832, 289, 'YOSKA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(119, 'NX2003', 'NX2003', '55132-BZ020-00', 'NX-2003, REINFORCEMENT, DASH PANEL, NO.2', 'PPL2', 'Outhouse', 8029, 181, 'ASALTA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(120, 'NX0524', 'NX0524', '61617-BZ080-00', 'NX-0524, PANEL, QUARTER, INNER LWR RH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(121, 'NX0525', 'NX0525', '61618-BZ040-00', 'NX-0525, PANEL, QUARTER, INNER LWR LH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(122, 'NX0522', 'NX0522', '61614-BZ240-00', 'NX-0522, PANEL, QUARTER, INNER LH', 'PPL2', 'Outhouse', 0, 0, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(123, 'NX0520', 'NX0520', '61613-BZ220-00', 'NX-0520, PANEL, QUARTER, INNER RH', 'PPL2', 'Outhouse', 0, 0, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(124, 'NX0456', 'NX0456', '58307-BZ130-00', 'NX-0456, PANEL SUB-ASSY, BODY LWR BACK, OUTER', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(125, 'NX0521', 'NX0521', '61613-BZ230-00', 'NX-0521, PANEL, QUARTER, INNER RH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(126, 'NX0523', 'NX0523', '61614-BZ250-00', 'NX-0523, PANEL, QUARTER, INNER LH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(127, 'NX0459', 'NX0459', '58375-BZ090-00', 'NX-0459, REINFORCEMENT, BODY LWR BACK PANEL, RH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(128, 'NX0460', 'NX0460', '58376-BZ070-00', 'NX-0460, REINFORCEMENT, BODY LWR BACK PANEL, LH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(129, 'NT0330', 'NT0330', '58372-BZ220-00', 'NT-0330, PANEL, BODY LWR BACK, INNER', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(130, 'NT0328', 'NT0328', '58307-BZ220-00', 'NT-0328, PANEL SUB-ASSY, BODY LWR BACK', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(131, 'NT0331', 'NT0331', '58377-BZ050-00', 'NT-0331, PANEL, BODY LWR BACK, OUTER NO.2', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(132, 'NT0399', 'NT0399', '61622-BZ110-00', 'NT-0399, EXTENSION, QUARTER PANEL, LWR LH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(133, 'NT0398', 'NT0398', '61621-BZ160-00', 'NT-0398, EXTENSION, QUARTER PANEL, LWR RH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(134, 'NT0397', 'NT0397', '61614-BZ290-00', 'NT-0397, PANEL, QUARTER, INNER LH', 'PPL2', 'Outhouse', 12832, 289, 'FTI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(135, 'NT0396', 'NT0396', '61613-BZ290-00', 'NT-0396, PANEL, QUARTER, INNER RH', 'PPL2', 'Outhouse', 12832, 289, 'FTI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(136, 'AX3065', 'AX3065', '57182-BZ011-00', 'AX-3065, REINFORCEMENT, FR SIDE MBR, RR NO.1 LH', 'PPL2', 'Outhouse', 150, 4, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(137, 'NX2933', 'NX2933', '57302-BZ110-00', 'NX-2933, REINF SUB-ASSY, STRG GEAR BOX SUPT MBR', 'PPL2', 'Outhouse', 4210, 96, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(138, 'NX3980', 'NX3980', '57146-BZ021-00', 'NX-3980, REINFORCEMENT, FR SIDE MEMBER, RR LH', 'PPL2', 'Outhouse', 450, 11, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(139, 'NX3979', 'NX3979', '57145-BZ031-00', 'NX-3979, REINFORCEMENT, FR SIDE MEMBER, RR RH', 'PPL2', 'Outhouse', 450, 11, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(140, 'NX2813', 'NX2813', '53722-BZ080-00', 'NX-2813, SUPPORT, FR SPRING, LH', 'PPL2', 'Outhouse', 450, 11, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(141, 'NX2812', 'NX2812', '53721-BZ080-00', 'NX-2812, SUPPORT, FR SPRING, RH', 'PPL2', 'Outhouse', 450, 11, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(142, 'NX3978', 'NX3978', '57132-BZ131-00', 'NX-3978, MEMBER, FR SIDE, RR LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(143, 'NX3977', 'NX3977', '57131-BZ021-00', 'NX-3977, MEMBER, FR SIDE, RR RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(144, 'NX2931', 'NX2931', '57301-BZ090-00', 'NX-2931, OUTRIGGER SUB-ASSY, NO.1 RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(145, 'NX1376', 'NX1376', '57114-BZ030-00', 'NX-1376, MEMBER, FR SIDE, OUTER LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(146, 'NX1375', 'NX1375', '57113-BZ020-00', 'NX-1375, MEMBER, FR SIDE, OUTER RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(147, 'AX3063', 'AX3063', '57181-BZ010-00', 'AX-3063, REINFORCEMENT, FR SIDE MBR, RR NO.1 RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(148, 'NX2810', 'NX2810', '53717-BZ100-00', 'NX-2810, APRON, FR FENDER, NO.2 RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(149, 'NX3974', 'NX3974', '53718-BZ101-00', 'NX-3974, APRON, FR FENDER, NO.2 LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(150, 'AX3112', 'AX3112', '57168-BZ110-00', 'AX-3112, MEMBER, FR FLOOR, LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(151, 'AX2921', 'AX2921', '57167-BZ011-00', 'AX-2921, MEMBER, FR FLOOR, RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(152, 'NX3975', 'NX3975', '57111-BZ211-00', 'NX-3975, MEMBER, FR SIDE, RH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(153, 'NX3976', 'NX3976', '57112-BZ231-00', 'NX-3976, MEMBER, FR SIDE, LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(154, 'NT0294', 'NT0294', '57146-BZ090-00', 'NT-0294, REINFORCEMENT, FR SIDE MEMBER, RR LH', 'PPL2', 'Outhouse', 12832, 289, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(155, 'NT0293', 'NT0293', '57145-BZ090-00', 'NT-0293, REINFORCEMENT, FR SIDE MEMBER, RR RH', 'PPL2', 'Outhouse', 12832, 289, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(156, 'NT0193', 'NT0193', '53721-BZ090-00', 'NT-0193, SUPPORT, FR SPRING, RH', 'PPL2', 'Outhouse', 12832, 289, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(157, 'NT0194', 'NT0194', '53722-BZ090-00', 'NT-0194, SUPPORT, FR SPRING, LH', 'PPL2', 'Outhouse', 12832, 289, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(158, 'NX2932', 'NX2932', '57302-BZ090-00', 'NX-2932, OUTRIGGER SUB-ASSY, NO.1 LH', 'PPL2', 'Outhouse', 9072, 205, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(159, 'AX3064', 'AX3064', '57182-BZ010-00', 'AX-3064, REINFORCEMENT, FR SIDE MBR, RR NO.1 LH', 'PPL2', 'Outhouse', 8029, 181, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(160, 'NX2809', 'NX2809', '53712-BZ170-00', 'NX-2809, APRON, FR FENDER, LH', 'PPL2', 'Outhouse', 13282, 300, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(161, 'NT0296', 'NT0296', '57182-BZ050-00', 'NT-0296, REINFORCEMENT, FR SIDE MBR, RR NO.1 LH', 'PPL2', 'Outhouse', 5103, 116, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(162, 'AX2214', 'AX2214', '57635-BZ051-00', 'AX-2214, REINFORCEMENT, RR FLOOR SIDE MBR, RR RH', 'PPL2', 'Outhouse', 3858, 87, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(163, 'AX2216', 'AX2216', '57636-BZ051-00', 'AX-2216, REINFORCEMENT, RR FLOOR SIDE MBR, RR LH', 'PPL2', 'Outhouse', 3858, 87, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(164, 'AX3067', 'AX3067', '57611-BZ011-00', 'AX-3067, MEMBER, RR FLOOR SIDE, FR RH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(165, 'NX2949', 'NX2949', '57612-BZ200-00', 'NX-2949, MEMBER, RR FLOOR SIDE, FR LH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(166, 'NX2707', 'NX2707', '51055-BZ030-00', 'NX-2707, SUPPORT SUB-ASSY, LWR CONTROL ARM, RH', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(167, 'NX2708', 'NX2708', '51056-BZ030-00', 'NX-2708, SUPPORT SUB-ASSY, LWR CONTROL ARM, LH', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(168, 'AX2251', 'AX2251', '57615-BZ010-00', 'AX-2251, MEMBER, RR FLOOR SIDE, RR RH', 'PPL2', 'Outhouse', 900, 21, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(169, 'NX3007', 'NX3007', '61607-BZ060-00', 'NX-3007, GUSSET SUB-ASSY, QUARTER WHEEL HOUSE, RH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(170, 'NX3008', 'NX3008', '61608-BZ060-00', 'NX-3008, GUSSET SUB-ASSY, QUARTER WHEEL HOUSE, LH', 'PPL2', 'Outhouse', 450, 11, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(171, 'NT0315', 'NT0315', '57615-BZ150-00', 'NT-0315, MEMBER, RR FLOOR SIDE, RR RH', 'PPL2', 'Outhouse', 25664, 578, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(172, 'NT0314', 'NT0314', '57612-BZ260-00', 'NT-0314, MEMBER, RR FLOOR SIDE, FR LH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(173, 'NT0313', 'NT0313', '57611-BZ240-00', 'NT-0313, MEMBER, RR FLOOR SIDE, FR RH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(174, 'AX3121', 'AX3121', '57646-BZ040-00', 'AX-3121, REINFORCEMENT, RR SIDE MEMBER, LH', 'PPL2', 'Outhouse', 13282, 300, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(175, 'AX3120', 'AX3120', '57645-BZ090-00', 'AX-3120, REINFORCEMENT, RR SIDE MEMBER, RH', 'PPL2', 'Outhouse', 13282, 300, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(176, 'NT0106', 'NT0106', '51055-BZ040-00', 'NT-0106, SUPPORT SUB-ASSY, LWR CONTROL ARM, RH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(177, 'NT0107', 'NT0107', '51056-BZ040-00', 'NT-0107, SUPPORT SUB-ASSY, LWR CONTROL ARM, LH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(178, 'AX2213', 'AX2213', '57635-BZ011-00', 'AX-2213, REINFORCEMENT, RR FLOOR SIDE MBR, RR RH', 'PPL2', 'Outhouse', 9408, 212, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(179, 'AX2215', 'AX2215', '57636-BZ011-00', 'AX-2215, REINFORCEMENT, RR FLOOR SIDE MBR, RR LH', 'PPL2', 'Outhouse', 9408, 212, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(180, 'NT0394', 'NT0394', '61607-BZ120-00', 'NT-0394, GUSSET SUB-ASSY, QUARTER WHEEL HOUSE, RH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(181, 'NT0395', 'NT0395', '61608-BZ120-00', 'NT-0395, GUSSET SUB-ASSY, QUARTER WHEEL HOUSE, LH', 'PPL2', 'Outhouse', 12832, 289, 'ASI', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(182, 'AX2261', 'AX2261', '57751-BZ010-00', 'AX-2261, SUPPORT, RR SUSPENSION SPRING, OUTER RH', 'PPL2', 'Outhouse', 13396, 302, 'MAJ-TAMBUN', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(183, 'NX2833', 'NX2833', '55131-BZ140-00', 'NX-2833, REINFORCEMENT, DASH PANEL', 'PPL2', 'Outhouse', 13282, 300, 'DHARMA', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(184, 'NX2791', 'NX2791', '53203-BZ170-00', 'NX-2791, SUPPORT SUB-ASSY, RADIATOR, LH', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(185, 'NX4236', 'NX4236', '53202-BZ101-00', 'NX-4236, SUPPORT SUB-ASSY, RADIATOR, RH', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(186, 'NX4838', 'NX4838', '53205-BZ180-00', 'NX-4838, SUPPORT SUB-ASSY, RADIATOR, UPR', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(187, 'NX2718', 'NX2718', '52021-BZ220-00', 'NX-2718, REINFORCEMENT SUB-ASSY, FR BUMPER', 'PPL2', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(188, 'NT0178', 'NT0178', '53203-BZ190-00', 'NT-0178, SUPPORT SUB-ASSY, RADIATOR, LH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(189, 'NT0121', 'NT0121', '52021-BZ190-00', 'NT-0121, REINFORCEMENT SUB-ASSY, FR BUMPER', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(190, 'NT2067', 'NT2067', '53202-BZ111-00', 'NT-2067, SUPPORT SUB-ASSY, RADIATOR, RH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PL4[W1]', 'Aji Wibowo', '2022-03-15 14:45:27'),
(191, 'NX3605', 'NX3605', '67361-BZ030-00', 'NX-3605, RETAINER, BACK DOOR HINGE', 'D26A', 'Outhouse', 39616, 892, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(192, 'BX0942', 'BX0942', '67175-BZ170-00', 'BX-0942, REINFORCEMENT, BACK DOOR HINGE, RH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(193, 'BX0945', 'BX0945', '67176-BZ150-00', 'BX-0945, REINFORCEMENT, BACK DOOR HINGE, LH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(194, 'BX0946', 'BX0946', '67169-BZ020-00', 'BX-0946, EXTENSION, BACK DOOR, INNER LH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(195, 'BX0947', 'BX0947', '67159-BZ010-00', 'BX-0947, EXTENSION, BACK DOOR, INNER RH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(196, 'BX0950', 'BX0950', '67391-BZ200-00', 'BX-0950, REINFORCEMENT, BACK DOOR LOCK', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(197, 'BX0951', 'BX0951', '67189-BZ110-00', 'BX-0951, REINFORCEMENT, BACK DOOR STAY, LH', 'D26A', 'Outhouse', 6526, 147, 'YOSKA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(198, 'BX0952', 'BX0952', '67188-BZ120-00', 'BX-0952, REINFORCEMENT, BACK DOOR STAY, RH', 'D26A', 'Outhouse', 6526, 147, 'YOSKA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(199, 'BX0940', 'BX0940', '68801-BZ160-00', 'BX-0940, HINGE SUB-ASSY, BACK DOOR', 'D26A', 'Outhouse', 13052, 294, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(200, 'A4001', 'A4001', '53311-BZ310-00', 'A-4001, PANEL, HOOD', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(201, 'A4002', 'A4002', '53321-BZ300-00', 'A-4002, PANEL, HOOD, INNER', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(202, 'BX0941', 'BX0941', '53307-BZ320-00', 'BX-0941, HOOK SUB-ASSY, HOOD LOCK', 'PPL1', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(203, 'RC1375', 'RC1375', '53331-BZ170-00', 'RC-1375, PLATE, HOOD HINGE MOUNTING', 'D26A', 'Outhouse', 13052, 294, 'YOSKA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(204, 'BX0026', 'BX0026', '53401-BZ090-00', 'BX-0026, HINGE SUB-ASSY, HOOD, RH', 'D26A', 'Outhouse', 6526, 147, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(205, 'BX0057', 'BX0057', '53402-BZ090-00', 'BX-0057, HINGE SUB-ASSY, HOOD, LH', 'D26A', 'Outhouse', 6526, 147, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(206, 'A4036', 'A4036', '67142-BZ290-00', 'A-4036, PANEL, FR DOOR, INSIDE LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(207, 'BX0929', 'BX0929', '67332-BZ120-00', 'BX-0929, REINFORCE, FR DOOR CHECK, LH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(208, 'BX0924', 'BX0924', '67444-BZ150-00', 'BX-0924, PLATE, FR DOOR WINDOW OPENING, LH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(209, 'BX0936', 'BX0936', '67336-BZ190-00', 'BX-0936, REINFORCEMENT, FR DOOR LOCK, LH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(210, 'A4014', 'A4014', '67112-BZ410-00', 'A-4014, PANEL, FR DOOR, OUTSIDE LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(211, 'A4016', 'A4016', '67114-BZ420-00', 'A-4016, PANEL, RR DOOR, OUTSIDE LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(212, 'A4030', 'A4030', '67132-BZ130-00', 'A-4030, EXTENSION, FR DOOR OUTS PNL REINF, FR LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(213, 'A4024', 'A4024', '67124-BZ170-00', 'A-4024, REINFORCEMENT, FR DOOR, NO.2 LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(214, 'BX0937', 'BX0937', '67122-BZ180-00', 'BX-0937, REINFORCEMENT, FR DOOR OUTSIDE PANEL, LH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(215, 'BX0920', 'BX0920', '67302-BZ190-00', 'BX-0920, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, LH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(216, 'A4035', 'A4035', '67141-BZ300-00', 'A-4035, PANEL, FR DOOR, INSIDE RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(217, 'BX0935', 'BX0935', '67443-BZ170-00', 'BX-0935, PLATE, FR DOOR WINDOW OPENING, RH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(218, 'BX0925', 'BX0925', '67331-BZ130-00', 'BX-0925, REINFORCE, FR DOOR CHECK, RH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(219, 'BX0930', 'BX0930', '67335-BZ200-00', 'BX-0930, REINFORCEMENT, FR DOOR LOCK, RH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(220, 'A4013', 'A4013', '67111-BZ410-00', 'A-4013, PANEL, FR DOOR, OUTSIDE RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(221, 'A4015', 'A4015', '67113-BZ420-00', 'A-4015, PANEL, RR DOOR, OUTSIDE RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(222, 'A4029', 'A4029', '67131-BZ130-00', 'A-4029, EXTENSION, FR DOOR OUTS PNL REINF, FR RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(223, 'A4023', 'A4023', '67123-BZ190-00', 'A-4023, REINFORCEMENT, FR DOOR, NO.2 RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(224, 'BX0932', 'BX0932', '67121-BZ190-00', 'BX-0932, REINFORCEMENT, FR DOOR OUTSIDE PANEL, RH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(225, 'BX0921', 'BX0921', '67301-BZ210-00', 'BX-0921, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, RH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(226, 'A4038', 'A4038', '67144-BZ340-00', 'A-4038, PANEL, RR DOOR, INSIDE LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(227, 'BX0949', 'BX0949', '67334-BZ130-00', 'BX-0949, REINFORCEMENT, RR DOOR CHECK, LH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(228, 'BX0931', 'BX0931', '67338-BZ100-00', 'BX-0931, REINFORCEMENT, RR DOOR LOCK, LH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(229, 'BX0934', 'BX0934', '67359-BZ130-00', 'BX-0934, REINFORCEMENT, RR DOOR UPR FRAME, LH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(230, 'BX0928', 'BX0928', '67446-BZ120-00', 'BX-0928, PLATE, RR DOOR FR FRAME TO INS PNL, LH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(231, 'A4028', 'A4028', '67128-BZ150-00', 'A-4028, REINFORCEMENT, RR DOOR, NO.2 LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(232, 'A4044', 'A4044', '67158-BZ010-00', 'A-4044, EXTENSION, RR DOOR, INNER LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(233, 'A4026', 'A4026', '67126-BZ180-00', 'A-4026, REINFORCEMENT, RR DOOR OUTSIDE PANEL, LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(234, 'A4034', 'A4034', '67136-BZ090-00', 'A-4034, EXTENSION, RR DOOR OUTSIDE REINFORCE, LH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(235, 'BX0943', 'BX0943', '69224-BZ030-00', 'BX-0943, PLATE, RR DOOR OUTSIDE HANDLE BASE, LH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(236, 'BX0933', 'BX0933', '67318-BZ110-00', 'BX-0933, REINFORCEMENT, RR DOOR SIDE, LH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(237, 'BX0922', 'BX0922', '67304-BZ200-00', 'BX-0922, BEAM SUB-ASSY, RR DOOR PROTECTION, LH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(238, 'A4037', 'A4037', '67143-BZ340-00', 'A-4037, PANEL, RR DOOR, INSIDE RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(239, 'BX0944', 'BX0944', '67333-BZ140-00', 'BX-0944, REINFORCEMENT, RR DOOR CHECK, RH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(240, 'BX0926', 'BX0926', '67337-BZ100-00', 'BX-0926, REINFORCEMENT, RR DOOR LOCK, RH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(241, 'BX0939', 'BX0939', '67349-BZ130-00', 'BX-0939, REINFORCEMENT, RR DOOR UPR FRAME, RH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(242, 'BX0927', 'BX0927', '67445-BZ120-00', 'BX-0927, PLATE, RR DOOR FR FRAME TO INS PNL, RH', 'D26A', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(243, 'A4027', 'A4027', '67127-BZ160-00', 'A-4027, REINFORCEMENT, RR DOOR, NO.2 RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(244, 'A4043', 'A4043', '67157-BZ010-00', 'A-4043, EXTENSION, RR DOOR, INNER RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(245, 'A4025', 'A4025', '67125-BZ180-00', 'A-4025, REINFORCEMENT, RR DOOR OUTSIDE PANEL, RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(246, 'A4033', 'A4033', '67135-BZ110-00', 'A-4033, EXTENSION, RR DOOR OUTSIDE REINFORCE, RH', 'PPL1', 'Outhouse', 6526, 147, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(247, 'BX0948', 'BX0948', '69223-BZ030-00', 'BX-0948, PLATE, RR DOOR OUTSIDE HANDLE BASE, RH', 'D26A', 'Outhouse', 6526, 147, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(248, 'BX0923', 'BX0923', '67303-BZ200-00', 'BX-0923, BEAM SUB-ASSY, RR DOOR PROTECTION, RH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(249, 'BX0938', 'BX0938', '67317-BZ150-00', 'BX-0938, REINFORCEMENT, RR DOOR SIDE, RH', 'PPL1', 'Outhouse', 6526, 147, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(250, 'NT2151', 'NT2151', '67181-BZ160-00', 'NT-2151, RETAINER, DOOR HINGE', 'D26A', 'Outhouse', 102656, 2311, 'YOSKA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(251, 'NT2163', 'NT2163', '67334-BZ100-00', 'NT-2163, REINFORCEMENT, RR DOOR CHECK, LH', 'PPL2', 'Outhouse', 12832, 289, 'ASALTA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(252, 'NT2162', 'NT2162', '67333-BZ110-00', 'NT-2162, REINFORCEMENT, RR DOOR CHECK, RH', 'PPL2', 'Outhouse', 12832, 289, 'ASALTA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(253, 'NX3607', 'NX3607', '68801-BZ140-00', 'NX-3607, HINGE SUB-ASSY, BACK DOOR', 'PPL2', 'Outhouse', 26564, 598, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(254, 'NT2165', 'NT2165', '67336-BZ170-00', 'NT-2165, REINFORCEMENT, FR DOOR LOCK, LH', 'PPL1', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(255, 'NT2142', 'NT2142', '53331-BZ180-00', 'NT-2142, PLATE, HOOD HINGE MOUNTING', 'PPL2', 'Outhouse', 25664, 578, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(256, 'T4020', 'T4020', '67128-BZ130-00', 'T-4020, REINFORCEMENT, RR DOOR, NO.2 LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(257, 'T4026', 'T4026', '67318-BZ100-00', 'T-4026, REINFORCEMENT, RR DOOR SIDE, LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(258, 'T4008', 'T4008', '67122-BZ160-00', 'T-4008, REINFORCEMENT, FR DOOR OUTSIDE PANEL, LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(259, 'T4010', 'T4010', '67134-BZ090-00', 'T-4010, EXTENSION, FR DOOR OUTS PNL REINF, RR LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(260, 'T4007', 'T4007', '67121-BZ180-00', 'T-4007, REINFORCEMENT, FR DOOR OUTSIDE PANEL, RH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(261, 'T4009', 'T4009', '67133-BZ080-00', 'T-4009, EXTENSION, FR DOOR OUTSIDE PNL REINF, RR', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(262, 'T4018', 'T4018', '67126-BZ160-00', 'T-4018, REINFORCEMENT, RR DOOR OUTSIDE PANEL, LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(263, 'T4025', 'T4025', '67317-BZ140-00', 'T-4025, REINFORCEMENT, RR DOOR SIDE, RH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27');
INSERT INTO `tbl_master_part_ppl` (`id`, `job_no`, `job_master`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `prod_shift`, `vendor`, `model`, `part_category`, `routing`, `create_by`, `create_date`) VALUES
(264, 'T4017', 'T4017', '67125-BZ170-00', 'T-4017, REINFORCEMENT, RR DOOR OUTSIDE PANEL, RH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(265, 'NT2164', 'NT2164', '67335-BZ180-00', 'NT-2164, REINFORCEMENT, FR DOOR LOCK, RH', 'PPL1', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(266, 'NT2145', 'NT2145', '67123-BZ180-00', 'NT-2145, BRACKET, FR DOOR OUTSIDE PANEL, RH', 'PPL1', 'Outhouse', 12832, 289, 'YOSKA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(267, 'NT2146', 'NT2146', '67124-BZ150-00', 'NT-2146, BRACKET, FR DOOR OUTSIDE PANEL, LH', 'PPL1', 'Outhouse', 12832, 289, 'YOSKA', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(268, 'T4019', 'T4019', '67127-BZ140-00', 'T-4019, REINFORCEMENT, RR DOOR, NO.2 RH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(269, 'NT2166', 'NT2166', '67391-BZ180-00', 'NT-2166, REINFORCEMENT, BACK DOOR LOCK', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(270, 'NT2174', 'NT2174', '53307-BZ260-00', 'NT-2174, HOOK SUB-ASSY, HOOD LOCK', 'PPL1', 'Outhouse', 12832, 289, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(271, 'SC0856', 'SC0856', '67359-BZ070-00', 'SC-0856, REINFORCEMENT, RR DOOR UPR FRAME, LH', 'PPL2', 'Outhouse', 12832, 289, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(272, 'SC0855', 'SC0855', '67349-BZ070-00', 'SC-0855, REINFORCEMENT, RR DOOR UPR FRAME, RH', 'PPL2', 'Outhouse', 12832, 289, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(273, 'NT2169', 'NT2169', '67443-BZ130-00', 'NT-2169, PLATE, FR DOOR WINDOW OPENING, RH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(274, 'NT2172', 'NT2172', '67446-BZ090-00', 'NT-2172, PLATE, RR DOOR FR FRAME TO INS PNL, LH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(275, 'NT2171', 'NT2171', '67445-BZ090-00', 'NT-2171, PLATE, RR DOOR FR FRAME TO INS PNL, RH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(276, 'NT2160', 'NT2160', '67304-BZ141-00', 'NT-2160, BEAM SUB-ASSY, RR DOOR PROTECTION, LH', 'PPL1', 'Outhouse', 10908, 246, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(277, 'NT2156', 'NT2156', '67302-BZ151-00', 'NT-2156, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, LH', 'PPL1', 'Outhouse', 10908, 246, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(278, 'NT2148', 'NT2148', '67152-BZ140-00', 'NT-2148, REINFORCEMENT, FR DOOR INSIDE PANEL, LH', 'PPL1', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(279, 'NT2157', 'NT2157', '67302-BZ160-00', 'NT-2157, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, LH', 'PPL1', 'Outhouse', 1924, 44, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(280, 'T4012', 'T4012', '67142-BZ270-00', 'T-4012, PANEL, FR DOOR, INSIDE LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(281, 'T4006', 'T4006', '67112-BZ390-00', 'T-4006, PANEL, FR DOOR, OUTSIDE LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(282, 'NT2154', 'NT2154', '67301-BZ171-00', 'NT-2154, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, RH', 'PPL1', 'Outhouse', 10908, 246, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(283, 'NT2147', 'NT2147', '67151-BZ140-00', 'NT-2147, REINFORCEMENT, FR DOOR INSIDE PANEL, RH', 'PPL1', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(284, 'NT2155', 'NT2155', '67301-BZ180-00', 'NT-2155, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, RH', 'PPL1', 'Outhouse', 1924, 44, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(285, 'T4011', 'T4011', '67141-BZ280-00', 'T-4011, PANEL, FR DOOR, INSIDE RH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(286, 'T4005', 'T4005', '67111-BZ390-00', 'T-4005, PANEL, FR DOOR, OUTSIDE RH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(287, 'NT2161', 'NT2161', '67304-BZ150-00', 'NT-2161, BEAM SUB-ASSY, RR DOOR PROTECTION, LH', 'PPL1', 'Outhouse', 1924, 44, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(288, 'T4028', 'T4028', '67144-BZ320-00', 'T-4028, PANEL, RR DOOR, INSIDE LH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(289, 'NT2158', 'NT2158', '67303-BZ151-00', 'NT-2158, BEAM SUB-ASSY, RR DOOR PROTECTION, RH', 'PPL1', 'Outhouse', 10908, 246, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(290, 'NT2159', 'NT2159', '67303-BZ160-00', 'NT-2159, BEAM SUB-ASSY, RR DOOR PROTECTION, RH', 'PPL1', 'Outhouse', 1924, 44, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(291, 'T4027', 'T4027', '67143-BZ320-00', 'T-4027, PANEL, RR DOOR, INSIDE RH', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(292, 'T4031', 'T4031', '67149-BZ540-00', 'T-4031, PANEL, BACK DOOR, INSIDE', 'PPL1', 'Outhouse', 12832, 289, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(293, 'NT2149', 'NT2149', '67175-BZ140-00', 'NT-2149, REINFORCEMENT, BACK DOOR HINGE, RH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(294, 'NT2150', 'NT2150', '67176-BZ130-00', 'NT-2150, REINFORCEMENT, BACK DOOR HINGE, LH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(295, 'NT2167', 'NT2167', '67401-BZ120-00', 'NT-2167, FRAME SUB-ASSY, FR DOOR, FR LWR RH', 'PPL2', 'Outhouse', 12832, 289, 'SDI', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(296, 'NT2152', 'NT2152', '67188-BZ100-00', 'NT-2152, REINFORCEMENT, BACK DOOR STAY, RH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(297, 'NT2153', 'NT2153', '67189-BZ090-00', 'NT-2153, REINFORCEMENT, BACK DOOR STAY, LH', 'PPL1', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(298, 'NT2143', 'NT2143', '53410-BZ070-00', 'NT-2143, HINGE ASSY, HOOD, RH', 'PPL2', 'Outhouse', 12832, 289, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(299, 'NT2144', 'NT2144', '53420-BZ070-00', 'NT-2144, HINGE ASSY, HOOD, LH', 'PPL2', 'Outhouse', 12832, 289, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(300, 'NT2170', 'NT2170', '67444-BZ120-00', 'NT-2170, PLATE, FR DOOR WINDOW OPENING, LH', 'PPL2', 'Outhouse', 12832, 289, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(301, 'NT2168', 'NT2168', '67402-BZ130-00', 'NT-2168, FRAME SUB-ASSY, FR DOOR, FR LWR LH', 'PPL2', 'Outhouse', 12832, 289, 'SDI', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(302, 'NX3592', 'NX3592', '67181-87Z06-00', 'NX-3592, RETAINER, DOOR HINGE', 'PPL2', 'Outhouse', 3600, 81, 'YOSKA', 'WELD1', '-', 'SP-PL1-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(303, 'NX3589', 'NX3589', '67159-BZ030-00', 'NX-3589, EXTENSION, BACK DOOR, INNER RH', 'PPL2', 'Outhouse', 900, 21, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(304, 'NX3595', 'NX3595', '67188-BZ050-00', 'NX-3595, REINFORCEMENT, BACK DOOR STAY, RH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(305, 'NX3596', 'NX3596', '67189-BZ040-00', 'NX-3596, REINFORCEMENT, BACK DOOR STAY, LH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(306, 'NX3606', 'NX3606', '67391-BZ100-00', 'NX-3606, REINFORCEMENT, BACK DOOR LOCK', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(307, 'NX3591', 'NX3591', '67176-BZ080-00', 'NX-3591, REINFORCEMENT, BACK DOOR HINGE, LH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(308, 'NX3590', 'NX3590', '67175-BZ090-00', 'NX-3590, REINFORCEMENT, BACK DOOR HINGE, RH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(309, 'J4046', 'J4046', '67149-BZ260-00', 'J-4046, PANEL, BACK DOOR, INSIDE', 'D12R', 'Outhouse', 300, 8, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(310, 'J4047', 'J4047', '67149-BZ270-00', 'J-4047, PANEL, BACK DOOR, INSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(311, 'J4049', 'J4049', '67149-BZ290-00', 'J-4049, PANEL, BACK DOOR, INSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(312, 'J4069', 'J4069', '67115-BZ860-00', 'J-4069, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 200, 5, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(313, 'J4072', 'J4072', '67115-BZA10-00', 'J-4072, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(314, 'NX3577', 'NX3577', '53331-BZ150-00', 'NX-3577, PLATE, HOOD HINGE MOUNTING, RH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(315, 'NX3579', 'NX3579', '53410-BZ060-00', 'NX-3579, HINGE ASSY, HOOD, RH', 'PPL2', 'Outhouse', 450, 11, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(316, 'NX3578', 'NX3578', '53332-BZ060-00', 'NX-3578, PLATE, HOOD HINGE MOUNTING, LH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(317, 'NX3580', 'NX3580', '53420-BZ060-00', 'NX-3580, HINGE ASSY, HOOD, LH', 'PPL2', 'Outhouse', 450, 11, 'NAMICOH (CKR)', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(318, 'NX3572', 'NX3572', '53307-BZ170-00', 'NX-3572, HOOK SUB-ASSY, HOOD LOCK', 'D12R', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(319, 'NX3604', 'NX3604', '67336-BZ080-00', 'NX-3604, REINFORCEMENT, FR DOOR CHECK, LH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(320, 'NX4956', 'NX4956', '67184-BZ070-00', 'NX-4956, PATCH, FR DOOR REINFORCEMENT, LH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(321, 'NX3582', 'NX3582', '67042-BZ020-00', 'NX-3582, FRAME SUB-ASSY, FR DOOR WINDOW, LH', 'D12R', 'Outhouse', 450, 11, 'AISIN', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(322, 'NX3586', 'NX3586', '67052-BZ020-00', 'NX-3586, REINFORCE SUB-ASSY, FR DOOR OUTS PNL, LH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(323, 'NX3588', 'NX3588', '67152-BZ080-00', 'NX-3588, REINFORCEMENT, FR DOOR INSIDE PANEL, LH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(324, 'NX4964', 'NX4964', '67146-BZ100-00', 'NX-4964, PANEL, FR DOOR HINGE SIDE, LH', 'D12R', 'Outhouse', 450, 11, 'FTI', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(325, 'NX4955', 'NX4955', '67183-BZ110-00', 'NX-4955, PATCH, FR DOOR REINFORCEMENT, RH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(326, 'NX3603', 'NX3603', '67335-BZ080-00', 'NX-3603, REINFORCEMENT, FR DOOR CHECK, RH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(327, 'NX3581', 'NX3581', '67041-BZ020-00', 'NX-3581, FRAME SUB-ASSY, FR DOOR WINDOW, RH', 'D12R', 'Outhouse', 450, 11, 'AISIN', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(328, 'NX3585', 'NX3585', '67051-BZ030-00', 'NX-3585, REINFORCE SUB-ASSY, FR DOOR OUTS PNL, RH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(329, 'NX3587', 'NX3587', '67151-BZ080-00', 'NX-3587, REINFORCEMENT, FR DOOR INSIDE PANEL, RH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(330, 'NX4963', 'NX4963', '67145-BZ100-00', 'NX-4963, PANEL, FR DOOR HINGE SIDE, RH', 'D12R', 'Outhouse', 450, 11, 'FTI', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(331, 'NX3602', 'NX3602', '67334-BZ060-00', 'NX-3602, REINFORCEMENT, RR DOOR CHECK, LH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(332, 'J4036', 'J4036', '67144-BZ220-00', 'J-4036, PANEL, RR DOOR, INSIDE LH', 'D12R', 'Outhouse', 450, 11, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(333, 'NX3601', 'NX3601', '67333-BZ070-00', 'NX-3601, REINFORCEMENT, RR DOOR CHECK, RH', 'PPL2', 'Outhouse', 450, 11, 'STEP', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(334, 'J4035', 'J4035', '67143-BZ220-00', 'J-4035, PANEL, RR DOOR, INSIDE RH', 'D12R', 'Outhouse', 450, 11, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(335, 'NX3584', 'NX3584', '67044-BZ060-00', 'NX-3584, FRAME SUB-ASSY, RR DOOR WINDOW, LH', 'D12R', 'Outhouse', 450, 11, 'AISIN', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(336, 'NX4952', 'NX4952', '67302-BZ130-00', 'NX-4952, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, LH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(337, 'NX4954', 'NX4954', '67304-BZ170-00', 'NX-4954, BEAM SUB-ASSY, RR DOOR PROTECTION, LH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(338, 'NX4966', 'NX4966', '67148-BZ110-00', 'NX-4966, PANEL, RR DOOR HINGE SIDE, LH', 'D12R', 'Outhouse', 450, 11, 'FTI', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(339, 'NX3583', 'NX3583', '67043-BZ060-00', 'NX-3583, FRAME SUB-ASSY, RR DOOR WINDOW, RH', 'D12R', 'Outhouse', 450, 11, 'AISIN', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(340, 'NX4951', 'NX4951', '67301-BZ140-00', 'NX-4951, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, RH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(341, 'NX4953', 'NX4953', '67303-BZ170-00', 'NX-4953, BEAM SUB-ASSY, RR DOOR PROTECTION, RH', 'D12R', 'Outhouse', 450, 11, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(342, 'NX4965', 'NX4965', '67147-BZ110-00', 'NX-4965, PANEL, RR DOOR HINGE SIDE, RH', 'D12R', 'Outhouse', 450, 11, 'FTI', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(343, 'J4050', 'J4050', '67149-BZ300-00', 'J-4050, PANEL, BACK DOOR, INSIDE', 'D12R', 'Outhouse', 150, 4, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(344, 'J4064', 'J4064', '67115-BZA70-00', 'J-4064, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 100, 3, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(345, 'J4065', 'J4065', '67115-BZA80-00', 'J-4065, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(346, 'J4066', 'J4066', '67115-BZA90-00', 'J-4066, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 150, 4, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(347, 'J4067', 'J4067', '67115-BZB00-00', 'J-4067, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(348, 'J4068', 'J4068', '67115-BZB10-00', 'J-4068, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(349, 'J4070', 'J4070', '67115-BZ880-00', 'J-4070, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(350, 'J4071', 'J4071', '67115-BZA00-00', 'J-4071, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(351, 'J4073', 'J4073', '67115-BZB20-00', 'J-4073, PANEL, BACK DOOR, OUTSIDE', 'D12R', 'Outhouse', 0, 0, 'PLANT-5', 'WELD1', '-', 'PL5-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(352, 'NX3598', 'NX3598', '67302-BZ090-00', 'NX-3598, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, LH', 'D12R', 'Outhouse', 0, 0, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(353, 'NX3600', 'NX3600', '67304-BZ101-00', 'NX-3600, BEAM SUB-ASSY, RR DOOR PROTECTION, LH', 'D12R', 'Outhouse', 0, 0, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(354, 'NX3597', 'NX3597', '67301-BZ100-00', 'NX-3597, BEAM SUB-ASSY, DR SI-IMPACT PROTECT, RH', 'D12R', 'Outhouse', 0, 0, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27'),
(355, 'NX3599', 'NX3599', '67303-BZ101-00', 'NX-3599, BEAM SUB-ASSY, RR DOOR PROTECTION, RH', 'D12R', 'Outhouse', 0, 0, 'MES', 'WELD1', '-', 'SP-PPL', 'Aji Wibowo', '2022-03-15 14:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_patan`
--

CREATE TABLE `tbl_master_patan` (
  `id` int(11) NOT NULL,
  `dates` date DEFAULT NULL,
  `patan` varchar(5) DEFAULT NULL,
  `shift` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_master_patan`
--

INSERT INTO `tbl_master_patan` (`id`, `dates`, `patan`, `shift`) VALUES
(1, '2022-03-01', 'C', 'D'),
(2, '2022-03-01', 'D', 'N'),
(3, '2022-03-02', 'A', 'D'),
(4, '2022-03-02', 'B', 'N'),
(5, '2022-03-03', NULL, NULL),
(6, '2022-03-03', NULL, NULL),
(7, '2022-03-04', NULL, NULL),
(8, '2022-03-04', NULL, NULL),
(9, '2022-03-05', NULL, NULL),
(10, '2022-03-05', NULL, NULL),
(11, '2022-03-06', NULL, NULL),
(12, '2022-03-06', NULL, NULL),
(13, '2022-03-07', 'C', 'D'),
(14, '2022-03-07', 'D', 'N'),
(15, '2022-03-08', 'A', 'D'),
(16, '2022-03-08', 'B', 'N'),
(17, '2022-03-09', 'C', 'D'),
(18, '2022-03-09', 'D', 'N'),
(19, '2022-03-10', 'A', 'D'),
(20, '2022-03-10', 'B', 'N'),
(21, '2022-03-11', 'C', 'D'),
(22, '2022-03-11', 'D', 'N'),
(23, '2022-03-12', 'A', 'd'),
(24, '2022-03-12', NULL, NULL),
(25, '2022-03-13', NULL, NULL),
(26, '2022-03-13', 'B', 'N'),
(27, '2022-03-14', 'C', 'D'),
(28, '2022-03-14', 'D', 'N'),
(29, '2022-03-15', 'A', 'D'),
(30, '2022-03-15', 'B', 'N'),
(31, '2022-03-16', 'C', 'D'),
(32, '2022-03-16', 'D', 'N'),
(33, '2022-03-17', 'A', 'D'),
(34, '2022-03-17', 'B', 'N'),
(35, '2022-03-18', 'C', 'D'),
(36, '2022-03-18', 'D', 'N'),
(37, '2022-03-19', 'A', 'D'),
(38, '2022-03-19', NULL, NULL),
(39, '2022-03-20', NULL, NULL),
(40, '2022-03-20', 'B', 'N'),
(41, '2022-03-21', 'C', 'D'),
(42, '2022-03-21', 'D', 'N'),
(43, '2022-03-22', 'A', 'D'),
(44, '2022-03-22', 'B', 'N'),
(45, '2022-03-23', 'C', 'D'),
(46, '2022-03-23', 'D', 'N'),
(47, '2022-03-24', 'A', 'D'),
(48, '2022-03-24', 'B', 'N'),
(49, '2022-03-25', 'C', 'D'),
(50, '2022-03-25', 'D', 'N'),
(51, '2022-03-26', 'A', 'D'),
(52, '2022-03-26', NULL, NULL),
(53, '2022-03-27', NULL, NULL),
(54, '2022-03-27', 'B', 'N'),
(55, '2022-03-28', 'C', 'D'),
(56, '2022-03-28', 'D', 'N'),
(57, '2022-03-29', 'A', 'D'),
(58, '2022-03-29', 'B', 'N'),
(59, '2022-03-30', 'C', 'D'),
(60, '2022-03-30', 'D', 'N'),
(61, '2022-03-31', 'A', 'D'),
(62, '2022-03-31', 'B', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_qr`
--

CREATE TABLE `tbl_master_qr` (
  `id` int(11) NOT NULL,
  `qr_code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_master_qr`
--

INSERT INTO `tbl_master_qr` (`id`, `qr_code`) VALUES
(1, 'PLT-P1-D26A-A1014-001'),
(2, 'PLT-P1-D26A-A1014-002'),
(3, 'PLT-P1-D26A-A1014-003'),
(4, 'PLT-P1-D26A-A1014-004'),
(5, 'PLT-P1-D26A-A1014-005'),
(6, 'PLT-P1-D26A-A1014-006'),
(7, 'PLT-P1-D26A-A1014-007'),
(8, 'PLT-P1-D26A-A1014-008'),
(9, 'PLT-P1-D26A-A1014-009'),
(10, 'PLT-P1-D26A-A1014-010'),
(11, 'PLT-P1-D26A-A1014-011'),
(12, 'PLT-P1-D26A-A1014-012'),
(13, 'PLT-P1-D26A-A1014-013'),
(14, 'PLT-P1-D26A-A1014-014'),
(15, 'PLT-P1-D26A-A1014-015'),
(16, 'PLT-P1-D26A-A1014-016'),
(17, 'PLT-P1-D26A-A1014-017'),
(18, 'PLT-P1-D26A-A1014-018'),
(19, 'PLT-P1-D26A-A1014-019'),
(20, 'PLT-P1-D26A-A1014-020'),
(21, 'PLT-P1-D26A-A4005-001'),
(22, 'PLT-P1-D26A-A4005-002'),
(23, 'PLT-P1-D26A-A4005-003'),
(24, 'PLT-P1-D26A-A4005-004'),
(25, 'PLT-P1-D26A-A4005-005'),
(26, 'PLT-P1-D26A-A4005-006'),
(27, 'PLT-P1-D26A-A4005-007'),
(28, 'PLT-P1-D26A-A4005-008'),
(29, 'PLT-P1-D26A-A4005-009'),
(30, 'PLT-P1-D26A-A4005-010'),
(31, 'PLT-P1-D26A-A4005-011'),
(32, 'PLT-P1-D26A-A4005-012'),
(33, 'PLT-P1-D26A-A4005-013'),
(34, 'PLT-P1-D26A-A4005-014'),
(35, 'PLT-P1-D26A-A4005-015'),
(36, 'PLT-P1-D26A-A4005-016'),
(37, 'PLT-P1-D26A-A4005-017'),
(38, 'PLT-P1-D26A-A4005-018'),
(39, 'PLT-P1-D26A-A4005-019'),
(40, 'PLT-P1-D26A-A4005-020'),
(41, 'PLT-P1-D26A-A1002-001'),
(42, 'PLT-P1-D26A-A1002-002'),
(43, 'PLT-P1-D26A-A1002-003'),
(44, 'PLT-P1-D26A-A1002-004'),
(45, 'PLT-P1-D26A-A1002-005'),
(46, 'PLT-P1-D26A-A1002-006'),
(47, 'PLT-P1-D26A-A1002-007'),
(48, 'PLT-P1-D26A-A1002-008'),
(49, 'PLT-P1-D26A-A1002-009'),
(50, 'PLT-P1-D26A-A1002-010'),
(51, 'PLT-P1-D26A-A1002-011'),
(52, 'PLT-P1-D26A-A1002-012'),
(53, 'PLT-P1-D26A-A1002-013'),
(54, 'PLT-P1-D26A-A1002-014'),
(55, 'PLT-P1-D26A-A1002-015'),
(56, 'PLT-P1-D26A-A1002-016'),
(57, 'PLT-P1-D26A-A1002-017'),
(58, 'PLT-P1-D26A-A1002-018'),
(59, 'PLT-P1-D26A-A1002-019'),
(60, 'PLT-P1-D26A-A1002-020'),
(61, 'PLT-P1-D26A-A1008-001'),
(62, 'PLT-P1-D26A-A1008-002'),
(63, 'PLT-P1-D26A-A1008-003'),
(64, 'PLT-P1-D26A-A1008-004'),
(65, 'PLT-P1-D26A-A1008-005'),
(66, 'PLT-P1-D26A-A1008-006'),
(67, 'PLT-P1-D26A-A1008-007'),
(68, 'PLT-P1-D26A-A1008-008'),
(69, 'PLT-P1-D26A-A1008-009'),
(70, 'PLT-P1-D26A-A1008-010'),
(71, 'PLT-P1-D26A-A1008-011'),
(72, 'PLT-P1-D26A-A1008-012'),
(73, 'PLT-P1-D26A-A1008-013'),
(74, 'PLT-P1-D26A-A1008-014'),
(75, 'PLT-P1-D26A-A1008-015'),
(76, 'PLT-P1-D26A-A1008-016'),
(77, 'PLT-P1-D26A-A1008-017'),
(78, 'PLT-P1-D26A-A1008-018'),
(79, 'PLT-P1-D26A-A1008-019'),
(80, 'PLT-P1-D26A-A1008-020'),
(81, 'PLT-P1-D26A-A1003-001'),
(82, 'PLT-P1-D26A-A1003-002'),
(83, 'PLT-P1-D26A-A1003-003'),
(84, 'PLT-P1-D26A-A1003-004'),
(85, 'PLT-P1-D26A-A1003-005'),
(86, 'PLT-P1-D26A-A1003-006'),
(87, 'PLT-P1-D26A-A1003-007'),
(88, 'PLT-P1-D26A-A1003-008'),
(89, 'PLT-P1-D26A-A1003-009'),
(90, 'PLT-P1-D26A-A1003-010'),
(91, 'PLT-P1-D26A-A1003-011'),
(92, 'PLT-P1-D26A-A1003-012'),
(93, 'PLT-P1-D26A-A1003-013'),
(94, 'PLT-P1-D26A-A1003-014'),
(95, 'PLT-P1-D26A-A1003-015'),
(96, 'PLT-P1-D26A-A1003-016'),
(97, 'PLT-P1-D26A-A1003-017'),
(98, 'PLT-P1-D26A-A1003-018'),
(99, 'PLT-P1-D26A-A1003-019'),
(100, 'PLT-P1-D26A-A1003-020'),
(101, 'PLT-P1-D26A-A4022-001'),
(102, 'PLT-P1-D26A-A4022-002'),
(103, 'PLT-P1-D26A-A4022-003'),
(104, 'PLT-P1-D26A-A4022-004'),
(105, 'PLT-P1-D26A-A4022-005'),
(106, 'PLT-P1-D26A-A4022-006'),
(107, 'PLT-P1-D26A-A4022-007'),
(108, 'PLT-P1-D26A-A4022-008'),
(109, 'PLT-P1-D26A-A4022-009'),
(110, 'PLT-P1-D26A-A4022-010'),
(111, 'PLT-P1-D26A-A4022-011'),
(112, 'PLT-P1-D26A-A4022-012'),
(113, 'PLT-P1-D26A-A4022-013'),
(114, 'PLT-P1-D26A-A4022-014'),
(115, 'PLT-P1-D26A-A4022-015'),
(116, 'PLT-P1-D26A-A4022-016'),
(117, 'PLT-P1-D26A-A4022-017'),
(118, 'PLT-P1-D26A-A4022-018'),
(119, 'PLT-P1-D26A-A4022-019'),
(120, 'PLT-P1-D26A-A4022-020'),
(121, 'PLT-P1-D26A-A4022-021'),
(122, 'PLT-P1-D26A-A4022-022'),
(123, 'PLT-P1-D26A-A4022-023'),
(124, 'PLT-P1-D26A-A4022-024'),
(125, 'PLT-P1-D26A-A4022-025'),
(126, 'PLT-P1-D26A-A4022-026');

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `menuid` varchar(40) NOT NULL,
  `mother` varchar(20) NOT NULL,
  `parent` varchar(20) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `nav` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `tabel` varchar(50) NOT NULL,
  `orders` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `menuid`, `mother`, `parent`, `icon`, `nav`, `url`, `tabel`, `orders`) VALUES
(1, 'system-', 'system', '-', 'fa-database', 'System', '-', '-', 1),
(2, 'systemtitle', 'system', 'title', '-', 'Data Title', 'master/data', 'tbl_title', 2),
(3, 'systemgroup', 'system', 'group', '-', 'Data Group', 'master/data', 'tbl_group', 3),
(4, 'systemarea', 'system', 'area', '-', 'Data Area', 'master/data', 'tbl_area', 4),
(5, 'systemlevel', 'system', 'level', '-', 'Data Level', 'master/data', 'tbl_level', 5),
(6, 'systemmenu', 'system', 'menu', '-', 'Data Menu', 'master/data', 'tbl_menu', 6),
(7, 'systemotorisasi', 'system', 'otorisasi', '-', 'Data Otorisasi', 'master/otorisasi', 'tbl_menu_user', 7),
(8, 'systemuser', 'system', 'user', 'fa-users', 'Data User', 'master/data', 'tbl_user', 8),
(9, 'master-', 'master', '-', 'fa-file-zip-o', 'Master', '-', '-', 20),
(142, 'andongeneral', 'andon', 'general', '-', 'Andon Inhouse', 'andon/general?proses=Inhouse', '-', 3),
(111, 'mastershop', 'master', 'shop', '-', 'Master Shop', 'master/data', 'tbl_master_shop', 4),
(143, 'andonvendor', 'andon', 'vendor', '-', 'Andon Outhouse', 'andon/general?proses=Outhouse', '-', 4),
(105, 'masterpart', 'master', 'part', '-', 'Master Part', 'master/data', 'tbl_master_part', 1),
(120, 'security-', 'security', '-', 'fa-key', 'Change Password', 'action/password', '-', 100),
(121, 'andon-', 'andon', '-', 'fa-desktop', 'Andon', '-', '-', 1),
(122, 'andonppc', 'andon', 'ppc', '-', 'Andon PPC', 'andon/ppc', '-', 2),
(123, 'stock-', 'stock', '-', 'fa-rocket', 'Input Stock', '-', '-', 1),
(125, 'stockinput_ppc', 'stock', 'input_ppc', '-', 'Input PPC', 'master/transaction', 'tbl_input_ppc', 2),
(139, 'stockinput_sa', 'stock', 'input_sa', '-', 'Input Door Assy', 'master/transaction', 'tbl_input_general', 6),
(141, 'masterpatan', 'master', 'patan', '-', 'Master Daily Patan', 'master/data', 'tbl_master_patan', 3),
(144, 'stockinput_dock', 'stock', 'input_dock', '-', 'Input Docking', 'master/transaction', 'tbl_input_general', 3),
(145, 'andonppl', 'andon', 'ppl', '-', 'Andon PPL', 'andon/ppl', '-', 5),
(146, 'stockinput_ppl', 'stock', 'input_ppl', '-', 'Input PPL', 'master/transaction', 'tbl_input_ppl', 4),
(148, 'stockinput_ppl_temp', 'stock', 'input_ppl_temp', '-', 'Input PPL Temp', 'master/transaction', 'tbl_input_ppl_temp', 5),
(149, 'masterpart_ppl', 'master', 'part_ppl', '-', 'Master Part PPL', 'master/data', 'tbl_master_part_ppl', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_user`
--

CREATE TABLE `tbl_menu_user` (
  `id` int(11) NOT NULL,
  `menuid` varchar(40) NOT NULL,
  `user_level` varchar(20) NOT NULL,
  `view_level` varchar(3) NOT NULL,
  `add_level` varchar(3) NOT NULL,
  `edit_level` varchar(3) NOT NULL,
  `delete_level` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu_user`
--

INSERT INTO `tbl_menu_user` (`id`, `menuid`, `user_level`, `view_level`, `add_level`, `edit_level`, `delete_level`) VALUES
(1, 'system-', 'Administrator', 'yes', 'no', 'no', 'no'),
(2, 'systemtitle', 'Administrator', 'yes', 'no', 'yes', 'no'),
(3, 'systemgroup', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(4, 'systemlevel', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(5, 'systemmenu', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(6, 'systemotorisasi', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(8, 'systemarea', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(9, 'master-', 'Administrator', 'yes', 'no', 'no', 'no'),
(10, 'systemuser', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(901, 'master-', 'Admin_area', 'yes', 'no', 'no', 'no'),
(900, 'systemuser', 'Admin_area', 'no', 'no', 'no', 'no'),
(899, 'systemotorisasi', 'Admin_area', 'no', 'no', 'no', 'no'),
(898, 'systemmenu', 'Admin_area', 'no', 'no', 'no', 'no'),
(897, 'systemlevel', 'Admin_area', 'no', 'no', 'no', 'no'),
(896, 'systemarea', 'Admin_area', 'no', 'no', 'no', 'no'),
(895, 'systemgroup', 'Admin_area', 'no', 'no', 'no', 'no'),
(894, 'systemtitle', 'Admin_area', 'no', 'no', 'no', 'no'),
(893, 'system-', 'Admin_area', 'no', 'no', 'no', 'no'),
(13, 'masterdead', 'Administrator', 'yes', 'no', 'yes', 'yes'),
(923, 'system-', 'User', 'no', 'no', 'no', 'no'),
(924, 'systemtitle', 'User', 'no', 'no', 'no', 'no'),
(925, 'systemgroup', 'User', 'no', 'no', 'no', 'no'),
(926, 'systemarea', 'User', 'no', 'no', 'no', 'no'),
(927, 'systemlevel', 'User', 'no', 'no', 'no', 'no'),
(928, 'systemmenu', 'User', 'no', 'no', 'no', 'no'),
(929, 'systemotorisasi', 'User', 'yes', 'yes', 'yes', 'yes'),
(930, 'systemuser', 'User', 'yes', 'no', 'no', 'no'),
(931, 'master-', 'User', 'no', 'no', 'no', 'no'),
(1486, 'systemtitle', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1467, 'andongeneral', 'Management', 'yes', 'no', 'no', 'no'),
(1398, 'systemtitle', 'PPC', 'no', 'no', 'no', 'no'),
(1399, 'systemgroup', 'PPC', 'no', 'no', 'no', 'no'),
(1209, 'mastershop', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1210, 'mastershop', 'Admin_area', 'no', 'no', 'no', 'no'),
(1211, 'mastershop', 'User', 'no', 'no', 'no', 'no'),
(1477, 'andonvendor', 'PPC', 'yes', 'no', 'no', 'no'),
(1471, 'andonvendor', 'Administrator', 'yes', 'no', 'no', 'no'),
(1472, 'andonvendor', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1469, 'andongeneral', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1470, 'andongeneral', 'PPC', 'yes', 'no', 'no', 'no'),
(1191, 'masterpart', 'Administrator', 'yes', 'no', 'yes', 'no'),
(1192, 'masterpart', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1193, 'masterpart', 'User', 'no', 'no', 'no', 'no'),
(1485, 'system-', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1404, 'systemuser', 'PPC', 'no', 'no', 'no', 'no'),
(1435, 'stockinput_sa', 'WH Docking', 'no', 'yes', 'yes', 'yes'),
(1246, 'system-', 'Management', 'no', 'no', 'no', 'no'),
(1247, 'systemtitle', 'Management', 'no', 'no', 'no', 'no'),
(1248, 'systemgroup', 'Management', 'no', 'no', 'no', 'no'),
(1249, 'systemarea', 'Management', 'no', 'no', 'no', 'no'),
(1250, 'systemlevel', 'Management', 'no', 'no', 'no', 'no'),
(1251, 'systemmenu', 'Management', 'no', 'no', 'no', 'no'),
(1252, 'systemotorisasi', 'Management', 'no', 'no', 'no', 'no'),
(1253, 'systemuser', 'Management', 'no', 'no', 'no', 'no'),
(1254, 'master-', 'Management', 'no', 'no', 'no', 'no'),
(1434, 'stockinput_ppc', 'WH Docking', 'no', 'no', 'no', 'no'),
(1257, 'mastershop', 'Management', 'no', 'no', 'no', 'no'),
(1405, 'master-', 'PPC', 'yes', 'no', 'no', 'no'),
(1465, 'andongeneral', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1261, 'masterpart', 'Management', 'no', 'no', 'no', 'no'),
(1400, 'systemarea', 'PPC', 'no', 'no', 'no', 'no'),
(1401, 'systemlevel', 'PPC', 'no', 'no', 'no', 'no'),
(1402, 'systemmenu', 'PPC', 'no', 'no', 'no', 'no'),
(1403, 'systemotorisasi', 'PPC', 'no', 'no', 'no', 'no'),
(1275, 'security-', 'Management', 'yes', 'no', 'no', 'no'),
(1274, 'security-', 'User', 'no', 'no', 'no', 'no'),
(1272, 'security-', 'Administrator', 'yes', 'no', 'no', 'no'),
(1273, 'security-', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1277, 'andon-', 'Administrator', 'yes', 'no', 'no', 'no'),
(1278, 'andon-', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1279, 'andon-', 'User', 'no', 'no', 'no', 'no'),
(1280, 'andon-', 'Management', 'yes', 'no', 'no', 'no'),
(1282, 'andonppc', 'Administrator', 'yes', 'no', 'no', 'no'),
(1283, 'andonppc', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1284, 'andonppc', 'User', 'no', 'no', 'no', 'no'),
(1285, 'andonppc', 'Management', 'yes', 'no', 'no', 'no'),
(1287, 'stock-', 'Administrator', 'yes', 'no', 'no', 'no'),
(1288, 'stock-', 'Admin_area', 'no', 'no', 'no', 'no'),
(1289, 'stock-', 'User', 'no', 'no', 'no', 'no'),
(1290, 'stock-', 'Management', 'no', 'no', 'no', 'no'),
(1299, 'stockinput_ppc', 'User', 'no', 'no', 'no', 'no'),
(1297, 'stockinput_ppc', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1298, 'stockinput_ppc', 'Admin_area', 'no', 'yes', 'yes', 'yes'),
(1300, 'stockinput_ppc', 'Management', 'no', 'no', 'no', 'no'),
(1397, 'system-', 'PPC', 'no', 'no', 'no', 'no'),
(1432, 'andonppc', 'WH Docking', 'no', 'no', 'no', 'no'),
(1433, 'stock-', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1431, 'andon-', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1429, 'masterpart', 'WH Docking', 'no', 'no', 'yes', 'no'),
(1430, 'security-', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1473, 'andonvendor', 'User', 'no', 'no', 'no', 'no'),
(1427, 'mastershop', 'WH Docking', 'no', 'no', 'no', 'no'),
(1425, 'master-', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1466, 'andongeneral', 'User', 'no', 'no', 'no', 'no'),
(1417, 'system-', 'WH Docking', 'no', 'no', 'no', 'no'),
(1418, 'systemtitle', 'WH Docking', 'no', 'no', 'no', 'no'),
(1419, 'systemgroup', 'WH Docking', 'no', 'no', 'no', 'no'),
(1420, 'systemarea', 'WH Docking', 'no', 'no', 'no', 'no'),
(1421, 'systemlevel', 'WH Docking', 'no', 'no', 'no', 'no'),
(1464, 'andongeneral', 'Administrator', 'yes', 'no', 'no', 'no'),
(1423, 'systemotorisasi', 'WH Docking', 'no', 'no', 'no', 'no'),
(1424, 'systemuser', 'WH Docking', 'no', 'no', 'no', 'no'),
(1367, 'stockinput_sa', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1368, 'stockinput_sa', 'Admin_area', 'no', 'yes', 'yes', 'yes'),
(1369, 'stockinput_sa', 'User', 'no', 'no', 'no', 'no'),
(1370, 'stockinput_sa', 'Management', 'no', 'no', 'no', 'no'),
(1479, 'stockinput_dock', 'Admin_area', 'no', 'no', 'no', 'no'),
(1478, 'stockinput_dock', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1474, 'andonvendor', 'Management', 'yes', 'no', 'no', 'no'),
(1422, 'systemmenu', 'WH Docking', 'no', 'no', 'no', 'no'),
(1407, 'mastershop', 'PPC', 'no', 'no', 'no', 'no'),
(1409, 'masterpart', 'PPC', 'yes', 'no', 'yes', 'no'),
(1410, 'security-', 'PPC', 'yes', 'no', 'no', 'no'),
(1411, 'andon-', 'PPC', 'yes', 'no', 'no', 'no'),
(1412, 'andonppc', 'PPC', 'yes', 'no', 'no', 'no'),
(1413, 'stock-', 'PPC', 'yes', 'no', 'no', 'no'),
(1414, 'stockinput_ppc', 'PPC', 'yes', 'yes', 'yes', 'yes'),
(1415, 'stockinput_sa', 'PPC', 'no', 'no', 'no', 'no'),
(1476, 'andonvendor', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1457, 'masterpatan', 'Administrator', 'yes', 'no', 'yes', 'no'),
(1458, 'masterpatan', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1459, 'masterpatan', 'User', 'no', 'no', 'no', 'no'),
(1460, 'masterpatan', 'Management', 'yes', 'no', 'no', 'no'),
(1462, 'masterpatan', 'WH Docking', 'yes', 'no', 'yes', 'no'),
(1463, 'masterpatan', 'PPC', 'yes', 'no', 'yes', 'no'),
(1480, 'stockinput_dock', 'User', 'no', 'no', 'no', 'no'),
(1481, 'stockinput_dock', 'Management', 'no', 'no', 'no', 'no'),
(1483, 'stockinput_dock', 'WH Docking', 'yes', 'yes', 'yes', 'yes'),
(1484, 'stockinput_dock', 'PPC', 'no', 'no', 'no', 'no'),
(1487, 'systemgroup', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1488, 'systemarea', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1489, 'systemlevel', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1490, 'systemmenu', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1491, 'systemotorisasi', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1492, 'systemuser', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1493, 'master-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1494, 'andongeneral', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1495, 'mastershop', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1496, 'andonvendor', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1497, 'masterpart', 'WH Door Assy', 'no', 'no', 'yes', 'no'),
(1498, 'security-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1499, 'andon-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1500, 'andonppc', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1501, 'stock-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1502, 'stockinput_ppc', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1503, 'stockinput_sa', 'WH Door Assy', 'yes', 'yes', 'yes', 'yes'),
(1504, 'masterpatan', 'WH Door Assy', 'yes', 'no', 'yes', 'no'),
(1505, 'stockinput_dock', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1506, 'andonppl', 'Administrator', 'yes', 'no', 'no', 'no'),
(1507, 'andonppl', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1508, 'andonppl', 'User', 'no', 'no', 'no', 'no'),
(1509, 'andonppl', 'Management', 'yes', 'no', 'no', 'no'),
(1510, 'andonppl', 'WH Docking', 'no', 'no', 'no', 'no'),
(1511, 'andonppl', 'PPC', 'yes', 'no', 'no', 'no'),
(1512, 'andonppl', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1513, 'system-', 'PPL', 'no', 'no', 'no', 'no'),
(1514, 'systemtitle', 'PPL', 'no', 'no', 'no', 'no'),
(1515, 'systemgroup', 'PPL', 'no', 'no', 'no', 'no'),
(1516, 'systemarea', 'PPL', 'no', 'no', 'no', 'no'),
(1517, 'systemlevel', 'PPL', 'no', 'no', 'no', 'no'),
(1518, 'systemmenu', 'PPL', 'no', 'no', 'no', 'no'),
(1519, 'systemotorisasi', 'PPL', 'no', 'no', 'no', 'no'),
(1520, 'systemuser', 'PPL', 'no', 'no', 'no', 'no'),
(1521, 'master-', 'PPL', 'yes', 'no', 'no', 'no'),
(1522, 'andongeneral', 'PPL', 'no', 'no', 'no', 'no'),
(1523, 'mastershop', 'PPL', 'no', 'no', 'no', 'no'),
(1524, 'andonvendor', 'PPL', 'no', 'no', 'no', 'no'),
(1525, 'masterpart', 'PPL', 'no', 'no', 'no', 'no'),
(1526, 'security-', 'PPL', 'yes', 'no', 'no', 'no'),
(1527, 'andon-', 'PPL', 'yes', 'no', 'no', 'no'),
(1528, 'andonppc', 'PPL', 'no', 'no', 'no', 'no'),
(1529, 'stock-', 'PPL', 'yes', 'no', 'no', 'no'),
(1530, 'stockinput_ppc', 'PPL', 'no', 'no', 'no', 'no'),
(1531, 'stockinput_sa', 'PPL', 'no', 'no', 'no', 'no'),
(1532, 'masterpatan', 'PPL', 'no', 'no', 'yes', 'no'),
(1533, 'stockinput_dock', 'PPL', 'no', 'no', 'no', 'no'),
(1534, 'andonppl', 'PPL', 'yes', 'no', 'no', 'no'),
(1535, 'stockinput_ppl', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1536, 'stockinput_ppl', 'Admin_area', 'no', 'no', 'no', 'no'),
(1537, 'stockinput_ppl', 'User', 'no', 'no', 'no', 'no'),
(1538, 'stockinput_ppl', 'Management', 'no', 'no', 'no', 'no'),
(1539, 'stockinput_ppl', 'WH Docking', 'no', 'no', 'no', 'no'),
(1540, 'stockinput_ppl', 'PPC', 'no', 'no', 'no', 'no'),
(1541, 'stockinput_ppl', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1542, 'stockinput_ppl', 'PPL', 'yes', 'yes', 'yes', 'yes'),
(1543, 'stock temp_ppl', 'Administrator', 'no', 'no', 'no', 'no'),
(1544, 'stock temp_ppl', 'Admin_area', 'no', 'no', 'no', 'no'),
(1545, 'stock temp_ppl', 'User', 'no', 'no', 'no', 'no'),
(1546, 'stock temp_ppl', 'Management', 'no', 'no', 'no', 'no'),
(1547, 'stock temp_ppl', 'WH Docking', 'no', 'no', 'no', 'no'),
(1548, 'stock temp_ppl', 'PPC', 'no', 'no', 'no', 'no'),
(1549, 'stock temp_ppl', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1550, 'stock temp_ppl', 'PPL', 'no', 'no', 'no', 'no'),
(1551, 'stockinput_ppl_temp', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1552, 'stockinput_ppl_temp', 'Admin_area', 'no', 'no', 'no', 'no'),
(1553, 'stockinput_ppl_temp', 'User', 'no', 'no', 'no', 'no'),
(1554, 'stockinput_ppl_temp', 'Management', 'no', 'no', 'no', 'no'),
(1555, 'stockinput_ppl_temp', 'WH Docking', 'no', 'no', 'no', 'no'),
(1556, 'stockinput_ppl_temp', 'PPC', 'yes', 'no', 'no', 'no'),
(1557, 'stockinput_ppl_temp', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1558, 'stockinput_ppl_temp', 'PPL', 'no', 'yes', 'yes', 'yes'),
(1559, 'masterpart_ppl', 'Administrator', 'yes', 'no', 'yes', 'no'),
(1560, 'masterpart_ppl', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1561, 'masterpart_ppl', 'User', 'no', 'no', 'no', 'no'),
(1562, 'masterpart_ppl', 'Management', 'no', 'no', 'no', 'no'),
(1563, 'masterpart_ppl', 'WH Docking', 'no', 'no', 'no', 'no'),
(1564, 'masterpart_ppl', 'PPC', 'no', 'no', 'no', 'no'),
(1565, 'masterpart_ppl', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1566, 'masterpart_ppl', 'PPL', 'yes', 'no', 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_title`
--

CREATE TABLE `tbl_title` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `detail` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `version` varchar(15) NOT NULL,
  `logo` varchar(15) NOT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_title`
--

INSERT INTO `tbl_title` (`id`, `title`, `detail`, `owner`, `version`, `logo`, `year`) VALUES
(1, 'RSO-P1', 'RUNDOWN STOCK ONLINE P1', 'PT ASTRA DAIHATSU MOTOR STAMPING PLANT', '1.0.0', 'logo.jpg', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_upload`
--

CREATE TABLE `tbl_upload` (
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tbl_name` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  `progress` int(11) NOT NULL,
  `success` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_upload`
--

INSERT INTO `tbl_upload` (`datetime`, `tbl_name`, `total`, `progress`, `success`) VALUES
('2019-06-24 23:25:33', 'tbl_menu', 29, 29, 29),
('2019-03-21 16:53:16', 'tbl_workorder', 35, 35, 35),
('2019-03-14 16:05:39', 'tbl_problem_repair', 32, 32, 32),
('2019-07-16 21:36:57', 'tbl_order', 255, 255, 255),
('2019-07-01 22:19:55', 'tbl_partlist', 51, 51, 51),
('2019-10-30 08:12:43', 'tbl_dn_order', 7046, 7048, 7048),
('2019-06-14 23:21:44', 'tbl_delivery', 35, 35, 35),
('2019-12-18 06:12:45', 'tbl_invitation', 507, 507, 507),
('2019-12-19 06:30:54', 'tbl_current_batch', 37, 37, 38),
('2021-09-24 19:36:08', 'tbl_master_transaction', 51, 51, 52),
('2021-11-06 08:37:04', 'tbl_master_approval', 15, 15, 15),
('2021-11-11 04:34:18', 'tbl_master_press_std', 390, 390, 391),
('2021-11-13 12:20:15', 'tbl_master_fp_subcont', 202, 202, 203),
('2022-03-01 04:10:16', 'tbl_master_patan', 62, 62, 63),
('2022-01-21 08:43:59', 'tbl_master_qr', 6, 6, 7),
('2022-03-02 23:16:50', 'tbl_input_general', 198, 198, 97),
('2022-03-15 00:16:19', 'tbl_master_part', 345, 345, 346),
('2022-03-16 02:20:21', 'tbl_input_ppl', 9, 9, 9),
('2022-03-15 07:45:27', 'tbl_master_part_ppl', 355, 355, 356),
('2022-03-16 03:07:29', 'tbl_input_ppc', 4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `nik` int(11) DEFAULT NULL,
  `typefile` varchar(15) DEFAULT NULL,
  `user_group` varchar(20) DEFAULT NULL,
  `user_level` varchar(20) DEFAULT NULL,
  `user_area` varchar(20) DEFAULT NULL,
  `shop` varchar(20) DEFAULT NULL,
  `jabatan` varchar(15) DEFAULT NULL,
  `shift` varchar(5) DEFAULT NULL,
  `registrasi` datetime DEFAULT NULL,
  `log_in` datetime DEFAULT NULL,
  `log_out` datetime DEFAULT NULL,
  `idcard` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `nama`, `nik`, `typefile`, `user_group`, `user_level`, `user_area`, `shop`, `jabatan`, `shift`, `registrasi`, `log_in`, `log_out`, `idcard`) VALUES
(1, 'mobile', '4c05853cea0412cf0665bea843ea22e330d', 'Dmuktico', 11234, 'dalu.jpg', 'User', 'MobileScan', 'Mobile', 'IRM', NULL, NULL, '2018-12-15 09:26:36', '2020-03-27 14:46:42', '2020-03-27 14:46:49', '34572016a90803b62859929c53ba59ccd6459729'),
(2, '56540', 'b2fb06abbe7ea77e4c53cbf7ea3fd15b294', 'DMUKTICO', 56540, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2022-03-16 08:09:18', '2022-03-16 08:44:45', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(12, '3007', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiyanto', 3007, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'foreman', 'B', '2021-11-01 11:00:22', '2022-03-03 06:14:45', '2022-02-17 06:13:17', '89f3d7b16c27a055a30d38bca7e7f0ab5542ba31'),
(9, '23817', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiarto', 23817, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'foreman', 'A', '2021-11-01 10:41:02', '2022-02-04 09:45:07', '2022-01-12 05:59:35', '442a51d14f1917ba0ef8b1a4adeed35b2db170fb'),
(10, '9404', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Saifullah', 9404, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'foreman', 'B', '2021-11-01 10:41:45', '2022-02-07 18:54:19', '2022-02-07 18:55:10', '635f2d4dff80d7860dc816462c567d642138de10'),
(11, '3216', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Aris Senjaya', 3216, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'foreman', 'A', '2021-11-01 10:42:17', '2022-03-15 20:23:16', '2022-03-15 20:28:20', '05a6138f890eaede3f6df558adf702a8baaeabcc'),
(31, '2564', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Andreas Harsono', 2564, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:55:43', NULL, NULL, 'ca6127548f5d554e88006c7a6e69682a9c6727d9'),
(32, '22474', 'ac1cf0242b93fae6c2f13675d841ed10772', 'Didik Prastowo', 22474, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:56:06', '2022-03-02 18:22:31', '2022-03-02 18:22:16', '138d7f9cd1c003484174b577fe28cd7161b9cab7'),
(36, '65597', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Gita Yoan S. U.', 65597, NULL, 'Admin', 'Management', 'Admin', 'PPC', 'supervisor', 'N', '2021-11-02 09:03:15', NULL, NULL, 'a565b3324b2cf8065a7ccfa0d225565678e65fd9'),
(64, '54013', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'RIKI PANTRIO HATA', 54013, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'member', 'A', '2021-12-01 14:45:07', NULL, NULL, '9fd6595aae3a06aa3dcbcf5edb1d9e22cb5f2b86'),
(62, '3197', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'RAWAL FENDY', 3197, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'A', '2021-12-01 14:42:26', NULL, NULL, '03ab6dbc57875b0957b156b6996c685b5fe9dfd6'),
(61, '38233', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'FEBRI ANGGRIYAWAN', 38233, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'A', '2021-12-01 14:41:50', NULL, NULL, '416059a16b89edaeef0af39362173d009f7eb3bb'),
(60, '6948', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'SOFIAN ABDULRAHMAN', 6948, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'foreman', 'A', '2021-12-01 14:41:06', '2022-01-07 08:04:42', '2022-01-07 08:03:17', '648975a09f1ac5cbd2504db4bbc83a050f05f6ea'),
(59, '21928', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'NUR IMAN SYARIF HIDAYAT', 21928, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'B', '2021-12-01 14:40:26', NULL, NULL, 'bd1e303c7224a5895e00e7efce332608875c8346'),
(58, '15883', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'ALIM NUR FAUZAN', 15883, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'B', '2021-12-01 14:39:43', NULL, NULL, '3a66ae50b56db43729ed0f51d803ca81f2135682'),
(57, '9206', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Yuli Wibowo', 9206, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'foreman', 'B', '2021-12-01 14:38:57', '2022-03-16 09:21:58', '2022-03-16 08:46:30', '1857a5724101c52c1716817cbf60ff4bb611ce54'),
(63, '32553', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'FAUZAN AMIEN', 32553, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'member', 'A', '2021-12-01 14:44:21', NULL, NULL, '36f77a032ea899612be3212ae7788614f4cf50ab'),
(65, '1', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Farhan', 72328, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2021-12-09 20:13:11', '2021-12-01 16:27:53', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(66, '71892', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Roy Nurandre Nugroho', 71892, NULL, 'Admin', 'Admin_area', 'Admin', 'MDIC', 'foreman', 'N', '2021-12-13 22:28:25', NULL, NULL, '56d94edd918386bbf5de071f0a01a9483481efe3'),
(67, 'dpp', 'f772f52560d4b288e78b04e35f056c3f881', 'dpp', 123, NULL, 'Admin', 'Administrator', 'Admin', 'LPP', 'dic', 'N', '2021-12-16 13:33:04', '2022-01-03 08:09:41', '2021-12-16 13:41:27', '635f2d4dff80d7860dc816462c567d642138de10'),
(68, '72328', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Farhan Imaduddin', 72328, NULL, 'Admin', 'Administrator', 'Admin', 'IFP', 'foreman', 'N', '2022-01-03 08:24:13', '2022-02-18 11:36:28', '2022-01-18 08:43:47', '6f2b83053863f56926d202366b4fedba2e398b09'),
(69, '48778', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Bayu Hidayat', 48778, NULL, 'Admin', 'Management', 'Admin', 'LPP', 'supervisor', 'N', '2022-01-05 08:46:38', '2022-03-02 20:15:28', '2022-01-05 08:50:56', '497bc892d83c0d02639cab080c5bfaad3c33f2f9'),
(70, '28680', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'ARIL SAN GAN', 28680, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'leader', 'N', '2022-01-12 15:57:57', '2022-01-13 08:41:41', '2022-01-13 09:12:33', 'ec011ac4f5c330a9b689b69e1f4f8c9fe60facf7'),
(73, '16580', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Amir Arifin', 16580, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'leader', 'N', '2022-03-12 17:49:00', NULL, NULL, 'bfba08d25914faef003c555b43c21bef738c89c3'),
(72, '20793', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Aji Wibowo', 20793, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'foreman', 'N', '2022-03-12 17:48:10', '2022-03-16 08:46:35', '2022-03-16 09:21:48', 'a6057db07eba3da916d92331e96915d1e51d7bc4'),
(74, '24205', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Joko Sulestiyono', 24205, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'leader', 'N', '2022-03-12 17:49:46', NULL, NULL, '5e381903aad845a601ccb1bcc8254015c00bcc30'),
(75, '3222', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'I. Happy S', 3222, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'foreman', 'A', '2022-03-12 17:50:30', NULL, NULL, '9c600d97540961242b617eb9711f4c91eee8f8a8'),
(76, '13295', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiyanto', 13295, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'member', 'A', '2022-03-12 17:51:48', NULL, NULL, '5593cf5e1a813e25bfea9a2d4b7d4465e89233db'),
(77, '13315', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Danianto', 13315, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'foreman', 'B', '2022-03-12 17:52:39', NULL, NULL, 'dc7b99054533882b109c627f7beb1b888b108b4d'),
(78, '33177', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Asep Subandi', 33177, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'member', 'B', '2022-03-12 17:53:10', NULL, NULL, 'b398e26996914edabc48cc853cd9a519cc099b0b');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_active`
--

CREATE TABLE `tbl_user_active` (
  `ip_address` varchar(20) NOT NULL,
  `idcard` varchar(200) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_active`
--

INSERT INTO `tbl_user_active` (`ip_address`, `idcard`, `datetime`) VALUES
('192.168.43.1', '34572016a90803b62859929c53ba59ccd6459729', '2020-01-18 00:36:12'),
('192.168.43.138', '34572016a90803b62859929c53ba59ccd6459729', '2020-01-19 14:13:56'),
('10.59.36.116', '34572016a90803b62859929c53ba59ccd6459729', '2020-03-09 08:25:07'),
('10.59.36.80', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2021-11-04 04:41:45'),
('114.124.193.216', '78f15a55ffb62f14d74ff24438752c7552ab6f16', '2021-09-27 03:01:14'),
('114.124.193.32', '78f15a55ffb62f14d74ff24438752c7552ab6f16', '2021-09-25 08:48:51'),
('114.124.188.89', '78f15a55ffb62f14d74ff24438752c7552ab6f16', '2021-09-27 08:03:11'),
('112.78.139.66', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2021-09-28 03:41:33'),
('10.59.37.118', '138d7f9cd1c003484174b577fe28cd7161b9cab7', '2022-01-04 09:35:52'),
('10.59.246.126', '1857a5724101c52c1716817cbf60ff4bb611ce54', '2021-12-17 10:22:43'),
('10.59.246.143', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2021-12-31 11:30:31'),
('10.59.37.207', '497bc892d83c0d02639cab080c5bfaad3c33f2f9', '2022-02-15 02:08:06'),
('10.59.247.129', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2021-12-24 08:41:05'),
('10.59.37.84', '635f2d4dff80d7860dc816462c567d642138de10', '2021-12-18 01:53:08'),
('10.59.246.243', '1857a5724101c52c1716817cbf60ff4bb611ce54', '2021-12-18 08:45:10'),
('10.59.247.66', '1857a5724101c52c1716817cbf60ff4bb611ce54', '2021-12-20 04:33:23'),
('10.59.246.133', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2022-01-02 11:14:15'),
('10.59.247.167', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2021-12-29 03:17:49'),
('127.0.0.1', '1857a5724101c52c1716817cbf60ff4bb611ce54', '2022-03-16 02:21:58'),
('10.59.19.68', '138d7f9cd1c003484174b577fe28cd7161b9cab7', '2022-01-04 09:54:54'),
('10.59.37.152', '6f2b83053863f56926d202366b4fedba2e398b09', '2022-01-20 04:18:15'),
('10.59.13.190', '138d7f9cd1c003484174b577fe28cd7161b9cab7', '2022-03-02 11:22:31'),
('10.59.246.247', '497bc892d83c0d02639cab080c5bfaad3c33f2f9', '2022-01-05 01:46:48'),
('::1', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2022-03-12 06:13:26'),
('10.59.247.149', '497bc892d83c0d02639cab080c5bfaad3c33f2f9', '2022-01-06 01:55:01'),
('10.59.246.175', '497bc892d83c0d02639cab080c5bfaad3c33f2f9', '2022-01-09 16:22:22'),
('10.59.247.118', '497bc892d83c0d02639cab080c5bfaad3c33f2f9', '2022-01-12 00:29:14'),
('10.59.246.137', '497bc892d83c0d02639cab080c5bfaad3c33f2f9', '2022-01-08 05:03:42'),
('10.59.36.142', '1857a5724101c52c1716817cbf60ff4bb611ce54', '2022-01-15 10:54:03'),
('10.59.247.81', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8', '2022-03-01 04:09:34'),
('10.59.247.228', '497bc892d83c0d02639cab080c5bfaad3c33f2f9', '2022-03-02 13:15:28'),
('10.59.36.187', '89f3d7b16c27a055a30d38bca7e7f0ab5542ba31', '2022-03-02 23:14:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`area`);

--
-- Indexes for table `tbl_day`
--
ALTER TABLE `tbl_day`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`day`);

--
-- Indexes for table `tbl_group`
--
ALTER TABLE `tbl_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_general`
--
ALTER TABLE `tbl_input_general`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_ppc`
--
ALTER TABLE `tbl_input_ppc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_ppl`
--
ALTER TABLE `tbl_input_ppl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_ppl_temp`
--
ALTER TABLE `tbl_input_ppl_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ip_address`
--
ALTER TABLE `tbl_ip_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `tbl_level`
--
ALTER TABLE `tbl_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `tbl_master_part`
--
ALTER TABLE `tbl_master_part`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_part_ppl`
--
ALTER TABLE `tbl_master_part_ppl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_patan`
--
ALTER TABLE `tbl_master_patan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_qr`
--
ALTER TABLE `tbl_master_qr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`);

--
-- Indexes for table `tbl_menu_user`
--
ALTER TABLE `tbl_menu_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_menu` (`menuid`,`user_level`);

--
-- Indexes for table `tbl_title`
--
ALTER TABLE `tbl_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_upload`
--
ALTER TABLE `tbl_upload`
  ADD UNIQUE KEY `tbl_name` (`tbl_name`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`password`),
  ADD KEY `idcard` (`idcard`);

--
-- Indexes for table `tbl_user_active`
--
ALTER TABLE `tbl_user_active`
  ADD PRIMARY KEY (`ip_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_area`
--
ALTER TABLE `tbl_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_day`
--
ALTER TABLE `tbl_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_group`
--
ALTER TABLE `tbl_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_input_general`
--
ALTER TABLE `tbl_input_general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_input_ppc`
--
ALTER TABLE `tbl_input_ppc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_input_ppl`
--
ALTER TABLE `tbl_input_ppl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_input_ppl_temp`
--
ALTER TABLE `tbl_input_ppl_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_ip_address`
--
ALTER TABLE `tbl_ip_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_master_part`
--
ALTER TABLE `tbl_master_part`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT for table `tbl_master_part_ppl`
--
ALTER TABLE `tbl_master_part_ppl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT for table `tbl_master_patan`
--
ALTER TABLE `tbl_master_patan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_master_qr`
--
ALTER TABLE `tbl_master_qr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `tbl_menu_user`
--
ALTER TABLE `tbl_menu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1567;

--
-- AUTO_INCREMENT for table `tbl_title`
--
ALTER TABLE `tbl_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

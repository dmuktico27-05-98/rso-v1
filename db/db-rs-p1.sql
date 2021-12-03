-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2021 at 02:37 AM
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
-- Table structure for table `tbl_input_2a`
--

CREATE TABLE `tbl_input_2a` (
  `id` int(11) NOT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `job_master` varchar(10) DEFAULT NULL,
  `part_number` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `max_shift` int(11) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
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
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_input_2a`
--

INSERT INTO `tbl_input_2a` (`id`, `job_number`, `job_master`, `part_number`, `part_name`, `max_shift`, `patan`, `t_t`, `shift`, `shop_name`, `sto_p1`, `sto_p4`, `sto_kap`, `sto_ppl`, `sto_process`, `ss_p1`, `ss_p4`, `ss_kap`, `ss_ppl`, `ss_process`, `create_by`, `create_date`) VALUES
(1, 'K2137', 'K2024', '61112-BZD00', 'PANEL, SIDE OUTER LH????', 13, 'A', 36, 'N', 'IFP', 100, 0, 0, 0, 0, '62', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:22:36'),
(2, 'K1131', 'K1131', '65622-BZ020', 'PANEL, SIDE GATE, LH', 17, 'TEIRYO', 27, 'N', 'IFP', 100, 0, 0, 0, 0, '47', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:22:43'),
(3, 'K1158', 'K1050', '64111-BZ090', 'PANEL, BACK   LHD', 1, 'D', 465, 'N', 'IFP', 100, 0, 0, 0, 0, '800', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:22:47'),
(4, 'K3005', 'K3005', '63111-BZ120', 'PANEL, ROOF PICK UP', 17, 'C', 27, 'N', 'IFP', 100, 0, 0, 0, 0, '47', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:22:52'),
(5, 'S1011', 'S1011', '57111-BZ270', 'MEMBER, FR SIDE, FR RH', 177, 'TEIRYO', 3, 'N', 'IFP', 100, 0, 0, 0, 0, '5', '0', '0', '0', '0', 'DMUKTICO', '2021-11-16 17:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_3b`
--

CREATE TABLE `tbl_input_3b` (
  `id` int(11) NOT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `job_master` varchar(10) DEFAULT NULL,
  `part_number` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `max_shift` int(11) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
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
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_input_3b`
--

INSERT INTO `tbl_input_3b` (`id`, `job_number`, `job_master`, `part_number`, `part_name`, `max_shift`, `patan`, `t_t`, `shift`, `shop_name`, `sto_p1`, `sto_p4`, `sto_kap`, `sto_ppl`, `sto_process`, `ss_p1`, `ss_p4`, `ss_kap`, `ss_ppl`, `ss_process`, `create_by`, `create_date`) VALUES
(1, 'K1017', 'K1016', '55741-BZ150', 'PANEL, COWL TOP, INNER', 52, 'B', 9, 'N', 'IFP', 100, 0, 0, 0, 0, '15', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:26:24'),
(2, 'J1032', 'J1030', '55741-BZ370', 'PANEL, COWL TOP, INNER', 5, 'ABCD', 93, 'N', 'IFP', 100, 0, 0, 0, 0, '160', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:26:28'),
(3, 'T2015', 'T2015', '61433-BZ190', 'R/F ROCKER OUTER RH', 281, 'B', 2, 'N', 'IFP', 100, 0, 0, 0, 0, '3', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:26:32'),
(4, 'T2006', 'T2006', '61176-BZ150', 'REINFORCE, FR BODY PLR, UPR OUT NO.2 LH', 281, 'B', 2, 'N', 'IFP', 100, 0, 0, 0, 0, '3', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:26:36'),
(5, 'A1006', 'A1006', '57111-BZ290', 'MEMBER, FR SIDE, FR RH', 350, 'ABCD', 1, 'N', 'IFP', 100, 0, 0, 0, 0, '2', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_4a`
--

CREATE TABLE `tbl_input_4a` (
  `id` int(11) NOT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `job_master` varchar(10) DEFAULT NULL,
  `part_number` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `max_shift` int(11) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
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
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_input_4a`
--

INSERT INTO `tbl_input_4a` (`id`, `job_number`, `job_master`, `part_number`, `part_name`, `max_shift`, `patan`, `t_t`, `shift`, `shop_name`, `sto_p1`, `sto_p4`, `sto_kap`, `sto_ppl`, `sto_process`, `ss_p1`, `ss_p4`, `ss_kap`, `ss_ppl`, `ss_process`, `create_by`, `create_date`) VALUES
(1, 'K2124', 'K2061', '61613-BZ103', 'PANEL, QUARTER, INNER RH', 26, 'B', 18, 'N', 'IFP', 100, 0, 0, 0, 0, '31', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:26:54'),
(2, 'K2126', 'K2061', '61613-BZ123', 'PANEL, QUARTER, INNER RH', 13, 'B', 36, 'N', 'IFP', 100, 0, 0, 0, 0, '62', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:26:58'),
(3, 'K2123', 'K2062', '61614-BZ093', 'PANEL, QUARTER, INNER LH', 24, 'B', 19, 'N', 'IFP', 100, 0, 0, 0, 0, '33', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:27:01'),
(4, 'K2117', 'K2001', '61111-BZ251', 'PANEL, SIDE OUTER RH', 10, 'D', 47, 'N', 'IFP', 100, 0, 0, 0, 0, '80', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:27:05'),
(5, 'T1001', 'J1021', '55111-BZB10', 'PANEL, DASH', 87, 'ABCD', 5, 'N', 'IFP', 0, 0, 0, 0, 0, '0', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:27:08'),
(7, 'A4042', 'A4041', '67149-BZ610', 'PANEL, BACK DOOR, INSIDE', 38, 'ABCD', 12, 'N', 'IFP', 100, 0, 0, 0, 0, '21', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_5a`
--

CREATE TABLE `tbl_input_5a` (
  `id` int(11) NOT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `job_master` varchar(10) DEFAULT NULL,
  `part_number` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `max_shift` int(11) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
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
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_input_5a`
--

INSERT INTO `tbl_input_5a` (`id`, `job_number`, `job_master`, `part_number`, `part_name`, `max_shift`, `patan`, `t_t`, `shift`, `shop_name`, `sto_p1`, `sto_p4`, `sto_kap`, `sto_ppl`, `sto_process`, `ss_p1`, `ss_p4`, `ss_kap`, `ss_ppl`, `ss_process`, `create_by`, `create_date`) VALUES
(1, 'K4012', 'K4010', '67112-BZ120', 'PANEL FR DOOR OUTSIDE, LH', 53, 'A', 9, 'N', 'IFP', 100, 0, 0, 0, 0, '15', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:27:40'),
(2, 'K1147', 'K1050', '64111-BZ051', 'PANEL, BACK', 6, 'D', 78, 'N', 'IFP', 0, 0, 0, 0, 0, '0', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:27:43'),
(3, 'K1148', 'K1050', '64111-BZ061', 'PANEL, BACK', 81, 'D', 6, 'N', 'IFP', 100, 0, 0, 0, 0, '10', '0', '0', '0', '0', 'DMUKTICO', '2021-11-13 17:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_docking`
--

CREATE TABLE `tbl_input_docking` (
  `id` int(11) NOT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `job_master` varchar(10) DEFAULT NULL,
  `part_number` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `max_shift` int(11) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
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
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_subcont`
--

CREATE TABLE `tbl_input_subcont` (
  `id` int(11) NOT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `job_master` varchar(10) DEFAULT NULL,
  `part_number` varchar(20) DEFAULT NULL,
  `part_name` varchar(40) DEFAULT NULL,
  `max_shift` int(11) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
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
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(58, '192.168.43.1', 'MobileScan', '-', 'Manual', 'mobile'),
(67, '192.168.43.138', 'MobileScan', '-', 'Manual', 'mobilesscan'),
(70, '10.59.36.116', 'MobileScan', '-', 'Manual', 'mobilescan'),
(71, '192.168.43.223', 'MobileScan', '-', 'Manual', 'mobilescan'),
(72, '10.59.36.66', 'MobileScan', '-', 'Manual', 'mobilescan');

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
(24, 'Received', 'Admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_fp_subcont`
--

CREATE TABLE `tbl_master_fp_subcont` (
  `id` int(11) NOT NULL,
  `job_number` varchar(30) DEFAULT NULL,
  `part_number` varchar(30) DEFAULT NULL,
  `part_name` varchar(100) DEFAULT NULL,
  `qty_unit` int(11) DEFAULT NULL,
  `qty_plt` int(11) DEFAULT NULL,
  `type_plt` varchar(20) DEFAULT NULL,
  `vendor` varchar(20) DEFAULT NULL,
  `keb_day` int(11) DEFAULT NULL,
  `tot_kbn` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `last_month` int(11) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_press_std`
--

CREATE TABLE `tbl_master_press_std` (
  `id` int(11) NOT NULL,
  `machine` varchar(30) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `job_number` varchar(30) DEFAULT NULL,
  `job_master` varchar(30) DEFAULT NULL,
  `part_number` varchar(30) DEFAULT NULL,
  `part_name` varchar(50) DEFAULT NULL,
  `qty_unit` int(11) DEFAULT NULL,
  `max_shift` int(11) DEFAULT NULL,
  `lot_cycle` int(11) DEFAULT NULL,
  `lot_size` int(11) DEFAULT NULL,
  `qty_kbn` int(11) DEFAULT NULL,
  `tot_kbn` int(11) DEFAULT NULL,
  `qty_plt` int(11) DEFAULT NULL,
  `type_plt` varchar(10) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `model` varchar(10) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
  `routing` varchar(20) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_press_std`
--

INSERT INTO `tbl_master_press_std` (`id`, `machine`, `no`, `job_number`, `job_master`, `part_number`, `part_name`, `qty_unit`, `max_shift`, `lot_cycle`, `lot_size`, `qty_kbn`, `tot_kbn`, `qty_plt`, `type_plt`, `location`, `model`, `patan`, `routing`, `create_by`, `create_date`) VALUES
(1, '2A', 1, 'K1015', 'K1015', '55711-BZ090', 'PANEL, COWL TOP, OUTER  LHD', 1, 0, 4, 0, 10, 0, 100, 'KHS', 'LEVEL PART', 'D40D', 'TEIRYO', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(2, '3B', 2, 'K1016', 'K1016', '55741-BZ130', 'PANEL, COWL TOP, INNER', 1, 0, 4, 0, 5, 1, 100, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(3, '3B', 3, 'K1017', 'K1016', '55741-BZ150', 'PANEL, COWL TOP, INNER', 1, 52, 4, 18, 10, 23, 100, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(4, '3B', 4, 'K1119', 'K1016', '55741-BZ200', 'PANEL, COWL TOP, INNER', 1, 128, 4, 9, 50, 12, 100, 'KHS', 'LEVEL PART', 'D40D', 'AC', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(5, '5A', 5, 'K1050', 'K1050', '64111-BZ010', 'PANEL, BACK', 1, 0, 4, 0, 1, 0, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(6, '5A', 6, 'K1133', 'K1050', '64111-BZ050', 'PANEL, BACK', 1, 0, 4, 0, 5, 0, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(7, '5A', 7, 'K1147', 'K1050', '64111-BZ051', 'PANEL, BACK', 1, 6, 4, 4, 5, 6, 25, 'KHS', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(8, '5A', 8, 'K1051', 'K1050', '64111-BZ020', 'PANEL, BACK', 1, 0, 4, 0, 0, 0, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(9, '5A', 9, 'K1146', 'K1050', '64111-BZ021', 'PANEL, BACK', 1, 0, 4, 0, 0, 0, 25, 'KHS', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(10, '5A', 10, 'K1134', 'K1050', '64111-BZ060', 'PANEL, BACK', 1, 2, 4, 2, 5, 4, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(11, '5A', 11, 'K1148', 'K1050', '64111-BZ061', 'PANEL, BACK', 1, 81, 4, 12, 25, 17, 25, 'KHS', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(12, '5A', 12, 'K1052', 'K1050', '64111-BZ030', 'PANEL, BACK', 1, 17, 4, 12, 5, 17, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(13, '5A', 13, 'K1053', 'K1050', '64111-BZ040', 'PANEL, BACK   LHD', 1, 0, 4, 0, 5, 0, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(14, '5A', 14, 'K1158', 'K1050', '64111-BZ090', 'PANEL, BACK   LHD', 1, 1, 4, 4, 1, 6, 25, 'KHS', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(15, '2A', 15, 'K1130', 'K1130', '65621-BZ020', 'PANEL, SIDE GATE, RH', 1, 17, 12, 18, 10, 19, 20, 'KHS', 'LEVEL PART', 'D40D', 'TEIRYO', 'P1 ~ GM (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(16, '2A', 16, 'K1131', 'K1131', '65622-BZ020', 'PANEL, SIDE GATE, LH', 1, 17, 12, 18, 10, 19, 20, 'KHS', 'LEVEL PART', 'D40D', 'TEIRYO', 'P1 ~ GM (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(17, '2A', 17, 'K1132', 'K1132', '65751-BZ020', 'PANEL, TAIL GATE', 1, 17, 12, 18, 10, 19, 20, 'KHS', 'LEVEL PART', 'D40D', 'TEIRYO', 'P1 ~ GM (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(18, '4A', 18, 'K2001', 'K2001', '61111-BZ240', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(19, '4A', 19, 'K2116', 'K2001', '61111-BZ241', 'PANEL, SIDE OUTER RH', 1, 24, 4, 17, 5, 23, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(20, '4A', 20, 'K2003', 'K2001', '61111-BZ250', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(21, '4A', 21, 'K2117', 'K2001', '61111-BZ251', 'PANEL, SIDE OUTER RH', 1, 10, 4, 8, 5, 11, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(22, '4A', 22, 'K2007', 'K2001', '61111-BZ290', 'PANEL, SIDE OUTER RH', 0, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(23, '4A', 23, 'K2011', 'K2001', '61111-BZ300', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 10, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(24, '4A', 24, 'K2013', 'K2001', '61111-BZ281', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(25, '4A', 25, 'K2118', 'K2001', '61111-BZ282', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(26, '4A', 26, 'K2015', 'K2001', '61111-BZ310', 'PANEL, SIDE OUTER RH', 0, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(27, '4A', 27, 'K2017', 'K2001', '61111-BZ320', 'PANEL, SIDE OUTER RH', 0, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(28, '4A', 28, 'K2021', 'K2001', '61111-BZ410', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(29, '4A', 29, 'K2099', 'K2001', '61111-BZ301', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 10, 0, 10, 'DP3', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(30, '4A', 30, 'K2119', 'K2001', '61111-BZ302', 'PANEL, SIDE OUTER RH', 1, 23, 4, 8, 10, 12, 10, 'DP3', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(31, '4A', 31, 'K2101', 'K2001', '61111-BZ321', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 5, 0, 10, 'DP5', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(32, '4A', 32, 'K2120', 'K2001', '61111-BZ322', 'PANEL, SIDE OUTER RH', 1, 13, 4, 9, 5, 13, 10, 'DP5', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(33, '4A', 33, 'K2103', 'K2001', '61111-BZ700', 'PANEL, SIDE OUTER RH', 1, 0, 4, 0, 5, 0, 10, 'DP5', 'LEVEL PART', 'D88D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(34, '4A', 34, 'K2121', 'K2001', '61111-BZ701', 'PANEL, SIDE OUTER RH　', 1, 9, 4, 7, 5, 9, 10, 'DP5', 'LEVEL PART', 'D88D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(35, '4A', 35, 'K2002', 'K2002', '61112-BZ270', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(36, '4A', 36, 'K2106', 'K2002', '61112-BZ271', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(37, '4A', 37, 'K2132', 'K2002', '61112-BZC40', 'PANEL, SIDE OUTER LH', 1, 24, 4, 17, 5, 23, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(38, '4A', 38, 'K2004', 'K2002', '61112-BZ280', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(39, '4A', 39, 'K2107', 'K2002', '61112-BZ281', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(40, '4A', 40, 'K2133', 'K2002', '61112-BZC50', 'PANEL, SIDE OUTER LH', 1, 10, 4, 8, 5, 11, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(41, '4A', 41, 'K2006', 'K2002', '61112-BZ300', 'PANEL, SIDE OUTER LH', 0, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(42, '4A', 42, 'K2010', 'K2002', '61112-BZ310', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 10, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(43, '4A', 43, 'K2108', 'K2002', '61112-BZA10', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 10, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(44, '4A', 44, 'K2140', 'K2002', '61112-BZD20', 'PANEL, SIDE OUTER LH', 1, 9, 4, 4, 10, 6, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(45, '4A', 45, 'K2012', 'K2002', '61112-BZ291', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(46, '4A', 46, 'K2109', 'K2002', '61112-BZ292', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(47, '4A', 47, 'K2014', 'K2002', '61112-BZ320', 'PANEL, SIDE OUTER LH', 0, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(48, '4A', 48, 'K2016', 'K2002', '61112-BZ330', 'PANEL, SIDE OUTER LH', 0, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(49, '4A', 49, 'K2022', 'K2002', '61112-BZ410', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(50, '4A', 50, 'K2081', 'K2002', '61112-BZ521', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(51, '4A', 51, 'K2112', 'K2002', '61112-BZ522', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(52, '4A', 52, 'K2139', 'K2002', '61112-BZC80', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 10, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(53, '4A', 53, 'K2100', 'K2002', '61112-BZ311', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 10, 0, 10, 'DP3', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(54, '4A', 54, 'K2110', 'K2002', '61112-BZ312', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 10, 0, 10, 'DP3', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(55, '4A', 55, 'K2134', 'K2002', '61112-BZC60', 'PANEL, SIDE OUTER LH', 1, 23, 4, 8, 10, 11, 10, 'DP3', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(56, '4A', 56, 'K2102', 'K2002', '61112-BZ331', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP4', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(57, '4A', 57, 'K2111', 'K2002', '61112-BZ332', 'PANEL, SIDE OUTER LH', 1, 0, 4, 0, 5, 0, 10, 'DP4', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(58, '4A', 58, 'K2135', 'K2002', '61112-BZC70', 'PANEL, SIDE OUTER LH', 1, 13, 4, 9, 5, 13, 10, 'DP4', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(59, '4A', 59, 'K2023', 'K2023', '61111-BZ330', 'PANEL, SIDE OUTER RH　ピック', 1, 0, 4, 0, 10, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(60, '4A', 60, 'K2113', 'K2023', '61111-BZ331', 'PANEL, SIDE OUTER RH　ピック', 1, 87, 4, 31, 10, 41, 10, 'DP2', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(61, '4A', 61, 'K2025', 'K2023', '61111-BZ340', 'PANEL, SIDE OUTER RH　ピック', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(62, '4A', 62, 'K2114', 'K2023', '61111-BZ341', 'PANEL, SIDE OUTER RH　ピック', 1, 13, 4, 9, 5, 13, 10, 'DP2', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(63, '4A', 63, 'K2029', 'K2023', '61111-BZ360', 'PANEL, SIDE OUTER RH　ピック', 1, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(64, '4A', 64, 'K2115', 'K2023', '61111-BZ361', 'PANEL, SIDE OUTER RH　ピック', 1, 6, 4, 4, 5, 6, 10, 'DP2', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(65, '4A', 65, 'K2024', 'K2024', '61112-BZ340', 'PANEL, SIDE OUTER LH　ピック', 1, 0, 4, 0, 10, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(66, '4A', 66, 'K2136', 'K2024', '61112-BZC90', 'PANEL, SIDE OUTER LH　ピック', 1, 86, 4, 30, 10, 40, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(67, '4A', 67, 'K2026', 'K2024', '61112-BZ350', 'PANEL, SIDE OUTER LH　ピック', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(68, '4A', 68, 'K2028', 'K2024', '61112-BZ360', 'PANEL, SIDE OUTER LH　ピック', 1, 0, 4, 0, 5, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(69, '4A', 69, 'K2137', 'K2024', '61112-BZD00', 'PANEL, SIDE OUTER LH　ピック', 1, 13, 4, 9, 5, 13, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(70, '4A', 70, 'K2030', 'K2024', '61112-BZ370', 'PANEL, SIDE OUTER LH　ピック', 1, 0, 4, 0, 1, 0, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(71, '4A', 71, 'K2138', 'K2024', '61112-BZD10', 'PANEL, SIDE OUTER LH　ピック', 1, 6, 4, 4, 5, 6, 10, 'DP2', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(72, '3B', 72, 'K2048', 'K2048', '61412-BZ060', 'PANEL, ROCKER, OUTER LH', 1, 41, 4, 3, 50, 6, 100, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(73, '3B', 73, 'K2050', 'K2048', '61412-BZ070', 'PANEL, ROCKER, OUTER LH', 1, 36, 4, 5, 25, 7, 100, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(74, '3B', 74, 'K2052', 'K2048', '61412-BZ120', 'PANEL, ROCKER, OUTER LH', 1, 0, 4, 0, 5, 0, 15, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(75, '4A', 75, 'K2053', 'K2053', '61611-BZ181', 'PANEL, QUARTER, RH', 1, 24, 4, 9, 10, 13, 20, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(76, '4A', 76, 'K2055', 'K2053', '61611-BZ201', 'PANEL, QUARTER, RH', 1, 36, 4, 13, 10, 17, 20, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(77, '4A', 77, 'K2079', 'K2053', '61611-BZ241', 'PANEL, QUARTER, RH', 1, 10, 4, 4, 10, 6, 20, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(78, '4A', 78, 'K2059', 'K2053', '61611-BZ231', 'PANEL, QUARTER, RH', 1, 0, 4, 0, 5, 0, 20, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(79, '4A', 79, 'K2057', 'K2053', '61611-BZ221', 'PANEL, QUARTER, RH', 1, 0, 4, 0, 5, 0, 20, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(80, '4A', 80, 'K2104', 'K2053', '61611-BZ330', 'PANEL, QUARTER, RH', 1, 9, 4, 7, 5, 9, 20, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(81, '4A', 81, 'K2054', 'K2054', '61612-BZ191', 'PANEL, QUARTER, LH', 1, 24, 4, 9, 10, 13, 20, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(82, '4A', 82, 'K2056', 'K2054', '61612-BZ211', 'PANEL, QUARTER, LH', 1, 36, 4, 13, 10, 18, 20, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(83, '4A', 83, 'K2080', 'K2054', '61612-BZ251', 'PANEL, QUARTER, LH', 1, 10, 4, 4, 10, 6, 20, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(84, '4A', 84, 'K2060', 'K2054', '61612-BZ241', 'PANEL, QUARTER, LH', 1, 0, 4, 0, 5, 0, 20, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(85, '4A', 85, 'K2058', 'K2054', '61612-BZ231', 'PANEL, QUARTER, LH', 1, 0, 4, 0, 5, 0, 20, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(86, '4A', 86, 'K2105', 'K2054', '61612-BZ360', 'PANEL, QUARTER, LH', 1, 9, 4, 7, 5, 9, 20, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(87, '4A', 87, 'K2061', 'K2061', '61613-BZ091', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(88, '4A', 88, 'K2071', 'K2061', '61613-BZ101', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(89, '4A', 89, 'K2073', 'K2061', '61613-BZ111', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(90, '4A', 90, 'K2083', 'K2061', '61613-BZ240', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 1, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'D', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(91, '4A', 91, 'K2087', 'K2061', '61613-BZ092', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(92, '4A', 92, 'K2122', 'K2061', '61613-BZ093', 'PANEL, QUARTER, INNER RH', 1, 30, 4, 5, 25, 7, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(93, '4A', 93, 'K2089', 'K2061', '61613-BZ102', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(94, '4A', 94, 'K2124', 'K2061', '61613-BZ103', 'PANEL, QUARTER, INNER RH', 1, 26, 4, 19, 5, 26, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(95, '4A', 95, 'K2091', 'K2061', '61613-BZ122', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(96, '4A', 96, 'K2126', 'K2061', '61613-BZ123', 'PANEL, QUARTER, INNER RH', 1, 13, 4, 9, 5, 13, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(97, '4A', 97, 'K2075', 'K2061', '61613-BZ121', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 1, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(98, '4A', 98, 'K2077', 'K2061', '61613-BZ141', 'PANEL, QUARTER, INNER RH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(99, '4A', 99, 'K2128', 'K2061', '61613-BZ142', 'PANEL, QUARTER, INNER RH', 1, 9, 4, 7, 5, 9, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(100, '4A', 100, 'K2062', 'K2062', '61614-BZ091', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(101, '4A', 101, 'K2072', 'K2062', '61614-BZ101', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(102, '4A', 102, 'K2074', 'K2062', '61614-BZ111', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(103, '4A', 103, 'K2088', 'K2062', '61614-BZ092', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(104, '4A', 104, 'K2123', 'K2062', '61614-BZ093', 'PANEL, QUARTER, INNER LH', 1, 24, 4, 17, 5, 21, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(105, '4A', 105, 'K2090', 'K2062', '61614-BZ102', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(106, '4A', 106, 'K2125', 'K2062', '61614-BZ103', 'PANEL, QUARTER, INNER LH', 1, 38, 4, 6, 25, 11, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(107, '4A', 107, 'K2092', 'K2062', '61614-BZ122', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(108, '4A', 108, 'K2127', 'K2062', '61614-BZ123', 'PANEL, QUARTER, INNER LH', 1, 7, 4, 5, 5, 7, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(109, '4A', 109, 'K2076', 'K2062', '61614-BZ121', 'PANEL, QUARTER, INNER LH', 0, 0, 4, 0, 1, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(110, '4A', 110, 'K2078', 'K2062', '61614-BZ141', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(111, '4A', 111, 'K2129', 'K2062', '61614-BZ142', 'PANEL, QUARTER, INNER LH', 1, 9, 4, 7, 5, 9, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(112, '4A', 112, 'K2131', 'K2062', '61614-BZ300', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 5, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(113, '4A', 113, 'K2082', 'K2062', '61614-BZ230', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 1, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(114, '4A', 114, 'K2084', 'K2062', '61614-bz260', 'PANEL, QUARTER, INNER LH', 1, 0, 4, 0, 1, 0, 75, 'DP1', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(115, '4A', 115, 'K3001', 'K3001', '63111-BZ020', 'PANEL, ROOF', 1, 0, 4, 0, 5, 0, 10, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(116, '4A', 116, 'K3008', 'K3001', '63111-BZ021', 'PANEL, ROOF', 1, 32, 4, 23, 5, 31, 10, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(117, '4A', 117, 'K3002', 'K3001', '63111-BZ110', 'PANEL, ROOF   LHD', 1, 0, 4, 0, 1, 0, 10, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(118, '4A', 118, 'K3009', 'K3001', '63111-BZ111', 'PANEL, ROOF   LHD', 1, 0, 4, 0, 5, 0, 10, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(119, '4A', 119, 'K3003', 'K3001', '63111-BZ140', 'PANEL, ROOF', 1, 7, 4, 5, 5, 7, 10, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(120, '4A', 120, 'K3004', 'K3001', '63111-BZ170', 'PANEL, ROOF', 1, 0, 4, 0, 10, 0, 10, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(121, '4A', 121, 'K3010', 'K3001', '63111-BZ171', 'PANEL, ROOF', 1, 38, 4, 14, 10, 19, 10, 'KHS', 'LEVEL PART', 'D40D', 'B', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(122, '5A', 122, 'K3005', 'K3005', '63111-BZ120', 'PANEL, ROOF PICK UP', 1, 17, 4, 3, 25, 5, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(123, '5A', 123, 'K3006', 'K3005', '63111-BZ130', 'PANEL, ROOF PICK UP  LHD', 1, 0, 4, 0, 5, 0, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(124, '5A', 124, 'K3007', 'K3005', '63111-BZ150', 'PANEL, ROOF PICK UP', 1, 87, 4, 13, 25, 18, 25, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(125, '5A', 125, 'K4001', 'K4001', '53311-BZ090', 'PANEL, HOOD', 1, 125, 4, 30, 15, 41, 50, 'KHS', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(126, '5A', 126, 'K4002', 'K4001', '53311-BZ100', 'PANEL, HOOD', 1, 52, 4, 12, 15, 17, 50, 'KHS', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(127, '5A', 127, 'K4053', 'K4053', '53311-BZ110', 'PANEL, HOOD', 1, 1, 16, 0, 25, 0, 50, 'KHS', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(128, '5A', 128, 'K4070', 'K4053', '53311-BZ220', 'PANEL, HOOD', 1, 9, 16, 26, 5, 27, 50, 'KHS', 'SUB ASSY', 'D88D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(129, '3B', 129, 'K4003', 'K4003', '53321-BZ130', 'PANEL, HOOD, INNER', 1, 125, 4, 9, 50, 13, 75, 'KHS', 'SUB ASSY', 'D40D', 'A', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(130, '3B', 130, 'K4004', 'K4003', '53321-BZ140', 'PANEL, HOOD, INNER', 1, 52, 4, 8, 25, 11, 75, 'KHS', 'SUB ASSY', 'D40D', 'A', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(131, '2A', 131, 'K4054', 'K4054', '53321-BZ150', 'PANEL, HOOD, INNER', 1, 1, 16, 0, 5, 0, 50, 'KHS', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(132, '2A', 132, 'K4071', 'K4054', '53321-BZ220', 'PANEL, HOOD, INNER', 1, 9, 16, 26, 5, 27, 50, 'KHS', 'SUB ASSY', 'D88D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(133, '2A', 133, 'K4005', 'K4005', '53811-BZ172', 'PANEL, FR FENDER, RH', 1, 123, 2, 9, 26, 14, 26, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(134, '2A', 134, 'K4007', 'K4005', '53811-BZ182', 'PANEL, FR FENDER, RH', 1, 54, 2, 4, 26, 7, 26, 'KHS', 'LEVEL PART', 'D40D', 'C', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(135, '2A', 135, 'K4006', 'K4006', '53812-BZ172', 'PANEL, FR FENDER, LH', 1, 123, 2, 9, 26, 14, 26, 'KHS', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(136, '2A', 136, 'K4008', 'K4006', '53812-BZ182', 'PANEL, FR FENDER, LH', 1, 55, 2, 4, 26, 6, 26, 'KHS', 'LEVEL PART', 'D40D', 'A', 'P1 ~ P4 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(137, '5A', 137, 'K4009', 'K4009', '67111-BZ110', 'PANEL FR DOOR OUTSIDE, RH', 1, 121, 4, 9, 50, 13, 50, 'DP1', 'SUB ASSY', 'D40D', 'C', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(138, '5A', 138, 'K4011', 'K4009', '67111-BZ120', 'PANEL FR DOOR OUTSIDE, RH', 1, 53, 4, 19, 10, 26, 50, 'DP1', 'SUB ASSY', 'D40D', 'C', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(139, '5A', 139, 'K4072', 'K4009', '67111-BZ320', 'PANEL FR DOOR OUTSIDE, RH', 1, 9, 4, 4, 10, 6, 50, 'DP1', 'SUB ASSY', 'D88D', 'D', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(140, '5A', 140, 'K4010', 'K4010', '67112-BZ110', 'PANEL FR DOOR OUTSIDE, LH', 1, 120, 2, 5, 50, 9, 50, 'DP1', 'SUB ASSY', 'D40D', 'A', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(141, '5A', 141, 'K4012', 'K4010', '67112-BZ120', 'PANEL FR DOOR OUTSIDE, LH', 1, 53, 2, 10, 10, 16, 50, 'DP1', 'SUB ASSY', 'D40D', 'A', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(142, '5A', 142, 'K4073', 'K4010', '67112-BZ320', 'PANEL FR DOOR OUTSIDE, LH', 1, 9, 2, 2, 10, 4, 50, 'DP1', 'SUB ASSY', 'D88D', 'A', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(143, '5A', 143, 'K4013', 'K4013', '67113-BZ140', 'PANEL, RR DOOR, OUTSIDE RH', 1, 10, 4, 8, 5, 9, 25, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(144, '5A', 144, 'K4015', 'K4013', '67113-BZ150', 'PANEL, RR DOOR, OUTSIDE RH', 1, 36, 4, 5, 25, 6, 25, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(145, '5A', 145, 'K4017', 'K4013', '67113-BZ160', 'PANEL, RR DOOR, OUTSIDE RH', 1, 24, 4, 17, 5, 20, 25, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(146, '5A', 146, 'K4074', 'K4013', '67113-BZ350', 'PANEL, RR DOOR, OUTSIDE RH', 1, 9, 4, 7, 5, 8, 25, 'DP1', 'SUB ASSY', 'D88D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(147, '5A', 147, 'K4014', 'K4014', '67114-BZ140', 'PANEL, RR DOOR, OUTSIDE LH', 1, 10, 4, 8, 5, 9, 25, 'DP1', 'SUB ASSY', 'D40D', 'D', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(148, '5A', 148, 'K4016', 'K4014', '67114-BZ150', 'PANEL, RR DOOR, OUTSIDE LH', 1, 36, 4, 5, 25, 6, 25, 'DP1', 'SUB ASSY', 'D40D', 'D', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(149, '5A', 149, 'K4018', 'K4014', '67114-BZ160', 'PANEL, RR DOOR, OUTSIDE LH', 1, 24, 4, 17, 5, 20, 25, 'DP1', 'SUB ASSY', 'D40D', 'D', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(150, '5A', 150, 'K4075', 'K4014', '67114-BZ350', 'PANEL, RR DOOR, OUTSIDE LH', 1, 9, 4, 7, 5, 8, 25, 'DP1', 'SUB ASSY', 'D88D', 'D', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(151, '4A', 151, 'K4019', 'K4019', '67115-BZ220', 'PANEL BACK DOOR, OUTSIDE', 1, 25, 8, 36, 5, 39, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(152, '4A', 152, 'K4020', 'K4019', '67115-BZ230', 'PANEL BACK DOOR, OUTSIDE', 1, 0, 8, 0, 5, 0, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(153, '4A', 153, 'K4021', 'K4019', '67115-BZ240', 'PANEL BACK DOOR, OUTSIDE', 0, 0, 8, 0, 1, 0, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(154, '4A', 154, 'K4062', 'K4019', '67115-BZ241', 'PANEL BACK DOOR, OUTSIDE', 1, 6, 8, 8, 5, 9, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(155, '4A', 155, 'K4065', 'K4019', '67115-BZ470', 'PANEL BACK DOOR, OUTSIDE (SERVICE PART)', 0, 0, 8, 0, 1, 0, 25, '0', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(156, '4A', 156, 'K4022', 'K4019', '67115-BZ250', 'PANEL BACK DOOR, OUTSIDE', 0, 0, 8, 0, 1, 0, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(157, '4A', 157, 'K4063', 'K4019', '67115-BZ251', 'PANEL BACK DOOR, OUTSIDE', 1, 32, 8, 45, 5, 49, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(158, '4A', 158, 'K4066', 'K4019', '67115-BZ480', 'PANEL BACK DOOR, OUTSIDE (SERVICE PART)', 0, 0, 8, 0, 0, 0, 25, '0', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(159, '4A', 159, 'K4059', 'K4019', '67115-BZ340', 'PANEL BACK DOOR, OUTSIDE', 1, 3, 8, 5, 5, 6, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(160, '4A', 160, 'K4023', 'K4023', '67115-BZ280', 'PANEL BACK DOOR, OUTSIDE', 1, 7, 12, 15, 5, 16, 30, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(161, '5A', 161, 'K4057', 'K4057', '67115-BZ300', 'PANEL BACK DOOR, OUTSIDE', 1, 0, 20, 0, 5, 0, 30, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(162, '5A', 162, 'K4058', 'K4057', '67115-BZ310', 'PANEL BACK DOOR, OUTSIDE', 1, 1, 20, 0, 5, 0, 30, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(163, '5A', 163, 'K4076', 'K4057', '67115-BZ620', 'PANEL BACK DOOR, OUTSIDE', 1, 7, 20, 24, 5, 25, 30, 'DP2', 'SUB ASSY', 'D88D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(164, '5A', 164, 'K4077', 'K4057', '67115-BZ630', 'PANEL BACK DOOR, OUTSIDE', 1, 2, 20, 8, 5, 9, 30, 'DP2', 'SUB ASSY', 'D88D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(165, '4A', 165, 'K4032', 'K4032', '67143-BZ131', 'PANEL, RR DOOR, INSIDE RH', 1, 18, 6, 7, 15, 8, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(166, '4A', 166, 'K4034', 'K4032', '67143-BZ141', 'PANEL, RR DOOR, INSIDE RH', 0, 0, 6, 0, 1, 0, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(167, '4A', 167, 'K4036', 'K4032', '67143-BZ151', 'PANEL, RR DOOR, INSIDE RH', 0, 0, 6, 0, 5, 0, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(168, '4A', 168, 'K4040', 'K4032', '67143-BZ171', 'PANEL, RR DOOR, INSIDE RH', 1, 0, 6, 0, 1, 1, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(169, '4A', 169, 'K4042', 'K4032', '67143-BZ181', 'PANEL, RR DOOR, INSIDE RH', 1, 24, 6, 26, 5, 29, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(170, '4A', 170, 'K4068', 'K4032', '67143-BZ152', 'PANEL, RR DOOR, INSIDE RH', 1, 36, 6, 13, 15, 15, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(171, '4A', 171, 'K4033', 'K4033', '67144-BZ121', 'PANEL, RR DOOR, INSIDE LH', 1, 18, 6, 7, 15, 8, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(172, '4A', 172, 'K4035', 'K4033', '67144-BZ131', 'PANEL, RR DOOR, INSIDE LH', 0, 0, 6, 0, 1, 0, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(173, '4A', 173, 'K4037', 'K4033', '67144-BZ141', 'PANEL, RR DOOR, INSIDE LH', 0, 0, 6, 0, 5, 0, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(174, '4A', 174, 'K4041', 'K4033', '67144-BZ161', 'PANEL, RR DOOR, INSIDE LH', 1, 1, 6, 0, 1, 1, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(175, '4A', 175, 'K4043', 'K4033', '67144-BZ171', 'PANEL, RR DOOR, INSIDE LH', 1, 24, 6, 26, 5, 29, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(176, '4A', 176, 'K4069', 'K4033', '67144-BZ142', 'PANEL, RR DOOR, INSIDE LH', 1, 36, 6, 13, 15, 15, 30, 'DP1', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(177, '2A', 177, 'K4045', 'K4045', '67145-BZ050', 'PANEL, FR DOOR HINGE SIDE,RH', 1, 129, 4, 9, 50, 13, 100, 'C', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(178, '2A', 178, 'K4047', 'K4045', '67145-BZ060', 'PANEL, FR DOOR HINGE SIDE,RH', 1, 53, 4, 10, 20, 14, 100, 'C', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(179, '2A', 179, 'K4046', 'K4046', '67146-BZ050', 'PANEL, FR DOOR HINGE SIDE,LH', 1, 129, 4, 9, 50, 13, 100, 'C', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(180, '2A', 180, 'K4048', 'K4046', '67146-BZ060', 'PANEL, FR DOOR HINGE SIDE,LH', 1, 53, 4, 10, 20, 14, 100, 'C', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(181, '4A', 181, 'K4049', 'K4049', '67149-BZ170', 'PANEL BACK DOOR, INSIDE', 1, 29, 8, 20, 10, 22, 50, 'DP2', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(182, '4A', 182, 'K4050', 'K4049', '67149-BZ180', 'PANEL BACK DOOR, INSIDE', 0, 0, 8, 0, 1, 0, 50, 'DP2', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(183, '4A', 183, 'K4064', 'K4049', '67149-BZ181', 'PANEL BACK DOOR, INSIDE', 1, 32, 8, 23, 10, 25, 50, 'DP2', 'SUB ASSY', 'D40D', 'B', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(184, '4A', 184, 'K4067', 'K4049', '67149-BZ190', 'PANEL BACK DOOR, INSIDE', 1, 6, 8, 8, 5, 9, 50, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(185, '4A', 185, 'K4052', 'K4052', '67149-BZ200', 'PANEL BACK DOOR, INSIDE', 1, 7, 12, 8, 10, 9, 50, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(186, '4A', 186, 'K4051', 'K4051', '67149-BZ210', 'PANEL BACK DOOR, INSIDE', 1, 9, 12, 4, 25, 5, 25, 'DP2', 'SUB ASSY', 'D40D', 'TEIRYO', 'P1 ~ P1 (WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(187, '4A', 187, 'J2022', 'J2022', '61111-BZ501', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 13, 0, 13, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(188, '4A', 188, 'J2023', 'J2022', '61111-BZ511', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 13, 0, 13, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(189, '4A', 189, 'J2026', 'J2022', '61111-BZ541', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 13, 0, 13, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(190, '4A', 190, 'J2028', 'J2022', '61111-BZ610', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 13, 0, 13, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-KAP(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(191, '4A', 191, 'J2024', 'J2022', '61111-BZ521', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 13, 0, 13, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(192, '4A', 192, 'J2025', 'J2022', '61111-BZ531', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 1, 0, 13, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(193, '4A', 193, 'J2027', 'J2022', '61111-BZ551', 'PANEL, SIDE, OUTER RH', 1, 1, 8, 0, 13, 0, 13, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(194, '4A', 194, 'J2045', 'J2022', '61111-BZ502', 'PANEL, SIDE, OUTER RH', 1, 2, 8, 0, 3, 0, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(195, '4A', 195, 'J2046', 'J2022', '61111-BZ512', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 1, 0, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(196, '4A', 196, 'J2047', 'J2022', '61111-BZ522', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 3, 0, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(197, '4A', 197, 'J2048', 'J2022', '61111-BZ532', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 1, 0, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(198, '4A', 198, 'J2049', 'J2022', '61111-BZ542', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 1, 0, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(199, '4A', 199, 'J2050', 'J2022', '61111-BZ552', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 1, 0, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(200, '4A', 200, 'J2084', 'J2022', '61111-BZA60', 'PANEL, SIDE, OUTER RH', 1, 18, 8, 7, 13, 8, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(201, '4A', 201, 'J2085', 'J2022', '61111-BZA70', 'PANEL, SIDE, OUTER RH', 1, 2, 8, 2, 13, 3, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(202, '4A', 202, 'J2051', 'J2022', '61111-BZ611', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 13, 0, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(203, '4A', 203, 'J2081', 'J2022', '61111-BZ710', 'PANEL, SIDE, OUTER RH', 1, 1, 8, 0, 13, 1, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(204, '4A', 204, 'J2082', 'J2022', '61111-BZ720', 'PANEL, SIDE, OUTER RH', 1, 0, 8, 0, 3, 1, 13, 'J2001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(205, '4A', 205, 'J2002', 'J2002', '61112-BZ580', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(206, '4A', 206, 'J2004', 'J2002', '61112-BZ590', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(207, '4A', 207, 'J2006', 'J2002', '61112-BZ600', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 1, 0, 13, 'J2002', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(208, '4A', 208, 'J2011', 'J2002', '61112-BZ630', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(209, '4A', 209, 'J2029', 'J2002', '61112-BZ690', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 10, 'J2001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-KAP(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(210, '4A', 210, 'J2008', 'J2002', '61112-BZ610', 'PANEL, SIDE, OUTER LH', 1, 1, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(211, '4A', 211, 'J2009', 'J2002', '61112-BZ620', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 1, 0, 13, 'J2002', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(212, '4A', 212, 'J2013', 'J2002', '61112-BZ640', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(213, '4A', 213, 'J2057', 'J2002', '61112-BZ581', 'PANEL, SIDE, OUTER LH', 1, 21, 8, 12, 13, 13, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(214, '4A', 214, 'J2058', 'J2002', '61112-BZ591', 'PANEL, SIDE, OUTER LH', 1, 1, 8, 0, 13, 1, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(215, '4A', 215, 'J2059', 'J2002', '61112-BZ601', 'PANEL, SIDE, OUTER LH', 1, 1, 8, 0, 3, 0, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(216, '4A', 216, 'J2060', 'J2002', '61112-BZ611', 'PANEL, SIDE, OUTER LH', 1, 2, 8, 2, 13, 3, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(217, '4A', 217, 'J2061', 'J2002', '61112-BZ621', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 3, 1, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(218, '4A', 218, 'J2062', 'J2002', '61112-BZ631', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 3, 0, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(219, '4A', 219, 'J2063', 'J2002', '61112-BZ641', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(220, '4A', 220, 'J2064', 'J2002', '61112-BZ691', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(221, '4A', 221, 'J2083', 'J2002', '61112-BZ860', 'PANEL, SIDE, OUTER LH', 1, 0, 8, 0, 13, 0, 13, 'J2002', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(222, '3B', 222, 'J2014', 'J2014', '61631-BZ100', 'PANEL, QUARTER WHEEL HOUSE, OUTER RH', 1, 18, 4, 2, 50, 5, 100, 'J2014', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(223, '3B', 223, 'J2016', 'J2014', '61631-BZ110', 'PANEL, QUARTER WHEEL HOUSE, OUTER RH', 1, 2, 4, 1, 50, 3, 100, 'J2014', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(224, '3B', 224, 'J2015', 'J2015', '61632-BZ100', 'PANEL, QUARTER WHEEL HOUSE, OUTER LH', 1, 18, 4, 2, 50, 6, 100, 'J2014', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(225, '3B', 225, 'J2017', 'J2015', '61632-BZ110', 'PANEL, QUARTER WHEEL HOUSE, OUTER LH', 1, 2, 4, 1, 50, 3, 100, 'J2014', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(226, '5A', 226, 'J3001', 'J3001', '63111-BZ210', 'PANEL, ROOF', 1, 1, 4, 0, 12, 0, 12, 'J3001', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(227, '5A', 227, 'J4005', 'J4005', '53811-BZ220', 'PANEL, FR FENDER, RH', 1, 1, 8, 0, 15, 0, 15, 'J4005', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(228, '5A', 228, 'J4007', 'J4005', '53811-BZ230', 'PANEL, FR FENDER, RH', 1, 1, 8, 0, 5, 0, 15, 'J4005', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(229, '5A', 229, 'J4009', 'J4005', '53811-BZ240', 'PANEL, FR FENDER, RH', 1, 0, 8, 0, 5, 0, 15, 'J4005', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(230, '5A', 230, 'J4011', 'J4005', '53811-BZ250', 'PANEL, FR FENDER, RH', 1, 0, 8, 0, 5, 0, 15, 'J4005', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(231, '5A', 231, 'J4013', 'J4005', '53811-BZ260', 'PANEL, FR FENDER, RH', 1, 0, 8, 0, 5, 0, 15, 'J4005', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(232, '5A', 232, 'J4051', 'J4051', '53811-BZ340', 'PANEL, FR FENDER, RH', 1, 21, 8, 10, 15, 11, 15, 'J4005', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(233, '5A', 233, 'J4053', 'J4051', '53811-BZ350', 'PANEL, FR FENDER, RH', 1, 2, 8, 3, 15, 4, 15, 'J4005', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(234, '5A', 234, 'J4055', 'J4051', '53811-BZ360', 'PANEL, FR FENDER, RH', 1, 0, 8, 0, 1, 0, 15, 'J4005', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(235, '5A', 235, 'J4057', 'J4051', '53811-BZ370', 'PANEL, FR FENDER, RH', 1, 1, 8, 2, 15, 3, 15, 'J4005', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(236, '5A', 236, 'J4059', 'J4051', '53811-BZ380', 'PANEL, FR FENDER, RH', 1, 1, 8, 2, 5, 3, 15, 'J4005', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(237, '5A', 237, 'J4006', 'J4006', '53812-BZ220', 'PANEL, FR FENDER, LH', 1, 1, 8, 0, 15, 0, 15, 'J4006', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(238, '5A', 238, 'J4008', 'J4006', '53812-BZ230', 'PANEL, FR FENDER, LH', 1, 1, 8, 0, 5, 0, 15, 'J4006', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(239, '5A', 239, 'J4010', 'J4006', '53812-BZ240', 'PANEL, FR FENDER, LH', 1, 1, 8, 0, 5, 0, 15, 'J4006', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(240, '5A', 240, 'J4012', 'J4006', '53812-BZ250', 'PANEL, FR FENDER, LH', 1, 1, 8, 0, 5, 0, 15, 'J4006', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(241, '5A', 241, 'J4014', 'J4006', '53812-BZ260', 'PANEL, FR FENDER, LH', 1, 1, 8, 0, 5, 0, 15, 'J4006', 'LEVEL PART', 'D01N', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(242, '5A', 242, 'J4052', 'J4052', '53812-BZ280', 'PANEL, FR FENDER, LH', 1, 22, 8, 11, 15, 12, 15, 'J4006', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(243, '5A', 243, 'J4054', 'J4052', '53812-BZ350', 'PANEL, FR FENDER, LH', 1, 2, 8, 2, 15, 3, 15, 'J4006', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(244, '5A', 244, 'J4056', 'J4052', '53812-BZ360', 'PANEL, FR FENDER, LH', 1, 0, 8, 0, 1, 1, 15, 'J4006', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(245, '5A', 245, 'J4058', 'J4052', '53812-BZ370', 'PANEL, FR FENDER, LH', 1, 1, 8, 0, 15, 1, 15, 'J4006', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(246, '5A', 246, 'J4060', 'J4052', '53812-BZ380', 'PANEL, FR FENDER, LH', 1, 1, 8, 2, 5, 3, 15, 'J4006', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(247, '5A', 247, 'J4017', 'J4017', '67111-BZ210', 'PANEL, FR DOOR, OUTSIDE RH', 1, 22, 8, 7, 25, 8, 25, 'J4015', 'PPL', 'D01N', 'ABCD', 'PL1-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(248, '5A', 248, 'J4018', 'J4018', '67112-BZ220', 'PANEL, FR DOOR, OUTSIDE LH', 1, 22, 8, 7, 25, 8, 25, 'J4015', 'PPL', 'D01N', 'ABCD', 'PL1-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(249, '5A', 249, 'J4021', 'J4021', '67113-BZ240', 'PANEL, RR DOOR, OUTSIDE RH', 1, 22, 8, 7, 25, 8, 25, 'J4019', 'PPL', 'D01N', 'ABCD', 'PL1-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(250, '5A', 250, 'J4022', 'J4022', '67114-BZ240', 'PANEL, RR DOOR, OUTSIDE LH', 1, 21, 8, 6, 25, 7, 25, 'J4019', 'PPL', 'D01N', 'ABCD', 'PL1-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(251, '5A', 251, 'J4031', 'J4031', '67141-BZ180', 'PANEL, FR DOOR, INSIDE RH', 1, 21, 8, 3, 50, 4, 50, 'J4031', 'PPL', 'D01N', 'ABCD', 'PL1-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(252, '5A', 252, 'J4032', 'J4032', '67142-BZ180', 'PANEL, FR DOOR, INSIDE LH', 1, 21, 8, 3, 50, 4, 50, 'J4031', 'PPL', 'D01N', 'ABCD', 'PL1-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(253, '3B', 253, 'GBJ-0030', 'GBJ-0030', '58372-BZ100', 'PANEL, BODY LWR BACK, INNER', 1, 18, 8, 3, 50, 5, 150, 'C', 'PPL', 'D01N', 'AC', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(254, '3B', 254, 'GBJ-0031', 'GBJ-0030', '58372-BZ110', 'PANEL, BODY LWR BACK, INNER', 1, 2, 8, 1, 50, 3, 100, 'C', 'PPL', 'D01N', 'AC', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(255, '4A', 255, 'J1021', 'J1021', '55111-BZ710', 'PANEL, DASH', 1, 0, 1, 0, 25, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(256, '4A', 256, 'J1022', 'J1021', '55111-BZ720', 'PANEL, DASH', 1, 0, 1, 0, 50, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(257, '4A', 257, 'J1023', 'J1021', '55111-BZ750', 'PANEL, DASH', 1, 0, 1, 0, 25, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(258, '4A', 258, 'J1024', 'J1021', '55111-BZ760', 'PANEL, DASH', 1, 0, 1, 0, 25, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(259, '4A', 259, 'J1025', 'J1021', '55111-BZ780', 'PANEL, DASH', 1, 0, 1, 0, 10, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(260, '4A', 260, 'J1026', 'J1021', '55111-BZ790', 'PANEL, DASH', 1, 0, 1, 0, 1, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(261, '4A', 261, 'J1027', 'J1021', '55111-BZ800', 'PANEL, DASH', 1, 0, 1, 0, 10, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(262, '4A', 262, 'J1028', 'J1021', '55111-BZ810', 'PANEL, DASH', 1, 0, 1, 0, 25, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(263, '4A', 263, 'J1029', 'J1021', '55111-BZ820', 'PANEL, DASH', 1, 0, 1, 0, 25, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(264, '3B', 264, 'J1030', 'J1030', '55741-BZ350', 'PANEL, COWL TOP, INNER', 1, 0, 4, 0, 50, 0, 50, 'J1030', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(265, '3B', 265, 'J1031', 'J1030', '55741-BZ360', 'PANEL, COWL TOP, INNER', 1, 15, 4, 2, 50, 5, 50, 'J1030', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(266, '3B', 266, 'J1032', 'J1030', '55741-BZ370', 'PANEL, COWL TOP, INNER', 1, 5, 4, 1, 50, 3, 50, 'J1030', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4(WELD1)', 'DMUKTICO', '2021-11-11 11:34:18'),
(267, '5A', 267, 'J4041', 'J4041', '53311-BZ230', 'PANEL, HOOD', 1, 29, 8, 4, 50, 5, 50, 'J4041', 'PPL', 'D17D', 'ABCD', 'SP-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(268, '5A', 268, 'J4042', 'J4042', '53321-BZ230', 'PANEL, HOOD, INNER', 1, 29, 8, 4, 50, 5, 100, 'J4042', 'PPL', 'D17D', 'ABCD', 'SP-PPL(WELD)', 'DMUKTICO', '2021-11-11 11:34:18'),
(269, '4A', 269, 'J1042', 'J1021', '55111-BZ721', 'PANEL, DASH', 1, 15, 1, 1, 50, 3, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-GM', 'DMUKTICO', '2021-11-11 11:34:18');
INSERT INTO `tbl_master_press_std` (`id`, `machine`, `no`, `job_number`, `job_master`, `part_number`, `part_name`, `qty_unit`, `max_shift`, `lot_cycle`, `lot_size`, `qty_kbn`, `tot_kbn`, `qty_plt`, `type_plt`, `location`, `model`, `patan`, `routing`, `create_by`, `create_date`) VALUES
(270, '4A', 270, 'J1043', 'J1021', '55111-BZ751', 'PANEL, DASH', 1, 0, 1, 0, 25, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(271, '4A', 271, 'J1044', 'J1021', '55111-BZ761', 'PANEL, DASH', 1, 0, 1, 0, 25, 0, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(272, '4A', 272, 'J1045', 'J1021', '55111-BZ781', 'PANEL, DASH', 1, 0, 1, 0, 10, 1, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(273, '4A', 273, 'J1046', 'J1021', '55111-BZ791', 'PANEL, DASH', 1, 1, 1, 1, 1, 3, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(274, '4A', 274, 'J1047', 'J1021', '55111-BZ801', 'PANEL, DASH', 1, 2, 1, 1, 10, 3, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(275, '4A', 275, 'J1048', 'J1021', '55111-BZ811', 'PANEL, DASH', 1, 3, 1, 1, 10, 3, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(276, '4A', 276, 'J1049', 'J1021', '55111-BZ821', 'PANEL, DASH', 1, 1, 1, 1, 10, 3, 50, 'J1021', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(277, '5A', 277, 'T4015', 'T4015', '67113-BZ410', 'PANEL, RR DOOR, OUTSIDE RH', 1, 281, 2, 10, 50, 16, 50, 'DP09', 'SUB ASSY', 'D14N', 'AC', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(278, '5A', 278, 'T4016', 'T4016', '67114-BZ410', 'PANEL, RR DOOR, OUTSIDE LH', 1, 281, 2, 10, 50, 16, 50, 'DP09', 'SUB ASSY', 'D14N', 'AC', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(279, '5A', 279, 'T4003', 'T4003', '53811-BZ560', 'PANEL, FR FENDER, RH', 1, 285, 2, 34, 15, 57, 15, 'DP04', 'LEVEL PART', 'D14N', 'AC', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(280, '5A', 280, 'T4004', 'T4004', '53812-BZ550', 'PANEL, FR FENDER, LH', 1, 285, 2, 34, 15, 57, 15, 'DP04', 'LEVEL PART', 'D14N', 'BD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(281, '5A', 281, 'T4029', 'T4029', '67115-BZ820', 'PANEL, BACK DOOR, OUTSIDE', 1, 51, 2, 2, 50, 4, 50, 'DP10', 'SUB ASSY', 'D14N', 'BD', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(282, '5A', 282, 'T4030', 'T4029', '67115-BZ840', 'PANEL, BACK DOOR, OUTSIDE', 1, 28, 2, 1, 50, 3, 50, 'DP10', 'SUB ASSY', 'D14N', 'BD', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(283, '5A', 283, 'T4034', 'T4029', '67115-BZA20', 'PANEL, BACK DOOR, OUTSIDE', 1, 44, 2, 2, 50, 4, 50, 'DP10', 'SUB ASSY', 'D14N', 'AC', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(284, '5A', 284, 'T4035', 'T4029', '67115-BZA30', 'PANEL, BACK DOOR, OUTSIDE', 1, 162, 2, 6, 50, 11, 50, 'DP10', 'SUB ASSY', 'D14N', 'AC', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(285, '4A', 285, 'T3001', 'T3001', '63111-BZ290', 'PANEL, ROOF', 1, 281, 2, 38, 13, 61, 13, 'DP08', 'LEVEL PART', 'D14N', 'BD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(286, '5A', 286, 'T4001', 'T4001', '53311-BZ290', 'PANEL, HOOD', 1, 288, 2, 10, 50, 17, 50, 'DP02', 'SUB ASSY', 'D14N', 'BD', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(287, '4A', 287, 'T2001', 'T2001', '61111-BZA00', 'PANEL, SIDE, OUTER RH', 1, 1, 1, 0, 1, 3, 13, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(288, '4A', 288, 'T2003', 'T2001', '61111-BZA10', 'PANEL, SIDE, OUTER RH', 1, 0, 1, 0, 1, 1, 13, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(289, '4A', 289, 'T2043', 'T2001', '61111-BZB70', 'PANEL, SIDE, OUTER RH', 1, 252, 1, 17, 13, 37, 13, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(290, '4A', 290, 'T2045', 'T2001', '61111-BZB80', 'PANEL, SIDE, OUTER RH', 1, 30, 1, 2, 13, 7, 13, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(291, '4A', 291, 'T2033', 'T2001', '61111-BZB20', 'PANEL, SIDE, OUTER RH', 1, 0, 1, 0, 10, 0, 10, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(292, '4A', 292, 'T2035', 'T2001', '61111-BZB30', 'PANEL, SIDE, OUTER RH', 1, 0, 1, 0, 10, 0, 10, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(293, '4A', 293, 'T2002', 'T2002', '61112-BZB00', 'PANEL, SIDE, OUTER LH', 1, 252, 1, 17, 13, 37, 13, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(294, '4A', 294, 'T2004', 'T2002', '61112-BZB10', 'PANEL, SIDE, OUTER LH', 1, 30, 1, 2, 13, 6, 13, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(295, '4A', 295, 'T2037', 'T2002', '61112-BZC10', 'PANEL, SIDE, OUTER LH', 1, 0, 1, 0, 10, 0, 10, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(296, '4A', 296, 'T2038', 'T2002', '61112-BZC20', 'PANEL, SIDE, OUTER LH', 1, 0, 1, 0, 10, 0, 10, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(297, '4A', 297, 'T2039', 'T2002', '61112-BZC30', 'PANEL, SIDE, OUTER LH', 1, 0, 1, 0, 10, 0, 10, 'DP06', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(298, '5A', 298, 'T4002', 'T4002', '53321-BZ280', 'PANEL, HOOD, INNER', 1, 288, 2, 10, 50, 16, 100, 'DP03', 'SUB ASSY', 'D14N', 'AC', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(299, '3B', 299, 'T4023', 'T4023', '67147-BZ170', 'PANEL R/D HINGE SIDE RH', 1, 281, 2, 5, 100, 9, 200, 'C', 'SUB ASSY', 'D14N', 'D', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(300, '3B', 300, 'T4024', 'T4024', '67148-BZ170', 'PANEL R/D HINGE SIDE LH', 1, 281, 2, 5, 100, 9, 200, 'C', 'SUB ASSY', 'D14N', 'D', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(301, '3B', 301, 'T1005', 'T1005', '55741-BZ510', 'PANEL COWL TOP INNER', 1, 164, 2, 6, 50, 11, 50, 'DP05', 'LEVEL PART', 'D14N', 'A', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(302, '3B', 302, 'T1006', 'T1005', '55741-BZ520', 'PANEL COWL TOP INNER', 1, 116, 2, 9, 25, 16, 50, 'DP05', 'LEVEL PART', 'D14N', 'A', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(303, '3B', 303, 'T2007', 'T2007', '61161-BZ260', 'PILLAR FR BODY INNER RH', 1, 281, 2, 5, 100, 8, 100, 'I', 'LEVEL PART', 'D14N', 'C', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(304, '3B', 304, 'T2008', 'T2008', '61162-BZ280', 'PILLAR FR BODY INNER LH', 1, 281, 2, 5, 100, 9, 100, 'I', 'LEVEL PART', 'D14N', 'C', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(305, '3B', 305, 'T2009', 'T2009', '61247-BZ090', 'R/F ROOF SIDE RAIL INNER RH', 1, 281, 2, 5, 100, 9, 100, 'I', 'LEVEL PART', 'D14N', 'D', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(306, '2A', 306, 'T2010', 'T2010', '61248-BZ090', 'R/F ROOF SIDE RAIL INNER LH', 1, 281, 2, 5, 100, 9, 100, 'I', 'LEVEL PART', 'D14N', 'B', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(307, '3B', 307, 'T2015', 'T2015', '61433-BZ190', 'R/F ROCKER OUTER RH', 1, 281, 2, 9, 60, 16, 60, 'DP15', 'LEVEL PART', 'D14N', 'B', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(308, '3B', 308, 'T2016', 'T2016', '61434-BZ180', 'R/F ROCKER OUTER LH', 1, 281, 2, 9, 60, 15, 60, 'DP15', 'LEVEL PART', 'D14N', 'B', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(309, '2A', 309, 'T4013', 'T4013', '67145-BZ160', 'PANEL F/D HINGE SIDE RH', 1, 281, 2, 3, 200, 6, 200, 'C', 'SUB ASSY', 'D14N', 'D', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(310, '2A', 310, 'T4014', 'T4014', '67146-BZ150', 'PANEL F/D HINGE SIDE LH', 1, 281, 2, 3, 200, 6, 200, 'C', 'SUB ASSY', 'D14N', 'D', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(311, '3B', 311, 'T4021', 'T4021', '67135-BZ090', 'EXTENSION, RR DOOR OUTSIDE REINFORCE, RH', 1, 281, 2, 5, 100, 10, 100, 'I', 'SUB ASSY', 'D14N', 'A', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(312, '3B', 312, 'T4022', 'T4022', '67136-BZ070', 'EXTENSION, RR DOOR OUTSIDE REINFORCE, LH', 1, 281, 2, 5, 100, 10, 100, 'I', 'SUB ASSY', 'D14N', 'C', 'ADM P1 ~ PPL', 'DMUKTICO', '2021-11-11 11:34:18'),
(313, '2A', 313, 'T2013', 'T2013', '61345-BZ150', 'PILLAR, CTR BODY, INNER LWR RH', 1, 281, 2, 5, 100, 9, 100, 'C', 'LEVEL PART', 'D14N', 'A', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(314, '2A', 314, 'T2014', 'T2014', '61346-BZ150', 'PILLAR, CTR BODY, INNER LWR LH', 1, 281, 2, 5, 100, 9, 100, 'C', 'LEVEL PART', 'D14N', 'C', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(315, '2A', 315, 'T2011', 'T2011', '61343-BZ200', 'PILLAR, CTR BODY, INNER RH', 1, 281, 2, 5, 100, 9, 100, 'I', 'LEVEL PART', 'D14N', 'B', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(316, '2A', 316, 'T2012', 'T2012', '61344-BZ210', 'PILLAR, CTR BODY, INNER LH', 1, 281, 2, 5, 100, 9, 100, 'I', 'LEVEL PART', 'D14N', 'B', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(317, '3B', 317, 'T2005', 'T2005', '61175-BZ150', 'REINFORCE, FR BODY PLR, UPR OUT NO.2 RH', 1, 281, 2, 5, 100, 9, 100, 'C', 'LEVEL PART', 'D14N', 'B', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(318, '3B', 318, 'T2006', 'T2006', '61176-BZ150', 'REINFORCE, FR BODY PLR, UPR OUT NO.2 LH', 1, 281, 2, 5, 100, 9, 100, 'C', 'LEVEL PART', 'D14N', 'B', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(319, '3B', 319, 'T3003', 'T3003', '63134-BZ260', 'FRAME, BACK DOOR OPENING, INNER', 1, 76, 2, 2, 100, 4, 200, 'C', 'LEVEL PART', 'D14N', 'D', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(320, '3B', 320, 'T4036', 'T3003', '63134-BZ220', 'FRAME, BACK DOOR OPENING, INNER', 1, 206, 2, 4, 100, 7, 200, 'C', 'LEVEL PART', 'D14N', 'AC', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(321, '2A', 321, 'T2017', 'T2017', '61631-BZ160', 'PANEL, QUARTER WHEEL HOUSE, OUTER RH', 1, 281, 2, 5, 100, 10, 100, 'DP07', 'LEVEL PART', 'D14N', 'A', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(322, '2A', 322, 'T2018', 'T2018', '61632-BZ160', 'PANEL, QUARTER WHEEL HOUSE, OUTER LH', 1, 281, 2, 5, 100, 10, 100, 'DP07', 'LEVEL PART', 'D14N', 'C', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(323, '2A', 323, 'T2040', 'T2017', '61631-BZ180', 'PANEL, QUARTER WHEEL HOUSE, OUTER RH', 1, 0, 2, 0, 100, 0, 100, 'DP07', 'LEVEL PART', 'D14N', 'A', 'ADM P1 ~ ADM KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(324, '2A', 324, 'T2041', 'T2018', '61632-BZ180', 'PANEL, QUARTER WHEEL HOUSE, OUTER LH', 1, 0, 2, 0, 100, 0, 100, 'DP07', 'LEVEL PART', 'D14N', 'C', 'ADM P1 ~ ADM KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(325, '3B', 325, 'T4032', 'T4032', '61745-BZ110', 'REINFORCEMENT, BACK DOOR OPENING,LWR RH', 1, 281, 2, 5, 100, 10, 100, 'C', 'LEVEL PART', 'D14N', 'A', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(326, '3B', 326, 'T4033', 'T4033', '61746-BZ080', 'REINFORCEMENT, BACK DOOR OPENING,LWR LH', 1, 281, 2, 5, 100, 10, 100, 'C', 'LEVEL PART', 'D14N', 'C', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(327, '4A', 327, 'T1001', 'J1021', '55111-BZB10', 'PANEL, DASH', 1, 87, 1, 2, 50, 4, 50, 'D2', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(328, '4A', 328, 'T1002', 'J1021', '55111-BZB20', 'PANEL, DASH', 1, 78, 1, 2, 50, 4, 50, 'D2', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(329, '4A', 329, 'T1003', 'J1021', '55111-BZB30', 'PANEL, DASH ( LHD )', 1, 22, 1, 2, 10, 4, 50, 'D2', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(330, '4A', 330, 'T1004', 'J1021', '55111-BZB40', 'PANEL, DASH ( LHD )', 1, 95, 1, 2, 50, 4, 50, 'D2', 'LEVEL PART', 'D14N', 'ABCD', 'ADM P1 ~ ADM P4 WELD', 'DMUKTICO', '2021-11-11 11:34:18'),
(331, '5A', 331, 'J3004', 'J3001', '63111-BZ300', 'PANEL, ROOF', 1, 20, 4, 6, 12, 7, 12, 'J3001', 'LEVEL PART', 'D17D', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(332, '2A', 332, 'S1007', 'S1007', '57411-BZ250', 'MEMBER, FLOOR SIDE, INNER RH', 1, 67, 4, 6, 40, 10, 40, 'I', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(333, '2A', 333, 'S1008', 'S1008', '57412-BZ320', 'MEMBER, FLOOR SIDE, INNER LH', 1, 67, 4, 6, 40, 10, 40, 'I', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(334, '2A', 334, 'S1009', 'S1007', '57411-BZ330', 'MEMBER, FLOOR SIDE, INNER RH', 1, 112, 4, 10, 40, 14, 40, 'I', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(335, '2A', 335, 'S1010', 'S1008', '57412-BZ400', 'MEMBER, FLOOR SIDE, INNER LH', 1, 112, 4, 10, 40, 14, 40, 'I', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(336, '2A', 336, 'S1011', 'S1011', '57111-BZ270', 'MEMBER, FR SIDE, FR RH', 1, 177, 4, 21, 30, 30, 30, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(337, '2A', 337, 'S1012', 'S1012', '57112-BZ210', 'MEMBER, FR SIDE, FR LH', 1, 177, 4, 21, 30, 31, 30, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(338, '3B', 338, 'S1013', 'S1013', '52131-BZ170', 'REINFORCEMENT, FR BUMPER', 1, 177, 4, 13, 50, 18, 50, 'I', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(339, '3B', 339, 'S2007', 'S2007', '61613-BZ070', 'PANEL, QUARTER, INNER RH', 1, 177, 4, 7, 100, 10, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(340, '3B', 340, 'S2008', 'S2008', '61614-BZ070', 'PANEL, QUARTER, INNER LH', 1, 177, 4, 7, 100, 11, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(341, '3B', 341, 'S2009', 'S2009', '61733-BZ030', 'PANEL, ROOF SIDE, INNER FR RH', 1, 177, 4, 7, 100, 10, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(342, '3B', 342, 'S2010', 'S2010', '61734-BZ030', 'PANEL, ROOF SIDE, INNER FR LH', 1, 177, 4, 7, 100, 10, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(343, '2A', 343, 'S2011', 'S2011', '61771-BZ080', 'FRAME, BACK DOOR OPENING UPR CORNER, RH', 1, 177, 4, 7, 100, 10, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(344, '2A', 344, 'S2012', 'S2012', '61772-BZ060', 'FRAME, BACK DOOR OPENING UPR CORNER, LH', 1, 177, 4, 7, 100, 10, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(345, '2A', 345, 'S4030', 'S4030', '67147-BZ180', 'PANEL, RR DOOR HINGE SIDE, RH', 1, 177, 4, 7, 100, 10, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(346, '2A', 346, 'S4031', 'S4031', '67148-BZ180', 'PANEL, RR DOOR HINGE SIDE, LH', 1, 177, 4, 7, 100, 10, 200, 'C', 'LEVEL PART', 'D55L', 'TEIRYO', 'SAP-KAP', 'DMUKTICO', '2021-11-11 11:34:18'),
(347, '5A', 347, 'A1001', 'A1001', '55111-BZC80', 'PANEL, DASH RHD', 1, 0, 2, 0, 50, 0, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(348, '5A', 348, 'A1002', 'A1001', '55111-BZD40', 'PANEL, DASH RHD', 1, 179, 2, 7, 50, 13, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(349, '5A', 349, 'A1003', 'A1001', '55111-BZD50', 'PANEL, DASH RHD', 1, 171, 2, 6, 50, 11, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(350, '5A', 350, 'A4006', 'A4006', '53812-BZ570', 'PANEL, FR FENDER, LH', 1, 229, 2, 27, 15, 46, 15, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(351, '5A', 351, 'A4010', 'A4006', '53812-BZ590', 'PANEL, FR FENDER, LH', 1, 0, 2, 0, 15, 0, 15, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(352, '5A', 352, 'A4012', 'A4006', '53812-BZ600', 'PANEL, FR FENDER, LH', 1, 0, 2, 0, 15, 0, 15, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(353, '5A', 353, 'A4005', 'A4005', '53811-BZ570', 'PANEL, FR FENDER, RH', 1, 229, 2, 27, 15, 47, 15, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(354, '5A', 354, 'A4009', 'A4005', '53811-BZ590', 'PANEL, FR FENDER, RH', 1, 0, 2, 0, 15, 0, 15, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(355, '5A', 355, 'A4011', 'A4005', '53811-BZ600', 'PANEL, FR FENDER, RH', 1, 0, 2, 0, 15, 0, 15, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(356, '5A', 356, 'A3003', 'A3003', '63132-BZ290', 'PANEL, WINDSHIELD HEADER, INNER', 1, 350, 2, 7, 100, 13, 100, 'D2', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(357, '5A', 357, 'A4019', 'A4019', '67118-BZ010', 'PANEL, BACK DOOR, LWR OUTSIDE', 1, 122, 2, 5, 50, 9, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(358, '5A', 358, 'A4020', 'A4019', '67118-BZ020', 'PANEL, BACK DOOR, LWR OUTSIDE', 1, 229, 2, 8, 50, 14, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(359, '5A', 359, 'A4021', 'A4019', '67118-BZ040', 'PANEL, BACK DOOR, LWR OUTSIDE', 1, 0, 2, 0, 50, 0, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(360, '5A', 360, 'A4022', 'A4022', '67119-BZ040', 'PANEL, BACK DOOR, UPR OUTSIDE', 1, 350, 2, 14, 45, 24, 45, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(361, '4A', 361, 'A2001', 'A2001', '61111-BZB50', 'PANEL, SIDE, OUTER RH', 1, 229, 2, 34, 12, 58, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(362, '4A', 362, 'A2003', 'A2001', '61111-BZB60', 'PANEL, SIDE, OUTER RH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(363, '4A', 363, 'A2005', 'A2001', '61111-BZC70', 'PANEL, SIDE, OUTER RH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(364, '4A', 364, 'A2007', 'A2001', '61111-BZC80', 'PANEL, SIDE, OUTER RH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(365, '4A', 365, 'A2009', 'A2001', '61111-BZC20', 'PANEL, SIDE, OUTER RH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(366, '4A', 366, 'A2002', 'A2002', '61112-BZD40', 'PANEL, SIDE, OUTER LH', 1, 229, 2, 34, 12, 57, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(367, '4A', 367, 'A2004', 'A2002', '61112-BZD50', 'PANEL, SIDE, OUTER LH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(368, '4A', 368, 'A2006', 'A2002', '61112-BZE00', 'PANEL, SIDE, OUTER LH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(369, '4A', 369, 'A2008', 'A2002', '61112-BZE10', 'PANEL, SIDE, OUTER LH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(370, '4A', 370, 'A2010', 'A2002', '61112-BZD60', 'PANEL, SIDE, OUTER LH', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(371, '4A', 371, 'A3001', 'A3001', '63111-BZ320', 'PANEL, ROOF', 1, 229, 2, 34, 12, 57, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(372, '4A', 372, 'A3002', 'A3001', '63111-BZ330', 'PANEL, ROOF', 1, 0, 2, 0, 12, 0, 12, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(373, '4A', 373, 'A1014', 'A1014', '58311-BZ430', 'PAN, RR FLOOR', 1, 350, 1, 8, 40, 23, 40, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(374, '4A', 374, 'A1015', 'A1014', '58311-BZ440', 'PAN, RR FLOOR', 1, 0, 1, 0, 40, 0, 40, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(375, '4A', 375, 'A4041', 'A4041', '67149-BZ590', 'PANEL, BACK DOOR, INSIDE', 1, 313, 1, 6, 50, 17, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(376, '4A', 376, 'A4042', 'A4041', '67149-BZ610', 'PANEL, BACK DOOR, INSIDE', 1, 38, 1, 1, 50, 3, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(377, '2A', 377, 'A2011', 'A2011', '61631-BZ220', 'PANEL, QUARTER WHEEL HOUSE, OUTER RH', 1, 350, 2, 13, 50, 25, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(378, '2A', 378, 'A2012', 'A2012', '61632-BZ220', 'PANEL, QUARTER WHEEL HOUSE, OUTER LH', 1, 350, 2, 13, 50, 25, 50, 'KHS ', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(379, '3B', 379, 'A1006', 'A1006', '57111-BZ290', 'MEMBER, FR SIDE, FR RH', 1, 350, 2, 21, 30, 35, 30, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(380, '3B', 380, 'A1007', 'A1007', '57112-BZ310', 'MEMBER, FR SIDE, FR LH', 1, 350, 2, 21, 30, 35, 30, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(381, '2A', 381, 'A1008', 'A1008', '57411-BZ310', 'MEMBER, FLOOR SIDE, INNER RH', 1, 350, 2, 21, 30, 40, 30, 'I', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(382, '2A', 382, 'A1009', 'A1009', '57412-BZ360', 'MEMBER, FLOOR SIDE, INNER LH', 1, 350, 2, 21, 30, 40, 30, 'I', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(383, '2A', 383, 'A2013', 'A2013', '61731-BZ260', 'PANEL, ROOF SIDE, INNER RH', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(384, '2A', 384, 'A2014', 'A2014', '61732-BZ250', 'PANEL, ROOF SIDE, INNER LH', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(385, '2A', 385, 'A2015', 'A2015', '61745-BZ090', 'REINFORCEMENT, BACK DOOR OPENING, LWR RH', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(386, '2A', 386, 'A2016', 'A2016', '61746-BZ050', 'REINFORCEMENT, BACK DOOR OPENING, LWR LH', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(387, '2A', 387, 'A4031', 'A4031', '67133-BZ100', 'EXTENSION, FR DOOR OUTSIDE PNL REINF, RR', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(388, '2A', 388, 'A4032', 'A4032', '67134-BZ110', 'EXTENSION, FR DOOR OUTS PNL REINF, RR LH', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(389, '2A', 389, 'A4039', 'A4039', '67147-BZ190', 'PANEL, RR DOOR HINGE SIDE, RH', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18'),
(390, '2A', 390, 'A4040', 'A4040', '67148-BZ190', 'PANEL, RR DOOR HINGE SIDE, LH', 1, 350, 2, 4, 200, 7, 200, 'C', 'LEVEL PART', 'D26A', 'ABCD', 'PL1-PL4', 'DMUKTICO', '2021-11-11 11:34:18');

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
(21, 'PPC', 'S-402-0451', 'LPB');

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
(137, 'andonppc_4a', 'andon', 'ppc_4a', '-', 'Andon PPC 4A', 'andon/ppc_4a', '-', 4),
(111, 'mastershop', 'master', 'shop', '-', 'Master Shop', 'master/data', 'tbl_master_shop', 4),
(136, 'andonppc_3b', 'andon', 'ppc_3b', '-', 'Andon PPC 3B', 'andon/ppc_3b', '-', 3),
(135, 'masterfp_docking', 'master', 'fp_docking', '-', 'Master FP Docking', 'master/data', 'tbl_master_fp_docking', 3),
(105, 'masterpress_std', 'master', 'press_std', '-', 'Master Press Std', 'master/data', 'tbl_master_press_std', 1),
(134, 'masterfp_subcont', 'master', 'fp_subcont', '-', 'Master FP Subcont', 'master/data', 'tbl_master_fp_subcont', 2),
(120, 'security-', 'security', '-', 'fa-key', 'Change Password', 'action/password', '-', 100),
(121, 'andon-', 'andon', '-', 'fa-desktop', 'Andon', '-', '-', 1),
(122, 'andonppc_2a', 'andon', 'ppc_2a', '-', 'Andon PPC 2A', 'andon/ppc_2a', '-', 2),
(123, 'stock-', 'stock', '-', 'fa-rocket', 'Input Stock', '-', '-', 1),
(125, 'stockinput_2a', 'stock', 'input_2a', '-', 'Input 2A Line', 'master/transaction', 'tbl_input_2a', 2),
(126, 'stockinput_3b', 'stock', 'input_3b', '-', 'Input 3B Line', 'master/transaction', 'tbl_input_3b', 3),
(127, 'stockinput_4a', 'stock', 'input_4a', '-', 'Input 4A Line', 'master/transaction', 'tbl_input_4a', 4),
(128, 'stockinput_5a', 'stock', 'input_5a', '-', 'Input 5A Line', 'master/transaction', 'tbl_input_5a', 5),
(138, 'andonppc_5a', 'andon', 'ppc_5a', '-', 'Andon PPC 5A', 'andon/ppc_5a', '-', 5),
(139, 'stockinput_subcont', 'stock', 'input_subcont', '-', 'Input Subcont', 'master/transaction', 'tbl_input_subcont', 6),
(140, 'stockinput_docking', 'stock', 'input_docking', '-', 'Input Docking', 'master/transaction', 'tbl_input_docking', 7);

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
(931, 'master-', 'User', 'yes', 'no', 'no', 'no'),
(1357, 'andonppc_4a', 'Administrator', 'yes', 'no', 'no', 'no'),
(1358, 'andonppc_4a', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1344, 'masterfp_subcont', 'User', 'no', 'no', 'no', 'no'),
(1345, 'masterfp_subcont', 'Management', 'no', 'no', 'no', 'no'),
(1209, 'mastershop', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1210, 'mastershop', 'Admin_area', 'no', 'no', 'no', 'no'),
(1211, 'mastershop', 'User', 'no', 'no', 'no', 'no'),
(1356, 'andonppc_3b', 'Received', 'no', 'no', 'no', 'no'),
(1355, 'andonppc_3b', 'Management', 'no', 'no', 'no', 'no'),
(1353, 'andonppc_3b', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1354, 'andonppc_3b', 'User', 'no', 'no', 'no', 'no'),
(1352, 'andonppc_3b', 'Administrator', 'yes', 'no', 'no', 'no'),
(1191, 'masterpress_std', 'Administrator', 'yes', 'no', 'no', 'no'),
(1192, 'masterpress_std', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1193, 'masterpress_std', 'User', 'no', 'no', 'no', 'no'),
(1230, 'system-', 'Received', 'no', 'no', 'no', 'no'),
(1231, 'systemtitle', 'Received', 'no', 'no', 'no', 'no'),
(1232, 'systemgroup', 'Received', 'no', 'no', 'no', 'no'),
(1233, 'systemarea', 'Received', 'no', 'no', 'no', 'no'),
(1234, 'systemlevel', 'Received', 'no', 'no', 'no', 'no'),
(1235, 'systemmenu', 'Received', 'no', 'no', 'no', 'no'),
(1236, 'systemotorisasi', 'Received', 'no', 'no', 'no', 'no'),
(1237, 'systemuser', 'Received', 'no', 'no', 'no', 'no'),
(1238, 'master-', 'Received', 'no', 'no', 'no', 'no'),
(1366, 'andonppc_5a', 'Received', 'no', 'no', 'no', 'no'),
(1342, 'masterfp_subcont', 'Administrator', 'yes', 'no', 'no', 'no'),
(1241, 'mastershop', 'Received', 'no', 'no', 'no', 'no'),
(1343, 'masterfp_subcont', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1245, 'masterpress_std', 'Received', 'no', 'no', 'no', 'no'),
(1246, 'system-', 'Management', 'no', 'no', 'no', 'no'),
(1247, 'systemtitle', 'Management', 'no', 'no', 'no', 'no'),
(1248, 'systemgroup', 'Management', 'no', 'no', 'no', 'no'),
(1249, 'systemarea', 'Management', 'no', 'no', 'no', 'no'),
(1250, 'systemlevel', 'Management', 'no', 'no', 'no', 'no'),
(1251, 'systemmenu', 'Management', 'no', 'no', 'no', 'no'),
(1252, 'systemotorisasi', 'Management', 'no', 'no', 'no', 'no'),
(1253, 'systemuser', 'Management', 'no', 'no', 'no', 'no'),
(1254, 'master-', 'Management', 'no', 'no', 'no', 'no'),
(1365, 'andonppc_5a', 'Management', 'no', 'no', 'no', 'no'),
(1257, 'mastershop', 'Management', 'no', 'no', 'no', 'no'),
(1350, 'masterfp_docking', 'Management', 'no', 'no', 'no', 'no'),
(1351, 'masterfp_docking', 'Received', 'no', 'no', 'no', 'no'),
(1261, 'masterpress_std', 'Management', 'no', 'no', 'no', 'no'),
(1346, 'masterfp_subcont', 'Received', 'no', 'no', 'no', 'no'),
(1347, 'masterfp_docking', 'Administrator', 'yes', 'no', 'no', 'no'),
(1348, 'masterfp_docking', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1349, 'masterfp_docking', 'User', 'no', 'no', 'no', 'no'),
(1275, 'security-', 'Management', 'yes', 'no', 'no', 'no'),
(1274, 'security-', 'User', 'no', 'no', 'no', 'no'),
(1272, 'security-', 'Administrator', 'yes', 'no', 'no', 'no'),
(1273, 'security-', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1276, 'security-', 'Received', 'yes', 'no', 'no', 'no'),
(1277, 'andon-', 'Administrator', 'yes', 'no', 'no', 'no'),
(1278, 'andon-', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1279, 'andon-', 'User', 'no', 'no', 'no', 'no'),
(1280, 'andon-', 'Management', 'yes', 'no', 'no', 'no'),
(1281, 'andon-', 'Received', 'yes', 'no', 'no', 'no'),
(1282, 'andonppc_2a', 'Administrator', 'yes', 'no', 'no', 'no'),
(1283, 'andonppc_2a', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1284, 'andonppc_2a', 'User', 'no', 'no', 'no', 'no'),
(1285, 'andonppc_2a', 'Management', 'yes', 'no', 'no', 'no'),
(1286, 'andonppc_2a', 'Received', 'yes', 'no', 'no', 'no'),
(1287, 'stock-', 'Administrator', 'yes', 'no', 'no', 'no'),
(1288, 'stock-', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1289, 'stock-', 'User', 'no', 'no', 'no', 'no'),
(1290, 'stock-', 'Management', 'no', 'no', 'no', 'no'),
(1291, 'stock-', 'Received', 'no', 'no', 'no', 'no'),
(1299, 'stockinput_2a', 'User', 'no', 'no', 'no', 'no'),
(1297, 'stockinput_2a', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1298, 'stockinput_2a', 'Admin_area', 'yes', 'yes', 'yes', 'yes'),
(1300, 'stockinput_2a', 'Management', 'no', 'no', 'no', 'no'),
(1301, 'stockinput_2a', 'Received', 'no', 'no', 'no', 'no'),
(1302, 'stockinput_3b', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1303, 'stockinput_3b', 'Admin_area', 'yes', 'yes', 'yes', 'yes'),
(1304, 'stockinput_3b', 'User', 'no', 'no', 'no', 'no'),
(1305, 'stockinput_3b', 'Management', 'no', 'no', 'no', 'no'),
(1306, 'stockinput_3b', 'Received', 'no', 'no', 'no', 'no'),
(1307, 'stockinput_4a', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1308, 'stockinput_4a', 'Admin_area', 'yes', 'yes', 'yes', 'yes'),
(1309, 'stockinput_4a', 'User', 'no', 'no', 'no', 'no'),
(1310, 'stockinput_4a', 'Management', 'no', 'no', 'no', 'no'),
(1311, 'stockinput_4a', 'Received', 'no', 'no', 'no', 'no'),
(1312, 'stockinput_5a', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1313, 'stockinput_5a', 'Admin_area', 'yes', 'yes', 'yes', 'yes'),
(1314, 'stockinput_5a', 'User', 'no', 'no', 'no', 'no'),
(1315, 'stockinput_5a', 'Management', 'no', 'no', 'no', 'no'),
(1316, 'stockinput_5a', 'Received', 'no', 'no', 'no', 'no'),
(1364, 'andonppc_5a', 'User', 'no', 'no', 'no', 'no'),
(1359, 'andonppc_4a', 'User', 'no', 'no', 'no', 'no'),
(1360, 'andonppc_4a', 'Management', 'no', 'no', 'no', 'no'),
(1361, 'andonppc_4a', 'Received', 'no', 'no', 'no', 'no'),
(1362, 'andonppc_5a', 'Administrator', 'yes', 'no', 'no', 'no'),
(1363, 'andonppc_5a', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1367, 'stockinput_subcont', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1368, 'stockinput_subcont', 'Admin_area', 'yes', 'yes', 'yes', 'yes'),
(1369, 'stockinput_subcont', 'User', 'no', 'no', 'no', 'no'),
(1370, 'stockinput_subcont', 'Management', 'no', 'no', 'no', 'no'),
(1371, 'stockinput_subcont', 'Received', 'no', 'no', 'no', 'no'),
(1372, 'stockinput_docking', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1373, 'stockinput_docking', 'Admin_area', 'yes', 'yes', 'yes', 'yes'),
(1374, 'stockinput_docking', 'User', 'no', 'no', 'no', 'no'),
(1375, 'stockinput_docking', 'Management', 'no', 'no', 'no', 'no'),
(1376, 'stockinput_docking', 'Received', 'no', 'no', 'no', 'no');

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
('2021-10-23 04:04:26', 'tbl_master_part', 2119, 2119, 2119),
('2021-11-06 08:37:04', 'tbl_master_approval', 15, 15, 15),
('2021-11-11 04:34:18', 'tbl_master_press_std', 390, 390, 391),
('2021-11-13 12:20:15', 'tbl_master_fp_subcont', 202, 202, 203);

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
(2, '56540', 'b2fb06abbe7ea77e4c53cbf7ea3fd15b294', 'DMUKTICO', 56540, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2021-11-16 16:57:03', '2021-11-16 16:57:00', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(14, '3110', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Anda', 3110, NULL, 'Admin', 'Admin_area', 'Admin', 'PRODPRESS', 'foreman', 'B', '2021-11-02 07:56:02', '2021-11-06 15:37:23', '2021-11-06 15:42:22', 'f2040508b309f4716473ff5d2fd8de76ca783cd0'),
(13, '3022', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Tugiman', 3022, NULL, 'Admin', 'Admin_area', 'Admin', 'PRODPRESS', 'foreman', 'A', '2021-11-02 07:55:34', NULL, NULL, '6816654819b7db323a01f9ae1ef3c3e3906484f2'),
(12, '3007', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiyanto', 3007, NULL, 'Admin', 'Admin_area', 'Admin', 'IFP', 'foreman', 'B', '2021-11-01 11:00:22', NULL, NULL, '89f3d7b16c27a055a30d38bca7e7f0ab5542ba31'),
(7, '13293', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Helip Sugiyanto', 13293, NULL, 'Admin', 'Admin_area', 'Admin', 'IRM', 'foreman', 'A', '2021-11-01 10:39:42', '2021-11-12 11:24:14', '2021-11-12 11:24:25', 'e18af650fbe7e37211b7821c58c621c039f8814e'),
(8, '6074', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Dwi Dery Bayuaji', 6074, NULL, 'Admin', 'Admin_area', 'Admin', 'IRM', 'foreman', 'B', '2021-11-01 10:40:23', NULL, NULL, '5fecfb726d886a9dab9e0cf3d0e23763852f3644'),
(9, '23817', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiarto', 23817, NULL, 'Admin', 'Admin_area', 'Admin', 'IFP', 'foreman', 'A', '2021-11-01 10:41:02', '2021-11-04 09:44:56', '2021-11-04 09:45:05', '442a51d14f1917ba0ef8b1a4adeed35b2db170fb'),
(10, '9404', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Saifullah', 9404, NULL, 'Admin', 'Admin_area', 'Admin', 'IFP', 'foreman', 'B', '2021-11-01 10:41:45', NULL, NULL, '635f2d4dff80d7860dc816462c567d642138de10'),
(11, '3216', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Aris Senjaya', 3216, NULL, 'Admin', 'Admin_area', 'Admin', 'IFP', 'foreman', 'A', '2021-11-01 10:42:17', NULL, NULL, '05a6138f890eaede3f6df558adf702a8baaeabcc'),
(16, '3122', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Dede Heri', 3122, NULL, 'Admin', 'Admin_area', 'Admin', 'PRODPRESS', 'foreman', 'B', '2021-11-02 07:57:10', NULL, NULL, 'b900ddc713dea5efb88a160885aba4645ea272c1'),
(17, '3229', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Joko Setiyarso', 3229, NULL, 'Admin', 'Admin_area', 'Admin', 'PRODPRESS', 'foreman', 'A', '2021-11-02 07:57:56', NULL, NULL, '61e1da4afb23179a6378d40b1e8834cea368394f'),
(18, '18145', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Joko Hartono', 18145, NULL, 'Admin', 'Admin_area', 'Admin', 'PRODSUPPORT', 'foreman', 'N', '2021-11-02 07:58:20', NULL, NULL, '60bae057c771e17a15ba2f500095a03b572d128b'),
(19, '3347', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Aris Mulyanto', 3347, NULL, 'Admin', 'Admin_area', 'Admin', 'PRODPRESS', 'foreman', 'A', '2021-11-02 07:58:58', NULL, NULL, '4de75b285dd260d67e7cabb2c44255baa5ac6025'),
(20, '6067', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Prasetyo Utomo', 6067, NULL, 'Admin', 'Admin_area', 'Admin', 'PRODWELD', 'foreman', 'A', '2021-11-02 08:00:05', NULL, NULL, 'd32d3781bf314c7e5911214811d7584d0f184681'),
(21, '22380', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Purnama Sidhi', 22380, NULL, 'Admin', 'Received', 'Admin', 'GA', 'supervisor', 'N', '2021-11-02 08:32:25', '2021-11-06 15:51:55', '2021-11-06 14:36:45', '80e6af32bce29014d76a30ee7a389e0d103229c6'),
(22, '41536', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Idhar Rifai', 41536, NULL, 'Admin', 'Received', 'Admin', 'GA', 'foreman', 'N', '2021-11-02 08:32:58', NULL, NULL, 'fdc6e9736422cef4f5426cf153a2262dfac7b601'),
(23, '20496', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Budiono', 20496, NULL, 'Admin', 'Received', 'Admin', 'MDIC', 'foreman', 'N', '2021-11-02 08:34:11', NULL, NULL, '200d5c82e268b27df95b4dbcface3a22d12773b0'),
(24, '71892', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Roy Nurandre Nugroho', 71892, NULL, 'Admin', 'Received', 'Admin', 'MDIC', 'foreman', 'N', '2021-11-02 08:34:36', '2021-11-10 08:14:08', '2021-11-04 14:24:51', '321b5892509c36c367ebe6fce341b00dd39fffb7'),
(25, '21053', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Reno Estenfiyanto', 21053, NULL, 'Admin', 'Received', 'Admin', 'MDIC', 'member', 'N', '2021-11-02 08:35:05', NULL, NULL, 'e308862790c66370f0d78916d9d08a28464a40f9'),
(26, '70996', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'M. Ainur Rahman', 70996, NULL, 'Admin', 'Received', 'Admin', 'MDIC', 'member', 'N', '2021-11-02 08:35:49', NULL, NULL, '58defb1736ecadd205c5c5c70aaf9ceff3431fd4'),
(27, '18560', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Cucu Juanda', 18560, NULL, 'Admin', 'Received', 'Admin', 'MDIC', 'member', 'N', '2021-11-02 08:36:20', NULL, NULL, '6e5536289aea16cde4cc8f83a531db06270a54ec'),
(28, '39651', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Rizal  Nurudin', 39651, NULL, 'Admin', 'Received', 'Admin', 'MDIC', 'member', 'N', '2021-11-02 08:37:02', NULL, NULL, '1381c714a4bb5674a3676b3ab5a4a4d1caeffd73'),
(29, '6461', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Moch. Amin', 6461, NULL, 'Admin', 'Management', 'Admin', 'PRESS', 'divisi', 'N', '2021-11-02 08:40:43', '2021-11-10 17:07:03', '2021-11-10 17:07:06', 'ae8ccc51a688872c9e864745899976c07f84f5a9'),
(30, '68674', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Mamoru Yamada', 68674, NULL, 'Admin', 'Management', 'Admin', 'PRESS', 'divisi', 'N', '2021-11-02 08:52:04', NULL, NULL, 'dcb447ea99a4cbe72de5c8526f2f435e25f3abd4'),
(31, '2564', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Andreas Harsono', 2564, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:55:43', NULL, NULL, 'ca6127548f5d554e88006c7a6e69682a9c6727d9'),
(32, '22474', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Didik Prastowo', 22474, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:56:06', '2021-11-10 16:55:29', '2021-11-10 16:55:38', '138d7f9cd1c003484174b577fe28cd7161b9cab7'),
(33, '3218', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Bambang Hermawan', 3218, NULL, 'Admin', 'Management', 'Admin', 'WHPRESS', 'supervisor', 'N', '2021-11-02 08:57:08', '2021-11-10 16:55:46', '2021-11-10 16:55:51', 'bc03166632967c7ea253e800719706e4d055de6a'),
(34, '3109', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sucipto', 3109, NULL, 'Admin', 'Received', 'Admin', 'MDIC', 'supervisor', 'N', '2021-11-02 09:00:36', '2021-11-06 15:45:01', '2021-11-06 15:51:42', '186bd26bb671a4f327316db63c9b3f3643c21e1e'),
(35, '48778', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Bayu Hidayat', 48778, NULL, 'Admin', 'Management', 'Admin', 'LPP', 'supervisor', 'N', '2021-11-02 09:01:53', NULL, NULL, '497bc892d83c0d02639cab080c5bfaad3c33f2f9'),
(36, '65597', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Gita Yoan S. U.', 65597, NULL, 'Admin', 'Management', 'Admin', 'PPC', 'supervisor', 'N', '2021-11-02 09:03:15', NULL, NULL, 'a565b3324b2cf8065a7ccfa0d225565678e65fd9'),
(37, '31295', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Marhendra Pradipta', 31295, NULL, 'Admin', 'Management', 'Admin', 'PRODUCTION', 'manager', 'N', '2021-11-02 09:03:42', '2021-11-06 15:43:35', '2021-11-06 15:43:58', 'bda36d303509f8bf056888b6a98c9100d60f0a0c'),
(38, '2998', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Ambari', 2998, NULL, 'Admin', 'Management', 'Admin', 'PRODPRESS', 'supervisor', 'A', '2021-11-02 09:05:18', NULL, NULL, '2550c616630026408a6c95f582e5dd9e3d50b9c3'),
(39, '3084', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Muhammad Nurcholis', 3084, NULL, 'Admin', 'Management', 'Admin', 'PRODWELD', 'supervisor', 'A', '2021-11-02 09:05:43', NULL, NULL, '6955f56d6b6efb4063f6dfce88058cf45ac9f94e'),
(40, '3095', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Suharmanto', 3095, NULL, 'Admin', 'Management', 'Admin', 'PRODWELD', 'supervisor', 'B', '2021-11-02 09:06:21', NULL, NULL, '541b7c2188367671edccee54686e364fcfa98cc6'),
(41, '3064', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Hariadi', 3064, NULL, 'Admin', 'Management', 'Admin', 'PRODPRESS', 'supervisor', 'B', '2021-11-02 09:06:46', '2021-11-06 15:42:48', '2021-11-06 15:43:15', '24bd60326669c00e546b14925f6b8f40fef84d8e'),
(42, '66730', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Muhammad Fachmi Alfarizi', 66730, NULL, 'Admin', 'Management', 'Admin', 'PRODSUPPORT', 'supervisor', 'N', '2021-11-02 09:07:12', NULL, NULL, '0160a3bb9a7085cae76d846f1221cdf6b4cb44de'),
(47, '35468', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'I Putu Bayu Perdana Subagia', 35468, NULL, 'Admin', 'Management', 'Admin', 'PE', 'manager', 'N', '2021-11-02 09:10:03', NULL, NULL, 'b0e89928a37e0dba14219df86e332248d48db61a'),
(48, '63333', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Ahmad Hafizh Abdussalam', 63333, NULL, 'Admin', 'Management', 'Admin', 'PE', 'supervisor', 'N', '2021-11-02 09:11:13', NULL, NULL, '12fded0f474b329d7ff9f37abda1b3ae7d140400'),
(49, '20704', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Eko Rifai', 20704, NULL, 'Admin', 'Management', 'Admin', 'PE', 'supervisor', 'N', '2021-11-02 09:11:40', NULL, NULL, '9080b2e0802906e4edd9b150fcf09c22813ed97b'),
(50, '60972', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Amelia Safira Yani', 60972, NULL, 'Admin', 'Management', 'Admin', 'PE', 'supervisor', 'N', '2021-11-02 09:12:06', NULL, NULL, 'c2daf5a615524f89f5015089fe683427f52fefac'),
(51, '24291', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Faizal Mahdar', 24291, NULL, 'Admin', 'Management', 'Admin', 'DTMM', 'manager', 'N', '2021-11-02 09:12:41', NULL, NULL, 'a3e73b9d82b5d8285dafba1ffde71d4686389201'),
(52, '27905', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'G. Aji Surya Wicaksono', 27905, NULL, 'Admin', 'Management', 'Admin', 'DIEMAINTENANCE', 'supervisor', 'N', '2021-11-02 09:14:18', NULL, NULL, '7904f4c3c2085f8eb4adf13a4f095f09fbedff1d'),
(53, '58973', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Rendy Arminda Putra', 58973, NULL, 'Admin', 'Management', 'Admin', 'DIEMAKING', 'supervisor', 'N', '2021-11-02 09:14:54', NULL, NULL, 'b40b7030d797ed8c59c8c70a421985cb69304721'),
(54, '12842', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Agus Purnawan', 12842, NULL, 'Admin', 'Admin_area', 'Admin', 'DIEMAKING', 'foreman', 'N', '2021-11-02 14:04:36', '2021-11-10 16:23:11', '2021-11-10 16:23:34', 'a2897380e5772d092c586bcd8756769444bcd2c3'),
(55, '3103', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sigit Sugito', 3103, NULL, 'Admin', 'Admin_area', 'Admin', 'DIEMAINTENANCE', 'foreman', 'N', '2021-11-02 14:05:03', NULL, NULL, '249a4c50a284bb22a098812f28cfc2d07d895658');

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
('10.59.37.118', '321b5892509c36c367ebe6fce341b00dd39fffb7', '2021-11-10 01:14:08');

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
-- Indexes for table `tbl_input_2a`
--
ALTER TABLE `tbl_input_2a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_3b`
--
ALTER TABLE `tbl_input_3b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_4a`
--
ALTER TABLE `tbl_input_4a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_5a`
--
ALTER TABLE `tbl_input_5a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_docking`
--
ALTER TABLE `tbl_input_docking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_input_subcont`
--
ALTER TABLE `tbl_input_subcont`
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
-- Indexes for table `tbl_master_fp_subcont`
--
ALTER TABLE `tbl_master_fp_subcont`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_press_std`
--
ALTER TABLE `tbl_master_press_std`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `tbl_input_2a`
--
ALTER TABLE `tbl_input_2a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_input_3b`
--
ALTER TABLE `tbl_input_3b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_input_4a`
--
ALTER TABLE `tbl_input_4a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_input_5a`
--
ALTER TABLE `tbl_input_5a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_input_docking`
--
ALTER TABLE `tbl_input_docking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_input_subcont`
--
ALTER TABLE `tbl_input_subcont`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ip_address`
--
ALTER TABLE `tbl_ip_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_master_fp_subcont`
--
ALTER TABLE `tbl_master_fp_subcont`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_master_press_std`
--
ALTER TABLE `tbl_master_press_std`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `tbl_menu_user`
--
ALTER TABLE `tbl_menu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1377;

--
-- AUTO_INCREMENT for table `tbl_title`
--
ALTER TABLE `tbl_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

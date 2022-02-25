-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2022 at 05:47 AM
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
-- Dumping data for table `tbl_input_general`
--

INSERT INTO `tbl_input_general` (`id`, `job_no`, `part_no`, `part_name`, `maks_shift`, `ps`, `patan`, `t_t`, `shift`, `shop_name`, `sto_p1`, `sto_p4`, `sto_kap`, `sto_ppl`, `sto_process`, `ss_p1`, `ss_p4`, `ss_kap`, `ss_ppl`, `ss_process`, `area`, `proses`, `model`, `machine`, `create_by`, `create_date`) VALUES
(1, 'A-1006', '57111-BZ290-00', 'A-1006, MEMBER, FR SIDE, FR RH/LH', 388, 'ABCD', 'ABCD', 1, 'B', 'WH Door Assy', 300, 0, 0, 0, 0, '6', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '3B', 'Sugiyanto', '2021-12-16 08:34:43'),
(2, 'A-4022', '67119-BZ040-00', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 388, 'ABCD', 'ABCD', 1, 'B', 'WH Door Assy', 130, 0, 0, 0, 0, '3', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '5A', 'Sugiyanto', '2021-12-16 08:34:31'),
(3, 'A-1014', '58311-BZ430-00', 'A-1014, PAN, REAR FLOOR', 388, 'ABCD', 'B', 1, 'N', 'IFP', 360, NULL, NULL, NULL, NULL, '7', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-14 16:10:09'),
(4, 'A-1002', '55111-BZD40-00', 'A-1002, PANEL, DASH', 219, 'ABCD', 'B', 2, 'N', 'IFP', 250, NULL, NULL, NULL, NULL, '9', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:10:09'),
(5, 'A-4041', '67149-BZ590-00', 'A-4041, PANEL, BACK DOOR, INSIDE', 345, 'ABCD', 'B', 1, 'N', 'IFP', 450, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-14 16:10:09'),
(6, 'A-1007', '57112-BZ310-00', 'A-1007, MEMBER, FR SIDE, FR LH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 480, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '3B', 'DMUKTICO', '2021-12-14 16:10:09'),
(7, 'A-4031', '67133-BZ100-00', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 388, 'ABCD', 'B', 1, 'N', 'IFP', 550, NULL, NULL, NULL, NULL, '11', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:10:09'),
(8, 'A-1003', '55111-BZD50-00', 'A-1003, PANEL, DASH', 171, 'ABCD', 'B', 3, 'N', 'IFP', 250, NULL, NULL, NULL, NULL, '12', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:10:09'),
(9, 'A-2001', '61111-BZB50-00', 'A-2001, PANEL SIDE OUTER RH', 235, 'ABCD', 'B', 2, 'N', 'IFP', 300, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-14 16:10:09'),
(10, 'A-4020', '67118-BZ020-00', 'A-4020, PANEL, BACK DOOR, LWR OUTSIDE', 235, 'ABCD', 'B', 2, 'N', 'IFP', 376, NULL, NULL, NULL, NULL, '13', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:10:09'),
(11, 'A-1008', '57411-BZ310-00', 'A-1008, MEMBER, FLOOR SIDE, INNER RH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 600, NULL, NULL, NULL, NULL, '12', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:10:09'),
(12, 'A-4032', '67134-BZ110-00', 'A-4032, EXT,FR DOOR OUTS PNL REINF,RR LH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 600, NULL, NULL, NULL, NULL, '12', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:10:09'),
(13, 'A-4005', '53811-BZ570-00', 'A-4005, PANEL, FR FENDER, RH', 235, 'ABCD', 'B', 2, 'N', 'IFP', 420, NULL, NULL, NULL, NULL, '14', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:10:09'),
(14, 'A-1009', '57412-BZ360-00', 'A-1009, MEMBER, FLOOR SIDE, INNER RH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 690, NULL, NULL, NULL, NULL, '14', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:10:09'),
(15, 'A-2016', '61746-BZ050-00', 'A-2016, REINF, BACK DOOR OPENING, LWR LH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 700, NULL, NULL, NULL, NULL, '14', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_input_ppc`
--

CREATE TABLE `tbl_input_ppc` (
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

INSERT INTO `tbl_input_ppc` (`id`, `job_no`, `part_no`, `part_name`, `maks_shift`, `ps`, `patan`, `t_t`, `shift`, `shop_name`, `sto_p1`, `sto_p4`, `sto_kap`, `sto_ppl`, `sto_process`, `ss_p1`, `ss_p4`, `ss_kap`, `ss_ppl`, `ss_process`, `area`, `proses`, `model`, `machine`, `create_by`, `create_date`) VALUES
(1, 'A-4022', '67119-BZ040-00', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 403, 'ABCD', 'D', 1, 'N', 'IFP', 130, NULL, NULL, NULL, NULL, '3', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-24 15:49:15'),
(2, 'A-1014', '58311-BZ430-00', 'A-1014, PAN, REAR FLOOR', 403, 'ABCD', 'D', 1, 'N', 'IFP', 360, NULL, NULL, NULL, NULL, '7', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-24 15:49:15'),
(3, 'A-1002', '55111-BZD40-00', 'A-1002, PANEL, DASH', 222, 'ABCD', 'D', 2, 'N', 'IFP', 250, NULL, NULL, NULL, NULL, '9', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-24 15:49:15'),
(4, 'A-4041', '67149-BZ590-00', 'A-4041, PANEL, BACK DOOR, INSIDE', 379, 'ABCD', 'D', 1, 'N', 'IFP', 450, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-24 15:49:15'),
(5, 'A-1007', '57112-BZ310-00', 'A-1007, MEMBER, FR SIDE, FR LH', 403, 'ABCD', 'D', 1, 'N', 'IFP', 480, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '3B', 'DMUKTICO', '2021-12-24 15:49:15'),
(6, 'A-4031', '67133-BZ100-00', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 403, 'ABCD', 'D', 1, 'N', 'IFP', 550, NULL, NULL, NULL, NULL, '11', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-24 15:49:15'),
(7, 'A-1003', '55111-BZD50-00', 'A-1003, PANEL, DASH', 182, 'ABCD', 'D', 3, 'N', 'IFP', 250, NULL, NULL, NULL, NULL, '11', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-24 15:49:15');

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
(28, 'WH Docking', 'Admin', 'Admin'),
(27, 'PPC', 'Admin', 'Admin'),
(30, 'WH Door Assy', 'Admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_part`
--

CREATE TABLE `tbl_master_part` (
  `id` int(11) NOT NULL,
  `job_no` varchar(30) DEFAULT NULL,
  `part_no` varchar(30) DEFAULT NULL,
  `part_name` varchar(50) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `proses` varchar(20) DEFAULT NULL,
  `pcs_month` int(11) DEFAULT NULL,
  `maks_shift` int(11) DEFAULT NULL,
  `machine` varchar(30) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `patan` varchar(10) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_part`
--

INSERT INTO `tbl_master_part` (`id`, `job_no`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `maks_shift`, `machine`, `model`, `patan`, `create_by`, `create_date`) VALUES
(1, 'J2084', '61111-BZA60   ', 'J-2084, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 60, 2, '4A', 'D17D', 'TEIRYO', 'DMUKTICO', '2022-01-14 09:11:46'),
(2, 'J2057', '61112-BZ581', 'J-2057, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 60, 5, '4A', 'D17D', 'TEIRYO', 'DMUKTICO', '2022-01-14 09:11:46'),
(3, 'K2122', '61613-BZ093', 'K-2122, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 1612, 41, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(4, 'K2124', '61613-BZ103', 'K-2124, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 1090, 28, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(5, 'K2126', '61613-BZ123', 'K-2126, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 479, 13, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(6, 'K2128', '61613-BZ142', 'K-2128, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 167, 5, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(7, 'K2123', '61614-BZ093', 'K-2123, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 1230, 31, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(8, 'K2125', '61614-BZ103', 'K-2125, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 1569, 40, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(9, 'K2127', '61614-BZ123', 'K-2127, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 382, 10, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(10, 'K2129', '61614-BZ142', 'K-2129, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 167, 5, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(11, 'K3008', '63111-BZ021', 'K-3008, PANEL, ROOF', 'WH Docking', 'Inhouse', 1578, 40, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(12, 'K3003', '63111-BZ140', 'K-3003, PANEL, ROOF', 'WH Docking', 'Inhouse', 382, 10, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(13, 'K3010', '63111-BZ171', 'K-3010, PANEL, ROOF', 'WH Docking', 'Inhouse', 1388, 36, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(14, 'K4051', '67149-BZ210', 'K-4051,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', 167, 5, '4A', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(15, 'K2113', '61111-BZ331', 'K-2113, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 3591, 91, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(16, 'K2114', '61111-BZ341', 'K-2114, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 454, 12, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(17, 'K2115', '61111-BZ361', 'K-2115, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 241, 7, '4A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(18, 'K2136', '61112-BZC90', 'K-2136, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 3591, 91, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(19, 'K2137', '61112-BZD00', 'K-2137, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 454, 12, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(20, 'K2138', '61112-BZD10', 'K-2138, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 241, 7, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(21, 'K2116', '61111-BZ241', 'K-2116, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 1130, 29, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(22, 'K2117', '61111-BZ251', 'K-2117, PANEL SIDE OUTER RH', 'WH Docking', 'Inhouse', 530, 14, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(23, 'K2118', '61111-BZ282', 'K-2118, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 100, 3, '4A', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(24, 'K2119', '61111-BZ302', 'K-2119, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 942, 24, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(25, 'K2120', '61111-BZ322', 'K-2120, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 479, 13, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(26, 'K2121', '61111-BZ701', 'K-2121, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 167, 5, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(27, 'K2132', '61112-BZC40', 'K-2132, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 1130, 29, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(28, 'K2133', '61112-BZC50', 'K-2133, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 530, 14, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(29, 'K2140', '61112-BZD20', 'K-2140, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 167, 5, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(30, 'K2139', '61112-BZC80', 'K-2139, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 100, 3, '4A', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(31, 'K2134', '61112-BZC60', 'K-2134, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 942, 24, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(32, 'K2135', '61112-BZC70', 'K-2135, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 479, 13, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(33, 'J3004', '63111-BZ300', 'J-3004, PANEL, ROOF', 'WH Docking', 'Inhouse', 60, 2, '4A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(34, 'T2043', '61111-BZA00', 'T-2043, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 9849, 247, '4A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(35, 'T2045', '61111-BZA10', 'T-2045, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 1531, 39, '4A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(36, 'T2002', '61112-BZB00', 'T-2002, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 9849, 247, '4A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(37, 'T2004', '61112-BZB10', 'T-2004, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 1531, 39, '4A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(38, 'T3001', '63111-BZ290', 'T-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 11380, 285, '4A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(39, 'K2053', '61611-BZ181', 'K-2053, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 1230, 31, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(40, 'K2055', '61611-BZ201', 'K-2055, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 1421, 37, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(41, 'K2079', '61611-BZ241', 'K-2079, PANEL QUARTER, RH', 'WH Docking', 'Inhouse', 530, 14, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(42, 'K2104', '61611-BZ330', 'K-2104, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 167, 5, '4A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(43, 'K2054', '61612-BZ191', 'K-2054, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 1230, 31, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(44, 'K2056', '61612-BZ211', 'K-2056, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 1421, 37, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(45, 'K2080', '61612-BZ251', 'K-2080, PANEL QUARTER, LH', 'WH Docking', 'Inhouse', 530, 14, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(46, 'K2105', '61612-BZ360', 'K-2105, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 167, 5, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(47, 'K4013', '67113-BZ140', 'K-4013,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 530, 14, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(48, 'K4015', '67113-BZ150', 'K-4015,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 1421, 37, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(49, 'K4017', '67113-BZ160', 'K-4017,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 1230, 31, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(50, 'K4074', '67113-BZ350', 'K-4074;PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 167, 5, '4A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(51, 'K4014', '67114-BZ140', 'K-4014,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 530, 14, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(52, 'K4016', '67114-BZ150', 'K-4016,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 1421, 37, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(53, 'K4018', '67114-BZ160', 'K-4018,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 1230, 31, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(54, 'K4075', '67114-BZ350', 'K-4075;PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 167, 5, '4A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(55, 'K4070', '53311-BZ220', 'K-4070;PANEL, HOOD', 'WH Door Assy', 'Outhouse', 167, 5, '4A', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(56, 'J1042', '55111-BZ721', 'J-1042, PANEL, DASH', 'WH Docking', 'Inhouse', 60, 2, '4A', 'D17D', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(57, 'T1001', '55111-BZB10', 'T-1001, PANEL, DASH', 'WH Docking', 'Inhouse', 3917, 99, '4A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(58, 'T1002', '55111-BZB20', 'T-1002, PANEL, DASH', 'WH Docking', 'Inhouse', 3263, 82, '4A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(59, 'T1003', '55111-BZB30', 'T-1003, PANEL, DASH', 'WH Docking', 'Inhouse', 612, 16, '4A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(60, 'T1004', '55111-BZB40', 'T-1004, PANEL, DASH', 'WH Docking', 'Inhouse', 3588, 90, '4A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(61, 'A2001', '61111-BZB50', 'A-2001, PANEL SIDE OUTER RH', 'WH Docking', 'Inhouse', 9376, 235, '4A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(62, 'A2002', '61112-BZD40', 'A-2002, PANEL SIDE OUTER LH', 'WH Docking', 'Inhouse', 9376, 235, '4A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(63, 'A3001', '63111-BZ320', 'A-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 9376, 235, '4A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(64, 'A1014', '58311-BZ430', 'A-1014, PAN, REAR FLOOR', 'WH Docking', 'Inhouse', 16387, 449, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2022-01-14 09:11:46'),
(65, 'A1015', '58311-BZ440', 'A-1015, PAN, REAR FLOOR', 'WH Docking', 'Inhouse', 950, 44, '4A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(66, 'A4041', '67149-BZ590', 'A-4041, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 15566, 404, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2022-01-14 09:11:46'),
(67, 'A4042', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 1771, 45, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2022-01-14 09:11:46'),
(68, 'K1130', '65621-BZ020', 'K-1130,PANEL, SIDE GATE, RH', 'WH Docking', 'Inhouse', 683, 17, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2022-01-14 09:11:46'),
(69, 'K1131', '65622-BZ020', 'K-1131,PANEL, SIDE GATE, LH', 'WH Docking', 'Inhouse', 683, 17, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2022-01-14 09:11:46'),
(70, 'K1132', '65751-BZ020', 'K-1132,PANEL, TAIL GATE', 'WH Docking', 'Inhouse', 683, 17, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2022-01-14 09:11:46'),
(71, 'K4005', '53811-BZ172', 'K-4005, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 5351, 137, '2A', 'D40D', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(72, 'K4007', '53811-BZ182', 'K-4007, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 2116, 56, '2A', 'D40D', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(73, 'K4006', '53812-BZ172', 'K-4006, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 5351, 137, '2A', 'D40D', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(74, 'K4008', '53812-BZ182', 'K-4008, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 2116, 56, '2A', 'D40D', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(75, 'T2018', '61632-BZ160', 'T-2018, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(76, 'T2017', '61631-BZ160', 'T-2017, PANEL, QTR WHEEL HOUSE, OUTER RH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(77, 'T2013', '61345-BZ150', 'T-2013, PILLAR, CTR BODY, INNER LWR RH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(78, 'T2014', '61346-BZ150', 'T-2014, PILLAR, CTR BODY, INNER LWR LH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(79, 'T2010', '61248-BZ090', 'T-2010, REINF, ROOF SIDE RAIL, INNER LH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(80, 'T2011', '61343-BZ200', 'T-2011, PILLAR, CTR BODY, INNER RH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(81, 'T2012', '61344-BZ210', 'T-2012, PILLAR, CTR BODY, INNER LH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(82, 'T2041', '61632-BZ180', 'T-2041, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 0, 1, '2A', 'D14N', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(83, 'S1007', '57411-BZ250', 'S-1007, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 2502, 63, '2A', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(84, 'S1008', '57412-BZ320', 'S-1008, MEMBER, FLOOR SIDE, INNER LH', 'WH Docking', 'Inhouse', 2502, 63, '2A', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(85, 'S1009', '57411-BZ330', 'S-1009, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 4415, 110, '2A', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(86, 'S1010', '57412-BZ400', 'S-1010, MEMBER, FLOOR SIDE, INNER LH', 'WH Docking', 'Inhouse', 4415, 110, '2A', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(87, 'S1011', '57111-BZ270', 'S-1011, MEMBER, FR SIDE, FR RH', 'WH Docking', 'Inhouse', 6917, 174, '2A', 'D55L', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(88, 'S1012', '57112-BZ210', 'S-1012, MEMBER, FR SIDE, FR LH', 'WH Docking', 'Inhouse', 6917, 174, '2A', 'D55L', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(89, 'S2011', '61771-BZ080', 'S-2011,FRAME,BACKDOOR OPEN UPR CORNER,RH', 'WH Docking', 'Inhouse', 6917, 174, '2A', 'D55L', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(90, 'S2012', '61772-BZ060', 'S-2012,FRAME,BACKDOOR OPEN UPR CORNER,LH', 'WH Docking', 'Inhouse', 6917, 174, '2A', 'D55L', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(91, 'S4030', '67147-BZ180', 'S4030, PANEL, RR DOOR HINGE SIDE, RH', 'WH Docking', 'Inhouse', 6917, 174, '2A', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(92, 'S4031', '67148-BZ180', 'S4031, PANEL, RR DOOR HINGE SIDE, LH', 'WH Docking', 'Inhouse', 6917, 174, '2A', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(93, 'T2007', '61161-BZ260', 'T-2007, PILLAR, FR BODY, INNER RH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(94, 'T2008', '61162-BZ280', 'T-2008, PILLAR, FR BODY, INNER LH', 'WH Docking', 'Inhouse', 11380, 285, '2A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(95, 'A1008', '57411-BZ310', 'A-1008, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 14283, 360, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(96, 'A1009', '57412-BZ360', 'A-1009, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 14283, 360, '2A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(97, 'A1010', '57411-BZ310', 'A-1010, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 3054, 140, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(98, 'A1011', '57412-BZ360', 'A-1011, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 3054, 140, '2A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(99, 'A2013', '61731-BZ260', 'A-2013, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 17337, 449, '2A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(100, 'A2014', '61732-BZ250', 'A-2014, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 17337, 449, '2A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(101, 'A2015', '61745-BZ090', 'A-2015, REINF, BACK DOOR OPENING, LWR RH', 'WH Docking', 'Inhouse', 17337, 449, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(102, 'A2016', '61746-BZ050', 'A-2016, REINF, BACK DOOR OPENING, LWR LH', 'WH Docking', 'Inhouse', 17337, 449, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(103, 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 17337, 449, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(104, 'A4040', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 17337, 449, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(105, 'A4031', '67133-BZ100', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 'WH Door Assy', 'Inhouse', 17337, 449, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(106, 'A4032', '67134-BZ110', 'A-4032, EXT,FR DOOR OUTS PNL REINF,RR LH', 'WH Door Assy', 'Inhouse', 17337, 449, '2A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(107, 'K4045', '67145-BZ050', 'K-4045,PANEL, FR DOOR HINGE SIDE,RH', 'WH Door Assy', 'Inhouse', 5518, 139, '2A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(108, 'K4046', '67146-BZ050', 'K-4046, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 5518, 139, '2A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(109, 'K4047', '67145-BZ060', 'K-4047,PANEL, FR DOOR HINGE SIDE,RH', 'WH Door Assy', 'Inhouse', 2116, 54, '2A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(110, 'K4048', '67146-BZ060', 'K-4048, PANEL, FR DOOR HINGE SIDE,LH', 'WH Door Assy', 'Inhouse', 2116, 53, '2A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(111, 'T2005', '61175-BZ150', 'T-2005, REIN FR BODY PLR,UPR OUT NO.2 RH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(112, 'T2006', '61176-BZ150', 'T-2006, REIN FR BODY PLR,UPR OUT NO.2 LH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(113, 'T2007', '61161-BZ260', 'T-2007, PILLAR, FR BODY, INNER RH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(114, 'T2008', '61162-BZ280', 'T-2008, PILLAR, FR BODY, INNER LH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(115, 'T2009', '61247-BZ090', 'T-2009, REINF, ROOF SIDE RAIL, INNER RH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(116, 'T2010', '61248-BZ090', 'T-2010, REINF, ROOF SIDE RAIL, INNER LH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(117, 'T2015', '61433-BZ190', 'T-2015, REINFORCEMENT, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(118, 'T2016', '61434-BZ180', 'T-2016, REINFORCEMENT, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(119, 'T4023', '67147-BZ170', 'T-4023, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(120, 'T4024', '67148-BZ170', 'T-4024, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(121, 'K1017', '55741-BZ150', 'K-1017,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 2116, 53, '3B', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(122, 'K1119', '55741-BZ200', 'K-1119,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 5368, 135, '3B', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(123, 'K1016', '55741-BZ130', 'K-1016,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 150, 5, '3B', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(124, 'T1005', '55741-BZ510', 'T-1005, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 7180, 181, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(125, 'T1006', '55741-BZ520', 'T-1006, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 4200, 106, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(126, 'T4021', '67135-BZ090', 'T-4021, EXT,RR DOOR OUTSIDE REINFORCE,RH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(127, 'T4022', '67136-BZ070', 'T-4022, EXT,RR DOOR OUTSIDE REINFORCE,LH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(128, 'T4032', '61745-BZ110', 'T-4032, REINF, BACK DOOR OPENING, LWR RH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(129, 'T4033', '61746-BZ080', 'T-4033, REINF, BACK DOOR OPENING, LWR LH', 'WH Docking', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(130, 'K4003', '53321-BZ130', 'K-4003,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 5351, 139, '3B', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(131, 'K4004', '53321-BZ140', 'K-4004,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 2116, 55, '3B', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(132, 'T3003', '63134-BZ260', 'T-3003, FRAME, BACK DOOR OPENING, INNER', 'WH Docking', 'Inhouse', 2847, 71, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(133, 'T4036', '63134-BZ220', 'T-4036, FRAME, BACK DOOR OPENING, INNER', 'WH Docking', 'Inhouse', 8533, 214, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(134, 'GBJ0030', '58372-BZ100', 'GBJ-0030, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Inhouse', 60, 2, '3B', 'D17D', 'TEIRYO', 'DMUKTICO', '2022-01-14 09:11:46'),
(135, 'GBJ0031', '58372-BZ110', 'GBJ-0031, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Inhouse', 0, 1, '3B', 'D17D', 'TEIRYO', 'DMUKTICO', '2022-01-14 09:11:46'),
(136, 'S1013', '52131-BZ170', 'S-1013, REINFORCEMENT, FR BUMPER', 'WH Docking', 'Inhouse', 6917, 174, '3B', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(137, 'S2007', '61613-BZ070', 'S-2007, PANEL, QUARTER, INNER RH', 'WH Docking', 'Inhouse', 6917, 174, '3B', 'D55L', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(138, 'S2008', '61614-BZ070', 'S-2008, PANEL, QUARTER, INNER LH', 'WH Docking', 'Inhouse', 6917, 174, '3B', 'D55L', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(139, 'S2009', '61733-BZ030', 'S-2009, PANEL, ROOF SIDE, INNER FR RH', 'WH Docking', 'Inhouse', 6917, 174, '3B', 'D55L', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(140, 'S2010', '61734-BZ030', 'S-2010, PANEL, ROOF SIDE, INNER FR LH', 'WH Docking', 'Inhouse', 6917, 174, '3B', 'D55L', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(141, 'A1006', '57111-BZ290', 'A-1006, MEMBER, FR SIDE, FR RH/LH', 'WH Docking', 'Inhouse', 17337, 449, '3B', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(142, 'A1007', '57112-BZ310', 'A-1007, MEMBER, FR SIDE, FR LH', 'WH Docking', 'Inhouse', 17337, 449, '3B', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(143, 'T4013', '67145-BZ160', 'T-4013, PANEL, FR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(144, 'T4014', '67146-BZ150', 'T-4014, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 11380, 285, '3B', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(145, 'J4041', '53311-BZ230', 'J-4041, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 60, 13, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(146, 'J4042', '53321-BZ230', 'J-4042,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 60, 13, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(147, 'J4051', '53811-BZ340', 'J-4051, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 60, 5, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(148, 'J4053', '53811-BZ350', 'J-4053, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(149, 'J4057', '53811-BZ370', 'J-4057, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(150, 'J4059', '53811-BZ380', 'J-4059, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(151, 'J4052', '53812-BZ280', 'J-4052, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 60, 7, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(152, 'J4054', '53812-BZ350', 'J-4054, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(153, 'J4058', '53812-BZ370', 'J-4058, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(154, 'J4060', '53812-BZ380', 'J-4060, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(155, 'J4017', '67111-BZ210', 'J-4017, PANEL, FR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 60, 3, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(156, 'J4018', '67112-BZ220', 'J-4018, PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 60, 5, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(157, 'J4021', '67113-BZ240', 'J-4021, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 60, 5, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(158, 'J4022', '67114-BZ240', 'J-4022, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 60, 3, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(159, 'J4031', '67141-BZ180', 'J-4031, PANEL, FR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 60, 3, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(160, 'J4032', '67142-BZ180', 'J-4032, PANEL, FR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 60, 3, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(161, 'K1051', '64111-BZ020', 'K-1051, PANEL BACK', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(162, 'K1134', '64111-BZ060', 'K-1134, PANEL BACK', 'WH Docking', 'Inhouse', 135, 5, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(163, 'K1052', '64111-BZ030', 'K-1052, PANEL BACK', 'WH Docking', 'Inhouse', 683, 17, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(164, 'K1147', '64111-BZ051', 'K-1147, PANEL BACK', 'WH Docking', 'Inhouse', 175, 5, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(165, 'K1158', '64111-BZ090', 'K-1158; PANEL BACK', 'WH Docking', 'Inhouse', 12, 1, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(166, 'K1148', '64111-BZ061', 'K-1148, PANEL BACK', 'WH Docking', 'Inhouse', 3281, 83, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(167, 'K3005', '63111-BZ120', 'K-3005, PANEL ROOF', 'WH Docking', 'Inhouse', 745, 20, '5A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(168, 'K3007', '63111-BZ150', 'K-3007, PANEL ROOF', 'WH Docking', 'Inhouse', 3541, 91, '5A', 'D40D', 'B', 'DMUKTICO', '2022-01-14 09:11:46'),
(169, 'K4001', '53311-BZ090', 'K-4001, PANEL HOOD', 'WH Door Assy', 'Inhouse', 5351, 139, '5A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(170, 'K4002', '53311-BZ100', 'K-4002,PANEL, HOOD', 'WH Door Assy', 'Inhouse', 2116, 55, '5A', 'D40D', 'D', 'DMUKTICO', '2022-01-14 09:11:46'),
(171, 'K4009', '67111-BZ110', 'K-4009,PANEL FR DOOR OUTSIDE, RH', 'WH Door Assy', 'Inhouse', 5351, 135, '5A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(172, 'K4011', '67111-BZ120', 'K-4011,PANEL FR DOOR OUTSIDE, RH', 'WH Door Assy', 'Inhouse', 2116, 54, '5A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(173, 'K4072', '67111-BZ320', 'K-4072;PANEL, FR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 167, 5, '5A', 'D40D', 'A', 'DMUKTICO', '2022-01-14 09:11:46'),
(174, 'K4010', '67112-BZ110', 'K-4010, PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 5316, 135, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(175, 'K4012', '67112-BZ120', 'K-4012,PANEL FR DOOR OUTSIDE, LH', 'WH Door Assy', 'Inhouse', 2116, 53, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(176, 'K4073', '67112-BZ320', 'K-4073;PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 167, 5, '5A', 'D40D', 'C', 'DMUKTICO', '2022-01-14 09:11:46'),
(177, 'K4076', '67115-BZ620', 'K-4076;PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 129, 3, '5A', 'D40D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(178, 'K4077', '67115-BZ630', 'K-4077;PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 38, 1, '5A', 'D40D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(179, 'T4015', '67113-BZ410', 'T-4015, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 11380, 285, '5A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(180, 'T4016', '67114-BZ410', 'T-4016, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 11380, 285, '5A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(181, 'T4003', '53811-BZ560', 'T-4003, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 11380, 290, '5A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(182, 'T4004', '53812-BZ550', 'T-4004, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 11380, 290, '5A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(183, 'T4029', '67115-BZ820', 'T-4029, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 1686, 45, '5A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(184, 'T4030', '67115-BZ840', 'T-4030, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 1161, 30, '5A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(185, 'T4034', '67115-BZA20', 'T-4034, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 2399, 61, '5A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(186, 'T4035', '67115-BZA30', 'T-4035, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 6134, 154, '5A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(187, 'T4002', '53321-BZ280', 'T-4002, PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 11380, 292, '5A', 'D14N', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(188, 'T4001', '53311-BZ290', 'T-4001, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 11380, 292, '5A', 'D14N', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(189, 'J3001', '63111-BZ210', 'J-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 0, 1, '5A', 'D17D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(190, 'J3004', '63111-BZ300', 'J-3004, PANEL, ROOF', 'WH Docking', 'Inhouse', 60, 2, '5A', 'D17D', 'TERIYOU', 'DMUKTICO', '2022-01-14 09:11:46'),
(191, 'A1002', '55111-BZD40', 'A-1002, PANEL, DASH', 'WH Docking', 'Inhouse', 8049, 267, '5A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(192, 'A1003', '55111-BZD50', 'A-1003, PANEL, DASH', 'WH Docking', 'Inhouse', 6234, 220, '5A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(193, 'A4006', '53812-BZ570', 'A-4006, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 11470, 323, '5A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(194, 'A4010', '53812-BZ590', 'A-4010, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 950, 44, '5A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(195, 'A4005', '53811-BZ570', 'A-4005, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 11470, 332, '5A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(196, 'A4009', '53811-BZ590', 'A-4009, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 950, 44, '5A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(197, 'A3003', '63132-BZ290', 'A-3003, WINDSHIELD HEADER, INNER', 'WH Docking', 'Inhouse', 17337, 449, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2022-01-14 09:11:46'),
(198, 'A4019', '67118-BZ010', 'A-4019, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 4917, 253, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2022-01-14 09:11:46'),
(199, 'A4020', '67118-BZ020', 'A-4020, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 11470, 319, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2022-01-14 09:11:46'),
(200, 'A4021', '67118-BZ040', 'A-4021, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 950, 44, '5A', 'D26A', '0', 'DMUKTICO', '2022-01-14 09:11:46'),
(201, 'A4022', '67119-BZ040', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 'WH Door Assy', 'Inhouse', 17337, 449, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2022-01-14 09:11:46'),
(202, 'A2011', '61631-BZ220', 'A-2011, PANEL, QTR WHEEL HOUSE, OUTER RH', 'WH Docking', 'Inhouse', 17337, 449, '5A', 'D26A', 'BD', 'DMUKTICO', '2022-01-14 09:11:46'),
(203, 'A2012', '61632-BZ220', 'A-2012, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 17337, 449, '5A', 'D26A', 'AC', 'DMUKTICO', '2022-01-14 09:11:46'),
(204, 'A1012', '58111-BZ380', 'A1012,PAN, FR FLOOR', 'WH Docking', 'Outhouse', NULL, 179, 'ADM-KAP', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(205, 'GBA0001', '55168-BZ310', 'GBA-0001, BRACKET, FR FENDER MOUNTING', 'WH Docking', 'Outhouse', NULL, 179, 'AMA', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(206, 'GBA0002', '55169-BZ210', 'GBA-0002, BRACKET,FR FENDER MOUNTING, LH', 'WH Docking', 'Outhouse', NULL, 179, 'AMA', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(207, 'GK0026', '67164-BZ020', 'GK-0026, EXT, FR DR INS PNL REINF, RR LH', 'WH Door Assy', 'Outhouse', NULL, 139, 'AMA', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(208, 'GK0055', '67351-BZ010', 'GK-0055, REINF, FR DOOR FR UPR FRAME, RH', 'WH Door Assy', 'Outhouse', NULL, 139, 'AMA', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(209, 'GK0056', '67352-BZ010', 'GK-0056, REINF, FR DOOR FR UPR FRAME, LH', 'WH Door Assy', 'Outhouse', NULL, 139, 'AMA', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(210, 'GK0057', '67353-BZ010', 'GK-0057, REIN, FR DR FR UPR FRME, NO.2 R', 'WH Door Assy', 'Outhouse', NULL, 139, 'AMA', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(211, 'GK0058', '67354-BZ010', 'GK-0058, REINF, FR DR FR UPR FRM, NO.2 L', 'WH Door Assy', 'Outhouse', NULL, 139, 'AMA', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(212, 'GA0001', '57803-BZ060', 'GA-0001, REINF S/A, RR FLR SI MBR, RR RH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(213, 'GA0002', '57804-BZ040', 'GA-0002, REINF S/A, RR FLR SI MBR, RR LH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(214, 'GA0003', '61675-BZ100', 'GA-0003, REINF, RR SUSP SPRING SUPT, RH', 'WH Docking', 'Outhouse', NULL, 357, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(215, 'GBA0003', '57033-BZ060', 'GBA-0003,BRACKET S/A,RR FLOOR MTG,NO.2RH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(216, 'GBA0004', '57034-BZ050', 'GBA-0004,BRACKET S/A,RR FLOOR MTG,NO.2LH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(217, 'GBA0005', '57403-BZ150', 'GBA-0005, MEMBER S/A,FLR SIDE,INNR RR RH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(218, 'GBA0006', '57404-BZ140', 'GBA-0006, MEMBER S/A,FLR SIDE,INNR RR LH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(219, 'GBA0007', '57603-BZ230', 'GBA-0007, MEMBER S/A,RR FLOOR SIDE,RR RH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(220, 'GBA0008', '57604-BZ200', 'GBA-0008, MEMBER S/A,RR FLOOR SIDE,RR LH', 'WH Docking', 'Outhouse', NULL, 179, 'ASI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(221, 'GA0004', '57188-BZ080', 'GA-0004, REINF, FR SIDE MEMBER EXT, RH', 'WH Docking', 'Outhouse', NULL, 357, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(222, 'GBA0009', '51501-BZ090', 'GBA-0009, REINF SUB-ASSY,FR SUSP MBR, RH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(223, 'GBA0010', '51502-BZ080', 'GBA-0010, SUPPORT S/A,SUSPENSION ARM, LH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(224, 'GBA0011', '51543-BZ020', 'GBA-0011, REINF,LWR CTRL LINK BRACKET,RH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(225, 'GBA0012', '51544-BZ020', 'GBA-0012, REINF,LWR CTRL LINK BRACKET,LH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(226, 'GBA0013', '51904-BZ040', 'GBA-0013, HANGER S/A, EXHAUST PIPE, NO.4', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(227, 'GBA0014', '57117-BZ080', 'GBA-0014, PLATE, FR SIDE MEMBER, NO.2 RH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(228, 'GBA0015', '57118-BZ080', 'GBA-0015, PLATE, FR SIDE MEMBER, NO.2 LH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(229, 'GBA0016', '57801-BZ130', 'GBA-0016, REINF S/A,RR FLR SI MBR, FR RH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(230, 'GBA0017', '57802-BZ030', 'GBA-0017, REINF S/A,RR FLR SI MBR, FR LH', 'WH Docking', 'Outhouse', NULL, 179, 'DPM', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(231, 'GK0086', '67331-BZ050', 'GK-0086, RETAINER, SLIDE DOOR LOCK, RH', 'WH Door Assy', 'Outhouse', NULL, 50, 'DPM', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(232, 'K4055', '53811-BZ190', 'K-4055,PANEL, FR FENDER, RH', 'WH Docking', 'Outhouse', NULL, 3, 'FTI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(233, 'K4056', '53812-BZ190', 'K-4056,PANEL, FR FENDER, LH', 'WH Docking', 'Outhouse', NULL, 3, 'FTI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(234, 'K4071', '53321-BZ220', 'K-4071, PANEL, HOOD, INNER', 'WH Door Assy', 'Outhouse', NULL, 3, 'FTI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(235, 'K4019', '67115-BZ220', 'K-4019,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Outhouse', NULL, 23, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(236, 'K4023', '67115-BZ280', 'K-4023,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Outhouse', NULL, 8, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(237, 'K4032', '67143-BZ131', 'K-4032, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Outhouse', NULL, 13, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(238, 'K4033', '67144-BZ121', 'K-4033, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Outhouse', NULL, 13, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(239, 'K4042', '67143-BZ181', 'K-4042, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Outhouse', NULL, 23, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(240, 'K4043', '67144-BZ171', 'K-4043, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Outhouse', NULL, 23, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(241, 'K4049', '67149-BZ170', 'K-4049,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', NULL, 25, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(242, 'K4052', '67149-BZ200', 'K-4052,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', NULL, 8, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(243, 'K4059', '67115-BZ340', 'K-4059,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Outhouse', NULL, 3, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(244, 'K4062', '67115-BZ241', 'K-4062,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Outhouse', NULL, 4, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(245, 'K4063', '67115-BZ251', 'K-4063,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Outhouse', NULL, 21, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(246, 'K4064', '67149-BZ181', 'K-4064,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', NULL, 21, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(247, 'K4067', '67149-BZ190', 'K-4067,PANEL BACK DOOR INSIDE', 'WH Door Assy', 'Outhouse', NULL, 4, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(248, 'K4068', '67143-BZ152', 'K-4068, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Outhouse', NULL, 25, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(249, 'K4069', '67144-BZ142', 'K-4069, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Outhouse', NULL, 25, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(250, 'K4070', '53311-BZ220', 'K-4070;PANEL, HOOD', 'WH Door Assy', 'Outhouse', NULL, 3, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(251, 'K4051', '67149-BZ210', 'K-4051,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Outhouse', NULL, 3, 'IPPI2', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(252, 'K4078', '67141-BZ081', 'K-4078,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Outhouse', NULL, 98, 'IPPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(253, 'K4079', '67142-BZ081', 'K-4079,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Outhouse', NULL, 98, 'IPPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(254, 'K4080', '67141-BZ091', 'K-4080,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Outhouse', NULL, 38, 'IPPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(255, 'K4081', '67142-BZ091', 'K-4081,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Outhouse', NULL, 38, 'IPPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(256, 'K4082', '67141-BZ121', 'K-4082,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Outhouse', NULL, 3, 'IPPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(257, 'K4083', '67142-BZ121', 'K-4083,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Outhouse', NULL, 3, 'IPPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(258, 'GK0010', '67051-BZ020', 'GK-0010, REINF SUB-ASSY, FR DOOR, RH', 'WH Door Assy', 'Outhouse', NULL, 38, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(259, 'GK0013', '67121-BZ040', 'GK-0013, REINF, FR DOOR OUTSIDE PNL, RH', 'WH Door Assy', 'Outhouse', NULL, 101, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(260, 'GK0014', '67121-BZ050', 'GK-0014, REINF, FR DOOR OUTSIDE PNL, RH', 'WH Door Assy', 'Outhouse', NULL, 38, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(261, 'GK0015', '67122-BZ030', 'GK-0015, REINF, FR DOOR OUTSIDE PANEL,LH', 'WH Door Assy', 'Outhouse', NULL, 101, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(262, 'GK0016', '67122-BZ040', 'GK-0016, REINF, FR DOOR OUTSIDE PNL, LH', 'WH Door Assy', 'Outhouse', NULL, 38, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(263, 'GK0019', '67125-BZ050', 'GK-0019, REINF, RR DOOR OUTSIDE PANEL, R', 'WH Door Assy', 'Outhouse', NULL, 61, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(264, 'GK0020', '67126-BZ050', 'GK-0020,REINF, RR DOOR OUTSIDE PANEL, LH', 'WH Door Assy', 'Outhouse', NULL, 61, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(265, 'GK0022', '67131-BZ020', 'GK-0022, EXT, FR DR OUT PNL REINF, FR RH', 'WH Door Assy', 'Outhouse', NULL, 278, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(266, 'GK0023', '67135-BZ010', 'GK-0023, REINF, SLIDE DOOR OUTER PANEL', 'WH Door Assy', 'Outhouse', NULL, 121, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(267, 'GK0024', '67155-BZ060', 'GK-0024, REINF, RR DOOR INSIDE PANEL, RH', 'WH Door Assy', 'Outhouse', NULL, 61, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(268, 'GK0025', '67156-BZ050', 'GK-0025, REINF, RR DOOR INSIDE PANEL, LH', 'WH Door Assy', 'Outhouse', NULL, 61, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(269, 'GK0027', '67166-BZ040', 'GK-0027, EXT, FR DR INS PNL REINF, FR LH', 'WH Door Assy', 'Outhouse', NULL, 38, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(270, 'GK0030', '67173-BZ020', 'GK-0030, REINF, FR DOOR LWR HINGE, RH', 'WH Door Assy', 'Outhouse', NULL, 99, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(271, 'GK0038', '67183-BZ030', 'GK-0038, PATCH, FR DR REINF, RH', 'WH Door Assy', 'Outhouse', NULL, 139, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(272, 'GK0039', '67261-BZ010', 'GK-0039, PLATE, B/ DR REINFRON, NO.1 RH', 'WH Door Assy', 'Outhouse', NULL, 3, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(273, 'GK0040', '67262-BZ010', 'GK-0040, PLATE, B / D REINFOR, NO.1 LH', 'WH Door Assy', 'Outhouse', NULL, 3, 'MAJ', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(274, 'GA0005', '52141-BZ100', 'GA-0005, ARM, FR BUMPER, RH', 'WH Docking', 'Outhouse', NULL, 179, 'MAJ D26A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(275, 'GA0006', '57025-BZ070', 'GA-0006, MEMBER S/A,FR SIDE,OUTER RH', 'WH Docking', 'Outhouse', NULL, 179, 'MAJ D26A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(276, 'GA0007', '57026-BZ060', 'GA-0007, MEMBER S/A,FR SIDE,OUTER LH', 'WH Docking', 'Outhouse', NULL, 179, 'MAJ D26A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(277, 'GBA0018', '57105-BZ200', 'GBA-0018, PLATE S/A, FR SIDE MEMBER, RH', 'WH Docking', 'Outhouse', NULL, 179, 'MAJ D26A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(278, 'GBA0175', '57106-BZ240', 'GBA-0175, PLATE S/A, FR SIDE MEMBER, LH', 'WH Docking', 'Outhouse', NULL, 179, 'MAJ D26A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(279, 'GBA0020', '57406-BZ270', 'GBA-0020, MEMBER S/A,MAIN FLOOR SIDE, RH', 'WH Docking', 'Outhouse', NULL, 179, 'MAJ D26A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(280, 'GBA0021', '57409-BZ240', 'GBA-0021, MEMBER S/A,MAIN FLOOR SIDE, LH', 'WH Docking', 'Outhouse', NULL, 179, 'MAJ D26A', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(281, 'GA0008', '53202-BZ140', 'GA-0008, SUPPORT SUB-ASSY, RADIATOR, RH', 'WH Docking', 'Outhouse', NULL, 179, 'MES1', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(282, 'GA0009', '53203-BZ240', 'GA-0009, SUPPORT SUB-ASSY, RADIATOR, LH', 'WH Docking', 'Outhouse', NULL, 179, 'MES1', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(283, 'GA0010', '53213-BZ130', 'GA-0010, SUPPORT, RADIATOR, UPR RH', 'WH Docking', 'Outhouse', NULL, 179, 'MES1', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(284, 'GA0011', '53214-BZ110', 'GA-0011, SUPPORT, RADIATOR, UPR LH', 'WH Docking', 'Outhouse', NULL, 179, 'MES1', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(285, 'GK0009', '61773-BZ010', 'GK-0009, REINF, RR WIPER MOUNTING', 'WH Door Assy', 'Outhouse', NULL, 8, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(286, 'GK0041', '67301-BZ050', 'GK-0041, BEAM S/A, DR SI-IMP PROTECT, RH', 'WH Door Assy', 'Outhouse', NULL, 41, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(287, 'GK0042', '67302-BZ040', 'GK-0042, BEAM S/A, DR SI-IMP PROTECT, LH', 'WH Door Assy', 'Outhouse', NULL, 41, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(288, 'GK0043', '67303-BZ030', 'GK-0043, BEAM S/A, RR DR PROTECTION, RH', 'WH Door Assy', 'Outhouse', NULL, 5, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(289, 'GK0044', '67304-BZ030', 'GK-0044, BEAM S/A, RR DR PROTECTION, LH', 'WH Door Assy', 'Outhouse', NULL, 5, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(290, 'GK0052', '67347-BZ010', 'GK-0052, RETAIN, SLIDE DR CTR ROLLER, RH', 'WH Door Assy', 'Outhouse', NULL, 25, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(291, 'GK0053', '67348-BZ010', 'GK-0053, RETAIN, SLIDE DR CTR ROLLER, LH', 'WH Door Assy', 'Outhouse', NULL, 25, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(292, 'GK0067', '67391-BZ050', 'GK-0067,REINF, BACK DOOR LOCK', 'WH Door Assy', 'Outhouse', NULL, 50, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(293, 'GK0068', '67391-BZ060', 'GK-0068, REINF, BACK DOOR LOCK', 'WH Door Assy', 'Outhouse', NULL, 8, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(294, 'GK0069', '67391-BZ070', 'GK-0069, REINF, BACK DOOR LOCK', 'WH Door Assy', 'Outhouse', NULL, 3, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(295, 'GK0070', '67395-BZ010', 'GK-0070, RETAINER, BACK DOOR GRIP', 'WH Door Assy', 'Outhouse', NULL, 15, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(296, 'GK0071', '68601-BZ010', 'GK-0071,REINF S / A, BACK DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', NULL, 8, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(297, 'GK0083', '67347-BZ020', 'GK-0083 RETAIN,SLIDE DOOR CTR ROLLER,RH', 'WH Door Assy', 'Outhouse', NULL, 36, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(298, 'GK0084', '67348-BZ020', 'GK-0084 RETAIN,SLIDE DOOR CTR ROLLER, LH', 'WH Door Assy', 'Outhouse', NULL, 36, 'MES1', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(299, 'Y1033', '53261-87Z02', 'Y-1033, BRKT RADIATOR RESERVE TAN', 'WH Docking', 'Outhouse', NULL, 101, 'MKSD', NULL, '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(300, 'GK0081', '68131-BZ270', 'GK-0081,PANEL, BACK DOOR GLASS', 'WH Door Assy', 'Outhouse', NULL, 23, 'MKSD', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(301, 'GA0032', '53078-BZ140', 'GA-0032,EXTENSION S/A,FR FENDER APRON,LH', 'WH Docking', 'Outhouse', NULL, 179, 'NIC', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(302, 'GA0033', '58269-BZ050', 'GA-0033, BRACKET,PRKG BRK CBL GUIDE,NO.3', 'WH Docking', 'Outhouse', NULL, 179, 'NIC', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(303, 'GA0034', '58289-BZ120', 'GA-0034, BRACKET,FLOOR BRAKE HOSE, RR RH', 'WH Docking', 'Outhouse', NULL, 179, 'NIC', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(304, 'GK0007', '53401-BZ030', 'GK-0007, HINGE SUB-ASSY, HOOD, RH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(305, 'GK0008', '53402-BZ030', 'GK-0008, HINGE SUB-ASSY, HOOD, LH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(306, 'GK0028', '67171-BZ010', 'GK-0028, REINF, FR DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(307, 'GK0029', '67172-BZ010', 'GK-0029, REINF, FR DOOR HINGE, LH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(308, 'GK0050', '67335-BZ050', 'GK-0050,REINFORCEMENT, FR DOOR LOCK, RH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(309, 'GK0051', '67336-BZ060', 'GK-0051, REINF, FR DOOR LOCK, LH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(310, 'GK0054', '67349-BZ030', 'GK-0054, REINF, RR DOOR UPR FRAME', 'WH Door Assy', 'Outhouse', NULL, 38, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(311, 'GK0059', '67355-BZ010', 'GK-0059, REINF, FR DOOR RR FRAME, RH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(312, 'GK0060', '67356-BZ010', 'GK-0060, REINF, FR DOOR RR FRAME, LH', 'WH Door Assy', 'Outhouse', NULL, 139, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(313, 'GK0063', '67359-BZ030', 'GK-0063, REINF, RR DOOR UPR FRAME, LH', 'WH Door Assy', 'Outhouse', NULL, 38, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(314, 'GK0076', '68801-BZ091', 'GK-0076,HINGE SUB ASSY, BACK DOOR', 'WH Door Assy', 'Outhouse', NULL, 106, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(315, 'GK0085', '67127-BZ031', 'GK-0085, REINF, RR DOOR OUTS PANEL, NO.2', 'WH Door Assy', 'Outhouse', NULL, 121, 'NIC', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(316, 'GA0036', '51401-BZ110', 'GA-0036, BRACKET S/A, ENGINE FR MOUNTING', 'WH Docking', 'Outhouse', NULL, 357, 'NTC', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46');
INSERT INTO `tbl_master_part` (`id`, `job_no`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `maks_shift`, `machine`, `model`, `patan`, `create_by`, `create_date`) VALUES
(317, 'GBK0152', '53331-BZ190', 'GBK-0152,PLATE, HOOD HINGE MOUNTING', 'WH Door Assy', 'Outhouse', NULL, 76, 'STEP', 'D40L', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(318, 'GK0002', '53307-BZ071', 'GK-0002, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Outhouse', NULL, 98, 'STEP', 'E4-03', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(319, 'GK0004', '53307-BZ081', 'GK-0004, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Outhouse', NULL, 38, 'STEP', 'E3-40A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(320, 'GK0005', '53307-BZ090', 'GK-0005, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Outhouse', NULL, 3, 'STEP', 'E3-26', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(321, 'GK0006', '53331-BZ050', 'GK-0006, PLATE, HOOD HINGE MOUNTING', 'WH Door Assy', 'Outhouse', NULL, 202, 'STEP', 'E2-36B', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(322, 'GK0011', '67053-BZ030', 'GK-0011,REINF S / A, FR DOOR INS PNL, RH', 'WH Door Assy', 'Outhouse', NULL, 139, 'STEP', 'E3-29', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(323, 'GK0012', '67117-BZ010', 'GK-0012, REINF, RR WIPER MOUNTING', 'WH Door Assy', 'Outhouse', NULL, 50, 'STEP', 'E3-24', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(324, 'GK0017', '67123-BZ040', 'GK-0017, RETAIN, SLIDE D UPR ROLLER, RH', 'WH Door Assy', 'Outhouse', NULL, 61, 'STEP', 'E3-40B', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(325, 'GK0018', '67124-BZ030', 'GK-0018, RETAIN, SLIDE DR UPR ROLLER, LH', 'WH Door Assy', 'Outhouse', NULL, 61, 'STEP', 'E3-42A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(326, 'GK0031', '67175-BZ040', 'GK-0031, REINFOR, BACK DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', NULL, 50, 'STEP', 'E4-01', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(327, 'GK0032', '67175-BZ060', 'GK-0032, REINF, BACK DOOR HINGE, RH', 'WH Door Assy', 'Outhouse', NULL, 3, 'STEP', 'E3-04C', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(328, 'GK0033', '67176-BZ030', 'GK-0033, REINF, BACK DOOR HINGE, LH', 'WH Door Assy', 'Outhouse', NULL, 50, 'STEP', 'E2-33', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(329, 'GK0034', '67176-BZ050', 'GK-0034, REINF, BACK DOOR HINGE, LH', 'WH Door Assy', 'Outhouse', NULL, 3, 'STEP', 'E3-44B', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(330, 'GK0035', '67177-BZ030', 'GK-0035, REINF, RR DOOR LWR ROLLER, RH', 'WH Door Assy', 'Outhouse', NULL, 61, 'STEP', 'E3-31', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(331, 'GK0036', '67178-BZ020', 'GK-0036, REINF, RR DOOR LWR ROLLER, LH', 'WH Door Assy', 'Outhouse', NULL, 61, 'STEP', 'E3-36', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(332, 'GK0046', '67317-BZ020', 'GK-0046, REINF, RR DOOR SIDE, RH', 'WH Door Assy', 'Outhouse', NULL, 76, 'STEP', 'E3-42B', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(333, 'GK0048', '67333-BZ040', 'GK-0048, RETAINER, SLIDE DOOR LOCK, RH', 'WH Door Assy', 'Outhouse', NULL, 25, 'STEP', 'E3-43C', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(334, 'GK0049', '67334-BZ030', 'GK-0049, RETAINER, SLIDE DOOR LOCK, LH', 'WH Door Assy', 'Outhouse', NULL, 25, 'STEP', 'E3-45B', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(335, 'GK0061', '67357-BZ010', 'GK-0061, REINF, RR DOOR FR UPR FRAME, RH', 'WH Door Assy', 'Outhouse', NULL, 61, 'STEP', 'E3-44C', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(336, 'GK0062', '67358-BZ010', 'GK-0062, REINF, RR DOOR FR UPR FRAME, LH', 'WH Door Assy', 'Outhouse', NULL, 61, 'STEP', 'E3-09B', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(337, 'GK0064', '67361-BZ030', 'GK-0064,RETAINER, BACK DOOR HINGE', 'WH Door Assy', 'Outhouse', NULL, 106, 'STEP', 'E4-07', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(338, 'GA0038', '61677-BZ090', 'GA-0038, BRACKET,RR SUSPENSION BUMPER,RH', 'WH Docking', 'Outhouse', NULL, 357, 'TCH', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(339, 'GA0040', '57153-BZ140', 'GA-0040, REINF, FR SIDE MEMBER, NO.2 RH', 'WH Docking', 'Outhouse', NULL, 179, 'YPI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(340, 'GA0041', '57154-BZ130', 'GA-0041, REINF, FR SIDE MEMBER, NO.2 LH', 'WH Docking', 'Outhouse', NULL, 179, 'YPI', 'D26A', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(341, 'GK0037', '67181-BZ090', 'GK-0037, RETAINER, DOOR HINGE', 'WH Door Assy', 'Outhouse', NULL, 556, 'YPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(342, 'GK0079', '67245-BZ010', 'GK-0079,RETAINER, OUTSIDE MIRROR BASE', 'WH Door Assy', 'Outhouse', NULL, 25, 'YPI', 'D40D', '-', 'DMUKTICO', '2022-01-14 09:11:46'),
(343, 'GK0087', '67975-BZ060', 'GK-0087, REINF, BACK DOOR INSIDE PANEL', 'WH Door Assy', 'Outhouse', NULL, 25, 'YPI', 'D40L', '-', 'DMUKTICO', '2022-01-14 09:11:46');

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
(1, '2022-01-01', NULL, 'D'),
(2, '2022-01-01', NULL, 'N'),
(3, '2022-01-02', NULL, 'D'),
(4, '2022-01-02', NULL, 'N'),
(5, '2022-01-03', 'C', 'D'),
(6, '2022-01-03', 'D', 'N'),
(7, '2022-01-04', 'A', 'D'),
(8, '2022-01-04', 'D', 'N'),
(9, '2022-01-05', 'A', 'D'),
(10, '2022-01-05', 'B', 'N'),
(11, '2022-01-06', 'C', 'D'),
(12, '2022-01-06', 'D', 'N'),
(13, '2022-01-07', 'A', 'D'),
(14, '2022-01-07', 'B', 'N'),
(15, '2022-01-08', 'C', 'D'),
(16, '2022-01-08', NULL, 'N'),
(17, '2022-01-09', NULL, 'D'),
(18, '2022-01-09', 'D', 'N'),
(19, '2022-01-10', 'A', 'D'),
(20, '2022-01-10', 'B', 'N'),
(21, '2022-01-11', 'C', 'D'),
(22, '2022-01-11', 'D', 'N'),
(23, '2022-01-12', 'A', 'D'),
(24, '2022-01-12', 'B', 'N'),
(25, '2022-01-13', 'C', 'D'),
(26, '2022-01-13', 'D', 'N'),
(27, '2022-01-14', 'A', 'D'),
(28, '2022-01-14', 'B', 'N'),
(29, '2022-01-15', 'C', 'D'),
(30, '2022-01-15', NULL, 'N'),
(31, '2022-01-16', NULL, 'D'),
(32, '2022-01-16', 'D', 'N'),
(33, '2022-01-17', 'A', 'D'),
(34, '2022-01-17', 'B', 'N'),
(35, '2022-01-18', 'C', 'D'),
(36, '2022-01-18', 'D', 'N'),
(37, '2022-01-19', 'A', 'D'),
(38, '2022-01-19', 'B', 'N'),
(39, '2022-01-20', 'C', 'D'),
(40, '2022-01-20', 'D', 'N'),
(41, '2022-01-21', 'A', 'D'),
(42, '2022-01-21', 'B', 'N'),
(43, '2022-01-22', NULL, 'D'),
(44, '2022-01-22', NULL, 'N'),
(45, '2022-01-23', NULL, 'D'),
(46, '2022-01-23', NULL, 'N'),
(47, '2022-01-24', 'C', 'D'),
(48, '2022-01-24', 'D', 'N'),
(49, '2022-01-25', 'A', 'D'),
(50, '2022-01-25', 'B', 'N'),
(51, '2022-01-26', 'C', 'D'),
(52, '2022-01-26', 'D', 'N'),
(53, '2022-01-27', 'A', 'D'),
(54, '2022-01-27', 'B', 'N'),
(55, '2022-01-28', 'C', 'D'),
(56, '2022-01-28', 'D', 'N'),
(57, '2022-01-29', NULL, 'D'),
(58, '2022-01-29', NULL, 'N'),
(59, '2022-01-30', NULL, 'D'),
(60, '2022-01-30', NULL, 'N'),
(61, '2022-01-31', 'A', 'D'),
(62, '2022-01-31', 'B', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_qr`
--

CREATE TABLE `tbl_master_qr` (
  `id` int(11) NOT NULL,
  `qr_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_qr`
--

INSERT INTO `tbl_master_qr` (`id`, `qr_code`) VALUES
(1, 'PLT-P1-D26A-A1002-001'),
(2, 'PLT-P1-D26A-A1002-002'),
(3, 'PLT-P1-D26A-A1002-003'),
(4, 'PLT-P1-D26A-A1002-004'),
(5, 'PLT-P1-D26A-A1002-005'),
(6, 'PLT-P1-D26A-A1002-006'),
(7, 'PLT-P1-D26A-A1002-007'),
(8, 'PLT-P1-D26A-A1002-008'),
(9, 'PLT-P1-D26A-A1002-009'),
(10, 'PLT-P1-D26A-A1002-010'),
(11, 'PLT-P1-D26A-A1002-011'),
(12, 'PLT-P1-D26A-A1002-012'),
(13, 'PLT-P1-D26A-A1002-013'),
(14, 'PLT-P1-D26A-A1002-014'),
(15, 'PLT-P1-D26A-A1002-015'),
(16, 'PLT-P1-D26A-A1002-016'),
(17, 'PLT-P1-D26A-A1002-017'),
(18, 'PLT-P1-D26A-A1002-018'),
(19, 'PLT-P1-D26A-A1002-019'),
(20, 'PLT-P1-D26A-A1002-020'),
(21, 'PLT-P1-D26A-A1002-021'),
(22, 'PLT-P1-D26A-A1002-022'),
(23, 'PLT-P1-D26A-A1002-023'),
(24, 'PLT-P1-D26A-A1002-024'),
(25, 'PLT-P1-D26A-A1003-001'),
(26, 'PLT-P1-D26A-A1003-002'),
(27, 'PLT-P1-D26A-A1003-003'),
(28, 'PLT-P1-D26A-A1003-004'),
(29, 'PLT-P1-D26A-A1003-005'),
(30, 'PLT-P1-D26A-A1003-006'),
(31, 'PLT-P1-D26A-A1003-007'),
(32, 'PLT-P1-D26A-A1003-008'),
(33, 'PLT-P1-D26A-A1003-009'),
(34, 'PLT-P1-D26A-A1003-010'),
(35, 'PLT-P1-D26A-A1003-011'),
(36, 'PLT-P1-D26A-A1003-012'),
(37, 'PLT-P1-D26A-A1003-013'),
(38, 'PLT-P1-D26A-A1003-014'),
(39, 'PLT-P1-D26A-A1003-015'),
(40, 'PLT-P1-D26A-A1003-016'),
(41, 'PLT-P1-D26A-A1003-017'),
(42, 'PLT-P1-D26A-A1003-018'),
(43, 'PLT-P1-D26A-A1003-019'),
(44, 'PLT-P1-D26A-A1003-020'),
(45, 'PLT-P1-D26A-A1003-021'),
(46, 'PLT-P1-D26A-A1003-022'),
(47, 'PLT-P1-D26A-A1003-023'),
(48, 'PLT-P1-D26A-A1003-024'),
(49, 'PLT-P1-D26A-A1006-001'),
(50, 'PLT-P1-D26A-A1006-002'),
(51, 'PLT-P1-D26A-A1006-003'),
(52, 'PLT-P1-D26A-A1006-004'),
(53, 'PLT-P1-D26A-A1006-005'),
(54, 'PLT-P1-D26A-A1006-006'),
(55, 'PLT-P1-D26A-A1006-007'),
(56, 'PLT-P1-D26A-A1006-008'),
(57, 'PLT-P1-D26A-A1006-009'),
(58, 'PLT-P1-D26A-A1006-010'),
(59, 'PLT-P1-D26A-A1006-011'),
(60, 'PLT-P1-D26A-A1006-012'),
(61, 'PLT-P1-D26A-A1006-013'),
(62, 'PLT-P1-D26A-A1006-014'),
(63, 'PLT-P1-D26A-A1006-015'),
(64, 'PLT-P1-D26A-A1006-016'),
(65, 'PLT-P1-D26A-A1006-017'),
(66, 'PLT-P1-D26A-A1006-018'),
(67, 'PLT-P1-D26A-A1006-019'),
(68, 'PLT-P1-D26A-A1006-020'),
(69, 'PLT-P1-D26A-A1006-021'),
(70, 'PLT-P1-D26A-A1006-022'),
(71, 'PLT-P1-D26A-A1006-023'),
(72, 'PLT-P1-D26A-A1006-024'),
(73, 'PLT-P1-D26A-A1007-001'),
(74, 'PLT-P1-D26A-A1007-002'),
(75, 'PLT-P1-D26A-A1007-003'),
(76, 'PLT-P1-D26A-A1007-004'),
(77, 'PLT-P1-D26A-A1007-005'),
(78, 'PLT-P1-D26A-A1007-006'),
(79, 'PLT-P1-D26A-A1007-007'),
(80, 'PLT-P1-D26A-A1007-008'),
(81, 'PLT-P1-D26A-A1007-009'),
(82, 'PLT-P1-D26A-A1007-010'),
(83, 'PLT-P1-D26A-A1007-011'),
(84, 'PLT-P1-D26A-A1007-012'),
(85, 'PLT-P1-D26A-A1007-013'),
(86, 'PLT-P1-D26A-A1007-014'),
(87, 'PLT-P1-D26A-A1007-015'),
(88, 'PLT-P1-D26A-A1007-016'),
(89, 'PLT-P1-D26A-A1007-017'),
(90, 'PLT-P1-D26A-A1007-018'),
(91, 'PLT-P1-D26A-A1007-019'),
(92, 'PLT-P1-D26A-A1007-020'),
(93, 'PLT-P1-D26A-A1007-021'),
(94, 'PLT-P1-D26A-A1007-022'),
(95, 'PLT-P1-D26A-A1007-023'),
(96, 'PLT-P1-D26A-A1007-024'),
(97, 'PLT-P1-D26A-A1008-001'),
(98, 'PLT-P1-D26A-A1008-002'),
(99, 'PLT-P1-D26A-A1008-003'),
(100, 'PLT-P1-D26A-A1008-004'),
(101, 'PLT-P1-D26A-A1008-005'),
(102, 'PLT-P1-D26A-A1008-006'),
(103, 'PLT-P1-D26A-A1008-007'),
(104, 'PLT-P1-D26A-A1008-008'),
(105, 'PLT-P1-D26A-A1008-009'),
(106, 'PLT-P1-D26A-A1008-010'),
(107, 'PLT-P1-D26A-A1008-011'),
(108, 'PLT-P1-D26A-A1008-012'),
(109, 'PLT-P1-D26A-A1008-013'),
(110, 'PLT-P1-D26A-A1008-014'),
(111, 'PLT-P1-D26A-A1008-015'),
(112, 'PLT-P1-D26A-A1008-016'),
(113, 'PLT-P1-D26A-A1008-017'),
(114, 'PLT-P1-D26A-A1008-018'),
(115, 'PLT-P1-D26A-A1008-019'),
(116, 'PLT-P1-D26A-A1008-020'),
(117, 'PLT-P1-D26A-A1008-021'),
(118, 'PLT-P1-D26A-A1008-022'),
(119, 'PLT-P1-D26A-A1008-023'),
(120, 'PLT-P1-D26A-A1008-024'),
(121, 'PLT-P1-D26A-A1008-025'),
(122, 'PLT-P1-D26A-A1009-001'),
(123, 'PLT-P1-D26A-A1009-002'),
(124, 'PLT-P1-D26A-A1009-003'),
(125, 'PLT-P1-D26A-A1009-004'),
(126, 'PLT-P1-D26A-A1009-005'),
(127, 'PLT-P1-D26A-A1009-006'),
(128, 'PLT-P1-D26A-A1009-007'),
(129, 'PLT-P1-D26A-A1009-008'),
(130, 'PLT-P1-D26A-A1009-009'),
(131, 'PLT-P1-D26A-A1009-010'),
(132, 'PLT-P1-D26A-A1009-011'),
(133, 'PLT-P1-D26A-A1009-012'),
(134, 'PLT-P1-D26A-A1009-013'),
(135, 'PLT-P1-D26A-A1009-014'),
(136, 'PLT-P1-D26A-A1009-015'),
(137, 'PLT-P1-D26A-A1009-016'),
(138, 'PLT-P1-D26A-A1009-017'),
(139, 'PLT-P1-D26A-A1009-018'),
(140, 'PLT-P1-D26A-A1009-019'),
(141, 'PLT-P1-D26A-A1009-020'),
(142, 'PLT-P1-D26A-A1009-021'),
(143, 'PLT-P1-D26A-A1009-022'),
(144, 'PLT-P1-D26A-A1009-023'),
(145, 'PLT-P1-D26A-A1009-024'),
(146, 'PLT-P1-D26A-A1009-025'),
(147, 'PLT-P1-D26A-A1014-001'),
(148, 'PLT-P1-D26A-A1014-002'),
(149, 'PLT-P1-D26A-A1014-003'),
(150, 'PLT-P1-D26A-A1014-004'),
(151, 'PLT-P1-D26A-A1014-005'),
(152, 'PLT-P1-D26A-A1014-006'),
(153, 'PLT-P1-D26A-A1014-007'),
(154, 'PLT-P1-D26A-A1014-008'),
(155, 'PLT-P1-D26A-A1014-009'),
(156, 'PLT-P1-D26A-A1014-010'),
(157, 'PLT-P1-D26A-A1014-011'),
(158, 'PLT-P1-D26A-A1014-012'),
(159, 'PLT-P1-D26A-A1014-013'),
(160, 'PLT-P1-D26A-A1014-014'),
(161, 'PLT-P1-D26A-A1014-015'),
(162, 'PLT-P1-D26A-A1014-016'),
(163, 'PLT-P1-D26A-A1014-017'),
(164, 'PLT-P1-D26A-A1014-018'),
(165, 'PLT-P1-D26A-A1014-019'),
(166, 'PLT-P1-D26A-A1014-020'),
(167, 'PLT-P1-D26A-A1014-021'),
(168, 'PLT-P1-D26A-A1014-022'),
(169, 'PLT-P1-D26A-A1014-023'),
(170, 'PLT-P1-D26A-A1014-024'),
(171, 'PLT-P1-D26A-A1014-025'),
(172, 'PLT-P1-D26A-A1014-026'),
(173, 'PLT-P1-D26A-A1014-027'),
(174, 'PLT-P1-D26A-A1014-028'),
(175, 'PLT-P1-D26A-A1014-029'),
(176, 'PLT-P1-D26A-A1014-030'),
(177, 'PLT-P1-D26A-A1014-031'),
(178, 'PLT-P1-D26A-A1014-032'),
(179, 'PLT-P1-D26A-A1014-033'),
(180, 'PLT-P1-D26A-A1014-034'),
(181, 'PLT-P1-D26A-A1014-035'),
(182, 'PLT-P1-D26A-A2001-001'),
(183, 'PLT-P1-D26A-A2001-002'),
(184, 'PLT-P1-D26A-A2001-003'),
(185, 'PLT-P1-D26A-A2001-004'),
(186, 'PLT-P1-D26A-A2001-005'),
(187, 'PLT-P1-D26A-A2001-006'),
(188, 'PLT-P1-D26A-A2001-007'),
(189, 'PLT-P1-D26A-A2001-008'),
(190, 'PLT-P1-D26A-A2001-009'),
(191, 'PLT-P1-D26A-A2001-010'),
(192, 'PLT-P1-D26A-A2001-011'),
(193, 'PLT-P1-D26A-A2001-012'),
(194, 'PLT-P1-D26A-A2001-013'),
(195, 'PLT-P1-D26A-A2001-014'),
(196, 'PLT-P1-D26A-A2001-015'),
(197, 'PLT-P1-D26A-A2001-016'),
(198, 'PLT-P1-D26A-A2001-017'),
(199, 'PLT-P1-D26A-A2001-018'),
(200, 'PLT-P1-D26A-A2001-019'),
(201, 'PLT-P1-D26A-A2001-020'),
(202, 'PLT-P1-D26A-A2001-021'),
(203, 'PLT-P1-D26A-A2001-022'),
(204, 'PLT-P1-D26A-A2001-023'),
(205, 'PLT-P1-D26A-A2001-024'),
(206, 'PLT-P1-D26A-A2001-025'),
(207, 'PLT-P1-D26A-A2001-026'),
(208, 'PLT-P1-D26A-A2001-027'),
(209, 'PLT-P1-D26A-A2001-028'),
(210, 'PLT-P1-D26A-A2001-029'),
(211, 'PLT-P1-D26A-A2001-030'),
(212, 'PLT-P1-D26A-A2001-031'),
(213, 'PLT-P1-D26A-A2001-032'),
(214, 'PLT-P1-D26A-A2001-033'),
(215, 'PLT-P1-D26A-A2001-034'),
(216, 'PLT-P1-D26A-A2001-035'),
(217, 'PLT-P1-D26A-A2001-036'),
(218, 'PLT-P1-D26A-A2001-037'),
(219, 'PLT-P1-D26A-A2001-038'),
(220, 'PLT-P1-D26A-A2001-039'),
(221, 'PLT-P1-D26A-A2001-040'),
(222, 'PLT-P1-D26A-A2001-041'),
(223, 'PLT-P1-D26A-A2001-042'),
(224, 'PLT-P1-D26A-A2001-043'),
(225, 'PLT-P1-D26A-A2001-044'),
(226, 'PLT-P1-D26A-A2001-045'),
(227, 'PLT-P1-D26A-A2001-046'),
(228, 'PLT-P1-D26A-A2001-047'),
(229, 'PLT-P1-D26A-A2001-048'),
(230, 'PLT-P1-D26A-A2001-049'),
(231, 'PLT-P1-D26A-A2001-050'),
(232, 'PLT-P1-D26A-A2001-051'),
(233, 'PLT-P1-D26A-A2001-052'),
(234, 'PLT-P1-D26A-A2001-053'),
(235, 'PLT-P1-D26A-A2001-054'),
(236, 'PLT-P1-D26A-A2001-055'),
(237, 'PLT-P1-D26A-A2001-056'),
(238, 'PLT-P1-D26A-A2001-057'),
(239, 'PLT-P1-D26A-A2001-058'),
(240, 'PLT-P1-D26A-A2001-059'),
(241, 'PLT-P1-D26A-A2001-060'),
(242, 'PLT-P1-D26A-A2001-061'),
(243, 'PLT-P1-D26A-A2002-001'),
(244, 'PLT-P1-D26A-A2002-002'),
(245, 'PLT-P1-D26A-A2002-003'),
(246, 'PLT-P1-D26A-A2002-004'),
(247, 'PLT-P1-D26A-A2002-005'),
(248, 'PLT-P1-D26A-A2002-006'),
(249, 'PLT-P1-D26A-A2002-007'),
(250, 'PLT-P1-D26A-A2002-008'),
(251, 'PLT-P1-D26A-A2002-009'),
(252, 'PLT-P1-D26A-A2002-010'),
(253, 'PLT-P1-D26A-A2002-011'),
(254, 'PLT-P1-D26A-A2002-012'),
(255, 'PLT-P1-D26A-A2002-013'),
(256, 'PLT-P1-D26A-A2002-014'),
(257, 'PLT-P1-D26A-A2002-015'),
(258, 'PLT-P1-D26A-A2002-016'),
(259, 'PLT-P1-D26A-A2002-017'),
(260, 'PLT-P1-D26A-A2002-018'),
(261, 'PLT-P1-D26A-A2002-019'),
(262, 'PLT-P1-D26A-A2002-020'),
(263, 'PLT-P1-D26A-A2002-021'),
(264, 'PLT-P1-D26A-A2002-022'),
(265, 'PLT-P1-D26A-A2002-023'),
(266, 'PLT-P1-D26A-A2002-024'),
(267, 'PLT-P1-D26A-A2002-025'),
(268, 'PLT-P1-D26A-A2002-026'),
(269, 'PLT-P1-D26A-A2002-027'),
(270, 'PLT-P1-D26A-A2002-028'),
(271, 'PLT-P1-D26A-A2002-029'),
(272, 'PLT-P1-D26A-A2002-030'),
(273, 'PLT-P1-D26A-A2002-031'),
(274, 'PLT-P1-D26A-A2002-032'),
(275, 'PLT-P1-D26A-A2002-033'),
(276, 'PLT-P1-D26A-A2002-034'),
(277, 'PLT-P1-D26A-A2002-035'),
(278, 'PLT-P1-D26A-A2002-036'),
(279, 'PLT-P1-D26A-A2002-037'),
(280, 'PLT-P1-D26A-A2002-038'),
(281, 'PLT-P1-D26A-A2002-039'),
(282, 'PLT-P1-D26A-A2002-040'),
(283, 'PLT-P1-D26A-A2002-041'),
(284, 'PLT-P1-D26A-A2002-042'),
(285, 'PLT-P1-D26A-A2002-043'),
(286, 'PLT-P1-D26A-A2002-044'),
(287, 'PLT-P1-D26A-A2002-045'),
(288, 'PLT-P1-D26A-A2002-046'),
(289, 'PLT-P1-D26A-A2002-047'),
(290, 'PLT-P1-D26A-A2002-048'),
(291, 'PLT-P1-D26A-A2002-049'),
(292, 'PLT-P1-D26A-A2002-050'),
(293, 'PLT-P1-D26A-A2002-051'),
(294, 'PLT-P1-D26A-A2002-052'),
(295, 'PLT-P1-D26A-A2002-053'),
(296, 'PLT-P1-D26A-A2002-054'),
(297, 'PLT-P1-D26A-A2002-055'),
(298, 'PLT-P1-D26A-A2002-056'),
(299, 'PLT-P1-D26A-A2002-057'),
(300, 'PLT-P1-D26A-A2002-058'),
(301, 'PLT-P1-D26A-A2002-059'),
(302, 'PLT-P1-D26A-A2002-060'),
(303, 'PLT-P1-D26A-A2002-061'),
(304, 'PLT-P1-D26A-A2011-001'),
(305, 'PLT-P1-D26A-A2011-002'),
(306, 'PLT-P1-D26A-A2011-003'),
(307, 'PLT-P1-D26A-A2011-004'),
(308, 'PLT-P1-D26A-A2011-005'),
(309, 'PLT-P1-D26A-A2011-006'),
(310, 'PLT-P1-D26A-A2011-007'),
(311, 'PLT-P1-D26A-A2011-008'),
(312, 'PLT-P1-D26A-A2011-009'),
(313, 'PLT-P1-D26A-A2011-010'),
(314, 'PLT-P1-D26A-A2011-011'),
(315, 'PLT-P1-D26A-A2011-012'),
(316, 'PLT-P1-D26A-A2011-013'),
(317, 'PLT-P1-D26A-A2011-014'),
(318, 'PLT-P1-D26A-A2011-015'),
(319, 'PLT-P1-D26A-A2011-016'),
(320, 'PLT-P1-D26A-A2011-017'),
(321, 'PLT-P1-D26A-A2011-018'),
(322, 'PLT-P1-D26A-A2011-019'),
(323, 'PLT-P1-D26A-A2011-020'),
(324, 'PLT-P1-D26A-A2011-021'),
(325, 'PLT-P1-D26A-A2011-022'),
(326, 'PLT-P1-D26A-A2011-023'),
(327, 'PLT-P1-D26A-A2011-024'),
(328, 'PLT-P1-D26A-A2011-025'),
(329, 'PLT-P1-D26A-A2012-001'),
(330, 'PLT-P1-D26A-A2012-002'),
(331, 'PLT-P1-D26A-A2012-003'),
(332, 'PLT-P1-D26A-A2012-004'),
(333, 'PLT-P1-D26A-A2012-005'),
(334, 'PLT-P1-D26A-A2012-006'),
(335, 'PLT-P1-D26A-A2012-007'),
(336, 'PLT-P1-D26A-A2012-008'),
(337, 'PLT-P1-D26A-A2012-009'),
(338, 'PLT-P1-D26A-A2012-010'),
(339, 'PLT-P1-D26A-A2012-011'),
(340, 'PLT-P1-D26A-A2012-012'),
(341, 'PLT-P1-D26A-A2012-013'),
(342, 'PLT-P1-D26A-A2012-014'),
(343, 'PLT-P1-D26A-A2012-015'),
(344, 'PLT-P1-D26A-A2012-016'),
(345, 'PLT-P1-D26A-A2012-017'),
(346, 'PLT-P1-D26A-A2012-018'),
(347, 'PLT-P1-D26A-A2012-019'),
(348, 'PLT-P1-D26A-A2012-020'),
(349, 'PLT-P1-D26A-A2012-021'),
(350, 'PLT-P1-D26A-A2012-022'),
(351, 'PLT-P1-D26A-A2012-023'),
(352, 'PLT-P1-D26A-A2012-024'),
(353, 'PLT-P1-D26A-A2012-025'),
(354, 'PLT-P1-D26A-A2013-001'),
(355, 'PLT-P1-D26A-A2013-002'),
(356, 'PLT-P1-D26A-A2013-003'),
(357, 'PLT-P1-D26A-A2013-004'),
(358, 'PLT-P1-D26A-A2013-005'),
(359, 'PLT-P1-D26A-A2013-006'),
(360, 'PLT-P1-D26A-A2013-007'),
(361, 'PLT-P1-D26A-A2014-001'),
(362, 'PLT-P1-D26A-A2014-002'),
(363, 'PLT-P1-D26A-A2014-003'),
(364, 'PLT-P1-D26A-A2014-004'),
(365, 'PLT-P1-D26A-A2014-005'),
(366, 'PLT-P1-D26A-A2014-006'),
(367, 'PLT-P1-D26A-A2014-007'),
(368, 'PLT-P1-D26A-A2015-001'),
(369, 'PLT-P1-D26A-A2015-002'),
(370, 'PLT-P1-D26A-A2015-003'),
(371, 'PLT-P1-D26A-A2015-004'),
(372, 'PLT-P1-D26A-A2015-005'),
(373, 'PLT-P1-D26A-A2015-006'),
(374, 'PLT-P1-D26A-A2015-007'),
(375, 'PLT-P1-D26A-A2015-008'),
(376, 'PLT-P1-D26A-A2015-009'),
(377, 'PLT-P1-D26A-A2015-010'),
(378, 'PLT-P1-D26A-A2016-001'),
(379, 'PLT-P1-D26A-A2016-002'),
(380, 'PLT-P1-D26A-A2016-003'),
(381, 'PLT-P1-D26A-A2016-004'),
(382, 'PLT-P1-D26A-A2016-005'),
(383, 'PLT-P1-D26A-A2016-006'),
(384, 'PLT-P1-D26A-A2016-007'),
(385, 'PLT-P1-D26A-A2016-008'),
(386, 'PLT-P1-D26A-A2016-009'),
(387, 'PLT-P1-D26A-A2016-010'),
(388, 'PLT-P1-D26A-A3001-001'),
(389, 'PLT-P1-D26A-A3001-002'),
(390, 'PLT-P1-D26A-A3001-003'),
(391, 'PLT-P1-D26A-A3001-004'),
(392, 'PLT-P1-D26A-A3001-005'),
(393, 'PLT-P1-D26A-A3001-006'),
(394, 'PLT-P1-D26A-A3001-007'),
(395, 'PLT-P1-D26A-A3001-008'),
(396, 'PLT-P1-D26A-A3001-009'),
(397, 'PLT-P1-D26A-A3001-010'),
(398, 'PLT-P1-D26A-A3001-011'),
(399, 'PLT-P1-D26A-A3001-012'),
(400, 'PLT-P1-D26A-A3001-013'),
(401, 'PLT-P1-D26A-A3001-014'),
(402, 'PLT-P1-D26A-A3001-015'),
(403, 'PLT-P1-D26A-A3001-016'),
(404, 'PLT-P1-D26A-A3001-017'),
(405, 'PLT-P1-D26A-A3001-018'),
(406, 'PLT-P1-D26A-A3001-019'),
(407, 'PLT-P1-D26A-A3001-020'),
(408, 'PLT-P1-D26A-A3001-021'),
(409, 'PLT-P1-D26A-A3001-022'),
(410, 'PLT-P1-D26A-A3001-023'),
(411, 'PLT-P1-D26A-A3001-024'),
(412, 'PLT-P1-D26A-A3001-025'),
(413, 'PLT-P1-D26A-A3001-026'),
(414, 'PLT-P1-D26A-A3001-027'),
(415, 'PLT-P1-D26A-A3001-028'),
(416, 'PLT-P1-D26A-A3001-029'),
(417, 'PLT-P1-D26A-A3001-030'),
(418, 'PLT-P1-D26A-A3001-031'),
(419, 'PLT-P1-D26A-A3001-032'),
(420, 'PLT-P1-D26A-A3001-033'),
(421, 'PLT-P1-D26A-A3001-034'),
(422, 'PLT-P1-D26A-A3001-035'),
(423, 'PLT-P1-D26A-A3001-036'),
(424, 'PLT-P1-D26A-A3001-037'),
(425, 'PLT-P1-D26A-A3001-038'),
(426, 'PLT-P1-D26A-A3001-039'),
(427, 'PLT-P1-D26A-A3001-040'),
(428, 'PLT-P1-D26A-A3001-041'),
(429, 'PLT-P1-D26A-A3001-042'),
(430, 'PLT-P1-D26A-A3001-043'),
(431, 'PLT-P1-D26A-A3001-044'),
(432, 'PLT-P1-D26A-A3001-045'),
(433, 'PLT-P1-D26A-A3001-046'),
(434, 'PLT-P1-D26A-A3001-047'),
(435, 'PLT-P1-D26A-A3001-048'),
(436, 'PLT-P1-D26A-A3001-049'),
(437, 'PLT-P1-D26A-A3001-050'),
(438, 'PLT-P1-D26A-A3001-051'),
(439, 'PLT-P1-D26A-A3001-052'),
(440, 'PLT-P1-D26A-A3001-053'),
(441, 'PLT-P1-D26A-A3001-054'),
(442, 'PLT-P1-D26A-A3001-055'),
(443, 'PLT-P1-D26A-A3001-056'),
(444, 'PLT-P1-D26A-A3001-057'),
(445, 'PLT-P1-D26A-A3001-058'),
(446, 'PLT-P1-D26A-A3001-059'),
(447, 'PLT-P1-D26A-A3001-060'),
(448, 'PLT-P1-D26A-A3001-061'),
(449, 'PLT-P1-D26A-A4005-001'),
(450, 'PLT-P1-D26A-A4005-002'),
(451, 'PLT-P1-D26A-A4005-003'),
(452, 'PLT-P1-D26A-A4005-004'),
(453, 'PLT-P1-D26A-A4005-005'),
(454, 'PLT-P1-D26A-A4005-006'),
(455, 'PLT-P1-D26A-A4005-007'),
(456, 'PLT-P1-D26A-A4005-008'),
(457, 'PLT-P1-D26A-A4005-009'),
(458, 'PLT-P1-D26A-A4005-010'),
(459, 'PLT-P1-D26A-A4005-011'),
(460, 'PLT-P1-D26A-A4005-012'),
(461, 'PLT-P1-D26A-A4005-013'),
(462, 'PLT-P1-D26A-A4005-014'),
(463, 'PLT-P1-D26A-A4005-015'),
(464, 'PLT-P1-D26A-A4005-016'),
(465, 'PLT-P1-D26A-A4005-017'),
(466, 'PLT-P1-D26A-A4005-018'),
(467, 'PLT-P1-D26A-A4005-019'),
(468, 'PLT-P1-D26A-A4005-020'),
(469, 'PLT-P1-D26A-A4005-021'),
(470, 'PLT-P1-D26A-A4005-022'),
(471, 'PLT-P1-D26A-A4005-023'),
(472, 'PLT-P1-D26A-A4005-024'),
(473, 'PLT-P1-D26A-A4005-025'),
(474, 'PLT-P1-D26A-A4005-026'),
(475, 'PLT-P1-D26A-A4005-027'),
(476, 'PLT-P1-D26A-A4005-028'),
(477, 'PLT-P1-D26A-A4005-029'),
(478, 'PLT-P1-D26A-A4005-030'),
(479, 'PLT-P1-D26A-A4005-031'),
(480, 'PLT-P1-D26A-A4005-032'),
(481, 'PLT-P1-D26A-A4005-033'),
(482, 'PLT-P1-D26A-A4005-034'),
(483, 'PLT-P1-D26A-A4005-035'),
(484, 'PLT-P1-D26A-A4005-036'),
(485, 'PLT-P1-D26A-A4005-037'),
(486, 'PLT-P1-D26A-A4005-038'),
(487, 'PLT-P1-D26A-A4005-039'),
(488, 'PLT-P1-D26A-A4005-040'),
(489, 'PLT-P1-D26A-A4005-041'),
(490, 'PLT-P1-D26A-A4005-042'),
(491, 'PLT-P1-D26A-A4005-043'),
(492, 'PLT-P1-D26A-A4005-044'),
(493, 'PLT-P1-D26A-A4005-045'),
(494, 'PLT-P1-D26A-A4005-046'),
(495, 'PLT-P1-D26A-A4005-047'),
(496, 'PLT-P1-D26A-A4005-048'),
(497, 'PLT-P1-D26A-A4005-049'),
(498, 'PLT-P1-D26A-A4005-050'),
(499, 'PLT-P1-D26A-A4005-051'),
(500, 'PLT-P1-D26A-A4005-052'),
(501, 'PLT-P1-D26A-A4005-053'),
(502, 'PLT-P1-D26A-A4005-054'),
(503, 'PLT-P1-D26A-A4005-055'),
(504, 'PLT-P1-D26A-A4005-056'),
(505, 'PLT-P1-D26A-A4005-057'),
(506, 'PLT-P1-D26A-A4005-058'),
(507, 'PLT-P1-D26A-A4005-059'),
(508, 'PLT-P1-D26A-A4005-060'),
(509, 'PLT-P1-D26A-A4005-061'),
(510, 'PLT-P1-D26A-A4005-062'),
(511, 'PLT-P1-D26A-A4005-063'),
(512, 'PLT-P1-D26A-A4005-064'),
(513, 'PLT-P1-D26A-A4005-065'),
(514, 'PLT-P1-D26A-A4005-066'),
(515, 'PLT-P1-D26A-A4005-067'),
(516, 'PLT-P1-D26A-A4006-001'),
(517, 'PLT-P1-D26A-A4006-002'),
(518, 'PLT-P1-D26A-A4006-003'),
(519, 'PLT-P1-D26A-A4006-004'),
(520, 'PLT-P1-D26A-A4006-005'),
(521, 'PLT-P1-D26A-A4006-006'),
(522, 'PLT-P1-D26A-A4006-007'),
(523, 'PLT-P1-D26A-A4006-008'),
(524, 'PLT-P1-D26A-A4006-009'),
(525, 'PLT-P1-D26A-A4006-010'),
(526, 'PLT-P1-D26A-A4006-011'),
(527, 'PLT-P1-D26A-A4006-012'),
(528, 'PLT-P1-D26A-A4006-013'),
(529, 'PLT-P1-D26A-A4006-014'),
(530, 'PLT-P1-D26A-A4006-015'),
(531, 'PLT-P1-D26A-A4006-016'),
(532, 'PLT-P1-D26A-A4006-017'),
(533, 'PLT-P1-D26A-A4006-018'),
(534, 'PLT-P1-D26A-A4006-019'),
(535, 'PLT-P1-D26A-A4006-020'),
(536, 'PLT-P1-D26A-A4006-021'),
(537, 'PLT-P1-D26A-A4006-022'),
(538, 'PLT-P1-D26A-A4006-023'),
(539, 'PLT-P1-D26A-A4006-024'),
(540, 'PLT-P1-D26A-A4006-025'),
(541, 'PLT-P1-D26A-A4006-026'),
(542, 'PLT-P1-D26A-A4006-027'),
(543, 'PLT-P1-D26A-A4006-028'),
(544, 'PLT-P1-D26A-A4006-029'),
(545, 'PLT-P1-D26A-A4006-030'),
(546, 'PLT-P1-D26A-A4006-031'),
(547, 'PLT-P1-D26A-A4006-032'),
(548, 'PLT-P1-D26A-A4006-033'),
(549, 'PLT-P1-D26A-A4006-034'),
(550, 'PLT-P1-D26A-A4006-035'),
(551, 'PLT-P1-D26A-A4006-036'),
(552, 'PLT-P1-D26A-A4006-037'),
(553, 'PLT-P1-D26A-A4006-038'),
(554, 'PLT-P1-D26A-A4006-039'),
(555, 'PLT-P1-D26A-A4006-040'),
(556, 'PLT-P1-D26A-A4006-041'),
(557, 'PLT-P1-D26A-A4006-042'),
(558, 'PLT-P1-D26A-A4006-043'),
(559, 'PLT-P1-D26A-A4006-044'),
(560, 'PLT-P1-D26A-A4006-045'),
(561, 'PLT-P1-D26A-A4006-046'),
(562, 'PLT-P1-D26A-A4006-047'),
(563, 'PLT-P1-D26A-A4006-048'),
(564, 'PLT-P1-D26A-A4006-049'),
(565, 'PLT-P1-D26A-A4006-050'),
(566, 'PLT-P1-D26A-A4006-051'),
(567, 'PLT-P1-D26A-A4006-052'),
(568, 'PLT-P1-D26A-A4006-053'),
(569, 'PLT-P1-D26A-A4006-054'),
(570, 'PLT-P1-D26A-A4006-055'),
(571, 'PLT-P1-D26A-A4006-056'),
(572, 'PLT-P1-D26A-A4006-057'),
(573, 'PLT-P1-D26A-A4006-058'),
(574, 'PLT-P1-D26A-A4006-059'),
(575, 'PLT-P1-D26A-A4006-060'),
(576, 'PLT-P1-D26A-A4006-061'),
(577, 'PLT-P1-D26A-A4006-062'),
(578, 'PLT-P1-D26A-A4006-063'),
(579, 'PLT-P1-D26A-A4006-064'),
(580, 'PLT-P1-D26A-A4006-065'),
(581, 'PLT-P1-D26A-A4006-066'),
(582, 'PLT-P1-D26A-A4006-067'),
(583, 'PLT-P1-D26A-A4020-001'),
(584, 'PLT-P1-D26A-A4020-002'),
(585, 'PLT-P1-D26A-A4020-003'),
(586, 'PLT-P1-D26A-A4020-004'),
(587, 'PLT-P1-D26A-A4020-005'),
(588, 'PLT-P1-D26A-A4020-006'),
(589, 'PLT-P1-D26A-A4020-007'),
(590, 'PLT-P1-D26A-A4020-008'),
(591, 'PLT-P1-D26A-A4020-009'),
(592, 'PLT-P1-D26A-A4020-010'),
(593, 'PLT-P1-D26A-A4020-011'),
(594, 'PLT-P1-D26A-A4020-012'),
(595, 'PLT-P1-D26A-A4020-013'),
(596, 'PLT-P1-D26A-A4020-014'),
(597, 'PLT-P1-D26A-A4020-015'),
(598, 'PLT-P1-D26A-A4020-016'),
(599, 'PLT-P1-D26A-A4020-017'),
(600, 'PLT-P1-D26A-A4020-018'),
(601, 'PLT-P1-D26A-A4020-019'),
(602, 'PLT-P1-D26A-A4020-020'),
(603, 'PLT-P1-D26A-A4020-021'),
(604, 'PLT-P1-D26A-A4020-022'),
(605, 'PLT-P1-D26A-A4020-023'),
(606, 'PLT-P1-D26A-A4020-024'),
(607, 'PLT-P1-D26A-A4020-025'),
(608, 'PLT-P1-D26A-A4020-026'),
(609, 'PLT-P1-D26A-A4020-027'),
(610, 'PLT-P1-D26A-A4020-028'),
(611, 'PLT-P1-D26A-A4020-029'),
(612, 'PLT-P1-D26A-A4019-001'),
(613, 'PLT-P1-D26A-A4019-002'),
(614, 'PLT-P1-D26A-A4019-003'),
(615, 'PLT-P1-D26A-A4019-004'),
(616, 'PLT-P1-D26A-A4019-005'),
(617, 'PLT-P1-D26A-A4019-006'),
(618, 'PLT-P1-D26A-A4019-007'),
(619, 'PLT-P1-D26A-A4019-008'),
(620, 'PLT-P1-D26A-A4019-009'),
(621, 'PLT-P1-D26A-A4019-010'),
(622, 'PLT-P1-D26A-A4019-011'),
(623, 'PLT-P1-D26A-A4019-012'),
(624, 'PLT-P1-D26A-A4019-013'),
(625, 'PLT-P1-D26A-A4019-014'),
(626, 'PLT-P1-D26A-A4019-015'),
(627, 'PLT-P1-D26A-A4019-016'),
(628, 'PLT-P1-D26A-A4019-017'),
(629, 'PLT-P1-D26A-A4019-018'),
(630, 'PLT-P1-D26A-A4019-019'),
(631, 'PLT-P1-D26A-A4019-020'),
(632, 'PLT-P1-D26A-A4019-021'),
(633, 'PLT-P1-D26A-A4019-022'),
(634, 'PLT-P1-D26A-A4019-023'),
(635, 'PLT-P1-D26A-A4019-024'),
(636, 'PLT-P1-D26A-A4019-025'),
(637, 'PLT-P1-D26A-A4019-026'),
(638, 'PLT-P1-D26A-A4019-027'),
(639, 'PLT-P1-D26A-A4019-028'),
(640, 'PLT-P1-D26A-A4019-029'),
(641, 'PLT-P1-D26A-A3003-001'),
(642, 'PLT-P1-D26A-A3003-002'),
(643, 'PLT-P1-D26A-A3003-003'),
(644, 'PLT-P1-D26A-A3003-004'),
(645, 'PLT-P1-D26A-A3003-005'),
(646, 'PLT-P1-D26A-A3003-006'),
(647, 'PLT-P1-D26A-A3003-007'),
(648, 'PLT-P1-D26A-A3003-008'),
(649, 'PLT-P1-D26A-A3003-009'),
(650, 'PLT-P1-D26A-A3003-010'),
(651, 'PLT-P1-D26A-A3003-011'),
(652, 'PLT-P1-D26A-A3003-012'),
(653, 'PLT-P1-D26A-A3003-013'),
(654, 'PLT-P1-D26A-A3003-014'),
(655, 'PLT-P1-D26A-A4022-001'),
(656, 'PLT-P1-D26A-A4022-002'),
(657, 'PLT-P1-D26A-A4022-003'),
(658, 'PLT-P1-D26A-A4022-004'),
(659, 'PLT-P1-D26A-A4022-005'),
(660, 'PLT-P1-D26A-A4022-006'),
(661, 'PLT-P1-D26A-A4022-007'),
(662, 'PLT-P1-D26A-A4022-008'),
(663, 'PLT-P1-D26A-A4022-009'),
(664, 'PLT-P1-D26A-A4022-010'),
(665, 'PLT-P1-D26A-A4022-011'),
(666, 'PLT-P1-D26A-A4022-012'),
(667, 'PLT-P1-D26A-A4022-013'),
(668, 'PLT-P1-D26A-A4022-014'),
(669, 'PLT-P1-D26A-A4022-015'),
(670, 'PLT-P1-D26A-A4022-016'),
(671, 'PLT-P1-D26A-A4022-017'),
(672, 'PLT-P1-D26A-A4022-018'),
(673, 'PLT-P1-D26A-A4022-019'),
(674, 'PLT-P1-D26A-A4022-020'),
(675, 'PLT-P1-D26A-A4022-021'),
(676, 'PLT-P1-D26A-A4022-022'),
(677, 'PLT-P1-D26A-A4022-023'),
(678, 'PLT-P1-D26A-A4022-024'),
(679, 'PLT-P1-D26A-A4022-025'),
(680, 'PLT-P1-D26A-A4022-026'),
(681, 'PLT-P1-D26A-A4022-027'),
(682, 'PLT-P1-D26A-A4031-001'),
(683, 'PLT-P1-D26A-A4031-002'),
(684, 'PLT-P1-D26A-A4031-003'),
(685, 'PLT-P1-D26A-A4031-004'),
(686, 'PLT-P1-D26A-A4031-005'),
(687, 'PLT-P1-D26A-A4031-006'),
(688, 'PLT-P1-D26A-A4031-007'),
(689, 'PLT-P1-D26A-A4032-001'),
(690, 'PLT-P1-D26A-A4032-002'),
(691, 'PLT-P1-D26A-A4032-003'),
(692, 'PLT-P1-D26A-A4032-004'),
(693, 'PLT-P1-D26A-A4032-005'),
(694, 'PLT-P1-D26A-A4032-006'),
(695, 'PLT-P1-D26A-A4032-007'),
(696, 'PLT-P1-D26A-A4039-001'),
(697, 'PLT-P1-D26A-A4039-002'),
(698, 'PLT-P1-D26A-A4039-003'),
(699, 'PLT-P1-D26A-A4039-004'),
(700, 'PLT-P1-D26A-A4039-005'),
(701, 'PLT-P1-D26A-A4039-006'),
(702, 'PLT-P1-D26A-A4039-007'),
(703, 'PLT-P1-D26A-A4040-001'),
(704, 'PLT-P1-D26A-A4040-002'),
(705, 'PLT-P1-D26A-A4040-003'),
(706, 'PLT-P1-D26A-A4040-004'),
(707, 'PLT-P1-D26A-A4040-005'),
(708, 'PLT-P1-D26A-A4040-006'),
(709, 'PLT-P1-D26A-A4040-007'),
(710, 'PLT-P1-D26A-A4041-001'),
(711, 'PLT-P1-D26A-A4041-002'),
(712, 'PLT-P1-D26A-A4041-003'),
(713, 'PLT-P1-D26A-A4041-004'),
(714, 'PLT-P1-D26A-A4041-005'),
(715, 'PLT-P1-D26A-A4041-006'),
(716, 'PLT-P1-D26A-A4041-007'),
(717, 'PLT-P1-D26A-A4041-008'),
(718, 'PLT-P1-D26A-A4041-009'),
(719, 'PLT-P1-D26A-A4041-010'),
(720, 'PLT-P1-D26A-A4041-011'),
(721, 'PLT-P1-D26A-A4041-012'),
(722, 'PLT-P1-D26A-A4041-013'),
(723, 'PLT-P1-D26A-A4041-014'),
(724, 'PLT-P1-D26A-A4041-015'),
(725, 'PLT-P1-D26A-A4041-016'),
(726, 'PLT-P1-D26A-A4041-017'),
(727, 'PLT-P1-D26A-A4041-018'),
(728, 'PLT-P1-D26A-A4041-019'),
(729, 'PLT-P1-D26A-A4041-020'),
(730, 'PLT-P1-D26A-A4041-021'),
(731, 'PLT-P1-D26A-A4041-022'),
(732, 'PLT-P1-D26A-A4041-023'),
(733, 'PLT-P1-D26A-A4041-024'),
(734, 'PLT-P1-D26A-A4041-025'),
(735, 'PLT-P1-D26A-A4041-026'),
(736, 'PLT-P1-D26A-A4041-027'),
(737, 'PLT-P1-D26A-A4041-028'),
(738, 'PLT-P1-D26A-A4042-001'),
(739, 'PLT-P1-D26A-A4042-002'),
(740, 'PLT-P1-D26A-A4042-003'),
(741, 'PLT-P1-D26A-A4042-004'),
(742, 'PLT-P1-D26A-A4042-005'),
(743, 'PLT-P1-D26A-A4042-006'),
(744, 'PLT-P1-D26A-A4042-007'),
(745, 'PLT-P1-D26A-A4042-008'),
(746, 'PLT-P1-D26A-A4042-009'),
(747, 'PLT-P1-D26A-A4042-010'),
(748, 'PLT-P1-D26A-A4042-011'),
(749, 'PLT-P1-D26A-A4042-012'),
(750, 'PLT-P1-D26A-A4042-013'),
(751, 'PLT-P1-D26A-A4042-014'),
(752, 'PLT-P1-D26A-A4042-015'),
(753, 'PLT-P1-D26A-A4042-016'),
(754, 'PLT-P1-D26A-A4042-017'),
(755, 'PLT-P1-D26A-A4042-018'),
(756, 'PLT-P1-D26A-A4042-019'),
(757, 'PLT-P1-D26A-A4042-020'),
(758, 'PLT-P1-D26A-A4042-021'),
(759, 'PLT-P1-D26A-A4042-022'),
(760, 'PLT-P1-D26A-A4042-023'),
(761, 'PLT-P1-D26A-A4042-024'),
(762, 'PLT-P1-D26A-A4042-025'),
(763, 'PLT-P1-D26A-A4042-026'),
(764, 'PLT-P1-D26A-A4042-027'),
(765, 'PLT-P1-D26A-A4042-028');

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
(24, 'WH Door Assy', '-', '-');

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
(143, 'andonvendor', 'andon', 'vendor', '-', 'Andon Outhouse', 'andon/general?proses=Subcont', '-', 4),
(105, 'masterpart', 'master', 'part', '-', 'Master Part', 'master/data', 'tbl_master_part', 1),
(120, 'security-', 'security', '-', 'fa-key', 'Change Password', 'action/password', '-', 100),
(121, 'andon-', 'andon', '-', 'fa-desktop', 'Andon', '-', '-', 1),
(122, 'andonppc', 'andon', 'ppc', '-', 'Andon PPC', 'andon/ppc', '-', 2),
(123, 'stock-', 'stock', '-', 'fa-rocket', 'Input Stock', '-', '-', 1),
(125, 'stockinput_ppc', 'stock', 'input_ppc', '-', 'Input PPC', 'master/transaction', 'tbl_input_ppc', 2),
(139, 'stockinput_sa', 'stock', 'input_sa', '-', 'Input Door Assy', 'master/transaction', 'tbl_input_general', 6),
(141, 'masterpatan', 'master', 'patan', '-', 'Master Daily Patan', 'master/data', 'tbl_master_patan', 3),
(144, 'stockinput_dock', 'stock', 'input_dock', '-', 'Input Docking', 'master/transaction', 'tbl_input_general', 3),
(145, 'masterqr_code', 'master', 'qr_code', '-', 'QR Maker', 'master/data', 'tbl_master_qr', 1);

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
(1191, 'masterpart', 'Administrator', 'yes', 'no', 'no', 'no'),
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
(1432, 'andonppc', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1433, 'stock-', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1431, 'andon-', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1429, 'masterpart', 'WH Docking', 'yes', 'no', 'no', 'no'),
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
(1478, 'stockinput_dock', 'Administrator', 'yes', 'no', 'no', 'no'),
(1474, 'andonvendor', 'Management', 'yes', 'no', 'no', 'no'),
(1422, 'systemmenu', 'WH Docking', 'no', 'no', 'no', 'no'),
(1407, 'mastershop', 'PPC', 'no', 'no', 'no', 'no'),
(1409, 'masterpart', 'PPC', 'yes', 'no', 'no', 'no'),
(1410, 'security-', 'PPC', 'yes', 'no', 'no', 'no'),
(1411, 'andon-', 'PPC', 'yes', 'no', 'no', 'no'),
(1412, 'andonppc', 'PPC', 'yes', 'no', 'no', 'no'),
(1413, 'stock-', 'PPC', 'yes', 'no', 'no', 'no'),
(1414, 'stockinput_ppc', 'PPC', 'yes', 'yes', 'yes', 'yes'),
(1415, 'stockinput_sa', 'PPC', 'no', 'no', 'no', 'no'),
(1476, 'andonvendor', 'WH Docking', 'yes', 'no', 'no', 'no'),
(1457, 'masterpatan', 'Administrator', 'yes', 'no', 'no', 'no'),
(1458, 'masterpatan', 'Admin_area', 'no', 'no', 'no', 'no'),
(1459, 'masterpatan', 'User', 'no', 'no', 'no', 'no'),
(1460, 'masterpatan', 'Management', 'no', 'no', 'no', 'no'),
(1462, 'masterpatan', 'WH Docking', 'no', 'no', 'no', 'no'),
(1463, 'masterpatan', 'PPC', 'no', 'no', 'no', 'no'),
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
(1497, 'masterpart', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1498, 'security-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1499, 'andon-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1500, 'andonppc', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1501, 'stock-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1502, 'stockinput_ppc', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1503, 'stockinput_sa', 'WH Door Assy', 'yes', 'yes', 'yes', 'yes'),
(1504, 'masterpatan', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1505, 'stockinput_dock', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1506, 'masterqr_code', 'Administrator', 'yes', 'no', 'no', 'no'),
(1507, 'masterqr_code', 'Admin_area', 'no', 'no', 'no', 'no'),
(1508, 'masterqr_code', 'User', 'no', 'no', 'no', 'no'),
(1509, 'masterqr_code', 'Management', 'no', 'no', 'no', 'no'),
(1510, 'masterqr_code', 'WH Docking', 'no', 'no', 'no', 'no'),
(1511, 'masterqr_code', 'PPC', 'no', 'no', 'no', 'no'),
(1512, 'masterqr_code', 'WH Door Assy', 'no', 'no', 'no', 'no');

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
('2022-01-02 11:15:46', 'tbl_master_patan', 62, 62, 63),
('2021-12-14 09:10:09', 'tbl_input_general', 15, 15, 15),
('2022-01-14 02:11:46', 'tbl_master_part', 343, 343, 344),
('2021-12-24 08:49:15', 'tbl_input_ppc', 7, 7, 7),
('2022-01-13 02:56:10', 'tbl_master_qr', 28, 28, 29);

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
(2, '56540', 'b2fb06abbe7ea77e4c53cbf7ea3fd15b294', 'DMUKTICO', 56540, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2022-01-15 11:47:17', '2021-12-27 08:48:40', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(12, '3007', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiyanto', 3007, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'foreman', 'B', '2021-11-01 11:00:22', '2021-12-16 13:17:12', '2021-12-15 16:09:21', '89f3d7b16c27a055a30d38bca7e7f0ab5542ba31'),
(9, '23817', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiarto', 23817, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'foreman', 'A', '2021-11-01 10:41:02', '2021-12-15 16:09:55', '2021-12-15 16:03:33', '442a51d14f1917ba0ef8b1a4adeed35b2db170fb'),
(10, '9404', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Saifullah', 9404, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'foreman', 'B', '2021-11-01 10:41:45', NULL, NULL, '635f2d4dff80d7860dc816462c567d642138de10'),
(11, '3216', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Aris Senjaya', 3216, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'foreman', 'A', '2021-11-01 10:42:17', NULL, NULL, '05a6138f890eaede3f6df558adf702a8baaeabcc'),
(31, '2564', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Andreas Harsono', 2564, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:55:43', NULL, NULL, 'ca6127548f5d554e88006c7a6e69682a9c6727d9'),
(32, '22474', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Didik Prastowo', 22474, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:56:06', '2021-11-10 16:55:29', '2021-11-10 16:55:38', '138d7f9cd1c003484174b577fe28cd7161b9cab7'),
(36, '65597', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Gita Yoan S. U.', 65597, NULL, 'Admin', 'Management', 'Admin', 'PPC', 'supervisor', 'N', '2021-11-02 09:03:15', NULL, NULL, 'a565b3324b2cf8065a7ccfa0d225565678e65fd9'),
(64, '54013', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'RIKI PANTRIO HATA', 54013, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'member', 'A', '2021-12-01 14:45:07', NULL, NULL, '9fd6595aae3a06aa3dcbcf5edb1d9e22cb5f2b86'),
(62, '3197', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'RAWAL FENDY', 3197, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'A', '2021-12-01 14:42:26', NULL, NULL, '03ab6dbc57875b0957b156b6996c685b5fe9dfd6'),
(61, '38233', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'FEBRI ANGGRIYAWAN', 38233, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'A', '2021-12-01 14:41:50', NULL, NULL, '416059a16b89edaeef0af39362173d009f7eb3bb'),
(60, '6948', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'SOFIAN ABDULRAHMAN', 6948, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'foreman', 'A', '2021-12-01 14:41:06', NULL, NULL, '648975a09f1ac5cbd2504db4bbc83a050f05f6ea'),
(59, '21928', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'NUR IMAN SYARIF HIDAYAT', 21928, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'B', '2021-12-01 14:40:26', NULL, NULL, 'bd1e303c7224a5895e00e7efce332608875c8346'),
(58, '15883', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'ALIM NUR FAUZAN', 15883, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'B', '2021-12-01 14:39:43', NULL, NULL, '3a66ae50b56db43729ed0f51d803ca81f2135682'),
(57, '9206', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Yuli Wibowo', 9206, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'foreman', 'B', '2021-12-01 14:38:57', '2021-12-16 07:53:24', '2021-12-16 08:33:18', '1857a5724101c52c1716817cbf60ff4bb611ce54'),
(63, '32553', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'FAUZAN AMIEN', 32553, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'member', 'A', '2021-12-01 14:44:21', NULL, NULL, '36f77a032ea899612be3212ae7788614f4cf50ab'),
(65, '1', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Farhan', 72328, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2021-12-09 20:13:11', '2021-12-01 16:27:53', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(66, '71892', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Roy Nurandre Nugroho', 71892, NULL, 'Admin', 'Admin_area', 'Admin', 'MDIC', 'foreman', 'N', '2021-12-13 22:28:25', NULL, NULL, '56d94edd918386bbf5de071f0a01a9483481efe3');

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
('10.59.37.118', '321b5892509c36c367ebe6fce341b00dd39fffb7', '2021-11-10 01:14:08'),
('10.59.37.152', '442a51d14f1917ba0ef8b1a4adeed35b2db170fb', '2021-12-15 09:09:55');

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
-- AUTO_INCREMENT for table `tbl_input_general`
--
ALTER TABLE `tbl_input_general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_input_ppc`
--
ALTER TABLE `tbl_input_ppc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_ip_address`
--
ALTER TABLE `tbl_ip_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_master_part`
--
ALTER TABLE `tbl_master_part`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `tbl_master_patan`
--
ALTER TABLE `tbl_master_patan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_master_qr`
--
ALTER TABLE `tbl_master_qr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=766;

--
-- AUTO_INCREMENT for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `tbl_menu_user`
--
ALTER TABLE `tbl_menu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1513;

--
-- AUTO_INCREMENT for table `tbl_title`
--
ALTER TABLE `tbl_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

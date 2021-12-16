-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2021 at 07:03 AM
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
('011c5f1d00ef6a3a203c262d7584b304', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 1639634520, 'a:3:{s:9:\"user_data\";s:0:\"\";s:7:\"isLogin\";b:1;s:7:\"timeout\";i:1639637393;}');

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
(1, 'A-1006', '57111-BZ290-00', 'A-1006, MEMBER, FR SIDE, FR RH/LH', 388, 'ABCD', 'ABCD', 1, 'B', 'PPC', 300, 0, 0, 0, 0, '6', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '3B', 'Yuli Wibowo', '2021-12-16 08:31:15'),
(2, 'A-4022', '67119-BZ040-00', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 388, 'ABCD', 'ABCD', 1, 'B', 'PPC', 130, 0, 0, 0, 0, '3', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '5A', 'Yuli Wibowo', '2021-12-16 08:31:36'),
(3, 'A-1014', '58311-BZ430-00', 'A-1014, PAN, REAR FLOOR', 388, 'ABCD', 'B', 1, 'N', 'IFP', 360, NULL, NULL, NULL, NULL, '7', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-14 16:13:27'),
(4, 'A-1002', '55111-BZD40-00', 'A-1002, PANEL, DASH', 219, 'ABCD', 'B', 2, 'N', 'IFP', 250, NULL, NULL, NULL, NULL, '9', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:13:27'),
(5, 'A-4041', '67149-BZ590-00', 'A-4041, PANEL, BACK DOOR, INSIDE', 345, 'ABCD', 'B', 1, 'N', 'IFP', 450, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-14 16:13:27'),
(6, 'A-1007', '57112-BZ310-00', 'A-1007, MEMBER, FR SIDE, FR LH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 480, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '3B', 'DMUKTICO', '2021-12-14 16:13:27'),
(7, 'A-4031', '67133-BZ100-00', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 388, 'ABCD', 'B', 1, 'N', 'IFP', 550, NULL, NULL, NULL, NULL, '11', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:27'),
(8, 'A-1003', '55111-BZD50-00', 'A-1003, PANEL, DASH', 171, 'ABCD', 'B', 3, 'N', 'IFP', 250, NULL, NULL, NULL, NULL, '12', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:13:27'),
(9, 'A-2001', '61111-BZB50-00', 'A-2001, PANEL SIDE OUTER RH', 235, 'ABCD', 'B', 2, 'N', 'IFP', 300, NULL, NULL, NULL, NULL, '10', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '4A', 'DMUKTICO', '2021-12-14 16:13:27'),
(10, 'A-4020', '67118-BZ020-00', 'A-4020, PANEL, BACK DOOR, LWR OUTSIDE', 235, 'ABCD', 'B', 2, 'N', 'IFP', 376, NULL, NULL, NULL, NULL, '13', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:13:27'),
(11, 'A-1008', '57411-BZ310-00', 'A-1008, MEMBER, FLOOR SIDE, INNER RH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 600, NULL, NULL, NULL, NULL, '12', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:27'),
(12, 'A-4032', '67134-BZ110-00', 'A-4032, EXT,FR DOOR OUTS PNL REINF,RR LH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 600, NULL, NULL, NULL, NULL, '12', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:27'),
(13, 'A-4005', '53811-BZ570-00', 'A-4005, PANEL, FR FENDER, RH', 235, 'ABCD', 'B', 2, 'N', 'IFP', 420, NULL, NULL, NULL, NULL, '14', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '5A', 'DMUKTICO', '2021-12-14 16:13:27'),
(14, 'A-1009', '57412-BZ360-00', 'A-1009, MEMBER, FLOOR SIDE, INNER RH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 690, NULL, NULL, NULL, NULL, '14', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:27'),
(15, 'A-2016', '61746-BZ050-00', 'A-2016, REINF, BACK DOOR OPENING, LWR LH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 700, NULL, NULL, NULL, NULL, '14', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:27'),
(16, 'A-2013', '61731-BZ260-00', 'A-2013, PANEL, ROOF SIDE, INNER RH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 900, NULL, NULL, NULL, NULL, '19', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(17, 'A-4039', '67147-BZ190-00', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 1000, NULL, NULL, NULL, NULL, '21', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(18, 'S-1012', '57112-BZ210-00', 'S-1012, MEMBER, FR SIDE, FR LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 480, NULL, NULL, NULL, NULL, '16', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(19, 'K-4005', '53811-BZ172-00', 'K-4005, PANEL, FR FENDER, RH', 168, 'C', 'B', 3, 'N', 'IFP', 350, NULL, NULL, NULL, NULL, '17', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D40D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(20, 'K-4007', '53811-BZ182-00', 'K-4007, PANEL, FR FENDER, RH', 74, 'C', 'B', 6, 'N', 'IFP', 164, NULL, NULL, NULL, NULL, '18', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D40D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(21, 'T-2012', '61344-BZ210-00', 'T-2012, PILLAR, CTR BODY, INNER LH', 402, 'B', 'B', 1, 'N', 'IFP', 900, NULL, NULL, NULL, NULL, '18', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D14N', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(22, 'S-2012', '61772-BZ060-00', 'S-2012,FRAME,BACKDOOR OPEN UPR CORNER,LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 900, NULL, NULL, NULL, NULL, '30', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(23, 'S-1007', '57411-BZ250-00', 'S-1007, MEMBER, FLOOR SIDE, INNER RH', 138, 'TEIRYO', 'B', 3, 'N', 'IFP', 320, NULL, NULL, NULL, NULL, '19', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(24, 'T-2013', '61345-BZ150-00', 'T-2013, PILLAR, CTR BODY, INNER LWR RH', 401, 'A', 'B', 1, 'N', 'IFP', 900, NULL, NULL, NULL, NULL, '18', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D14N', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(25, 'S-1010', '57412-BZ400-00', 'S-1010, MEMBER, FLOOR SIDE, INNER LH', 101, 'TEIRYO', 'B', 5, 'N', 'IFP', 400, NULL, NULL, NULL, NULL, '32', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(26, 'T-2011', '61343-BZ200-00', 'T-2011, PILLAR, CTR BODY, INNER RH', 401, 'B', 'B', 1, 'N', 'IFP', 1100, NULL, NULL, NULL, NULL, '22', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D14N', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(27, 'S-1008', '57412-BZ320-00', 'S-1008, MEMBER, FLOOR SIDE, INNER LH', 138, 'TEIRYO', 'B', 3, 'N', 'IFP', 280, NULL, NULL, NULL, NULL, '16', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(28, 'S-4030', '67147-BZ180-00', 'S4030, PANEL, RR DOOR HINGE SIDE, RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 800, NULL, NULL, NULL, NULL, '27', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(29, 'S-4031', '67148-BZ180-00', 'S4031, PANEL, RR DOOR HINGE SIDE, LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 800, NULL, NULL, NULL, NULL, '27', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(30, 'S-1011', '57111-BZ270-00', 'S-1011, MEMBER, FR SIDE, FR RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 630, NULL, NULL, NULL, NULL, '21', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(31, 'A-4040', '67148-BZ190-00', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 388, 'ABCD', 'B', 1, 'N', 'IFP', 2000, NULL, NULL, NULL, NULL, '41', '0', '0', '0', '0', 'WH Door Assy', 'Inhouse', 'D26A', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(32, 'S-2011', '61771-BZ080-00', 'S-2011,FRAME,BACKDOOR OPEN UPR CORNER,RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 1000, NULL, NULL, NULL, NULL, '34', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(33, 'K-1130', '65621-BZ020-00', 'K-1130,PANEL, SIDE GATE, RH', 23, 'TEIRYO', 'B', 20, 'N', 'IFP', 0, NULL, 150, NULL, NULL, '0', '0', '52', '0', '0', 'WH Docking', 'Inhouse', 'D40D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(34, 'K-1131', '65622-BZ020-00', 'K-1131,PANEL, SIDE GATE, LH', 23, 'TEIRYO', 'B', 20, 'N', 'IFP', 0, NULL, 150, NULL, NULL, '0', '0', '52', '0', '0', 'WH Docking', 'Inhouse', 'D40D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(35, 'K-1132', '65751-BZ020-00', 'K-1132,PANEL, TAIL GATE', 23, 'TEIRYO', 'B', 20, 'N', 'IFP', 186, NULL, NULL, NULL, NULL, '65', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D40D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(36, 'N-2005', '61625-BZ190-00', 'N-2005, EXTENSION, QUARTER PANEL, RR RH', 193, '0', 'B', 2, 'N', 'IFP', 400, NULL, NULL, NULL, NULL, '17', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D30D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(37, 'N-2006', '61626-BZ180-00', 'N-2006, EXTENSION, QUARTER PANEL, RR LH', 193, '0', 'B', 2, 'N', 'IFP', 350, NULL, NULL, NULL, NULL, '15', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D30D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(38, 'N-4027', '67147-BZ150-00', 'N-4027, PANEL, RR DOOR HINGE SIDE, RH', 193, '0', 'B', 2, 'N', 'IFP', 600, NULL, NULL, NULL, NULL, '25', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D30D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(39, 'N-4028', '67148-BZ150-00', 'N-4028, PANEL, RR DOOR HINGE SIDE, LH', 193, '0', 'B', 2, 'N', 'IFP', 829, NULL, NULL, NULL, NULL, '34', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D30D', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(40, 'S-1007', '57411-BZ250-00', 'S-1007, MEMBER, FLOOR SIDE, INNER RH', 138, 'TEIRYO', 'B', 3, 'N', 'IFP', 320, NULL, NULL, NULL, NULL, '19', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(41, 'S-1008', '57412-BZ320-00', 'S-1008, MEMBER, FLOOR SIDE, INNER LH', 138, 'TEIRYO', 'B', 3, 'N', 'IFP', 451, NULL, NULL, NULL, NULL, '26', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(42, 'S-1009', '57411-BZ330-00', 'S-1009, MEMBER, FLOOR SIDE, INNER RH', 101, 'TEIRYO', 'B', 5, 'N', 'IFP', 320, NULL, NULL, NULL, NULL, '25', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(43, 'S-1010', '57412-BZ400-00', 'S-1010, MEMBER, FLOOR SIDE, INNER LH', 101, 'TEIRYO', 'B', 5, 'N', 'IFP', 340, NULL, NULL, NULL, NULL, '27', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(44, 'S-1011', '57111-BZ270-00', 'S-1011, MEMBER, FR SIDE, FR RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 480, NULL, NULL, NULL, NULL, '16', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(45, 'S-1012', '57112-BZ210-00', 'S-1012, MEMBER, FR SIDE, FR LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 1050, NULL, NULL, NULL, NULL, '35', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(46, 'S-1013', '52131-BZ170-00', 'S-1013, REINFORCEMENT, FR BUMPER', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 350, NULL, NULL, 600, NULL, '12', '0', '0', '20', '0', 'WH Docking', 'Inhouse', 'D55L', '3B', 'DMUKTICO', '2021-12-14 16:13:48'),
(47, 'S-2007', '61613-BZ070-00', 'S-2007, PANEL, QUARTER, INNER RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 756, NULL, NULL, 1400, NULL, '25', '0', '0', '47', '0', 'WH Docking', 'Inhouse', 'D55L', '3B', 'DMUKTICO', '2021-12-14 16:13:48'),
(48, 'S-2008', '61614-BZ070-00', 'S-2008, PANEL, QUARTER, INNER LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 600, NULL, NULL, 1600, NULL, '20', '0', '0', '54', '0', 'WH Docking', 'Inhouse', 'D55L', '3B', 'DMUKTICO', '2021-12-14 16:13:48'),
(49, 'S-2009', '61733-BZ030-00', 'S-2009, PANEL, ROOF SIDE, INNER FR RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 800, NULL, NULL, 1400, NULL, '27', '0', '0', '47', '0', 'WH Docking', 'Inhouse', 'D55L', '3B', 'DMUKTICO', '2021-12-14 16:13:48'),
(50, 'S-2010', '61734-BZ030-00', 'S-2010, PANEL, ROOF SIDE, INNER FR LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 865, NULL, NULL, NULL, NULL, '29', '0', '0', '0', '0', 'WH Docking', 'Inhouse', 'D55L', '3B', 'DMUKTICO', '2021-12-14 16:13:48'),
(51, 'S-2011', '61771-BZ080-00', 'S-2011,FRAME,BACKDOOR OPEN UPR CORNER,RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 400, NULL, NULL, 1800, NULL, '13', '0', '0', '60', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(52, 'S-2012', '61772-BZ060-00', 'S-2012,FRAME,BACKDOOR OPEN UPR CORNER,LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 1100, NULL, NULL, 1100, NULL, '37', '0', '0', '37', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(53, 'S-4030', '67147-BZ180-00', 'S4030, PANEL, RR DOOR HINGE SIDE, RH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 1525, NULL, NULL, 800, NULL, '51', '0', '0', '27', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48'),
(54, 'S-4031', '67148-BZ180-00', 'S4031, PANEL, RR DOOR HINGE SIDE, LH', 239, 'TEIRYO', 'B', 2, 'N', 'IFP', 1400, NULL, NULL, 800, NULL, '47', '0', '0', '27', '0', 'WH Docking', 'Inhouse', 'D55L', '2A', 'DMUKTICO', '2021-12-14 16:13:48');

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
(1, 'J-4053', '53811-BZ350-00', 'J-4053, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 195, 10, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(2, 'J-4055', '53811-BZ360-00', 'J-4055, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(3, 'J-4059', '53811-BZ380-00', 'J-4059, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 3, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(4, 'J-4054', '53812-BZ350-00', 'J-4054, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 195, 9, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(5, 'J-4056', '53812-BZ360-00', 'J-4056, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(6, 'J-4060', '53812-BZ380-00', 'J-4060, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 3, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(7, 'T-4032', '61745-BZ110-00', 'T-4032, REINF, BACK DOOR OPENING, LWR RH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(8, 'K-3005', '63111-BZ120-00', 'K-3005, PANEL ROOF', 'WH Docking', 'Inhouse', 716, 25, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(9, 'K-3007', '63111-BZ150-00', 'K-3007, PANEL ROOF', 'WH Docking', 'Inhouse', 3797, 126, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(10, 'J-3001', '63111-BZ210-00', 'J-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 0, 2, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(11, 'J-3004', '63111-BZ300-00', 'J-3004, PANEL, ROOF', 'WH Docking', 'Inhouse', 564, 20, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(12, 'T-3002', '63132-BZ280-00', 'T-3002, PANEL, WINDSHIELD HEADER, INNER', 'WH Docking', 'Inhouse', 12180, 401, '7A', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(13, 'A-2002', '61112-BZD40-00', 'A-2002, PANEL SIDE OUTER LH', 'WH Docking', 'Inhouse', 7120, 235, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(14, 'A-2001', '61111-BZB50-00', 'A-2001, PANEL SIDE OUTER RH', 'WH Docking', 'Inhouse', 7120, 235, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(15, 'T-2043', '61111-BZB70-00', 'T-2043, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 10885, 360, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(16, 'T-1008', '58311-BZ380-00', 'T-1008, PAN, RR FLOOR', 'WH Docking', 'Inhouse', 12180, 402, 'KAP', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(17, 'A-4005', '53811-BZ570-00', 'A-4005, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 7120, 235, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(18, 'J-2084', '61111-BZA60-00', 'J-2084, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 361, 13, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(19, 'J-2057', '61112-BZ581-00', 'J-2057, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 361, 17, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(20, 'A-2003', '61111-BZB60-00', 'A-2003, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(21, 'K-2136', '61112-BZC90-00', 'K-2136, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 3822, 127, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(22, 'A-4009', '53811-BZ590-00', 'A-4009, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(23, 'J-2014', '61631-BZ100-00', 'J-2014, PANEL, QUARTER WHEEL HOUSE,OUT R', 'WH Docking', 'Inhouse', 366, 13, '3B', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(24, 'J-2060', '61112-BZ611-00', 'J-2060, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 198, 7, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(25, 'J-1042', '55111-BZ721-00', 'J-1042, PANEL, DASH', 'WH Docking', 'Inhouse', 52, 3, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(26, 'T-1005', '55741-BZ510-00', 'T-1005, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 7760, 256, '2A', 'D14N', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(27, 'A-2004', '61112-BZD50-00', 'A-2004, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(28, 'T-2018', '61632-BZ160-00', 'T-2018, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 12180, 401, '2A', 'D14N', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(29, 'J-2081', '61111-BZ710-00', 'J-2081, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 5, 2, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(30, 'S-1008', '57412-BZ320-00', 'S-1008, MEMBER, FLOOR SIDE, INNER LH', 'WH Docking', 'Inhouse', 4191, 138, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(31, 'S-1013', '52131-BZ170-00', 'S-1013, REINFORCEMENT, FR BUMPER', 'WH Docking', 'Inhouse', 7214, 239, '3B', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(32, 'J-1031', '55741-BZ360-00', 'J-1031, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 52, 3, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(33, 'K-1014', '55711-BZ080-00', 'K-1014,PANEL, COWL TOP, OUTER', 'WH Docking', 'Inhouse', 7338, 242, '2A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(34, 'T-2015', '61433-BZ190-00', 'T-2015, REINFORCEMENT, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(35, 'J-2058', '61112-BZ591-00', 'J-2058, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 5, 2, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(36, 'S-2012', '61772-BZ060-00', 'S-2012,FRAME,BACKDOOR OPEN UPR CORNER,LH', 'WH Docking', 'Inhouse', 7214, 239, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(37, 'S-1007', '57411-BZ250-00', 'S-1007, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 4191, 138, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(38, 'S-1012', '57112-BZ210-00', 'S-1012, MEMBER, FR SIDE, FR LH', 'WH Docking', 'Inhouse', 7214, 239, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(39, 'T-2004', '61112-BZB10-00', 'T-2004, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 1295, 44, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(40, 'K-4005', '53811-BZ172-00', 'K-4005, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 5005, 168, '2A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(41, 'T-2045', '61111-BZB80-00', 'T-2045, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 1295, 43, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(42, 'J-2015', '61632-BZ100-00', 'J-2015, PANEL, QUARTER WHEEL HOUSE,OUT L', 'WH Docking', 'Inhouse', 366, 13, '3B', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(43, 'T-4033', '61746-BZ080-00', 'T-4033, REINF, BACK DOOR OPENING, LWR LH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(44, 'K-1155', '57612-BZ142-00', 'K-1155, MEMBER, RR FLOOR SIDE, FR LH', 'WH Docking', 'Inhouse', 1386, 46, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(45, 'J-2085', '61111-BZA70-00', 'J-2085, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 198, 7, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(46, 'T-4003', '53811-BZ560-00', 'T-4003, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 12180, 408, '5A', 'D14N', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(47, 'J-2078', '61732-BZ290-00', 'J2078-PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 1, 2, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(48, 'J-1043', '55111-BZ751-00', 'J-1043, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(49, 'S-4030', '67147-BZ180-00', 'S4030, PANEL, RR DOOR HINGE SIDE, RH', 'WH Docking', 'Inhouse', 7214, 239, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(50, 'N-4028', '67148-BZ150-00', 'N-4028, PANEL, RR DOOR HINGE SIDE, LH', 'WH Docking', 'Inhouse', 5817, 193, '2A', 'D30D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(51, 'S-2009', '61733-BZ030-00', 'S-2009, PANEL, ROOF SIDE, INNER FR RH', 'WH Docking', 'Inhouse', 7214, 239, '3B', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(52, 'J-1032', '55741-BZ370-00', 'J-1032, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 512, 18, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(53, 'J-2016', '61631-BZ110-00', 'J-2016, PANEL, QUARTER WHEEL HOUSE,OUT R', 'WH Docking', 'Inhouse', 198, 7, '3B', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(54, 'K-2048', '61412-BZ060-00', 'K-2048, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 1386, 46, '2A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(55, 'J-1047', '55111-BZ801-00', 'J-1047, PANEL, DASH', 'WH Docking', 'Inhouse', 183, 7, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(56, 'J-3003', '63134-BZ130-00', 'J-3003, FRAME, BACK DOOR OPENING, INNER', 'WH Docking', 'Inhouse', 564, 20, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(57, 'T-2002', '61112-BZB00-00', 'T-2002, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 10885, 360, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(58, 'T-1006', '55741-BZ520-00', 'T-1006, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 4420, 147, '2A', 'D14N', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(59, 'K-1157', '57612-BZ152-00', 'K-1157, MEMBER, RR FLOOR SIDE, FR LH', 'WH Docking', 'Inhouse', 1439, 49, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(60, 'J-2074', '61732-BZ210-00', 'J-2074, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 52, 3, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(61, 'S-4031', '67148-BZ180-00', 'S4031, PANEL, RR DOOR HINGE SIDE, LH', 'WH Docking', 'Inhouse', 7214, 239, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(62, 'K-1119', '55741-BZ200-00', 'K-1119,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 5183, 172, '3B', 'D40D', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(63, 'K-2123', '61614-BZ093-00', 'K-2123, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 856, 29, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(64, 'K-1150', '57611-BZ141-00', 'K-1150, MEMBER, RR FLOOR SIDE, FR RH', 'WH Docking', 'Inhouse', 1386, 46, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(65, 'K-1152', '57611-BZ151-00', 'K-1152, MEMBER, RR FLOOR SIDE, FR RH', 'WH Docking', 'Inhouse', 1439, 49, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(66, 'K-2125', '61614-BZ103-00', 'K-2125, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 1557, 52, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(67, 'J-1053', '58311-BZ331-00', 'J-1053, PAN, RR FLOOR', 'WH Docking', 'Inhouse', 53, 3, 'KAP', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(68, 'K-2134', '61112-BZC60-00', 'K-2134, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 897, 30, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(69, 'K-2105', '61612-BZ360-00', 'K-2105, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 203, 7, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(70, 'J-1048', '55111-BZ811-00', 'J-1048, PANEL, DASH', 'WH Docking', 'Inhouse', 266, 10, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(71, 'K-2140', '61112-BZD20-00', 'K-2140, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 203, 7, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(72, 'K-1148', '64111-BZ061-00', 'K-1148, PANEL BACK', 'WH Docking', 'Inhouse', 3555, 118, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(73, 'J-2080', '61732-BZ300-00', 'J-2080, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 511, 18, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(74, 'K-2119', '61111-BZ302-00', 'K-2119, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 897, 30, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(75, 'J-2061', '61112-BZ621-00', 'J-2061, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 2, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(76, 'N-4027', '67147-BZ150-00', 'N-4027, PANEL, RR DOOR HINGE SIDE, RH', 'WH Docking', 'Inhouse', 5817, 193, '2A', 'D30D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(77, 'K-2121', '61111-BZ701-00', 'K-2121, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 203, 7, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(78, 'J-2082', '61111-BZ720-00', 'J-2082, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(79, 'K-2124', '61613-BZ103-00', 'K-2124, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 1015, 34, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(80, 'A-1014', '58311-BZ430-00', 'A-1014, PAN, REAR FLOOR', 'WH Docking', 'Inhouse', 11792, 388, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(81, 'K-2122', '61613-BZ093-00', 'K-2122, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 1065, 36, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(82, 'K-2127', '61614-BZ123-00', 'K-2127, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 209, 7, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(83, 'K-2129', '61614-BZ142-00', 'K-2129, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 203, 7, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(84, 'S-2007', '61613-BZ070-00', 'S-2007, PANEL, QUARTER, INNER RH', 'WH Docking', 'Inhouse', 7214, 239, '3B', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(85, 'K-4055', '53811-BZ190-00', 'K-4055,PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 203, 7, '2A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(86, 'K-2128', '61613-BZ142-00', 'K-2128, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 203, 7, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(87, 'T-2008', '61162-BZ280-00', 'T-2008, PILLAR, FR BODY, INNER LH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(88, 'K-4007', '53811-BZ182-00', 'K-4007, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 2130, 74, '2A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(89, 'S-2008', '61614-BZ070-00', 'S-2008, PANEL, QUARTER, INNER LH', 'WH Docking', 'Inhouse', 7214, 239, '3B', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(90, 'T-2017', '61631-BZ160-00', 'T-2017, PANEL, QTR WHEEL HOUSE, OUTER RH', 'WH Docking', 'Inhouse', 12180, 402, '2A', 'D14N', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(91, 'T-2009', '61247-BZ090-00', 'T-2009, REINF, ROOF SIDE RAIL, INNER RH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(92, 'K-2139', '61112-BZC80-00', 'K-2139, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(93, 'S-1009', '57411-BZ330-00', 'S-1009, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 3023, 101, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(94, 'K-2080', '61612-BZ251-00', 'K-2080, PANEL QUARTER, LH', 'WH Docking', 'Inhouse', 327, 12, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(95, 'K-2118', '61111-BZ282-00', 'K-2118, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(96, 'T-2010', '61248-BZ090-00', 'T-2010, REINF, ROOF SIDE RAIL, INNER LH', 'WH Docking', 'Inhouse', 12180, 401, '2A', 'D14N', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(97, 'S-1010', '57412-BZ400-00', 'S-1010, MEMBER, FLOOR SIDE, INNER LH', 'WH Docking', 'Inhouse', 3023, 101, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(98, 'K-2137', '61112-BZD00-00', 'K-2137, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 498, 18, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(99, 'K-2126', '61613-BZ123-00', 'K-2126, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 542, 19, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(100, 'K-2104', '61611-BZ330-00', 'K-2104, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 203, 7, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(101, 'T-2007', '61161-BZ260-00', 'T-2007, PILLAR, FR BODY, INNER RH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(102, 'J-1045', '55111-BZ781-00', 'J-1045, PANEL, DASH', 'WH Docking', 'Inhouse', 49, 3, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(103, 'K-1147', '64111-BZ051-00', 'K-1147, PANEL BACK', 'WH Docking', 'Inhouse', 237, 9, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(104, 'T-2031', '61131-BZ480-00', 'T-2031, PILLAR, FR BODY, UPR OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(105, 'J-1049', '55111-BZ821-00', 'J-1049, PANEL, DASH', 'WH Docking', 'Inhouse', 13, 2, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(106, 'J-2017', '61632-BZ110-00', 'J-2017, PANEL, QUARTER WHEEL HOUSE,OUT L', 'WH Docking', 'Inhouse', 198, 7, '3B', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(107, 'S-1011', '57111-BZ270-00', 'S-1011, MEMBER, FR SIDE, FR RH', 'WH Docking', 'Inhouse', 7214, 239, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(108, 'K-1017', '55741-BZ150-00', 'K-1017,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 2130, 71, '3B', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(109, 'K-2115', '61111-BZ361-00', 'K-2115, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 193, 7, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(110, 'J-1046', '55111-BZ791-00', 'J-1046, PANEL, DASH', 'WH Docking', 'Inhouse', 1, 2, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(111, 'A-1001', '55111-BZC80-00', 'A-1001, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(112, 'T-2028', '61612-BZ480-00', 'T-2028, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(113, 'A-1002', '55111-BZD40-00', 'A-1002, PANEL, DASH', 'WH Docking', 'Inhouse', 6619, 219, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(114, 'K-2138', '61112-BZD10-00', 'K-2138, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 193, 7, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(115, 'A-1015', '58311-BZ440-00', 'A-1015, PAN, REAR FLOOR', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(116, 'K-2120', '61111-BZ322-00', 'K-2120, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 542, 19, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(117, 'A-1006', '57111-BZ290-00', 'A-1006, MEMBER, FR SIDE, FR RH/LH', 'WH Docking', 'Inhouse', 11792, 388, '3B', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(118, 'K-1134', '64111-BZ060-00', 'K-1134, PANEL BACK', 'WH Docking', 'Inhouse', 30, 3, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(119, 'A-1013', '58111-BZ390-00', 'A1013,PAN, FR FLOOR', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(120, 'K-2133', '61112-BZC50-00', 'K-2133, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 327, 12, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(121, 'T-4036', '63134-BZ220-00', 'T-4036, FRAME, BACK DOOR OPENING, INNER', 'WH Docking', 'Inhouse', 9231, 304, '3B', 'D14N', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(122, 'K-1132', '65751-BZ020-00', 'K-1132,PANEL, TAIL GATE', 'WH Docking', 'Inhouse', 675, 23, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(123, 'K-1054', '64298-BZ010-00', 'K-1054, PANEL, ROOM PARTITION CTR', 'WH Docking', 'Inhouse', 4513, 149, '2A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(124, 'T-2029', '61611-BZ450-00', 'T-2029, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(125, 'T-2022', '61312-BZ350-00', 'T-2022, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(126, 'A-1010', '57411-BZ320-00', 'A-1010, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(127, 'K-2054', '61612-BZ191-00', 'K-2054, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 856, 29, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(128, 'J-2047', '61111-BZ522-00', 'J-2047, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(129, 'K-2079', '61611-BZ241-00', 'K-2079, PANEL QUARTER, RH', 'WH Docking', 'Inhouse', 327, 12, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(130, 'T-2024', '61312-BZ360-00', 'T-2024, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(131, 'A-1012', '58111-BZ380-00', 'A1012,PAN, FR FLOOR', 'WH Docking', 'Inhouse', 7120, 235, '6A', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(132, 'J-2154', '61611-BZ302-00', 'J-2154, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(133, 'K-2053', '61611-BZ181-00', 'K-2053, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 856, 29, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(134, 'K-1130', '65621-BZ020-00', 'K-1130,PANEL, SIDE GATE, RH', 'WH Docking', 'Inhouse', 675, 23, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(135, 'A-2016', '61746-BZ050-00', 'A-2016, REINF, BACK DOOR OPENING, LWR LH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(136, 'A-1011', '57412-BZ390-00', 'A-1011, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(137, 'K-1016', '55741-BZ130-00', 'K-1016,PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 25, 2, '3B', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(138, 'J-2127', '61411-BZ170-00', 'J-2127, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(139, 'T-2025', '61411-BZ340-00', 'T-2025, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(140, 'T-2026', '61412-BZ360-00', 'T-2026, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(141, 'T-2027', '61611-BZ440-00', 'T-2027, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(142, 'T-2016', '61434-BZ180-00', 'T-2016, REINFORCEMENT, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(143, 'J-2158', '61612-BZ321-00', 'J-2158, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(144, 'A-2012', '61632-BZ220-00', 'A-2012, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(145, 'J-1044', '55111-BZ761-00', 'J-1044, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(146, 'J-2164', '61131-BZ380-00', 'J-2164, PILLAR, FR BODY, UPR OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(147, 'T-2041', '61632-BZ180-00', 'T-2041, PANEL, QTR WHEEL HOUSE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D14N', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(148, 'K-1052', '64111-BZ030-00', 'K-1052, PANEL BACK', 'WH Docking', 'Inhouse', 675, 23, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(149, 'T-3003', '63134-BZ260-00', 'T-3003, FRAME, BACK DOOR OPENING, INNER', 'WH Docking', 'Inhouse', 2949, 98, '3B', 'D14N', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(150, 'T-2030', '61612-BZ490-00', 'T-2030, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(151, 'A-1007', '57112-BZ310-00', 'A-1007, MEMBER, FR SIDE, FR LH', 'WH Docking', 'Inhouse', 11792, 388, '3B', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(152, 'T-1003', '55111-BZB30-00', 'T-1003, PANEL, DASH', 'WH Docking', 'Inhouse', 976, 33, '2A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(153, 'T-1004', '55111-BZB40-00', 'T-1004, PANEL, DASH', 'WH Docking', 'Inhouse', 3444, 114, '2A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(154, 'A-2014', '61732-BZ250-00', 'A-2014, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(155, 'J-2111', '61131-BZ300-00', 'J-2111, PILLAR FRONT BODY OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(156, 'J-4007', '53811-BZ230-00', 'J-4007, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(157, 'J-1014', '57112-BZ060-00', 'J-1014, MEMBER, FR SIDE, LH', 'WH Docking', 'Inhouse', 0, 2, 'MAJ', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(158, 'K-2083', '61613-BZ240-00', 'K-2083,PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(159, 'J-2105', '61131-BZ270-00', 'J-2105, PILLAR, FR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(160, 'K-1015', '55711-BZ090-00', 'K-1015,PANEL, COWL TOP, OUTER', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(161, 'A-2011', '61631-BZ220-00', 'A-2011, PANEL, QTR WHEEL HOUSE, OUTER RH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(162, 'A-1008', '57411-BZ310-00', 'A-1008, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(163, 'A-1009', '57412-BZ360-00', 'A-1009, MEMBER, FLOOR SIDE, INNER RH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(164, 'A-1003', '55111-BZD50-00', 'A-1003, PANEL, DASH', 'WH Docking', 'Inhouse', 5173, 171, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(165, 'T-2001', '61111-BZA00-00', 'T-2001, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 2, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(166, 'T-2003', '61111-BZA10-00', 'T-2003, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(167, 'T-2020', '61112-BZB60-00', 'T-2020, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(168, 'T-2033', '61111-BZB20-00', 'T-2033, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(169, 'T-2035', '61111-BZB30-00', 'T-2035, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(170, 'T-2037', '61112-BZC10-00', 'T-2037, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(171, 'T-2038', '61112-BZC20-00', 'T-2038, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(172, 'T-2039', '61112-BZC30-00', 'T-2039, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(173, 'J-2002', '61112-BZ580-00', 'J-2002, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(174, 'J-2004', '61112-BZ590-00', 'J-2004, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(175, 'J-2006', '61112-BZ600-00', 'J-2006, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(176, 'J-2011', '61112-BZ630-00', 'J-2011, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(177, 'J-2022', '61111-BZ501-00', 'J-2022, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(178, 'J-2023', '61111-BZ511-00', 'J-2023, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(179, 'J-2026', '61111-BZ541-00', 'J-2026, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(180, 'J-2028', '61111-BZ610-00', 'J-2028, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(181, 'J-2029', '61112-BZ690-00', 'J-2029, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(182, 'J-2030', '61111-BZ620-00', 'J-2030, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(183, 'J-2031', '61112-BZ700-00', 'J-2031, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(184, 'J-2032', '61112-BZ710-00', 'J-2032, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(185, 'J-2034', '61112-BZ720-00', 'J-2034, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(186, 'J-2036', '61112-BZ730-00', 'J-2036, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(187, 'J-2037', '61111-BZ650-00', 'J-2037, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(188, 'J-2038', '61112-BZ740-00', 'J-2038, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(189, 'J-2039', '61111-BZ660-00', 'J-2039, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(190, 'J-2040', '61112-BZ750-00', 'J-2040, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(191, 'J-2045', '61111-BZ502-00', 'J-2045, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 3, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(192, 'J-2046', '61111-BZ512-00', 'J-2046, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(193, 'J-2049', '61111-BZ542-00', 'J-2049, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(194, 'J-2051', '61111-BZ611-00', 'J-2051, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(195, 'J-2052', '61111-BZ621-00', 'J-2052, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(196, 'J-2055', '61111-BZ651-00', 'J-2055, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(197, 'J-2056', '61111-BZ661-00', 'J-2056, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(198, 'J-2059', '61112-BZ601-00', 'J-2059, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 2, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(199, 'J-2062', '61112-BZ631-00', 'J-2062, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(200, 'J-2064', '61112-BZ691-00', 'J-2064, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(201, 'J-2065', '61112-BZ701-00', 'J-2065, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(202, 'J-2066', '61112-BZ711-00', 'J-2066, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(203, 'J-2069', '61112-BZ741-00', 'J-2069, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(204, 'K-2057', '61611-BZ221-00', 'K-2057, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(205, 'K-2058', '61612-BZ231-00', 'K-2058, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(206, 'K-2059', '61611-BZ231-00', 'K-2059, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(207, 'K-2060', '61612-BZ241-00', 'K-2060, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(208, 'K-2149', '61611-BZ580-00', 'K-2149, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(209, 'K-2150', '61611-BZ590-00', 'K-2150, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(210, 'K-2151', '61612-BZ630-00', 'K-2151, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(211, 'K-2152', '61612-BZ640-00', 'K-2152, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(212, 'K-1050', '64111-BZ010-00', 'K-1050, PANEL BACK', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(213, 'K-1051', '64111-BZ020-00', 'K-1051, PANEL BACK', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(214, 'K-1053', '64111-BZ040-00', 'K-1053, PANEL BACK', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(215, 'K-1133', '64111-BZ050-00', 'K-1133, PANEL, BACK', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(216, 'K-1146', '64111-BZ021-00', 'K-1146, PANEL BACK', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(217, 'K-2001', '61111-BZ240-00', 'K-2001, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(218, 'K-2002', '61112-BZ270-00', 'K-2002, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(219, 'K-2003', '61111-BZ250-00', 'K-2003,PANEL SIDE OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(220, 'K-2004', '61112-BZ280-00', 'K-2004, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(221, 'K-2006', '61112-BZ300-00', 'K-2006, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(222, 'K-2007', '61111-BZ290-00', 'K-2007, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(223, 'K-2010', '61112-BZ310-00', 'K-2010, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(224, 'K-2011', '61111-BZ300-00', 'K-2011, PANEL FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(225, 'K-2012', '61112-BZ291-00', 'K-2012, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(226, 'K-2013', '61111-BZ281-00', 'K-2013, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(227, 'K-2014', '61112-BZ320-00', 'K-2014, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(228, 'K-2015', '61111-BZ310-00', 'K-2015, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(229, 'K-2016', '61112-BZ330-00', 'K-2016, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(230, 'K-2017', '61111-BZ320-00', 'K-2017, PANEL FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(231, 'K-2021', '61111-BZ410-00', 'K-2021, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(232, 'K-2022', '61112-BZ410-00', 'K-2022, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(233, 'K-2081', '61112-BZ521-00', 'K-2081, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(234, 'K-2099', '61111-BZ301-00', 'K-2099, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(235, 'K-2100', '61112-BZ311-00', 'K-2100, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(236, 'K-2101', '61111-BZ321-00', 'K-2101, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(237, 'K-2102', '61112-BZ331-00', 'K-2102, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(238, 'K-2103', '61111-BZ700-00', 'K-2103, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(239, 'K-2106', '61112-BZ271-00', 'K-2106, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(240, 'K-2107', '61112-BZ281-00', 'K-2107, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(241, 'K-2108', '61112-BZA10-00', 'K-2108, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(242, 'K-2109', '61112-BZ292-00', 'K-2109, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(243, 'K-2110', '61112-BZ312-00', 'K-2110, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(244, 'K-2111', '61112-BZ332-00', 'K-2111, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(245, 'K-2112', '61112-BZ522-00', 'K-2112, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(246, 'K-2116', '61111-BZ241-00', 'K-2116, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 856, 29, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(247, 'K-2117', '61111-BZ251-00', 'K-2117, PANEL SIDE OUTER RH', 'WH Docking', 'Inhouse', 327, 12, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(248, 'K-2132', '61112-BZC40-00', 'K-2132, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 856, 29, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(249, 'K-2135', '61112-BZC70-00', 'K-2135, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 542, 19, '4A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(250, 'A-3001', '63111-BZ320-00', 'A-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 7120, 235, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(251, 'A-4006', '53812-BZ570-00', 'A-4006, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 7120, 235, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(252, 'K-3001', '63111-BZ020-00', 'K-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(253, 'K-3002', '63111-BZ110-00', 'K-3002, PANEL ROOF', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(254, 'K-3003', '63111-BZ140-00', 'K-3003, PANEL, ROOF', 'WH Docking', 'Inhouse', 209, 7, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(255, 'K-3004', '63111-BZ170-00', 'K-3004, PANEL ROOF', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(256, 'K-3008', '63111-BZ021-00', 'K-3008, PANEL, ROOF', 'WH Docking', 'Inhouse', 1185, 40, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(257, 'K-3009', '63111-BZ111-00', 'K-3009, PANEL, ROOF LHD', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(258, 'K-3010', '63111-BZ171-00', 'K-3010, PANEL, ROOF', 'WH Docking', 'Inhouse', 1431, 48, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(259, 'K-1058', '53711-BZ080-00', 'K-1058,APRON, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(260, 'K-1059', '53712-BZ080-00', 'K-1059,APRON, FR FENDER, LH', 'WH Docking', 'Inhouse', 2130, 71, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(261, 'K-1128', '55741-BZ140-00', 'K-1128, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(262, 'T-3001', '63111-BZ290-00', 'T-3001, PANEL, ROOF', 'WH Docking', 'Inhouse', 12180, 402, '4A', 'D14N', 'BD', 'DMUKTICO', '2021-11-30 08:58:24'),
(263, 'J-4051', '53811-BZ340-00', 'J-4051, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 361, 18, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(264, 'J-4052', '53812-BZ280-00', 'J-4052, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 361, 18, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(265, 'J-4057', '53811-BZ370-00', 'J-4057, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 5, 3, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(266, 'J-4058', '53812-BZ370-00', 'J-4058, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 5, 3, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(267, 'T-4004', '53812-BZ550-00', 'T-4004, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 12180, 409, '5A', 'D14N', 'BD', 'DMUKTICO', '2021-11-30 08:58:24'),
(268, 'K-2055', '61611-BZ201-00', 'K-2055, PANEL, QUARTER, RH', 'WH Docking', 'Inhouse', 1439, 49, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(269, 'K-2056', '61612-BZ211-00', 'K-2056, PANEL, QUARTER, LH', 'WH Docking', 'Inhouse', 1439, 49, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(270, 'K-1158', '64111-BZ090-00', 'K-1158; PANEL BACK', 'WH Docking', 'Inhouse', 16, 2, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(271, 'K-2061', '61613-BZ091-00', 'K-2061,PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(272, 'K-2062', '61614-BZ091-00', 'K-2062,PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(273, 'K-2071', '61613-BZ101-00', 'K-2071 PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(274, 'K-2072', '61614-BZ101-00', 'K-2072, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(275, 'K-2073', '61613-BZ111-00', 'K-2073,PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(276, 'K-2074', '61614-BZ111-00', 'K-2074, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(277, 'K-2075', '61613-BZ121-00', 'K-2075,PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(278, 'K-2076', '61614-BZ121-00', 'K-2076,PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(279, 'K-2077', '61613-BZ141-00', 'K-2077,PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(280, 'K-2078', '61614-BZ141-00', 'K-2078,PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(281, 'K-2082', '61614-BZ230-00', 'K-2082,PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(282, 'K-2084', '61614-BZ260-00', 'K-2084,PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(283, 'K-2087', '61613-BZ092-00', 'K-2087, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(284, 'K-2088', '61614-BZ092-00', 'K-2088, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(285, 'K-2089', '61613-BZ102-00', 'K-2089, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(286, 'K-2090', '61614-BZ102-00', 'K-2090, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(287, 'K-2091', '61613-BZ122-00', 'K-2091, PANEL, QUARTER, INNER FR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(288, 'K-2092', '61614-BZ122-00', 'K-2092, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(289, 'K-2131', '61614-BZ300-00', 'K-2131, PANEL, QUARTER, INNER FR LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(290, 'K-2023', '61111-BZ330-00', 'K-2023, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(291, 'K-2024', '61112-BZ340-00', 'K-2024, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(292, 'K-2025', '61111-BZ340-00', 'K-2025, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(293, 'K-2026', '61112-BZ350-00', 'K-2026, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(294, 'K-2028', '61112-BZ360-00', 'K-2028, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(295, 'K-2029', '61111-BZ360-00', 'K-2029, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(296, 'K-2030', '61112-BZ370-00', 'K-2030, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(297, 'K-2113', '61111-BZ331-00', 'K-2113, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 3822, 127, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(298, 'K-2114', '61111-BZ341-00', 'K-2114, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 498, 18, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(299, 'K-2141', '61111-BZA40-00', 'K-2141, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(300, 'K-2142', '61111-BZD90-00', 'K-2142, PANEL, SIDE OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(301, 'K-2143', '61111-BZE00-00', 'K-2143, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(302, 'K-2144', '61111-BZE10-00', 'K-2144, PANEL, FR SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(303, 'K-2145', '61112-BZB40-00', 'K-2145, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(304, 'K-2146', '61112-BZB50-00', 'K-2146, PANEL, SIDE OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(305, 'K-2147', '61112-BZE50-00', 'K-2147, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(306, 'K-2148', '61112-BZE60-00', 'K-2148, PANEL, FR SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(307, 'K-1131', '65622-BZ020-00', 'K-1131,PANEL, SIDE GATE, LH', 'WH Docking', 'Inhouse', 675, 23, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(308, 'K-4006', '53812-BZ172-00', 'K-4006, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 5005, 170, '2A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(309, 'T-2040', '61631-BZ180-00', 'T-2040, PANEL, QTR WHEEL HOUSE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D14N', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(310, 'A-2015', '61745-BZ090-00', 'A-2015, REINF, BACK DOOR OPENING, LWR RH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(311, 'A-3003', '63132-BZ290-00', 'A-3003, WINDSHIELD HEADER, INNER', 'WH Docking', 'Inhouse', 11792, 388, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(312, 'A-2013', '61731-BZ260-00', 'A-2013, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(313, 'A-4010', '53812-BZ590-00', 'A-4010, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(314, 'J-1021', '55111-BZ710-00', 'J-1021, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(315, 'J-1022', '55111-BZ720-00', 'J-1022, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(316, 'J-1023', '55111-BZ750-00', 'J-1023, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(317, 'J-1024', '55111-BZ760-00', 'J-1024, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(318, 'J-1025', '55111-BZ780-00', 'J-1025, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(319, 'J-1026', '55111-BZ790-00', 'J-1026, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(320, 'J-1027', '55111-BZ800-00', 'J-1027, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(321, 'J-1028', '55111-BZ810-00', 'J-1028, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(322, 'J-1029', '55111-BZ820-00', 'J-1029, PANEL, DASH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24');
INSERT INTO `tbl_master_part` (`id`, `job_no`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `maks_shift`, `machine`, `model`, `patan`, `create_by`, `create_date`) VALUES
(323, 'T-1001', '55111-BZB10-00', 'T-1001, PANEL, DASH', 'WH Docking', 'Inhouse', 4318, 143, '2A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(324, 'T-1002', '55111-BZB20-00', 'T-1002, PANEL, DASH', 'WH Docking', 'Inhouse', 3442, 114, '2A', 'D14N', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(325, 'J-2008', '61112-BZ610-00', 'J-2008,PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 2, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(326, 'J-2009', '61112-BZ620-00', 'J-2009, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(327, 'J-2013', '61112-BZ640-00', 'J-2013, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(328, 'J-2024', '61111-BZ521-00', 'J-2024, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(329, 'J-2025', '61111-BZ531-00', 'J-2025, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(330, 'J-2027', '61111-BZ551-00', 'J-2027, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 2, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(331, 'J-2033', '61111-BZ630-00', 'J-2033, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(332, 'J-2035', '61111-BZ640-00', 'J-2035, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(333, 'J-2048', '61111-BZ532-00', 'J-2048, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(334, 'J-2050', '61111-BZ552-00', 'J-2050, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(335, 'J-2053', '61111-BZ631-00', 'J-2053, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(336, 'J-2054', '61111-BZ641-00', 'J-2054, PANEL, SIDE, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(337, 'J-2063', '61112-BZ641-00', 'J-2063, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(338, 'J-2067', '61112-BZ721-00', 'J-2067, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(339, 'J-2068', '61112-BZ731-00', 'J-2068, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(340, 'J-2070', '61112-BZ751-00', 'J-2070, PANEL, SIDE, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(341, 'J-2083', '61112-BZ860-00', 'J-2083, PANEL, NO.2 SIDE, UPR RH', 'WH Docking', 'Inhouse', 0, 0, '4A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(342, 'K-1022', '57611-BZ140-00', 'K-1022, MEMBER, RR FLOOR SIDE, FR RH', 'WH Docking', 'Inhouse', 0, 0, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(343, 'K-1023', '57612-BZ140-00', 'K-1023, MEMBER, RR FLOOR SIDE, FR LH', 'WH Docking', 'Inhouse', 0, 0, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(344, 'K-1151', '57612-BZ141-00', 'K-1151, MEMBER, RR FLOOR SIDE, FR LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(345, 'K-1024', '57611-BZ150-00', 'K-1024, MEMBER, RR FLOOR SIDE, FR RH', 'WH Docking', 'Inhouse', 0, 0, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(346, 'K-1025', '57612-BZ150-00', 'K-1025, MEMBER, RR FLOOR SIDE, FR LH', 'WH Docking', 'Inhouse', 0, 0, '3B', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(347, 'K-1153', '57612-BZ151-00', 'K-1153, MEMBER, RR FLOOR SIDE, FR LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(348, 'K-2052', '61412-BZ120-00', 'K-2052, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(349, 'K-4008', '53812-BZ182-00', 'K-4008, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 2130, 73, '2A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(350, 'S-2010', '61734-BZ030-00', 'S-2010, PANEL, ROOF SIDE, INNER FR LH', 'WH Docking', 'Inhouse', 7214, 239, '3B', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(351, 'S-2011', '61771-BZ080-00', 'S-2011,FRAME,BACKDOOR OPEN UPR CORNER,RH', 'WH Docking', 'Inhouse', 7214, 239, '2A', 'D55L', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(352, 'T-2013', '61345-BZ150-00', 'T-2013, PILLAR, CTR BODY, INNER LWR RH', 'WH Docking', 'Inhouse', 12180, 401, '2A', 'D14N', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(353, 'T-2014', '61346-BZ150-00', 'T-2014, PILLAR, CTR BODY, INNER LWR LH', 'WH Docking', 'Inhouse', 12180, 401, '2A', 'D14N', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(354, 'T-4021', '67135-BZ090-00', 'T-4021, EXT,RR DOOR OUTSIDE REINFORCE,RH', 'WH Docking', 'Inhouse', 12180, 402, '3B', 'D14N', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(355, 'T-4022', '67136-BZ070-00', 'T-4022, EXT,RR DOOR OUTSIDE REINFORCE,LH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(356, 'T-2011', '61343-BZ200-00', 'T-2011, PILLAR, CTR BODY, INNER RH', 'WH Docking', 'Inhouse', 12180, 401, '2A', 'D14N', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(357, 'T-2012', '61344-BZ210-00', 'T-2012, PILLAR, CTR BODY, INNER LH', 'WH Docking', 'Inhouse', 12180, 402, '2A', 'D14N', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(358, 'T-2005', '61175-BZ150-00', 'T-2005, REIN FR BODY PLR,UPR OUT NO.2 RH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(359, 'T-2006', '61176-BZ150-00', 'T-2006, REIN FR BODY PLR,UPR OUT NO.2 LH', 'WH Docking', 'Inhouse', 12180, 401, '3B', 'D14N', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(360, 'J-1009', '55741-BZ231-00', 'J-1009, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(361, 'J-1010', '55741-BZ241-00', 'J-1010, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(362, 'J-1011', '55741-BZ251-00', 'J-1011, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(363, 'J-1030', '55741-BZ350-00', 'J-1030, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(364, 'J-1055', '55741-BZ390-00', 'J-1055, PANEL, COWL TOP, INNER', 'WH Docking', 'Inhouse', 0, 0, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(365, 'J-4008', '53812-BZ230-00', 'J-4008, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(366, 'J-4009', '53811-BZ240-00', 'J-4009, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(367, 'J-4010', '53812-BZ240-00', 'J-4010, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(368, 'J-4013', '53811-BZ260-00', 'J-4013, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(369, 'J-4014', '53812-BZ260-00', 'J-4014, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(370, 'K-4056', '53812-BZ190-00', 'K-4056,PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 203, 7, '2A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(371, 'A-2101', '61131-BZ530-00', 'A-2101, PILLAR, FR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(372, 'A-2102', '61132-BZ510-00', 'A-2102, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(373, 'A-2103', '61311-BZ350-00', 'A-2103, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(374, 'A-2104', '61312-BZ400-00', 'A-2104, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(375, 'A-2105', '61411-BZ380-00', 'A-2105, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(376, 'A-2106', '61412-BZ410-00', 'A-2106, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(377, 'A-2107', '61611-BZ470-00', 'A-2107, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(378, 'A-2108', '61612-BZ530-00', 'A-2108, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(379, 'A-2109', '61131-BZ540-00', 'A-2109, PILLAR, FR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(380, 'A-2110', '61132-BZ520-00', 'A-2110, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(381, 'A-2111', '61311-BZ360-00', 'A-2111, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(382, 'A-2112', '61312-BZ410-00', 'A-2112, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(383, 'A-2113', '61411-BZ390-00', 'A-2113, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(384, 'A-2114', '61412-BZ420-00', 'A-2114, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(385, 'A-2115', '61611-BZ480-00', 'A-2115, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(386, 'A-2116', '61612-BZ540-00', 'A-2116, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D26A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(387, 'J-2101', '61131-BZ240-00', 'J-2101, PILLAR FRONT BODY OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(388, 'J-2102', '61132-BZ240-00', 'J-2102, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(389, 'J-2103', '61131-BZ260-00', 'J-2103, PILLAR FRONT BODY OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(390, 'J-2104', '61132-BZ260-00', 'J-2104, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(391, 'J-2106', '61132-BZ270-00', 'J-2106, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(392, 'J-2107', '61131-BZ280-00', 'J-2107, PILLAR, FR BODY, UPR OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(393, 'J-2108', '61132-BZ280-00', 'J-2108, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(394, 'J-2109', '61131-BZ290-00', 'J-2109, PILLAR FRONT BODY OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(395, 'J-2110', '61132-BZ290-00', 'J-2110, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(396, 'J-2112', '61132-BZ300-00', 'J-2112, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(397, 'J-2113', '61311-BZ150-00', 'J-2113, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(398, 'J-2114', '61312-BZ180-00', 'J-2114, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(399, 'J-2115', '61311-BZ160-00', 'J-2115, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(400, 'J-2116', '61312-BZ190-00', 'J-2116, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(401, 'J-2117', '61311-BZ170-00', 'J-2117, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(402, 'J-2118', '61312-BZ200-00', 'J-2118, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(403, 'J-2119', '61311-BZ180-00', 'J-2119, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(404, 'J-2120', '61312-BZ210-00', 'J-2120, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(405, 'J-2121', '61411-BZ140-00', 'J-2121, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(406, 'J-2122', '61412-BZ160-00', 'J-2122, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(407, 'J-2123', '61411-BZ150-00', 'J-2123, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(408, 'J-2124', '61412-BZ170-00', 'J-2124, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(409, 'J-2125', '61411-BZ160-00', 'J-2125, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(410, 'J-2126', '61412-BZ180-00', 'J-2126, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(411, 'J-2128', '61412-BZ190-00', 'J-2128, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(412, 'J-2130', '61612-BZ290-00', 'J-2130, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(413, 'J-2132', '61612-BZ310-00', 'J-2132, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(414, 'J-2134', '61612-BZ320-00', 'J-2134, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(415, 'J-2136', '61612-BZ330-00', 'J-2136, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(416, 'J-2137', '61612-BZ340-00', 'J-2137, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(417, 'J-2138', '61611-BZ281-00', 'J-2138, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(418, 'J-2139', '61611-BZ291-00', 'J-2139, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(419, 'J-2140', '61611-BZ301-00', 'J-2140, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(420, 'J-2141', '61611-BZ311-00', 'J-2141, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(421, 'J-2142', '61311-BZ151-00', 'J-2142, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(422, 'J-2143', '61311-BZ161-00', 'J-2143, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(423, 'J-2144', '61311-BZ171-00', 'J-2144, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(424, 'J-2145', '61311-BZ181-00', 'J-2145, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(425, 'J-2146', '61312-BZ280-00', 'J-2146, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(426, 'J-2147', '61411-BZ141-00', 'J-2147, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(427, 'J-2148', '61411-BZ151-00', 'J-2148, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(428, 'J-2149', '61411-BZ161-00', 'J-2149, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(429, 'J-2150', '61411-BZ171-00', 'J-2150, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(430, 'J-2151', '61412-BZ290-00', 'J-2151, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(431, 'J-2152', '61611-BZ282-00', 'J-2152, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(432, 'J-2153', '61611-BZ292-00', 'J-2153, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(433, 'J-2155', '61611-BZ312-00', 'J-2155, PANEL, QUARTER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(434, 'J-2156', '61612-BZ291-00', 'J-2156, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(435, 'J-2157', '61612-BZ311-00', 'J-2157, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(436, 'J-2159', '61612-BZ331-00', 'J-2159, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(437, 'J-2160', '61612-BZ341-00', 'J-2160, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(438, 'J-2161', '61612-BZ400-00', 'J-2161, PANEL, QUARTER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(439, 'J-2163', '61131-BZ110-00', 'J-2163, PILLAR, FR BODY, UPR OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(440, 'T-2021', '61311-BZ330-00', 'T-2021, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(441, 'T-2023', '61311-BZ340-00', 'T-2023, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(442, 'T-2032', '61132-BZ450-00', 'T-2032, PILLAR, FR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(443, 'T-2034', '61312-BZ370-00', 'T-2034, PILLAR, CTR BODY, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(444, 'T-2036', '61412-BZ370-00', 'T-2036, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(445, 'T-2046', '61311-BZ370-00', 'T-2046, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(446, 'T-2047', '61311-BZ380-00', 'T-2047, PILLAR, CTR BODY, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(447, 'T-2048', '61411-BZ400-00', 'T-2048, PANEL, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 0, 0, '0', 'D14N', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(448, 'J-1035', '58311-BZ300-00', 'J1035, PAN, RR FLOOR', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(449, 'J-1036', '58311-BZ310-00', 'J-1036 ,PAN, RR FLOOR', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(450, 'J-1054', '58311-BZ391-00', 'J-1054, PAN, RR FLOOR', 'WH Docking', 'Inhouse', 511, 18, 'KAP', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(451, 'J-2076', '61732-BZ220-00', 'J2076, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 0, 2, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(452, 'J-2077', '61731-BZ310-00', 'J2077, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 1, 2, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(453, 'J-2018', '61731-BZ140-00', 'J-2018, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(454, 'J-2041', '61731-BZ141-00', 'J-2041, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(455, 'J-2042', '61732-BZ121-00', 'J-2042, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(456, 'J-2043', '61731-BZ151-00', 'J-2043, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(457, 'J-2044', '61732-BZ131-00', 'J-2044, PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Inhouse', 0, 0, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(458, 'J-2073', '61731-BZ220-00', 'J-2073, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 52, 3, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(459, 'J-2075', '61731-BZ230-00', 'J-2075 ,PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 0, 2, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(460, 'J-2079', '61731-BZ320-00', 'J-2079, PANEL, ROOF SIDE, INNER RH', 'WH Docking', 'Inhouse', 511, 18, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(461, 'J-3002', '63132-BZ160-00', 'J-3002, PANEL, WINDSHIELD HEADER, INNER', 'WH Docking', 'Inhouse', 564, 20, '6A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(462, 'K-1126', '53216-BZ100-00', 'K-1126,SUPPORT, RADIATOR, UPR CTR', 'WH Docking', 'Inhouse', 203, 7, '2A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(463, 'J-4005', '53811-BZ220-00', 'J-4005, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 3, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(464, 'J-4011', '53811-BZ250-00', 'J-4011, PANEL, FR FENDER, RH', 'WH Docking', 'Inhouse', 0, 0, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(465, 'J-4006', '53812-BZ220-00', 'J-4006, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 3, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(466, 'J-4012', '53812-BZ250-00', 'J-4012, PANEL, FR FENDER, LH', 'WH Docking', 'Inhouse', 0, 2, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(467, 'K-2050', '61412-BZ070-00', 'K-2050, PANEL, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 1439, 49, '2A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(468, 'N-2005', '61625-BZ190-00', 'N-2005, EXTENSION, QUARTER PANEL, RR RH', 'WH Docking', 'Inhouse', 5817, 193, '2A', 'D30D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(469, 'N-2006', '61626-BZ180-00', 'N-2006, EXTENSION, QUARTER PANEL, RR LH', 'WH Docking', 'Inhouse', 5817, 193, '2A', 'D30D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(470, 'K-4009', '67111-BZ110-00', 'K-4009,PANEL FR DOOR OUTSIDE, RH', 'WH Door Assy', 'Inhouse', 5005, 166, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(471, 'J-4041', '53311-BZ230-00', 'J-4041, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 564, 33, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(472, 'T-4002', '53321-BZ280-00', 'T-4002, PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 12180, 412, '5A', 'D14N', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(473, 'J-4044', '67148-BZ110-00', 'J-4044, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 564, 22, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(474, 'T-4035', '67115-BZA30-00', 'T-4035, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 7179, 237, '5A', 'D14N', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(475, 'T-4015', '67113-BZ410-00', 'T-4015, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 12180, 402, '5A', 'D14N', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(476, 'T-4016', '67114-BZ410-00', 'T-4016, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 12180, 401, '5A', 'D14N', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(477, 'T-4001', '53311-BZ290-00', 'T-4001, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 12180, 412, '5A', 'D14N', 'BD', 'DMUKTICO', '2021-11-30 08:58:24'),
(478, 'J-4043', '67147-BZ110-00', 'J-4043, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 564, 22, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(479, 'K-4064', '67149-BZ181-00', 'K-4064,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 1228, 44, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(480, 'J-4040', '67146-BZ100-00', 'J-4040, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 564, 22, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(481, 'T-4014', '67146-BZ150-00', 'T-4014, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 12180, 401, '3B', 'D14N', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(482, 'J-4042', '53321-BZ230-00', 'J-4042,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 564, 33, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(483, 'J-4032', '67142-BZ180-00', 'J-4032, PANEL, FR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 564, 22, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(484, 'J-4039', '67145-BZ100-00', 'J-4039, PANEL, FR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 564, 22, '2A', 'D17D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(485, 'J-4031', '67141-BZ180-00', 'J-4031, PANEL, FR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 564, 22, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(486, 'K-4069', '67144-BZ142-00', 'K-4069, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 1439, 49, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(487, 'T-4013', '67145-BZ160-00', 'T-4013, PANEL, FR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 12180, 402, '3B', 'D14N', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(488, 'T-4029', '67115-BZ820-00', 'T-4029, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 2021, 69, '5A', 'D14N', 'BD', 'DMUKTICO', '2021-11-30 08:58:24'),
(489, 'T-4030', '67115-BZ840-00', 'T-4030, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 928, 32, '5A', 'D14N', 'BD', 'DMUKTICO', '2021-11-30 08:58:24'),
(490, 'K-4011', '67111-BZ120-00', 'K-4011,PANEL FR DOOR OUTSIDE, RH', 'WH Door Assy', 'Inhouse', 2130, 73, '5A', 'D40D', 'C', 'DMUKTICO', '2021-11-30 08:58:24'),
(491, 'K-4068', '67143-BZ152-00', 'K-4068, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 1439, 49, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(492, 'T-4023', '67147-BZ170-00', 'T-4023, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 12180, 402, '3B', 'D14N', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(493, 'T-4024', '67148-BZ170-00', 'T-4024, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 12180, 401, '3B', 'D14N', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(494, 'K-4049', '67149-BZ170-00', 'K-4049,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 974, 34, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(495, 'K-4063', '67115-BZ251-00', 'K-4063,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Inhouse', 1228, 44, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(496, 'T-4034', '67115-BZA20-00', 'T-4034, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 2052, 68, '5A', 'D14N', 'AC', 'DMUKTICO', '2021-11-30 08:58:24'),
(497, 'K-4003', '53321-BZ130-00', 'K-4003,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 5005, 171, '3B', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(498, 'K-4018', '67114-BZ160-00', 'K-4018,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 856, 29, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(499, 'K-4016', '67114-BZ150-00', 'K-4016,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 1439, 49, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(500, 'K-4010', '67112-BZ110-00', 'K-4010, PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 5005, 166, '5A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(501, 'K-4032', '67143-BZ131-00', 'K-4032, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 530, 19, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(502, 'K-4033', '67144-BZ121-00', 'K-4033, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 530, 19, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(503, 'K-4051', '67149-BZ210-00', 'K-4051,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 203, 9, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(504, 'K-4015', '67113-BZ150-00', 'K-4015,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 1439, 49, '5A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(505, 'K-4067', '67149-BZ190-00', 'K-4067,PANEL BACK DOOR INSIDE', 'WH Door Assy', 'Inhouse', 211, 9, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(506, 'K-4045', '67145-BZ050-00', 'K-4045,PANEL, FR DOOR HINGE SIDE,RH', 'WH Door Assy', 'Inhouse', 5208, 173, '2A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(507, 'K-4001', '53311-BZ090-00', 'K-4001, PANEL HOOD', 'WH Door Assy', 'Inhouse', 5005, 171, '5A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(508, 'K-4043', '67144-BZ171-00', 'K-4043, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 856, 29, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(509, 'K-4079', '67142-BZ081-00', 'K-4079,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Inhouse', 5005, 166, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(510, 'K-4080', '67141-BZ091-00', 'K-4080,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Inhouse', 2130, 73, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(511, 'K-4046', '67146-BZ050-00', 'K-4046, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 5208, 173, '2A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(512, 'K-4062', '67115-BZ241-00', 'K-4062,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Inhouse', 211, 9, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(513, 'K-4078', '67141-BZ081-00', 'K-4078,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Inhouse', 5005, 166, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(514, 'K-4071', '53321-BZ220-00', 'K-4071, PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 203, 7, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(515, 'K-4004', '53321-BZ140-00', 'K-4004,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 2130, 71, '3B', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(516, 'K-4077', '67115-BZ630-00', 'K-4077;PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 58, 3, '5A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(517, 'K-4023', '67115-BZ280-00', 'K-4023,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 209, 9, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(518, 'K-4014', '67114-BZ140-00', 'K-4014,PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 327, 12, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(519, 'K-4017', '67113-BZ160-00', 'K-4017,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 856, 29, '5A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(520, 'K-4002', '53311-BZ100-00', 'K-4002,PANEL, HOOD', 'WH Door Assy', 'Inhouse', 2130, 71, '5A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(521, 'K-4070', '53311-BZ220-00', 'K-4070;PANEL, HOOD', 'WH Door Assy', 'Inhouse', 203, 7, '5A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(522, 'K-4075', '67114-BZ350-00', 'K-4075;PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 203, 7, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(523, 'K-4042', '67143-BZ181-00', 'K-4042, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 856, 29, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(524, 'K-4019', '67115-BZ220-00', 'K-4019,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 856, 30, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(525, 'K-4073', '67112-BZ320-00', 'K-4073;PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 203, 7, '5A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(526, 'K-4013', '67113-BZ140-00', 'K-4013,PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 327, 12, '5A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(527, 'K-4047', '67145-BZ060-00', 'K-4047,PANEL, FR DOOR HINGE SIDE,RH', 'WH Door Assy', 'Inhouse', 2130, 73, '2A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(528, 'K-4020', '67115-BZ230-00', 'K-4020,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(529, 'K-4083', '67142-BZ121-00', 'K-4083,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Inhouse', 203, 7, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(530, 'K-4048', '67146-BZ060-00', 'K-4048, PANEL, FR DOOR HINGE SIDE,LH', 'WH Door Assy', 'Inhouse', 2130, 72, '2A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(531, 'K-4082', '67141-BZ121-00', 'K-4082,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Inhouse', 203, 7, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(532, 'K-4081', '67142-BZ091-00', 'K-4081,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Inhouse', 2130, 72, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(533, 'K-4072', '67111-BZ320-00', 'K-4072;PANEL, FR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 203, 7, '5A', 'D40D', 'D', 'DMUKTICO', '2021-11-30 08:58:24'),
(534, 'K-4052', '67149-BZ200-00', 'K-4052,PANEL BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 209, 9, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(535, 'K-4074', '67113-BZ350-00', 'K-4074;PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 203, 7, '5A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(536, 'A-4041', '67149-BZ590-00', 'A-4041, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 10482, 345, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(537, 'K-4012', '67112-BZ120-00', 'K-4012,PANEL FR DOOR OUTSIDE, LH', 'WH Door Assy', 'Inhouse', 2130, 72, '5A', 'D40D', 'A', 'DMUKTICO', '2021-11-30 08:58:24'),
(538, 'K-4040', '67143-BZ171-00', 'K-4040, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(539, 'K-4041', '67144-BZ161-00', 'K-4041, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 0, 2, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(540, 'K-4059', '67115-BZ340-00', 'K-4059,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 118, 5, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(541, 'K-4037', '67144-BZ141-00', 'K-4037, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(542, 'K-4053', '53311-BZ110-00', 'K-4053,PANEL, HOOD', 'WH Door Assy', 'Inhouse', 0, 2, '5A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(543, 'K-4035', '67144-BZ131-00', 'K-4035,PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(544, 'K-4034', '67143-BZ141-00', 'K-4034,PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(545, 'K-4057', '67115-BZ300-00', 'K-4057,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 0, 0, '5A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(546, 'K-4054', '53321-BZ150-00', 'K-4054,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 0, 2, '2A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(547, 'K-4066', '67115-BZ480-00', 'K-4066,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(548, 'A-4039', '67147-BZ190-00', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(549, 'A-4040', '67148-BZ190-00', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(550, 'A-4042', '67149-BZ610-00', 'A-4042, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 1310, 44, '4A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(551, 'K-4065', '67115-BZ470-00', 'K-4065,PANEL BACK DOOR, OUTER', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(552, 'J-4021', '67113-BZ240-00', 'J-4021, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 564, 22, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(553, 'J-4022', '67114-BZ240-00', 'J-4022, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 564, 22, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(554, 'A-4021', '67118-BZ040-00', 'A-4021, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 0, 0, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(555, 'K-4058', '67115-BZ310-00', 'K-4058,PANEL BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 0, 2, '5A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(556, 'K-4076', '67115-BZ620-00', 'K-4076;PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 145, 6, '5A', 'D40D', 'TEIRYO', 'DMUKTICO', '2021-11-30 08:58:24'),
(557, 'J-4017', '67111-BZ210-00', 'J-4017, PANEL, FR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 564, 22, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(558, 'J-4018', '67112-BZ220-00', 'J-4018, PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 564, 22, '5A', 'D17D', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(559, 'K-4024', '67141-BZ080-00', 'K-4024,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Inhouse', 0, 0, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(560, 'K-4025', '67142-BZ080-00', 'K-4025,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Inhouse', 0, 0, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(561, 'K-4028', '67141-BZ120-00', 'K-4028,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Inhouse', 0, 0, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(562, 'K-4029', '67142-BZ120-00', 'K-4029,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Inhouse', 0, 0, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(563, 'K-4084', '67142-BZ300-00', 'K-4084, PANEL, FR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 0, 0, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(564, 'A-4022', '67119-BZ040-00', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 'WH Door Assy', 'Inhouse', 11792, 388, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(565, 'K-4085', '67143-BZ350-00', 'K-4085, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(566, 'K-4036', '67143-BZ151-00', 'K-4036, PANEL, RR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', 'B', 'DMUKTICO', '2021-11-30 08:58:24'),
(567, 'K-4086', '67144-BZ350-00', 'K-4086, PANEL, RR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 0, 0, '4A', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(568, 'K-4026', '67141-BZ090-00', 'K-4026,PANEL FR DOOR INSIDE ,RH', 'WH Door Assy', 'Inhouse', 0, 0, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(569, 'K-4027', '67142-BZ090-00', 'K-4027,PANEL FR DOOR INSIDE ,LH', 'WH Door Assy', 'Inhouse', 0, 0, 'IPPI', 'D40D', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(570, 'KS-4001', '53301-BZ160-00', 'KS-4001,HOOD SUB-ASSY', 'WH Door Assy', 'Inhouse', 5005, 171, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(571, 'KS-4002', '53301-BZ170-00', 'KS-4002,HOOD SUB-ASSY', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(572, 'KS-4003', '53301-BZ180-00', 'KS-4003,HOOD SUB-ASSY', 'WH Door Assy', 'Inhouse', 0, 2, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(573, 'KS-4004', '53301-BZ360-00', 'KS-4004, HOOD SUB-ASSY', 'WH Door Assy', 'Inhouse', 2130, 72, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(574, 'KS-4010', '67001-BZ200-00', 'KS-4010,PANEL SUB-ASSY, FR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(575, 'KS-4011', '67002-BZ190-00', 'KS-4011, PANEL SUB-ASSY FR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 2, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(576, 'KS-4012', '67001-BZ210-00', 'KS-4012, PANEL SUB-ASSY FR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(577, 'KS-4013', '67002-BZ200-00', 'KS-4013, PANEL SUB-ASSY FR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(578, 'KS-4014', '67001-BZ220-00', 'KS-4014,PANEL SUB-ASSY FR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(579, 'KS-4015', '67002-BZ210-00', 'KS-4015, PANEL SUB-ASSY FR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(580, 'KS-4016', '67001-BZ240-00', 'KS-4016, PANEL SUB-ASSY DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(581, 'KS-4017', '67002-BZ230-00', 'KS-4017, PANEL SUB-ASSY, FR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(582, 'KS-4020', '67003-BZ031-00', 'KS-4020, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(583, 'KS-4021', '67004-BZ211-00', 'KS-4021, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 2, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(584, 'KS-4022', '67003-BZ211-00', 'KS-4022, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 327, 12, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(585, 'KS-4023', '67004-BZ221-00', 'KS-4023, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 327, 12, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(586, 'KS-4024', '67003-BZ221-00', 'KS-4024, PANEL S/A, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(587, 'KS-4025', '67004-BZ231-00', 'KS-4025, PANEL SUB-ASSY RR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(588, 'KS-4026', '67003-BZ231-00', 'KS-4026, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(589, 'KS-4027', '67004-BZ241-00', 'KS-4027, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(590, 'KS-4028', '67003-BZ241-00', 'KS-4028, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 706, 25, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(591, 'KS-4029', '67004-BZ251-00', 'KS-4029, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 706, 25, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(592, 'KS-4030', '67003-BZ251-00', 'KS-4030, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(593, 'KS-4031', '67004-BZ261-00', 'KS-4031, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(594, 'KS-4032', '67003-BZ261-00', 'KS-4032, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 150, 6, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(595, 'KS-4033', '67004-BZ271-00', 'KS-4033, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 150, 6, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(596, 'KS-4040', '64930-BZ010-00', 'KS-4040,PANEL S/A BACK DOOR', 'WH Door Assy', 'Inhouse', 856, 30, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(597, 'KS-4041', '67005-BZ310-00', 'KS-4041, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(598, 'KS-4044', '67005-BZ360-00', 'KS-4044, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 209, 9, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(599, 'KS-4045', '67005-BZ410-00', 'KS-4045, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(600, 'KS-4046', '67005-BZ420-00', 'KS-4046, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 2, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(601, 'KS-4047', '67005-BZ460-00', 'KS-4047, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 118, 5, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(602, 'KS-4048', '67003-BZ310-00', 'KS-4048, PANEL SUB-ASSY RR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(603, 'KS-4050', '67005-BZ321-00', 'KS-4050, PANEL SUB-ASSY, BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(604, 'KS-4051', '67005-BZ331-00', 'KS-4051,PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 4, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(605, 'KS-4052', '67005-BZ620-00', 'KS-4052,PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(606, 'KS-4053', '67005-BZ630-00', 'KS-4053,PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(607, 'KS-4054', '67005-BZ322-00', 'KS-4054,SUB-ASSY, BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 2, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(608, 'KS-4055', '67002-BZ191-00', 'KS-4055, PANEL SUB-ASSY, FR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(609, 'KS-4056', '67002-BZ231-00', 'KS-4056, PANEL SUB-ASSY, FR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(610, 'KS-4057', '67003-BZ232-00', 'KS-4057, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 1439, 49, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(611, 'KS-4058', '67004-BZ242-00', 'KS-4058, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 1439, 49, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(612, 'KS-4059', '53301-BZ280-00', 'KS-4059, HOOD SUB-ASSY', 'WH Door Assy', 'Inhouse', 203, 7, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(613, 'KS-4060', '67001-BZ510-00', 'KS-4060, PANEL SUB-ASSY, FR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(614, 'KS-4061', '67002-BZ500-00', 'KS-4061, PANEL SUB-ASSY, FR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(615, 'KS-4062', '67003-BZ550-00', 'KS-4062, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 203, 7, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(616, 'KS-4063', '67004-BZ550-00', 'KS-4063, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 203, 7, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(617, 'KS-4064', '67005-BZ790-00', 'KS-4064, PANEL SUB-ASSY, BACK DOOR', 'WH Door Assy', 'Inhouse', 145, 6, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(618, 'KS-4065', '67005-BZ800-00', 'KS-4065, PANEL SUB-ASSY, BACK DOOR', 'WH Door Assy', 'Inhouse', 58, 3, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(619, 'KS-4066', '67003-BZ670-00', 'KS-4066, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(620, 'KS-4067', '67004-BZ670-00', 'KS-4067, PANEL SUB-ASSY, RR DOOR, LH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(621, 'KS-4068', '67001-BZ211-00', 'KS-4068, PANEL SUB-ASSY FR DOOR, RH', 'WH Door Assy', 'Inhouse', 2130, 73, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(622, 'KS-4069', '67002-BZ201-00', 'KS-4069, PANEL SUB-ASSY FR DOOR, LH', 'WH Door Assy', 'Inhouse', 2130, 72, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(623, 'KS-4070', '67001-BZ221-00', 'KS-4070,PANEL SUB-ASSY FR DOOR, RH', 'WH Door Assy', 'Inhouse', 150, 6, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(624, 'KS-4071', '67002-BZ211-00', 'KS-4071, PANEL SUB-ASSY, FR DOOR, LH', 'WH Door Assy', 'Inhouse', 150, 6, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(625, 'KS-4072', '67001-BZ511-00', 'KS-4072, PANEL SUB-ASSY, FR DOOR, RH', 'WH Door Assy', 'Inhouse', 203, 7, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(626, 'KS-4073', '67002-BZ501-00', 'KS-4073, PANEL SUB-ASSY, FR DOOR, LH', 'WH Door Assy', 'Inhouse', 203, 7, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(627, 'KS-4076', '67001-BZ201-00', 'KS-4076,PANEL SUB-ASSY, FR DOOR, RH', 'WH Door Assy', 'Inhouse', 4855, 161, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(628, 'KS-4077', '67002-BZ192-00', 'KS-4077, PANEL SUB-ASSY, FR DOOR, LH', 'WH Door Assy', 'Inhouse', 4855, 160, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(629, 'KS-4081', '67003-BZ780-00', 'KS-4081, PANEL SUB-ASSY, RR DOOR, RH', 'WH Door Assy', 'Inhouse', 0, 0, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(630, 'KS-4908', '53301-BZ1801-00', 'KS-4908,HOOD SUB-ASSY W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(631, 'KS-4909', '67005-BZ4101-00', 'KS-4909, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(632, 'KS-4910', '67005-BZ4201-00', 'KS-4910, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(633, 'KS-4911', '67005-BZ6201-00', 'KS-4911,PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(634, 'KS-4912', '67005-BZ6301-00', 'KS-4912,PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24');
INSERT INTO `tbl_master_part` (`id`, `job_no`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `maks_shift`, `machine`, `model`, `patan`, `create_by`, `create_date`) VALUES
(635, 'KS-4913', '53301-BZ1601-00', 'KS-4913,HOOD SUB-ASSY W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(636, 'KS-4914', '53301-BZ1701-00', 'KS-4914,HOOD SUB-ASSY W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(637, 'KS-4915', '53301-BZ2801-00', 'KS-4915, HOOD SUB-ASSY W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(638, 'KS-4916', '64930-BZ0101-00', 'KS-4916,PANEL S/A BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(639, 'KS-4917', '67005-BZ3101-00', 'KS-4917, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(640, 'KS-4918', '67005-BZ3221-00', 'KS-4918,S/A, BACK DOOR W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(641, 'KS-4919', '67005-BZ3311-00', 'KS-4919,PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(642, 'KS-4920', '67005-BZ3601-00', 'KS-4920, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(643, 'KS-4921', '67005-BZ4601-00', 'KS-4921, PANEL SUB-ASSY BACK DOOR', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(644, 'KS-4922', '67005-BZ7901-00', 'KS-4922, PANEL S/A, BACK DOOR W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(645, 'KS-4923', '67005-BZ8001-00', 'KS-4923, PANEL S/A, BACK DOOR W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(646, 'KS-4924', '67005-BZE60-00', 'KS-4924, PANEL SUB-ASSY, BACK DOOR', 'WH Door Assy', 'Inhouse', 211, 9, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(647, 'KS-4925', '67005-BZE70-00', 'KS-4925, PANEL SUB-ASSY, BACK DOOR', 'WH Door Assy', 'Inhouse', 1228, 42, 'HEMMING', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(648, 'KS-4950', '53301-BZ3601-00', 'KS-4950, HOOD SUB-ASSY W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(649, 'KS-4951', '67005-BZE601-00', 'KS-4951, PANEL S/A, BACK DOOR W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(650, 'KS-4952', '67005-BZE701-00', 'KS-4952, PANEL S/A, BACK DOOR W/O Hinge', 'WH Door Assy', 'Inhouse', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(651, 'A-4019', '67118-BZ010-00', 'A-4019, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 4672, 155, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(652, 'A-4020', '67118-BZ020-00', 'A-4020, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 7120, 235, '5A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(653, 'A-4031', '67133-BZ100-00', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 'WH Door Assy', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(654, 'A-4032', '67134-BZ110-00', 'A-4032, EXT,FR DOOR OUTS PNL REINF,RR LH', 'WH Door Assy', 'Inhouse', 11792, 388, '2A', 'D26A', 'ABCD', 'DMUKTICO', '2021-11-30 08:58:24'),
(655, 'GL-0141', '53962-BZ010-00', 'GL-0141,BRACKET RESONATOR MOUNTING, NO.2', 'WH Docking', 'Subcont', 0, 0, 'STEP', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(656, 'D-2119', '17528-87Z04-00', 'D-2119, ANCHOR CATTAL COVERTER SUPP NO', 'WH Docking', 'Subcont', 4513, 149, 'SUBUR', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(657, 'GBA-0010', '51502-BZ080-00', 'GBA-0010, SUPPORT S/A,SUSPENSION ARM, LH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(658, 'GBA-0011', '51543-BZ020-00', 'GBA-0011, REINF,LWR CTRL LINK BRACKET,RH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(659, 'GBA-0012', '51544-BZ020-00', 'GBA-0012, REINF,LWR CTRL LINK BRACKET,LH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(660, 'Y-1522', '51546-BZ011-00', 'Y-1522, BKT, LWR CONTROL LINK, INNER LH', 'WH Docking', 'Subcont', 0, 0, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(661, 'GBA-0013', '51904-BZ040-00', 'GBA-0013, HANGER S/A, EXHAUST PIPE, NO.4', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(662, 'F-0039', '52191-87602-00', 'F-0039, STAY REAR BUMPER SIDE RH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(663, 'GA-0008', '53202-BZ140-00', 'GA-0008, SUPPORT SUB-ASSY, RADIATOR, RH', 'WH Docking', 'Subcont', 7120, 235, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(664, 'GA-0009', '53203-BZ240-00', 'GA-0009, SUPPORT SUB-ASSY, RADIATOR, LH', 'WH Docking', 'Subcont', 7120, 235, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(665, 'GA-0011', '53214-BZ110-00', 'GA-0011, SUPPORT, RADIATOR, UPR LH', 'WH Docking', 'Subcont', 7120, 235, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(666, 'W-1003', '53215-BZ060-00', 'W-1003,SUPPORT, HOOD LOCK', 'WH Docking', 'Subcont', 0, 0, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(667, 'Y-1033', '53261-87Z02-00', 'Y-1033, BRKT RADIATOR RESERVE TAN', 'WH Docking', 'Subcont', 5183, 172, 'MKSD', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(668, 'GY-0001', '53307-BZ010-00', 'GY-0001, HOOK SUB-ASSY, HOOD LOCK', 'WH Docking', 'Subcont', 0, 0, 'STEP', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(669, 'GW-0007', '53420-BZ020-00', 'GW-0007,HINGE ASSY, HOOD, LH', 'WH Docking', 'Subcont', 0, 0, 'NAMICOH', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(670, 'W-1012', '53721-BZ040-00', 'W-1012,SUPPORT, FR SPRING, RH', 'WH Docking', 'Subcont', 0, 0, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(671, 'W-1019', '53736-BZ020-00', 'W-1019,MEMBER, FR APRON TO COWL SIDE, OU', 'WH Docking', 'Subcont', 0, 0, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(672, 'GBA-0033', '55114-BZ040-00', 'GBA-0033, PANEL, DASH SIDE, LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(673, 'GBA-0034', '55115-BZ010-00', 'GBA-0034, PANEL, DASH, RR', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(674, 'GBA-0035', '55116-BZ060-00', 'GBA-0035, PLATE, BRAKE PEDAL SUPPORT MTG', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(675, 'GBA-0168', '55149-BZ200-00', 'GBA-0168, RETAINER, PEDAL BRACKET', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(676, 'D-0006', '55716-87Z03-00', 'D-0006,R/F FRONT PANEL UPPER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(677, 'GBA-0037', '55745-BZ120-00', 'GBA-0037, REINFORCEMENT, COWL TOP, INNER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(678, 'GBA-0038', '55745-BZ130-00', 'GBA-0038, REINFORCEMENT, COWL TOP, INNER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(679, 'GBA-0039', '55746-BZ040-00', 'GBA-0039, REINFORCE, COWL TOP, INNER LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(680, 'GBA-0040', '55746-BZ050-00', 'GBA-0040, REINFORCE, COWL TOP, INNER LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(681, 'GBA-0041', '55759-BZ070-00', 'GBA-0041, BRACKET, COWL TOP INN STAY MTG', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(682, 'GBA-0003', '57033-BZ060-00', 'GBA-0003,BRACKET S/A,RR FLOOR MTG,NO.2RH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(683, 'GBA-0004', '57034-BZ050-00', 'GBA-0004,BRACKET S/A,RR FLOOR MTG,NO.2LH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(684, 'GBA-0018', '57105-BZ200-00', 'GBA-0018, PLATE S/A, FR SIDE MEMBER, RH', 'WH Docking', 'Subcont', 7120, 235, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(685, 'GBA-0019', '57106-BZ180-00', 'GBA-0019, PLATE S/A, FR SIDE MEMBER, LH', 'WH Docking', 'Subcont', 7120, 235, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(686, 'GBA-0175', '57106-BZ240-00', 'GBA-0175, PLATE S/A, FR SIDE MEMBER, LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(687, 'GBA-0014', '57117-BZ080-00', 'GBA-0014, PLATE, FR SIDE MEMBER, NO.2 RH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(688, 'Y-1590', '57146-BZ020-00', 'Y-1590, R/F FR SIDE MEMBER, RR LH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(689, 'GA-0040', '57153-BZ140-00', 'GA-0040, REINF, FR SIDE MEMBER, NO.2 RH', 'WH Docking', 'Subcont', 7120, 235, 'YPI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(690, 'Y-1181', '57154-BZ010-00', 'Y-1181,REINFORCE, FR SIDE MBR, NO.2 LH', 'WH Docking', 'Subcont', 0, 0, 'YPI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(691, 'GA-0041', '57154-BZ130-00', 'GA-0041, REINF, FR SIDE MEMBER, NO.2 LH', 'WH Docking', 'Subcont', 7120, 235, 'YPI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(692, 'Y-1038', '57168-BZ090-00', 'Y-1038, MEMBER, FR FLOOR, LH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(693, 'GA-0004', '57188-BZ080-00', 'GA-0004, REINF, FR SIDE MEMBER EXT, RH', 'WH Docking', 'Subcont', 14240, 469, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(694, 'W-1017', '57312-BZ060-00', 'W-1017 OUTRIGGER, NO.1 FR LH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(695, 'W-1214', '57315-BZ110-00', 'W-1214,OUTRIGGER, NO.3 RH', 'WH Docking', 'Subcont', 0, 0, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(696, 'GBA-0005', '57403-BZ150-00', 'GBA-0005, MEMBER S/A,FLR SIDE,INNR RR RH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(697, 'GBA-0006', '57404-BZ140-00', 'GBA-0006, MEMBER S/A,FLR SIDE,INNR RR LH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(698, 'GBA-0007', '57603-BZ230-00', 'GBA-0007, MEMBER S/A,RR FLOOR SIDE,RR RH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(699, 'GBA-0008', '57604-BZ200-00', 'GBA-0008, MEMBER S/A,RR FLOOR SIDE,RR LH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(700, 'GBA-0139', '57652-BZ180-00', 'GBA-0139, MEMBER, RR FLOOR CROSS, NO.1', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(701, 'GBA-0169', '57689-BZ030-00', 'GBA-0169, REINFORCE,RR FLOOR CROSSMEMBER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(702, 'GA-0001', '57803-BZ060-00', 'GA-0001, REINF S/A, RR FLR SI MBR, RR RH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(703, 'GA-0002', '57804-BZ040-00', 'GA-0002, REINF S/A, RR FLR SI MBR, RR LH', 'WH Docking', 'Subcont', 7120, 235, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(704, 'GBA-0170', '58139-BZ070-00', 'GBA-0170, BRACKET, FENDER LINER, LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(705, 'GA-0033', '58269-BZ050-00', 'GA-0033, BRACKET,PRKG BRK CBL GUIDE,NO.3', 'WH Docking', 'Subcont', 7120, 235, 'NIC', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(706, 'GA-0034', '58289-BZ120-00', 'GA-0034, BRACKET,FLOOR BRAKE HOSE, RR RH', 'WH Docking', 'Subcont', 7120, 235, 'NIC', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(707, 'GBA-0065', '58371-BZ280-00', 'GBA-0065, PANEL, BODY LWR BACK, OUTER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(708, 'GBA-0066', '58383-BZ080-00', 'GBA-0066, REINF, BODY LWR BACK PNL,INNER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(709, 'W-1703', '61131-BZ180-00', 'W-1703,PILLAR FR BODY,OUTER RH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(710, 'W-1033', '61613-BZ060-00', 'W-1033,PANEL, QUARTER, INNER RH', 'WH Docking', 'Subcont', 0, 2, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(711, 'W-2014', '61628-BZ020-00', 'W-2014, QUARTER PANEL, RR LWR', 'WH Docking', 'Subcont', 0, 0, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(712, 'GBA-0171', '61637-BZ110-00', 'GBA-0171, BRACE, QUARTER PANEL, RH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(713, 'GBA-0172', '61638-BZ080-00', 'GBA-0172, BRACE, QUARTER PANEL, LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(714, 'GA-0003', '61675-BZ100-00', 'GA-0003, REINF, RR SUSP SPRING SUPT, RH', 'WH Docking', 'Subcont', 14240, 469, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(715, 'GA-0038', '61677-BZ090-00', 'GA-0038, BRACKET,RR SUSPENSION BUMPER,RH', 'WH Docking', 'Subcont', 14240, 469, 'TCH', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(716, 'W-2041', '61718-BZ010-00', 'W-2041,REINFORCEMENT, QUARTER PANEL EXT,', 'WH Docking', 'Subcont', 0, 0, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(717, 'GBA-0173', '61735-BZ120-00', 'GBA-0173, PANEL, ROOF SIDE, INNER RR RH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(718, 'GBA-0174', '61736-BZ120-00', 'GBA-0174, PANEL, ROOF SIDE, INNER RR LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(719, 'Y-4059', '67121-BZ010-00', 'Y-4059,REINFOR FR DOOR OUTSIDE PANEL, RH', 'WH Docking', 'Subcont', 0, 0, 'NTC', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(720, 'GW-0008', '67121-BZ030-00', 'GW-0008, REINF, FR DOOR OUTSIDE PNL, RH', 'WH Docking', 'Subcont', 0, 0, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(721, 'Y-4060', '67125-BZ010-00', 'Y-4060,REINFORCEMENT, RR DOOR OUTSIDE PA', 'WH Docking', 'Subcont', 0, 0, 'NTC', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(722, 'GW-0035', '67125-BZ030-00', 'GW-0035, REINF, RR DR OUTSIDE PANEL, RH', 'WH Docking', 'Subcont', 0, 0, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(723, 'Y-4061', '67126-BZ010-00', 'Y-4061,REINFORC, RR DOOR OUTSIDE PANEL L', 'WH Docking', 'Subcont', 0, 0, 'NTC', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(724, 'Y-4022', '67151-BZ010-00', 'Y-4022,R/F FR DOOR INSIDE PNL, RH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(725, 'Y-4023', '67152-BZ010-00', 'Y-4023,R/F FR DOOR INSIDE PNL, LH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(726, 'Y-4024', '67153-BZ010-00', 'Y-4024,R/F FR DOOR INSIDE PNL RR,  RH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(727, 'GW-0016', '67154-BZ030-00', 'GW-0016, REINF, FR DOOR INS PNL, RR LH', 'WH Docking', 'Subcont', 0, 0, 'P3T', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(728, 'Y-4036', '67155-BZ010-00', 'Y-4036,R/F RR DOOR INSIDE PANEL RH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(729, 'Y-4028', '67181-BZ010-00', 'Y-4028 RETAINER, DOOR HINGE', 'WH Docking', 'Subcont', 0, 0, 'YPI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(730, 'GW-0019', '67316-BZ030-00', 'GW-0019, GUSSET, FR DOOR O / PNL, RR LH', 'WH Docking', 'Subcont', 0, 0, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(731, 'GY-0015', '67975-BZ010-00', 'GY-0015, REINF, BACK DOOR INSIDE PANEL', 'WH Docking', 'Subcont', 0, 0, 'DCI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(732, 'W-4013', '68681-BZ010-00', 'W-4013,REINFORCEMENT, BACK DOOR, UPR HIN', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(733, 'GBA-0021', '57409-BZ240-00', 'GBA-0021, MEMBER S/A,MAIN FLOOR SIDE, LH', 'WH Docking', 'Subcont', 7120, 235, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(734, 'GBJ-0030', '58372-BZ100-00', 'GBJ-0030, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Subcont', 366, 14, '3B', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(735, 'GBA-0020', '57406-BZ270-00', 'GBA-0020, MEMBER S/A,MAIN FLOOR SIDE, RH', 'WH Docking', 'Subcont', 7120, 235, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(736, 'GA-0006', '57025-BZ070-00', 'GA-0006, MEMBER S/A,FR SIDE,OUTER RH', 'WH Docking', 'Subcont', 7120, 235, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(737, 'GA-0007', '57026-BZ060-00', 'GA-0007, MEMBER S/A,FR SIDE,OUTER LH', 'WH Docking', 'Subcont', 7120, 235, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(738, 'GBJ-0031', '58372-BZ110-00', 'GBJ-0031, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Subcont', 198, 7, '3B', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(739, 'GA-0032', '53078-BZ140-00', 'GA-0032,EXTENSION S/A,FR FENDER APRON,LH', 'WH Docking', 'Subcont', 7120, 235, 'NIC', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(740, 'GA-0036', '51401-BZ110-00', 'GA-0036, BRACKET S/A, ENGINE FR MOUNTING', 'WH Docking', 'Subcont', 14240, 469, 'NTC', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(741, 'W-2013', '61627-BZ010-00', 'W-2013,EXTENSION, QUARTER PANEL, RR LWR', 'WH Docking', 'Subcont', 0, 0, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(742, 'W-1011', '53718-BZ020-00', 'W-1011,APRON, FR FENDER, NO.2 LH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(743, 'W-1122', '55111-BZ830-00', 'W-1122, PANEL, DASH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(744, 'GA-0005', '52141-BZ100-00', 'GA-0005, ARM, FR BUMPER, RH', 'WH Docking', 'Subcont', 7120, 235, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(745, 'GW-0048', '67304-B0010-00', 'GW-0048,BEAM S/A, RR DOOR PROTECTION, LH', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(746, 'GBA-0002', '55169-BZ210-00', 'GBA-0002, BRACKET,FR FENDER MOUNTING, LH', 'WH Docking', 'Subcont', 7120, 235, 'AMA', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(747, 'GBA-0001', '55168-BZ310-00', 'GBA-0001, BRACKET, FR FENDER MOUNTING', 'WH Docking', 'Subcont', 7120, 235, 'AMA', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(748, 'W-1010', '53717-BZ040-00', 'W-1010,APRON, FR FENDER, NO.2 RH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(749, 'GA-0010', '53213-BZ130-00', 'GA-0010, SUPPORT, RADIATOR, UPR RH', 'WH Docking', 'Subcont', 7120, 235, 'MES', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(750, 'F-0088', '53268-87602-00', 'F-0088, R/F RADTR MTG', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(751, 'W-2028', '61732-BZ050-00', 'W-2028,PANEL, ROOF SIDE, INNER LH', 'WH Docking', 'Subcont', 0, 0, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(752, 'W-1040', '57112-BZ090-00', 'W-1040,MEMBER, FR SIDE, LH', 'WH Docking', 'Subcont', 0, 0, 'MAJ', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(753, 'W-1006', '53711-BZ060-00', 'W-1006,APRON, FR FENDER, FR RH', 'WH Docking', 'Subcont', 0, 0, 'ASI', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(754, 'FS-0034', '51903-PD628-00', 'FS-0034, CARRIER SUB ASSY SPARE WHEEL', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(755, 'GBA-0017', '57802-BZ030-00', 'GBA-0017, REINF S/A,RR FLR SI MBR, FR LH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(756, 'GBA-0016', '57801-BZ130-00', 'GBA-0016, REINF S/A,RR FLR SI MBR, FR RH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(757, 'GBA-0094', '58372-BZ230-00', 'GBA-0094, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(758, 'GBA-0009', '51501-BZ090-00', 'GBA-0009, REINF SUB-ASSY,FR SUSP MBR, RH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(759, 'GBA-0015', '57118-BZ080-00', 'GBA-0015, PLATE, FR SIDE MEMBER, NO.2 LH', 'WH Docking', 'Subcont', 7120, 235, 'DPM', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(760, 'GBA-0159', '58325-BZ110-00', 'GBA-0159, COVER, RR FLOOR SERVICE HOLE', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(761, 'GBA-0095', '58372-BZ240-00', 'GBA-0095, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(762, 'GBA-0154', '53751-BZ190-00', 'GBA-0154, BRACKET, CHARCOAL CANISTER MTG', 'WH Docking', 'Subcont', 0, 0, '0', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(763, 'GK-0002', '53307-BZ071-00', 'GK-0002, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Subcont', 5005, 171, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(764, 'GK-0004', '53307-BZ081-00', 'GK-0004, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Subcont', 2130, 71, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(765, 'GK-0005', '53307-BZ090-00', 'GK-0005, HOOK SUB-ASSY, HOOD LOCK', 'WH Door Assy', 'Subcont', 203, 9, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(766, 'GK-0006', '53331-BZ050-00', 'GK-0006, PLATE, HOOD HINGE MOUNTING', 'WH Door Assy', 'Subcont', 10416, 355, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(767, 'GBK-015', '53331-BZ190-00', 'GBK-0152, PLATE, HOOD HINGE MOUNTING', 'WH Door Assy', 'Subcont', 4260, 141, 'STEP', '0', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(768, 'GK-0009', '61773-BZ010-00', 'GK-0009, REINF, RR WIPER MOUNTING', 'WH Door Assy', 'Subcont', 209, 9, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(769, 'GK-0010', '67051-BZ020-00', 'GK-0010, REINF SUB-ASSY, FR DOOR, RH', 'WH Door Assy', 'Subcont', 2130, 73, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(770, 'GK-0011', '67053-BZ030-00', 'GK-0011,REINF S / A, FR DOOR INS PNL, RH', 'WH Door Assy', 'Subcont', 7338, 244, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(771, 'GK-0012', '67117-BZ010-00', 'GK-0012, REINF, RR WIPER MOUNTING', 'WH Door Assy', 'Subcont', 2413, 84, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(772, 'GK-0013', '67121-BZ040-00', 'GK-0013, REINF, FR DOOR OUTSIDE PNL, RH', 'WH Door Assy', 'Subcont', 5208, 173, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(773, 'GK-0014', '67121-BZ050-00', 'GK-0014, REINF, FR DOOR OUTSIDE PNL, RH', 'WH Door Assy', 'Subcont', 2130, 73, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(774, 'GK-0015', '67122-BZ030-00', 'GK-0015, REINF, FR DOOR OUTSIDE PANEL,LH', 'WH Door Assy', 'Subcont', 5208, 173, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(775, 'GK-0016', '67122-BZ040-00', 'GK-0016, REINF, FR DOOR OUTSIDE PNL, LH', 'WH Door Assy', 'Subcont', 2130, 72, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(776, 'GK-0017', '67123-BZ040-00', 'GK-0017, RETAIN, SLIDE D UPR ROLLER, RH', 'WH Door Assy', 'Subcont', 2825, 95, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(777, 'GK-0018', '67124-BZ030-00', 'GK-0018, RETAIN, SLIDE DR UPR ROLLER, LH', 'WH Door Assy', 'Subcont', 2825, 95, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(778, 'GK-0019', '67125-BZ050-00', 'GK-0019, REINF, RR DOOR OUTSIDE PANEL, R', 'WH Door Assy', 'Subcont', 2825, 95, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(779, 'GK-0020', '67126-BZ050-00', 'GK-0020,REINF, RR DOOR OUTSIDE PANEL, LH', 'WH Door Assy', 'Subcont', 2825, 95, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(780, 'GK-0085', '67127-BZ031-00', 'GK-0085, REINF, RR DOOR OUTS PANEL, NO.2', 'WH Door Assy', 'Subcont', 5650, 187, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(781, 'GK-0022', '67131-BZ020-00', 'GK-0022, EXT, FR DR OUT PNL REINF, FR RH', 'WH Door Assy', 'Subcont', 14676, 487, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(782, 'GK-0023', '67135-BZ010-00', 'GK-0023, REINF, SLIDE DOOR OUTER PANEL', 'WH Door Assy', 'Subcont', 5650, 188, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(783, 'GK-0024', '67155-BZ060-00', 'GK-0024, REINF, RR DOOR INSIDE PANEL, RH', 'WH Door Assy', 'Subcont', 2825, 95, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(784, 'GK-0025', '67156-BZ050-00', 'GK-0025, REINF, RR DOOR INSIDE PANEL, LH', 'WH Door Assy', 'Subcont', 2825, 95, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(785, 'GK-0026', '67164-BZ020-00', 'GK-0026, EXT, FR DR INS PNL REINF, RR LH', 'WH Door Assy', 'Subcont', 7338, 243, 'ASALTA', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(786, 'GK-0027', '67166-BZ040-00', 'GK-0027, EXT, FR DR INS PNL REINF, FR LH', 'WH Door Assy', 'Subcont', 2130, 72, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(787, 'GK-0028', '67171-BZ010-00', 'GK-0028, REINF, FR DOOR HINGE, RH', 'WH Door Assy', 'Subcont', 7338, 244, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(788, 'GK-0029', '67172-BZ010-00', 'GK-0029, REINF, FR DOOR HINGE, LH', 'WH Door Assy', 'Subcont', 7338, 243, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(789, 'GK-0030', '67173-BZ020-00', 'GK-0030, REINF, FR DOOR LWR HINGE, RH', 'WH Door Assy', 'Subcont', 5090, 168, 'P3T', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(790, 'GK-0031', '67175-BZ040-00', 'GK-0031, REINFOR, BACK DOOR HINGE, RH', 'WH Door Assy', 'Subcont', 2413, 84, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(791, 'GK-0032', '67175-BZ060-00', 'GK-0032, REINF, BACK DOOR HINGE, RH', 'WH Door Assy', 'Subcont', 203, 9, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(792, 'GK-0033', '67176-BZ030-00', 'GK-0033, REINF, BACK DOOR HINGE, LH', 'WH Door Assy', 'Subcont', 2413, 84, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(793, 'GK-0034', '67176-BZ050-00', 'GK-0034, REINF, BACK DOOR HINGE, LH', 'WH Door Assy', 'Subcont', 203, 9, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(794, 'GK-0035', '67177-BZ030-00', 'GK-0035, REINF, RR DOOR LWR ROLLER, RH', 'WH Door Assy', 'Subcont', 2825, 95, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(795, 'GK-0036', '67178-BZ020-00', 'GK-0036, REINF, RR DOOR LWR ROLLER, LH', 'WH Door Assy', 'Subcont', 2825, 95, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(796, 'GK-0037', '67181-BZ090-00', 'GK-0037, RETAINER, DOOR HINGE', 'WH Door Assy', 'Subcont', 29352, 972, 'YPI', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(797, 'GK-0038', '67183-BZ030-00', 'GK-0038, PATCH, FR DR REINF, RH', 'WH Door Assy', 'Subcont', 7338, 244, 'P3T', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(798, 'GK-0079', '67245-BZ010-00', 'GK-0079,RETAINER, OUTSIDE MIRROR BASE', 'WH Door Assy', 'Subcont', 1439, 51, 'YPI', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(799, 'GK-0039', '67261-BZ010-00', 'GK-0039, PLATE, B/ DR REINFRON, NO.1 RH', 'WH Door Assy', 'Subcont', 203, 9, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(800, 'GK-0040', '67262-BZ010-00', 'GK-0040, PLATE, B / D REINFOR, NO.1 LH', 'WH Door Assy', 'Subcont', 203, 9, 'MAJ', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(801, 'GK-0041', '67301-BZ050-00', 'GK-0041, BEAM S/A, DR SI-IMP PROTECT, RH', 'WH Door Assy', 'Subcont', 2248, 76, 'P3T', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(802, 'GK-0042', '67302-BZ040-00', 'GK-0042, BEAM S/A, DR SI-IMP PROTECT, LH', 'WH Door Assy', 'Subcont', 2248, 75, 'P3T', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(803, 'GK-0088', '67311-BZ060-T-00', 'GK-0088, BEAM, FR DR SIDE-IMP PROTECTION', 'WH Door Assy', 'Subcont', 0, 0, '0', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(804, 'GK-0046', '67317-BZ020-00', 'GK-0046, REINF, RR DOOR SIDE, RH', 'WH Door Assy', 'Subcont', 3938, 132, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(805, 'GK-0086', '67331-BZ050-00', 'GK-0086, RETAINER, SLIDE DOOR LOCK, RH', 'WH Door Assy', 'Subcont', 2878, 96, 'DPM', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(806, 'GK-0048', '67333-BZ040-00', 'GK-0048, RETAINER, SLIDE DOOR LOCK, RH', 'WH Door Assy', 'Subcont', 1439, 49, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(807, 'GK-0049', '67334-BZ030-00', 'GK-0049, RETAINER, SLIDE DOOR LOCK, LH', 'WH Door Assy', 'Subcont', 1439, 49, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(808, 'GK-0050', '67335-BZ050-00', 'GK-0050,REINFORCEMENT, FR DOOR LOCK, RH', 'WH Door Assy', 'Subcont', 7338, 244, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(809, 'GK-0051', '67336-BZ060-00', 'GK-0051, REINF, FR DOOR LOCK, LH', 'WH Door Assy', 'Subcont', 7338, 243, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(810, 'GK-0052', '67347-BZ010-00', 'GK-0052, RETAIN, SLIDE DR CTR ROLLER, RH', 'WH Door Assy', 'Subcont', 1439, 49, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(811, 'GK-0083', '67347-BZ020-00', 'GK-0083 RETAIN,SLIDE DOOR CTR ROLLER,RH', 'WH Door Assy', 'Subcont', 1386, 46, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(812, 'GK-0053', '67348-BZ010-00', 'GK-0053, RETAIN, SLIDE DR CTR ROLLER, LH', 'WH Door Assy', 'Subcont', 1439, 49, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(813, 'GK-0084', '67348-BZ020-00', 'GK-0084 RETAIN,SLIDE DOOR CTR ROLLER, LH', 'WH Door Assy', 'Subcont', 1386, 46, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(814, 'GK-0054', '67349-BZ030-00', 'GK-0054, REINF, RR DOOR UPR FRAME', 'WH Door Assy', 'Subcont', 1969, 66, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(815, 'GK-0059', '67355-BZ010-00', 'GK-0059, REINF, FR DOOR RR FRAME, RH', 'WH Door Assy', 'Subcont', 7338, 244, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(816, 'GK-0060', '67356-BZ010-00', 'GK-0060, REINF, FR DOOR RR FRAME, LH', 'WH Door Assy', 'Subcont', 7338, 243, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(817, 'GK-0061', '67357-BZ010-00', 'GK-0061, REINF, RR DOOR FR UPR FRAME, RH', 'WH Door Assy', 'Subcont', 2825, 95, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(818, 'GK-0062', '67358-BZ010-00', 'GK-0062, REINF, RR DOOR FR UPR FRAME, LH', 'WH Door Assy', 'Subcont', 2825, 95, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(819, 'GK-0063', '67359-BZ030-00', 'GK-0063, REINF, RR DOOR UPR FRAME, LH', 'WH Door Assy', 'Subcont', 1969, 66, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(820, 'GK-0067', '67391-BZ050-00', 'GK-0067,REINF, BACK DOOR LOCK', 'WH Door Assy', 'Subcont', 2413, 84, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(821, 'GK-0068', '67391-BZ060-00', 'GK-0068, REINF, BACK DOOR LOCK', 'WH Door Assy', 'Subcont', 209, 9, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(822, 'GK-0069', '67391-BZ070-00', 'GK-0069, REINF, BACK DOOR LOCK', 'WH Door Assy', 'Subcont', 203, 9, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(823, 'GK-0070', '67395-BZ010-00', 'GK-0070, RETAINER, BACK DOOR GRIP', 'WH Door Assy', 'Subcont', 418, 15, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(824, 'GK-0080', '67816-BZ010-00', 'GK-0080, SHEET, BACK DOOR REINFORCE', 'WH Door Assy', 'Subcont', 2878, 99, 'NITTO', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(825, 'GK-0071', '68601-BZ010-00', 'GK-0071,REINF S / A, BACK DOOR HINGE, RH', 'WH Door Assy', 'Subcont', 209, 9, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(826, 'GK-0047', '67322-BZ030-00', 'GK-0047, EXTENSION, FR DOOR BEAM, FR LH', 'WH Door Assy', 'Subcont', 0, 2, 'ALMINDO', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(827, 'GK-0055', '67351-BZ010-00', 'GK-0055, REINF, FR DOOR FR UPR FRAME, RH', 'WH Door Assy', 'Subcont', 7338, 244, 'ASALTA', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(828, 'GK-0056', '67352-BZ010-00', 'GK-0056, REINF, FR DOOR FR UPR FRAME, LH', 'WH Door Assy', 'Subcont', 7338, 243, 'ASALTA', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(829, 'GK-0057', '67353-BZ010-00', 'GK-0057, REIN, FR DR FR UPR FRME, NO.2 R', 'WH Door Assy', 'Subcont', 7338, 244, 'ASALTA', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(830, 'GK-0058', '67354-BZ010-00', 'GK-0058, REINF, FR DR FR UPR FRM, NO.2 L', 'WH Door Assy', 'Subcont', 7338, 243, 'ASALTA', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(831, 'GK-0087', '67975-BZ060-00', 'GK-0087, REINF, BACK DOOR INSIDE PANEL', 'WH Door Assy', 'Subcont', 1439, 49, 'YPI', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(832, 'GK-0044', '67304-BZ030-00', 'GK-0044, BEAM S/A, RR DR PROTECTION, LH', 'WH Door Assy', 'Subcont', 150, 6, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(833, 'GK-0043', '67303-BZ030-00', 'GK-0043, BEAM S/A, RR DR PROTECTION, RH', 'WH Door Assy', 'Subcont', 150, 6, 'MES', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(834, 'GK-008', '68131-BZ270-00', 'GK-0081,PANEL, BACK DOOR GLASS', 'WH Door Assy', 'Subcont', 856, 30, 'MKSD', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(835, 'GK-007', '68801-BZ091-00', 'GK-0076, HINGE SUB-ASSY, BACK DOOR', 'WH Door Assy', 'Subcont', 5232, 174, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(836, 'GK-0008', '53402-BZ030-00', 'GK-0008, HINGE SUB-ASSY, HOOD, LH', 'WH Door Assy', 'Subcont', 7338, 248, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(837, 'GK-0007', '53401-BZ030-00', 'GK-0007, HINGE SUB-ASSY, HOOD, RH', 'WH Door Assy', 'Subcont', 7338, 248, 'NAMICOH', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24'),
(838, 'GK-006', '67361-BZ030-00', 'GK-0064, RETAINER, BACK DOOR HINGE', 'WH Door Assy', 'Subcont', 30720, 1037, 'STEP', 'D40D S/A', '0', 'DMUKTICO', '2021-11-30 08:58:24');

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
(1, '2021-12-01', 'A', 'D'),
(2, '2021-12-01', 'B', 'N'),
(3, '2021-12-02', 'C', 'D'),
(4, '2021-12-02', 'D', 'N'),
(5, '2021-12-03', 'A', 'D'),
(6, '2021-12-03', 'B', 'N'),
(7, '2021-12-04', 'C', 'D'),
(8, '2021-12-04', NULL, 'N'),
(9, '2021-12-05', NULL, 'D'),
(10, '2021-12-05', 'D', 'N'),
(11, '2021-12-06', 'A', 'D'),
(12, '2021-12-06', 'B', 'N'),
(13, '2021-12-07', 'C', 'D'),
(14, '2021-12-07', 'D', 'N'),
(15, '2021-12-08', 'A', 'D'),
(16, '2021-12-08', 'B', 'N'),
(17, '2021-12-09', 'C', 'D'),
(18, '2021-12-09', 'D', 'N'),
(19, '2021-12-10', 'A', 'D'),
(20, '2021-12-10', 'B', 'N'),
(21, '2021-12-11', NULL, 'D'),
(22, '2021-12-11', NULL, 'N'),
(23, '2021-12-12', NULL, 'D'),
(24, '2021-12-12', 'C', 'N'),
(25, '2021-12-13', 'B', 'D'),
(26, '2021-12-13', 'A', 'N'),
(27, '2021-12-14', 'B', 'D'),
(28, '2021-12-14', 'C', 'N'),
(29, '2021-12-15', 'D', 'D'),
(30, '2021-12-15', 'A', 'N'),
(31, '2021-12-16', 'B', 'D'),
(32, '2021-12-16', 'C', 'N'),
(33, '2021-12-17', 'D', 'D'),
(34, '2021-12-17', 'A', 'N'),
(35, '2021-12-18', 'B', 'D'),
(36, '2021-12-18', NULL, 'N'),
(37, '2021-12-19', NULL, 'D'),
(38, '2021-12-19', 'C', 'N'),
(39, '2021-12-20', 'D', 'D'),
(40, '2021-12-20', 'A', 'N'),
(41, '2021-12-21', 'B', 'D'),
(42, '2021-12-21', 'C', 'N'),
(43, '2021-12-22', 'D', 'D'),
(44, '2021-12-22', 'A', 'N'),
(45, '2021-12-23', 'B', 'D'),
(46, '2021-12-23', 'C', 'N'),
(47, '2021-12-24', 'D', 'D'),
(48, '2021-12-24', 'B', 'N'),
(49, '2021-12-25', NULL, 'D'),
(50, '2021-12-25', NULL, 'N'),
(51, '2021-12-26', NULL, 'D'),
(52, '2021-12-26', 'C', 'N'),
(53, '2021-12-27', 'A', 'D'),
(54, '2021-12-27', 'B', 'N'),
(55, '2021-12-28', 'C', 'D'),
(56, '2021-12-28', 'D', 'N'),
(57, '2021-12-29', 'A', 'D'),
(58, '2021-12-29', 'B', 'N'),
(59, '2021-12-30', 'C', 'D'),
(60, '2021-12-30', 'D', 'N'),
(61, '2021-12-31', 'D', 'D'),
(62, '2021-12-31', 'A', 'N');

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
(144, 'stockinput_dock', 'stock', 'input_dock', '-', 'Input Docking', 'master/transaction', 'tbl_input_general', 3);

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
(1505, 'stockinput_dock', 'WH Door Assy', 'no', 'no', 'no', 'no');

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
('2021-12-10 09:03:27', 'tbl_master_patan', 62, 62, 63),
('2021-12-14 09:10:09', 'tbl_input_general', 15, 15, 15);

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
(2, '56540', 'b2fb06abbe7ea77e4c53cbf7ea3fd15b294', 'DMUKTICO', 56540, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2021-12-16 07:51:24', '2021-12-16 07:53:20', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(12, '3007', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiyanto', 3007, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'foreman', 'B', '2021-11-01 11:00:22', '2021-12-16 12:42:32', '2021-12-15 16:09:21', '89f3d7b16c27a055a30d38bca7e7f0ab5542ba31'),
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
('::1', '89f3d7b16c27a055a30d38bca7e7f0ab5542ba31', '2021-12-16 05:42:32'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=839;

--
-- AUTO_INCREMENT for table `tbl_master_patan`
--
ALTER TABLE `tbl_master_patan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `tbl_menu_user`
--
ALTER TABLE `tbl_menu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1506;

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

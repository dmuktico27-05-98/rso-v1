-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2022 at 03:39 AM
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
-- Table structure for table `tbl_master_part_ppl`
--

CREATE TABLE `tbl_master_part_ppl` (
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
  `routing` varchar(30) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_part_ppl`
--

INSERT INTO `tbl_master_part_ppl` (`id`, `job_no`, `part_no`, `part_name`, `area`, `proses`, `pcs_month`, `maks_shift`, `machine`, `model`, `patan`, `routing`, `create_by`, `create_date`) VALUES
(1, 'A4041', '67149-BZ590', 'A-4041, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 12697, 317, '4A', 'D26A', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(2, 'A4042', '67149-BZ610', 'A-4042, PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 4779, 102, '4A', 'D26A', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(3, 'A4039', '67147-BZ190', 'A-4039, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(4, 'A4040', '67148-BZ190', 'A-4040, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(5, 'A4031', '67133-BZ100', 'A-4031, EXT,FR DOOR OUTSIDE PNL REINF,RR', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(6, 'A4032', '67134-BZ110', 'A-4032, EXT,FR DOOR OUTS PNL REINF,RR LH', 'WH Door Assy', 'Inhouse', 17476, 414, '2A', 'D26A', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(7, 'T2015', '61433-BZ190', 'T-2015, REINFORCEMENT, ROCKER, OUTER RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(8, 'T2016', '61434-BZ180', 'T-2016, REINFORCEMENT, ROCKER, OUTER LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(9, 'A4020', '67118-BZ020', 'A-4020, PANEL, BACK DOOR, LWR OUTSIDE', 'WH Door Assy', 'Inhouse', 7283, 176, '5A', 'D26A', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(10, 'A4022', '67119-BZ040', 'A-4022, PANEL, BACK DOOR, UPR OUTSIDE', 'WH Door Assy', 'Inhouse', 17476, 414, '5A', 'D26A', 'ABCD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(11, 'T4023', '67147-BZ170', 'T-4023, PANEL, RR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(12, 'T4024', '67148-BZ170', 'T-4024, PANEL, RR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(13, 'T4021', '67135-BZ090', 'T-4021, EXT,RR DOOR OUTSIDE REINFORCE,RH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(14, 'T4022', '67136-BZ070', 'T-4022, EXT,RR DOOR OUTSIDE REINFORCE,LH', 'WH Docking', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(15, 'T4013', '67145-BZ160', 'T-4013, PANEL, FR DOOR HINGE SIDE, RH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(16, 'T4014', '67146-BZ150', 'T-4014, PANEL, FR DOOR HINGE SIDE, LH', 'WH Door Assy', 'Inhouse', 12010, 278, '3B', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(17, 'J4041', '53311-BZ230', 'J-4041, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 450, 22, '5A', 'D17D', 'TERIYOU', 'SP-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(18, 'J4042', '53321-BZ230', 'J-4042,PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 450, 22, '5A', 'D17D', 'TERIYOU', 'SP-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(19, 'J4017', '67111-BZ210', 'J-4017, PANEL, FR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(20, 'J4018', '67112-BZ220', 'J-4018, PANEL, FR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(21, 'J4021', '67113-BZ240', 'J-4021, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 450, 14, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(22, 'J4022', '67114-BZ240', 'J-4022, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 450, 12, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(23, 'J4031', '67141-BZ180', 'J-4031, PANEL, FR DOOR, INSIDE RH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(24, 'J4032', '67142-BZ180', 'J-4032, PANEL, FR DOOR, INSIDE LH', 'WH Door Assy', 'Inhouse', 450, 13, '5A', 'D17D', 'TERIYOU', 'PL1-PPL-WELD', 'DMUKTICO', '2022-03-08 07:57:46'),
(25, 'T4015', '67113-BZ410', 'T-4015, PANEL, RR DOOR, OUTSIDE RH', 'WH Door Assy', 'Inhouse', 12010, 278, '5A', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(26, 'T4016', '67114-BZ410', 'T-4016, PANEL, RR DOOR, OUTSIDE LH', 'WH Door Assy', 'Inhouse', 12010, 278, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(27, 'T4029', '67115-BZ820', 'T-4029, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 1998, 50, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(28, 'T4030', '67115-BZ840', 'T-4030, PANEL, BACK DOOR, OUTSIDE', 'WH Door Assy', 'Inhouse', 1149, 27, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(29, 'T4002', '53321-BZ280', 'T-4002, PANEL, HOOD, INNER', 'WH Door Assy', 'Inhouse', 12010, 283, '5A', 'D14N', 'AC', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(30, 'T4001', '53311-BZ290', 'T-4001, PANEL, HOOD', 'WH Door Assy', 'Inhouse', 12010, 283, '5A', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(31, 'T4031', '67149-BZ540', 'PANEL, BACK DOOR, INSIDE', 'WH Door Assy', 'Inhouse', 12010, 281, '7A', 'D14N', 'BD', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(32, 'GBJ0030', '58372-BZ100', 'GBJ-0030, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Inhouse', 300, 9, '3B', 'D17D', 'TEIRYO', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46'),
(33, 'GBJ0031', '58372-BZ110', 'GBJ-0031, PANEL, BODY LWR BACK, INNER', 'WH Docking', 'Inhouse', 150, 5, '3B', 'D17D', 'TEIRYO', 'PL1-PPL', 'DMUKTICO', '2022-03-08 07:57:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_master_part_ppl`
--
ALTER TABLE `tbl_master_part_ppl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_master_part_ppl`
--
ALTER TABLE `tbl_master_part_ppl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

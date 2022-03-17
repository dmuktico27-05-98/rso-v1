-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2022 at 03:10 PM
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
(123, 'stock-', 'stock', '-', 'fa-rocket', 'Input Stock', '-', '-', 1),
(125, 'stockinput_ppc', 'stock', 'input_ppc', '-', 'Input PPC', 'master/transaction', 'tbl_input_ppc', 2),
(139, 'stockinput_sa', 'stock', 'input_sa', '-', 'Input Door Assy', 'master/transaction', 'tbl_input_general', 6),
(141, 'masterpatan', 'master', 'patan', '-', 'Master Daily Patan', 'master/data', 'tbl_master_patan', 3),
(144, 'stockinput_dock', 'stock', 'input_dock', '-', 'Input Docking', 'master/transaction', 'tbl_input_general', 3),
(152, 'andonppc_s', 'andon', 'ppc_s', '-', 'Andon PPC Special', 'andon/ppc?proses=special', '-', 7),
(146, 'stockinput_ppl', 'stock', 'input_ppl', '-', 'Input PPL', 'master/transaction', 'tbl_input_ppl', 4),
(148, 'stockinput_ppl_temp', 'stock', 'input_ppl_temp', '-', 'Input PPL Temp', 'master/transaction', 'tbl_input_ppl_temp', 5),
(149, 'masterpart_ppl', 'master', 'part_ppl', '-', 'Master Part PPL', 'master/data', 'tbl_master_part_ppl', 2),
(150, 'andonppl_n', 'andon', 'ppl_n', '-', 'Andon PPL Normal', 'andon/ppl?proses=normal', '-', 6),
(151, 'andonppl_s', 'andon', 'ppl_s', '-', 'Andon PPL Special', 'andon/ppl?proses=special', '-', 7),
(153, 'andonppc_n', 'andon', 'ppc_n', '-', 'Andon PPC Normal', 'andon/ppc?proses=normal', '-', 8);

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
(1287, 'stock-', 'Administrator', 'yes', 'no', 'no', 'no'),
(1288, 'stock-', 'Admin_area', 'no', 'no', 'no', 'no'),
(1289, 'stock-', 'User', 'no', 'no', 'no', 'no'),
(1290, 'stock-', 'Management', 'no', 'no', 'no', 'no'),
(1299, 'stockinput_ppc', 'User', 'no', 'no', 'no', 'no'),
(1297, 'stockinput_ppc', 'Administrator', 'yes', 'yes', 'yes', 'yes'),
(1298, 'stockinput_ppc', 'Admin_area', 'no', 'yes', 'yes', 'yes'),
(1300, 'stockinput_ppc', 'Management', 'no', 'no', 'no', 'no'),
(1397, 'system-', 'PPC', 'no', 'no', 'no', 'no'),
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
(1501, 'stock-', 'WH Door Assy', 'yes', 'no', 'no', 'no'),
(1502, 'stockinput_ppc', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1503, 'stockinput_sa', 'WH Door Assy', 'yes', 'yes', 'yes', 'yes'),
(1504, 'masterpatan', 'WH Door Assy', 'yes', 'no', 'yes', 'no'),
(1505, 'stockinput_dock', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1587, 'andonppc_s', 'WH Docking', 'no', 'no', 'no', 'no'),
(1585, 'andonppc_s', 'User', 'no', 'no', 'no', 'no'),
(1584, 'andonppc_s', 'Admin_area', 'no', 'no', 'no', 'no'),
(1583, 'andonppc_s', 'Administrator', 'yes', 'no', 'no', 'no'),
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
(1529, 'stock-', 'PPL', 'yes', 'no', 'no', 'no'),
(1530, 'stockinput_ppc', 'PPL', 'no', 'no', 'no', 'no'),
(1531, 'stockinput_sa', 'PPL', 'no', 'no', 'no', 'no'),
(1532, 'masterpatan', 'PPL', 'no', 'no', 'yes', 'no'),
(1533, 'stockinput_dock', 'PPL', 'no', 'no', 'no', 'no'),
(1586, 'andonppc_s', 'Management', 'yes', 'no', 'no', 'no'),
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
(1567, 'andonppl_n', 'Administrator', 'yes', 'no', 'no', 'no'),
(1559, 'masterpart_ppl', 'Administrator', 'yes', 'no', 'yes', 'no'),
(1560, 'masterpart_ppl', 'Admin_area', 'yes', 'no', 'no', 'no'),
(1561, 'masterpart_ppl', 'User', 'no', 'no', 'no', 'no'),
(1562, 'masterpart_ppl', 'Management', 'no', 'no', 'no', 'no'),
(1563, 'masterpart_ppl', 'WH Docking', 'no', 'no', 'no', 'no'),
(1564, 'masterpart_ppl', 'PPC', 'no', 'no', 'no', 'no'),
(1565, 'masterpart_ppl', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1566, 'masterpart_ppl', 'PPL', 'yes', 'no', 'yes', 'no'),
(1568, 'andonppl_n', 'Admin_area', 'no', 'no', 'no', 'no'),
(1569, 'andonppl_n', 'User', 'no', 'no', 'no', 'no'),
(1570, 'andonppl_n', 'Management', 'yes', 'no', 'no', 'no'),
(1571, 'andonppl_n', 'WH Docking', 'no', 'no', 'no', 'no'),
(1572, 'andonppl_n', 'PPC', 'no', 'no', 'no', 'no'),
(1573, 'andonppl_n', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1574, 'andonppl_n', 'PPL', 'yes', 'no', 'no', 'no'),
(1575, 'andonppl_s', 'Administrator', 'yes', 'no', 'no', 'no'),
(1576, 'andonppl_s', 'Admin_area', 'no', 'no', 'no', 'no'),
(1577, 'andonppl_s', 'User', 'no', 'no', 'no', 'no'),
(1578, 'andonppl_s', 'Management', 'yes', 'no', 'no', 'no'),
(1579, 'andonppl_s', 'WH Docking', 'no', 'no', 'no', 'no'),
(1580, 'andonppl_s', 'PPC', 'no', 'no', 'no', 'no'),
(1581, 'andonppl_s', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1582, 'andonppl_s', 'PPL', 'yes', 'no', 'no', 'no'),
(1588, 'andonppc_s', 'PPC', 'yes', 'no', 'no', 'no'),
(1589, 'andonppc_s', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1590, 'andonppc_s', 'PPL', 'no', 'no', 'no', 'no'),
(1591, 'andonppc_n', 'Administrator', 'yes', 'no', 'no', 'no'),
(1592, 'andonppc_n', 'Admin_area', 'no', 'no', 'no', 'no'),
(1593, 'andonppc_n', 'User', 'no', 'no', 'no', 'no'),
(1594, 'andonppc_n', 'Management', 'yes', 'no', 'no', 'no'),
(1595, 'andonppc_n', 'WH Docking', 'no', 'no', 'no', 'no'),
(1596, 'andonppc_n', 'PPC', 'yes', 'no', 'no', 'no'),
(1597, 'andonppc_n', 'WH Door Assy', 'no', 'no', 'no', 'no'),
(1598, 'andonppc_n', 'PPL', 'no', 'no', 'no', 'no');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `tbl_menu_user`
--
ALTER TABLE `tbl_menu_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1599;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

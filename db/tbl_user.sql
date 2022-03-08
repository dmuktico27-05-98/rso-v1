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
(2, '56540', 'b2fb06abbe7ea77e4c53cbf7ea3fd15b294', 'DMUKTICO', 56540, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2022-03-08 07:50:53', '2022-03-08 08:50:21', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(12, '3007', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiyanto', 3007, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'foreman', 'B', '2021-11-01 11:00:22', '2022-03-03 06:14:45', '2022-02-17 06:13:17', '89f3d7b16c27a055a30d38bca7e7f0ab5542ba31'),
(9, '23817', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Sugiarto', 23817, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'foreman', 'A', '2021-11-01 10:41:02', '2022-02-04 09:45:07', '2022-01-12 05:59:35', '442a51d14f1917ba0ef8b1a4adeed35b2db170fb'),
(10, '9404', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Saifullah', 9404, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'foreman', 'B', '2021-11-01 10:41:45', '2022-02-07 18:54:19', '2022-02-07 18:55:10', '635f2d4dff80d7860dc816462c567d642138de10'),
(11, '3216', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Aris Senjaya', 3216, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'foreman', 'A', '2021-11-01 10:42:17', '2022-03-05 09:49:55', '2022-03-05 09:52:15', '05a6138f890eaede3f6df558adf702a8baaeabcc'),
(31, '2564', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Andreas Harsono', 2564, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:55:43', NULL, NULL, 'ca6127548f5d554e88006c7a6e69682a9c6727d9'),
(32, '22474', 'ac1cf0242b93fae6c2f13675d841ed10772', 'Didik Prastowo', 22474, NULL, 'Admin', 'Management', 'Admin', 'LPB', 'manager', 'N', '2021-11-02 08:56:06', '2022-03-02 18:22:31', '2022-03-02 18:22:16', '138d7f9cd1c003484174b577fe28cd7161b9cab7'),
(36, '65597', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Gita Yoan S. U.', 65597, NULL, 'Admin', 'Management', 'Admin', 'PPC', 'supervisor', 'N', '2021-11-02 09:03:15', NULL, NULL, 'a565b3324b2cf8065a7ccfa0d225565678e65fd9'),
(64, '54013', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'RIKI PANTRIO HATA', 54013, NULL, 'Admin', 'WH Door Assy', 'Admin', 'WH Door Assy', 'member', 'A', '2021-12-01 14:45:07', NULL, NULL, '9fd6595aae3a06aa3dcbcf5edb1d9e22cb5f2b86'),
(62, '3197', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'RAWAL FENDY', 3197, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'A', '2021-12-01 14:42:26', NULL, NULL, '03ab6dbc57875b0957b156b6996c685b5fe9dfd6'),
(61, '38233', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'FEBRI ANGGRIYAWAN', 38233, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'A', '2021-12-01 14:41:50', NULL, NULL, '416059a16b89edaeef0af39362173d009f7eb3bb'),
(60, '6948', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'SOFIAN ABDULRAHMAN', 6948, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'foreman', 'A', '2021-12-01 14:41:06', '2022-01-07 08:04:42', '2022-01-07 08:03:17', '648975a09f1ac5cbd2504db4bbc83a050f05f6ea'),
(59, '21928', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'NUR IMAN SYARIF HIDAYAT', 21928, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'B', '2021-12-01 14:40:26', NULL, NULL, 'bd1e303c7224a5895e00e7efce332608875c8346'),
(58, '15883', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'ALIM NUR FAUZAN', 15883, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'member', 'B', '2021-12-01 14:39:43', NULL, NULL, '3a66ae50b56db43729ed0f51d803ca81f2135682'),
(57, '9206', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Yuli Wibowo', 9206, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'foreman', 'B', '2021-12-01 14:38:57', '2022-03-08 08:15:39', '2022-03-05 18:08:53', '1857a5724101c52c1716817cbf60ff4bb611ce54'),
(63, '32553', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'FAUZAN AMIEN', 32553, NULL, 'Admin', 'WH Docking', 'Admin', 'WH Docking', 'member', 'A', '2021-12-01 14:44:21', NULL, NULL, '36f77a032ea899612be3212ae7788614f4cf50ab'),
(65, '1', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Farhan', 72328, 'admin.jpg', 'Admin', 'Administrator', 'Admin', 'IFP', 'member', 'N', '2020-01-11 16:06:36', '2021-12-09 20:13:11', '2021-12-01 16:27:53', 'b0b9515ace4c525d8af7a66a3f152c5146ff93a8'),
(66, '71892', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Roy Nurandre Nugroho', 71892, NULL, 'Admin', 'Admin_area', 'Admin', 'MDIC', 'foreman', 'N', '2021-12-13 22:28:25', NULL, NULL, '56d94edd918386bbf5de071f0a01a9483481efe3'),
(67, 'dpp', 'f772f52560d4b288e78b04e35f056c3f881', 'dpp', 123, NULL, 'Admin', 'Administrator', 'Admin', 'LPP', 'dic', 'N', '2021-12-16 13:33:04', '2022-01-03 08:09:41', '2021-12-16 13:41:27', '635f2d4dff80d7860dc816462c567d642138de10'),
(68, '72328', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Farhan Imaduddin', 72328, NULL, 'Admin', 'Administrator', 'Admin', 'IFP', 'foreman', 'N', '2022-01-03 08:24:13', '2022-02-18 11:36:28', '2022-01-18 08:43:47', '6f2b83053863f56926d202366b4fedba2e398b09'),
(69, '48778', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'Bayu Hidayat', 48778, NULL, 'Admin', 'Management', 'Admin', 'LPP', 'supervisor', 'N', '2022-01-05 08:46:38', '2022-03-02 20:15:28', '2022-01-05 08:50:56', '497bc892d83c0d02639cab080c5bfaad3c33f2f9'),
(70, '28680', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'ARIL SAN GAN', 28680, NULL, 'Admin', 'PPC', 'Admin', 'PPC', 'leader', 'N', '2022-01-12 15:57:57', '2022-01-13 08:41:41', '2022-01-13 09:12:33', 'ec011ac4f5c330a9b689b69e1f4f8c9fe60facf7'),
(71, '12345', 'd17c5d46dc5f4f6b23fd4284aaa9b264b10', 'User PPL', 12345, NULL, 'Admin', 'PPL', 'Admin', 'PPL', 'foreman', 'A', '2022-03-04 10:48:55', '2022-03-08 08:50:33', '2022-03-08 08:15:34', '5282976a8830e37ca70a8413b6857b931c776967');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`password`),
  ADD KEY `idcard` (`idcard`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

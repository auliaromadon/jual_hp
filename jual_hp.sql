-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2020 at 03:54 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jual_hp`
--

-- --------------------------------------------------------

--
-- Table structure for table `iphone`
--

CREATE TABLE `iphone` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iphone`
--

INSERT INTO `iphone` (`id`, `username`, `password`) VALUES
(1, 'neta', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `iphone_brg`
--

CREATE TABLE `iphone_brg` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `spesifikasi` varchar(255) NOT NULL,
  `warna` varchar(50) NOT NULL,
  `harga` int(1) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iphone_brg`
--

INSERT INTO `iphone_brg` (`id`, `type`, `spesifikasi`, `warna`, `harga`, `stok`) VALUES
(1, 'iphone s6', 'dapet case', 'gold', 3500000, 3),
(2, 'iphone s7', 'temper glass gratiss', 'black', 5000000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `samsung`
--

CREATE TABLE `samsung` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `samsung`
--

INSERT INTO `samsung` (`id`, `username`, `password`) VALUES
(1, 'aulia', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `samsung_brg`
--

CREATE TABLE `samsung_brg` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `spesifikasi` varchar(255) NOT NULL,
  `warna` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `samsung_brg`
--

INSERT INTO `samsung_brg` (`id`, `type`, `spesifikasi`, `warna`, `stok`, `harga`) VALUES
(1, 'samsung s6', 'bergaransi resmi', 'hitam', 5, 2000000),
(2, 'samsung s5', 'camera 7 mg', 'merah', 3, 3500000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `iphone`
--
ALTER TABLE `iphone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iphone_brg`
--
ALTER TABLE `iphone_brg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samsung`
--
ALTER TABLE `samsung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samsung_brg`
--
ALTER TABLE `samsung_brg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iphone`
--
ALTER TABLE `iphone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iphone_brg`
--
ALTER TABLE `iphone_brg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `samsung`
--
ALTER TABLE `samsung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `samsung_brg`
--
ALTER TABLE `samsung_brg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2019 at 03:32 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cacastie`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_user` int(5) NOT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `nomor_induk` varchar(15) NOT NULL,
  `nomor_hp` varchar(13) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_user`, `nama`, `status`, `nomor_induk`, `nomor_hp`, `email`, `password`) VALUES
(1, 'Davis', 'Mahasiswa', '16.01.53.0119', '089636843266', 'danendra98@gmail.com', 'ikanteri');

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `id_makanan` int(5) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `harga` int(8) NOT NULL,
  `stok` int(3) NOT NULL,
  `id_penjual` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`id_makanan`, `nama`, `harga`, `stok`, `id_penjual`) VALUES
(200, 'Chicken Gordon Blue', 15000, 4, 100);

-- --------------------------------------------------------

--
-- Table structure for table `minuman`
--

CREATE TABLE `minuman` (
  `id_minuman` int(5) NOT NULL,
  `nama` varchar(15) DEFAULT NULL,
  `harga` int(8) NOT NULL,
  `stok` int(3) NOT NULL,
  `id_penjual` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minuman`
--

INSERT INTO `minuman` (`id_minuman`, `nama`, `harga`, `stok`, `id_penjual`) VALUES
(300, 'Ice Milo Tea', 3500, 2, 100);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `id_penjual` int(5) NOT NULL,
  `id_makanan` int(5) NOT NULL,
  `id_minuman` int(5) NOT NULL,
  `id_snack` int(5) NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `waktu_pesan` datetime NOT NULL,
  `total_harga` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjual`
--

CREATE TABLE `penjual` (
  `id_penjual` int(5) NOT NULL,
  `nama_warung` varchar(20) DEFAULT NULL,
  `nama_pemilik` varchar(25) DEFAULT NULL,
  `nomor_induk` int(15) NOT NULL,
  `nomor_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjual`
--

INSERT INTO `penjual` (`id_penjual`, `nama_warung`, `nama_pemilik`, `nomor_induk`, `nomor_hp`) VALUES
(100, 'PON CHICKEN', 'Susi', 2147483647, '089886741223');

-- --------------------------------------------------------

--
-- Table structure for table `snack`
--

CREATE TABLE `snack` (
  `id_snack` int(5) NOT NULL,
  `nama` varchar(15) NOT NULL,
  `harga` int(8) NOT NULL,
  `stok` int(3) NOT NULL,
  `id_penjual` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snack`
--

INSERT INTO `snack` (`id_snack`, `nama`, `harga`, `stok`, `id_penjual`) VALUES
(300, 'Kripik Kentang ', 1000, 9, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id_makanan`),
  ADD KEY `makanan_fk0` (`id_penjual`);

--
-- Indexes for table `minuman`
--
ALTER TABLE `minuman`
  ADD PRIMARY KEY (`id_minuman`),
  ADD KEY `minuman_fk0` (`id_penjual`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `order_fk0` (`id_user`),
  ADD KEY `order_fk1` (`id_penjual`),
  ADD KEY `order_fk2` (`id_makanan`),
  ADD KEY `order_fk3` (`id_minuman`),
  ADD KEY `order_fk4` (`id_snack`);

--
-- Indexes for table `penjual`
--
ALTER TABLE `penjual`
  ADD PRIMARY KEY (`id_penjual`);

--
-- Indexes for table `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`id_snack`),
  ADD KEY `snack_fk0` (`id_penjual`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `makanan`
--
ALTER TABLE `makanan`
  ADD CONSTRAINT `makanan_fk0` FOREIGN KEY (`id_penjual`) REFERENCES `penjual` (`id_penjual`);

--
-- Constraints for table `minuman`
--
ALTER TABLE `minuman`
  ADD CONSTRAINT `minuman_fk0` FOREIGN KEY (`id_penjual`) REFERENCES `penjual` (`id_penjual`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_fk0` FOREIGN KEY (`id_user`) REFERENCES `customer` (`id_user`),
  ADD CONSTRAINT `order_fk1` FOREIGN KEY (`id_penjual`) REFERENCES `penjual` (`id_penjual`),
  ADD CONSTRAINT `order_fk2` FOREIGN KEY (`id_makanan`) REFERENCES `makanan` (`id_makanan`),
  ADD CONSTRAINT `order_fk3` FOREIGN KEY (`id_minuman`) REFERENCES `minuman` (`id_minuman`),
  ADD CONSTRAINT `order_fk4` FOREIGN KEY (`id_snack`) REFERENCES `snack` (`id_snack`);

--
-- Constraints for table `snack`
--
ALTER TABLE `snack`
  ADD CONSTRAINT `snack_fk0` FOREIGN KEY (`id_penjual`) REFERENCES `penjual` (`id_penjual`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

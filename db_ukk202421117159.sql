-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2024 at 04:59 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ukk202421117159`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_BARANG` int(11) NOT NULL,
  `NAMA_BARANG` varchar(250) NOT NULL,
  `KATEGORI` varchar(100) NOT NULL,
  `SATUAN` varchar(100) NOT NULL,
  `HARGA_BELI` double NOT NULL,
  `HARGA_JUAL` double NOT NULL,
  `STOK` double NOT NULL,
  `KETERANGAN` varchar(250) NOT NULL,
  `BARCODE` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_BARANG`, `NAMA_BARANG`, `KATEGORI`, `SATUAN`, `HARGA_BELI`, `HARGA_JUAL`, `STOK`, `KETERANGAN`, `BARCODE`) VALUES
(3, 'PRINTER', 'BOX', 'PCS', 3000000, 3500000, 0, '', ''),
(4, 'ES CREAM', 'BUNGKUS', 'PCS', 3000, 5000, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_PELANGGAN` int(11) NOT NULL,
  `NAMA_PELANGGAN` varchar(50) NOT NULL,
  `ALAMAT` varchar(250) NOT NULL,
  `NOMOR_TELEPON` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`ID_PELANGGAN`, `NAMA_PELANGGAN`, `ALAMAT`, `NOMOR_TELEPON`) VALUES
(3, 'acil', 'mataram', '082947283'),
(4, 'ical', 'mataram', '08336718361');

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `ID_PEMASOK` int(11) NOT NULL,
  `NAMA_PEMASOK` varchar(50) NOT NULL,
  `ALAMAT` varchar(250) NOT NULL,
  `NOMOR_TELEPON` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`ID_PEMASOK`, `NAMA_PEMASOK`, `ALAMAT`, `NOMOR_TELEPON`) VALUES
(3, 'PT MAJU MUNDUR', 'JAKARTA', '082842623'),
(4, 'PT MAJU TERUS', 'SURABAYA', '93833728');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `ID_PEMBELIAN` int(11) NOT NULL,
  `TANGGAL` datetime NOT NULL,
  `ID_PEMASOK` int(11) NOT NULL,
  `TOTAL_PEMBELIAN` double NOT NULL,
  `POTONGAN` double NOT NULL,
  `METODE_PEMBAYARAN` varchar(50) NOT NULL,
  `KETERANGAN` varchar(250) NOT NULL,
  `ID_PENGGUNA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`ID_PEMBELIAN`, `TANGGAL`, `ID_PEMASOK`, `TOTAL_PEMBELIAN`, `POTONGAN`, `METODE_PEMBAYARAN`, `KETERANGAN`, `ID_PENGGUNA`) VALUES
(1, '2024-04-23 00:00:00', 3, 3000000, 0, 'CASH', '', 1),
(2, '2024-04-23 00:00:00', 4, 3000, 1000, 'CASH', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detil`
--

CREATE TABLE `pembelian_detil` (
  `ID_PEMBELIAN` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `HARGA_SATUAN` double NOT NULL,
  `JUMLAH` double NOT NULL,
  `TOTAL_HARGA` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_detil`
--

INSERT INTO `pembelian_detil` (`ID_PEMBELIAN`, `ID_BARANG`, `HARGA_SATUAN`, `JUMLAH`, `TOTAL_HARGA`) VALUES
(1, 3, 3000000, 1, 3000000),
(2, 4, 3000, 1, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_PENGGUNA` int(11) NOT NULL,
  `NAMA_PENGGUNA` varchar(50) NOT NULL,
  `ALAMAT` varchar(250) NOT NULL,
  `NOMOR_TELEPON` varchar(50) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `HAK_AKSES` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`ID_PENGGUNA`, `NAMA_PENGGUNA`, `ALAMAT`, `NOMOR_TELEPON`, `USERNAME`, `PASSWORD`, `HAK_AKSES`) VALUES
(1, 'DIQY', 'PAGUTAN', '081915830053', 'diqy', '2006', 'ADMIN'),
(2, 'UCUP', 'SEMBALUN', '08727316367', 'ucup', '2007', 'OPERATOR'),
(3, 'SAMSUL', 'KLU', '08372838163', 'samsul', '2005', 'KASIR');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `TANGGAL` datetime NOT NULL,
  `ID_PELANGGAN` int(11) NOT NULL,
  `TOTAL_PENJUALAN` double NOT NULL,
  `POTONGAN` double NOT NULL,
  `METODE_PEMBAYARAN` varchar(50) NOT NULL,
  `KETERANGAN` varchar(250) NOT NULL,
  `ID_PENGGUNA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`ID_PENJUALAN`, `TANGGAL`, `ID_PELANGGAN`, `TOTAL_PENJUALAN`, `POTONGAN`, `METODE_PEMBAYARAN`, `KETERANGAN`, `ID_PENGGUNA`) VALUES
(1, '2024-04-23 00:00:00', 3, 3000000, 0, 'CASH', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detil`
--

CREATE TABLE `penjualan_detil` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `HARGA_SATUAN` double NOT NULL,
  `JUMLAH` double NOT NULL,
  `TOTAL_HARGA` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan_detil`
--

INSERT INTO `penjualan_detil` (`ID_PENJUALAN`, `ID_BARANG`, `HARGA_SATUAN`, `JUMLAH`, `TOTAL_HARGA`) VALUES
(1, 3, 3000000, 1, 3000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_BARANG`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_PELANGGAN`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`ID_PEMASOK`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`ID_PEMBELIAN`),
  ADD KEY `ID_PEMASOK` (`ID_PEMASOK`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indexes for table `pembelian_detil`
--
ALTER TABLE `pembelian_detil`
  ADD KEY `ID_PEMBELIAN` (`ID_PEMBELIAN`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_PENGGUNA`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_PENJUALAN`),
  ADD KEY `ID_PELANGGAN` (`ID_PELANGGAN`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indexes for table `penjualan_detil`
--
ALTER TABLE `penjualan_detil`
  ADD KEY `ID_PENJUALAN` (`ID_PENJUALAN`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `ID_PELANGGAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `ID_PEMASOK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `ID_PEMBELIAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `ID_PENGGUNA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID_PENJUALAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`ID_PEMASOK`) REFERENCES `pemasok` (`ID_PEMASOK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian_detil`
--
ALTER TABLE `pembelian_detil`
  ADD CONSTRAINT `pembelian_detil_ibfk_1` FOREIGN KEY (`ID_PEMBELIAN`) REFERENCES `pembelian` (`ID_PEMBELIAN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_detil_ibfk_2` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`ID_PELANGGAN`) REFERENCES `pelanggan` (`ID_PELANGGAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_detil`
--
ALTER TABLE `penjualan_detil`
  ADD CONSTRAINT `penjualan_detil_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_detil_ibfk_2` FOREIGN KEY (`ID_PENJUALAN`) REFERENCES `penjualan` (`ID_PENJUALAN`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

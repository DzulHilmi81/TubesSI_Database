-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2024 at 02:37 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_pabrikdanperangkatpc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `No_Hp` varchar(20) DEFAULT NULL,
  `ID_Pegawai` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_Barang` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Jenis` varchar(255) DEFAULT NULL,
  `Berat_Barang` decimal(10,2) DEFAULT NULL,
  `ID_Gudang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

CREATE TABLE `costumer` (
  `ID_Costumer` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `NO_HP` varchar(15) DEFAULT NULL,
  `ID_User` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `ID_Gudang` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `No_Ruangan` varchar(20) DEFAULT NULL,
  `Daya_Tampung` int DEFAULT NULL,
  `ID_Barang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_Jadwal` int NOT NULL,
  `ID_Sopir` int DEFAULT NULL,
  `Nama_Sopir` varchar(255) DEFAULT NULL,
  `Hari` varchar(255) DEFAULT NULL,
  `ID_Barang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `ID_Outlet` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `No_Hp` varchar(20) DEFAULT NULL,
  `ID_Barang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `ID_Pegawai` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Bagian` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `No_Hp` varchar(20) DEFAULT NULL,
  `ID_Pengiriman` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_User` int NOT NULL,
  `ID_Admin` int DEFAULT NULL,
  `ID_Pegawai` int DEFAULT NULL,
  `ID_Costumer` int DEFAULT NULL,
  `ID_Outlet` int DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `ID_Pengiriman` int NOT NULL,
  `Nama_Kendaraan` varchar(255) DEFAULT NULL,
  `Berat_Muatan` decimal(10,2) DEFAULT NULL,
  `ID_Sopir` int DEFAULT NULL,
  `ID_Rute` int DEFAULT NULL,
  `ID_Barang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `ID_Rute` int NOT NULL,
  `Jarak_Rute` decimal(10,2) DEFAULT NULL,
  `Alur_Rute` text,
  `ID_Pengiriman` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sopir`
--

CREATE TABLE `sopir` (
  `ID_Sopir` int NOT NULL,
  `ID_Pegawai` int DEFAULT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `NO_HP` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_Barang`);

--
-- Indexes for table `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`ID_Costumer`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`ID_Gudang`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_Jadwal`),
  ADD KEY `ID_Sopir` (`ID_Sopir`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`ID_Outlet`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID_Pegawai`),
  ADD KEY `ID_Pengiriman` (`ID_Pengiriman`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `ID_Admin` (`ID_Admin`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`),
  ADD KEY `ID_Costumer` (`ID_Costumer`),
  ADD KEY `ID_Outlet` (`ID_Outlet`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`ID_Pengiriman`),
  ADD KEY `ID_Sopir` (`ID_Sopir`),
  ADD KEY `ID_Rute` (`ID_Rute`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`ID_Rute`);

--
-- Indexes for table `sopir`
--
ALTER TABLE `sopir`
  ADD PRIMARY KEY (`ID_Sopir`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `pegawai` (`ID_Pegawai`);

--
-- Constraints for table `gudang`
--
ALTER TABLE `gudang`
  ADD CONSTRAINT `gudang_ibfk_1` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`ID_Sopir`) REFERENCES `sopir` (`ID_Sopir`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`);

--
-- Constraints for table `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `outlet_ibfk_1` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`ID_Pengiriman`) REFERENCES `pengiriman` (`ID_Pengiriman`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`ID_Admin`) REFERENCES `admin` (`ID_Admin`),
  ADD CONSTRAINT `pengguna_ibfk_2` FOREIGN KEY (`ID_Pegawai`) REFERENCES `pegawai` (`ID_Pegawai`),
  ADD CONSTRAINT `pengguna_ibfk_3` FOREIGN KEY (`ID_Costumer`) REFERENCES `costumer` (`ID_Costumer`),
  ADD CONSTRAINT `pengguna_ibfk_4` FOREIGN KEY (`ID_Outlet`) REFERENCES `outlet` (`ID_Outlet`);

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`ID_Sopir`) REFERENCES `sopir` (`ID_Sopir`),
  ADD CONSTRAINT `pengiriman_ibfk_2` FOREIGN KEY (`ID_Rute`) REFERENCES `rute` (`ID_Rute`),
  ADD CONSTRAINT `pengiriman_ibfk_3` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID_Barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

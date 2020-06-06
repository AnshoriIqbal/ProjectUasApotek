-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2020 at 03:18 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_detailpenjualan` int(12) NOT NULL,
  `id_obat` int(12) NOT NULL,
  `id_penjualan` int(12) NOT NULL,
  `harga` int(12) NOT NULL,
  `diskon` decimal(12,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id_detailpenjualan`, `id_obat`, `id_penjualan`, `harga`, `diskon`, `created_at`, `updated_at`) VALUES
(11, 11, 11, 6000, '20', NULL, NULL),
(12, 12, 12, 3000, '30', NULL, NULL),
(13, 13, 13, 12000, '50', NULL, NULL),
(14, 14, 14, 2000, '0', NULL, NULL),
(15, 15, 15, 11000, '10', NULL, NULL),
(17, 16, 16, 2000, '10', '2020-06-05 05:03:33', '2020-06-05 05:03:33');

-- --------------------------------------------------------

--
-- Table structure for table `detail_supply`
--

CREATE TABLE `detail_supply` (
  `id_detailsupply` int(12) NOT NULL,
  `id_supply` int(12) NOT NULL,
  `id_obat` int(12) NOT NULL,
  `id_detailpenjualan` int(12) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_supply`
--

INSERT INTO `detail_supply` (`id_detailsupply`, `id_supply`, `id_obat`, `id_detailpenjualan`, `created_at`, `updated_at`) VALUES
(11, 11, 11, 11, NULL, NULL),
(12, 12, 12, 12, NULL, NULL),
(13, 13, 13, 13, NULL, NULL),
(14, 14, 14, 14, NULL, NULL),
(15, 15, 15, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(12) NOT NULL,
  `namaKaryawan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `jenisKelamin` enum('laki-laki','perempuan') NOT NULL,
  `noTelp` bigint(13) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `namaKaryawan`, `alamat`, `jenisKelamin`, `noTelp`, `created_at`, `updated_at`) VALUES
(11, 'Nisa', 'JL. Kartika', 'perempuan', 8566667738, NULL, NULL),
(12, 'Bambang', 'Jl.Imam Bonjol', 'laki-laki', 8763728398, NULL, NULL),
(13, 'Susilo', 'Jl.Kartini', 'laki-laki', 8423972698, NULL, NULL),
(14, 'Iqbal', 'Jl. Kartini', 'laki-laki', 89765356789, NULL, NULL),
(15, 'Andin', 'JL. Sudirman', 'perempuan', 9889865547, NULL, NULL),
(16, 'Andre Septiastika', 'Pujungan', 'laki-laki', 87862238556, '2020-06-05 03:45:26', '2020-06-05 03:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(12) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `jenis_obat` varchar(12) NOT NULL,
  `harga` int(9) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `jenis_obat`, `harga`, `stock`, `created_at`, `updated_at`) VALUES
(11, 'paaramex', 'pil', 6000, 300, NULL, NULL),
(12, 'Balsem', 'salep', 3000, 20, NULL, NULL),
(13, 'panadol', 'sirup', 12000, 5, '2020-04-11 14:28:59', '2020-04-11 14:28:59'),
(14, 'antangin', 'sirup', 2000, 4, '2020-04-11 16:08:22', '2020-04-11 16:08:22'),
(15, 'Oskadon', 'pill', 8000, 4, NULL, '2020-05-27 18:35:29'),
(16, 'Bodrex', 'Pil', 2000, 20, '2020-06-05 05:01:44', '2020-06-05 05:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(12) NOT NULL,
  `namapelanggan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `jenisKelamin` enum('laki-laki','perempuan','','') NOT NULL,
  `noTelp` bigint(12) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `namapelanggan`, `alamat`, `jenisKelamin`, `noTelp`, `created_at`, `updated_at`) VALUES
(11, 'Jaka', 'Jl. Manokwari', 'laki-laki', 89776554356, NULL, NULL),
(12, 'Sueb', 'Jl. Bisma', 'laki-laki', 89965554432, NULL, NULL),
(13, 'Johan', 'Jl. jalan jalan', 'laki-laki', 8765475847, NULL, NULL),
(14, 'Siti', 'Jl. Patimura', 'perempuan', 835678754467, NULL, NULL),
(15, 'Maryam ', 'Jl. Merak', 'perempuan', 81234568876, NULL, NULL),
(16, 'Andre Septiastika', 'Br. Mekarsari, Pujungan', 'laki-laki', 87862238556, '2020-06-05 03:48:05', '2020-06-05 03:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `tanggalPengembalian` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_karyawan`, `tanggalPengembalian`, `created_at`, `updated_at`) VALUES
(11, 11, '2020-06-01', NULL, NULL),
(12, 12, '2020-06-05', NULL, NULL),
(13, 13, '2020-06-22', NULL, NULL),
(14, 14, '2020-06-30', NULL, NULL),
(15, 15, '2020-06-14', NULL, '2020-06-05 04:03:28'),
(16, 16, '2020-06-14', '2020-06-05 04:05:41', '2020-06-05 04:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(12) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `tanggalPenjualan` date NOT NULL,
  `id_karyawan` int(12) NOT NULL,
  `id_pelanggan` int(12) NOT NULL,
  `hargatotal` int(9) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `quantity`, `tanggalPenjualan`, `id_karyawan`, `id_pelanggan`, `hargatotal`, `created_at`, `updated_at`) VALUES
(11, '3 Kotak', '2020-05-17', 11, 11, 18000, NULL, NULL),
(12, '5 Kotak', '2020-04-07', 12, 12, 15000, NULL, NULL),
(13, '6 Botol', '2020-05-01', 11, 13, 72000, NULL, NULL),
(14, '10 Sachet', '2020-04-30', 12, 14, 8000, NULL, '2020-06-05 04:10:28'),
(15, '2 Botol', '2020-05-06', 12, 15, 22000, NULL, NULL),
(16, '10 Sachet', '2020-05-17', 16, 16, 99000, '2020-06-05 04:12:06', '2020-06-05 04:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(12) NOT NULL,
  `id_pengembalian` int(12) DEFAULT NULL,
  `namaSupplier` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `noTelp` bigint(12) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `id_pengembalian`, `namaSupplier`, `alamat`, `noTelp`, `created_at`, `updated_at`) VALUES
(11, 11, 'PT Interbat', 'Jl Imam Bonjol Kompl Ligamas Bl A-2/21 Tangerang', 55768884, NULL, NULL),
(12, 12, 'PT Daya Sembada', 'Jl Simpang Lima 1 Mal Ciputra 66 Lt UG Semarang', 8449568, NULL, NULL),
(13, 13, 'CV Eka Jaya Sakti', 'Jl Berdikari Raya 1 Semarang', 7471786, NULL, NULL),
(14, 14, 'CV Karsa Mandiri', 'Jl Lampersari 12 Semarang', 8415540, NULL, NULL),
(15, 15, 'PT Dexa Medica', 'Jl Kelapa Gading Slt Kompl Gading Serpong Sktr 1-B Bl BJ-8/2 Tangerang', 54200134, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

CREATE TABLE `supply` (
  `id_supply` int(12) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `hargatotal` int(12) NOT NULL,
  `tanggalOrder` date NOT NULL,
  `tanggalPenerimaan` date NOT NULL,
  `tanggalBayar` date NOT NULL,
  `id_karyawan` int(12) NOT NULL,
  `id_supplier` int(12) NOT NULL,
  `id_obat` int(12) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supply`
--

INSERT INTO `supply` (`id_supply`, `quantity`, `hargatotal`, `tanggalOrder`, `tanggalPenerimaan`, `tanggalBayar`, `id_karyawan`, `id_supplier`, `id_obat`, `created_at`, `updated_at`) VALUES
(11, '2 Kardus Besar ukuran 10x10 cm', 500000, '2020-04-13', '2020-05-01', '2020-05-01', 11, 11, 11, NULL, '2020-05-22 02:52:20'),
(12, '1 Kerdus besar 10x10 cm', 100000, '2019-04-08', '2020-05-10', '2020-05-10', 12, 12, 12, NULL, NULL),
(13, '7 kardus kecil', 1000000, '2019-07-09', '2020-03-05', '2020-03-05', 13, 13, 13, NULL, NULL),
(14, '4 Kardus', 200000, '2020-03-03', '2020-04-30', '2020-04-30', 14, 14, 14, NULL, NULL),
(15, '8 Kardus', 400000, '2020-02-26', '2020-03-04', '2020-03-04', 15, 15, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `roles`) VALUES
(1, 'anshori iqbal', 'anshori@undiksha.ac.id', NULL, '$2y$10$m9rhOPRqYnDRr7VOxAFte.9gBFfaajao5meoScjn7aDToDNhlu/MC', NULL, '2020-04-20 17:27:23', '2020-04-20 17:27:23', '[\"admin\"]'),
(2, 'anshori iqbal 2', 'anshori2@undiksha.ac.id', NULL, '$2y$10$fm39tAjNwzEKsIsVdcIYoOwTH3FfJ880v36sd16AGU7Y4ahQ5Zaj2', NULL, '2020-04-20 17:53:30', '2020-04-20 17:53:30', '[\"klien\"]'),
(3, 'anshori iqbal 3', 'anshori3@undiksha.ac.id', NULL, '$2y$10$tt7zmibcFz0VI2jqdB18M.oE22VaoZqNp/bCXz85vDKdJYeg8FGNW', NULL, '2020-04-20 17:54:26', '2020-04-20 17:54:26', '[\"admin\",\"klien\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id_detailpenjualan`),
  ADD KEY `FOREIGN KEY` (`id_obat`) USING BTREE,
  ADD KEY `Id_Penjualan` (`id_penjualan`);

--
-- Indexes for table `detail_supply`
--
ALTER TABLE `detail_supply`
  ADD PRIMARY KEY (`id_detailsupply`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `Id_detailpenjualan` (`id_detailpenjualan`),
  ADD KEY `id_supply` (`id_supply`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD KEY `id_pengembalian` (`id_pengembalian`);

--
-- Indexes for table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`id_supply`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id_detailpenjualan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `detail_supply`
--
ALTER TABLE `detail_supply`
  MODIFY `id_detailsupply` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);

--
-- Constraints for table `detail_supply`
--
ALTER TABLE `detail_supply`
  ADD CONSTRAINT `detail_supply_ibfk_1` FOREIGN KEY (`id_detailpenjualan`) REFERENCES `detail_penjualan` (`id_detailpenjualan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_supply_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_supply_ibfk_3` FOREIGN KEY (`id_supply`) REFERENCES `supply` (`id_supply`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_pengembalian`) REFERENCES `pengembalian` (`id_pengembalian`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

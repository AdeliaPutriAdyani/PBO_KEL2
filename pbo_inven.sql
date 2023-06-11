-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2023 pada 12.19
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbo_inven`
--
CREATE DATABASE IF NOT EXISTS `pbo_inven` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pbo_inven`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `manajemen`
--

CREATE TABLE `manajemen` (
  `ID_BARANG` int(11) NOT NULL,
  `KODE_BARANG` varchar(255) DEFAULT NULL,
  `NAMA_BARANG` varchar(255) DEFAULT NULL,
  `HARGA_BARANG` varchar(255) DEFAULT NULL,
  `STOK_BARANG` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `manajemen`
--

INSERT INTO `manajemen` (`ID_BARANG`, `KODE_BARANG`, `NAMA_BARANG`, `HARGA_BARANG`, `STOK_BARANG`) VALUES
(1, 'B1', 'Buku Pemrograman', '150000', '2'),
(2, 'A1', 'Handphone', '90000', '100');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(15) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jk_pelanggan` varchar(20) NOT NULL,
  `noTelp_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jk_pelanggan`, `noTelp_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'Adelia Putri Adyani', 'Perempuan', '085415823697', 'Surabaya'),
(2, 'Sabrina Putri', 'Perempuan', '08999813032', 'Magetan'),
(3, 'Imeldha Elzandy', 'Laki-laki', '081859631472', 'Surabaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_BARANG` int(11) NOT NULL,
  `NAMA_BARANG` varchar(255) DEFAULT NULL,
  `HARGA_BARANG` decimal(10,0) DEFAULT NULL,
  `KETERANGAN_PRODUK` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `TANGGAL_TRANSAKSI` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`ID_TRANSAKSI`, `id_pelanggan`, `id_user`, `TANGGAL_TRANSAKSI`) VALUES
(1, 1, NULL, '2023-06-04 14:50:42'),
(2, 2, NULL, '2023-06-06 03:00:07'),
(3, 1, NULL, '2023-06-06 03:01:10'),
(13, NULL, NULL, '2023-06-11 14:15:51'),
(14, 1, NULL, '2023-06-11 14:16:49'),
(15, 1, NULL, '2023-06-11 14:16:49'),
(16, 1, NULL, '2023-06-11 14:19:08'),
(17, 1, NULL, '2023-06-11 14:19:08'),
(18, 1, NULL, '2023-06-11 14:20:24'),
(19, 2, NULL, '2023-06-11 15:05:17'),
(20, 2, NULL, '2023-06-11 15:08:09'),
(21, 2, NULL, '2023-06-11 15:09:21'),
(22, 3, NULL, '2023-06-11 15:11:39'),
(23, 3, 1, '2023-06-11 16:29:03'),
(24, 2, 1, '2023-06-11 16:37:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_item`
--

CREATE TABLE `transaksi_item` (
  `ID` int(11) NOT NULL,
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `JUMLAH` decimal(10,0) NOT NULL,
  `HARGA` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_item`
--

INSERT INTO `transaksi_item` (`ID`, `ID_TRANSAKSI`, `ID_BARANG`, `JUMLAH`, `HARGA`) VALUES
(1, 1, 1, '1', '55000'),
(2, 2, 1, '2', '250000'),
(3, 3, 1, '5', '500000'),
(4, 13, 1, '12', '1800000'),
(5, 15, 1, '4', '600000'),
(6, 17, 1, '1', '150000'),
(7, 17, 2, '2', '180000'),
(8, 18, 2, '3', '270000'),
(9, 18, 1, '3', '450000'),
(10, 19, 1, '5', '750000'),
(11, 19, 2, '20', '1800000'),
(12, 20, 1, '5', '750000'),
(13, 20, 2, '20', '1800000'),
(14, 21, 1, '5', '750000'),
(15, 22, 1, '5', '750000'),
(16, 23, 1, '2', '300000'),
(17, 24, 1, '1', '150000'),
(18, 24, 2, '20', '1800000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `NAMA_USER` varchar(255) DEFAULT NULL,
  `USERNAME_USER` varchar(255) DEFAULT NULL,
  `PASSWORD_USER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`ID_USER`, `NAMA_USER`, `USERNAME_USER`, `PASSWORD_USER`) VALUES
(1, 'bagas', 'bagas', 'bagas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `manajemen`
--
ALTER TABLE `manajemen`
  ADD PRIMARY KEY (`ID_BARANG`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_BARANG`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `FK_RELATIONSHIP_5` (`id_user`),
  ADD KEY `FK_RELATIONSHIP_8` (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi_item`
--
ALTER TABLE `transaksi_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RELATIONSHIP_6` (`ID_TRANSAKSI`),
  ADD KEY `FK_RELATIONSHIP_7` (`ID_BARANG`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `manajemen`
--
ALTER TABLE `manajemen`
  MODIFY `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `transaksi_item`
--
ALTER TABLE `transaksi_item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`id_user`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Ketidakleluasaan untuk tabel `transaksi_item`
--
ALTER TABLE `transaksi_item`
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`ID_TRANSAKSI`) REFERENCES `transaksi` (`ID_TRANSAKSI`),
  ADD CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`ID_BARANG`) REFERENCES `manajemen` (`ID_BARANG`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

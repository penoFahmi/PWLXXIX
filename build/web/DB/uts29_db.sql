-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Bulan Mei 2024 pada 12.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts29_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `Product` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `Product`, `Category`, `Size`, `Color`, `Brand`, `Price`) VALUES
(1, 'Trendy Geometric Dangle Earring', 'Jewellery', 'Medium', 'Green', 'Apple', 14.00),
(2, 'Round Shape Necklace - ESF', 'Jewellery', 'Small', 'Gray', 'Dada, Nike', 12.00),
(3, 'Rectangle Shape Necklace', 'Jewellery', 'Medium', 'Red', 'Dada', 49.00),
(4, 'Golden Hoop Earrings - NHK35', 'Jewellery', 'Medium', 'Red', 'Guru', 9.00),
(5, 'Elegant Gold Multicolor Pearl Necklace (Chain)', 'Jewellery', 'Medium', 'Blue, Gray', 'McDonals, Nokia, Samsung', 29.00),
(6, 'Drop Black Earring - NHK33', 'Jewellery', 'Small', 'Green', 'Dominos', 16.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

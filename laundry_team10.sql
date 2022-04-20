-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 06:14 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_team10`
--

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tlp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat`, `tlp`) VALUES
(2006, 'Outlet Jaya Baleendah', 'Jalan Adipati Agung No. 176 Kec. Baleendah Kab. Bandung ', '082215665326'),
(2019, 'Outlet Bintang Bekasi', 'Jalan Utama Bekasi No. 37', '081267391021'),
(3495, 'Outlet Bandung', 'Jalan Siliwangi Nomor 12', '082882991876'),
(3505, 'Outlet Indramayu', 'Jalan Indra No. 28 Kabupaten Indramayu', '081982718423'),
(3506, 'Outlet Pangandaran', 'Jalan Pantai Timur No. 9 Pangandaran', '087667439221'),
(3510, 'Outlet Padalarang', 'Jalan Teguh Asih No. 78 Kabupaten Padalarang', '085654321887');

-- --------------------------------------------------------

--
-- Table structure for table `paket_cucian`
--

CREATE TABLE `paket_cucian` (
  `id_paket` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bed_cover','kaos','lain') NOT NULL,
  `harga_paket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paket_cucian`
--

INSERT INTO `paket_cucian` (`id_paket`, `id_outlet`, `nama_paket`, `jenis_paket`, `harga_paket`) VALUES
(1001, 3495, 'Selimut Gambar Kartun', 'selimut', 10000),
(1015, 3495, 'Karpet Singa 3 meter', 'lain', 10000),
(1016, 2006, 'Bantal Guling 1 set', 'kiloan', 12000),
(1017, 2019, 'Boneka Hello Kitty Ukuran Mini', 'lain', 8000),
(1018, 3505, 'Kaos Supreme 2550', 'kaos', 30500),
(1020, 3495, 'Baju Tidur Perempuan', 'kiloan', 15000),
(1024, 3505, 'Sarung Bantal dan Guling', 'bed_cover', 10000),
(1026, 2006, 'Paket Hemat Cepat', 'kiloan', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `jenis_kelamin`, `tlp`) VALUES
(6001, 'Salman', 'Komp. BSI 3 Blok C-3 Kec. Baleendah Kab. Bandung', 'laki-laki', '085793299635'),
(6009, 'Dewi Fitri', 'Jalan Siliwangi No. 56 Kecamatan Baleendah', 'perempuan', '082133956755'),
(6010, 'Septianti', 'Jalan Laswi No. 71 Kecamatan Baleendah', 'perempuan', '085975213371'),
(6011, 'Scoutsal', 'Jalan Asia Afrika No. 3 Kota Bandung', 'laki-laki', '082312477225'),
(6012, 'Ujang', 'Kampung Singa Kec. Garut Kab. Bandung', 'laki-laki', '081233211567'),
(6013, 'Andrei Lao', 'Jalan Lao Street No. 181', 'laki-laki', '082231554786'),
(6015, 'Ayu', 'Ciparay', 'perempuan', '082134726513'),
(6016, 'Ayu', 'Bandung', 'perempuan', '082315642531'),
(6017, 'Jajang Karman', 'Cirebon', 'laki-laki', '085278417225'),
(6018, 'Fajar Wafiq', 'Ciparay', 'laki-laki', '082672551433');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `id_paket` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `dibayar` enum('telah_dibayar','belum_dibayar') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_outlet`, `kode_invoice`, `id_pelanggan`, `tgl`, `batas_waktu`, `tgl_bayar`, `id_paket`, `berat`, `biaya_tambahan`, `grand_total`, `jumlah_bayar`, `kembalian`, `status`, `dibayar`, `id_user`) VALUES
(7001, 2006, '0GF5543S', 6001, '2021-10-20 10:24:41', '2021-10-23 10:24:40', '2021-10-22 12:12:19', 1017, 5, 0, 0, 0, 0, 'diambil', 'telah_dibayar', 5010),
(7002, 3506, '04CEF15V4', 6012, '2022-02-04 00:00:00', '2022-02-07 00:00:00', '2022-02-05 09:36:01', 1017, 3, 0, 0, 0, 0, 'diambil', 'telah_dibayar', 5011),
(7003, 3495, '05HFW324R', 6013, '2022-02-07 06:37:00', '2022-02-10 06:37:00', '2022-02-09 14:07:00', 1017, 4, 0, 0, 0, 0, 'diambil', 'telah_dibayar', 5011),
(7004, 2019, '05JTR13A1', 6009, '2022-02-10 09:16:00', '2022-02-13 09:16:00', '2022-02-12 07:04:00', 1017, 6, 0, 0, 0, 0, 'diambil', 'telah_dibayar', 5011),
(7005, 2006, '01SUW829G', 6012, '2022-02-11 07:12:00', '2022-02-14 07:12:00', '0000-00-00 00:00:00', 1017, 5, 0, 0, 0, 0, 'proses', 'belum_dibayar', 5006),
(7006, 2019, '08AUW915V', 6015, '2022-02-12 12:38:00', '2022-02-15 12:38:00', '0000-00-00 00:00:00', 1017, 5, 0, 0, 0, 0, 'baru', 'telah_dibayar', 5006),
(7008, 3510, '02GSU836B', 6010, '2022-02-12 17:28:00', '2022-02-15 17:28:00', '2022-02-12 17:35:00', 1017, 2, 0, 25000, 0, 0, 'selesai', 'telah_dibayar', 5006),
(7009, 3506, '03FJE852N', 6017, '2022-02-14 17:00:00', '2022-02-17 17:00:00', '0000-00-00 00:00:00', 1017, 2, 0, 20000, 0, 0, 'baru', 'belum_dibayar', 5011),
(7010, 2019, '02JLS826N', 6017, '2022-02-17 22:11:00', '2022-02-20 22:11:00', '2022-02-17 22:15:00', 1017, 3, 0, 45000, 0, 0, 'baru', 'telah_dibayar', 5010),
(7011, 2006, '03JDI729S', 6015, '2022-02-20 20:12:00', '2022-02-23 20:12:00', '2022-02-21 11:56:00', 1017, 3, 0, 30000, 0, 0, 'selesai', 'telah_dibayar', 5014),
(7012, 3510, 'ufiyfi', 6001, '2022-04-01 13:57:00', '2022-04-04 13:57:00', '2022-04-03 15:03:00', 1017, 3, 0, 45000, 0, 0, 'diambil', 'telah_dibayar', 5006),
(7013, 3506, 'udcyf', 6001, '2022-04-02 14:13:00', '2022-04-05 14:13:00', '2022-04-02 14:15:00', 1018, 2, 0, 61000, 0, 0, 'selesai', 'telah_dibayar', 5006),
(7014, 2006, '05ECG567X', 6012, '2022-04-12 15:57:00', '2022-04-15 15:57:00', '2022-04-14 22:30:00', 1001, 2, 2000, 22000, 0, 0, 'diambil', 'telah_dibayar', 5006),
(7017, 2006, '02ROX851Y', 6009, '2022-04-13 16:19:00', '2022-04-15 16:19:00', '2022-04-14 05:43:00', 1020, 2, 2000, 32000, 35000, 3000, 'diambil', 'telah_dibayar', 5006),
(7018, 3495, '04FUO958K', 6011, '2022-04-19 05:34:00', '2022-04-22 05:34:00', '2022-04-19 05:35:00', 1016, 2, 1000, 25000, 0, 0, 'baru', 'telah_dibayar', 5006),
(7019, 2019, '07DTY563I', 6017, '2022-04-19 05:50:00', '2022-04-22 05:51:00', '2022-04-19 06:51:00', 1017, 2, 2000, 18000, 20000, 2000, 'baru', 'telah_dibayar', 5006),
(7020, 2006, '03USU838N', 6018, '2022-04-20 08:27:00', '2022-04-23 08:27:00', '2022-04-21 08:27:00', 1026, 2, 2000, 28000, 30000, 2000, 'baru', 'telah_dibayar', 5006),
(7021, 3510, '03YSO793Z', 6010, '2022-04-20 08:37:00', '2022-04-23 08:37:00', '0000-00-00 00:00:00', 1026, 1, 2000, 15000, 0, 0, 'baru', 'belum_dibayar', 5014);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('admin','kasir','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `id_outlet`, `role`) VALUES
(5006, 'M. Salman Tanjali', 'scoutsal', '8f19c397f8c2c04c383c628f344250ec', 2006, 'admin'),
(5007, 'Septi Outlet Baleendah', 'septianti02', 'cbafca7a2bf07ed34a9effaf2f7763af', 2006, 'owner'),
(5010, 'Tanjali 33', 'tanjali33', '8e018a6ab3be573b1ad073e7aeffe4fc', 3510, 'kasir'),
(5011, 'Muhammad Salman .T', 'm-salman-t', '2e5a8cf9890730a489269bde407271fb', 3506, 'admin'),
(5013, 'AI', 'a-reality', '20761f3f32e14fbc1bbeb9ad7e97b7a4', 2019, 'owner'),
(5014, 'Jax Mills', 'jaxmills', '5556ceab53236617d449e1f61c9f31cf', 3505, 'kasir'),
(5017, 'dewi manggahang', 'dewimanggahang', 'fde0b737496c53bb85d07b31a02985a3', 3495, 'admin'),
(5018, 'Resti Nurwulan', 'restinurw', '9d007d3dccb1aebdd28ef93391f4afa2', 2006, 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `paket_cucian`
--
ALTER TABLE `paket_cucian`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `paket - transaksi` (`id_paket`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3515;

--
-- AUTO_INCREMENT for table `paket_cucian`
--
ALTER TABLE `paket_cucian`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1028;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6019;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7022;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5019;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paket_cucian`
--
ALTER TABLE `paket_cucian`
  ADD CONSTRAINT `paket_cucian_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `paket - transaksi` FOREIGN KEY (`id_paket`) REFERENCES `paket_cucian` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

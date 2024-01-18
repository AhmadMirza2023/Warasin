-- Adminer 4.8.1 MySQL 10.4.28-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `konsuls`;
CREATE TABLE `konsuls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) DEFAULT NULL,
  `psikolog_id` bigint(20) DEFAULT NULL,
  `waktu` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `konsuls` (`id`, `users_id`, `psikolog_id`, `waktu`, `created_at`) VALUES
(1,	5,	1,	'0000-00-00 00:00:00.000',	'2024-01-18 11:13:14.984');

DROP TABLE IF EXISTS `psikologs`;
CREATE TABLE `psikologs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `rumah_sakit` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `tarif` double DEFAULT NULL,
  `lama_kerja` bigint(20) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_psikologs_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `psikologs` (`id`, `foto`, `nama`, `rumah_sakit`, `email`, `password`, `deskripsi`, `tarif`, `lama_kerja`, `created_at`, `deleted_at`) VALUES
(2,	'https://images.unsplash.com/photo-1537368910025-700350fe46c7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZG9jdG9yfGVufDB8fDB8fHww',	'Dr. Sutha',	'Soetomo',	'Sutha222@gmail.com',	'$2a$10$WqHQMPfrHLU3KfKyBOPV0.HRQfrb/1ca.LM0Hgos5RlgdjkNAe95e',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	500000,	15,	'2024-01-18 11:24:36.781',	NULL),
(3,	'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZG9jdG9yfGVufDB8fDB8fHww',	'Dr. Rizky',	'Soetomo',	'Rizky222@gmail.com',	'$2a$10$FGHFwyrs9H1Y9EVmzArENe9N0IgnjyIqy2dGDcGqlOl86f6eqo4Ba',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	1000000,	9,	'2024-01-18 11:26:05.484',	NULL),
(4,	'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGRvY3RvcnxlbnwwfHwwfHx8MA%3D%3D',	'Dr. Pilemon',	'Soetomo',	'Pilemon222@gmail.com',	'$2a$10$dRvm6emcOwZIehKdE3jtBumvcCWUZJ4k9T.F5oKgNcohFrXOBepkW',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	1200000,	20,	'2024-01-18 11:26:57.078',	NULL),
(5,	'https://images.unsplash.com/photo-1576669801775-ff43c5ab079d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTUyfHxkb2N0b3J8ZW58MHx8MHx8fDA%3D',	'Dr. Colombus',	'Soetomo',	'Colombus222@gmail.com',	'$2a$10$hwcOe7WQ5/axF0Cc1P15a.0g4J1K40HXo8sxKjpOASZfvgxUksx/S',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	400000,	5,	'2024-01-18 11:29:00.572',	NULL),
(6,	'https://media.istockphoto.com/id/811285782/id/foto/perawat-tersenyum-menulis-laporan-medis-di-rumah-sakit.jpg?s=612x612&w=0&k=20&c=dDLV0vUuvz1bVe9MPiTnOM_ohQcN0VVtdcKPCyLPn_o=',	'Dr. Boyke',	'Soetomo',	'Boyke222@gmail.com',	'$2a$10$OYTXY3ygem69tDKfPclyVONGhodQuKB2IhBwKeMA/XSuqMSet5xde',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	1000000,	8,	'2024-01-18 11:30:38.005',	NULL),
(7,	'https://media.istockphoto.com/id/1755135433/id/foto/perawat-ramah-yang-bekerja-di-rumah-sakit.jpg?s=612x612&w=0&k=20&c=pSdokMV9l9EDE2Bc1ezEfb3_yYx3zO8CGJFBd936I7Q=',	'Dr. Elizabeth',	'Soetomo',	'Elizabeth222@gmail.com',	'$2a$10$ax49M7Cehj7s1qofzrDZ8uTU51OfeuCH6HZOHoY2dZEYHceML8b2u',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	700000,	11,	'2024-01-18 11:32:15.781',	NULL),
(8,	'https://media.istockphoto.com/id/1635466082/id/foto/dokter-wanita-dengan-stetoskop-menggunakan-komputer-laptop-mengobrol-video-dengan-pasien-di.jpg?s=612x612&w=0&k=20&c=pYOFaPQXtzl4MZPXi2ghINb_Yh6_QtFAudtmRLI1jqc=',	'Dr. Shayn',	'Soetomo',	'Shayn222@gmail.com',	'$2a$10$SE3yYZ7npDhP426XMxXI9.2TL45hJlleTXFmEWw.Ptp.ycVfhxrxm',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	1100000,	18,	'2024-01-18 11:33:06.191',	NULL),
(9,	'https://media.istockphoto.com/id/481526455/id/foto/perawat-muda-dengan-tablet-digital.jpg?s=612x612&w=0&k=20&c=nwKQTaV1pdL2hroKYFJsxuakgA8eJQABlHiuk_wU1f4=',	'Dr. Cassidy',	'Soetomo',	'Cassidy222@gmail.com',	'$2a$10$qlHriP0cTPmUzTPeq3M9rOUaGixOs4sRoDPYaje3TCP2iM8A/dCo2',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	1000000,	13,	'2024-01-18 11:33:47.647',	NULL),
(10,	'https://media.istockphoto.com/id/1457023643/id/foto/perawat-wanita-filipina-cantik-bekerja-di-klinik-modern.jpg?s=612x612&w=0&k=20&c=HGYn2HjUCEQp57-SpvpKoclq1hkE88MQDGjG08JpFBw=',	'Dr. Cameron',	'Soetomo',	'Cameron222@gmail.com',	'$2a$10$owpSmu7o9den7ML7VoWKgO.W8TP2yr.MXPQAEA1jmXVqE3W.lQHAS',	'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari ',	700000,	2,	'2024-01-18 11:34:38.320',	NULL);

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `psikolog_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `rating` int(2) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reviews_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `reviews` (`id`, `psikolog_id`, `users_id`, `pesan`, `rating`, `created_at`, `deleted_at`) VALUES
(1,	1,	5,	'Bagus sekali pelayannya',	5,	'2024-01-18 11:13:55.673',	NULL);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `negara` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gender` enum('Pria','Wanita') DEFAULT NULL,
  `nomor_telepon` longtext DEFAULT NULL,
  `created_at` datetime(3) DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `nama`, `foto`, `email`, `negara`, `password`, `tgl_lahir`, `gender`, `nomor_telepon`, `created_at`, `deleted_at`) VALUES
(5,	'Ahmad Mirza Rafiq Azmi',	'',	'ahmad123@gmail.com',	'',	'$2a$10$/BYe9EopLOk00M0RrTOpdey4O8t8sKNf6inJcLnnmrQyyVmuRCEo6',	'0000-00-00',	NULL,	'',	'2024-01-18 10:38:41.474',	NULL);

-- 2024-01-18 14:39:43

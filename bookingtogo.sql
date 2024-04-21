-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2024 at 08:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookingtogo`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cst_id` bigint(20) UNSIGNED NOT NULL,
  `nationality_id` bigint(20) UNSIGNED NOT NULL,
  `cst_name` varchar(50) NOT NULL,
  `cst_dob` date NOT NULL,
  `cst_phoneNum` varchar(20) NOT NULL,
  `cst_email` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cst_id`, `nationality_id`, `cst_name`, `cst_dob`, `cst_phoneNum`, `cst_email`, `created_at`, `updated_at`) VALUES
(3, 1, 'Wafi', '2024-04-21', '628586394567', 'wafi@gmail.com', '2024-04-21 08:49:30', '2024-04-21 08:49:30'),
(4, 1, 'Josh', '2024-04-15', '628586394567', 'josh@gmail.com', '2024-04-21 08:49:45', '2024-04-21 08:49:45'),
(5, 1, 'Fajar', '2024-04-04', '628586394567', 'fajar@gmail.com', '2024-04-21 08:53:56', '2024-04-21 08:53:56'),
(6, 1, 'Noven', '2024-04-17', '628586394567', 'noven@gmail.com', '2024-04-21 08:59:54', '2024-04-21 08:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `family_lists`
--

CREATE TABLE `family_lists` (
  `fl_id` bigint(20) UNSIGNED NOT NULL,
  `cst_id` bigint(20) UNSIGNED NOT NULL,
  `fl_name` varchar(50) NOT NULL,
  `fl_dob` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_lists`
--

INSERT INTO `family_lists` (`fl_id`, `cst_id`, `fl_name`, `fl_dob`, `created_at`, `updated_at`) VALUES
(10, 4, 'Josh Family 1', '2024-03-31', '2024-04-21 08:49:45', '2024-04-21 08:49:45'),
(11, 5, 'Fajar Family 2', '2024-04-15', '2024-04-21 08:53:56', '2024-04-21 08:53:56'),
(12, 5, 'Fajar Family 1', '2024-04-25', '2024-04-21 08:53:56', '2024-04-21 08:53:56'),
(13, 6, 'Noven Family 2', '2024-04-30', '2024-04-21 08:59:54', '2024-04-21 08:59:54'),
(14, 6, 'Noven Family 1', '2024-04-25', '2024-04-21 08:59:54', '2024-04-21 08:59:54'),
(24, 3, 'Wafi Family 5', '2024-04-21', '2024-04-21 09:23:15', '2024-04-21 09:23:15'),
(25, 3, 'Wafi Family 4', '2024-04-08', '2024-04-21 09:23:15', '2024-04-21 09:23:15'),
(26, 3, 'Wafi Family 3', '2024-04-09', '2024-04-21 09:23:15', '2024-04-21 09:23:15'),
(27, 3, 'Wafi Family 2', '2024-04-15', '2024-04-21 09:23:15', '2024-04-21 09:23:15'),
(28, 3, 'Wafi Family 1', '2024-04-18', '2024-04-21 09:23:15', '2024-04-21 09:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `nationality_id` bigint(20) UNSIGNED NOT NULL,
  `nationality_name` varchar(50) NOT NULL,
  `nationality_code` char(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nationalities`
--

INSERT INTO `nationalities` (`nationality_id`, `nationality_name`, `nationality_code`, `created_at`, `updated_at`) VALUES
(1, 'Indonesia', 'ID', '2024-04-21 07:56:54', '2024-04-21 07:56:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cst_id`);

--
-- Indexes for table `family_lists`
--
ALTER TABLE `family_lists`
  ADD PRIMARY KEY (`fl_id`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`nationality_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cst_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `family_lists`
--
ALTER TABLE `family_lists`
  MODIFY `fl_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `nationality_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

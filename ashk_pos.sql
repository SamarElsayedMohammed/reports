-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2022 at 12:34 PM
-- Server version: 8.0.28-cll-lve
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ashk_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_details` text COLLATE utf8mb4_unicode_ci,
  `account_type_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `business_id`, `name`, `account_number`, `account_details`, `account_type_id`, `note`, `created_by`, `is_closed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'مبيعات', '051', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 1, NULL, 1, 0, NULL, '2022-01-23 01:41:34', '2022-01-23 01:41:34'),
(2, 1, 'gfxshjakl', '0111', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 1, NULL, 1, 0, NULL, '2022-02-07 21:46:10', '2022-02-07 21:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int UNSIGNED NOT NULL,
  `account_id` int NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `transaction_payment_id` int DEFAULT NULL,
  `transfer_transaction_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transfer_transaction_id`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'credit', 'opening_balance', 10.0000, NULL, '2022-01-22 20:41:34', 1, NULL, NULL, NULL, NULL, NULL, '2022-01-23 01:41:34', '2022-01-23 01:41:34'),
(2, 1, 'credit', NULL, 500.0000, NULL, '2022-01-05 19:39:00', 1, 2, 1, NULL, NULL, NULL, '2022-01-24 00:32:32', '2022-01-24 00:32:32'),
(3, 2, 'credit', 'opening_balance', 50.0000, NULL, '2022-02-07 16:46:10', 1, NULL, NULL, NULL, NULL, NULL, '2022-02-07 21:46:10', '2022-02-07 21:46:10'),
(4, 1, 'debit', 'fund_transfer', 15.0000, NULL, '2022-02-22 15:35:00', 1, NULL, NULL, 5, NULL, NULL, '2022-02-22 20:35:20', '2022-02-22 20:35:20'),
(5, 2, 'credit', 'fund_transfer', 15.0000, NULL, '2022-02-22 15:35:00', 1, NULL, NULL, 4, NULL, NULL, '2022-02-22 20:35:20', '2022-02-22 20:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int DEFAULT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name`, `parent_account_type_id`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'حساب المبيعات', NULL, 1, '2022-01-23 01:41:08', '2022-01-24 00:38:34'),
(2, 'حساب المشتريات', NULL, 1, '2022-01-24 00:38:06', '2022-01-24 00:38:06'),
(3, 'حساب الضرائب', NULL, 1, '2022-01-24 00:38:53', '2022-01-24 00:38:53'),
(4, 'حساب المبيعات', NULL, 3, '2022-01-26 04:33:27', '2022-01-26 04:33:27'),
(5, 'حساب المشتريات', NULL, 3, '2022-01-26 04:34:29', '2022-01-26 04:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int DEFAULT NULL,
  `causer_id` int DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 23:25:54', '2022-01-05 23:25:54'),
(2, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 23:31:03', '2022-01-05 23:31:03'),
(3, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 23:31:12', '2022-01-05 23:31:12'),
(4, 'default', 'added', 2, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":500}}', '2022-01-06 00:41:02', '2022-01-06 00:41:02'),
(5, 'default', 'added', 3, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":100}}', '2022-01-06 00:43:26', '2022-01-06 00:43:26'),
(6, 'default', 'added', 4, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":100}}', '2022-01-06 00:51:36', '2022-01-06 00:51:36'),
(7, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 05:10:39', '2022-01-06 05:10:39'),
(8, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 17:21:06', '2022-01-06 17:21:06'),
(9, 'default', 'added', 2, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"Mr shadi singab\"}', '2022-01-06 17:44:03', '2022-01-06 17:44:03'),
(10, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 02:15:14', '2022-01-12 02:15:14'),
(11, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 18:59:16', '2022-01-13 18:59:16'),
(12, 'default', 'added', 5, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":270}}', '2022-01-13 20:09:43', '2022-01-13 20:09:43'),
(13, 'default', 'added', 6, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":150}}', '2022-01-13 20:11:08', '2022-01-13 20:11:08'),
(14, 'default', 'added', 7, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":150}}', '2022-01-13 20:15:56', '2022-01-13 20:15:56'),
(15, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 16:18:39', '2022-01-22 16:18:39'),
(16, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 16:25:44', '2022-01-22 16:25:44'),
(17, 'default', 'added', 8, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":130.43000000000000682121026329696178436279296875}}', '2022-01-22 16:28:04', '2022-01-22 16:28:04'),
(18, 'default', 'added', 9, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":130.43000000000000682121026329696178436279296875}}', '2022-01-22 16:28:47', '2022-01-22 16:28:47'),
(19, 'default', 'added', 3, 'App\\User', 1, 1, 'App\\User', '{\"name\":\" mama \"}', '2022-01-22 16:38:17', '2022-01-22 16:38:17'),
(20, 'default', 'added', 4, 'App\\User', 1, 1, 'App\\User', '{\"name\":\" mama fatema\"}', '2022-01-22 16:39:05', '2022-01-22 16:39:05'),
(21, 'default', 'added', 11, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":510.240000000000009094947017729282379150390625}}', '2022-01-22 16:44:23', '2022-01-22 16:44:23'),
(22, 'default', 'added', 12, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2022-01-22 16:46:29', '2022-01-22 16:46:29'),
(23, 'default', 'added', 2, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-22 16:57:27', '2022-01-22 16:57:27'),
(24, 'default', 'added', 13, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":382.68000000000000682121026329696178436279296875}}', '2022-01-22 17:01:00', '2022-01-22 17:01:00'),
(25, 'default', 'edited', 5, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":1765.640000000000100044417195022106170654296875},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"270.0000\"}}', '2022-01-22 17:10:40', '2022-01-22 17:10:40'),
(26, 'default', 'added', 14, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":510.240000000000009094947017729282379150390625}}', '2022-01-22 17:22:14', '2022-01-22 17:22:14'),
(27, 'default', 'added', 15, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10.6300000000000007815970093361102044582366943359375}}', '2022-01-22 17:49:47', '2022-01-22 17:49:47'),
(28, 'default', 'added', 16, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":21.050000000000000710542735760100185871124267578125}}', '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(29, 'default', 'edited', 2, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-22 18:59:16', '2022-01-22 18:59:16'),
(30, 'default', 'edited', 4, 'App\\User', 1, 1, 'App\\User', '{\"name\":\" mama fatema\"}', '2022-01-22 19:06:14', '2022-01-22 19:06:14'),
(31, 'default', 'edited', 4, 'App\\User', 1, 1, 'App\\User', '{\"name\":\" mama fatema\"}', '2022-01-22 19:07:13', '2022-01-22 19:07:13'),
(32, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 19:07:15', '2022-01-22 19:07:15'),
(33, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 19:08:23', '2022-01-22 19:08:23'),
(34, 'default', 'added', 17, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":106.2999999999999971578290569595992565155029296875}}', '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(35, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 19:12:20', '2022-01-22 19:12:20'),
(36, 'default', 'added', 18, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":138.18999999999999772626324556767940521240234375}}', '2022-01-22 19:13:20', '2022-01-22 19:13:20'),
(37, 'default', 'added', 3, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-22 19:15:37', '2022-01-22 19:15:37'),
(38, 'default', 'added', 19, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":212.599999999999994315658113919198513031005859375}}', '2022-01-22 19:16:31', '2022-01-22 19:16:31'),
(39, 'default', 'added', 20, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":531.5}}', '2022-01-22 21:06:19', '2022-01-22 21:06:19'),
(40, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 01:38:35', '2022-01-23 01:38:35'),
(41, 'default', 'added', 21, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":241.06000000000000227373675443232059478759765625}}', '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(42, 'default', 'added', 23, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":100}}', '2022-01-23 02:00:30', '2022-01-23 02:00:30'),
(43, 'default', 'added', 24, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":115}}', '2022-01-23 02:01:28', '2022-01-23 02:01:28'),
(44, 'default', 'added', 25, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":115}}', '2022-01-23 02:01:51', '2022-01-23 02:01:51'),
(45, 'default', 'added', 26, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-01-23 02:04:01', '2022-01-23 02:04:01'),
(46, 'default', 'added', 27, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-01-23 02:05:45', '2022-01-23 02:05:45'),
(47, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 13:52:13', '2022-01-23 13:52:13'),
(48, 'default', 'login', 6, 'App\\User', 2, 6, 'App\\User', '[]', '2022-01-23 14:03:35', '2022-01-23 14:03:35'),
(49, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 14:04:16', '2022-01-23 14:04:16'),
(50, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 14:13:41', '2022-01-23 14:13:41'),
(51, 'default', 'login', 6, 'App\\User', 2, 6, 'App\\User', '[]', '2022-01-23 14:13:47', '2022-01-23 14:13:47'),
(52, 'default', 'logout', 6, 'App\\User', 2, 6, 'App\\User', '[]', '2022-01-23 14:18:29', '2022-01-23 14:18:29'),
(53, 'default', 'login', 6, 'App\\User', 2, 6, 'App\\User', '[]', '2022-01-23 14:18:41', '2022-01-23 14:18:41'),
(54, 'default', 'added', 7, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"\\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u0633\\u062a\\u062e\\u062f\\u06451 \\u0645\\u0633\\u062a\\u062e\\u062f\\u06451\"}', '2022-01-23 14:34:51', '2022-01-23 14:34:51'),
(55, 'default', 'logout', 6, 'App\\User', 2, 6, 'App\\User', '[]', '2022-01-23 14:35:03', '2022-01-23 14:35:03'),
(56, 'default', 'login', 7, 'App\\User', 1, 7, 'App\\User', '[]', '2022-01-23 14:35:09', '2022-01-23 14:35:09'),
(57, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 18:27:19', '2022-01-23 18:27:19'),
(58, 'default', 'added', 8, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"Mr Samel Khaled Al-Ahmadi\"}', '2022-01-23 18:29:01', '2022-01-23 18:29:01'),
(59, 'default', 'login', 8, 'App\\User', 1, 8, 'App\\User', '[]', '2022-01-23 18:29:15', '2022-01-23 18:29:15'),
(60, 'default', 'logout', 8, 'App\\User', 1, 8, 'App\\User', '[]', '2022-01-23 18:29:16', '2022-01-23 18:29:16'),
(61, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 18:30:48', '2022-01-23 18:30:48'),
(62, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 20:00:03', '2022-01-23 20:00:03'),
(63, 'default', 'added', 29, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-01-23 20:05:23', '2022-01-23 20:05:23'),
(64, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 20:06:31', '2022-01-23 20:06:31'),
(65, 'default', 'added', 30, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.449999999999999289457264239899814128875732421875}}', '2022-01-23 20:07:54', '2022-01-23 20:07:54'),
(66, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 00:31:06', '2022-01-24 00:31:06'),
(67, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 00:58:35', '2022-01-24 00:58:35'),
(68, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 22:29:25', '2022-01-24 22:29:25'),
(69, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 22:34:09', '2022-01-24 22:34:09'),
(70, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 22:37:20', '2022-01-24 22:37:20'),
(71, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-25 16:16:54', '2022-01-25 16:16:54'),
(72, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-25 17:32:33', '2022-01-25 17:32:33'),
(73, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-25 18:36:32', '2022-01-25 18:36:32'),
(74, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-25 18:45:40', '2022-01-25 18:45:40'),
(75, 'default', 'logout', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-25 18:46:56', '2022-01-25 18:46:56'),
(76, 'default', 'login', 10, 'App\\User', 4, 10, 'App\\User', '[]', '2022-01-25 18:47:03', '2022-01-25 18:47:03'),
(77, 'default', 'logout', 10, 'App\\User', 4, 10, 'App\\User', '[]', '2022-01-25 18:47:52', '2022-01-25 18:47:52'),
(78, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-25 18:47:58', '2022-01-25 18:47:58'),
(79, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-25 18:58:16', '2022-01-25 18:58:16'),
(80, 'default', 'added', 7, 'App\\Contact', 3, 9, 'App\\User', '[]', '2022-01-25 19:13:48', '2022-01-25 19:13:48'),
(81, 'default', 'added', 31, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":1725}}', '2022-01-25 19:15:30', '2022-01-25 19:15:30'),
(82, 'default', 'added', 32, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":1748}}', '2022-01-25 19:16:04', '2022-01-25 19:16:04'),
(83, 'default', 'added', 33, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":16.519999999999999573674358543939888477325439453125}}', '2022-01-25 19:26:59', '2022-01-25 19:26:59'),
(84, 'default', 'added', 34, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":19}}', '2022-01-25 19:28:20', '2022-01-25 19:28:20'),
(85, 'default', 'added', 35, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.14999999999999857891452847979962825775146484375}}', '2022-01-25 19:40:49', '2022-01-25 19:40:49'),
(86, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-26 04:21:45', '2022-01-26 04:21:45'),
(87, 'default', 'added', 36, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":48.2999999999999971578290569595992565155029296875}}', '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(88, 'default', 'added', 37, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":48.2999999999999971578290569595992565155029296875}}', '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(89, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-26 04:39:26', '2022-01-26 04:39:26'),
(90, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-26 04:41:38', '2022-01-26 04:41:38'),
(91, 'default', 'added', 38, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":48.2999999999999971578290569595992565155029296875}}', '2022-01-26 04:42:17', '2022-01-26 04:42:17'),
(92, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 14:13:58', '2022-01-27 14:13:58'),
(93, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 14:17:36', '2022-01-27 14:17:36'),
(94, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-27 14:17:43', '2022-01-27 14:17:43'),
(95, 'default', 'added', 39, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.14999999999999857891452847979962825775146484375}}', '2022-01-27 14:19:01', '2022-01-27 14:19:01'),
(96, 'default', 'edited', 39, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.14999999999999857891452847979962825775146484375},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"24.1500\"}}', '2022-01-27 14:20:29', '2022-01-27 14:20:29'),
(97, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 16:59:19', '2022-01-28 16:59:19'),
(98, 'default', 'added', 40, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(99, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 18:14:32', '2022-01-28 18:14:32'),
(100, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-28 18:14:38', '2022-01-28 18:14:38'),
(101, 'default', 'added', 41, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.14999999999999857891452847979962825775146484375}}', '2022-01-28 18:16:05', '2022-01-28 18:16:05'),
(102, 'default', 'logout', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-28 18:16:55', '2022-01-28 18:16:55'),
(103, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 18:17:09', '2022-01-28 18:17:09'),
(104, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-28 18:18:47', '2022-01-28 18:18:47'),
(105, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-01-28 18:22:20', '2022-01-28 18:22:20'),
(106, 'default', 'added', 42, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.14999999999999857891452847979962825775146484375}}', '2022-01-28 18:22:52', '2022-01-28 18:22:52'),
(107, 'default', 'added', 43, 'App\\Transaction', 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.14999999999999857891452847979962825775146484375}}', '2022-01-28 18:23:33', '2022-01-28 18:23:33'),
(108, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 22:46:58', '2022-01-30 22:46:58'),
(109, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-07 21:42:34', '2022-02-07 21:42:34'),
(110, 'default', 'added', 44, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":316.970000000000027284841053187847137451171875}}', '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(111, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 06:38:15', '2022-02-08 06:38:15'),
(112, 'default', 'added', 8, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-08 06:52:29', '2022-02-08 06:52:29'),
(113, 'default', 'added', 46, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":11615}}', '2022-02-08 07:04:09', '2022-02-08 07:04:09'),
(114, 'default', 'edited', 46, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":11615},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"11615.0000\"}}', '2022-02-08 07:07:31', '2022-02-08 07:07:31'),
(115, 'default', 'added', 47, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-02-08 07:08:28', '2022-02-08 07:08:28'),
(116, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-14 02:43:34', '2022-02-14 02:43:34'),
(117, 'default', 'added', 48, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":264.5}}', '2022-02-14 02:43:49', '2022-02-14 02:43:49'),
(118, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-02-14 14:41:17', '2022-02-14 14:41:17'),
(119, 'default', 'logout', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-02-14 14:41:32', '2022-02-14 14:41:32'),
(120, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-14 14:41:44', '2022-02-14 14:41:44'),
(121, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-16 03:26:00', '2022-02-16 03:26:00'),
(122, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-17 05:31:42', '2022-02-17 05:31:42'),
(123, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-17 05:42:47', '2022-02-17 05:42:47'),
(124, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-17 23:37:12', '2022-02-17 23:37:12'),
(125, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-20 16:13:21', '2022-02-20 16:13:21'),
(126, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-20 17:39:28', '2022-02-20 17:39:28'),
(127, 'default', 'added', 49, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-02-20 17:46:03', '2022-02-20 17:46:03'),
(128, 'default', 'added', 50, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-02-20 17:50:01', '2022-02-20 17:50:01'),
(129, 'default', 'added', 51, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-02-20 17:53:33', '2022-02-20 17:53:33'),
(130, 'default', 'added', 52, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-02-20 17:54:44', '2022-02-20 17:54:44'),
(131, 'default', 'added', 53, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-02-20 18:44:43', '2022-02-20 18:44:43'),
(132, 'default', 'added', 54, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":132.25}}', '2022-02-20 20:14:33', '2022-02-20 20:14:33'),
(133, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 05:05:11', '2022-02-22 05:05:11'),
(134, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 05:05:28', '2022-02-22 05:05:28'),
(135, 'default', 'added', 55, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":437}}', '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(136, 'default', 'added', 56, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":264.5}}', '2022-02-22 05:19:41', '2022-02-22 05:19:41'),
(137, 'default', 'added', 57, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":264.5}}', '2022-02-22 05:19:54', '2022-02-22 05:19:54'),
(138, 'default', 'added', 58, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":132.25}}', '2022-02-22 07:00:55', '2022-02-22 07:00:55'),
(139, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 07:11:31', '2022-02-22 07:11:31'),
(140, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 07:22:10', '2022-02-22 07:22:10'),
(141, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 07:24:10', '2022-02-22 07:24:10'),
(142, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 19:47:25', '2022-02-22 19:47:25'),
(143, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 20:18:18', '2022-02-22 20:18:18'),
(144, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 20:32:07', '2022-02-22 20:32:07'),
(145, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 20:35:44', '2022-02-22 20:35:44'),
(146, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 21:14:32', '2022-02-22 21:14:32'),
(147, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 21:42:26', '2022-02-22 21:42:26'),
(148, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 21:56:34', '2022-02-22 21:56:34'),
(149, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 21:58:07', '2022-02-22 21:58:07'),
(150, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 05:18:53', '2022-03-03 05:18:53'),
(151, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 04:02:56', '2022-03-05 04:02:56'),
(152, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 04:05:45', '2022-03-05 04:05:45'),
(153, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 04:05:54', '2022-03-05 04:05:54'),
(154, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 04:06:30', '2022-03-05 04:06:30'),
(155, 'default', 'login', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-03-07 17:01:31', '2022-03-07 17:01:31'),
(156, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-07 17:22:44', '2022-03-07 17:22:44'),
(157, 'default', 'logout', 9, 'App\\User', 3, 9, 'App\\User', '[]', '2022-03-07 17:54:48', '2022-03-07 17:54:48'),
(158, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-07 17:54:58', '2022-03-07 17:54:58'),
(159, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 06:44:01', '2022-03-15 06:44:01'),
(160, 'default', 'added', 59, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1759.5}}', '2022-03-15 06:45:05', '2022-03-15 06:45:05'),
(161, 'default', 'sell_deleted', 59, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":59,\"invoice_no\":\"2022-0034\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1759.5000\"}}', '2022-03-15 06:50:13', '2022-03-15 06:50:13'),
(162, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 06:50:50', '2022-03-15 06:50:50'),
(163, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 03:15:49', '2022-03-18 03:15:49'),
(164, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-24 19:23:17', '2022-03-24 19:23:17'),
(165, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-24 20:37:49', '2022-03-24 20:37:49'),
(166, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-27 04:31:28', '2022-03-27 04:31:28'),
(167, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-27 04:37:18', '2022-03-27 04:37:18'),
(168, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-27 13:12:03', '2022-03-27 13:12:03'),
(169, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-27 13:15:58', '2022-03-27 13:15:58'),
(170, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-27 13:23:09', '2022-03-27 13:23:09'),
(171, 'default', 'login', 11, 'App\\User', 5, 11, 'App\\User', '[]', '2022-03-27 15:53:16', '2022-03-27 15:53:16'),
(172, 'default', 'added', 12, 'App\\User', 5, 11, 'App\\User', '{\"name\":\"\\u0627\\u0644\\u0633\\u064a\\u062f \\u062e\\u0627\\u0644\\u062f \\u0633\\u0627\\u0644\\u0645\"}', '2022-03-27 14:46:55', '2022-03-27 14:46:55'),
(173, 'default', 'added', 13, 'App\\User', 5, 11, 'App\\User', '{\"name\":\"\\u0627\\u0644\\u0633\\u064a\\u062f \\u064a\\u0648\\u0633\\u0641 \\u0627\\u062d\\u0645\\u062f \\u0633\\u0627\\u0644\\u0645\"}', '2022-03-27 14:47:27', '2022-03-27 14:47:27'),
(174, 'default', 'login', 12, 'App\\User', 5, 12, 'App\\User', '[]', '2022-03-27 14:47:48', '2022-03-27 14:47:48'),
(175, 'default', 'added', 60, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10}}', '2022-03-27 14:48:27', '2022-03-27 14:48:27'),
(176, 'default', 'added', 61, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 14:49:59', '2022-03-27 14:49:59'),
(177, 'default', 'added', 62, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10}}', '2022-03-27 14:53:59', '2022-03-27 14:53:59'),
(178, 'default', 'added', 63, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 14:58:54', '2022-03-27 14:58:54'),
(179, 'default', 'added', 64, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 14:59:05', '2022-03-27 14:59:05'),
(180, 'default', 'added', 65, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 15:01:16', '2022-03-27 15:01:16'),
(181, 'default', 'added', 66, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":50}}', '2022-03-27 15:07:55', '2022-03-27 15:07:55'),
(182, 'default', 'added', 67, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":25}}', '2022-03-27 15:08:15', '2022-03-27 15:08:15'),
(183, 'default', 'added', 68, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 15:08:35', '2022-03-27 15:08:35'),
(184, 'default', 'logout', 12, 'App\\User', 5, 12, 'App\\User', '[]', '2022-03-27 15:09:33', '2022-03-27 15:09:33'),
(185, 'default', 'login', 12, 'App\\User', 5, 12, 'App\\User', '[]', '2022-03-27 15:09:40', '2022-03-27 15:09:40'),
(186, 'default', 'added', 69, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":30}}', '2022-03-27 15:09:44', '2022-03-27 15:09:44'),
(187, 'default', 'added', 70, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10}}', '2022-03-27 15:12:48', '2022-03-27 15:12:48'),
(188, 'default', 'added', 71, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10}}', '2022-03-27 15:13:19', '2022-03-27 15:13:19'),
(189, 'default', 'added', 72, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', '2022-03-27 15:19:04', '2022-03-27 15:19:04'),
(190, 'default', 'added', 73, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 15:19:13', '2022-03-27 15:19:13'),
(191, 'default', 'added', 74, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 15:19:47', '2022-03-27 15:19:47'),
(192, 'default', 'added', 75, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 15:20:30', '2022-03-27 15:20:30'),
(193, 'default', 'added', 76, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":25}}', '2022-03-27 15:21:32', '2022-03-27 15:21:32'),
(194, 'default', 'added', 77, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', '2022-03-27 15:25:16', '2022-03-27 15:25:16'),
(195, 'default', 'added', 78, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', '2022-03-27 15:27:06', '2022-03-27 15:27:06'),
(196, 'default', 'added', 79, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', '2022-03-27 15:28:41', '2022-03-27 15:28:41'),
(197, 'default', 'added', 80, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-27 15:28:47', '2022-03-27 15:28:47'),
(198, 'default', 'added', 81, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', '2022-03-27 15:29:04', '2022-03-27 15:29:04'),
(199, 'default', 'added', 82, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":20}}', '2022-03-27 15:29:50', '2022-03-27 15:29:50'),
(200, 'default', 'added', 83, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":25}}', '2022-03-27 15:29:55', '2022-03-27 15:29:55'),
(201, 'default', 'added', 84, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', '2022-03-27 15:32:30', '2022-03-27 15:32:30'),
(202, 'default', 'added', 85, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', '2022-03-27 15:32:58', '2022-03-27 15:32:58'),
(203, 'default', 'added', 86, 'App\\Transaction', 5, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10}}', '2022-03-27 15:34:51', '2022-03-27 15:34:51'),
(204, 'default', 'login', 11, 'App\\User', 5, 11, 'App\\User', '[]', '2022-03-27 15:54:15', '2022-03-27 15:54:15'),
(205, 'default', 'login', 11, 'App\\User', 5, 11, 'App\\User', '[]', '2022-03-27 17:51:22', '2022-03-27 17:51:22'),
(206, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-29 13:56:49', '2022-03-29 13:56:49'),
(207, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-29 23:57:25', '2022-03-29 23:57:25'),
(208, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-31 18:22:28', '2022-03-31 18:22:28'),
(209, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-31 18:30:41', '2022-03-31 18:30:41'),
(210, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-04 06:43:54', '2022-04-04 06:43:54'),
(211, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-04 06:45:59', '2022-04-04 06:45:59'),
(212, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-05 04:08:33', '2022-04-05 04:08:33'),
(213, 'default', 'added', 87, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":644.720000000000027284841053187847137451171875}}', '2022-04-05 04:52:01', '2022-04-05 04:52:01'),
(214, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-07 04:03:37', '2022-04-07 04:03:37'),
(215, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-07 20:08:19', '2022-04-07 20:08:19'),
(216, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-08 05:12:37', '2022-04-08 05:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 11:13:44', '2017-12-18 11:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 11:04:39', '2017-12-18 11:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 10:55:40', '2017-12-18 10:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 10:58:40', '2017-12-18 10:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 10:51:10', '2017-12-18 10:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 10:51:10', '2017-12-18 10:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int UNSIGNED NOT NULL,
  `contact_id` int UNSIGNED NOT NULL,
  `waiter_id` int UNSIGNED DEFAULT NULL,
  `table_id` int UNSIGNED DEFAULT NULL,
  `correspondent_id` int DEFAULT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `booking_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mama fatema', NULL, 1, NULL, '2022-01-22 19:18:30', '2022-01-22 19:18:30'),
(2, 3, 'بيرين', 'بيرين', 9, NULL, '2022-01-25 18:52:19', '2022-01-25 18:52:19'),
(3, 3, 'الصفا', 'الصفا', 9, NULL, '2022-01-25 18:56:24', '2022-01-25 18:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_api_settings` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_wh_oc_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_ou_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_od_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_or_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_settings` longtext COLLATE utf8mb4_unicode_ci,
  `manufacturing_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `woocommerce_api_settings`, `woocommerce_wh_oc_secret`, `woocommerce_wh_ou_secret`, `woocommerce_wh_od_secret`, `woocommerce_wh_or_secret`, `essentials_settings`, `manufacturing_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'demo', 101, '2022-01-05', '300114889400003', 'تحريبى', NULL, NULL, NULL, NULL, NULL, NULL, 1, 25.00, 1, 'Asia/Riyadh', 1, 'fifo', 0.00, 'includes', '1641396338_logo-ban.png', NULL, 1, 'add_manufacturing', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"cmmsn_calculation_type\":\"invoice_value\",\"amount_rounding_method\":null,\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"show_invoice_scheme\":\"1\",\"show_invoice_layout\":\"1\",\"print_on_suspend\":\"1\",\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, '{\"leave_ref_no_prefix\":null,\"leave_instructions\":null,\"payroll_ref_no_prefix\":\"1\",\"essentials_todos_prefix\":null,\"grace_before_checkin\":null,\"grace_after_checkin\":null,\"grace_before_checkout\":null,\"grace_after_checkout\":null,\"allow_users_for_attendance\":1}', '{\"ref_no_prefix\":\"1001001\",\"disable_editing_ingredient_qty\":true,\"enable_updating_product_price\":true}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 1, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"modifiers\",\"subscription\"]', 'd/m/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":\"CN\",\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', 'black', NULL, 1, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2022-01-06 01:55:38', '2022-04-07 04:08:36'),
(3, 'Water', 101, '2022-01-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 25.00, 9, 'Asia/Riyadh', 1, 'fifo', 0.00, 'includes', '1643107586_Zolal-Water.jpeg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"cmmsn_calculation_type\":\"invoice_value\",\"amount_rounding_method\":null,\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, 'after', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\"]', 'd/m/Y', '12', '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2022-01-25 21:13:38', '2022-01-26 04:26:47'),
(4, 'Retail', 101, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 10, 'Asia/Riyadh', 1, 'fifo', 0.00, 'includes', '1643107491_building-busines222.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"cmmsn_calculation_type\":\"invoice_value\",\"amount_rounding_method\":null,\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'after', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'd/m/Y', '12', '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2022-01-25 21:14:51', '2022-01-25 18:47:41'),
(5, 'Salonn', 101, '1970-01-01', NULL, 'VAT15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 11, 'Asia/Kuwait', 1, 'fifo', 0.00, 'includes', '1648362289_saloon2.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"cmmsn_calculation_type\":\"invoice_value\",\"amount_rounding_method\":null,\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"is_pos_subtotal_editable\":\"1\",\"enable_transaction_date\":\"1\",\"show_invoice_scheme\":\"1\",\"show_invoice_layout\":\"1\",\"print_on_suspend\":\"1\",\"show_pricing_on_product_sugesstion\":\"1\",\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, 13, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'd/m/Y', '12', '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', 'blue', NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2022-03-27 15:51:35', '2022-03-27 15:21:26');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int UNSIGNED NOT NULL,
  `invoice_layout_id` int UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int DEFAULT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'demo', 'جده', 'السعوديه', 'جده', 'جده', '32611', 1, 1, 1, 0, 1, 'browser', NULL, '123131321231', NULL, NULL, 'https://mline-sa.com/', NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-01-06 01:55:39', '2022-04-07 04:17:18'),
(3, 3, 'BL0001', 'Water', 'حي الفيصلية', 'jeddah', 'jeddah', 'jeddah', '96655', 3, 3, 3, NULL, 1, 'browser', NULL, '', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(4, 4, 'BL0001', 'Retail', 'مقابل محطة نفط', 'jeddah', 'jeddah', 'Jeddah', '96655', 4, 4, 4, NULL, 1, 'browser', NULL, '', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(5, 1, 'فرع التحلية', 'فرع التحلية', NULL, 'Jed', 'Jed', 'جدة', '123456', 1, 1, 1, 0, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"card\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"cheque\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-03-18 03:17:26', '2022-03-18 03:17:26'),
(6, 1, 'Alsafa', 'Alsafa', NULL, 'Makkah', 'Makkah', 'Makkah', '345566', 1, 1, 1, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-03-18 03:18:16', '2022-03-18 03:18:16'),
(7, 5, 'BL0001', 'Salonn', 'jeddah', 'Saudi Arabia', 'jed', 'jeddah', '96655', 5, 5, 5, NULL, 1, 'browser', NULL, '0550104684', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(8, 5, 'التحلية', 'صالون التحلية', 'التحلية', 'جدة', 'جدة', 'جدة', '12312', 6, 6, 6, 0, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:24:09', '2022-03-27 15:06:41'),
(9, 5, 'الصفا', 'صالون الصفا', 'الصفا', 'جدة', 'جدة', 'جدة', '454545', 6, 6, 6, 0, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:24:47', '2022-03-27 15:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int NOT NULL DEFAULT '0',
  `total_cheques` int NOT NULL DEFAULT '0',
  `denominations` text COLLATE utf8mb4_unicode_ci,
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2022-01-06 05:11:00', '2022-01-06 05:11:15'),
(2, 1, 1, 7, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2022-01-23 14:35:00', '2022-01-23 14:35:17'),
(3, 3, 3, 9, 'close', '2022-01-25 23:46:28', 256.2700, 0, 0, NULL, NULL, '2022-01-25 19:10:00', '2022-01-26 04:46:28'),
(4, 3, 3, 9, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2022-01-27 14:17:00', '2022-01-27 14:17:54'),
(5, 5, 8, 11, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2022-03-27 14:25:00', '2022-03-27 14:25:00'),
(6, 5, 8, 12, 'close', '2022-03-27 11:18:48', 345.0000, 0, 0, NULL, NULL, '2022-03-27 14:48:00', '2022-03-27 15:18:48'),
(7, 5, 8, 12, 'close', '2022-03-27 11:26:42', 190.0000, 1, 0, NULL, NULL, '2022-03-27 15:18:00', '2022-03-27 15:26:42'),
(8, 5, 8, 12, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2022-03-27 15:26:00', '2022-03-27 15:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int UNSIGNED NOT NULL,
  `cash_register_id` int UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 100.0000, 'cash', 'credit', 'initial', NULL, '2022-01-06 05:11:15', '2022-01-06 05:11:15'),
(2, 1, 150.0000, 'cash', 'credit', 'sell', 6, '2022-01-13 20:11:08', '2022-01-13 20:11:08'),
(3, 1, 150.0000, 'cash', 'credit', 'sell', 7, '2022-01-13 20:15:56', '2022-01-13 20:15:56'),
(4, 1, 130.4300, 'cash', 'credit', 'sell', 8, '2022-01-22 16:28:04', '2022-01-22 16:28:04'),
(5, 1, 130.4300, 'cash', 'credit', 'sell', 9, '2022-01-22 16:28:47', '2022-01-22 16:28:47'),
(6, 1, 510.2400, 'cash', 'credit', 'sell', 11, '2022-01-22 16:44:23', '2022-01-22 16:44:23'),
(7, 1, 130.4300, 'cash', 'debit', 'expense', 12, '2022-01-22 16:46:29', '2022-01-22 16:46:29'),
(8, 1, 382.6800, 'other', 'credit', 'sell', 13, '2022-01-22 17:01:00', '2022-01-22 17:01:00'),
(9, 1, 510.2400, 'other', 'credit', 'sell', 14, '2022-01-22 17:22:14', '2022-01-22 17:22:14'),
(10, 1, 10.6300, 'cash', 'credit', 'sell', 15, '2022-01-22 17:49:47', '2022-01-22 17:49:47'),
(11, 1, 21.0500, 'card', 'credit', 'sell', 16, '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(12, 1, 500.0000, 'cash', 'credit', 'sell', 17, '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(13, 1, -393.7000, 'cash', 'credit', 'sell', 17, '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(14, 1, 138.1900, 'cash', 'credit', 'sell', 18, '2022-01-22 19:13:20', '2022-01-22 19:13:20'),
(15, 1, 212.6000, 'cash', 'credit', 'sell', 19, '2022-01-22 19:16:31', '2022-01-22 19:16:31'),
(16, 1, 531.5000, 'cash', 'credit', 'sell', 20, '2022-01-22 21:06:19', '2022-01-22 21:06:19'),
(17, 1, 241.0600, 'cash', 'credit', 'sell', 21, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(18, 1, 100.0000, 'cash', 'credit', 'sell', 23, '2022-01-23 02:00:30', '2022-01-23 02:00:30'),
(19, 1, 115.0000, 'cash', 'credit', 'sell', 24, '2022-01-23 02:01:28', '2022-01-23 02:01:28'),
(20, 1, 115.0000, 'cash', 'credit', 'sell', 25, '2022-01-23 02:01:51', '2022-01-23 02:01:51'),
(21, 1, 132.2500, 'cash', 'credit', 'sell', 26, '2022-01-23 02:04:01', '2022-01-23 02:04:01'),
(22, 1, 132.2500, 'cash', 'credit', 'sell', 27, '2022-01-23 02:05:45', '2022-01-23 02:05:45'),
(23, 2, 100.0000, 'cash', 'credit', 'initial', NULL, '2022-01-23 14:35:17', '2022-01-23 14:35:17'),
(24, 1, 132.2500, 'cash', 'credit', 'sell', 29, '2022-01-23 20:05:23', '2022-01-23 20:05:23'),
(25, 1, 24.4500, 'cash', 'credit', 'sell', 30, '2022-01-23 20:07:54', '2022-01-23 20:07:54'),
(26, 3, 100.0000, 'cash', 'credit', 'initial', NULL, '2022-01-25 19:10:11', '2022-01-25 19:10:11'),
(27, 3, 16.5200, 'cash', 'credit', 'sell', 33, '2022-01-25 19:26:59', '2022-01-25 19:26:59'),
(28, 3, 19.0000, 'cash', 'credit', 'sell', 34, '2022-01-25 19:28:20', '2022-01-25 19:28:20'),
(29, 3, 24.1500, 'cash', 'credit', 'sell', 35, '2022-01-25 19:40:49', '2022-01-25 19:40:49'),
(30, 3, 48.3000, 'cash', 'credit', 'sell', 36, '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(31, 3, 48.3000, 'cash', 'credit', 'sell', 37, '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(32, 4, 200.0000, 'cash', 'credit', 'initial', NULL, '2022-01-27 14:17:54', '2022-01-27 14:17:54'),
(33, 1, 100.0000, 'cash', 'credit', 'sell', 40, '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(34, 1, 32.2500, 'card', 'credit', 'sell', 40, '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(35, 4, 24.1500, 'cash', 'credit', 'sell', 41, '2022-01-28 18:16:05', '2022-01-28 18:16:05'),
(36, 4, 24.1500, 'cash', 'credit', 'sell', 42, '2022-01-28 18:22:52', '2022-01-28 18:22:52'),
(37, 4, 24.1500, 'cash', 'credit', 'sell', 43, '2022-01-28 18:23:33', '2022-01-28 18:23:33'),
(38, 1, 316.9700, 'cash', 'credit', 'sell', 44, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(39, 1, 5000.0000, 'cash', 'credit', 'sell', 46, '2022-02-08 07:07:31', '2022-02-08 07:07:31'),
(40, 1, 132.2500, 'cash', 'credit', 'sell', 47, '2022-02-08 07:08:28', '2022-02-08 07:08:28'),
(41, 1, 264.5000, 'cash', 'credit', 'sell', 48, '2022-02-14 02:43:49', '2022-02-14 02:43:49'),
(42, 1, 132.2500, 'cash', 'credit', 'sell', 49, '2022-02-20 17:46:03', '2022-02-20 17:46:03'),
(43, 1, 132.2500, 'cash', 'credit', 'sell', 50, '2022-02-20 17:50:01', '2022-02-20 17:50:01'),
(44, 1, 132.2500, 'cash', 'credit', 'sell', 51, '2022-02-20 17:53:33', '2022-02-20 17:53:33'),
(45, 1, 132.2500, 'cash', 'credit', 'sell', 52, '2022-02-20 17:54:44', '2022-02-20 17:54:44'),
(46, 1, 132.2500, 'cash', 'credit', 'sell', 53, '2022-02-20 18:44:43', '2022-02-20 18:44:43'),
(47, 1, 437.0000, 'cash', 'credit', 'sell', 55, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(48, 1, 132.2500, 'cash', 'credit', 'sell', 58, '2022-02-22 07:00:55', '2022-02-22 07:00:55'),
(50, 5, 50.0000, 'cash', 'credit', 'initial', NULL, '2022-03-27 14:25:00', '2022-03-27 14:25:00'),
(51, 6, 100.0000, 'cash', 'credit', 'initial', NULL, '2022-03-27 14:48:19', '2022-03-27 14:48:19'),
(52, 6, 10.0000, 'cash', 'credit', 'sell', 60, '2022-03-27 14:48:27', '2022-03-27 14:48:27'),
(53, 6, 25.0000, 'cash', 'credit', 'sell', 61, '2022-03-27 14:49:59', '2022-03-27 14:49:59'),
(54, 6, 10.0000, 'cash', 'credit', 'sell', 62, '2022-03-27 14:53:59', '2022-03-27 14:53:59'),
(55, 6, 25.0000, 'cash', 'credit', 'sell', 63, '2022-03-27 14:58:54', '2022-03-27 14:58:54'),
(56, 6, 25.0000, 'cash', 'credit', 'sell', 64, '2022-03-27 14:59:05', '2022-03-27 14:59:05'),
(57, 6, 25.0000, 'cash', 'credit', 'sell', 65, '2022-03-27 15:01:16', '2022-03-27 15:01:16'),
(58, 6, 50.0000, 'cash', 'credit', 'sell', 66, '2022-03-27 15:07:55', '2022-03-27 15:07:55'),
(59, 6, 25.0000, 'cash', 'credit', 'sell', 68, '2022-03-27 15:08:35', '2022-03-27 15:08:35'),
(60, 6, 30.0000, 'cash', 'credit', 'sell', 69, '2022-03-27 15:09:44', '2022-03-27 15:09:44'),
(61, 6, 10.0000, 'cash', 'credit', 'sell', 70, '2022-03-27 15:12:48', '2022-03-27 15:12:48'),
(62, 6, 100.0000, 'cash', 'credit', 'sell', 71, '2022-03-27 15:13:19', '2022-03-27 15:13:19'),
(63, 6, -90.0000, 'cash', 'credit', 'sell', 71, '2022-03-27 15:13:19', '2022-03-27 15:13:19'),
(64, 7, 100.0000, 'cash', 'credit', 'initial', NULL, '2022-03-27 15:18:55', '2022-03-27 15:18:55'),
(65, 7, 20.0000, 'cash', 'credit', 'sell', 72, '2022-03-27 15:19:04', '2022-03-27 15:19:04'),
(66, 7, 25.0000, 'card', 'credit', 'sell', 73, '2022-03-27 15:19:13', '2022-03-27 15:19:13'),
(67, 7, 25.0000, 'cash', 'credit', 'sell', 74, '2022-03-27 15:19:47', '2022-03-27 15:19:47'),
(68, 7, 25.0000, 'cash', 'credit', 'sell', 75, '2022-03-27 15:20:30', '2022-03-27 15:20:30'),
(69, 7, 20.0000, 'cash', 'credit', 'sell', 77, '2022-03-27 15:25:16', '2022-03-27 15:25:16'),
(70, 8, 150.0000, 'cash', 'credit', 'initial', NULL, '2022-03-27 15:26:48', '2022-03-27 15:26:48'),
(71, 8, 30.0000, 'cash', 'credit', 'sell', 78, '2022-03-27 15:27:06', '2022-03-27 15:27:06'),
(72, 8, -10.0000, 'cash', 'credit', 'sell', 78, '2022-03-27 15:27:06', '2022-03-27 15:27:06'),
(73, 8, 20.0000, 'card', 'credit', 'sell', 79, '2022-03-27 15:28:41', '2022-03-27 15:28:41'),
(74, 8, 25.0000, 'cash', 'credit', 'sell', 80, '2022-03-27 15:28:47', '2022-03-27 15:28:47'),
(75, 8, 20.0000, 'cash', 'credit', 'sell', 81, '2022-03-27 15:29:04', '2022-03-27 15:29:04'),
(76, 8, 20.0000, 'cash', 'credit', 'sell', 84, '2022-03-27 15:32:30', '2022-03-27 15:32:30'),
(77, 8, 20.0000, 'cash', 'credit', 'sell', 85, '2022-03-27 15:32:58', '2022-03-27 15:32:58'),
(78, 8, 10.0000, 'cash', 'credit', 'sell', 86, '2022-03-27 15:34:51', '2022-03-27 15:34:51'),
(79, 1, 644.7200, 'cash', 'credit', 'sell', 87, '2022-04-05 04:52:01', '2022-04-05 04:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `woocommerce_cat_id` int DEFAULT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `woocommerce_cat_id`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'hghj', 1, '45', 0, 1, NULL, 'product', NULL, NULL, NULL, '2022-01-06 00:10:04', '2022-01-06 00:10:04'),
(2, 'العصيرات', 1, '1', 0, 1, NULL, 'product', 'العصيرات', NULL, NULL, '2022-01-13 19:06:44', '2022-01-13 19:06:44'),
(3, 'البسكويت', 1, '2', 0, 1, NULL, 'product', 'البسكويت', NULL, NULL, '2022-01-13 19:07:10', '2022-01-13 19:07:10'),
(4, 'حلويات', 1, '23', 0, 1, NULL, 'product', NULL, NULL, NULL, '2022-01-22 17:04:58', '2022-01-22 17:05:09'),
(5, 'كراتين', 3, '1', 0, 9, NULL, 'product', 'كراتين مياه', NULL, NULL, '2022-01-25 19:05:10', '2022-01-25 19:05:10'),
(6, 'التعبئة', 3, '2', 0, 9, NULL, 'product', 'تعبئة المياه', NULL, NULL, '2022-01-25 19:05:26', '2022-01-25 19:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_rp` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_custom_field_details` longtext COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-06 01:55:38', '2022-01-06 01:55:38'),
(2, 1, 'customer', NULL, 'مركز العربي mama', 'مركز العربي', 'mama', NULL, NULL, NULL, 'CO0002', 'active', '30120020005002', NULL, NULL, NULL, 'مكة', 'الشوقية', NULL, NULL, '0545451441', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 16:57:27', '2022-01-22 16:57:27'),
(3, 1, 'customer', NULL, '', NULL, NULL, NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '055', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 19:15:37', '2022-01-22 19:15:37'),
(5, 3, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 9, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(6, 4, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 10, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(7, 3, 'supplier', 'مصنع الروافد التجاري', '', NULL, NULL, NULL, NULL, NULL, 'CO0002', 'active', '3000030000030000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '05555566666', NULL, NULL, NULL, NULL, NULL, 9, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 19:13:48', '2022-01-25 19:13:48'),
(8, 1, 'customer', NULL, 'اشرف شاكر', NULL, 'اشرف شاكر', NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123131321231', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-08 06:52:29', '2022-02-08 06:52:29'),
(9, 5, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 11, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:51:35', '2022-03-27 15:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `selling_price_group_id` int DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `price_calculation_type`, `selling_price_group_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'مندوب', 0.00, 'percentage', NULL, 1, '2022-01-22 18:58:30', '2022-01-22 18:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `spg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int NOT NULL,
  `variation_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `notable_id` int NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_allowances_and_deductions`
--

CREATE TABLE `essentials_allowances_and_deductions` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('allowance','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `amount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_attendances`
--

CREATE TABLE `essentials_attendances` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `business_id` int NOT NULL,
  `clock_in_time` datetime DEFAULT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `essentials_shift_id` int DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_in_note` text COLLATE utf8mb4_unicode_ci,
  `clock_out_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_attendances`
--

INSERT INTO `essentials_attendances` (`id`, `user_id`, `business_id`, `clock_in_time`, `clock_out_time`, `essentials_shift_id`, `ip_address`, `clock_in_note`, `clock_out_note`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '2022-01-23 09:30:00', '2022-01-22 17:00:00', NULL, '31.166.174.92', NULL, NULL, '2022-01-23 14:46:18', '2022-01-23 14:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_documents`
--

CREATE TABLE `essentials_documents` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_document_shares`
--

CREATE TABLE `essentials_document_shares` (
  `id` int UNSIGNED NOT NULL,
  `document_id` int NOT NULL,
  `value_type` enum('user','role') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_holidays`
--

CREATE TABLE `essentials_holidays` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_leaves`
--

CREATE TABLE `essentials_leaves` (
  `id` int UNSIGNED NOT NULL,
  `essentials_leave_type_id` int DEFAULT NULL,
  `business_id` int NOT NULL,
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_leave_types`
--

CREATE TABLE `essentials_leave_types` (
  `id` int UNSIGNED NOT NULL,
  `leave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_leave_count` int DEFAULT NULL,
  `leave_count_interval` enum('month','year') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_leave_types`
--

INSERT INTO `essentials_leave_types` (`id`, `leave_type`, `max_leave_count`, `leave_count_interval`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'اجازة مرضية', 3, 'year', 1, '2022-01-23 14:32:54', '2022-01-23 14:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_messages`
--

CREATE TABLE `essentials_messages` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_reminders`
--

CREATE TABLE `essentials_reminders` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `repeat` enum('one_time','every_day','every_week','every_month') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_reminders`
--

INSERT INTO `essentials_reminders` (`id`, `business_id`, `user_id`, `name`, `date`, `time`, `repeat`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'تنبيه - تنبيه', '2022-01-23', '03:05:00', 'one_time', '2022-01-23 20:04:05', '2022-01-23 20:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_shifts`
--

CREATE TABLE `essentials_shifts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed_shift','flexible_shift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed_shift',
  `business_id` int NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `holidays` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_shifts`
--

INSERT INTO `essentials_shifts` (`id`, `name`, `type`, `business_id`, `start_time`, `end_time`, `holidays`, `created_at`, `updated_at`) VALUES
(1, 'حضور صباحي', 'fixed_shift', 1, '09:00:00', '17:00:00', '[\"friday\",\"saturday\"]', '2022-01-23 14:42:01', '2022-01-23 14:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_todos_users`
--

CREATE TABLE `essentials_todos_users` (
  `todo_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_todos_users`
--

INSERT INTO `essentials_todos_users` (`todo_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `essentials_todo_comments`
--

CREATE TABLE `essentials_todo_comments` (
  `id` int UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int NOT NULL,
  `comment_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_to_dos`
--

CREATE TABLE `essentials_to_dos` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `task_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_hours` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_to_dos`
--

INSERT INTO `essentials_to_dos` (`id`, `business_id`, `task`, `date`, `end_date`, `task_id`, `description`, `status`, `estimated_hours`, `priority`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'dgh', '2022-01-05', NULL, '2022/0001', NULL, 'new', NULL, 'low', 1, '2022-01-05 23:59:07', '2022-01-05 23:59:07'),
(2, 1, 'dgh', '2022-01-05', NULL, '2022/0002', NULL, 'new', '8', 'low', 1, '2022-01-05 23:59:29', '2022-01-05 23:59:29'),
(3, 1, 'dfghjk', '2022-02-07', '2022-02-08', '2022/0003', 'dvfv', 'in_progress', '8', 'high', 1, '2022-02-07 22:07:15', '2022-02-07 22:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_user_allowance_and_deductions`
--

CREATE TABLE `essentials_user_allowance_and_deductions` (
  `user_id` int NOT NULL,
  `allowance_deduction_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_user_shifts`
--

CREATE TABLE `essentials_user_shifts` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `essentials_shift_id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_agent_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT '0',
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int UNSIGNED NOT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT '0',
  `qr_code_fields` text COLLATE utf8mb4_unicode_ci,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'رقم الفاتوره', NULL, 'فاتوره ضريبيه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'المجموع الفرعى', 'الخصم', 'الضريبه', 'الاجمالى', NULL, 'اجمالى المتبقى', 'اجمالى المدفوع', 0, NULL, NULL, 'التاريخ', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'المنتج', 'الكميه', 'سعر الوحده', 'المجموع الفرعى', NULL, NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'العميل', NULL, 0, 0, '#000000', NULL, '{\"repair\":{\"repair_status_label\":null,\"repair_warranty_label\":null,\"brand_label\":null,\"device_label\":null,\"model_no_label\":null,\"serial_no_label\":null,\"defects_label\":null,\"repair_checklist_label\":null}}', '{\"proforma_heading\":null,\"sales_order_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"num_to_word_format\":\"international\",\"tax_summary_label\":null}', 1, 1, 1, '[\"business_name\",\"address\",\"tax_1\",\"tax_2\",\"invoice_no\",\"invoice_datetime\",\"subtotal\",\"total_amount\",\"total_tax\",\"customer_name\"]', 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-06 01:55:39', '2022-04-07 04:14:34'),
(3, 'Default', NULL, 'رقم الفاتورة :', NULL, 'فاتورة ضريبية مبسطة', NULL, NULL, NULL, NULL, NULL, 'فاتورة أجلة', 'فاتورة نقدية', NULL, 'المجموع', 'الخصم', 'الضريبة', 'الاجمالي', NULL, 'Total Due', 'المدفوع', 0, NULL, 'الرقم الضريبي للعميل :', 'التاريخ و الوقت :', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'المنتج', 'الكمية', 'السعر', 'المجموع', NULL, '1643366156_logo2.jpeg', 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 'العميل :', NULL, 0, 0, '#000000', '<p style=\"text-align: center;\"><span style=\"color: #e03e2d;\"><strong>شكرا لزيارتكم ,,, نتطلع لرؤيتكم مرة أخرى</strong></span></p>', NULL, '{\"proforma_heading\":null,\"sales_order_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"num_to_word_format\":\"indian\",\"tax_summary_label\":null}', 1, 3, 1, '[\"business_name\",\"tax_1\",\"invoice_no\",\"invoice_datetime\",\"subtotal\",\"total_tax\",\"customer_name\",\"invoice_url\"]', 'elegant', NULL, NULL, NULL, '[\"\\u0627\\u0644\\u0636\\u0631\\u064a\\u0628\\u0629\\u0629\\u0629\\u0629\\u0629\",null,null,null]', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-25 21:13:38', '2022-01-28 18:39:39'),
(4, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 4, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(5, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 5, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(6, 'POS', NULL, 'الفاتورة رقم.', 'رقم الإقتباس', 'فاتورة ضريبية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'بيان سعر', 'المجموع', 'الخصم', 'الضريبية', 'المجموع', 'تقريب الى', 'الدين', 'المدفوع', 0, NULL, NULL, 'تاريخ', NULL, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 'منتج', 'الكمية', 'سعر الوحدة', 'المجموع', 'HSN', '1648367921_saloon2.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'عميل', 'سمسار', 0, 0, '#000000', '<p>شكرا لزيارتكم ,,, نتطبع لرؤيتكم مرة أخرى</p>', NULL, '{\"proforma_heading\":\"\\u0627\\u0644\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0623\\u0648\\u0644\\u064a\\u0629\",\"sales_order_heading\":\"\\u0637\\u0644\\u0628 \\u0627\\u0644\\u0645\\u0628\\u064a\\u0639\\u0627\\u062a\",\"due_date_label\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0627\\u0633\\u062a\\u062d\\u0642\\u0627\\u0642\",\"total_quantity_label\":\"Total Quantity\",\"item_discount_label\":\"Discount\",\"num_to_word_format\":\"international\",\"tax_summary_label\":null}', 0, 5, 1, NULL, 'slim', 'Credit Note', 'الرقم المرجعي', 'Credit Amount', NULL, 0, NULL, 'الباقى', NULL, NULL, NULL, '2022-03-27 14:58:41', '2022-03-27 15:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int DEFAULT NULL,
  `invoice_count` int NOT NULL DEFAULT '0',
  `total_digits` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'year', NULL, 1, 35, 4, 1, '2022-01-06 01:55:39', '2022-04-05 04:52:01'),
(3, 3, 'Default', 'year', NULL, 1, 9, 5, 1, '2022-01-25 21:13:38', '2022-01-28 18:23:33'),
(4, 4, 'Default', 'blank', '', 1, 0, 4, 1, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(5, 5, 'Default', 'year', NULL, 1, 6, 4, 0, '2022-03-27 15:51:35', '2022-03-27 15:04:02'),
(6, 5, 'POS', 'year', NULL, 1, 18, 4, 1, '2022-03-27 15:04:02', '2022-03-27 15:34:51');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `woocommerce_media_id` int DEFAULT NULL,
  `model_media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `woocommerce_media_id`, `model_media_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 5, '1648366186_379952333_20210117174605296.jpg', NULL, 11, 'App\\Variation', NULL, NULL, 12, '2022-03-27 14:29:46', '2022-03-27 14:29:46'),
(2, 5, '1648366229_486747667_haier1.jpg', NULL, 11, 'App\\Variation', NULL, NULL, 11, '2022-03-27 14:30:29', '2022-03-27 14:30:29'),
(3, 5, '1648366942_747479344_mask.jpg', NULL, 11, 'App\\Variation', NULL, NULL, 13, '2022-03-27 14:42:22', '2022-03-27 14:42:22'),
(4, 5, '1648366991_1010353617_seshwarr.webp', NULL, 11, 'App\\Variation', NULL, NULL, 14, '2022-03-27 14:43:11', '2022-03-27 14:43:11'),
(5, 5, '1648367020_405317800_fardhaier.jpg', NULL, 11, 'App\\Variation', NULL, NULL, 15, '2022-03-27 14:43:40', '2022-03-27 14:43:40'),
(6, 5, '1648367046_1741739189_zeqencolore.jpg', NULL, 11, 'App\\Variation', NULL, NULL, 16, '2022-03-27 14:44:06', '2022-03-27 14:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `mfg_ingredient_groups`
--

CREATE TABLE `mfg_ingredient_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mfg_recipes`
--

CREATE TABLE `mfg_recipes` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `variation_id` int NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `waste_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ingredients_cost` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `extra_cost` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `production_cost_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `total_quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(22,4) NOT NULL,
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mfg_recipe_ingredients`
--

CREATE TABLE `mfg_recipe_ingredients` (
  `id` int UNSIGNED NOT NULL,
  `mfg_recipe_id` int UNSIGNED NOT NULL,
  `variation_id` int NOT NULL,
  `mfg_ingredient_group_id` int DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `waste_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `sub_unit_id` int DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(259, '2021_03_11_120229_add_sales_order_columns', 1),
(260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(261, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(273, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1),
(274, '2021_09_01_063110_add_spg_column_to_discounts_table', 1),
(275, '2021_09_03_061528_modify_cash_register_transactions_table', 1),
(276, '2021_10_05_061658_add_source_column_to_transactions_table', 1),
(277, '2019_07_15_114211_add_manufacturing_module_version_to_system_table', 2),
(278, '2019_07_15_114403_create_mfg_recipes_table', 2),
(279, '2019_07_18_180217_add_production_columns_to_transactions_table', 2),
(280, '2019_07_26_110753_add_manufacturing_settings_column_to_business_table', 2),
(281, '2019_07_26_170450_add_manufacturing_permissions', 2),
(282, '2019_08_08_110035_create_mfg_recipe_ingredients_table', 2),
(283, '2019_08_08_172837_add_recipe_add_edit_permissions', 2),
(284, '2019_08_12_114610_add_ingredient_waste_percent_columns', 2),
(285, '2019_11_05_115136_create_ingredient_groups_table', 2),
(286, '2020_02_22_120303_add_column_to_mfg_recipe_ingredients_table', 2),
(287, '2020_08_19_103831_add_production_cost_type_to_recipe_and_transaction_table', 2),
(288, '2018_06_27_185405_create_packages_table', 3),
(289, '2018_06_28_182803_create_subscriptions_table', 3),
(290, '2018_07_17_182021_add_rows_to_system_table', 3),
(291, '2018_07_19_131721_add_options_to_packages_table', 3),
(292, '2018_08_17_155534_add_min_termination_alert_days', 3),
(293, '2018_08_28_105945_add_business_based_username_settings_to_system_table', 3),
(294, '2018_08_30_105906_add_superadmin_communicator_logs_table', 3),
(295, '2018_11_02_130636_add_custom_permissions_to_packages_table', 3),
(296, '2018_11_05_161848_add_more_fields_to_packages_table', 3),
(297, '2018_12_10_124621_modify_system_table_values_null_default', 3),
(298, '2019_05_10_135434_add_missing_database_column_indexes', 3),
(299, '2019_08_16_115300_create_superadmin_frontend_pages_table', 3),
(300, '2018_10_01_151252_create_documents_table', 4),
(301, '2018_10_02_151803_create_document_shares_table', 4),
(302, '2018_10_09_134558_create_reminders_table', 4),
(303, '2018_11_16_170756_create_to_dos_table', 4),
(304, '2019_02_22_120329_essentials_messages', 4),
(305, '2019_02_22_161513_add_message_permissions', 4),
(306, '2019_03_29_164339_add_essentials_version_to_system_table', 4),
(307, '2019_05_17_153306_create_essentials_leave_types_table', 4),
(308, '2019_05_17_175921_create_essentials_leaves_table', 4),
(309, '2019_05_21_154517_add_essentials_settings_columns_to_business_table', 4),
(310, '2019_05_21_181653_create_table_essentials_attendance', 4),
(311, '2019_05_30_110049_create_essentials_payrolls_table', 4),
(312, '2019_06_04_105723_create_essentials_holidays_table', 4),
(313, '2019_06_28_134217_add_payroll_columns_to_transactions_table', 4),
(314, '2019_08_26_103520_add_approve_leave_permission', 4),
(315, '2019_08_27_103724_create_essentials_allowance_and_deduction_table', 4),
(316, '2019_08_27_105236_create_essentials_user_allowances_and_deductions', 4),
(317, '2019_09_20_115906_add_more_columns_to_essentials_to_dos_table', 4),
(318, '2019_09_23_120439_create_essentials_todo_comments_table', 4),
(319, '2019_12_05_170724_add_hrm_columns_to_users_table', 4),
(320, '2019_12_09_105809_add_allowance_and_deductions_permission', 4),
(321, '2020_03_28_152838_create_essentials_shift_table', 4),
(322, '2020_03_30_162029_create_user_shifts_table', 4),
(323, '2020_03_31_134558_add_shift_id_to_attendance_table', 4),
(324, '2020_09_29_184909_add_product_catalogue_version', 5),
(325, '2018_10_10_110400_add_module_version_to_system_table', 6),
(326, '2018_10_10_122845_add_woocommerce_api_settings_to_business_table', 6),
(327, '2018_10_10_162041_add_woocommerce_category_id_to_categories_table', 6),
(328, '2018_10_11_173839_create_woocommerce_sync_logs_table', 6),
(329, '2018_10_16_123522_add_woocommerce_tax_rate_id_column_to_tax_rates_table', 6),
(330, '2018_10_23_111555_add_woocommerce_attr_id_column_to_variation_templates_table', 6),
(331, '2018_12_03_163945_add_woocommerce_permissions', 6),
(332, '2019_02_18_154414_change_woocommerce_sync_logs_table', 6),
(333, '2019_04_19_174129_add_disable_woocommerce_sync_column_to_products_table', 6),
(334, '2019_06_08_132440_add_woocommerce_wh_oc_secret_column_to_business_table', 6),
(335, '2019_10_01_171828_add_woocommerce_media_id_columns', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 2),
(80, 'App\\User', 3),
(80, 'App\\User', 4),
(80, 'App\\User', 7),
(82, 'App\\User', 8),
(103, 'App\\User', 12),
(104, 'App\\User', 13);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 2),
(1, 'App\\User', 3),
(3, 'App\\User', 4),
(2, 'App\\User', 7),
(2, 'App\\User', 8),
(6, 'App\\User', 9),
(8, 'App\\User', 10),
(10, 'App\\User', 11),
(11, 'App\\User', 12),
(11, 'App\\User', 13);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('5f55e34f-b50f-445a-a7e1-ffc572f2168b', 'Modules\\Essentials\\Notifications\\PayrollNotification', 'App\\User', 7, '{\"month\":\"01\",\"year\":\"2022\",\"ref_no\":\"12022\\/0001\",\"action\":\"created\",\"created_by\":1}', NULL, '2022-01-23 14:43:31', '2022-01-23 14:43:31'),
('a748f826-d8ca-4f69-8e14-da9448523e5b', 'Modules\\Essentials\\Notifications\\NewTaskNotification', 'App\\User', 2, '{\"assigned_by\":1,\"task_id\":\"2022\\/0003\",\"id\":3}', NULL, '2022-02-07 22:07:15', '2022-02-07 22:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `whatsapp_text` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(10, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(11, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(12, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(13, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(14, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(15, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(16, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(17, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(18, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(19, 3, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(20, 3, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(21, 3, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(22, 3, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(23, 3, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(24, 3, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(25, 3, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(26, 3, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(27, 3, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(28, 4, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(29, 4, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(30, 4, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(31, 4, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(32, 4, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(33, 4, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(34, 4, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(35, 4, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(36, 4, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(37, 5, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(38, 5, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(39, 5, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(40, 5, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(41, 5, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(42, 5, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(43, 5, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(44, 5, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(45, 5, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_count` int NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int NOT NULL,
  `product_count` int NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable tables',
  `invoice_count` int NOT NULL,
  `interval` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval_count` int NOT NULL,
  `trial_days` int NOT NULL,
  `price` decimal(22,4) NOT NULL,
  `custom_permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_one_time` tinyint(1) NOT NULL DEFAULT '0',
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT '0',
  `custom_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_link_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `location_count`, `user_count`, `product_count`, `bookings`, `kitchen`, `order_screen`, `tables`, `invoice_count`, `interval`, `interval_count`, `trial_days`, `price`, `custom_permissions`, `created_by`, `sort_order`, `is_active`, `is_private`, `is_one_time`, `enable_custom_link`, `custom_link`, `custom_link_text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'test', 'kk,', 0, 0, 0, 0, 0, 0, 0, 0, 'years', 1, 50, 0.0000, '{\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2022-01-06 02:33:49', '2022-01-06 02:33:49'),
(2, 'شركة احمد سالم', 'شركة احمد - حلويات', 2, 3, 100, 0, 0, 0, 0, 100, 'days', 100, 100, 100.0000, '{\"essentials_module\":\"1\",\"productcatalogue_module\":\"1\"}', 1, 1, 1, 0, 0, 0, '', '', '2022-01-23 20:59:54', '2022-01-23 16:30:17', '2022-01-23 20:59:54'),
(3, 'Watter', 'Watter', 5, 0, 0, 0, 0, 0, 0, 0, 'years', 1, 365, 0.0000, '{\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 1, 1, 1, 1, 1, 'lolo', 'koko', NULL, '2022-01-25 21:09:22', '2022-01-28 20:47:59'),
(4, 'Retail', 'Retail', 5, 0, 0, 0, 0, 0, 0, 0, 'years', 1, 365, 0.0000, '{\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 1, 1, 1, 1, 0, '', '', NULL, '2022-01-25 21:10:12', '2022-01-25 21:10:12'),
(5, 'Saloon', 'Salon', 5, 10, 0, 0, 0, 0, 0, 0, 'years', 1, 365, 100.0000, '{\"essentials_module\":\"1\"}', 1, 1, 1, 0, 1, 0, '', '', NULL, '2022-03-27 15:46:55', '2022-03-27 15:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2022-01-06 01:50:15', NULL),
(2, 'direct_sell.access', 'web', '2022-01-06 01:50:15', NULL),
(3, 'product.opening_stock', 'web', '2022-01-06 01:50:17', '2022-01-06 01:50:17'),
(4, 'crud_all_bookings', 'web', '2022-01-06 01:50:17', '2022-01-06 01:50:17'),
(5, 'crud_own_bookings', 'web', '2022-01-06 01:50:17', '2022-01-06 01:50:17'),
(6, 'access_default_selling_price', 'web', '2022-01-06 01:50:17', '2022-01-06 01:50:17'),
(7, 'purchase.payments', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(8, 'sell.payments', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(9, 'edit_product_price_from_sale_screen', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(11, 'roles.view', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(12, 'roles.create', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(13, 'roles.update', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(14, 'roles.delete', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(15, 'account.access', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(16, 'discount.access', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(17, 'view_purchase_price', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(18, 'view_own_sell_only', 'web', '2022-01-06 01:50:18', '2022-01-06 01:50:18'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2022-01-06 01:50:19', '2022-01-06 01:50:19'),
(20, 'edit_product_price_from_pos_screen', 'web', '2022-01-06 01:50:19', '2022-01-06 01:50:19'),
(21, 'access_shipping', 'web', '2022-01-06 01:50:19', '2022-01-06 01:50:19'),
(22, 'purchase.update_status', 'web', '2022-01-06 01:50:19', '2022-01-06 01:50:19'),
(23, 'list_drafts', 'web', '2022-01-06 01:50:19', '2022-01-06 01:50:19'),
(24, 'list_quotations', 'web', '2022-01-06 01:50:19', '2022-01-06 01:50:19'),
(25, 'view_cash_register', 'web', '2022-01-06 01:50:20', '2022-01-06 01:50:20'),
(26, 'close_cash_register', 'web', '2022-01-06 01:50:20', '2022-01-06 01:50:20'),
(27, 'print_invoice', 'web', '2022-01-06 01:50:21', '2022-01-06 01:50:21'),
(28, 'user.view', 'web', '2022-01-06 01:50:22', NULL),
(29, 'user.create', 'web', '2022-01-06 01:50:22', NULL),
(30, 'user.update', 'web', '2022-01-06 01:50:22', NULL),
(31, 'user.delete', 'web', '2022-01-06 01:50:22', NULL),
(32, 'supplier.view', 'web', '2022-01-06 01:50:22', NULL),
(33, 'supplier.create', 'web', '2022-01-06 01:50:22', NULL),
(34, 'supplier.update', 'web', '2022-01-06 01:50:22', NULL),
(35, 'supplier.delete', 'web', '2022-01-06 01:50:22', NULL),
(36, 'customer.view', 'web', '2022-01-06 01:50:22', NULL),
(37, 'customer.create', 'web', '2022-01-06 01:50:22', NULL),
(38, 'customer.update', 'web', '2022-01-06 01:50:22', NULL),
(39, 'customer.delete', 'web', '2022-01-06 01:50:22', NULL),
(40, 'product.view', 'web', '2022-01-06 01:50:22', NULL),
(41, 'product.create', 'web', '2022-01-06 01:50:22', NULL),
(42, 'product.update', 'web', '2022-01-06 01:50:22', NULL),
(43, 'product.delete', 'web', '2022-01-06 01:50:22', NULL),
(44, 'purchase.view', 'web', '2022-01-06 01:50:22', NULL),
(45, 'purchase.create', 'web', '2022-01-06 01:50:22', NULL),
(46, 'purchase.update', 'web', '2022-01-06 01:50:22', NULL),
(47, 'purchase.delete', 'web', '2022-01-06 01:50:22', NULL),
(48, 'sell.view', 'web', '2022-01-06 01:50:22', NULL),
(49, 'sell.create', 'web', '2022-01-06 01:50:22', NULL),
(50, 'sell.update', 'web', '2022-01-06 01:50:22', NULL),
(51, 'sell.delete', 'web', '2022-01-06 01:50:22', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2022-01-06 01:50:22', NULL),
(53, 'contacts_report.view', 'web', '2022-01-06 01:50:22', NULL),
(54, 'stock_report.view', 'web', '2022-01-06 01:50:22', NULL),
(55, 'tax_report.view', 'web', '2022-01-06 01:50:22', NULL),
(56, 'trending_product_report.view', 'web', '2022-01-06 01:50:22', NULL),
(57, 'register_report.view', 'web', '2022-01-06 01:50:22', NULL),
(58, 'sales_representative.view', 'web', '2022-01-06 01:50:22', NULL),
(59, 'expense_report.view', 'web', '2022-01-06 01:50:22', NULL),
(60, 'business_settings.access', 'web', '2022-01-06 01:50:22', NULL),
(61, 'barcode_settings.access', 'web', '2022-01-06 01:50:22', NULL),
(62, 'invoice_settings.access', 'web', '2022-01-06 01:50:22', NULL),
(63, 'brand.view', 'web', '2022-01-06 01:50:22', NULL),
(64, 'brand.create', 'web', '2022-01-06 01:50:22', NULL),
(65, 'brand.update', 'web', '2022-01-06 01:50:22', NULL),
(66, 'brand.delete', 'web', '2022-01-06 01:50:22', NULL),
(67, 'tax_rate.view', 'web', '2022-01-06 01:50:22', NULL),
(68, 'tax_rate.create', 'web', '2022-01-06 01:50:22', NULL),
(69, 'tax_rate.update', 'web', '2022-01-06 01:50:22', NULL),
(70, 'tax_rate.delete', 'web', '2022-01-06 01:50:22', NULL),
(71, 'unit.view', 'web', '2022-01-06 01:50:22', NULL),
(72, 'unit.create', 'web', '2022-01-06 01:50:22', NULL),
(73, 'unit.update', 'web', '2022-01-06 01:50:22', NULL),
(74, 'unit.delete', 'web', '2022-01-06 01:50:22', NULL),
(75, 'category.view', 'web', '2022-01-06 01:50:22', NULL),
(76, 'category.create', 'web', '2022-01-06 01:50:22', NULL),
(77, 'category.update', 'web', '2022-01-06 01:50:22', NULL),
(78, 'category.delete', 'web', '2022-01-06 01:50:22', NULL),
(79, 'expense.access', 'web', '2022-01-06 01:50:22', NULL),
(80, 'access_all_locations', 'web', '2022-01-06 01:50:22', NULL),
(81, 'dashboard.data', 'web', '2022-01-06 01:50:22', NULL),
(82, 'location.1', 'web', '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(83, 'manufacturing.access_recipe', 'web', '2022-01-05 23:38:34', '2022-01-05 23:38:34'),
(84, 'manufacturing.access_production', 'web', '2022-01-05 23:38:34', '2022-01-05 23:38:34'),
(85, 'manufacturing.add_recipe', 'web', '2022-01-05 23:38:34', '2022-01-05 23:38:34'),
(86, 'manufacturing.edit_recipe', 'web', '2022-01-05 23:38:34', '2022-01-05 23:38:34'),
(87, 'essentials.create_message', 'web', '2022-01-05 23:47:09', '2022-01-05 23:47:09'),
(88, 'essentials.view_message', 'web', '2022-01-05 23:47:09', '2022-01-05 23:47:09'),
(89, 'essentials.approve_leave', 'web', '2022-01-05 23:47:09', '2022-01-05 23:47:09'),
(90, 'essentials.assign_todos', 'web', '2022-01-05 23:47:09', '2022-01-05 23:47:09'),
(91, 'essentials.add_allowance_and_deduction', 'web', '2022-01-05 23:47:09', '2022-01-05 23:47:09'),
(92, 'woocommerce.syc_categories', 'web', '2022-01-05 23:49:42', '2022-01-05 23:49:42'),
(93, 'woocommerce.sync_products', 'web', '2022-01-05 23:49:42', '2022-01-05 23:49:42'),
(94, 'woocommerce.sync_orders', 'web', '2022-01-05 23:49:42', '2022-01-05 23:49:42'),
(95, 'woocommerce.map_tax_rates', 'web', '2022-01-05 23:49:42', '2022-01-05 23:49:42'),
(96, 'woocommerce.access_woocommerce_api_settings', 'web', '2022-01-05 23:49:42', '2022-01-05 23:49:42'),
(97, 'location.2', 'web', '2022-01-23 16:26:49', '2022-01-23 16:26:49'),
(98, 'location.3', 'web', '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(99, 'location.4', 'web', '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(100, 'location.5', 'web', '2022-03-18 03:17:26', '2022-03-18 03:17:26'),
(101, 'location.6', 'web', '2022-03-18 03:18:16', '2022-03-18 03:18:16'),
(102, 'location.7', 'web', '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(103, 'location.8', 'web', '2022-03-27 14:24:09', '2022-03-27 14:24:09'),
(104, 'location.9', 'web', '2022-03-27 14:24:47', '2022-03-27 14:24:47'),
(105, 'view_export_buttons', 'web', '2022-03-27 15:28:22', '2022-03-27 15:28:22'),
(106, 'access_own_sell_return', 'web', '2022-03-27 15:31:28', '2022-03-27 15:31:28'),
(107, 'direct_sell.view', 'web', '2022-03-27 15:31:28', '2022-03-27 15:31:28'),
(108, 'access_printers', 'web', '2022-03-27 15:34:36', '2022-03-27 15:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`id`, `business_id`, `name`, `connection_type`, `capability_profile`, `char_per_line`, `ip_address`, `port`, `path`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 5, 'Printer1', 'windows', 'simple', '42', '', '', 'COM1', 11, '2022-03-27 15:12:38', '2022-03-27 15:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `tax` int UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_media_id` int DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `woocommerce_product_id` int DEFAULT NULL,
  `woocommerce_disable_sync` tinyint(1) NOT NULL DEFAULT '0',
  `warranty_id` int DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'DAVID IVE', 1, 'single', 1, NULL, NULL, 1, NULL, 1, 'inclusive', 1, 58556.0000, '054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-01-06 00:38:56', '2022-01-23 01:57:57'),
(2, 'بيبسي 330 مل', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 10.0000, '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-01-13 19:01:12', '2022-01-13 19:01:12'),
(3, 'كيبورد', 1, 'single', 3, NULL, NULL, 2, NULL, 1, 'inclusive', 0, 0.0000, '0003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-01-13 20:07:54', '2022-01-13 20:17:35'),
(4, 'غريبة', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0004', 'C128', NULL, NULL, 1, '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-01-22 16:35:12', '2022-01-22 16:35:12'),
(5, 'برازق', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0005', 'C128', NULL, NULL, 1, '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-01-22 16:43:16', '2022-01-22 16:43:16'),
(6, 'معمول', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, 1000.0000, '0006', 'C128', NULL, NULL, 1, '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-01-22 17:04:08', '2022-01-22 17:04:08'),
(7, 'DAVID IVE2', 1, 'single', 1, NULL, 1, 3, NULL, 1, 'exclusive', 1, 100.0000, '(((((((((((((((((', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-01-23 01:59:54', '2022-01-23 01:59:54'),
(8, 'كرتون مياه بيرين 330 مل', 3, 'single', 8, NULL, 2, 5, NULL, 2, 'inclusive', 1, 10.0000, '0008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1643109129_41c-QLdnk5L._AC_SY1000_.jpg', NULL, NULL, 9, NULL, 0, NULL, 0, 0, '2022-01-25 18:54:26', '2022-01-25 19:16:57'),
(9, 'كرتون مياه الصفا 330', 3, 'single', 8, NULL, 3, 5, NULL, NULL, 'inclusive', 1, 10.0000, '0009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1643108224_alsafawater.jpg', NULL, NULL, 9, NULL, 0, NULL, 0, 0, '2022-01-25 18:57:04', '2022-01-25 19:42:35'),
(10, 'استرتش 30 سم', 1, 'single', 3, NULL, 1, 4, NULL, NULL, 'inclusive', 1, 20.0000, '48', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, '2022-02-08 07:00:09', '2022-02-08 07:00:09'),
(11, 'حلاقة شعر', 5, 'single', 13, NULL, NULL, NULL, NULL, NULL, 'exclusive', 0, 0.0000, '0011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, 0, NULL, 0, 0, '2022-03-27 14:26:06', '2022-03-27 14:49:15'),
(12, 'حلاقة دقن', 5, 'single', 13, NULL, NULL, NULL, NULL, NULL, 'exclusive', 0, 0.0000, '0012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, 0, NULL, 0, 0, '2022-03-27 14:29:46', '2022-03-27 14:49:07'),
(13, 'تنظيف بشره', 5, 'single', 13, NULL, NULL, NULL, NULL, NULL, 'exclusive', 0, 0.0000, '0013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, 0, NULL, 0, 0, '2022-03-27 14:42:22', '2022-03-27 14:48:59'),
(14, 'سشوار', 5, 'single', 13, NULL, NULL, NULL, NULL, NULL, 'exclusive', 0, 0.0000, '0014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, 0, NULL, 0, 0, '2022-03-27 14:43:11', '2022-03-27 14:49:27'),
(15, 'فرد شعر', 5, 'single', 13, NULL, NULL, NULL, NULL, NULL, 'exclusive', 0, 0.0000, '0015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, 0, NULL, 0, 0, '2022-03-27 14:43:40', '2022-03-27 14:43:40'),
(16, 'صبغة دقن', 5, 'single', 13, NULL, NULL, NULL, NULL, NULL, 'exclusive', 0, 0.0000, '0016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, 0, NULL, 0, 0, '2022-03-27 14:44:06', '2022-03-27 14:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int NOT NULL,
  `location_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 3),
(9, 3),
(10, 1),
(11, 7),
(11, 8),
(11, 9),
(12, 7),
(12, 8),
(12, 9),
(13, 7),
(13, 8),
(13, 9),
(14, 7),
(14, 8),
(14, 9),
(16, 7),
(16, 8),
(16, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int UNSIGNED NOT NULL,
  `variation_template_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2022-01-06 00:38:56', '2022-01-06 00:38:56'),
(2, NULL, 'DUMMY', 2, 1, '2022-01-13 19:01:12', '2022-01-13 19:01:12'),
(3, NULL, 'DUMMY', 3, 1, '2022-01-13 20:07:54', '2022-01-13 20:07:54'),
(4, NULL, 'DUMMY', 4, 1, '2022-01-22 16:35:12', '2022-01-22 16:35:12'),
(5, NULL, 'DUMMY', 5, 1, '2022-01-22 16:43:16', '2022-01-22 16:43:16'),
(6, NULL, 'DUMMY', 6, 1, '2022-01-22 17:04:08', '2022-01-22 17:04:08'),
(7, NULL, 'DUMMY', 7, 1, '2022-01-23 01:59:54', '2022-01-23 01:59:54'),
(8, NULL, 'DUMMY', 8, 1, '2022-01-25 18:54:26', '2022-01-25 18:54:26'),
(9, NULL, 'DUMMY', 9, 1, '2022-01-25 18:57:04', '2022-01-25 18:57:04'),
(10, NULL, 'DUMMY', 10, 1, '2022-02-08 07:00:09', '2022-02-08 07:00:09'),
(11, NULL, 'DUMMY', 11, 1, '2022-03-27 14:26:06', '2022-03-27 14:26:06'),
(12, NULL, 'DUMMY', 12, 1, '2022-03-27 14:29:46', '2022-03-27 14:29:46'),
(13, NULL, 'DUMMY', 13, 1, '2022-03-27 14:42:22', '2022-03-27 14:42:22'),
(14, NULL, 'DUMMY', 14, 1, '2022-03-27 14:43:11', '2022-03-27 14:43:11'),
(15, NULL, 'DUMMY', 15, 1, '2022-03-27 14:43:40', '2022-03-27 14:43:40'),
(16, NULL, 'DUMMY', 16, 1, '2022-03-27 14:44:06', '2022-03-27 14:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `purchase_order_line_id` int DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 500.0000, 80.0000, 0.00, 80.0000, 92.0000, 12.0000, 1, NULL, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, '2022-01-31', NULL, NULL, '2022-01-06 00:40:25', '2022-04-05 04:52:01'),
(2, 10, 5, 5, 700.0000, 8.5000, 0.00, 8.5000, 8.5000, 0.0000, NULL, NULL, 233.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2022-01-22 16:43:36', '2022-04-05 04:52:01'),
(3, 22, 7, 7, 5000.0000, 80.0000, 0.00, 80.0000, 92.0000, 12.0000, 1, NULL, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2022-01-23 02:00:03', '2022-04-05 04:52:01'),
(4, 31, 8, 8, 100.0000, 15.0000, 0.00, 15.0000, 17.2500, 2.2500, 2, NULL, 3.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2022-01-25 19:15:30', '2022-01-27 14:19:01'),
(5, 32, 9, 9, 100.0000, 15.2000, 0.00, 15.2000, 17.4800, 2.2800, 2, NULL, 8.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2022-01-25 19:16:04', '2022-01-28 18:23:33'),
(6, 45, 10, 10, 100.0000, 200.0000, 0.00, 200.0000, 200.0000, 0.0000, NULL, NULL, 51.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2022-02-08 07:00:09', '2022-04-05 04:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int NOT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 4, 1, '2022-01-06 01:55:38', '2022-02-08 06:52:29'),
(2, 'business_location', 3, 1, '2022-01-06 01:55:39', '2022-03-18 03:18:16'),
(3, 'essentials_todos', 3, 1, '2022-01-05 23:59:07', '2022-02-07 22:07:15'),
(4, 'sell_payment', 41, 1, '2022-01-06 00:41:02', '2022-04-05 04:52:01'),
(5, 'draft', 4, 1, '2022-01-13 20:09:43', '2022-02-22 05:19:54'),
(6, 'username', 2, 1, '2022-01-22 16:38:17', '2022-01-22 16:39:05'),
(7, 'expense', 1, 1, '2022-01-22 16:46:29', '2022-01-22 16:46:29'),
(8, 'contacts', 1, 2, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(9, 'business_location', 1, 2, '2022-01-23 16:26:48', '2022-01-23 16:26:48'),
(10, 'payroll', 1, 1, '2022-01-23 14:43:30', '2022-01-23 14:43:30'),
(11, 'subscription', 1, 1, '2022-01-23 20:05:23', '2022-01-23 20:05:23'),
(12, 'contacts', 2, 3, '2022-01-25 21:13:38', '2022-01-25 19:13:48'),
(13, 'business_location', 1, 3, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(14, 'contacts', 1, 4, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(15, 'business_location', 1, 4, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(16, 'purchase', 2, 3, '2022-01-25 19:15:30', '2022-01-25 19:16:04'),
(17, 'sell_payment', 9, 3, '2022-01-25 19:26:59', '2022-01-28 18:23:33'),
(18, 'draft', 1, 3, '2022-01-26 04:42:17', '2022-01-26 04:42:17'),
(19, 'contacts', 1, 5, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(20, 'business_location', 3, 5, '2022-03-27 15:51:35', '2022-03-27 14:24:47'),
(21, 'sell_payment', 25, 5, '2022-03-27 14:48:27', '2022-03-27 15:34:51'),
(22, 'draft', 3, 5, '2022-03-27 15:08:15', '2022-03-27 15:29:55');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_tables`
--

INSERT INTO `res_tables` (`id`, `business_id`, `location_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', NULL, 1, '2022-02-22 07:04:34', '2022-02-22 06:59:59', '2022-02-22 07:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2022-01-06 01:55:38', '2022-01-06 01:55:38'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2022-01-06 01:55:38', '2022-01-06 01:55:38'),
(3, 'مندوب#1', 'web', 1, 0, 0, '2022-01-22 19:05:44', '2022-01-22 19:05:44'),
(6, 'Admin#3', 'web', 3, 1, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(7, 'Cashier#3', 'web', 3, 0, 0, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(8, 'Admin#4', 'web', 4, 1, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(9, 'Cashier#4', 'web', 4, 0, 0, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(10, 'Admin#5', 'web', 5, 1, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(11, 'Cashier#5', 'web', 5, 0, 0, '2022-03-27 15:51:35', '2022-03-27 15:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(25, 2),
(26, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(2, 3),
(6, 3),
(17, 3),
(27, 3),
(36, 3),
(37, 3),
(40, 3),
(76, 3),
(81, 3),
(25, 7),
(26, 7),
(48, 7),
(49, 7),
(50, 7),
(51, 7),
(80, 7),
(25, 9),
(26, 9),
(48, 9),
(49, 9),
(50, 9),
(51, 9),
(80, 9),
(6, 11),
(9, 11),
(10, 11),
(16, 11),
(19, 11),
(20, 11),
(25, 11),
(26, 11),
(27, 11),
(42, 11),
(48, 11),
(49, 11),
(62, 11),
(106, 11),
(107, 11),
(108, 11);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int NOT NULL,
  `warranty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `package_id` int UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `package_details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_id` int UNSIGNED NOT NULL,
  `paid_via` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('approved','waiting','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `business_id`, `package_id`, `start_date`, `trial_end_date`, `end_date`, `package_price`, `package_details`, `created_id`, `paid_via`, `payment_transaction_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-01-05', '2023-02-24', '2023-01-05', 0.0000, '{\"location_count\":0,\"user_count\":0,\"product_count\":0,\"invoice_count\":0,\"name\":\"test\",\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 'offline', NULL, 'approved', NULL, '2022-01-06 02:37:48', '2022-01-06 02:37:48'),
(2, 1, 1, '2023-01-06', '2024-02-25', '2024-01-06', 0.0000, '{\"location_count\":0,\"user_count\":0,\"product_count\":0,\"invoice_count\":0,\"name\":\"test\",\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 'offline', 'KKKKKK', 'approved', NULL, '2022-01-23 16:24:29', '2022-01-23 16:24:29'),
(3, 3, 3, '2022-01-25', '2024-01-25', '2023-01-25', 0.0000, '{\"location_count\":\"5\",\"user_count\":\"0\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Watter\",\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 'offline', '25-01-2022', 'approved', NULL, '2022-01-25 21:19:11', '2022-01-25 21:19:54'),
(4, 5, 5, '2022-03-27', '2024-03-26', '2023-03-27', 100.0000, '{\"location_count\":5,\"user_count\":10,\"product_count\":0,\"invoice_count\":0,\"name\":\"Saloon\",\"essentials_module\":\"1\"}', 1, 'offline', '123', 'approved', NULL, '2022-03-27 15:58:48', '2022-03-27 15:58:48');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_communicator_logs`
--

CREATE TABLE `superadmin_communicator_logs` (
  `id` int UNSIGNED NOT NULL,
  `business_ids` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_frontend_pages`
--

CREATE TABLE `superadmin_frontend_pages` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '4.7.1'),
(2, 'default_business_active_status', '1'),
(3, 'manufacturing_version', '2.1'),
(4, 'superadmin_version', '2.2'),
(5, 'app_currency_id', '2'),
(6, 'invoice_business_name', 'demo'),
(7, 'invoice_business_landmark', 'Landmark'),
(8, 'invoice_business_zip', 'Zip'),
(9, 'invoice_business_state', 'State'),
(10, 'invoice_business_city', 'City'),
(11, 'invoice_business_country', 'Country'),
(12, 'email', 'superadmin@example.com'),
(13, 'package_expiry_alert_days', '5'),
(14, 'enable_business_based_username', '0'),
(15, 'essentials_version', '2.2'),
(16, 'productcatalogue_version', '0.4'),
(17, 'woocommerce_version', '2.0'),
(18, 'superadmin_register_tc', NULL),
(19, 'welcome_email_subject', NULL),
(20, 'welcome_email_body', NULL),
(21, 'additional_js', NULL),
(22, 'additional_css', NULL),
(23, 'offline_payment_details', NULL),
(24, 'superadmin_enable_register_tc', '0'),
(25, 'allow_email_settings_to_businesses', '0'),
(26, 'enable_new_business_registration_notification', '0'),
(27, 'enable_new_subscription_notification', '0'),
(28, 'enable_welcome_email', '0'),
(29, 'enable_offline_payment', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `for_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL,
  `woocommerce_tax_rate_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `for_tax_group`, `created_by`, `woocommerce_tax_rate_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'VAT15%', 15.0000, 0, 0, 1, NULL, NULL, '2022-01-13 20:13:05', '2022-01-13 20:13:05'),
(2, 3, 'VAT15%', 15.0000, 0, 0, 9, NULL, NULL, '2022-01-25 18:54:54', '2022-01-25 18:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED DEFAULT NULL,
  `res_table_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int UNSIGNED DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `shipping_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_fields_info` longtext COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int UNSIGNED DEFAULT NULL,
  `expense_for` int UNSIGNED DEFAULT NULL,
  `commission_agent` int DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int DEFAULT NULL,
  `return_parent_id` int DEFAULT NULL,
  `opening_stock_product_id` int DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `woocommerce_order_id` int DEFAULT NULL,
  `essentials_duration` decimal(8,2) NOT NULL,
  `essentials_duration_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_amount_per_unit_duration` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `essentials_allowances` text COLLATE utf8mb4_unicode_ci,
  `essentials_deductions` text COLLATE utf8mb4_unicode_ci,
  `mfg_parent_production_purchase_id` int DEFAULT NULL,
  `mfg_wasted_units` decimal(22,4) DEFAULT NULL,
  `mfg_production_cost` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_production_cost_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `mfg_is_final` tinyint(1) NOT NULL DEFAULT '0',
  `prefer_payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefer_payment_account` int DEFAULT NULL,
  `sales_order_ids` text COLLATE utf8mb4_unicode_ci,
  `purchase_order_ids` text COLLATE utf8mb4_unicode_ci,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_batch` int DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_5` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_6` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `woocommerce_order_id`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `mfg_parent_production_purchase_id`, `mfg_wasted_units`, `mfg_production_cost`, `mfg_production_cost_type`, `mfg_is_final`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 19:40:25', 46000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 46000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-06 00:40:25', '2022-01-23 01:58:14'),
(2, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '5624', '', NULL, NULL, NULL, '2022-01-05 19:39:00', 500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '08d7b87003113b285ec05a4f7e5098ec', NULL, 'months', NULL, '2022-01-06 00:41:02', '2022-01-06 00:41:02'),
(3, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '5624', '', NULL, NULL, NULL, '2022-01-05 19:42:00', 100.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '47678134f6acca90d799c6c02330e16c', NULL, NULL, NULL, '2022-01-06 00:43:26', '2022-01-06 00:43:26'),
(4, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '56243', '', NULL, NULL, NULL, '2022-01-05 19:51:00', 100.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'daaa5cab06661c63778c589106141711', NULL, NULL, NULL, '2022-01-06 00:51:36', '2022-01-06 00:51:36'),
(5, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, 'due', NULL, 1, NULL, '2022/0001', '', NULL, NULL, NULL, '2022-01-13 15:09:43', 1765.6400, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1765.6400, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-13 20:09:43', '2022-01-22 17:10:40'),
(6, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0001', '', NULL, NULL, NULL, '2022-01-13 15:11:08', 150.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 150.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-13 20:11:08', '2022-01-13 20:11:08'),
(7, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0002', '', NULL, NULL, NULL, '2022-01-13 15:15:56', 150.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 150.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-13 20:15:56', '2022-01-13 20:15:56'),
(8, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0003', '', NULL, NULL, NULL, '2022-01-22 11:28:04', 130.4300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 130.4300, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 16:28:04', '2022-01-22 16:28:04'),
(9, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0004', '', NULL, NULL, NULL, '2022-01-22 11:28:47', 130.4300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 130.4300, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 16:28:47', '2022-01-22 16:28:47'),
(10, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:43:36', 5950.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5950.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 5, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 16:43:36', '2022-01-22 16:43:36'),
(11, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0005', '', NULL, NULL, NULL, '2022-01-22 11:44:23', 510.2400, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 510.2400, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 16:44:23', '2022-01-22 16:44:23'),
(12, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2022/0001', NULL, NULL, NULL, '2022-01-22 11:44:00', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 16:46:29', '2022-01-22 16:46:29'),
(13, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0006', '', NULL, NULL, NULL, '2022-01-22 12:01:00', 382.6800, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 382.6800, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 17:01:00', '2022-01-22 17:01:00'),
(14, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0007', '', NULL, NULL, NULL, '2022-01-22 12:22:14', 510.2400, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 510.2400, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 17:22:14', '2022-01-22 17:22:14'),
(15, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0008', '', NULL, NULL, NULL, '2022-01-22 12:49:47', 10.6300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.6300, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 17:49:47', '2022-01-22 17:49:47'),
(16, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0009', '', NULL, NULL, NULL, '2022-01-22 13:12:13', 21.0500, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 21.0500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(17, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0010', '', NULL, NULL, NULL, '2022-01-22 14:10:26', 106.3000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 106.3000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(18, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0011', '', NULL, NULL, NULL, '2022-01-22 14:13:19', 138.1900, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'اجل', NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 138.1900, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-22 19:13:19', '2022-01-22 19:13:20'),
(19, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 2, NULL, '2022-0012', '', NULL, NULL, NULL, '2022-01-22 14:16:31', 212.6000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 212.6000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 19:16:31', '2022-01-22 19:16:31'),
(20, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 2, NULL, '2022-0013', '', NULL, NULL, NULL, '2022-01-22 16:06:19', 531.5000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 531.5000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 21:06:19', '2022-01-22 21:06:19'),
(21, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0014', '', NULL, NULL, NULL, '2022-01-22 20:53:35', 241.0600, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 241.0600, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(22, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:00:03', 460000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 460000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-23 02:00:03', '2022-01-23 02:00:03'),
(23, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0015', '', NULL, NULL, NULL, '2022-01-22 21:00:30', 100.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 02:00:30', '2022-01-23 02:00:30'),
(24, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0016', '', NULL, NULL, NULL, '2022-01-22 21:01:28', 100.0000, 1, 15.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 115.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 02:01:28', '2022-01-23 02:01:28'),
(25, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0017', '', NULL, NULL, NULL, '2022-01-22 21:01:51', 100.0000, 1, 15.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 115.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 02:01:51', '2022-01-23 02:01:51'),
(26, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0018', '', NULL, NULL, NULL, '2022-01-22 21:04:01', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 02:04:01', '2022-01-23 02:04:01'),
(27, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0019', '', NULL, NULL, NULL, '2022-01-22 21:05:45', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 02:05:45', '2022-01-23 02:05:45'),
(28, 1, NULL, NULL, NULL, NULL, 'payroll', NULL, 'final', NULL, 0, 'due', NULL, NULL, NULL, NULL, '12022/0001', NULL, NULL, NULL, '2022-01-01 00:00:00', 330.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 330.0000, NULL, 7, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 8.00, 'Hour', 10.0000, '{\"allowance_names\":[\"\\u0628\\u062f\\u0644 \\u0645\\u0648\\u0627\\u0635\\u0644\\u0627\\u062a\",\"\\u0628\\u062f\\u0644 \\u0633\\u0643\\u0646\"],\"allowance_amounts\":[100,150],\"allowance_types\":[\"fixed\",\"fixed\",\"fixed\"],\"allowance_percents\":[0,0]}', '{\"deduction_names\":[],\"deduction_amounts\":[],\"deduction_types\":[\"fixed\",\"fixed\",\"fixed\"],\"deduction_percents\":[]}', NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-23 14:43:31', '2022-01-23 14:43:31'),
(29, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0020', '', NULL, '2022/0001', NULL, '2022-01-23 15:05:23', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 20:05:23', '2022-01-23 20:05:23'),
(30, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0021', '', NULL, NULL, NULL, '2022-01-23 15:07:54', 21.2600, 1, 3.1890, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24.4500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-23 20:07:54', '2022-01-23 20:07:54'),
(31, 3, 3, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 7, NULL, NULL, 'PO2022/0001', NULL, NULL, NULL, '2022-01-25 14:12:00', 1725.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1725.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 19:15:30', '2022-01-25 19:15:30'),
(32, 3, 3, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 7, NULL, NULL, 'PO2022/0002', NULL, NULL, NULL, '2022-01-25 14:15:00', 1748.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1748.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 19:16:04', '2022-01-25 19:16:04'),
(33, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '0001', '', NULL, NULL, NULL, '2022-01-25 14:26:59', 16.5200, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 16.5200, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-25 19:26:59', '2022-01-25 19:26:59'),
(34, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '0002', '', NULL, NULL, NULL, '2022-01-25 14:28:20', 19.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 19.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-25 19:28:20', '2022-01-25 19:28:20'),
(35, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '0003', '', NULL, NULL, NULL, '2022-01-25 14:40:49', 21.0000, 2, 3.1500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24.1500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-25 19:40:49', '2022-01-25 19:40:49'),
(36, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '0004', '', NULL, NULL, NULL, '2022-01-25 23:25:29', 42.0000, 2, 6.3000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 48.3000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(37, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '0005', '', NULL, NULL, NULL, '2022-01-25 23:31:13', 42.0000, 2, 6.3000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 48.3000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '00c9266aec471e5b91c6ec2589244c95', NULL, NULL, 0, '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(38, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'draft', NULL, 0, NULL, NULL, 5, NULL, '2022/0001', '', NULL, NULL, NULL, '2022-01-25 23:42:17', 42.0000, 2, 6.3000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 48.3000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'f01c1a608bb26f05b91572c33996daa3', NULL, NULL, 0, '2022-01-26 04:42:17', '2022-01-26 04:47:02'),
(39, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '0006', '', NULL, NULL, NULL, '2022-01-27 09:18:00', 21.0000, 2, 3.1500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'شكرا لايوجد', NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24.1500, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, NULL, 0, NULL, NULL, 'a7f47a5a6848077fe4a33c5bd839de65', NULL, NULL, NULL, '2022-01-27 14:19:01', '2022-01-27 14:20:29'),
(40, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0022', '', NULL, NULL, NULL, '2022-01-28 13:12:52', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(41, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '2022-00007', '', NULL, NULL, NULL, '2022-01-28 13:16:05', 21.0000, 2, 3.1500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24.1500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'b1e9f934a8cb7c11bdb504d9921a43cf', NULL, NULL, 0, '2022-01-28 18:16:05', '2022-01-28 18:16:05'),
(42, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '2022-00008', '', NULL, NULL, NULL, '2022-01-28 13:22:52', 21.0000, 2, 3.1500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24.1500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'dabf18a070ca804425e5f5a6cfbd1fb6', NULL, NULL, 0, '2022-01-28 18:22:52', '2022-01-28 18:22:52'),
(43, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, NULL, '2022-00009', '', NULL, NULL, NULL, '2022-01-28 13:23:33', 21.0000, 2, 3.1500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24.1500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'a59090bdf74fa004d733883730ec7041', NULL, NULL, 0, '2022-01-28 18:23:33', '2022-01-28 18:23:33'),
(44, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0023', '', NULL, NULL, NULL, '2022-02-07 16:44:36', 275.6200, 1, 41.3430, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 316.9700, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(45, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 02:00:09', 20000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 10, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-08 07:00:09', '2022-02-08 07:00:09'),
(46, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'partial', NULL, 8, NULL, '2022-0024', '', NULL, NULL, NULL, '2022-02-08 02:04:09', 10100.0000, 1, 1515.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'الان', NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 11615.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-08 07:04:09', '2022-02-08 07:07:31'),
(47, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0025', '', NULL, NULL, NULL, '2022-02-08 02:08:28', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-08 07:08:28', '2022-02-08 07:08:28'),
(48, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0026', '', NULL, NULL, NULL, '2022-02-13 21:43:49', 230.0000, 1, 34.5000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 264.5000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '6f460f2e8d632e71a2daa11869141f81', NULL, NULL, 0, '2022-02-14 02:43:49', '2022-02-20 16:14:07'),
(49, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0027', '', NULL, NULL, NULL, '2022-02-20 12:46:03', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '8c8b0a5e1f07471bb154ae898401d4cb', NULL, NULL, 0, '2022-02-20 17:46:03', '2022-02-22 20:05:04'),
(50, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0028', '', NULL, NULL, NULL, '2022-02-20 12:50:01', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-20 17:50:01', '2022-02-20 17:50:01'),
(51, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0029', '', NULL, NULL, NULL, '2022-02-20 12:53:33', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-20 17:53:33', '2022-02-20 17:53:33'),
(52, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0030', '', NULL, NULL, NULL, '2022-02-20 12:54:44', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-20 17:54:44', '2022-02-20 17:54:44'),
(53, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0031', '', NULL, NULL, NULL, '2022-02-20 13:44:43', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '4ea211b2bff05c37cab4fe957d23b01f', NULL, NULL, 0, '2022-02-20 18:44:43', '2022-02-20 20:01:33'),
(54, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0002', '', NULL, NULL, NULL, '2022-02-20 15:14:33', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-20 20:14:33', '2022-02-20 20:14:33'),
(55, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0032', '', NULL, NULL, NULL, '2022-02-22 00:18:21', 379.9900, 1, 56.9985, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 437.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(56, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2022/0003', '', NULL, NULL, NULL, '2022-02-22 00:19:41', 230.0000, 1, 34.5000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 264.5000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-22 05:19:41', '2022-02-22 05:19:41'),
(57, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', NULL, 0, NULL, NULL, 1, NULL, '2022/0004', '', NULL, NULL, NULL, '2022-02-22 00:19:54', 230.0000, 1, 34.5000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 264.5000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-02-22 05:19:54', '2022-02-22 05:19:54'),
(58, 1, 1, 1, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0033', '', NULL, NULL, NULL, '2022-02-22 02:00:55', 115.0000, 1, 17.2500, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 132.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'df4a12e89c6e109c1d8d5bee1436d486', NULL, NULL, 0, '2022-02-22 07:00:55', '2022-02-22 20:01:57'),
(60, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '0001', '', NULL, NULL, NULL, '2022-03-27 10:48:26', 10.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:48:26', '2022-03-27 14:48:27'),
(61, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '0002', '', NULL, NULL, NULL, '2022-03-27 10:49:59', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:49:59', '2022-03-27 14:49:59'),
(62, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '0003', '', NULL, NULL, NULL, '2022-03-27 10:53:59', 10.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:53:59', '2022-03-27 14:53:59'),
(63, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0004', '', NULL, NULL, NULL, '2022-03-27 10:58:54', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:58:54', '2022-03-27 14:58:54'),
(64, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0005', '', NULL, NULL, NULL, '2022-03-27 10:59:05', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:59:05', '2022-03-27 14:59:05'),
(65, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0006', '', NULL, NULL, NULL, '2022-03-27 11:01:16', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:01:16', '2022-03-27 15:01:16'),
(66, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0001', '', NULL, NULL, NULL, '2022-03-27 11:07:55', 50.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 50.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:07:55', '2022-03-27 15:07:55');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `woocommerce_order_id`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `mfg_parent_production_purchase_id`, `mfg_wasted_units`, `mfg_production_cost`, `mfg_production_cost_type`, `mfg_is_final`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(67, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 9, NULL, '2022/0001', '', NULL, NULL, NULL, '2022-03-27 11:08:15', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:08:15', '2022-03-27 15:08:15'),
(68, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0002', '', NULL, NULL, NULL, '2022-03-27 11:08:35', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '5e1a821f9698e3f3b671a0c37cb9cf8b', NULL, NULL, NULL, '2022-03-27 15:08:35', '2022-03-27 15:20:14'),
(69, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0003', '', NULL, NULL, NULL, '2022-03-27 11:09:44', 30.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 30.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:09:44', '2022-03-27 15:09:44'),
(70, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0004', '', NULL, NULL, NULL, '2022-03-27 11:12:48', 10.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:12:48', '2022-03-27 15:12:48'),
(71, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0005', '', NULL, NULL, NULL, '2022-03-27 11:13:19', 10.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:13:19', '2022-03-27 15:13:19'),
(72, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0006', '', NULL, NULL, NULL, '2022-03-27 11:18:00', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:19:04', '2022-03-27 15:19:04'),
(73, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0007', '', NULL, NULL, NULL, '2022-03-27 11:19:00', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:19:13', '2022-03-27 15:19:13'),
(74, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0008', '', NULL, NULL, NULL, '2022-03-27 11:19:00', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:19:47', '2022-03-27 15:19:47'),
(75, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0009', '', NULL, NULL, NULL, '2022-03-27 11:20:00', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:20:30', '2022-03-27 15:20:30'),
(76, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 9, NULL, '2022-0010', '', NULL, NULL, NULL, '2022-03-27 11:20:00', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 1, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:21:32', '2022-03-27 15:21:32'),
(77, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0011', '', NULL, NULL, NULL, '2022-03-27 11:24:00', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:25:16', '2022-03-27 15:25:16'),
(78, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0012', '', NULL, NULL, NULL, '2022-03-27 11:26:00', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:27:06', '2022-03-27 15:27:06'),
(79, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0013', '', NULL, NULL, NULL, '2022-03-27 11:28:00', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:28:41', '2022-03-27 15:28:41'),
(80, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0014', '', NULL, NULL, NULL, '2022-03-27 11:28:00', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:28:47', '2022-03-27 15:28:47'),
(81, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0015', '', NULL, NULL, NULL, '2022-03-27 11:28:00', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:29:04', '2022-03-27 15:29:04'),
(82, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 9, NULL, '2022/0002', '', NULL, NULL, NULL, '2022-03-27 11:29:00', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:29:50', '2022-03-27 15:29:50'),
(83, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'draft', NULL, 0, NULL, NULL, 9, NULL, '2022/0003', '', NULL, NULL, NULL, '2022-03-27 11:29:00', 25.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 15:29:55', '2022-03-27 15:29:55'),
(84, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0016', '', NULL, NULL, NULL, '2022-03-27 11:31:00', 40.0000, NULL, 0.0000, 'percentage', 50.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-27 15:32:30', '2022-03-27 15:32:30'),
(85, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0017', '', NULL, NULL, NULL, '2022-03-27 11:32:00', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-27 15:32:58', '2022-03-27 15:32:58'),
(86, 5, 8, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '2022-0018', '', NULL, NULL, NULL, '2022-03-27 11:34:00', 10.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-27 15:34:51', '2022-03-27 15:34:51'),
(87, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2022-0035', '', NULL, NULL, NULL, '2022-04-05 00:52:01', 560.6300, 1, 84.0945, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 644.7200, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 644, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '6d3a9dab150846210e33958f875eb9c7', NULL, NULL, 0, '2022-04-05 04:52:01', '2022-04-07 04:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED DEFAULT NULL,
  `business_id` int DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT '0',
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT '0',
  `payment_for` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 500.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-05 19:39:00', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0001', 1, '2022-01-06 00:41:02', '2022-01-24 00:32:32'),
(2, 3, 1, 0, 100.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-05 19:42:00', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-01-06 00:43:26', '2022-01-06 00:43:26'),
(3, 4, 1, 0, 100.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-05 19:51:00', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-01-06 00:51:36', '2022-01-06 00:51:36'),
(4, 6, 1, 0, 150.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-13 15:11:08', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-01-13 20:11:08', '2022-01-13 20:11:08'),
(5, 7, 1, 0, 150.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-13 15:15:56', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-01-13 20:15:56', '2022-01-13 20:15:56'),
(6, 8, 1, 0, 130.4300, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 11:28:04', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0006', NULL, '2022-01-22 16:28:04', '2022-01-22 16:28:04'),
(7, 9, 1, 0, 130.4300, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 11:28:47', 1, 0, NULL, 0, 1, NULL, '1111', NULL, 'SP2022/0007', NULL, '2022-01-22 16:28:47', '2022-01-22 16:28:47'),
(8, 11, 1, 0, 510.2400, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 11:44:23', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-01-22 16:44:23', '2022-01-22 16:44:23'),
(9, 12, 1, 0, 130.4300, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 11:44:00', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-01-22 16:46:29', '2022-01-22 16:46:29'),
(10, 13, 1, 0, 382.6800, 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 12:01:00', 1, 0, NULL, 0, 1, NULL, 'أجل', NULL, 'SP2022/0010', NULL, '2022-01-22 17:01:00', '2022-01-22 17:01:00'),
(11, 14, 1, 0, 510.2400, 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 12:22:14', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0011', NULL, '2022-01-22 17:22:14', '2022-01-22 17:22:14'),
(12, 15, 1, 0, 10.6300, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 12:49:47', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0012', NULL, '2022-01-22 17:49:47', '2022-01-22 17:49:47'),
(13, 16, 1, 0, 21.0500, 'card', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 13:12:13', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0013', NULL, '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(14, 17, 1, 0, 500.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 14:10:26', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0014', NULL, '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(15, 17, 1, 1, 393.7000, 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2022-01-22 14:10:26', 1, 0, NULL, 0, 1, NULL, '', NULL, 'SP2022/0015', NULL, '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(16, 18, 1, 0, 138.1900, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 14:13:19', 1, 0, NULL, 0, 1, NULL, 'اجل', NULL, 'SP2022/0016', NULL, '2022-01-22 19:13:19', '2022-01-22 19:13:19'),
(17, 19, 1, 0, 212.6000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 14:16:31', 1, 0, NULL, 0, 2, NULL, NULL, NULL, 'SP2022/0017', NULL, '2022-01-22 19:16:31', '2022-01-22 19:16:31'),
(18, 20, 1, 0, 531.5000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 16:06:19', 1, 0, NULL, 0, 2, NULL, NULL, NULL, 'SP2022/0018', NULL, '2022-01-22 21:06:19', '2022-01-22 21:06:19'),
(19, 21, 1, 0, 241.0600, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 20:53:35', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0019', NULL, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(20, 23, 1, 0, 100.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 21:00:30', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0020', NULL, '2022-01-23 02:00:30', '2022-01-23 02:00:30'),
(21, 24, 1, 0, 115.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 21:01:28', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0021', NULL, '2022-01-23 02:01:28', '2022-01-23 02:01:28'),
(22, 25, 1, 0, 115.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 21:01:51', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0022', NULL, '2022-01-23 02:01:51', '2022-01-23 02:01:51'),
(23, 26, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 21:04:01', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0023', NULL, '2022-01-23 02:04:01', '2022-01-23 02:04:01'),
(24, 27, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 21:05:45', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0024', NULL, '2022-01-23 02:05:45', '2022-01-23 02:05:45'),
(25, 29, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-23 15:05:23', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0025', NULL, '2022-01-23 20:05:23', '2022-01-23 20:05:23'),
(26, 30, 1, 0, 24.4500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-23 15:07:54', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0026', NULL, '2022-01-23 20:07:54', '2022-01-23 20:07:54'),
(27, 33, 3, 0, 16.5200, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 14:26:59', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-01-25 19:26:59', '2022-01-25 19:26:59'),
(28, 34, 3, 0, 19.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 14:28:20', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-01-25 19:28:20', '2022-01-25 19:28:20'),
(29, 35, 3, 0, 24.1500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 14:40:49', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-01-25 19:40:49', '2022-01-25 19:40:49'),
(30, 36, 3, 0, 48.3000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 23:25:29', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(31, 37, 3, 0, 48.3000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-25 23:31:13', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(32, 39, 3, 0, 24.1500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-27 09:18:00', 9, 0, NULL, 0, 5, NULL, 'دفعت كاش عبر حسنين محمد', NULL, 'SP2022/0006', NULL, '2022-01-27 14:19:01', '2022-01-27 14:20:29'),
(33, 40, 1, 0, 100.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-28 13:12:52', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0027', NULL, '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(34, 40, 1, 0, 32.2500, 'card', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-28 13:12:52', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0028', NULL, '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(35, 41, 3, 0, 24.1500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-28 13:16:05', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0007', NULL, '2022-01-28 18:16:05', '2022-01-28 18:16:05'),
(36, 42, 3, 0, 24.1500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-28 13:22:52', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-01-28 18:22:52', '2022-01-28 18:22:52'),
(37, 43, 3, 0, 24.1500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-28 13:23:33', 9, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-01-28 18:23:33', '2022-01-28 18:23:33'),
(38, 44, 1, 0, 316.9700, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-07 16:44:36', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0029', NULL, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(39, 46, 1, 0, 5000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-08 02:07:31', 1, 0, NULL, 0, 8, NULL, NULL, NULL, 'SP2022/0030', NULL, '2022-02-08 07:07:31', '2022-02-08 07:07:31'),
(40, 47, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-08 02:08:28', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0031', NULL, '2022-02-08 07:08:28', '2022-02-08 07:08:28'),
(41, 48, 1, 0, 264.5000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-13 21:43:49', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0032', NULL, '2022-02-14 02:43:49', '2022-02-14 02:43:49'),
(42, 49, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-20 12:46:03', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0033', NULL, '2022-02-20 17:46:03', '2022-02-20 17:46:03'),
(43, 50, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-20 12:50:01', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0034', NULL, '2022-02-20 17:50:01', '2022-02-20 17:50:01'),
(44, 51, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-20 12:53:33', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0035', NULL, '2022-02-20 17:53:33', '2022-02-20 17:53:33'),
(45, 52, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-20 12:54:44', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0036', NULL, '2022-02-20 17:54:44', '2022-02-20 17:54:44'),
(46, 53, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-20 13:44:43', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0037', NULL, '2022-02-20 18:44:43', '2022-02-20 18:44:43'),
(47, 55, 1, 0, 437.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-22 00:18:21', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0038', NULL, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(48, 58, 1, 0, 132.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-22 02:00:55', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0039', NULL, '2022-02-22 07:00:55', '2022-02-22 07:00:55'),
(50, 60, 5, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 10:48:27', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-03-27 14:48:27', '2022-03-27 14:48:27'),
(51, 61, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 10:49:59', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-03-27 14:49:59', '2022-03-27 14:49:59'),
(52, 62, 5, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 10:53:59', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-03-27 14:53:59', '2022-03-27 14:53:59'),
(53, 63, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 10:58:54', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-03-27 14:58:54', '2022-03-27 14:58:54'),
(54, 64, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 10:59:05', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-03-27 14:59:05', '2022-03-27 14:59:05'),
(55, 65, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:01:16', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0006', NULL, '2022-03-27 15:01:16', '2022-03-27 15:01:16'),
(56, 66, 5, 0, 50.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:07:55', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0007', NULL, '2022-03-27 15:07:55', '2022-03-27 15:07:55'),
(57, 68, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:08:35', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-03-27 15:08:35', '2022-03-27 15:08:35'),
(58, 69, 5, 0, 30.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:09:44', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-03-27 15:09:44', '2022-03-27 15:09:44'),
(59, 70, 5, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:12:48', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0010', NULL, '2022-03-27 15:12:48', '2022-03-27 15:12:48'),
(60, 71, 5, 0, 100.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:13:19', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0011', NULL, '2022-03-27 15:13:19', '2022-03-27 15:13:19'),
(61, 71, 5, 0, -90.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:13:19', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0012', NULL, '2022-03-27 15:13:19', '2022-03-27 15:13:19'),
(62, 72, 5, 0, 20.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:19:04', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0013', NULL, '2022-03-27 15:19:04', '2022-03-27 15:19:04'),
(63, 73, 5, 0, 25.0000, 'card', NULL, NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:19:13', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0014', NULL, '2022-03-27 15:19:13', '2022-03-27 15:19:13'),
(64, 74, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:19:47', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0015', NULL, '2022-03-27 15:19:47', '2022-03-27 15:19:47'),
(65, 75, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:20:30', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0016', NULL, '2022-03-27 15:20:30', '2022-03-27 15:20:30'),
(66, 77, 5, 0, 20.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:25:16', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0017', NULL, '2022-03-27 15:25:16', '2022-03-27 15:25:16'),
(67, 78, 5, 0, 30.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:27:06', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0018', NULL, '2022-03-27 15:27:06', '2022-03-27 15:27:06'),
(68, 78, 5, 1, 10.0000, 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2022-03-27 11:27:06', 12, 0, NULL, 0, 9, NULL, '', NULL, 'SP2022/0019', NULL, '2022-03-27 15:27:06', '2022-03-27 15:27:06'),
(69, 79, 5, 0, 20.0000, 'card', NULL, NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:28:41', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0020', NULL, '2022-03-27 15:28:41', '2022-03-27 15:28:41'),
(70, 80, 5, 0, 25.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:28:47', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0021', NULL, '2022-03-27 15:28:47', '2022-03-27 15:28:47'),
(71, 81, 5, 0, 20.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:29:04', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0022', NULL, '2022-03-27 15:29:04', '2022-03-27 15:29:04'),
(72, 84, 5, 0, 20.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:32:30', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0023', NULL, '2022-03-27 15:32:30', '2022-03-27 15:32:30'),
(73, 85, 5, 0, 20.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:32:58', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0024', NULL, '2022-03-27 15:32:58', '2022-03-27 15:32:58'),
(74, 86, 5, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:34:51', 12, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2022/0025', NULL, '2022-03-27 15:34:51', '2022-03-27 15:34:51'),
(75, 87, 1, 0, 644.7200, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 00:52:01', 1, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2022/0041', NULL, '2022-04-05 04:52:01', '2022-04-05 04:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_waste_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_line_items_id` int DEFAULT NULL,
  `so_line_id` int DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `res_service_staff_id` int DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `mfg_waste_percent`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `woocommerce_line_items_id`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 5.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-06 00:41:02', '2022-01-06 00:41:02'),
(2, 3, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-06 00:43:26', '2022-01-06 00:43:26'),
(3, 4, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-06 00:51:36', '2022-01-06 00:51:36'),
(4, 5, 3, 3, 3.0000, 0.0000, 0.0000, 150.0000, 135.0000, 'percentage', 10.0000, 135.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-13 20:09:43', '2022-01-22 17:10:40'),
(5, 6, 3, 3, 1.0000, 0.0000, 0.0000, 150.0000, 150.0000, 'fixed', 0.0000, 150.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-13 20:11:08', '2022-01-13 20:11:08'),
(6, 7, 3, 3, 1.0000, 0.0000, 0.0000, 150.0000, 150.0000, 'fixed', 0.0000, 150.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-13 20:15:56', '2022-01-13 20:15:56'),
(7, 8, 3, 3, 1.0000, 0.0000, 0.0000, 130.4300, 130.4300, 'fixed', 0.0000, 130.4300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 16:28:04', '2022-01-22 16:28:04'),
(8, 9, 3, 3, 1.0000, 0.0000, 0.0000, 130.4300, 130.4300, 'fixed', 0.0000, 130.4300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 16:28:47', '2022-01-22 16:28:47'),
(9, 11, 5, 5, 48.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 16:44:23', '2022-01-22 16:44:23'),
(10, 13, 5, 5, 36.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'percentage', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, 'كرتون برازق', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 17:01:00', '2022-01-22 17:01:00'),
(11, 5, 5, 5, 80.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 17:10:40', '2022-01-22 17:10:40'),
(12, 5, 5, 5, 48.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 17:10:40', '2022-01-22 17:10:40'),
(13, 14, 5, 5, 48.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 17:22:14', '2022-01-22 17:22:14'),
(14, 15, 5, 5, 1.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 17:49:47', '2022-01-22 17:49:47'),
(15, 16, 5, 5, 1.0000, 0.0000, 0.0000, 10.6300, 10.4174, 'percentage', 2.0000, 10.4200, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(16, 16, 5, 5, 1.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(17, 17, 5, 5, 10.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(18, 18, 5, 5, 13.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 19:13:19', '2022-01-22 19:13:19'),
(19, 19, 5, 5, 20.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 19:16:31', '2022-01-22 19:16:31'),
(20, 20, 5, 5, 50.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-22 21:06:19', '2022-01-22 21:06:19'),
(21, 21, 3, 3, 1.0000, 0.0000, 0.0000, 130.4300, 130.4300, 'fixed', 0.0000, 130.4300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(22, 21, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(23, 21, 5, 5, 1.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(24, 23, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 02:00:30', '2022-01-23 02:00:30'),
(25, 24, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 02:01:28', '2022-01-23 02:01:28'),
(26, 25, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 02:01:51', '2022-01-23 02:01:51'),
(27, 26, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, 'cooked', NULL, '', NULL, '2022-01-23 02:04:01', '2022-01-23 20:04:20'),
(28, 27, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 02:05:45', '2022-01-23 02:05:45'),
(29, 29, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, 1, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 20:05:23', '2022-01-23 20:05:23'),
(30, 30, 5, 5, 2.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-23 20:07:54', '2022-01-23 20:07:54'),
(31, 33, 9, 9, 1.0000, 0.0000, 0.0000, 16.5200, 16.5200, 'fixed', 0.0000, 16.5200, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-25 19:26:59', '2022-01-25 19:26:59'),
(32, 34, 9, 9, 1.0000, 0.0000, 0.0000, 16.5200, 16.5200, 'fixed', 0.0000, 19.0000, 2.4800, 2, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-25 19:28:20', '2022-01-25 19:28:20'),
(33, 35, 9, 9, 1.0000, 0.0000, 0.0000, 18.2600, 18.2600, 'fixed', 0.0000, 21.0000, 2.7400, 2, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-25 19:40:49', '2022-01-25 19:40:49'),
(34, 36, 9, 9, 1.0000, 0.0000, 0.0000, 21.0000, 21.0000, 'fixed', 0.0000, 21.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(35, 36, 8, 8, 1.0000, 0.0000, 0.0000, 18.2600, 18.2600, 'fixed', 0.0000, 21.0000, 2.7400, 2, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(36, 37, 9, 9, 1.0000, 0.0000, 0.0000, 21.0000, 21.0000, 'fixed', 0.0000, 21.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(37, 37, 8, 8, 1.0000, 0.0000, 0.0000, 18.2600, 18.2600, 'fixed', 0.0000, 21.0000, 2.7400, 2, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(38, 38, 9, 9, 1.0000, 0.0000, 0.0000, 21.0000, 21.0000, 'fixed', 0.0000, 21.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-26 04:42:17', '2022-01-26 04:42:17'),
(39, 38, 8, 8, 1.0000, 0.0000, 0.0000, 18.2600, 18.2600, 'fixed', 0.0000, 21.0000, 2.7400, 2, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-26 04:42:17', '2022-01-26 04:42:17'),
(40, 39, 8, 8, 1.0000, 0.0000, 0.0000, 18.2600, 18.2600, 'fixed', 0.0000, 21.0000, 2.7400, 2, NULL, NULL, 'على حساب العميل', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-27 14:19:01', '2022-01-27 14:20:29'),
(41, 40, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(42, 41, 9, 9, 1.0000, 0.0000, 0.0000, 21.0000, 21.0000, 'fixed', 0.0000, 21.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-28 18:16:05', '2022-01-28 18:16:05'),
(43, 42, 9, 9, 1.0000, 0.0000, 0.0000, 21.0000, 21.0000, 'fixed', 0.0000, 21.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-28 18:22:52', '2022-01-28 18:22:52'),
(44, 43, 9, 9, 1.0000, 0.0000, 0.0000, 21.0000, 21.0000, 'fixed', 0.0000, 21.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-01-28 18:23:33', '2022-01-28 18:23:33'),
(45, 44, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(46, 44, 5, 5, 1.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(47, 44, 3, 3, 1.0000, 0.0000, 0.0000, 130.4300, 130.4300, 'fixed', 0.0000, 149.9900, 19.5600, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(48, 46, 10, 10, 50.0000, 0.0000, 0.0000, 202.0000, 202.0000, 'fixed', 0.0000, 202.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-08 07:04:09', '2022-02-08 07:07:31'),
(49, 47, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-08 07:08:28', '2022-02-08 07:08:28'),
(50, 48, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-14 02:43:49', '2022-02-14 02:43:49'),
(51, 48, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-14 02:43:49', '2022-02-14 02:43:49'),
(52, 49, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-20 17:46:03', '2022-02-20 17:46:03'),
(53, 50, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-20 17:50:01', '2022-02-20 17:50:01'),
(54, 51, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-20 17:53:33', '2022-02-20 17:53:33'),
(55, 52, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-20 17:54:44', '2022-02-20 17:54:44'),
(56, 53, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-20 18:44:43', '2022-02-20 18:44:43'),
(57, 54, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-20 20:14:33', '2022-02-20 20:14:33'),
(58, 55, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(59, 55, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(60, 55, 3, 3, 1.0000, 0.0000, 0.0000, 130.4300, 130.4300, 'fixed', 0.0000, 149.9900, 19.5600, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(61, 56, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-22 05:19:41', '2022-02-22 05:19:41'),
(62, 56, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-22 05:19:41', '2022-02-22 05:19:41'),
(63, 57, 1, 1, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-22 05:19:54', '2022-02-22 05:19:54'),
(64, 57, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-02-22 05:19:54', '2022-02-22 05:19:54'),
(65, 58, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, 'cooked', NULL, '', NULL, '2022-02-22 07:00:55', '2022-02-22 07:02:50'),
(68, 60, 12, 12, 1.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 14:48:27', '2022-03-27 14:48:27'),
(69, 61, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 14:49:59', '2022-03-27 14:49:59'),
(70, 62, 12, 12, 1.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 14:53:59', '2022-03-27 14:53:59'),
(71, 63, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 14:58:54', '2022-03-27 14:58:54'),
(72, 64, 11, 11, 1.0000, 0.0000, 0.0000, 15.0000, 15.0000, 'fixed', 0.0000, 15.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 14:59:05', '2022-03-27 14:59:05'),
(73, 64, 12, 12, 1.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 14:59:05', '2022-03-27 14:59:05'),
(74, 65, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:01:16', '2022-03-27 15:01:16'),
(75, 66, 16, 16, 2.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:07:55', '2022-03-27 15:07:55'),
(76, 67, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:08:15', '2022-03-27 15:08:15'),
(77, 68, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:08:35', '2022-03-27 15:08:35'),
(78, 69, 12, 12, 1.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:09:44', '2022-03-27 15:09:44'),
(79, 69, 13, 13, 1.0000, 0.0000, 0.0000, 20.0000, 20.0000, 'fixed', 0.0000, 20.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:09:44', '2022-03-27 15:09:44'),
(80, 70, 12, 12, 1.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:12:48', '2022-03-27 15:12:48'),
(81, 71, 12, 12, 1.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:13:19', '2022-03-27 15:13:19'),
(82, 72, 13, 13, 1.0000, 0.0000, 0.0000, 20.0000, 20.0000, 'fixed', 0.0000, 20.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:19:04', '2022-03-27 15:19:04'),
(83, 73, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:19:13', '2022-03-27 15:19:13'),
(84, 74, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:19:47', '2022-03-27 15:19:47'),
(85, 75, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:20:30', '2022-03-27 15:20:30'),
(86, 76, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:21:32', '2022-03-27 15:21:32'),
(87, 77, 12, 12, 2.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:25:16', '2022-03-27 15:25:16'),
(88, 78, 13, 13, 1.0000, 0.0000, 0.0000, 20.0000, 20.0000, 'fixed', 0.0000, 20.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:27:06', '2022-03-27 15:27:06'),
(89, 79, 13, 13, 1.0000, 0.0000, 0.0000, 20.0000, 20.0000, 'fixed', 0.0000, 20.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:28:41', '2022-03-27 15:28:41'),
(90, 80, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:28:47', '2022-03-27 15:28:47'),
(91, 81, 13, 13, 1.0000, 0.0000, 0.0000, 20.0000, 20.0000, 'fixed', 0.0000, 20.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:29:04', '2022-03-27 15:29:04'),
(92, 82, 13, 13, 1.0000, 0.0000, 0.0000, 20.0000, 20.0000, 'fixed', 0.0000, 20.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:29:50', '2022-03-27 15:29:50'),
(93, 83, 16, 16, 1.0000, 0.0000, 0.0000, 25.0000, 25.0000, 'fixed', 0.0000, 25.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:29:55', '2022-03-27 15:29:55'),
(94, 84, 13, 13, 1.0000, 0.0000, 0.0000, 40.0000, 40.0000, 'fixed', 0.0000, 40.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:32:30', '2022-03-27 15:32:30'),
(95, 85, 13, 13, 1.0000, 0.0000, 0.0000, 20.0000, 20.0000, 'fixed', 0.0000, 20.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:32:58', '2022-03-27 15:32:58'),
(96, 86, 12, 12, 1.0000, 0.0000, 0.0000, 10.0000, 10.0000, 'fixed', 0.0000, 10.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-03-27 15:34:51', '2022-03-27 15:34:51'),
(97, 87, 1, 1, 2.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-04-05 04:52:01', '2022-04-05 04:52:01'),
(98, 87, 7, 7, 1.0000, 0.0000, 0.0000, 100.0000, 100.0000, 'fixed', 0.0000, 115.0000, 15.0000, 1, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-04-05 04:52:01', '2022-04-05 04:52:01'),
(99, 87, 10, 10, 1.0000, 0.0000, 0.0000, 205.0000, 205.0000, 'fixed', 0.0000, 205.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-04-05 04:52:01', '2022-04-05 04:52:01'),
(100, 87, 5, 5, 1.0000, 0.0000, 0.0000, 10.6300, 10.6300, 'fixed', 0.0000, 10.6300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2022-04-05 04:52:01', '2022-04-05 04:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `sell_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 5.0000, 0.0000, '2022-01-06 00:41:02', '2022-01-06 00:41:02'),
(2, 2, NULL, 1, 1.0000, 0.0000, '2022-01-06 00:43:26', '2022-01-06 00:43:26'),
(3, 3, NULL, 1, 1.0000, 0.0000, '2022-01-06 00:51:36', '2022-01-06 00:51:36'),
(4, 9, NULL, 2, 48.0000, 0.0000, '2022-01-22 16:44:23', '2022-01-22 16:44:23'),
(5, 10, NULL, 2, 36.0000, 0.0000, '2022-01-22 17:01:00', '2022-01-22 17:01:00'),
(6, 13, NULL, 2, 48.0000, 0.0000, '2022-01-22 17:22:14', '2022-01-22 17:22:14'),
(7, 14, NULL, 2, 1.0000, 0.0000, '2022-01-22 17:49:47', '2022-01-22 17:49:47'),
(8, 15, NULL, 2, 1.0000, 0.0000, '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(9, 16, NULL, 2, 1.0000, 0.0000, '2022-01-22 18:12:13', '2022-01-22 18:12:13'),
(10, 17, NULL, 2, 10.0000, 0.0000, '2022-01-22 19:10:26', '2022-01-22 19:10:26'),
(11, 18, NULL, 2, 13.0000, 0.0000, '2022-01-22 19:13:20', '2022-01-22 19:13:20'),
(12, 19, NULL, 2, 20.0000, 0.0000, '2022-01-22 19:16:31', '2022-01-22 19:16:31'),
(13, 20, NULL, 2, 50.0000, 0.0000, '2022-01-22 21:06:19', '2022-01-22 21:06:19'),
(14, 22, NULL, 1, 1.0000, 0.0000, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(15, 23, NULL, 2, 1.0000, 0.0000, '2022-01-23 01:53:35', '2022-01-23 01:53:35'),
(16, 24, NULL, 3, 1.0000, 0.0000, '2022-01-23 02:00:30', '2022-01-23 02:00:30'),
(17, 25, NULL, 3, 1.0000, 0.0000, '2022-01-23 02:01:28', '2022-01-23 02:01:28'),
(18, 26, NULL, 1, 1.0000, 0.0000, '2022-01-23 02:01:51', '2022-01-23 02:01:51'),
(19, 27, NULL, 3, 1.0000, 0.0000, '2022-01-23 02:04:01', '2022-01-23 02:04:01'),
(20, 28, NULL, 1, 1.0000, 0.0000, '2022-01-23 02:05:45', '2022-01-23 02:05:45'),
(21, 29, NULL, 1, 1.0000, 0.0000, '2022-01-23 20:05:23', '2022-01-23 20:05:23'),
(22, 30, NULL, 2, 2.0000, 0.0000, '2022-01-23 20:07:54', '2022-01-23 20:07:54'),
(23, 31, NULL, 5, 1.0000, 0.0000, '2022-01-25 19:26:59', '2022-01-25 19:26:59'),
(24, 32, NULL, 5, 1.0000, 0.0000, '2022-01-25 19:28:20', '2022-01-25 19:28:20'),
(25, 33, NULL, 5, 1.0000, 0.0000, '2022-01-25 19:40:49', '2022-01-25 19:40:49'),
(26, 34, NULL, 5, 1.0000, 0.0000, '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(27, 35, NULL, 4, 1.0000, 0.0000, '2022-01-26 04:25:29', '2022-01-26 04:25:29'),
(28, 36, NULL, 5, 1.0000, 0.0000, '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(29, 37, NULL, 4, 1.0000, 0.0000, '2022-01-26 04:31:13', '2022-01-26 04:31:13'),
(30, 40, NULL, 4, 1.0000, 0.0000, '2022-01-27 14:19:01', '2022-01-27 14:19:01'),
(31, 41, NULL, 1, 1.0000, 0.0000, '2022-01-28 18:12:52', '2022-01-28 18:12:52'),
(32, 42, NULL, 5, 1.0000, 0.0000, '2022-01-28 18:16:05', '2022-01-28 18:16:05'),
(33, 43, NULL, 5, 1.0000, 0.0000, '2022-01-28 18:22:52', '2022-01-28 18:22:52'),
(34, 44, NULL, 5, 1.0000, 0.0000, '2022-01-28 18:23:33', '2022-01-28 18:23:33'),
(35, 45, NULL, 3, 1.0000, 0.0000, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(36, 46, NULL, 2, 1.0000, 0.0000, '2022-02-07 21:44:36', '2022-02-07 21:44:36'),
(37, 48, NULL, 6, 50.0000, 0.0000, '2022-02-08 07:04:09', '2022-02-08 07:04:09'),
(38, 49, NULL, 1, 1.0000, 0.0000, '2022-02-08 07:08:28', '2022-02-08 07:08:28'),
(39, 50, NULL, 1, 1.0000, 0.0000, '2022-02-14 02:43:49', '2022-02-14 02:43:49'),
(40, 51, NULL, 3, 1.0000, 0.0000, '2022-02-14 02:43:49', '2022-02-14 02:43:49'),
(41, 52, NULL, 1, 1.0000, 0.0000, '2022-02-20 17:46:03', '2022-02-20 17:46:03'),
(42, 53, NULL, 3, 1.0000, 0.0000, '2022-02-20 17:50:01', '2022-02-20 17:50:01'),
(43, 54, NULL, 3, 1.0000, 0.0000, '2022-02-20 17:53:33', '2022-02-20 17:53:33'),
(44, 55, NULL, 1, 1.0000, 0.0000, '2022-02-20 17:54:44', '2022-02-20 17:54:44'),
(45, 56, NULL, 1, 1.0000, 0.0000, '2022-02-20 18:44:43', '2022-02-20 18:44:43'),
(46, 58, NULL, 1, 1.0000, 0.0000, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(47, 59, NULL, 3, 1.0000, 0.0000, '2022-02-22 05:18:21', '2022-02-22 05:18:21'),
(48, 65, NULL, 3, 1.0000, 0.0000, '2022-02-22 07:00:55', '2022-02-22 07:00:55'),
(50, 97, NULL, 1, 2.0000, 0.0000, '2022-04-05 04:52:01', '2022-04-05 04:52:01'),
(51, 98, NULL, 3, 1.0000, 0.0000, '2022-04-05 04:52:01', '2022-04-05 04:52:01'),
(52, 99, NULL, 6, 1.0000, 0.0000, '2022-04-05 04:52:01', '2022-04-05 04:52:01'),
(53, 100, NULL, 2, 1.0000, 0.0000, '2022-04-05 04:52:01', '2022-04-05 04:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2022-01-06 01:55:39', '2022-01-06 01:55:39'),
(2, 1, 'علبة', 'علبة', 0, NULL, NULL, 1, NULL, '2022-01-13 19:03:35', '2022-01-13 19:03:35'),
(3, 1, 'كرتون', 'كرتون', 0, NULL, NULL, 1, NULL, '2022-01-13 19:05:30', '2022-01-13 19:05:30'),
(4, 1, 'اوتر', 'اوتر', 1, 1, 12.0000, 1, NULL, '2022-01-13 19:05:54', '2022-01-13 19:05:54'),
(6, 3, 'Pieces', 'Pc(s)', 0, NULL, NULL, 9, NULL, '2022-01-25 21:13:38', '2022-01-25 21:13:38'),
(7, 4, 'Pieces', 'Pc(s)', 0, NULL, NULL, 10, NULL, '2022-01-25 21:14:51', '2022-01-25 21:14:51'),
(8, 3, 'كرتون', 'كرتون', 0, NULL, NULL, 9, NULL, '2022-01-25 18:51:59', '2022-01-25 18:51:59'),
(9, 3, 'علبه', 'علبه', 0, NULL, NULL, 9, NULL, '2022-01-25 19:00:09', '2022-01-25 19:00:09'),
(10, 3, 'جركل', 'جركل', 0, NULL, NULL, 9, NULL, '2022-01-25 19:00:35', '2022-01-25 19:00:35'),
(11, 3, 'تعبئة', 'تعبئة', 0, NULL, NULL, 9, NULL, '2022-01-25 19:00:52', '2022-01-25 19:00:52'),
(12, 5, 'Pieces', 'Pc(s)', 0, NULL, NULL, 11, NULL, '2022-03-27 15:51:35', '2022-03-27 15:51:35'),
(13, 5, 'خدمة', 'حدمة', 0, NULL, NULL, 11, NULL, '2022-03-27 14:41:53', '2022-03-27 14:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `essentials_department_id` int DEFAULT NULL,
  `essentials_designation_id` int DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `crm_contact_id` int UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `essentials_department_id`, `essentials_designation_id`, `max_sales_discount_percent`, `allow_login`, `status`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'mr', 'demo', 'demo', 'demo', 'info@demo.com', '$2y$10$2x8r5SoMSEksXz2ncZ95V.KlcoWsZo3s1bX19R713nubIt9tcw4Fe', 'ar', NULL, NULL, 'OjTWlP4E2VsmkrcXz0jvGOdT5zLCh23M2GQixfyLVXpUyA9SEKWrB0LHlunM', 1, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-06 01:55:38', '2022-02-17 05:51:50'),
(2, 'user', 'Mr', 'shadi', 'singab', 'shadisingab', 'shadi@afaqzain.com', '$2y$10$hiUw.vx9UeTyThcQbT.igueYTeuUBqC19yh4/G/2MNTEuzfk6Qbq.', 'en', NULL, NULL, NULL, 1, NULL, NULL, 20.00, 1, 'active', NULL, 0, 1.00, 0, NULL, 'male', NULL, NULL, '0550104684', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-06 17:44:03', '2022-01-06 17:44:03'),
(3, 'user', NULL, 'mama', NULL, '0001', 'mamafatemaaa@gmail.com', '$2y$10$p9MWC/IN0sv0sGoWqQZd3.CNKpmWcGYjnzNJT8eszGjK7bRsQJH6u', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-22 16:38:17', '2022-01-22 16:38:17'),
(4, 'user', NULL, 'mama', 'fatema', '0002', 's.e99@hotmail.com', '$2y$10$GK2BZztA2qkq19mkEFt2J.MEfhl06KTZE/Mi9W8dwtSBVDOTfMrxq', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-22 16:39:05', '2022-01-22 19:07:13'),
(5, 'user', NULL, 'mama', 'fatema', NULL, 'mamafatemaaa@gmail.com', NULL, 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 'active', NULL, 1, 5.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 18:50:12', '2022-01-22 18:50:12'),
(7, 'user', 'السيد', 'مستخدم1', 'مستخدم1', 'shosho', 'aa@aa.com', '$2y$10$e84/NYDff/bhpLOXfMBAEuAaFcZBul8pgXgc0pl5Nhr.doLbzFgLS', 'ar', NULL, NULL, NULL, 1, NULL, NULL, 20.00, 1, 'active', NULL, 0, 2.00, 0, NULL, 'male', 'married', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-23 14:34:51', '2022-01-23 14:35:50'),
(8, 'user', 'Mr', 'Samel Khaled', 'Al-Ahmadi', 'Salem', 'aassd@aaaa.com', '$2y$10$w/OQ/dnDfAYHRMG4PFLIxedoMEfKm5lR3OVa3RRxRqI9Fr8z/D.Km', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-23 18:29:01', '2022-01-23 18:29:01'),
(9, 'user', NULL, 'water', 'water', 'user1', NULL, '$2y$10$wXjUf24epjslZ8GQV1tIveYgdjKROtJxraJSzNs271qT/bff97/Ie', 'ar', NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-25 21:13:38', '2022-01-26 04:24:44'),
(10, 'user', NULL, 'Retail', 'Market', 'user2', 'shadi_20001@hotmail.com', '$2y$10$uRXsFy79WE/602KLl/gYBenvtRhH39kelWEOvZ/9lLGYQxY9wg3l6', 'ar', NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-25 21:14:51', '2022-01-25 18:47:28'),
(11, 'user', 'Mr', 'Saloon', NULL, 'saloon', 'shadi@mline-sa.net', '$2y$10$pMcFFTW/3MeQlzfiJF0MkebVrMc3PhQEynEcFmXQheNyp2KeSbLUu', 'ar', NULL, NULL, 'jiiW6eVRYBKJWd4vwOI7WSsskDgWdAj2l1tngCmVyR1OO587Kfmk5PqNyNms', 5, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-03-27 15:51:35', '2022-03-27 13:25:35'),
(12, 'user', 'السيد', 'خالد', 'سالم', 'khaled', 'asdas@yahoo.com', '$2y$10$4cfTnAd/n1up6xhxwlKJ4u6jF9WrDXOjZygpPUUkj4Uegv4aeoUTe', 'ar', NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-03-27 14:46:55', '2022-03-27 14:48:01'),
(13, 'user', 'السيد', 'يوسف احمد', 'سالم', 'yousef', 'sdsd@hotmail.com', '$2y$10$DAhAaMeabJcNKka3KiulwO3EgK37gJbS9fPc1aYwm0OVbLOYnrHyW', 'en', NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-03-27 14:47:27', '2022-03-27 14:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int UNSIGNED NOT NULL,
  `woocommerce_variation_id` int DEFAULT NULL,
  `variation_value_id` int DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `woocommerce_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '054', 1, NULL, NULL, 80.0000, 92.0000, 25.0000, 100.0000, 115.0000, '2022-01-06 00:38:56', '2022-01-23 01:57:57', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, NULL, 3.0000, 3.0000, 0.0000, 3.0000, 3.0000, '2022-01-13 19:01:12', '2022-01-13 19:01:12', NULL, '[]'),
(3, 'DUMMY', 3, '0003', 3, NULL, NULL, 130.4300, 149.9900, 0.0000, 130.4300, 150.0000, '2022-01-13 20:07:54', '2022-01-13 20:17:35', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, NULL, 8.5000, 8.5000, 5.0000, 8.9300, 8.9300, '2022-01-22 16:35:12', '2022-01-22 16:35:12', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, NULL, 8.5000, 8.5000, 25.0000, 10.6300, 10.6300, '2022-01-22 16:43:16', '2022-01-22 16:43:16', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, NULL, 8.5000, 8.5000, 25.0000, 10.6300, 10.6300, '2022-01-22 17:04:08', '2022-01-22 17:04:08', NULL, '[]'),
(7, 'DUMMY', 7, '(((((((((((((((((', 7, NULL, NULL, 80.0000, 92.0000, 25.0000, 100.0000, 115.0000, '2022-01-23 01:59:54', '2022-01-23 01:59:54', NULL, '[]'),
(8, 'DUMMY', 8, '0008', 8, NULL, NULL, 15.0000, 17.2500, 21.7400, 18.2600, 21.0000, '2022-01-25 18:54:26', '2022-01-25 19:16:57', NULL, '[]'),
(9, 'DUMMY', 9, '0009', 9, NULL, NULL, 21.0000, 21.0000, 0.0000, 21.0000, 21.0000, '2022-01-25 18:57:04', '2022-01-25 19:42:35', NULL, '[]'),
(10, 'DUMMY', 10, '48', 10, NULL, NULL, 200.0000, 200.0000, 2.5000, 205.0000, 205.0000, '2022-02-08 07:00:09', '2022-02-08 07:00:09', NULL, '[]'),
(11, 'DUMMY', 11, '0011', 11, NULL, NULL, 15.0000, 15.0000, 0.0000, 15.0000, 15.0000, '2022-03-27 14:26:06', '2022-03-27 14:49:15', NULL, '[]'),
(12, 'DUMMY', 12, '0012', 12, NULL, NULL, 8.0000, 8.0000, 25.0000, 10.0000, 10.0000, '2022-03-27 14:29:46', '2022-03-27 14:49:07', NULL, '[]'),
(13, 'DUMMY', 13, '0013', 13, NULL, NULL, 16.0000, 16.0000, 25.0000, 20.0000, 20.0000, '2022-03-27 14:42:22', '2022-03-27 14:48:59', NULL, '[]'),
(14, 'DUMMY', 14, '0014', 14, NULL, NULL, 12.0000, 12.0000, 25.0000, 15.0000, 15.0000, '2022-03-27 14:43:11', '2022-03-27 14:49:27', NULL, '[]'),
(15, 'DUMMY', 15, '0015', 15, NULL, NULL, 8.0000, 8.0000, 25.0000, 10.0000, 10.0000, '2022-03-27 14:43:40', '2022-03-27 14:43:40', NULL, '[]'),
(16, 'DUMMY', 16, '0016', 16, NULL, NULL, 20.0000, 20.0000, 25.0000, 25.0000, 25.0000, '2022-03-27 14:44:06', '2022-03-27 14:49:41', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `price_group_id` int UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `product_variation_id` int UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 480.0000, '2022-01-06 00:40:25', '2022-04-05 04:52:01'),
(2, 5, 5, 5, 1, 467.0000, '2022-01-22 16:43:36', '2022-04-05 04:52:01'),
(3, 7, 7, 7, 1, 4990.0000, '2022-01-23 02:00:03', '2022-04-05 04:52:01'),
(4, 8, 8, 8, 3, 97.0000, '2022-01-25 19:15:30', '2022-01-27 14:19:01'),
(5, 9, 9, 9, 3, 92.0000, '2022-01-25 19:16:04', '2022-01-28 18:23:33'),
(6, 10, 10, 10, 1, 49.0000, '2022-02-08 07:00:09', '2022-04-05 04:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `woocommerce_attr_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `woocommerce_attr_id`, `created_at`, `updated_at`) VALUES
(1, 'تباين1', 1, NULL, '2022-01-13 19:01:48', '2022-01-13 19:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, '1', 1, '2022-01-13 19:01:48', '2022-01-13 19:01:48'),
(2, '2', 1, '2022-01-13 19:01:48', '2022-01-13 19:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warranties`
--

INSERT INTO `warranties` (`id`, `name`, `business_id`, `description`, `duration`, `duration_type`, `created_at`, `updated_at`) VALUES
(1, 'ضمان لمدة 5 أيام', 1, 'ضمان لمدة 5 أيام', 5, 'days', '2022-01-13 19:08:02', '2022-01-13 19:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `woocommerce_sync_logs`
--

CREATE TABLE `woocommerce_sync_logs` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `sync_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `essentials_allowances_and_deductions`
--
ALTER TABLE `essentials_allowances_and_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_allowances_and_deductions_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_attendances`
--
ALTER TABLE `essentials_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_attendances_user_id_index` (`user_id`),
  ADD KEY `essentials_attendances_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_documents`
--
ALTER TABLE `essentials_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_document_shares`
--
ALTER TABLE `essentials_document_shares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_holidays`
--
ALTER TABLE `essentials_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_holidays_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_leaves`
--
ALTER TABLE `essentials_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leaves_essentials_leave_type_id_index` (`essentials_leave_type_id`),
  ADD KEY `essentials_leaves_business_id_index` (`business_id`),
  ADD KEY `essentials_leaves_user_id_index` (`user_id`);

--
-- Indexes for table `essentials_leave_types`
--
ALTER TABLE `essentials_leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leave_types_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_messages`
--
ALTER TABLE `essentials_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_reminders`
--
ALTER TABLE `essentials_reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_shifts`
--
ALTER TABLE `essentials_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_todo_comments`
--
ALTER TABLE `essentials_todo_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_todo_comments_task_id_index` (`task_id`),
  ADD KEY `essentials_todo_comments_comment_by_index` (`comment_by`);

--
-- Indexes for table `essentials_to_dos`
--
ALTER TABLE `essentials_to_dos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_to_dos_status_index` (`status`),
  ADD KEY `essentials_to_dos_priority_index` (`priority`),
  ADD KEY `essentials_to_dos_created_by_index` (`created_by`);

--
-- Indexes for table `essentials_user_shifts`
--
ALTER TABLE `essentials_user_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `mfg_ingredient_groups`
--
ALTER TABLE `mfg_ingredient_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mfg_recipes`
--
ALTER TABLE `mfg_recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mfg_recipes_product_id_index` (`product_id`),
  ADD KEY `mfg_recipes_variation_id_index` (`variation_id`);

--
-- Indexes for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mfg_recipe_ingredients_mfg_recipe_id_foreign` (`mfg_recipe_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_business_id_foreign` (`business_id`),
  ADD KEY `subscriptions_package_id_index` (`package_id`),
  ADD KEY `subscriptions_created_id_index` (`created_id`);

--
-- Indexes for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- Indexes for table `woocommerce_sync_logs`
--
ALTER TABLE `woocommerce_sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_allowances_and_deductions`
--
ALTER TABLE `essentials_allowances_and_deductions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_attendances`
--
ALTER TABLE `essentials_attendances`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_documents`
--
ALTER TABLE `essentials_documents`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_document_shares`
--
ALTER TABLE `essentials_document_shares`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_holidays`
--
ALTER TABLE `essentials_holidays`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_leaves`
--
ALTER TABLE `essentials_leaves`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_leave_types`
--
ALTER TABLE `essentials_leave_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_messages`
--
ALTER TABLE `essentials_messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_reminders`
--
ALTER TABLE `essentials_reminders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_shifts`
--
ALTER TABLE `essentials_shifts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_todo_comments`
--
ALTER TABLE `essentials_todo_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_to_dos`
--
ALTER TABLE `essentials_to_dos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `essentials_user_shifts`
--
ALTER TABLE `essentials_user_shifts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mfg_ingredient_groups`
--
ALTER TABLE `mfg_ingredient_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mfg_recipes`
--
ALTER TABLE `mfg_recipes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `woocommerce_sync_logs`
--
ALTER TABLE `woocommerce_sync_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  ADD CONSTRAINT `mfg_recipe_ingredients_mfg_recipe_id_foreign` FOREIGN KEY (`mfg_recipe_id`) REFERENCES `mfg_recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

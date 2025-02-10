-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2025 at 01:46 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rtech`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('15d8671e881778a1c15d7a56c24870f3', 'i:2;', 1739091911),
('15d8671e881778a1c15d7a56c24870f3:timer', 'i:1739091911;', 1739091911),
('a9bcdddd8b6273e0d758d33f9f0214a6', 'i:1;', 1739081274),
('a9bcdddd8b6273e0d758d33f9f0214a6:timer', 'i:1739081274;', 1739081274);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_05_024828_add_two_factor_columns_to_users_table', 1),
(5, '2025_02_05_024847_create_personal_access_tokens_table', 1),
(6, '2025_02_06_005203_create_post_table', 1),
(7, '2025_02_06_011358_add_column_to_users_table', 2),
(8, '2025_02_09_084040_add_column_to_post_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('stilinskiscott111@gmail.com', '$2y$12$jPUv6skjXrRxI58gIDMvaOleeszILb0PmehoAf.3v/0MA2QPIp1pi', '2025-02-08 21:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `type` enum('News','Update','Task') NOT NULL DEFAULT 'News',
  `author` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `message`, `type`, `author`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Lorem Ipsum 2', 'Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2Lorem Ipsum 2', 'Update', 1, 'Active', '2025-02-06 15:05:30', '2025-02-06 15:05:30'),
(4, 'Lorem Ipsum 3', 'Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3Lorem Ipsum 3', 'News', 2, 'Active', '2025-02-07 00:49:41', '2025-02-07 00:49:41'),
(6, 'test2', 'test2', 'News', 2, 'Active', '2025-02-07 00:32:51', '2025-02-07 00:32:51'),
(8, 'Arabian Night Update', 'Arabian NightArabian NightArabian NightArabian Night Update', 'Task', 1, 'Active', '2025-02-07 07:50:51', '2025-02-07 07:51:09'),
(10, 'Hamonada', 'Hamonada Hamonada Hamonada', 'News', 1, 'Inactive', '2025-02-08 22:07:43', '2025-02-09 01:00:03'),
(12, 'zzz update', 'zzzzz', 'News', 1, 'Inactive', '2025-02-08 23:30:54', '2025-02-09 00:58:50'),
(13, 'test for real update', 'test for real test for real test for real test for real update', 'Task', 1, 'Inactive', '2025-02-09 01:03:51', '2025-02-09 01:06:10'),
(14, 'test for real test for real test for real update', 'test for real2 test for real update', 'News', 2, 'Inactive', '2025-02-09 01:04:46', '2025-02-09 01:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7aHsvFlvgcxtrRxBJJVrWgSUjC0DoDOixg8URtgZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNDJtemhyMm5QNU9TYVhPY0VQTlUwNnZnQXhVRmpvYWFZOXoxcDdKNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJHY3SDRkdEVQbU9zZEkzaFIuY2pidy5XTUVZSlQ4ZUdoSklmWExycDJZa3dCOUJmTGNRTzRlIjtzOjE5OiJ0d29fZmFjdG9yX2VtcHR5X2F0IjtpOjE3MzkwODUzMDc7fQ==', 1739091980),
('fcfdYyrHTLRJYlvCoSqZ07Ob0zuPmWxe0kWcCfrd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYUZJeFhCc3lUT2Q1YjUydFpzOGN5NjFST3p5V0JnWG5XUnczaW1MQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739086396),
('WpfDa1VubQwMI1olK9MJ9t9WtYSJvygKEOUJD7Jl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaWlrVTZLUnFxaGN0OGtEc0FMSnNlTHRwODhRUng0QUFxMTVDUDZ0aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJG5QejBENjRLbzJPcTNrZURyQS4udWVpeC4zTUg4N3E1dlN0UG9vMHpBYkw5Yy80VmxnRER5Ijt9', 1739091978);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `firstname`, `lastname`, `address`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Stiles', 'Darren', 'Reales', 'Tagaytay Vito Minglanilla Cebu', 'stilinskiscott111@gmail.com', NULL, '$2y$12$v7H4dtEPmOsdI3hR.cjbw.WMEYJT8eGhJIfXLrp2YkwB9BfLcQO4e', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-05 19:31:47', '2025-02-05 22:12:01'),
(2, 'Stiles2', 'Stiles', 'Stilinski', 'Tagaytay Vito Minglanilla Cebu', 'test@gmail.com', NULL, '$2y$12$nPz0D64Ko2Oq3keDrA..ueix.3MH87q5vStPoo0zAbL9c/4VlgDDy', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-06 07:08:22', '2025-02-06 07:08:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_author_foreign` (`author`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_author_foreign` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

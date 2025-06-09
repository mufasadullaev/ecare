-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 22, 2023 at 01:15 PM
-- Server version: 8.0.33
-- PHP Version: 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+05:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecare`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `owner_id` int DEFAULT NULL,
  `owner_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `owner_id`, `owner_type`, `address1`, `address2`, `country_id`, `state_id`, `city_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 2, 'App\\Models\\User', NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(2, 1, 'App\\Models\\Patient', NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-22 07:45:15', '2025-05-22 07:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `patient_id` int UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_time_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_time_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `service_id` bigint UNSIGNED NOT NULL,
  `payable_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` int NOT NULL DEFAULT '1',
  `payment_method` int NOT NULL DEFAULT '1',
  `appointment_unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Tashkent', 1, NULL, NULL),
(2, 'Samarkand', 1, NULL, NULL),
(3, 'Bukhara', 1, NULL, NULL),
(4, 'Namangan', 1, NULL, NULL),
(5, 'Andijan', 2, NULL, NULL),
(6, 'Fergana', 2, NULL, NULL),
(7, 'Khiva', 2, NULL, NULL),
(8, 'Nukus', 2, NULL, NULL),
(9, 'Termiz', 2, NULL, NULL),
(10, 'Urganch', 2, NULL, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `clinic_schedules`
--

CREATE TABLE `clinic_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `day_of_week` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clinic_schedules`
--

INSERT INTO `clinic_schedules` (`id`, `day_of_week`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, '1', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(2, '2', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(3, '3', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(4, '4', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(5, '5', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(6, '6', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(7, '7', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(8, '0', '12:00 AM', '11:45 PM', '2025-05-22 07:45:14', '2025-05-22 07:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `short_code`, `phone_code`, `created_at`, `updated_at`) VALUES
(1, 'Uzbekistan', 'UZ', '998', NULL, NULL),
(2, 'Russia', 'RU', '7', NULL, NULL),
(3, 'Kazakhstan', 'KZ', '7', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `currency_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_icon`, `currency_code`, `created_at`, `updated_at`) VALUES
(1, 'United States Dollar', '$', 'USD', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(2, 'Uzbekistan Sum', 'UZS', 'UZS', '2025-05-22 07:45:17', '2025-05-22 07:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `experience` double DEFAULT NULL,
  `twitter_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `experience`, `twitter_url`, `linkedin_url`, `instagram_url`, `created_at`, `updated_at`) VALUES
(1, 2, 3, NULL, NULL, NULL, '2025-05-22 07:45:15', '2025-05-22 07:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_holidays`
--

CREATE TABLE `doctor_holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_sessions`
--

CREATE TABLE `doctor_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `session_meeting_time` bigint NOT NULL,
  `session_gap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_specialization`
--

CREATE TABLE `doctor_specialization` (
  `id` bigint UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `specialization_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_specialization`
--

INSERT INTO `doctor_specialization` (`id`, `doctor_id`, `specialization_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `region_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Doctor Can Ease Your Pain?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, dolorum, vero ipsum molestiae minima odio quo voluptate illum excepturi quam cum voluptates doloribus quae nisi tempore necessitatibus dolores ducimus enim libero eaque explicabo suscipit animi at quaerat aliquid ex expedita perspiciatis? Saepe, aperiam, nam unde quas beatae vero vitae nulla.', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(2, 'How do I withdraw from a subject?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, dolorum, vero ipsum molestiae minima odio quo voluptate illum excepturi quam cum voluptates doloribus quae nisi tempore necessitatibus dolores ducimus enim libero eaque explicabo suscipit animi at quaerat aliquid ex expedita perspiciatis? Saepe, aperiam, nam unde quas beatae vero vitae nulla.', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(3, 'Helpful Resources for Authors', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, dolorum, vero ipsum molestiae minima odio quo voluptate illum excepturi quam cum voluptates doloribus quae nisi tempore necessitatibus dolores ducimus enim libero eaque explicabo suscipit animi at quaerat aliquid ex expedita perspiciatis? Saepe, aperiam, nam unde quas beatae vero vitae nulla.', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(4, 'Can I use trademarked names in my items?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, dolorum, vero ipsum molestiae minima odio quo voluptate illum excepturi quam cum voluptates doloribus quae nisi tempore necessitatibus dolores ducimus enim libero eaque explicabo suscipit animi at quaerat aliquid ex expedita perspiciatis? Saepe, aperiam, nam unde quas beatae vero vitae nulla.', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(5, 'How much money can I make?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, dolorum, vero ipsum molestiae minima odio quo voluptate illum excepturi quam cum voluptates doloribus quae nisi tempore necessitatibus dolores ducimus enim libero eaque explicabo suscipit animi at quaerat aliquid ex expedita perspiciatis? Saepe, aperiam, nam unde quas beatae vero vitae nulla.', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(6, 'How do I pay for items on the Marketplaces?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, dolorum, vero ipsum molestiae minima odio quo voluptate illum excepturi quam cum voluptates doloribus quae nisi tempore necessitatibus dolores ducimus enim libero eaque explicabo suscipit animi at quaerat aliquid ex expedita perspiciatis? Saepe, aperiam, nam unde quas beatae vero vitae nulla.', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `front_patient_testimonials`
--

CREATE TABLE `front_patient_testimonials` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_patient_testimonials`
--

INSERT INTO `front_patient_testimonials` (`id`, `name`, `designation`, `short_description`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'Kubernetes Inc.', 'Incidunt deleniti blanditiis quas aperiam recusandae consequatur ullam quibusdam cum libero illo rerum repellendus!', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(2, 'Mark Zukerberg', 'Envato Inc.', 'Natus voluptatum enim quod necessitatibus quis expedita harum provident eos obcaecati id culpa corporis molestias.', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_conversions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_price` double NOT NULL,
  `buying_price` double NOT NULL,
  `quantity` int NOT NULL,
  `available_quantity` int NOT NULL,
  `salt_composition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `side_effects` text COLLATE utf8mb4_unicode_ci,
  `currency_symbol` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_bills`
--

CREATE TABLE `medicine_bills` (
  `id` bigint UNSIGNED NOT NULL,
  `bill_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `net_amount` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `tax_amount` double(8,2) NOT NULL,
  `payment_status` int NOT NULL,
  `payment_type` int NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int UNSIGNED NOT NULL,
  `patient_unique_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `template_id` bigint UNSIGNED DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_unique_id`, `user_id`, `template_id`, `qr_code`, `created_at`, `updated_at`) VALUES
(1, 'UNIQUE12', 3, NULL, NULL, '2025-05-22 07:45:15', '2025-05-22 07:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_gateway_id` int NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `payment_gateway_id`, `payment_gateway`, `created_at`, `updated_at`) VALUES
(1, 1, 'Manually', '2025-05-22 07:45:18', '2025-05-22 07:45:18'),
(2, 2, 'Stripe', '2025-05-22 07:45:18', '2025-05-22 07:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage_doctors_holiday', 'Manage Doctors Holiday', 'web', '2025-05-22 07:45:13', '2025-05-22 07:45:13'),
(2, 'manage_medicines', 'Manage Medicines', 'web', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(3, 'manage_doctors', 'Manage Doctors', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(4, 'manage_patients', 'Manage Patients', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(5, 'manage_appointments', 'Manage Appointments', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(6, 'manage_patient_visits', 'Manage Patient Visits', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(7, 'manage_staff', 'Manage Staff', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(8, 'manage_doctor_sessions', 'Manage Doctor Sessions', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(9, 'manage_settings', 'Manage Settings', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(10, 'manage_services', 'Manage Services', 'web', '2025-05-22 07:45:16', '2025-05-22 07:45:16'),
(11, 'manage_specialities', 'Manage Specialities', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(12, 'manage_countries', 'Manage Countries', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(13, 'manage_states', 'Manage States', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(14, 'manage_cities', 'Manage Cities', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(15, 'manage_roles', 'Manage Roles', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(16, 'manage_currencies', 'Manage Currencies', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(17, 'manage_admin_dashboard', 'Manage Admin Dashboard', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(18, 'manage_front_cms', 'Manage Front CMS', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(19, 'manage_transactions', 'Manage Transactions', 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `appointment_id` bigint UNSIGNED NOT NULL,
  `patient_id` int UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED DEFAULT NULL,
  `food_allergies` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tendency_bleed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heart_disease` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `high_blood_pressure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diabetic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surgery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accident` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `others` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_history` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_medication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `female_pregnancy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breast_feeding` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `health_insurance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `low_income` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `plus_rate` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temperature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `problem_description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advice` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions_medicines`
--

CREATE TABLE `prescriptions_medicines` (
  `id` bigint UNSIGNED NOT NULL,
  `prescription_id` bigint UNSIGNED NOT NULL,
  `medicine` bigint UNSIGNED NOT NULL,
  `dosage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dose_interval` int NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_medicines`
--

CREATE TABLE `purchased_medicines` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_medicines_id` bigint UNSIGNED NOT NULL,
  `medicine_id` bigint UNSIGNED DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `lot_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_medicines`
--

CREATE TABLE `purchase_medicines` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `net_amount` double(8,2) NOT NULL,
  `payment_type` int NOT NULL,
  `discount` double(8,2) NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `university` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `patient_id` int UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `is_default`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'clinic_admin', 'Clinic Admin', 1, 'web', '2025-05-22 07:45:13', '2025-05-22 07:45:13'),
(2, 'doctor', 'Doctor', 1, 'web', '2025-05-22 07:45:13', '2025-05-22 07:45:13'),
(3, 'patient', 'Patient', 1, 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(4, 'staff', 'Staff', 0, 'web', '2025-05-22 07:45:17', '2025-05-22 07:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(2, 2),
(5, 2),
(6, 2),
(19, 2),
(5, 3),
(6, 3),
(19, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sale_medicines`
--

CREATE TABLE `sale_medicines` (
  `id` bigint UNSIGNED NOT NULL,
  `medicine_bill_id` bigint UNSIGNED NOT NULL,
  `medicine_id` bigint UNSIGNED NOT NULL,
  `sale_quantity` int NOT NULL,
  `sale_price` double(8,2) NOT NULL,
  `tax` double(8,2) NOT NULL,
  `expiry_date` datetime NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charges` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `category_id`, `name`, `charges`, `status`, `created_at`, `updated_at`, `short_description`) VALUES
(1, 1, 'Diagnostics', 500, 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17', 'Phasellus venenatis porta rhoncus. Integer et viverra felis.'),
(2, 2, 'Treatment', 500, 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17', 'Phasellus venenatis porta rhoncus. Integer et viverra felis.'),
(3, 1, 'Surgery', 500, 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17', 'Phasellus venenatis porta rhoncus. Integer et viverra felis.'),
(4, 4, 'Emergency', 500, 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17', 'Phasellus venenatis porta rhoncus. Integer et viverra felis.'),
(5, 4, 'Vaccine', 500, 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17', 'Phasellus venenatis porta rhoncus. Integer et viverra felis.'),
(6, 1, 'Qualified Doctors', 500, 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17', 'Phasellus venenatis porta rhoncus. Integer et viverra felis.');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dentist', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(2, 'Dieticians', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(3, 'General Physicians', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(4, 'Gynecologists', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(5, 'physiotherapy', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(6, 'Psychologist', '2025-05-22 07:45:17', '2025-05-22 07:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `service_doctor`
--

CREATE TABLE `service_doctor` (
  `id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_doctor`
--

INSERT INTO `service_doctor` (`id`, `service_id`, `doctor_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `session_week_days`
--

CREATE TABLE `session_week_days` (
  `id` bigint UNSIGNED NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `doctor_session_id` bigint UNSIGNED NOT NULL,
  `day_of_week` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'default_country_code', 'uz', '2025-05-22 07:45:13', '2025-05-22 07:45:13'),
(2, 'language', 'en', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(3, 'recaptcha', '0', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(4, 'googleCaptchaKey', '', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(5, 'googleCaptchaSecret', '', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(6, 'clinic_name', 'E-Care Health Systems', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(7, 'contact_no', '910017777', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(8, 'email', 'mufam003@ecare.com', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(9, 'specialities', '1', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(10, 'currency', '1', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(11, 'address_one', '12 Istiqbol St, Tashkent, Uzbekistan', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(12, 'address_two', '13 Istiqbol St, Tashkent, Uzbekistan', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(13, 'country_id', '1', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(14, 'state_id', '2', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(15, 'city_id', '1', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(16, 'postal_code', '100043', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(17, 'logo', 'assets/image/ecare-logo.png', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(18, 'favicon', 'assets/image/favicon-ecare.png', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(19, 'region_code', '998', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(20, 'terms_conditions', 'Terms and Conditions', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(21, 'privacy_policy', 'Privacy Policy', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(22, 'about_title', 'What We do Actually', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(23, 'about_short_description', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur necessitatibus placeat numquam enim adipisci nostrum facilis distinctio modi, cupiditate laborum ea eius repellendus? Obcaecati saepe numquam pariatur aliquid, aspernatur necessitatibus dolores harum quos eum esse, laudantium odit alias, iste dolorem!', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(24, 'email_verified', '1', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(25, 'about_image_1', 'assets/front/images/about/pic-2.jpg', '2025-05-22 07:45:17', '2025-05-22 07:45:17'),
(26, 'about_image_2', 'assets/front/images/about/pic-1.jpg', '2025-05-22 07:45:18', '2025-05-22 07:45:18'),
(27, 'about_image_3', 'assets/front/images/about/pic-3.jpg', '2025-05-22 07:45:18', '2025-05-22 07:45:18'),
(28, 'about_experience', '20', '2025-05-22 07:45:18', '2025-05-22 07:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `short_description`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'We Provide All Health Care Solution', 'Protect Your Health And Take Care To Of Your Health', 1, '2025-05-22 07:45:17', '2025-05-22 07:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `smart_patient_cards`
--

CREATE TABLE `smart_patient_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_email` tinyint(1) NOT NULL DEFAULT '1',
  `show_phone` tinyint(1) NOT NULL DEFAULT '1',
  `show_dob` tinyint(1) NOT NULL DEFAULT '1',
  `show_blood_group` tinyint(1) NOT NULL DEFAULT '1',
  `show_address` tinyint(1) NOT NULL DEFAULT '1',
  `show_patient_unique_id` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smart_patient_cards`
--

INSERT INTO `smart_patient_cards` (`id`, `template_name`, `address`, `header_color`, `show_email`, `show_phone`, `show_dob`, `show_blood_group`, `show_address`, `show_patient_unique_id`, `created_at`, `updated_at`) VALUES
(1, 'BadgeDef', 'Tashkent, Uzbekistan', '#ffffff', 1, 1, 1, 1, 1, 1, '2025-05-22 07:45:18', '2025-05-22 07:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Marine Medicine', '2025-05-22 07:45:14', '2025-05-22 07:45:14'),
(2, 'Medical Genetics', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(3, 'Microbiology', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(4, 'Nuclear Medicine', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(5, 'Paediatrics', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(6, 'Palliative Medicine', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(7, 'Pathology', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(8, 'Pharmacology', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(9, 'Psychiatry', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(10, 'Physiology', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(11, 'Physical Medicine', '2025-05-22 07:45:15', '2025-05-22 07:45:15'),
(12, 'Radiotherapy', '2025-05-22 07:45:15', '2025-05-22 07:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'Tashkent', 1, NULL, NULL),
(2, 'Samarkand', 1, NULL, NULL),
(3, 'Moscow', 2, NULL, NULL),
(4, 'Saint-Petersburg', 2, NULL, NULL),
(5, 'Almaty', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribe` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `type` int NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `accepted_by` bigint UNSIGNED DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `used_medicines`
--

CREATE TABLE `used_medicines` (
  `id` bigint UNSIGNED NOT NULL,
  `stock_used` int NOT NULL,
  `medicine_id` bigint UNSIGNED DEFAULT NULL,
  `model_id` int NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int DEFAULT NULL,
  `blood_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `contact`, `dob`, `gender`, `status`, `language`, `email_verified_at`, `password`, `type`, `blood_group`, `region_code`, `remember_token`, `created_at`, `updated_at`, `email_notification`, `time_zone`, `dark_mode`) VALUES
(1, 'Super', 'Admin', 'admin@ecare.com', '1234567890', NULL, 1, 1, 'en', '2025-05-22 07:45:15', '$2y$10$K.469ZZZUBXtqs85czm48uaLnQmqeiKo1O9.6Gf8Fi2n4JWmuZEQO', 1, NULL, '998', NULL, '2025-05-22 07:45:15', '2025-05-22 07:45:15', 1, NULL, 0),
(2, 'Conor', 'McGregor', 'doctor@ecare.com', '1234567890', NULL, 1, 1, 'en', '2025-05-22 07:45:15', '$2y$10$wYcUWN7PBwpPwwIBe5AKFObUDX37hmljKXn9yxsKnoR20GwBcFUF2', 2, NULL, NULL, NULL, '2025-05-22 07:45:15', '2025-05-22 07:45:15', 1, NULL, 0),
(3, 'Michael', 'Jordan', 'patient@ecare.com', '1234567890', NULL, 1, 1, 'en', '2025-05-22 07:45:15', '$2y$10$SwhrVgtKlBZAwEauiLbQj.8LZbFj0EB5mKdXmFE4m1oPa2uY0Z.xG', 3, NULL, NULL, NULL, '2025-05-22 07:45:15', '2025-05-22 07:45:15', 1, NULL, 0),
(4, 'John', 'Doe', 'john@gamil.com', '1234567890', NULL, 1, 1, 'en', '2025-05-22 07:45:17', '$2y$10$qEWD0bKrgIJIUWiyh1PYAethlKhDXO3csLR3YDDAK8lpemz04S3qa', 4, NULL, '998', NULL, '2025-05-22 07:45:17', '2025-05-22 07:45:17', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint UNSIGNED NOT NULL,
  `visit_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `patient_id` int UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_notes`
--

CREATE TABLE `visit_notes` (
  `id` int UNSIGNED NOT NULL,
  `note_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_observations`
--

CREATE TABLE `visit_observations` (
  `id` int UNSIGNED NOT NULL,
  `observation_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_prescriptions`
--

CREATE TABLE `visit_prescriptions` (
  `id` int UNSIGNED NOT NULL,
  `visit_id` bigint UNSIGNED NOT NULL,
  `prescription_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_problems`
--

CREATE TABLE `visit_problems` (
  `id` int UNSIGNED NOT NULL,
  `problem_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_country_id_foreign` (`country_id`),
  ADD KEY `addresses_state_id_foreign` (`state_id`),
  ADD KEY `addresses_city_id_foreign` (`city_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_service_id_foreign` (`service_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `clinic_schedules`
--
ALTER TABLE `clinic_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`);

--
-- Indexes for table `doctor_holidays`
--
ALTER TABLE `doctor_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_holidays_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `doctor_sessions`
--
ALTER TABLE `doctor_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_sessions_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `doctor_specialization`
--
ALTER TABLE `doctor_specialization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_specialization_doctor_id_foreign` (`doctor_id`),
  ADD KEY `doctor_specialization_specialization_id_foreign` (`specialization_id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_patient_testimonials`
--
ALTER TABLE `front_patient_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_id`,`model_type`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicines_category_id_foreign` (`category_id`),
  ADD KEY `medicines_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `medicine_bills`
--
ALTER TABLE `medicine_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patients_patient_unique_id_unique` (`patient_unique_id`),
  ADD KEY `patients_user_id_foreign` (`user_id`),
  ADD KEY `patients_template_id_foreign` (`template_id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_patient_id_foreign` (`patient_id`),
  ADD KEY `prescriptions_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `prescriptions_medicines`
--
ALTER TABLE `prescriptions_medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_medicines_prescription_id_foreign` (`prescription_id`),
  ADD KEY `prescriptions_medicines_medicine_foreign` (`medicine`);

--
-- Indexes for table `purchased_medicines`
--
ALTER TABLE `purchased_medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchased_medicines_medicine_id_foreign` (`medicine_id`),
  ADD KEY `purchased_medicines_purchase_medicines_id_foreign` (`purchase_medicines_id`);

--
-- Indexes for table `purchase_medicines`
--
ALTER TABLE `purchase_medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_patient_id_foreign` (`patient_id`),
  ADD KEY `reviews_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sale_medicines`
--
ALTER TABLE `sale_medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_category_id_foreign` (`category_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_doctor`
--
ALTER TABLE `service_doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_doctor_service_id_foreign` (`service_id`),
  ADD KEY `service_doctor_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `session_week_days`
--
ALTER TABLE `session_week_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_week_days_doctor_id_foreign` (`doctor_id`),
  ADD KEY `session_week_days_doctor_session_id_foreign` (`doctor_session_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smart_patient_cards`
--
ALTER TABLE `smart_patient_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribes_email_unique` (`email`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_accepted_by_foreign` (`accepted_by`);

--
-- Indexes for table `used_medicines`
--
ALTER TABLE `used_medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `used_medicines_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_doctor_id_foreign` (`doctor_id`),
  ADD KEY `visits_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `visit_notes`
--
ALTER TABLE `visit_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_notes_visit_id_foreign` (`visit_id`);

--
-- Indexes for table `visit_observations`
--
ALTER TABLE `visit_observations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_observations_visit_id_foreign` (`visit_id`);

--
-- Indexes for table `visit_prescriptions`
--
ALTER TABLE `visit_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_prescriptions_visit_id_foreign` (`visit_id`);

--
-- Indexes for table `visit_problems`
--
ALTER TABLE `visit_problems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_problems_visit_id_foreign` (`visit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48357;

--
-- AUTO_INCREMENT for table `clinic_schedules`
--
ALTER TABLE `clinic_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_holidays`
--
ALTER TABLE `doctor_holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_sessions`
--
ALTER TABLE `doctor_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_specialization`
--
ALTER TABLE `doctor_specialization`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_patient_testimonials`
--
ALTER TABLE `front_patient_testimonials`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_bills`
--
ALTER TABLE `medicine_bills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions_medicines`
--
ALTER TABLE `prescriptions_medicines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchased_medicines`
--
ALTER TABLE `purchased_medicines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_medicines`
--
ALTER TABLE `purchase_medicines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sale_medicines`
--
ALTER TABLE `sale_medicines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_doctor`
--
ALTER TABLE `service_doctor`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `session_week_days`
--
ALTER TABLE `session_week_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smart_patient_cards`
--
ALTER TABLE `smart_patient_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4122;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `used_medicines`
--
ALTER TABLE `used_medicines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_notes`
--
ALTER TABLE `visit_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_observations`
--
ALTER TABLE `visit_observations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_prescriptions`
--
ALTER TABLE `visit_prescriptions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_problems`
--
ALTER TABLE `visit_problems`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_holidays`
--
ALTER TABLE `doctor_holidays`
  ADD CONSTRAINT `doctor_holidays_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_sessions`
--
ALTER TABLE `doctor_sessions`
  ADD CONSTRAINT `doctor_sessions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_specialization`
--
ALTER TABLE `doctor_specialization`
  ADD CONSTRAINT `doctor_specialization_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctor_specialization_specialization_id_foreign` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `medicines_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `medicines_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `smart_patient_cards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions_medicines`
--
ALTER TABLE `prescriptions_medicines`
  ADD CONSTRAINT `prescriptions_medicines_medicine_foreign` FOREIGN KEY (`medicine`) REFERENCES `medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_medicines_prescription_id_foreign` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchased_medicines`
--
ALTER TABLE `purchased_medicines`
  ADD CONSTRAINT `purchased_medicines_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `purchased_medicines_purchase_medicines_id_foreign` FOREIGN KEY (`purchase_medicines_id`) REFERENCES `purchase_medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD CONSTRAINT `qualifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_doctor`
--
ALTER TABLE `service_doctor`
  ADD CONSTRAINT `service_doctor_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_doctor_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_week_days`
--
ALTER TABLE `session_week_days`
  ADD CONSTRAINT `session_week_days_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `session_week_days_doctor_session_id_foreign` FOREIGN KEY (`doctor_session_id`) REFERENCES `doctor_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_accepted_by_foreign` FOREIGN KEY (`accepted_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `used_medicines`
--
ALTER TABLE `used_medicines`
  ADD CONSTRAINT `used_medicines_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visits_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit_notes`
--
ALTER TABLE `visit_notes`
  ADD CONSTRAINT `visit_notes_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit_observations`
--
ALTER TABLE `visit_observations`
  ADD CONSTRAINT `visit_observations_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit_prescriptions`
--
ALTER TABLE `visit_prescriptions`
  ADD CONSTRAINT `visit_prescriptions_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit_problems`
--
ALTER TABLE `visit_problems`
  ADD CONSTRAINT `visit_problems_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

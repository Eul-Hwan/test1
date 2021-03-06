-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.6-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- test 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `test`;

-- 테이블 test.blogcategories 구조 내보내기
CREATE TABLE IF NOT EXISTS `blogcategories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.blogcategories:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `blogcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogcategories` ENABLE KEYS */;

-- 테이블 test.blogs 구조 내보내기
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `featuredImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaDescription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.blogs:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;

-- 테이블 test.blogtags 구조 내보내기
CREATE TABLE IF NOT EXISTS `blogtags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.blogtags:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `blogtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogtags` ENABLE KEYS */;

-- 테이블 test.categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iconImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.categories:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `categoryName`, `iconImage`, `created_at`, `updated_at`) VALUES
	(3, 'F-15K', '/uploads/1608449653.jpg', '2020-12-20 13:37:56', '2020-12-20 16:34:15'),
	(6, 'F-22', '/uploads/1608591179.jpg', '2020-12-22 07:53:01', '2020-12-22 07:53:01'),
	(8, 'AH-1Z', '/uploads/1608591228.jpg', '2020-12-22 07:53:50', '2020-12-22 07:53:50');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- 테이블 test.failed_jobs 구조 내보내기
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.failed_jobs:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- 테이블 test.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.migrations:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2020_12_17_222220_create_categories_table', 1),
	(5, '2020_12_17_222404_create_tags_table', 1),
	(6, '2020_12_17_222442_create_blogs_table', 1),
	(7, '2020_12_17_222530_create_blogtags_table', 1),
	(8, '2020_12_17_222604_create_blogcategories_table', 1),
	(9, '2020_12_23_163518_create_roles_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- 테이블 test.password_resets 구조 내보내기
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.password_resets:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- 테이블 test.roles 구조 내보내기
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.roles:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `roleName`, `permission`, `isAdmin`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', '[{"resourceName":"Home","read":true,"write":true,"update":true,"delete":true,"name":"/"},{"resourceName":"Tags","read":true,"write":true,"update":true,"delete":true,"name":"tags"},{"resourceName":"Category","read":true,"write":true,"update":true,"delete":true,"name":"category"},{"resourceName":"Create blogs","read":true,"write":true,"update":true,"delete":true,"name":"createBlog"},{"resourceName":"Admin Users","read":true,"write":true,"update":true,"delete":true,"name":"adminusers"},{"resourceName":"Role","read":true,"write":true,"update":true,"delete":true,"name":"role"},{"resourceName":"Assign Role","read":true,"write":true,"update":true,"delete":true,"name":"assignRole"}]', 1, '2020-12-23 18:27:14', '2020-12-26 22:44:22'),
	(2, 'Editor', '[{"resourceName":"Tags","read":true,"write":true,"update":true,"delete":false,"name":"tags"},{"resourceName":"Category","read":true,"write":true,"update":false,"delete":false,"name":"category"},{"resourceName":"Admin Users","read":false,"write":false,"update":false,"delete":false,"name":"adminusers"},{"resourceName":"Role","read":false,"write":false,"update":false,"delete":false,"name":"role"},{"resourceName":"Assign Role","read":false,"write":false,"update":false,"delete":false,"name":"assignRole"},{"resourceName":"Home","read":false,"write":false,"update":false,"delete":false,"name":"/"}]', 1, '2020-12-23 18:31:17', '2020-12-25 06:39:40'),
	(3, 'Moderator', '[{"resourceName":"Tags","read":true,"write":true,"update":false,"delete":false,"name":"tags"},{"resourceName":"Category","read":true,"write":true,"update":false,"delete":false,"name":"category"},{"resourceName":"Admin Users","read":false,"write":false,"update":false,"delete":false,"name":"adminusers"},{"resourceName":"Role","read":false,"write":false,"update":false,"delete":false,"name":"role"},{"resourceName":"Assign Role","read":false,"write":false,"update":false,"delete":false,"name":"assignRole"},{"resourceName":"Home","read":false,"write":false,"update":false,"delete":false,"name":"/"}]', 1, '2020-12-23 18:31:50', '2020-12-24 23:25:55'),
	(4, 'User', '', 0, '2020-12-23 18:31:50', '2020-12-24 23:18:24');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 테이블 test.tags 구조 내보내기
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.tags:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `tagName`, `created_at`, `updated_at`) VALUES
	(6, 'Vue.js', '2020-12-19 10:52:20', '2020-12-19 10:52:20'),
	(10, 'Javascript', '2020-12-21 20:07:59', '2020-12-21 20:07:59'),
	(11, 'Laravel', '2020-12-22 07:57:15', '2020-12-22 07:57:15');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- 테이블 test.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `isActivated` tinyint(1) NOT NULL DEFAULT 0,
  `passwordResetCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activationCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test.users:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `fullName`, `email`, `password`, `role_id`, `isActivated`, `passwordResetCode`, `activationCode`, `socialType`, `created_at`, `updated_at`) VALUES
	(1, 'IU', 'IU@IU.com', '$2y$10$4xj8RmjZqp5yByveuPz.rO0p6Z4bNk.FA/WE0MJ4SMUgBx58/B64.', 1, 0, NULL, NULL, NULL, '2020-12-22 16:38:35', '2020-12-22 20:06:52'),
	(2, 'YOU', 'YOU@YOU.com', '$2y$10$P310Kd/KAnVIskmmB7hG0.pFIDVOy008ilzGiUiW3I6gMThaZwd6e', 2, 0, NULL, NULL, NULL, '2020-12-22 16:41:48', '2020-12-22 16:41:48'),
	(4, 'Moderator', 'Moderator@gmail.com', '$2y$10$vaNYikxXEm6nm9O8v9lqzuqKV8PTiOXKsCMvOQzem9CDnjgO6Ymee', 3, 0, NULL, NULL, NULL, '2020-12-23 23:55:10', '2020-12-23 23:55:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

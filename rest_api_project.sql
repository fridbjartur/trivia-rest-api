-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2021 at 08:08 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest_api_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answer_id` bigint(20) UNSIGNED NOT NULL,
  `answer_question_fk` bigint(20) UNSIGNED NOT NULL,
  `answer_text` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_is_correct` tinyint(1) NOT NULL,
  `answer_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`answer_id`, `answer_question_fk`, `answer_text`, `answer_is_correct`, `answer_created`) VALUES
(10, 4, 'Tjaldri', 1, '2021-04-26 21:18:57'),
(11, 4, 'Lundi', 0, '2021-04-26 21:18:57'),
(12, 4, 'Æva', 0, '2021-04-26 21:19:21'),
(13, 4, 'Dunna', 0, '2021-04-26 21:19:21'),
(14, 3, 'Rætt', 0, '2021-04-26 21:19:43'),
(15, 3, 'Skeift', 1, '2021-04-26 21:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`, `category_created`) VALUES
(1, 'Almenn vitan', '2021-04-25 22:01:20'),
(2, 'Bøkur', '2021-04-25 22:01:20'),
(3, 'Filmar', '2021-04-25 22:02:50'),
(4, 'Tónleikur', '2021-04-25 22:02:50'),
(5, 'Songleikir', '2021-04-25 22:15:42'),
(6, 'Leiklist', '2021-04-25 22:16:10'),
(7, 'Sjónvarp', '2021-04-25 22:16:10'),
(8, 'Videospøl', '2021-04-25 22:16:10'),
(9, 'Borðspøl', '2021-04-25 22:16:10'),
(10, 'Náttúruvísindi', '2021-04-25 22:16:10'),
(11, 'Teldufrøði', '2021-04-25 22:16:10'),
(12, 'Støddfrøði', '2021-04-25 22:16:10'),
(13, 'Gudalæra', '2021-04-25 22:16:10'),
(14, 'Ítróttur', '2021-04-25 22:16:10'),
(15, 'Landalæra', '2021-04-25 22:16:10'),
(16, 'Søga', '2021-04-25 22:16:10'),
(17, 'Politikkur', '2021-04-25 22:16:10'),
(18, 'List', '2021-04-25 22:16:10'),
(19, 'Kend fólk', '2021-04-25 22:16:10'),
(20, 'Dýr', '2021-04-25 22:16:10'),
(21, 'Akfør', '2021-04-25 22:16:10'),
(22, 'Mállæra', '2021-04-25 22:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `difficulties`
--

CREATE TABLE `difficulties` (
  `difficulty_id` bigint(20) UNSIGNED NOT NULL,
  `difficulty_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `difficulty_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `difficulties`
--

INSERT INTO `difficulties` (`difficulty_id`, `difficulty_title`, `difficulty_created`) VALUES
(1, 'kids', '2021-04-25 22:19:48'),
(2, 'easy', '2021-04-25 22:19:48'),
(3, 'medium', '2021-04-25 22:20:00'),
(4, 'hard', '2021-04-25 22:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `question_user_fk` bigint(20) UNSIGNED NOT NULL,
  `question_category_fk` bigint(20) UNSIGNED NOT NULL,
  `question_type_fk` bigint(20) UNSIGNED NOT NULL,
  `question_difficulty_fk` bigint(20) UNSIGNED NOT NULL,
  `question_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `question_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question_user_fk`, `question_category_fk`, `question_type_fk`, `question_difficulty_fk`, `question_text`, `question_created`, `question_active`) VALUES
(3, 1, 4, 1, 2, 'Hvør vann ársins sangari FMA 2020?', '2021-04-26 21:18:21', 1),
(4, 5, 20, 1, 1, 'Hvussu eitur tjóðarfuglur okkara?', '2021-04-26 21:18:21', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `questions_view`
-- (See below for the actual view)
--
CREATE TABLE `questions_view` (
`id` bigint(20) unsigned
,`author` mediumtext
,`category` varchar(50)
,`type` varchar(50)
,`difficulty` varchar(50)
,`question` varchar(255)
,`correct_answer` varchar(50)
,`created` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `type_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`type_id`, `type_title`, `type_created`) VALUES
(1, 'multiple', '2021-04-25 22:17:38'),
(2, 'boolean', '2021-04-25 22:17:38'),
(3, 'single', '2021-04-25 22:18:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_verification_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_verified` tinyint(1) NOT NULL DEFAULT 0,
  `user_active` tinyint(1) NOT NULL DEFAULT 1,
  `user_is_staff` tinyint(1) NOT NULL DEFAULT 0,
  `user_last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_first_name`, `user_last_name`, `user_username`, `user_email`, `user_password`, `user_verification_code`, `user_verified`, `user_active`, `user_is_staff`, `user_last_login`, `user_created`) VALUES
(1, 'aa', 'aaa', NULL, 'a@a.com', '$2y$10$WWC4ayBdbkh3k0PFHDY8yugpPB4a9h2m5pdeWFwOh7yKDmqFRy5mG', '16085ca56a9ea1', 0, 0, 0, '2021-04-25 22:00:22', '2021-04-25 22:00:22'),
(5, 'bb', 'bbb', NULL, 'b@b.com', '1234', 'gfg5etsb5646456bvasd', 0, 1, 0, '2021-04-26 18:58:02', '2021-04-26 18:58:02');

-- --------------------------------------------------------

--
-- Structure for view `questions_view`
--
DROP TABLE IF EXISTS `questions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `questions_view`  AS SELECT `questions`.`question_id` AS `id`, group_concat(`users`.`user_first_name`,' ',`users`.`user_last_name` separator ',') AS `author`, `categories`.`category_title` AS `category`, `types`.`type_title` AS `type`, `difficulties`.`difficulty_title` AS `difficulty`, `questions`.`question_text` AS `question`, `answers`.`answer_text` AS `correct_answer`, `questions`.`question_created` AS `created` FROM (((((`questions` join `users` on(`questions`.`question_user_fk` = `users`.`user_id`)) join `categories` on(`questions`.`question_category_fk` = `categories`.`category_id`)) join `types` on(`questions`.`question_type_fk` = `types`.`type_id`)) join `difficulties` on(`questions`.`question_difficulty_fk` = `difficulties`.`difficulty_id`)) join `answers` on(`questions`.`question_id` = `answers`.`answer_question_fk` and `answers`.`answer_is_correct` = 1)) GROUP BY `questions`.`question_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `answer_question_fk` (`answer_question_fk`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `difficulties`
--
ALTER TABLE `difficulties`
  ADD PRIMARY KEY (`difficulty_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `question_user_fk` (`question_user_fk`),
  ADD KEY `question_category_fk` (`question_category_fk`),
  ADD KEY `question_type_fk` (`question_type_fk`),
  ADD KEY `question_difficulty_fk` (`question_difficulty_fk`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `difficulties`
--
ALTER TABLE `difficulties`
  MODIFY `difficulty_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answer_question_fk` FOREIGN KEY (`answer_question_fk`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `question_category_fk` FOREIGN KEY (`question_category_fk`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_difficulty_fk` FOREIGN KEY (`question_difficulty_fk`) REFERENCES `difficulties` (`difficulty_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_type_fk` FOREIGN KEY (`question_type_fk`) REFERENCES `types` (`type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_user_fk` FOREIGN KEY (`question_user_fk`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

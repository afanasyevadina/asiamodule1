-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 29 2021 г., 14:32
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'Security'),
(2, 'Office Point'),
(3, 'Security'),
(4, 'Security');

-- --------------------------------------------------------

--
-- Структура таблицы `group_points`
--

CREATE TABLE `group_points` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `point_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `group_points`
--

INSERT INTO `group_points` (`id`, `group_id`, `point_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(6, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `group_staff`
--

CREATE TABLE `group_staff` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `group_staff`
--

INSERT INTO `group_staff` (`id`, `group_id`, `staff_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `access` tinyint(1) NOT NULL,
  `camera` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `staff_id`, `point_id`, `access`, `camera`, `created_at`) VALUES
(1, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:25:10'),
(2, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:29:16'),
(3, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:29:32'),
(4, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:29:55'),
(5, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:30:26'),
(6, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:31:16'),
(7, 4, 3, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:31:24'),
(8, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:31:32'),
(9, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:35:11'),
(10, 4, 1, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', '2021-07-29 00:35:15');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_07_26_062243_staff_create', 2),
(4, '2021_07_26_062455_access_groups', 2),
(5, '2021_07_26_062541_points', 2),
(6, '2021_07_26_062624_logs', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `points`
--

CREATE TABLE `points` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `points`
--

INSERT INTO `points` (`id`, `parent`, `name`) VALUES
(1, NULL, 'Point 1'),
(2, NULL, 'Point 2'),
(3, NULL, 'Office Point'),
(4, 2, 'Office Place'),
(5, 4, 'Office Place'),
(6, NULL, 'Office Place');

-- --------------------------------------------------------

--
-- Структура таблицы `staff`
--

CREATE TABLE `staff` (
  `id` int(11) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `staff`
--

INSERT INTO `staff` (`id`, `full_name`, `photo`, `code`) VALUES
(1, 'Staff 1', 'http://laravel/storage/staff/HlW1cljToVXupi0meSw9cp2jgCV55uWZEZ8vUaic.jpg', 'vg3bM1IWv9nUsoBmRUMjjFJpxEnPdqeA'),
(2, 'Staff 2', 'http://laravel/storage/staff/UnUIrqvkRwCYizs4c5N6d4MHWjrnsylvLXFIYNKI.jpg', 'zseAUE6sQUeegkrGxQ4N2j0QpXmain58'),
(3, 'Demo employee', 'http://laravel/storage/staff/S18kQ8rTWjHdinYgcLhaHhIW3IFIAbdN99bkqDvJ.jpg', 'dhcc7nxD9DR5i20devpQlXffQtjFkBXS'),
(4, 'Staff Ivanov', 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 'cZbGn6zXBxZtwQXGm43vEbI7ia6ovfvV'),
(5, 'Staff Ivanov', 'http://wsa-m1/storage/staff/vLOEY4RUgjFt3myo30r5lPsVZE4zVbyrkNgymed2.jpeg', 'RtExTlmQGesxYpZEYoERUsxiNdof7tmA'),
(6, 'Staff Ivanov', 'storage/staff/YW5nvq1SBVAQkURgf2ddMjpycSLCMYmIZaptiTp0.jpg', '5GGFQE8XODMrMKM93Vu67lYjbPQoFzoT');

-- --------------------------------------------------------

--
-- Структура таблицы `staff_accesses`
--

CREATE TABLE `staff_accesses` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `point_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `staff_accesses`
--

INSERT INTO `staff_accesses` (`id`, `staff_id`, `point_id`, `created_at`, `time`) VALUES
(1, 4, 3, '2021-07-29 00:28:36', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `full_name`, `login`, `email_verified_at`, `password`, `remember_token`, `token`, `created_at`, `updated_at`) VALUES
(1, 'name', 'email@a.b', NULL, '$2y$10$PqG.x/Ih8iP6hr5shdYgu.csnGfj6pg9UgqP7brWMiVblaA1nymcC', NULL, 'Mm0vYX2Qkgxh76iALQJHO7vdPphp7cqU', '2021-07-25 00:54:07', '2021-07-25 00:59:02'),
(2, 'Admin', 'admin', NULL, '1234', NULL, 'GqNuu9QHuLf4l7VtLDaU3FzdvJKftDFZ', '2021-07-26 00:48:56', '2021-07-28 23:18:55'),
(3, 'fdsfdsf', 'abc', NULL, '$2y$10$McomIJpF1dAqdzLwjQgKbOgt8cMkrq5f.arugfQyPgZZ7N03gxbUe', NULL, 'FGgw08hXLGFDhvmFWs3jB6WPJhPqUnAL', '2021-07-26 02:40:27', '2021-07-26 02:40:32'),
(4, 'qwerty', 'guest', NULL, '$2y$10$QoUsv7GjgQl6cdJ6BR9.Q.voJy60VDM7xU496In8tNlrqhJtqzmjG', NULL, 'R96X1hE3GyUY0YaooyK5wMzDogkDVdoq', '2021-07-26 02:57:10', '2021-07-26 02:57:10'),
(5, 'demo', 'temp', NULL, '$2y$10$A9NTdq5I6PwO5pCkmEUNtOi0uEqtJL7AkhjhiG3d7/2eo9O.0bOVu', NULL, 'V2AU5fWKrBlQ6VSg7Ph4UmEE9VGVG51q', '2021-07-26 02:57:48', '2021-07-26 02:57:57');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_points`
--
ALTER TABLE `group_points`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_staff`
--
ALTER TABLE `group_staff`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `staff_accesses`
--
ALTER TABLE `staff_accesses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `group_points`
--
ALTER TABLE `group_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `group_staff`
--
ALTER TABLE `group_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `staff_accesses`
--
ALTER TABLE `staff_accesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

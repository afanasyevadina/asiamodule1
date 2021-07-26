-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 26 2021 г., 12:21
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
-- Структура таблицы `access_groups`
--

CREATE TABLE `access_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `point_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `access_groups`
--

INSERT INTO `access_groups` (`id`, `staff_id`, `point_id`) VALUES
(3, 1, 1),
(4, 2, 2),
(5, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `access` tinyint(1) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `staff_id`, `point_id`, `access`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'http://laravel/logs/1627283808.jpg', '2021-07-26 01:16:48', '2021-07-26 01:16:48'),
(2, 1, 2, 0, 'http://laravel/logs/1627283816.jpg', '2021-07-26 01:16:56', '2021-07-26 01:16:56'),
(3, 1, 2, 0, 'http://laravel/logs/1627283818.jpg', '2021-07-26 01:16:58', '2021-07-26 01:16:58'),
(4, 1, 1, 1, 'http://laravel/logs/1627283823.jpg', '2021-07-26 01:17:03', '2021-07-26 01:17:03'),
(5, 1, 1, 1, 'http://laravel/logs/1627283964.jpg', '2021-07-26 01:19:24', '2021-07-26 01:19:24'),
(6, 2, 1, 0, 'http://laravel/logs/1627287583.jpg', '2021-07-26 02:19:43', '2021-07-26 02:19:43'),
(7, 2, 1, 0, 'http://laravel/logs/1627287587.jpg', '2021-07-25 02:19:47', '2021-07-26 02:19:47'),
(8, 2, 2, 1, 'http://laravel/logs/1627287604.jpg', '2021-07-25 02:20:04', '2021-07-26 02:20:04'),
(9, 3, 1, 0, 'http://laravel/logs/1627289270.jpg', '2021-07-24 02:47:50', '2021-07-26 02:47:50'),
(10, 3, 1, 0, 'http://laravel/logs/1627289301.jpg', '2021-07-24 02:48:21', '2021-07-26 02:48:21'),
(11, 3, 1, 1, 'http://laravel/logs/1627289324.jpg', '2021-07-02 02:48:44', '2021-07-26 02:48:44');

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
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `points`
--

INSERT INTO `points` (`id`, `parent_id`, `name`) VALUES
(1, NULL, 'Point 1'),
(2, NULL, 'Point 2');

-- --------------------------------------------------------

--
-- Структура таблицы `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `staffs`
--

INSERT INTO `staffs` (`id`, `full_name`, `photo`, `code`) VALUES
(1, 'Staff 1', 'http://laravel/storage/staff/HlW1cljToVXupi0meSw9cp2jgCV55uWZEZ8vUaic.jpg', 'vg3bM1IWv9nUsoBmRUMjjFJpxEnPdqeA'),
(2, 'Staff 2', 'http://laravel/storage/staff/UnUIrqvkRwCYizs4c5N6d4MHWjrnsylvLXFIYNKI.jpg', 'zseAUE6sQUeegkrGxQ4N2j0QpXmain58'),
(3, 'Demo employee', 'http://laravel/storage/staff/S18kQ8rTWjHdinYgcLhaHhIW3IFIAbdN99bkqDvJ.jpg', 'dhcc7nxD9DR5i20devpQlXffQtjFkBXS');

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
(2, 'Admin', 'admin', NULL, '$2y$10$ngy8mBXcxPb/EVXiBWZJjeaAr3BKveNK1kUAsouLi9AopBfXyzYwm', NULL, 'ASQAuSfufl0erkoBW3KoVs80bUKsOQoN', '2021-07-26 00:48:56', '2021-07-26 03:06:20'),
(3, 'fdsfdsf', 'abc', NULL, '$2y$10$McomIJpF1dAqdzLwjQgKbOgt8cMkrq5f.arugfQyPgZZ7N03gxbUe', NULL, 'FGgw08hXLGFDhvmFWs3jB6WPJhPqUnAL', '2021-07-26 02:40:27', '2021-07-26 02:40:32'),
(4, 'qwerty', 'guest', NULL, '$2y$10$QoUsv7GjgQl6cdJ6BR9.Q.voJy60VDM7xU496In8tNlrqhJtqzmjG', NULL, 'R96X1hE3GyUY0YaooyK5wMzDogkDVdoq', '2021-07-26 02:57:10', '2021-07-26 02:57:10'),
(5, 'demo', 'temp', NULL, '$2y$10$A9NTdq5I6PwO5pCkmEUNtOi0uEqtJL7AkhjhiG3d7/2eo9O.0bOVu', NULL, 'V2AU5fWKrBlQ6VSg7Ph4UmEE9VGVG51q', '2021-07-26 02:57:48', '2021-07-26 02:57:57');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `access_groups`
--
ALTER TABLE `access_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_groups_ibfk_1` (`point_id`),
  ADD KEY `access_groups_ibfk_2` (`staff_id`);

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
-- Индексы таблицы `staffs`
--
ALTER TABLE `staffs`
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
-- AUTO_INCREMENT для таблицы `access_groups`
--
ALTER TABLE `access_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `access_groups`
--
ALTER TABLE `access_groups`
  ADD CONSTRAINT `access_groups_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `access_groups_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

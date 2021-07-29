-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 29 2021 г., 08:13
-- Версия сервера: 10.4.12-MariaDB
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `asiamodule1`
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
-- Структура таблицы `group_point`
--

CREATE TABLE `group_point` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `point_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `group_point`
--

INSERT INTO `group_point` (`id`, `group_id`, `point_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(5, 1, 3),
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
  `timestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `staff_id`, `point_id`, `access`, `camera`, `timestamp`) VALUES
(1, 1, 1, 1, 'http://laravel/logs/1627283808.jpg', 20210726071648),
(2, 1, 2, 0, 'http://laravel/logs/1627283816.jpg', 20210726071656),
(3, 1, 2, 0, 'http://laravel/logs/1627283818.jpg', 20210726071658),
(4, 1, 1, 1, 'http://laravel/logs/1627283823.jpg', 20210726071703),
(5, 1, 1, 1, 'http://laravel/logs/1627283964.jpg', 20210726071924),
(6, 2, 1, 0, 'http://laravel/logs/1627287583.jpg', 20210726081943),
(7, 2, 1, 0, 'http://laravel/logs/1627287587.jpg', 20210725081947),
(8, 2, 2, 1, 'http://laravel/logs/1627287604.jpg', 20210725082004),
(9, 3, 1, 0, 'http://laravel/logs/1627289270.jpg', 20210724084750),
(10, 3, 1, 0, 'http://laravel/logs/1627289301.jpg', 20210724084821),
(11, 3, 1, 1, 'http://laravel/logs/1627289324.jpg', 20210702084844),
(12, 4, 1, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 20210728130952),
(13, 4, 1, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 20210728131100),
(14, 4, 2, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 20210728131224),
(15, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 20210728131228),
(16, 4, 4, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 20210728131232),
(17, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 20210728131300),
(18, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627478146),
(19, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627478209),
(20, 4, 4, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627482491),
(21, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627482532),
(22, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627482546),
(23, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627482559),
(24, 4, 3, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627482647),
(25, 4, 3, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627482656),
(26, 4, 3, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627482664),
(27, 4, 3, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627499448),
(28, 4, 5, 1, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627499462),
(29, 4, 6, 0, 'http://asiamodule1/storage/staff/FAFA5IYuxdP4KtYp5FUKvUY5cmaxwplpFSbuTbA0.jpg', 1627499527);

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
(5, 2, 'Office Place'),
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
(5, 'Staff Ivanov', 'http://wsa-m1/storage/staff/vLOEY4RUgjFt3myo30r5lPsVZE4zVbyrkNgymed2.jpeg', 'RtExTlmQGesxYpZEYoERUsxiNdof7tmA');

-- --------------------------------------------------------

--
-- Структура таблицы `staff_point`
--

CREATE TABLE `staff_point` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `point_id` int(11) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `staff_point`
--

INSERT INTO `staff_point` (`id`, `staff_id`, `point_id`, `timestamp`, `time`) VALUES
(1, 1, 3, 1627482426, 1230),
(2, 4, 3, 1627482612, 1230),
(3, 4, 3, 1627499548, 1230);

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
(2, 'Admin', 'admin', NULL, '1234', NULL, 'AJdgZipBbvAMXoWVqHU4NDfNNK5qpaR8', '2021-07-26 00:48:56', '2021-07-28 13:08:31'),
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
-- Индексы таблицы `group_point`
--
ALTER TABLE `group_point`
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
-- Индексы таблицы `staff_point`
--
ALTER TABLE `staff_point`
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
-- AUTO_INCREMENT для таблицы `group_point`
--
ALTER TABLE `group_point`
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `staff_point`
--
ALTER TABLE `staff_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

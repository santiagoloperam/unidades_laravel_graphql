-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2020 a las 04:52:29
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `unidades`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aptos`
--

CREATE TABLE `aptos` (
  `id` int(11) NOT NULL,
  `nomenclatura` varchar(45) NOT NULL,
  `unidad_id` int(10) UNSIGNED NOT NULL,
  `bloque_id` int(10) UNSIGNED NOT NULL,
  `tipo_apto_id` int(11) UNSIGNED NOT NULL,
  `propietario_id` bigint(20) UNSIGNED NOT NULL,
  `arrendatario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aptos`
--

INSERT INTO `aptos` (`id`, `nomenclatura`, `unidad_id`, `bloque_id`, `tipo_apto_id`, `propietario_id`, `arrendatario_id`, `created_at`, `updated_at`) VALUES
(1, '502 Saman', 3, 5, 3, 1, 2, NULL, NULL),
(2, 'casa 6', 3, 5, 3, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloques`
--

CREATE TABLE `bloques` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `unidad_id` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bloques`
--

INSERT INTO `bloques` (`id`, `nombre`, `unidad_id`, `updated_at`, `created_at`) VALUES
(2, 'A', 2, '2019-08-19 20:35:33', '2019-08-19 20:35:33'),
(3, 'B', 2, '2019-08-19 20:35:39', '2019-08-19 20:35:39'),
(4, 'C', 2, '2019-08-19 20:35:47', '2019-08-19 20:35:47'),
(5, 'Saman', 3, '2019-08-19 20:36:14', '2019-08-19 20:36:14'),
(6, 'Guayacan', 3, '2019-08-19 20:36:29', '2019-08-19 20:36:29'),
(7, 'Nogal', 3, '2019-08-19 20:36:37', '2019-08-19 20:36:37'),
(8, 'Interior 1', 4, '2019-08-20 01:39:34', '2019-08-20 01:39:34'),
(9, 'Interior 2', 4, '2019-08-20 01:40:04', '2019-08-20 01:40:04'),
(10, 'Interior 3', 4, '2019-08-20 01:40:15', '2019-08-20 01:40:15'),
(11, 'D', 2, '2019-08-21 01:30:02', '2019-08-21 01:30:02'),
(14, 'E1', 2, '2019-08-23 19:54:34', '2019-08-23 19:47:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_aptos`
--

CREATE TABLE `tipo_aptos` (
  `id` int(11) NOT NULL,
  `tipo_apto` varchar(45) NOT NULL,
  `cobro` float(9,2) NOT NULL,
  `vigencia` int(11) NOT NULL,
  `metros` int(4) NOT NULL,
  `unidad_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_aptos`
--

INSERT INTO `tipo_aptos` (`id`, `tipo_apto`, `cobro`, `vigencia`, `metros`, `unidad_id`, `created_at`, `updated_at`) VALUES
(1, '78m', 160000.00, 30, 78, 3, '2019-09-07 22:59:43', '2019-09-08 03:59:43'),
(2, '82M', 277000.00, 60, 82, 2, '2019-09-07 22:46:26', '2019-09-06 08:05:00'),
(3, '80m', 180000.00, 30, 80, 3, '2019-09-08 04:00:31', '2019-09-08 04:00:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

CREATE TABLE `tipo_usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_usuarios` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuarios`
--

INSERT INTO `tipo_usuarios` (`id`, `tipo_usuarios`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', NULL, NULL),
(2, 'admin', NULL, NULL),
(3, 'propietario', NULL, NULL),
(4, 'arrendatario', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `direccion`, `telefono`, `admin_id`, `active`, `created_at`, `updated_at`) VALUES
(2, 'Guadalupe Real', 'cra 52A #1A-22', '322222222', 2, 1, '2020-05-18 16:56:43', '2019-08-18 22:20:14'),
(3, 'Bosques de Cañaveralejo', 'Calle 1 #52-52', '333444555', 2, 1, '2020-05-18 16:56:49', '2019-08-18 22:20:57'),
(4, 'Guadalajara', 'cll13 #15-55', '333555777', 2, 1, '2020-05-18 16:56:53', '2019-08-20 01:38:53'),
(5, 'Unidad Santiago de Cali', 'cll 5 #45-20', '2223334445', 2, 1, '2020-05-18 16:56:58', '2019-08-23 19:04:50'),
(6, 'Caramanta II', 'calle 1A #53B', '55555555', 2, 1, '2020-05-18 16:57:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `tipo_usuario_id` int(11) UNSIGNED NOT NULL,
  `admin_id` int(11) UNSIGNED DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `dni`, `telefono`, `email_verified_at`, `password`, `active`, `tipo_usuario_id`, `admin_id`, `unidade_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Santiago', 'Lopera', 'santiagoloperam@gmail.com', '1234567', '1234567', NULL, '123456', 1, 1, 1, NULL, NULL, NULL, NULL),
(2, 'Luis Miguel', 'Paz', 'luismiguelpaz96@gmail.com', '123456789', '123456789', NULL, '123456', 0, 2, 1, NULL, NULL, NULL, NULL),
(4, 'Walter', 'Paz', 'walter.paz.00@gmail.com', '123', '123123', NULL, '123456', 1, 3, 2, NULL, NULL, '2020-05-20 02:07:12', '2020-05-20 05:47:48'),
(5, 'Juan', 'Perez', 'jp@gmail.com', '456456', '4564566', NULL, '123456', 1, 3, 1, 3, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aptos`
--
ALTER TABLE `aptos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unidad` (`unidad_id`),
  ADD KEY `id_bloque` (`bloque_id`),
  ADD KEY `id_tipo_apto` (`tipo_apto_id`),
  ADD KEY `id_propietario` (`propietario_id`),
  ADD KEY `id_arrendatario` (`arrendatario_id`);

--
-- Indices de la tabla `bloques`
--
ALTER TABLE `bloques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unidad` (`unidad_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `tipo_aptos`
--
ALTER TABLE `tipo_aptos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unidad` (`unidad_id`);

--
-- Indices de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_admin` (`admin_id`),
  ADD KEY `id_admin_2` (`admin_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aptos`
--
ALTER TABLE `aptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bloques`
--
ALTER TABLE `bloques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_aptos`
--
ALTER TABLE `tipo_aptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bloques`
--
ALTER TABLE `bloques`
  ADD CONSTRAINT `bloques_ibfk_1` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `tipo_aptos`
--
ALTER TABLE `tipo_aptos`
  ADD CONSTRAINT `tipo_aptos_ibfk_1` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

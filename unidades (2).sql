-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2020 a las 16:24:30
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateBloque` (IN `param_nombre` VARCHAR(45), `param_unidad_id` INT(10))  BEGIN
	INSERT INTO bloques(
 		nombre,
        unidad_id       
    )
    VALUES(
        param_nombre,
        param_unidad_id
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllUsers` ()  BEGIN
	SELECT * FROM `users` WHERE 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersById` (IN `paramid` BIGINT(20))  BEGIN
	SELECT * 
 	FROM users
	WHERE id = paramid;
END$$

DELIMITER ;

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
(2, 'casa 6', 3, 5, 3, 1, 2, NULL, NULL),
(3, '301 Nogal', 3, 5, 3, 1, 2, '2020-05-22 08:46:13', '2020-05-22 08:49:38');

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
(16, '2014_10_12_100000_create_password_resets_table', 2),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(20, '2016_06_01_000004_create_oauth_clients_table', 2),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('029c8ab3a650a8aca4dac7d91ed90c9648836f0d249bf42f997572023e5d7fc716ef4e26c619e00a', 22, 2, NULL, '[]', 0, '2020-06-03 18:46:29', '2020-06-03 18:46:29', '2021-06-03 13:46:29'),
('503874de359ada9d75e88c72d9c933486bde7546cdab114536c2ab57ea7d93e68b4e3a248b98f30f', 22, 2, NULL, '[]', 0, '2020-06-03 09:39:46', '2020-06-03 09:39:46', '2021-06-03 04:39:46'),
('68779c207e43b686d4773da04d0c413ab4f115e816ba83f2a4dea00716b45108f76b4d53d9756fdb', 22, 2, NULL, '[]', 0, '2020-06-03 09:34:47', '2020-06-03 09:34:47', '2021-06-03 04:34:47'),
('c0be0bda527f1c19c7641a26a884c668617226f4fa394cc4ef92f894c26f1497e72d592d63551da4', 21, 2, NULL, '[]', 0, '2020-06-03 09:15:16', '2020-06-03 09:15:16', '2021-06-03 04:15:16'),
('db1b5a3650e1753c4645ba9bc475eb6e501a4eb3ac6a9d1b05e78d9b27cd2ab3d6a9a01a435a7c30', 22, 2, NULL, '[]', 0, '2020-06-03 18:45:36', '2020-06-03 18:45:36', '2021-06-03 13:45:36'),
('ee5dc0877de770005ed604e8d82a43923d2e6ec890b61675c0467d6dcf8c71e27a17bd271db477f0', 22, 2, NULL, '[]', 0, '2020-06-03 09:32:46', '2020-06-03 09:32:46', '2021-06-03 04:32:46'),
('f2d970d9902fe2cf0b4927d96d4b82430b6ffadfe1acfc6cb76da4ed12598bbe77d9d38ba101b3ef', 22, 2, NULL, '[]', 0, '2020-06-03 18:43:55', '2020-06-03 18:43:55', '2021-06-03 13:43:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '8XNdBqL2TqmGRWSrNoAv4qICiWkbnUTHCxjJjmqT', NULL, 'http://localhost', 1, 0, 0, '2020-06-03 08:36:40', '2020-06-03 08:36:40'),
(2, NULL, 'Laravel Password Grant Client', '8vV97PuEdRrhq8hwQC0Q1ZE6L5qEtU2z9xxnwfqX', 'users', 'http://localhost', 0, 1, 0, '2020-06-03 08:36:40', '2020-06-03 08:36:40'),
(3, NULL, 'Laravel Personal Access Client', 'KNbD5kmbN1L2ayH2eYXdynLEoW8mbd3MTnBbC8Ay', NULL, 'http://localhost', 1, 0, 0, '2020-06-03 08:37:03', '2020-06-03 08:37:03'),
(4, NULL, 'Laravel Password Grant Client', '1R38k53iJms8jTNwP5cX4KgwkTwCbbnELKHsqaRU', 'users', 'http://localhost', 0, 1, 0, '2020-06-03 08:37:03', '2020-06-03 08:37:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-06-03 08:36:40', '2020-06-03 08:36:40'),
(2, 3, '2020-06-03 08:37:03', '2020-06-03 08:37:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0b77768856a71f08047cfe47b71c2a21708d704f93221b3d4a9da735bb34af859093d6fce8e9ec6a', '503874de359ada9d75e88c72d9c933486bde7546cdab114536c2ab57ea7d93e68b4e3a248b98f30f', 0, '2021-06-03 04:39:46'),
('137b47732d31274b0fa6445bf5bbb4696bc10f3cb1a83a617d7e1d64c6e968e29e9c19a0522053cf', '68779c207e43b686d4773da04d0c413ab4f115e816ba83f2a4dea00716b45108f76b4d53d9756fdb', 0, '2021-06-03 04:34:47'),
('722fc334345d814cb74e0ae3ac89696f89c4178fec7b11a223371d0e34d84ebd7f6cb7ccfc4ea55b', 'ee5dc0877de770005ed604e8d82a43923d2e6ec890b61675c0467d6dcf8c71e27a17bd271db477f0', 0, '2021-06-03 04:32:46'),
('91739cb2167ecb218b649719a8d5d04af1466c447d6ce0dce274d6fc0390256806ff1c52b03cb25c', 'db1b5a3650e1753c4645ba9bc475eb6e501a4eb3ac6a9d1b05e78d9b27cd2ab3d6a9a01a435a7c30', 0, '2021-06-03 13:45:36'),
('b847fb3776366492623dfbff7bff708af9fe26d2ed3b26c29c4d7c9225b68f88bb0b486bb340e3ba', 'c0be0bda527f1c19c7641a26a884c668617226f4fa394cc4ef92f894c26f1497e72d592d63551da4', 0, '2021-06-03 04:15:17'),
('c79cd1f19f4df3841c84330f75d11badee6816d457eba5011222a9faa1e36e09526a8914d1b164bf', 'f2d970d9902fe2cf0b4927d96d4b82430b6ffadfe1acfc6cb76da4ed12598bbe77d9d38ba101b3ef', 0, '2021-06-03 13:43:55'),
('f69da010f055742d0b0be28aa0a15fa06dd6de5119ba2aabca3bda947c3ab94b17246239c2c024c3', '029c8ab3a650a8aca4dac7d91ed90c9648836f0d249bf42f997572023e5d7fc716ef4e26c619e00a', 0, '2021-06-03 13:46:29');

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
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `tipo_usuario_id` int(11) UNSIGNED DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `name`, `apellido`, `email`, `dni`, `telefono`, `email_verified_at`, `password`, `active`, `tipo_usuario_id`, `unidade_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'santi', 'Santiago', 'Lopera', 'santiagoloperam@gmail.com', '1234567', '1234567', NULL, '123456', 1, 1, NULL, NULL, NULL, NULL),
(2, 'migue', 'Luis Miguel', 'Paz', 'luismiguelpaz96@gmail.com', '123456789', '123456789', NULL, '123456', 0, 2, NULL, NULL, NULL, NULL),
(11, 'ani', 'Ana', 'paz', 'ana@gmail.com', '123456789', '55555555', NULL, '$2y$10$pbfxAMskPKwW9KbeO/iqLeDzbIiaYGRaMeITrQQ5KKrQTyMMnOJVi', 1, 3, NULL, NULL, '2020-05-31 22:12:20', '2020-05-31 22:12:20'),
(12, 'pepe', 'PEPE', 'MARTINEZ', 'pepe@gmail.com', '123444444', '7777777', NULL, '$2y$10$BMUllT2wgJO6DaeGAdFr8.LaeTzQDc0k/KEBPB5hHIKRYzyYzxcdq', 1, 3, NULL, NULL, '2020-05-31 22:16:03', '2020-05-31 22:16:03'),
(15, 'pepe2', 'PEPE2', 'stheth', 'pesthsdf@gmail.com', '123444444', '7777777', NULL, '$2y$10$OVJOaXzokr7fmz9JqHChYORU2bj7CvjavA5JSmj7gHqKn7spJUdIe', 1, 3, NULL, NULL, '2020-06-02 08:31:19', '2020-06-02 08:31:19'),
(16, 'juan123', 'juan', 'lopez', 'jl@gmail.com', '123444444', '7777777', NULL, '$2y$10$7sn/mWoZcvieXImwkI5aduMSnAkruQr6XLlI/TLWDcCOMB0VjowWy', 1, 3, NULL, NULL, '2020-06-02 09:39:33', '2020-06-02 09:39:33'),
(18, 'juan1234', 'juan', 'lopez', 'jl4@gmail.com', '123444444', '7777777', NULL, '$2y$10$hoAsiwNq7U9ISmIQYkrVZunt4/5nneVtAXA8Sij2Zfhw9kww6p5qS', 1, 3, NULL, NULL, '2020-06-02 09:48:05', '2020-06-02 09:48:05'),
(19, 'juan12345', 'juan', 'lopez', 'jl45@gmail.com', '123444444', '7777777', NULL, '$2y$10$5Q1LYw/mVyxuJfaUnmBCk.x8V7rjTM6k.vDfZ0UlDkamKPvg7tO9y', 1, 3, NULL, NULL, '2020-06-02 20:20:00', '2020-06-02 20:20:00'),
(20, 'juan123456', 'juan', 'lopez', 'jl456@gmail.com', '123444444', '7777777', NULL, '$2y$10$VfesVGfDn.TSxF3TyY7bJOQ1RFolmhAqK5UVXj8d3Lu/4UzkhZ7N2', 1, 3, NULL, NULL, '2020-06-03 08:13:13', '2020-06-03 08:13:13'),
(22, '', 'Jose Fonseca', NULL, 'myemail@email.com', NULL, NULL, NULL, '$2y$10$d5f4ggTn1KY63imWlRlCweXRTzYhAk2NglsGjeJoBWDFJq/hlnvtC', 1, NULL, NULL, NULL, '2020-06-03 09:30:07', '2020-06-03 09:30:07');

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
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `user_name` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aptos`
--
ALTER TABLE `aptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_aptos`
--
ALTER TABLE `tipo_aptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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

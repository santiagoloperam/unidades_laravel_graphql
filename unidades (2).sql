-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2020 a las 20:20:31
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
(3, '301 Nogal', 3, 5, 3, 1, 2, '2020-05-22 08:46:13', '2020-05-22 08:49:38'),
(4, 'casa A1', 7, 15, 4, 54, NULL, NULL, NULL),
(5, 'Casa B1', 7, 15, 5, 55, NULL, NULL, NULL);

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
(14, 'E1', 2, '2019-08-23 19:54:34', '2019-08-23 19:47:02'),
(15, 'manzana I', 7, '2020-06-18 13:08:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` bigint(255) NOT NULL,
  `numero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `saldo` float NOT NULL,
  `fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apto_id` int(11) NOT NULL,
  `pagada` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(22, '2014_10_12_100000_create_password_resets_table', 2),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(26, '2016_06_01_000004_create_oauth_clients_table', 2),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(28, '2019_08_19_000000_create_failed_jobs_table', 2),
(29, '2019_11_19_000000_update_social_provider_users_table', 2);

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
('0639d112a81767370be2ad0d049cd0a6b6a4999f1301267e2576e9204d6723a6259d4cf4d141dbbf', 60, 4, NULL, '[]', 0, '2020-06-23 10:04:30', '2020-06-23 10:04:30', '2021-06-23 05:04:30'),
('5b114cb9c27818913e1e4b64ecd3022c73a9fa7792f97ee3417470cb9921334801eae1d1fbb11df1', 60, 4, NULL, '[]', 0, '2020-06-23 23:10:05', '2020-06-23 23:10:05', '2021-06-23 18:10:05'),
('7b140d0759d61bae46687d2f15735ef7b8c9778a83bfb849b72e5bc4deb70d26f3ae0024a1c9f3b9', 60, 4, NULL, '[]', 0, '2020-06-23 10:09:34', '2020-06-23 10:09:34', '2021-06-23 05:09:34'),
('8d55b484d18e895a84724ff1af7a3c29cbc3f2873006710f19670819b4ee4d79742eed66f8a45463', 62, 4, NULL, '[]', 0, '2020-06-23 10:14:26', '2020-06-23 10:14:26', '2021-06-23 05:14:26'),
('8e754dc2bc52029e9b88f75d2ebeefce1d4af4028d6a9354ce02d0f5a820ed655e3bb830540944a0', 62, 4, NULL, '[]', 0, '2020-06-23 10:23:36', '2020-06-23 10:23:36', '2021-06-23 05:23:36'),
('9cc5bbe198a5dc1436a9d8218fd0308d6eac3c3f3f18e8cd9c26cf072440f0a2f12f9dd7658fc424', 62, 4, NULL, '[]', 0, '2020-06-23 10:13:01', '2020-06-23 10:13:01', '2021-06-23 05:13:01'),
('b26967d547aaf9642478ddd6500bbbccd967e263f3a694d0c4d04cfb20c160151e04b13f6599e303', 62, 4, NULL, '[]', 0, '2020-06-23 22:30:00', '2020-06-23 22:30:00', '2021-06-23 17:30:00'),
('ce733991ee9ae0fdee8fc05194871cd04a689e14837b49dc11258f4f59cce644909270c4c182e881', 62, 4, NULL, '[]', 0, '2020-06-23 10:19:37', '2020-06-23 10:19:37', '2021-06-23 05:19:37'),
('dcd3f98decf38139c94146c723e6a4f99268694c4e4267b56399174b1e922c88fe350c100a15172f', 62, 4, NULL, '[]', 0, '2020-06-23 10:14:55', '2020-06-23 10:14:55', '2021-06-23 05:14:55'),
('dfc1d425f86b2636303ab8b4fb06d6419a8a24aff8a3b465c52441df32f575a2615eff512c470df0', 62, 4, NULL, '[]', 0, '2020-06-23 10:25:27', '2020-06-23 10:25:27', '2021-06-23 05:25:27');

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
(1, NULL, 'Laravel Personal Access Client', 'TSjl3H5F4eCDHWrqvrVeYPkRjSJnlByPbSVS5Ew7', NULL, 'http://localhost', 1, 0, 0, '2020-06-23 09:44:49', '2020-06-23 09:44:49'),
(2, NULL, 'Laravel Password Grant Client', 'd5bMMFyG9cTUHWLXzWztQj5dwhSAQlyHj54WuUlB', 'users', 'http://localhost', 0, 1, 0, '2020-06-23 09:44:49', '2020-06-23 09:44:49'),
(3, NULL, 'Laravel Personal Access Client', 'A7UkSJjGW9Pe7C0ifhcsHFIEUF44WpRomB7JjD1d', NULL, 'http://localhost', 1, 0, 0, '2020-06-23 09:45:16', '2020-06-23 09:45:16'),
(4, NULL, 'Laravel Password Grant Client', 'yUxdxphz9LKqlxDLmbPRIJAwGiDEM2mJVoIor6TF', 'users', 'http://localhost', 0, 1, 0, '2020-06-23 09:45:16', '2020-06-23 09:45:16');

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
(1, 1, '2020-06-23 09:44:49', '2020-06-23 09:44:49'),
(2, 3, '2020-06-23 09:45:16', '2020-06-23 09:45:16');

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
('17a1ccd6ae3b71625a146bbde0a39d09bf52b992b7e68398a981c1456daace5975823e24af233698', '8e754dc2bc52029e9b88f75d2ebeefce1d4af4028d6a9354ce02d0f5a820ed655e3bb830540944a0', 0, '2021-06-23 05:23:37'),
('4c9c83c3e38438eba311bffea49f55178cd6906a32096459a3f0aa5c1057d2bc3000ff6d4a716ea6', '8d55b484d18e895a84724ff1af7a3c29cbc3f2873006710f19670819b4ee4d79742eed66f8a45463', 0, '2021-06-23 05:14:26'),
('5e5e75b6026996c20049fd2f74465b12d72bcaf5bfaf9c2e5e9444c4e417de21ca7d5fb496cc9e05', 'dfc1d425f86b2636303ab8b4fb06d6419a8a24aff8a3b465c52441df32f575a2615eff512c470df0', 0, '2021-06-23 05:25:27'),
('750f14a89d37e15c95b363fe9796e703f1d0d3c89b3f4d2a57bafbec5f97e91a6d714c589ef5d432', '0639d112a81767370be2ad0d049cd0a6b6a4999f1301267e2576e9204d6723a6259d4cf4d141dbbf', 0, '2021-06-23 05:04:30'),
('76285415cfeead7a51fdc1e619545428e166d7e50d577df339a6907d6e51326bee251d0fa02fb6da', '5b114cb9c27818913e1e4b64ecd3022c73a9fa7792f97ee3417470cb9921334801eae1d1fbb11df1', 0, '2021-06-23 18:10:05'),
('7e2855176871d3191b8767b843652ba5290d5174f4b436da54ab5433b2734914a8b0d2705ebddf53', 'b26967d547aaf9642478ddd6500bbbccd967e263f3a694d0c4d04cfb20c160151e04b13f6599e303', 0, '2021-06-23 17:30:00'),
('d92636e98cb4033180a5a279a9d173aca7f17e5c49fb2471fb46c53d133a38469008f1a329d1fd6b', '7b140d0759d61bae46687d2f15735ef7b8c9778a83bfb849b72e5bc4deb70d26f3ae0024a1c9f3b9', 0, '2021-06-23 05:09:34'),
('f587541549a5c0ca17bdee5a81ca7307e40aaf7b75a61c8b94d68fc1d8a729dd2e1f49d28170fa36', 'ce733991ee9ae0fdee8fc05194871cd04a689e14837b49dc11258f4f59cce644909270c4c182e881', 0, '2021-06-23 05:19:37'),
('f8939da41c28107a394f172262cddcaf9d9da017d99ddd2213fe375cad572006b323d80bdaf06e20', 'dcd3f98decf38139c94146c723e6a4f99268694c4e4267b56399174b1e922c88fe350c100a15172f', 0, '2021-06-23 05:14:55'),
('fe29c57b6d1334d269bed963aee47940d46113095113e8fa2c8fa598cf88c7a8eed165ff61349f57', '9cc5bbe198a5dc1436a9d8218fd0308d6eac3c3f3f18e8cd9c26cf072440f0a2f12f9dd7658fc424', 0, '2021-06-23 05:13:01');

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
(3, '80m', 180000.00, 30, 80, 3, '2019-09-08 04:00:31', '2019-09-08 04:00:31'),
(4, 'casa100m', 200000.00, 30, 100, 7, '2020-06-18 13:11:30', '0000-00-00 00:00:00'),
(5, 'casa150m', 300000.00, 30, 150, 7, '2020-06-18 13:11:30', '0000-00-00 00:00:00');

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
  `nit` varchar(45) DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `direccion`, `telefono`, `nit`, `admin_id`, `active`, `created_at`, `updated_at`) VALUES
(2, 'Guadalupe Real', 'cra 52A #1A-22', '322222222', NULL, 2, 1, '2020-05-18 16:56:43', '2019-08-18 22:20:14'),
(3, 'Bosques de Cañaveralejo', 'Calle 1 #52-52', '333444555', NULL, 60, 1, '2020-06-23 18:02:19', '2019-08-18 22:20:57'),
(4, 'Guadalajara', 'cll13 #15-55', '333555777', NULL, 2, 1, '2020-05-18 16:56:53', '2019-08-20 01:38:53'),
(5, 'Unidad Santiago de Cali', 'cll 5 #45-20', '2223334445', NULL, 2, 1, '2020-05-18 16:56:58', '2019-08-23 19:04:50'),
(6, 'Caramanta II', 'calle 1A #53B', '55555555', NULL, 2, 1, '2020-05-18 16:57:02', '0000-00-00 00:00:00'),
(7, 'nueva unidad', 'call23', '456789', '789654321', 1, 1, '2020-06-18 02:46:39', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `dni`, `telefono`, `email_verified_at`, `password`, `active`, `tipo_usuario_id`, `unidade_id`, `remember_token`, `created_at`, `updated_at`, `provider`, `provider_id`, `avatar`) VALUES
(1, 'Santiago', 'santiagoloperam@gmail.com', '1234567', '1234567', NULL, '123456', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Luis Miguel', 'luismiguelpaz96@gmail.com', '123456789', '123456789', NULL, '123456', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, 'myemail@email.com', NULL, NULL, NULL, '$2y$10$zwE.AAXyf53Ti/BjVqFuNOWFsey9U.a17CwEQvMxK0fuhdbnqb4Fq', 1, NULL, NULL, NULL, '2020-06-07 05:56:21', '2020-06-07 05:56:21', NULL, NULL, NULL),
(54, 'Santii', 'santi@gmail.com', '123456789', '123456789', NULL, '$2y$10$s.kbueu4dGSvZFQIiwbO4ew2RFEFn7Xb8kpTVGtExCYoSUpbI5lzq', 1, 1, NULL, NULL, '2020-06-13 23:16:49', '2020-06-13 23:16:49', NULL, NULL, NULL),
(55, NULL, 'amaya1@gmail.com', NULL, NULL, NULL, '$2y$10$otdJ7zuN0HpCIhc3G6wSw.AgRZyeeIaYUmWDT7ZLUd4BwQ9Jzgw4K', 1, NULL, NULL, NULL, '2020-06-14 01:31:43', '2020-06-14 01:31:43', NULL, NULL, NULL),
(57, 'Santii1', 'santi1@gmail.com', '123456789', '123456789', NULL, '$2y$10$x9SOTNgjIvGVTRXJkj2rLODKG5.6ttpzoP9I8Vz12LHMcShBRcSD2', 1, 1, NULL, NULL, '2020-06-14 01:34:17', '2020-06-14 01:34:17', NULL, NULL, NULL),
(58, 'Santii1', 'santi2@gmail.com', '123456789', '123456789', NULL, '$2y$10$jO8eMibZjtiPlAXgELukPuFwO9V61gHnR9p9tXjFr4bTb1GRqt8C2', 1, 1, NULL, NULL, '2020-06-14 01:41:17', '2020-06-14 01:41:17', NULL, NULL, NULL),
(59, 'Santi3', 'santi3@gmail.com', '123456789', '123456789', NULL, '$2y$10$JLKof23YBXp7yAbRy3QP3uHptmDI1Oysmut1DegrYq652TLeFMyKm', 1, 1, NULL, NULL, '2020-06-19 17:50:15', '2020-06-19 17:50:15', NULL, NULL, NULL),
(60, 'Santi Dev', 'santideveloper@email.com', NULL, NULL, NULL, '$2y$10$kw56ytRqSmXF5oCk7h28J.0hA/.KoG1eZ3d3r5gaLwqOsq3PLBq5.', 1, NULL, NULL, NULL, '2020-06-23 10:00:00', '2020-06-23 10:00:00', NULL, NULL, NULL),
(62, 'Santi Dev11', 'santideveloper11@email.com', NULL, NULL, NULL, '$2y$10$mtG0/6iE88DdjeeLGQ9g/u7qSOjeoPZ3qQgNznqBrhUfrHbZa01JS', 1, NULL, NULL, NULL, '2020-06-23 10:13:01', '2020-06-23 10:13:01', NULL, NULL, NULL),
(63, 'santi_dev4', 'santi4@gmail.com', '123456789', '123456789', NULL, '$2y$10$LWh2S5ns6pQZQOOjCEdnnOxyWu5vNM9j1oUUBgrtPZ3LWbnm8CrPm', 1, NULL, NULL, NULL, '2020-06-23 22:49:08', '2020-06-23 22:49:08', NULL, NULL, NULL);

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
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `apto_id` (`apto_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aptos`
--
ALTER TABLE `aptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `bloques`
--
ALTER TABLE `bloques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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

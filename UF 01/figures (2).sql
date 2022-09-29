-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2021 a las 12:10:45
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `figures`
--
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `figures`
--

CREATE TABLE `figures` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipus` enum('quadrat','rectangle','triangle','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'quadrat',
  `numeroPunts` tinyint(3) UNSIGNED NOT NULL DEFAULT 4,
  `dataCreacio` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla de figuras';

--
-- Volcado de datos para la tabla `figures`
--

INSERT INTO `figures` (`id`, `tipus`, `numeroPunts`, `dataCreacio`) VALUES
(1, 'rectangle', 4, '2021-11-12 13:15:32'),
(2, 'quadrat', 4, '2021-11-12 13:21:30'),
(3, 'quadrat', 4, '2021-11-12 13:21:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `punts`
--

CREATE TABLE `punts` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `x` smallint(6) NOT NULL DEFAULT 0,
  `y` smallint(6) NOT NULL DEFAULT 0,
  `idFigura` int(10) UNSIGNED not NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Puntos de cada figura';

--
-- Volcado de datos para la tabla `punts`
--

INSERT INTO `punts` (`id`, `x`, `y`, `idFigura`) VALUES
(1, 0, 0, 1),
(2, 10, 10, 1),
(4, 0, 0, 1),
(5, 9, 8, 1),
(6, 3, 5, 1),
(7, 3, 6, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `figures`
--
ALTER TABLE `figures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipus` (`tipus`);

--
-- Indices de la tabla `punts`
--
ALTER TABLE `punts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFigura` (`idFigura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `figures`
--
ALTER TABLE `figures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `punts`
--
ALTER TABLE `punts`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `punts`
--
/* ALTER TABLE `punts`
  ADD CONSTRAINT `punts_ibfk_1` FOREIGN KEY (`idFigura`) REFERENCES `figures` (`id`) ON UPDATE CASCADE; */
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

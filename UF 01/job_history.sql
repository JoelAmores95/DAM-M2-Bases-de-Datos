-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2021 a las 14:43:06
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
-- Base de datos: `employees`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_history`
--

CREATE TABLE `job_history` (
  `EMPLOYEE_ID` int(6) UNSIGNED NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEPARTMENT_ID` int(4) UNSIGNED DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `job_history`
--

INSERT INTO `job_history` (`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`) VALUES
(101, '1989-09-21', '1993-10-27', 'AC_ACCOUNT', 110),
(101, '1993-10-28', '1997-03-15', 'AC_MGR', 110),
(102, '1993-01-13', '1998-07-24', 'IT_PROG', 60),
(114, '1998-03-24', '1999-12-31', 'ST_CLERK', 50),
(122, '1999-01-01', '1999-12-31', 'ST_CLERK', 50),
(176, '1998-03-24', '1998-12-31', 'SA_REP', 80),
(176, '1999-01-01', '1999-12-31', 'SA_MAN', 80),
(200, '1987-09-17', '1993-06-17', 'AD_ASST', 90),
(200, '1994-07-01', '1998-12-31', 'AC_ACCOUNT', 90),
(201, '1996-02-17', '1999-12-19', 'MK_REP', 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

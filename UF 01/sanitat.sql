-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2021 a las 11:38:16
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
-- Base de datos: `sanitat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `HOSPITAL_COD` tinyint(2) NOT NULL COMMENT 'Codi hospital (taula HOSPITAL)',
  `DOCTOR_NO` smallint(3) NOT NULL COMMENT 'Codi doctor dintre de cada hospital',
  `COGNOM` varchar(13) NOT NULL COMMENT 'Cognom del doctor',
  `ESPECIALITAT` varchar(16) NOT NULL COMMENT 'Especialitat del doctor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`HOSPITAL_COD`, `DOCTOR_NO`, `COGNOM`, `ESPECIALITAT`) VALUES
(13, 435, 'López A.', 'Cardiologia'),
(18, 585, 'Miller G.', 'Ginecologia'),
(18, 982, 'Cajal R.', 'Cardiologia'),
(22, 386, 'Cabeza D.', 'Psiquiatria'),
(22, 398, 'Best K.', 'Urologia'),
(22, 453, 'Galo D.', 'Pediatria'),
(45, 522, 'Adams C.', 'Neurologia'),
(45, 607, 'Nico P.', 'Pediatria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospital`
--

CREATE TABLE `hospital` (
  `HOSPITAL_COD` tinyint(2) NOT NULL COMMENT 'Codi hospital',
  `NOM` varchar(10) NOT NULL COMMENT 'Nom hospital',
  `ADRECA` varchar(20) DEFAULT NULL COMMENT 'Adreca hospital',
  `TELEFON` varchar(8) DEFAULT NULL COMMENT 'Telefon hospital',
  `QTAT_LLITS` smallint(3) UNSIGNED DEFAULT 0 COMMENT 'Quantitat de llits hospital'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hospital`
--

INSERT INTO `hospital` (`HOSPITAL_COD`, `NOM`, `ADRECA`, `TELEFON`, `QTAT_LLITS`) VALUES
(13, 'Provincial', 'O Donell 50', '964-4264', 88),
(18, 'General', 'Atocha s/n', '595-3111', 63),
(22, 'La Paz', 'Castellana 1000', '923-5411', 162),
(45, 'San Carlos', 'Ciudad Universitaria', '597-1500', 92);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingressos`
--

CREATE TABLE `ingressos` (
  `INSCRIPCIO` int(5) NOT NULL COMMENT 'Codi malalt',
  `HOSPITAL_COD` tinyint(2) NOT NULL COMMENT 'Codi hospital',
  `SALA_COD` tinyint(2) NOT NULL COMMENT 'Codi sala hospital',
  `LLIT` smallint(4) UNSIGNED DEFAULT NULL COMMENT 'Numero de llit que ocupa dintre de la sala'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingressos`
--

INSERT INTO `ingressos` (`INSCRIPCIO`, `HOSPITAL_COD`, `SALA_COD`, `LLIT`) VALUES
(10995, 13, 3, 1),
(14024, 13, 3, 3),
(18004, 13, 3, 2),
(36658, 18, 4, 1),
(38702, 18, 4, 2),
(39217, 22, 6, 1),
(59076, 22, 6, 2),
(63827, 22, 6, 3),
(64823, 22, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `malalt`
--

CREATE TABLE `malalt` (
  `INSCRIPCIO` int(5) NOT NULL COMMENT 'Identificacio del malalt',
  `COGNOM` varchar(15) NOT NULL COMMENT 'Cognom del malalt',
  `ADRECA` varchar(20) DEFAULT NULL COMMENT 'Adreca del malalt',
  `DATA_NAIX` date DEFAULT NULL COMMENT 'Data naixement del malalt',
  `SEXE` char(1) NOT NULL COMMENT 'Sexe del malalt. Valors possibles: (H)ome, (D)ona' CHECK (`SEXE` = 'H' or `SEXE` = 'D'),
  `NSS` char(9) DEFAULT NULL COMMENT 'Numero Seguretat Social del malalt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `malalt`
--

INSERT INTO `malalt` (`INSCRIPCIO`, `COGNOM`, `ADRECA`, `DATA_NAIX`, `SEXE`, `NSS`) VALUES
(10995, 'Laguía M.', 'Goya 20', '1956-05-16', 'H', '280862482'),
(14024, 'Fernández M.', 'Recoletos 50', '1967-06-23', 'D', '321790059'),
(18004, 'Serrano V.', 'Alcala 12', '1960-05-21', 'D', '284991452'),
(36658, 'Domin S.', 'Mayor 71', '1942-01-01', 'H', '160657471'),
(38702, 'Neal R.', 'Orense 11', '1940-06-18', 'D', '380010217'),
(39217, 'Cervantes M.', 'Peron 38', '1952-02-29', 'H', '440294390'),
(59076, 'Miller G.', 'Lopez de Hoyos 2', '1945-09-16', 'D', '311969044'),
(63827, 'Ruíz P.', 'Esquerdo 103', '1980-12-26', 'H', '100973253'),
(64823, 'Fraser A.', 'Soto 3', '1980-07-10', 'D', '285201776'),
(74835, 'Benítez E.', 'Argentina 5', '1957-10-05', 'H', '154811767');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla`
--

CREATE TABLE `plantilla` (
  `HOSPITAL_COD` tinyint(2) NOT NULL COMMENT 'Codi hospital',
  `SALA_COD` tinyint(2) NOT NULL COMMENT 'Codi de la sala dintre de cada hospital',
  `EMPLEAT_NO` smallint(4) NOT NULL COMMENT 'Codi empleat',
  `COGNOM` varchar(15) NOT NULL COMMENT 'Cognom empleat',
  `FUNCIO` varchar(10) DEFAULT NULL COMMENT 'Tasca empleat',
  `TORN` varchar(1) DEFAULT NULL COMMENT 'Torn empleat. Valors possibles: (M)atí, (T)arda, (N)it' CHECK (`TORN` in ('M','T','N')),
  `SALARI` int(10) DEFAULT NULL COMMENT 'Salari anual empleat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla`
--

INSERT INTO `plantilla` (`HOSPITAL_COD`, `SALA_COD`, `EMPLEAT_NO`, `COGNOM`, `FUNCIO`, `TORN`, `SALARI`) VALUES
(13, 6, 3106, 'Hernández J.', 'Infermer', 'T', 2755000),
(13, 6, 3754, 'Díaz B.', 'Infermera', 'T', 2262000),
(18, 4, 6357, 'Karplus W.', 'Intern', 'T', 3379000),
(22, 1, 6065, 'Rivera G.', 'Infermera', 'N', 1626000),
(22, 1, 7379, 'Carlos R.', 'Infermera', 'T', 2119000),
(22, 2, 9901, 'Adams C.', 'Intern', 'M', 2210000),
(22, 6, 1009, 'Higueras D.', 'Infermera', 'T', 2005000),
(22, 6, 8422, 'Bocina G.', 'Infermer', 'M', 1638000),
(45, 1, 8526, 'Frank H.', 'Infermera', 'T', 2522000),
(45, 4, 1280, 'Amigó R.', 'Intern', 'N', 2210000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `HOSPITAL_COD` tinyint(2) NOT NULL COMMENT 'Codi hospital (taula HOSPITAL)',
  `SALA_COD` tinyint(2) NOT NULL COMMENT 'Codi de sala dintre de cada hospital',
  `NOM` varchar(20) NOT NULL COMMENT 'Nom de la sala',
  `QTAT_LLITS` smallint(3) UNSIGNED DEFAULT 0 COMMENT 'Quantitat de llits de la sala'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`HOSPITAL_COD`, `SALA_COD`, `NOM`, `QTAT_LLITS`) VALUES
(13, 3, 'Cures Intensives', 21),
(13, 6, 'Psiquiàtric', 67),
(18, 3, 'Cures Intensives', 10),
(18, 4, 'Cardiologia', 53),
(22, 1, 'Recuperació', 10),
(22, 2, 'Maternitat', 34),
(22, 6, 'Psiquiàtric', 118),
(45, 1, 'Recuperació', 13),
(45, 2, 'Maternitat', 24),
(45, 4, 'Cardiologia', 55);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`HOSPITAL_COD`,`DOCTOR_NO`),
  ADD KEY `IDX_DOCTOR_HOSP` (`HOSPITAL_COD`),
  ADD KEY `DOCTOR_ESP_HOSP` (`ESPECIALITAT`,`HOSPITAL_COD`),
  ADD KEY `DOCTOR_HOSP_ESP` (`HOSPITAL_COD`,`ESPECIALITAT`);

--
-- Indices de la tabla `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`HOSPITAL_COD`),
  ADD KEY `HOSPITAL_NOM` (`NOM`);

--
-- Indices de la tabla `ingressos`
--
ALTER TABLE `ingressos`
  ADD PRIMARY KEY (`INSCRIPCIO`),
  ADD KEY `IDX_INGRESSOS_INSCRIPCIO` (`INSCRIPCIO`),
  ADD KEY `IDX_INGRESSOS_HOSP_SALA` (`HOSPITAL_COD`,`SALA_COD`),
  ADD KEY `INGRESSOS_HOSP_SALA` (`HOSPITAL_COD`,`SALA_COD`);

--
-- Indices de la tabla `malalt`
--
ALTER TABLE `malalt`
  ADD PRIMARY KEY (`INSCRIPCIO`),
  ADD KEY `MALALT_NAIX_COGNOM` (`DATA_NAIX`,`COGNOM`),
  ADD KEY `MALALT_COGNOM_NAIX` (`COGNOM`,`DATA_NAIX`);

--
-- Indices de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD PRIMARY KEY (`HOSPITAL_COD`,`SALA_COD`,`EMPLEAT_NO`),
  ADD KEY `IDX_PLANTILLA_HOSP_SALA` (`HOSPITAL_COD`,`SALA_COD`),
  ADD KEY `PLANTILLA_HOSP_COGNOM` (`HOSPITAL_COD`,`COGNOM`),
  ADD KEY `PLANTILLA_HOSP_FUNCIO` (`HOSPITAL_COD`,`FUNCIO`),
  ADD KEY `PLANTILLA_FUNCIO_HOSP_SALA` (`FUNCIO`,`HOSPITAL_COD`,`SALA_COD`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`HOSPITAL_COD`,`SALA_COD`),
  ADD KEY `IDX_SALA_HOSPITAL_COD` (`HOSPITAL_COD`),
  ADD KEY `SALA_HOSP_NOM` (`HOSPITAL_COD`,`NOM`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`HOSPITAL_COD`) REFERENCES `hospital` (`HOSPITAL_COD`);

--
-- Filtros para la tabla `ingressos`
--
ALTER TABLE `ingressos`
  ADD CONSTRAINT `ingressos_ibfk_1` FOREIGN KEY (`INSCRIPCIO`) REFERENCES `malalt` (`INSCRIPCIO`),
  ADD CONSTRAINT `ingressos_ibfk_2` FOREIGN KEY (`HOSPITAL_COD`,`SALA_COD`) REFERENCES `sala` (`HOSPITAL_COD`, `SALA_COD`);

--
-- Filtros para la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD CONSTRAINT `plantilla_ibfk_1` FOREIGN KEY (`HOSPITAL_COD`,`SALA_COD`) REFERENCES `sala` (`HOSPITAL_COD`, `SALA_COD`);

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`HOSPITAL_COD`) REFERENCES `hospital` (`HOSPITAL_COD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-03-2023 a las 14:58:52
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_examenes`
--

CREATE TABLE `citas_examenes` (
  `Asignacion` bigint(20) UNSIGNED NOT NULL,
  `Fecha_Examen` varchar(200) NOT NULL,
  `Tipo_Examen` varchar(200) NOT NULL,
  `Hora` varchar(200) NOT NULL,
  `Ciudad` varchar(200) NOT NULL,
  `Ced` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas_examenes`
--

INSERT INTO `citas_examenes` (`Asignacion`, `Fecha_Examen`, `Tipo_Examen`, `Hora`, `Ciudad`, `Ced`) VALUES
(22, '2023-03-17', 'Sangre', '06:55', 'Bucaramanga', '1005259101'),
(23, '2023-03-21', 'Tension', '06:35', 'Bucaramanga', '1005259101'),
(24, '2023-03-21', 'Sangre', '06:35', 'Bucaramanga', '1005259101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_medicas`
--

CREATE TABLE `citas_medicas` (
  `Asignacion` bigint(20) UNSIGNED NOT NULL,
  `Fehca_cita` varchar(200) NOT NULL,
  `Tipo_cita` varchar(200) NOT NULL,
  `Hora` varchar(200) NOT NULL,
  `Ciudad` varchar(200) NOT NULL,
  `Ced` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas_medicas`
--

INSERT INTO `citas_medicas` (`Asignacion`, `Fehca_cita`, `Tipo_cita`, `Hora`, `Ciudad`, `Ced`) VALUES
(42, '2023-03-20', 'Pediatria', '08:30', 'Bucaramanga', '1005259101'),
(43, '2023-03-20', 'Pediatria', '08:30', 'Bucaramanga', '1005259101'),
(44, '2023-03-20', 'Pediatria', '08:30', 'Bucaramanga', '1005259101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Documento` varchar(200) NOT NULL,
  `tipo_doc` varchar(200) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Apellido` varchar(200) NOT NULL,
  `Correo` varchar(200) NOT NULL,
  `Telefono` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `Fecha_Nac` varchar(200) NOT NULL,
  `Expediccion_Ced` varchar(200) NOT NULL,
  `Tipos_Afiliacion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Documento`, `tipo_doc`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `password`, `Fecha_Nac`, `Expediccion_Ced`, `Tipos_Afiliacion`) VALUES
('1005259101', 'C.C.', 'manuel ricardo', 'castro malaver', 'malavermanuelricardo@gmail.com', '3208946678', '1234', '2002-12-27', '2021-01-04', 'contributivo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas_examenes`
--
ALTER TABLE `citas_examenes`
  ADD PRIMARY KEY (`Asignacion`),
  ADD UNIQUE KEY `Asignacion` (`Asignacion`),
  ADD KEY `foraneaExamen` (`Ced`);

--
-- Indices de la tabla `citas_medicas`
--
ALTER TABLE `citas_medicas`
  ADD PRIMARY KEY (`Asignacion`),
  ADD UNIQUE KEY `Asignacion` (`Asignacion`),
  ADD KEY `foraneacita` (`Ced`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Documento`),
  ADD UNIQUE KEY `Correo` (`Correo`),
  ADD UNIQUE KEY `Documento` (`Documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas_examenes`
--
ALTER TABLE `citas_examenes`
  MODIFY `Asignacion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `citas_medicas`
--
ALTER TABLE `citas_medicas`
  MODIFY `Asignacion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas_examenes`
--
ALTER TABLE `citas_examenes`
  ADD CONSTRAINT `foraneaExamen` FOREIGN KEY (`Ced`) REFERENCES `usuarios` (`Documento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `citas_medicas`
--
ALTER TABLE `citas_medicas`
  ADD CONSTRAINT `foraneacita` FOREIGN KEY (`Ced`) REFERENCES `usuarios` (`Documento`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

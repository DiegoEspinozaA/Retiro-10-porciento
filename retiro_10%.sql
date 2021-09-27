-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2021 a las 00:32:16
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `retiro10`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliado`
--

CREATE TABLE `afiliado` (
  `rut` int(11) NOT NULL,
  `n_documento` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `primer_nombre` varchar(20) NOT NULL,
  `segundo_nombre` varchar(20) NOT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) NOT NULL,
  `nombre_afp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `afiliado`
--

INSERT INTO `afiliado` (`rut`, `n_documento`, `contrasena`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `nombre_afp`) VALUES
(19348293, '20929312', '@nicol200', 'Nicol', 'Andrea', 'Moreno', 'Arriagada', 'Capital'),
(20479539, '2222222', 'diego123', 'Diego', 'Andres', 'Espinoza', 'Apablaza', 'Capital'),
(23467445, '23412222', 'carlos10123', 'Carlos', 'Roberto', 'Rojas', 'Otarola', 'Cuprum');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afp`
--

CREATE TABLE `afp` (
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `dir_web` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `afp`
--

INSERT INTO `afp` (`nombre`, `direccion`, `telefono`, `dir_web`) VALUES
('Capital', '1 Pte 509', '600 660 0900', 'afphabitat.cl'),
('Cuprum', '9 Nte. 761', '600 228 7786', 'cuprum.cl'),
('Habitat', 'Esmeralda 945', '600 220 2000', 'afphabitat.cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `rut_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `saldo`, `rut_afiliado`) VALUES
(1, 2000000, 20479539),
(2, 10000000, 19348293),
(3, 13000000, 23467445);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `direccion_afiliado` varchar(20) NOT NULL,
  `rut_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`direccion_afiliado`, `rut_afiliado`) VALUES
('Blanco 234', 19348293),
('Av baquedano 1928', 20479539),
('Calle Newman 591', 20479539),
('Teniente Pinto 125', 23467445);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiro`
--

CREATE TABLE `retiro` (
  `id_retiro` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `rut_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `retiro`
--

INSERT INTO `retiro` (`id_retiro`, `fecha`, `porcentaje`, `monto`, `rut_afiliado`) VALUES
(1, '2021-09-09', 10, 200000, 20479539),
(2, '2021-09-09', 10, 1000000, 19348293);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `telefono_afiliado` varchar(20) NOT NULL,
  `rut_afiliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`telefono_afiliado`, `rut_afiliado`) VALUES
('98674462', 19348293),
('97744453', 20479539),
('97744462', 20479539),
('96342526', 23467445);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `nombre_afp` (`nombre_afp`);

--
-- Indices de la tabla `afp`
--
ALTER TABLE `afp`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `rut_afiliado` (`rut_afiliado`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`direccion_afiliado`),
  ADD KEY `rut_afiliado` (`rut_afiliado`);

--
-- Indices de la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD PRIMARY KEY (`id_retiro`),
  ADD KEY `rut_afiliado` (`rut_afiliado`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`telefono_afiliado`),
  ADD KEY `rut_afiliado` (`rut_afiliado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD CONSTRAINT `afiliado_ibfk_1` FOREIGN KEY (`nombre_afp`) REFERENCES `afp` (`nombre`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`rut_afiliado`) REFERENCES `afiliado` (`rut`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`rut_afiliado`) REFERENCES `afiliado` (`rut`);

--
-- Filtros para la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD CONSTRAINT `retiro_ibfk_1` FOREIGN KEY (`rut_afiliado`) REFERENCES `afiliado` (`rut`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`rut_afiliado`) REFERENCES `afiliado` (`rut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

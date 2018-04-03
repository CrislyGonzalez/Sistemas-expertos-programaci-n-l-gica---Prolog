-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-06-2016 a las 20:12:15
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdpreguntas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE IF NOT EXISTS `datos` (
  `id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Conexion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Alertas` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SO` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mensaje` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReinicioPC` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tipo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Diagnostico` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`id`, `Conexion`, `Alertas`, `SO`, `Mensaje`, `ReinicioPC`, `Descripcion`, `Tipo`, `Diagnostico`) VALUES
('1', '¿La PC esta conectada?', '¿Genero 3 pitidos al encenderse?', '¿El sistema operativo se detuvo?', '¿Fallas de Protección General?', '¿La computadora se reinicia de forma aleatoria?', 'Falla Memoria Ram', 'Es error de hardware', 'Debera Remplazar la memoria ram de su PC'),
('2', '¿La PC esta conectada?', '¿El equipo enciende, arranca y comienza a emitir pitidos? ', '¿No agarra el sistema operativo?', '¿Salen pantallazos azules?', '¿La computadora se reinicia de forma aleatoria?', 'Tarjeta Madre dañada', 'Es falla hardware', 'La tarjeta madre esta dallada, debe remplazarla'),
('3', '¿Enciende la computadora?', '¿La pantalla esta negra pero la computadora se enciende?', '¿No agarra el sistema operativo?', 'Genera un pitido', 'Muestra Líneas en la pantalla cuando lo arranca', 'Debera comprar una memoria de video de acuerdo a las especificaciones de la PC', 'Hardware', 'Problema de tarjeta de video');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

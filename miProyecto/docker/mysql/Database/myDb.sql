-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2024 a las 14:01:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `musicex`
--
CREATE DATABASE IF NOT EXISTS `musicex` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `musicex`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE IF NOT EXISTS `artistas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `seguidores` int(11) NOT NULL,
  `nombreArtista` varchar(100) NOT NULL,
  `lugarConcierto` varchar(100) NOT NULL,
  `estilo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`ID`, `imagen`, `fecha`, `hora`, `seguidores`, `nombreArtista`, `lugarConcierto`, `estilo`) VALUES
(1, 'images/Mikel.webp', '2024-04-03', '22:00', 138, 'Mikel Ízalos', 'Teatro Circo Price', 'POP'),
(2, 'images/Niall.webp', '2024-04-18', '21:30', 191, 'Niall Horan', 'WiZink Center', 'POP'),
(3, 'images/Hans.webp', '2024-05-08', '22:30', 89, 'Hans Zimmer', 'WiZink Center', 'CLASICA'),
(4, 'images/BigTime.webp', '2024-03-12', '22:00', 0, 'Big Time Rush', 'Sala Rivera', 'POP'),
(5, 'images/Bunbury.webp', '0000-00-00', '', 0, 'Bunbury', '', 'Rock'),
(6, 'images/Evanescence.webp', '0000-00-00', '', 0, 'Evanescence', '', 'Rock'),
(7, 'images/GreenDay.webp', '0000-00-00', '', 0, 'Green Day', '', 'Rock'),
(8, 'images/Hozier.webp', '0000-00-00', '', 0, 'Hozier', '', 'Soul'),
(9, 'images/Mana.webp', '0000-00-00', '', 0, 'Mana', '', 'Rock'),
(10, 'images/Metallica.webp', '0000-00-00', '', 0, 'Metallica', '', 'Heavy Metal'),
(11, 'images/Myke.webp', '0000-00-00', '', 0, 'Myke Towers', '', 'Reggaeton'),
(12, 'images/Taylor.webp', '0000-00-00', '', 0, 'Taylor Swift', '', 'POP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE IF NOT EXISTS `canciones` (
  `idCancion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCancion` varchar(255) NOT NULL,
  `descripcionCancion` varchar(255) NOT NULL,
  `tiempoCancion` varchar(255) NOT NULL,
  `imagenArtista` varchar(255) DEFAULT NULL,
  `enlaceCancion` varchar(255) DEFAULT NULL,
  `categoriaCancion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCancion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`idCancion`, `nombreCancion`, `descripcionCancion`, `tiempoCancion`, `imagenArtista`, `enlaceCancion`, `categoriaCancion`) VALUES
(1, 'Boulevard Of Broken Dreams', '«Boulevard of Broken Dreams» —en español: «Bulevard de los sueños rotos»— es el segundo sencillo del álbum American Idiot, de la banda punk rock estadounidense Green Day.', '4:48', 'images/GreenDay.webp', 'Soa3gO7tL-c', 'Destacados'),
(2, 'Felicidad', 'Felicidad de la Cabra mecanica', '4:30', 'images/cabraMecanica.webp', '8eYxjusjsyI', 'Tendencias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `imagenUsuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `password`, `imagenUsuario`) VALUES
(1, 'pepe', '1234', NULL),
(2, 'rocio', '1234', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

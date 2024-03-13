-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2024 a las 11:33:44
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
  `id_artista` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) NOT NULL,
  `nombreArtista` varchar(100) NOT NULL,
  `estilo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id_artista`, `imagen`, `nombreArtista`, `estilo`) VALUES
(1, 'images/Mikel.webp', 'Mikel Ízalos', 'POP'),
(2, 'images/Niall.webp', 'Niall Horan', 'POP'),
(3, 'images/Hans.webp', 'Hans Zimmer', 'CLASICA'),
(4, 'images/BigTime.webp', 'Big Time Rush', 'POP'),
(5, 'images/Bunbury.webp', 'Bunbury', 'Rock'),
(6, 'images/Evanescence.webp', 'Evanescence', 'Rock'),
(7, 'images/GreenDay.webp', 'Green Day', 'Rock'),
(8, 'images/Hozier.webp', 'Hozier', 'Soul'),
(9, 'images/Mana.webp', 'Mana', 'Rock'),
(10, 'images/Metallica.webp', 'Metallica', 'Heavy Metal'),
(11, 'images/Myke.webp', 'Myke Towers', 'Reggaeton'),
(12, 'images/Taylor.webp', 'Taylor Swift', 'POP');

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
  `iframeCancion` varchar(255) NOT NULL,
  `categoriaCancion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCancion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`idCancion`, `nombreCancion`, `descripcionCancion`, `tiempoCancion`, `imagenArtista`, `enlaceCancion`, `iframeCancion`, `categoriaCancion`) VALUES
(1, 'Boulevard Of Broken Dreams', '«Boulevard of Broken Dreams» —en español: «Bulevard de los sueños rotos»— es el segundo sencillo del álbum American Idiot, de la banda punk rock estadounidense Green Day.', '4:48', 'images/GreenDay.webp', 'Soa3gO7tL-c', '', 'Destacados'),
(2, 'Felicidad', 'Felicidad de la Cabra mecanica', '4:30', 'images/cabraMecanica.webp', '8eYxjusjsyI', '', 'Tendencias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE IF NOT EXISTS `entradas` (
  `id_entrada` int(11) NOT NULL AUTO_INCREMENT,
  `id_evento` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `butaca` int(11) NOT NULL,
  `nombre_comprador` varchar(55) NOT NULL,
  `apellido_comprador` varchar(55) NOT NULL,
  PRIMARY KEY (`id_entrada`),
  KEY `entrada_usuarios_fk` (`id_usuario`),
  KEY `id_evento` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id_entrada`, `id_evento`, `id_usuario`, `butaca`, `nombre_comprador`, `apellido_comprador`) VALUES
(2, 5, 1, 4, '', ''),
(3, 5, 1, 2, '', ''),
(4, 5, 2, 6, '', ''),
(6, 4, 2, 7, '', ''),
(7, 2, 1, 7, 'Jose Luis', 'Romero;'),
(9, 2, 1, 14, 'Jose Luis', 'Romero;'),
(10, 6, 1, 11, 'vc', 'xcv'),
(11, 6, 1, 14, 'vc', 'vc'),
(12, 6, 1, 2, 'vc', 'vc'),
(16, 5, 1, 3, 'Manuel', 'Rodriguez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `aforo` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `lugarConcierto` varchar(100) NOT NULL,
  `estilo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_artista` (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `imagen`, `fecha`, `hora`, `aforo`, `id_artista`, `lugarConcierto`, `estilo`) VALUES
(1, 'images/Mikel.webp', '0000-00-00', '', 0, 1, 'Teatro Circo Price', 'POP'),
(2, 'images/Niall.webp', '0000-00-00', '', 0, 2, 'WiZink Center', 'POP'),
(3, 'images/Hans.webp', '0000-00-00', '', 0, 3, 'WiZink Center', 'CLASICA'),
(4, 'images/BigTime.webp', '0000-00-00', '', 0, 4, 'Sala Rivera', 'POP'),
(5, 'images/Bunbury.webp', '0000-00-00', '', 0, 5, '', 'ROCK'),
(6, 'images/Evanescence.webp', '0000-00-00', '', 0, 6, '', 'ROCK'),
(7, 'images/GreenDay.webp', '0000-00-00', '', 0, 7, '', 'ROCK'),
(8, 'images/Hozier.webp', '0000-00-00', '', 0, 8, '', 'SOUL'),
(9, 'images/Mana.webp', '0000-00-00', '', 0, 9, '', 'ROCK'),
(10, 'images/Metallica.webp', '0000-00-00', '', 0, 10, '', 'HEAVY METAL'),
(11, 'images/Myke.webp', '0000-00-00', '', 0, 11, '', 'REGGAETON'),
(12, 'images/Taylor.webp', '0000-00-00', '', 0, 12, '', 'POP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_usuario` varchar(55) NOT NULL,
  `apellido_usuario` varchar(55) NOT NULL,
  `correo_usuario` varchar(55) NOT NULL,
  `telefono_usuario` int(11) NOT NULL,
  `direccion_usuario` varchar(100) NOT NULL,
  `imagenUsuario` varchar(255) NOT NULL DEFAULT 'images/users/default.jpg',
  `rol_usuario` enum('usuario','administrador','','') DEFAULT NULL,
  PRIMARY KEY (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `user`, `password`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `telefono_usuario`, `direccion_usuario`, `imagenUsuario`, `rol_usuario`) VALUES
(1, 'invitado', '1234', 'invitado', 'Romero', 'flesiking@gmail.com', 0, '', '', ''),
(2, 'rocio', '1234', 'Rocio', 'LLera', '', 0, '', 'images/users/default.jpg', 'usuario'),
(3, 'pepe', '1234', 'Jose Luis', 'Romero', 'flesiking@gmail.com', 617290920, 'C/Falsa 123', 'images/users/01.jpg', 'administrador');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD CONSTRAINT `artistas_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `eventos` (`id_artista`);

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entrada_usuarios_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2024 a las 01:14:28
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
  `imagenArtista` varchar(100) NOT NULL,
  `nombreArtista` varchar(100) NOT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id_artista`, `imagenArtista`, `nombreArtista`) VALUES
(1, 'images/Mikel.webp', 'Mikel Ízalos'),
(2, 'images/Niall.webp', 'Niall Horan'),
(3, 'images/Hans.webp', 'Hans Zimmer'),
(4, 'images/BigTime.webp', 'Big Time Rush'),
(5, 'images/Bunbury.webp', 'Bunbury'),
(6, 'images/Evanescence.webp', 'Evanescence'),
(7, 'images/GreenDay.webp', 'Green Day'),
(8, 'images/Hozier.webp', 'Hozier'),
(9, 'images/Mana.webp', 'Mana'),
(10, 'images/Metallica.webp', 'Metallica'),
(11, 'images/Myke.webp', 'Myke Towers'),
(12, 'images/Taylor.webp', 'Taylor Swift'),
(17, '', 'La cabra mecanica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas_estilos`
--

CREATE TABLE IF NOT EXISTS `artistas_estilos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_artista` int(11) DEFAULT NULL,
  `id_estilo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artista` (`id_artista`),
  KEY `id_estilo` (`id_estilo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas_estilos`
--

INSERT INTO `artistas_estilos` (`id`, `id_artista`, `id_estilo`) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 4),
(4, 4, 3),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 6),
(9, 9, 2),
(10, 10, 5),
(11, 11, 7),
(12, 12, 3),
(13, 17, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE IF NOT EXISTS `canciones` (
  `idCancion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCancion` varchar(255) NOT NULL,
  `descripcionCancion` varchar(255) NOT NULL,
  `tiempoCancion` varchar(255) NOT NULL,
  `imagenCancion` varchar(255) DEFAULT NULL,
  `enlaceCancion` varchar(255) DEFAULT NULL,
  `categoriaCancion` enum('Destacados','Tendencias','Nuevos','') DEFAULT NULL,
  `idArtista` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCancion`),
  KEY `idArtista` (`idArtista`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`idCancion`, `nombreCancion`, `descripcionCancion`, `tiempoCancion`, `imagenCancion`, `enlaceCancion`, `categoriaCancion`, `idArtista`, `visible`) VALUES
(1, 'Boulevard Of Broken Dreams', '«Boulevard of Broken Dreams» —en español: «Bulevard de los sueños rotos»— es el segundo sencillo del álbum American Idiot, de la banda punk rock estadounidense Green Day.', '4:48', 'images/GreenDay.webp', 'https://www.youtube.com/embed/Soa3gO7tL-c?si=lc9m3XHW42KvyMFF', 'Destacados', 7, 1),
(2, 'Felicidad', 'Felicidad', '4:30', 'images/canciones/default.webp', 'https://www.youtube.com/embed/8eYxjusjsyI?si=d-u0hOX4yW2RCEou', 'Tendencias', 17, 1),
(3, 'En el muelle de San Blas', 'Maná', '6:00', 'images/canciones/default.webp', 'https://www.youtube.com/embed/teprNzF6J1I?si=xM-vBm8YDWkbQU9f', 'Tendencias', 9, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(16, 5, 1, 3, 'Manuel', 'Rodriguez'),
(18, 5, 1, 5, 'pepe', '1234'),
(20, 7, 3, 2, 'Jose Luis', 'Romero'),
(21, 7, 3, 4, 'Jose Luis', 'Romero'),
(22, 5, 3, 13, 'Jose Luis', 'Romero'),
(23, 9, 3, 3, 'Jose Luis', 'Romero'),
(24, 9, 3, 2, 'Jose Luis', 'Romero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estilos`
--

CREATE TABLE IF NOT EXISTS `estilos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estilos`
--

INSERT INTO `estilos` (`id`, `nombre`) VALUES
(1, 'Alternativa'),
(2, 'Rock'),
(3, 'POP'),
(4, 'CLASICA'),
(5, 'Heavy Metal'),
(6, 'Soul'),
(7, 'Reggaeton');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `imagenEvento` varchar(100) NOT NULL,
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

INSERT INTO `eventos` (`id_evento`, `imagenEvento`, `fecha`, `hora`, `aforo`, `id_artista`, `lugarConcierto`, `estilo`) VALUES
(1, 'images/Mikel.webp', '2024-04-10', '22:00', 0, 1, 'Teatro Circo Price', 'POP'),
(2, 'images/Niall.webp', '2024-04-10', '23:30', 0, 2, 'WiZink Center', 'POP'),
(3, 'images/Hans.webp', '2024-05-15', '20:00', 0, 3, 'WiZink Center', 'CLASICA'),
(4, 'images/BigTime.webp', '2024-05-16', '21:30', 0, 4, 'Sala Rivera', 'POP'),
(5, 'images/Bunbury.webp', '2024-06-05', '22:00', 0, 5, '', 'ROCK'),
(6, 'images/Evanescence.webp', '2024-03-27', '21:30', 0, 6, '', 'ROCK'),
(7, 'images/GreenDay.webp', '2024-05-16', '19:00', 0, 7, '', 'ROCK'),
(8, 'images/Hozier.webp', '2024-05-15', '22:00', 0, 8, '', 'SOUL'),
(9, 'images/Mana.webp', '2024-05-09', '21:30', 0, 9, '', 'ROCK'),
(10, 'images/Metallica.webp', '2024-05-15', '22:30', 0, 10, '', 'HEAVY METAL'),
(11, 'images/Myke.webp', '2024-07-10', '21:30', 0, 11, '', 'REGGAETON'),
(12, 'images/Taylor.webp', '2024-05-15', '20:00', 0, 12, '', 'POP');

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
  `telefono_usuario` int(11) DEFAULT NULL,
  `direccion_usuario` varchar(100) DEFAULT NULL,
  `imagenUsuario` varchar(255) NOT NULL DEFAULT 'images/users/default.jpg',
  `rol_usuario` enum('usuario','administrador','','') DEFAULT 'usuario',
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `user`, `password`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `telefono_usuario`, `direccion_usuario`, `imagenUsuario`, `rol_usuario`) VALUES
(1, 'invitado', '1234', 'invitado', 'Romero', 'flesiking@gmail.com', 0, '', '', ''),
(2, 'rocio', '1234', 'Rocio', 'LLera', '', 0, '', 'images/users/default.jpg', 'usuario'),
(3, 'pepe', '1234', 'Jose Luis', 'Romero', 'flesiking@gmail.com', 617290920, 'C/Falsa 123', 'images/users/01.jpg', 'administrador'),
(4, 'macarro', 'fsdf', '', '', '', 0, '', 'images/users/default.jpg', 'usuario'),
(5, 'fsddda', 'fsddfs', '', '', '', NULL, NULL, 'images/users/default.jpg', 'usuario'),
(6, 'pepelu', 'marihuana', 'pepelu@md.com', 'pepelu', 'romero', NULL, NULL, 'images/users/default.jpg', 'usuario'),
(7, 'shiro', 'croquetas', 'shiro@perro.com', 'shiro', 'dog', NULL, NULL, 'images/users/default.jpg', 'usuario'),
(8, 'wanda', 'salchichas', 'wanda@perro.com', 'wanda', 'dog', NULL, NULL, 'images/users/default.jpg', 'usuario'),
(9, 'prueba2', 'salchichas', 'wanda@perro.com', 'wanda', 'dog', NULL, NULL, 'images/users/default.jpg', 'usuario'),
(10, 'prueba3', 'salchichas', 'wanda@perro.com', 'wanda', 'dog', NULL, NULL, 'images/users/default.jpg', 'usuario'),
(13, 'wandaa', 'marihuana', 'wanda@perro.com', 'wanda', 'dog', NULL, NULL, 'images/users/default.jpg', 'usuario');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artistas_estilos`
--
ALTER TABLE `artistas_estilos`
  ADD CONSTRAINT `artistas_estilos_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`),
  ADD CONSTRAINT `artistas_estilos_ibfk_2` FOREIGN KEY (`id_estilo`) REFERENCES `estilos` (`id`);

--
-- Filtros para la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `artistas` (`id_artista`);

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entrada_usuarios_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`);

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

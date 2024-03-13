-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2024 a las 13:57:51
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

DROP TABLE IF EXISTS `artistas`;
CREATE TABLE `artistas` (
  `id_artista` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `nombreArtista` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id_artista`, `imagen`, `nombreArtista`) VALUES
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

DROP TABLE IF EXISTS `artistas_estilos`;
CREATE TABLE `artistas_estilos` (
  `id` int(11) NOT NULL,
  `id_artista` int(11) DEFAULT NULL,
  `id_estilo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

DROP TABLE IF EXISTS `canciones`;
CREATE TABLE `canciones` (
  `idCancion` int(11) NOT NULL,
  `nombreCancion` varchar(255) NOT NULL,
  `descripcionCancion` varchar(255) NOT NULL,
  `tiempoCancion` varchar(255) NOT NULL,
  `imagenCancion` varchar(255) DEFAULT NULL,
  `enlaceCancion` varchar(255) DEFAULT NULL,
  `iframeCancion` varchar(255) NOT NULL,
  `categoriaCancion` varchar(255) DEFAULT NULL,
  `idArtista` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`idCancion`, `nombreCancion`, `descripcionCancion`, `tiempoCancion`, `imagenCancion`, `enlaceCancion`, `iframeCancion`, `categoriaCancion`, `idArtista`, `visible`) VALUES
(1, 'Boulevard Of Broken Dreams', '«Boulevard of Broken Dreams» —en español: «Bulevard de los sueños rotos»— es el segundo sencillo del álbum American Idiot, de la banda punk rock estadounidense Green Day.', '4:48', 'images/GreenDay.webp', 'Soa3gO7tL-c', '', 'Destacados', 7, 1),
(2, 'Felicidad', 'Felicidad', '4:30', 'images/cabraMecanica.webp', '8eYxjusjsyI', '', 'Tendencias', 17, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE `entradas` (
  `id_entrada` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `butaca` int(11) NOT NULL,
  `nombre_comprador` varchar(55) NOT NULL,
  `apellido_comprador` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Estructura de tabla para la tabla `estilos`
--

DROP TABLE IF EXISTS `estilos`;
CREATE TABLE `estilos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `imagenEvento` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `aforo` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `lugarConcierto` varchar(100) NOT NULL,
  `estilo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `imagenEvento`, `fecha`, `hora`, `aforo`, `id_artista`, `lugarConcierto`, `estilo`) VALUES
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

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_usuario` varchar(55) NOT NULL,
  `apellido_usuario` varchar(55) NOT NULL,
  `correo_usuario` varchar(55) NOT NULL,
  `telefono_usuario` int(11) NOT NULL,
  `direccion_usuario` varchar(100) NOT NULL,
  `imagenUsuario` varchar(255) NOT NULL DEFAULT 'images/users/default.jpg',
  `rol_usuario` enum('usuario','administrador','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `user`, `password`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `telefono_usuario`, `direccion_usuario`, `imagenUsuario`, `rol_usuario`) VALUES
(1, 'invitado', '1234', 'invitado', 'Romero', 'flesiking@gmail.com', 0, '', '', ''),
(2, 'rocio', '1234', 'Rocio', 'LLera', '', 0, '', 'images/users/default.jpg', 'usuario'),
(3, 'pepe', '1234', 'Jose Luis', 'Romero', 'flesiking@gmail.com', 617290920, 'C/Falsa 123', 'images/users/01.jpg', 'administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id_artista`);

--
-- Indices de la tabla `artistas_estilos`
--
ALTER TABLE `artistas_estilos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_estilo` (`id_estilo`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`idCancion`),
  ADD KEY `idArtista` (`idArtista`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `entrada_usuarios_fk` (`id_usuario`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `estilos`
--
ALTER TABLE `estilos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `artistas_estilos`
--
ALTER TABLE `artistas_estilos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `canciones`
--
ALTER TABLE `canciones`
  MODIFY `idCancion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `estilos`
--
ALTER TABLE `estilos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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

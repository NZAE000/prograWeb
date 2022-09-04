-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para video_club
CREATE DATABASE IF NOT EXISTS `video_club` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `video_club`;

-- Volcando estructura para tabla video_club.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `codigo_cliente` int(11) NOT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla video_club.copias
CREATE TABLE IF NOT EXISTS `copias` (
  `n_copia` int(11) NOT NULL,
  `deteriorada` int(11) DEFAULT NULL,
  `formato` varchar(100) DEFAULT NULL,
  `id_pelicula` int(11) DEFAULT NULL,
  `precio_alquiler` int(11) DEFAULT NULL,
  PRIMARY KEY (`n_copia`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `id_pelicula` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla video_club.peliculas
CREATE TABLE IF NOT EXISTS `peliculas` (
  `id_pelicula` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `critica` varchar(100) DEFAULT NULL,
  `caratula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla video_club.prestamos
CREATE TABLE IF NOT EXISTS `prestamos` (
  `id_prestamos` int(11) NOT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_tope` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `cod_cliente` int(11) DEFAULT NULL,
  `n_copia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_prestamos`),
  KEY `cod_cliente` (`cod_cliente`),
  KEY `n_copia` (`n_copia`),
  CONSTRAINT `cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`codigo_cliente`),
  CONSTRAINT `n_copia` FOREIGN KEY (`n_copia`) REFERENCES `copias` (`n_copia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

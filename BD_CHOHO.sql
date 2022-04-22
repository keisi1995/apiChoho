-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.17-log - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para choho
CREATE DATABASE IF NOT EXISTS `choho` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `choho`;

-- Volcando estructura para tabla choho.asesor
CREATE TABLE IF NOT EXISTS `asesor` (
  `id_asesor` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_asesor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla choho.asesor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `asesor` DISABLE KEYS */;
INSERT INTO `asesor` (`id_asesor`, `nombres`, `apellidos`) VALUES
	(1, 'JUAN PABLO', 'ROJAS MENDOZA'),
	(2, 'ANA MARIA', 'MARTINEZ');
/*!40000 ALTER TABLE `asesor` ENABLE KEYS */;

-- Volcando estructura para tabla choho.asesor_cliente
CREATE TABLE IF NOT EXISTS `asesor_cliente` (
  `id_asesor_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_asesor` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_asesor_cliente`) USING BTREE,
  KEY `FK_asesor_cliente_asesor` (`id_asesor`) USING BTREE,
  KEY `FK_asesor_cliente_cliente` (`id_cliente`) USING BTREE,
  CONSTRAINT `FK_asesor_cliente_asesor` FOREIGN KEY (`id_asesor`) REFERENCES `asesor` (`id_asesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asesor_cliente_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla choho.asesor_cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `asesor_cliente` DISABLE KEYS */;
INSERT INTO `asesor_cliente` (`id_asesor_cliente`, `id_asesor`, `id_cliente`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3);
/*!40000 ALTER TABLE `asesor_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla choho.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(100) DEFAULT NULL,
  `nro_documento` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla choho.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id_cliente`, `razon_social`, `nro_documento`) VALUES
	(1, 'ALIMENTARI S.A.C.', '20607690457'),
	(2, 'RAPAIMA S.A.C.', '20601594094'),
	(3, 'DELICE S.A.C', '20109711441');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla choho.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valor_unitario` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `FK_detalle_pedido_pedido` (`id_pedido`),
  KEY `FK_detalle_pedido_producto` (`id_producto`),
  CONSTRAINT `FK_detalle_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_detalle_pedido_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla choho.detalle_pedido: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` (`id_detalle_pedido`, `id_pedido`, `id_producto`, `cantidad`, `valor_unitario`) VALUES
	(1, 1, 1, 3, 520.000),
	(2, 1, 2, 1, 3500.000),
	(3, 2, 1, 2, 520.000),
	(4, 3, 2, 3, 3500.000),
	(5, 4, 1, 4, 520.000),
	(6, 4, 2, 2, 3500.000);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;

-- Volcando estructura para tabla choho.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_pedido_cliente` (`id_cliente`),
  CONSTRAINT `FK_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla choho.pedido: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `fecha_emision`, `fecha_pago`, `estado`) VALUES
	(1, 2, '2022-01-15', '2022-01-20', 'pagado'),
	(2, 2, '2022-01-20', '2022-01-24', 'pendiente'),
	(3, 1, '2022-01-16', '2022-01-20', 'pagado'),
	(4, 3, '2022-03-15', '2022-03-20', 'pagado');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla choho.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `valor_unitario` decimal(10,3) DEFAULT '0.000',
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla choho.producto: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id_producto`, `producto`, `tipo`, `stock`, `valor_unitario`) VALUES
	(1, 'cadena para motos', 'cadenas', 10, 520.000),
	(2, 'bateria de autos', 'bateria', 5, 3500.000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para procedimiento choho.sp_asesor
DELIMITER //
CREATE PROCEDURE `sp_asesor`(
	IN `pCod_assesor` CHAR(4)
)
BEGIN
	SET @Query = '';
	SET @Query = CONCAT(@QUERY, "
	SELECT
		ASR.id_asesor AS id_asesor,
		CONCAT('C', LPAD(ASR.id_asesor, 3, '0')) AS cod_assesor,
		CONCAT(ASR.nombres, ASR.apellidos) AS nombre_asesor,
		COUNT(DISTINCT ASRC.id_asesor_cliente) AS clientes_asignados,
		COUNT(PDO.id_pedido) AS total_pedidos
	FROM asesor ASR
	LEFT JOIN asesor_cliente ASRC ON (ASRC.id_asesor = ASR.id_asesor)
	LEFT JOIN pedido PDO ON (PDO.id_cliente = ASRC.id_cliente)
	WHERE 1 = 1");
	
	IF (pCod_assesor <> '') THEN SET @Query = CONCAT(@Query, ' AND CONCAT("C", LPAD(ASR.id_asesor, 3, "0")) = ''', pCod_assesor, ''''); END IF;	

	SET @Query = CONCAT(@QUERY, ' GROUP BY ASR.id_asesor ORDER BY CONCAT(ASR.nombres, ASR.apellidos) ASC;');	
	PREPARE stmt FROM @Query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END//
DELIMITER ;

-- Volcando estructura para procedimiento choho.sp_asesor_cliente
DELIMITER //
CREATE PROCEDURE `sp_asesor_cliente`(
	IN `pId_asesor` INT
)
BEGIN
	SELECT
		CLI.id_cliente AS id_cliente,
		COUNT(PED.id_pedido) AS total_pedidos,
		CLI.razon_social AS razon_social,
		CLI.nro_documento AS nro_documento
	FROM cliente CLI
	LEFT JOIN asesor_cliente ASRC ON (CLI.id_cliente = ASRC.id_cliente)
	LEFT JOIN pedido PED ON (PED.id_cliente = CLI.id_cliente)
	WHERE ASRC.id_asesor = pId_asesor
	GROUP BY CLI.id_cliente ORDER BY CLI.razon_social ASC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento choho.sp_combobox
DELIMITER //
CREATE PROCEDURE `sp_combobox`(
	IN `tip` INT
)
BEGIN
	CASE tip 
		WHEN 1 THEN

			SELECT
				CONCAT('C', LPAD(ASR.id_asesor, 3, '0')) AS ID,
			CONCAT(ASR.nombres, ASR.apellidos) AS LABEL
			FROM asesor ASR
			ORDER BY CONCAT(ASR.nombres, ASR.apellidos) ASC;
						 
	END CASE;
END//
DELIMITER ;

-- Volcando estructura para procedimiento choho.sp_pedido
DELIMITER //
CREATE PROCEDURE `sp_pedido`(
	IN `pId_cliente` INT
)
BEGIN
	SELECT
		PED.id_pedido AS id_pedido,
		COUNT(DPE.id_detalle_pedido) AS total_productos,
		SUM(DPE.cantidad * DPE.valor_unitario) AS total_pedido,
		PED.estado AS estado,
		PED.fecha_pago AS fecha
	FROM pedido PED
	STRAIGHT_JOIN detalle_pedido DPE ON (PED.id_pedido = DPE.id_pedido)
	WHERE PED.id_cliente = pId_cliente
	GROUP BY PED.id_pedido;
END//
DELIMITER ;

-- Volcando estructura para procedimiento choho.sp_pedido_detalle
DELIMITER //
CREATE PROCEDURE `sp_pedido_detalle`(
	IN `pId_pedido` INT
)
BEGIN
	SELECT	
		PRD.id_producto AS id_producto,
		PRD.tipo AS tipo,
		DPE.cantidad AS cantidad,
		DPE.valor_unitario AS valor_unitario,
		DPE.cantidad * DPE.valor_unitario AS total
	FROM detalle_pedido DPE
	STRAIGHT_JOIN producto PRD ON (PRD.id_producto = DPE.id_producto)
	WHERE DPE.id_pedido = pId_pedido;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

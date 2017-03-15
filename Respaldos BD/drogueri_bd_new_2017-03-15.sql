# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: www.drogueriaconcepcion.cl (MySQL 5.5.5-10.0.30-MariaDB)
# Base de datos: drogueri_bd_new
# Tiempo de Generación: 2017-03-15 19:00:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla clientes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `rut` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dv` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `direccion_factura` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_despacho` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comunas_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientes_comuna1_idx` (`comunas_id`),
  CONSTRAINT `clientes_comunas_id_foreign` FOREIGN KEY (`comunas_id`) REFERENCES `comunas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;

INSERT INTO `clientes` (`id`, `rut`, `dv`, `nombre`, `direccion_factura`, `direccion_despacho`, `comunas_id`, `created_at`, `updated_at`)
VALUES
	(1548,'61607304','4','Hospital Santa Barbara','Salamanca s/n','Salamanca s/n',215,'2017-03-09 14:05:49','2017-03-09 14:05:49'),
	(1634,'61606700','1','SERVICIO SALUD ACONCAGUA','San Francisco 76','San Francisco 76',68,'2017-03-09 14:07:35','2017-03-09 14:07:35'),
	(2088,'61602220','2','Hospital Nacimiento','Julio Hemmelmann 711','Julio Hemmelmann 711',210,'2017-03-09 13:37:40','2017-03-09 13:37:40'),
	(2097,'61602209','1','Hospital Arauco','Caupolican S/N','Caupolican S/N',197,'2017-03-09 14:05:17','2017-03-09 14:05:17'),
	(2113,'61607306','0','Hospital Laja','Avenida Los Rios #800','Avenida Los Rios #800',207,'2017-03-09 14:04:14','2017-03-09 14:04:14'),
	(2125,'61606407','k','Hospital de Illapel','Independencia 0512','Independencia 0512',31,'2017-03-09 15:37:39','2017-03-09 15:37:39'),
	(2786,'69264800','5','MUNICIPALIDAD DE SAN PEDRO DE LA PAZ','DIAGONAL BIO BIO   145','DIAGONAL BIO BIO   145',226,'2017-03-09 15:40:27','2017-03-09 15:40:27'),
	(3710,'69180900','5','Ilustre Municipalidad de Victoria','Muñoz Vargas 730','Muñoz Vargas 730',282,'2017-03-09 15:38:54','2017-03-09 15:38:54'),
	(3932,'69090200','1','Ilustre Municipalidad de Placilla','Almirante Latorre N° 2229','Almirante Latorre N° 2229',163,'2017-03-09 14:06:47','2017-03-09 14:06:47'),
	(3977,'69170202','2','Ilustre Municipalidad de Santa Barbara','Zenteno 328 Santa Bárbara','Zenteno 328 Santa Bárbara',215,'2017-03-09 14:08:51','2017-03-09 14:08:51'),
	(4847,'61606700','1','SERVICIO SALUD ACONCAGUA','San José de las Hnas. Hospitalarias Nº151','San José de las Hnas. Hospitalarias Nº151',47,'2017-03-09 14:06:20','2017-03-09 14:06:20'),
	(5012,'61607301','k','Complejo Asistencial Dr. Victor Ríos Ruíz','AVDA.RICARDO VICUÑA 147','AVDA.RICARDO VICUÑA 147',208,'2017-03-09 14:10:18','2017-03-09 14:10:18'),
	(61975800,'61975800','5','Hospital Ancud','Alte. Latorre # 301','Alte. Latorre # 301',295,'2017-03-09 15:53:50','2017-03-09 15:53:50'),
	(70931900,'70931900','0','Corporación Municipal Punta Arenas','Jorge Montt #890','Vicente Perez Barría # 0762',338,'2017-03-09 15:45:42','2017-03-09 15:45:42'),
	(76018992,'76018992','8','Clinica Universitaria de Concepcion S.A.','Avda. Jorge Alessandri # 2047','Avda. Jorge Alessandri # 2047',219,'2017-03-09 15:43:06','2017-03-09 15:43:06'),
	(76033408,'76033408','1','Velcia del Carmen Bravo Atenas Farmacéutica E.I.R.L.','Miraflores # 497','Miraflores # 497',158,'2017-03-09 15:50:00','2017-03-09 15:50:00');

/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla comunas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comunas`;

CREATE TABLE `comunas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comunas_provincia1_idx` (`provincia_id`),
  CONSTRAINT `comunas_provincia_id_foreign` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `comunas` WRITE;
/*!40000 ALTER TABLE `comunas` DISABLE KEYS */;

INSERT INTO `comunas` (`id`, `nombre`, `provincia_id`, `created_at`, `updated_at`)
VALUES
	(1,'Arica',1,NULL,NULL),
	(2,'Camarones',1,NULL,NULL),
	(3,'General Lagos',2,NULL,NULL),
	(4,'Putre',2,NULL,NULL),
	(5,'Alto Hospicio',3,NULL,NULL),
	(6,'Iquique',3,NULL,NULL),
	(7,'Camiña',4,NULL,NULL),
	(8,'Colchane',4,NULL,NULL),
	(9,'Huara',4,NULL,NULL),
	(10,'Pica',4,NULL,NULL),
	(11,'Pozo Almonte',4,NULL,NULL),
	(12,'Antofagasta',5,NULL,NULL),
	(13,'Mejillones',5,NULL,NULL),
	(14,'Sierra Gorda',5,NULL,NULL),
	(15,'Taltal',5,NULL,NULL),
	(16,'Calama',6,NULL,NULL),
	(17,'Ollague',6,NULL,NULL),
	(18,'San Pedro de Atacama',6,NULL,NULL),
	(19,'María Elena',7,NULL,NULL),
	(20,'Tocopilla',7,NULL,NULL),
	(21,'Chañaral',8,NULL,NULL),
	(22,'Diego de Almagro',8,NULL,NULL),
	(23,'Caldera',9,NULL,NULL),
	(24,'Copiapó',9,NULL,NULL),
	(25,'Tierra Amarilla',9,NULL,NULL),
	(26,'Alto del Carmen',10,NULL,NULL),
	(27,'Freirina',10,NULL,NULL),
	(28,'Huasco',10,NULL,NULL),
	(29,'Vallenar',10,NULL,NULL),
	(30,'Canela',11,NULL,NULL),
	(31,'Illapel',11,NULL,NULL),
	(32,'Los Vilos',11,NULL,NULL),
	(33,'Salamanca',11,NULL,NULL),
	(34,'Andacollo',12,NULL,NULL),
	(35,'Coquimbo',12,NULL,NULL),
	(36,'La Higuera',12,NULL,NULL),
	(37,'La Serena',12,NULL,NULL),
	(38,'Paihuaco',12,NULL,NULL),
	(39,'Vicuña',12,NULL,NULL),
	(40,'Combarbalá',13,NULL,NULL),
	(41,'Monte Patria',13,NULL,NULL),
	(42,'Ovalle',13,NULL,NULL),
	(43,'Punitaqui',13,NULL,NULL),
	(44,'Río Hurtado',13,NULL,NULL),
	(45,'Isla de Pascua',14,NULL,NULL),
	(46,'Calle Larga',15,NULL,NULL),
	(47,'Los Andes',15,NULL,NULL),
	(48,'Rinconada',15,NULL,NULL),
	(49,'San Esteban',15,NULL,NULL),
	(50,'La Ligua',16,NULL,NULL),
	(51,'Papudo',16,NULL,NULL),
	(52,'Petorca',16,NULL,NULL),
	(53,'Zapallar',16,NULL,NULL),
	(54,'Hijuelas',17,NULL,NULL),
	(55,'La Calera',17,NULL,NULL),
	(56,'La Cruz',17,NULL,NULL),
	(57,'Limache',17,NULL,NULL),
	(58,'Nogales',17,NULL,NULL),
	(59,'Olmué',17,NULL,NULL),
	(60,'Quillota',17,NULL,NULL),
	(61,'Algarrobo',18,NULL,NULL),
	(62,'Cartagena',18,NULL,NULL),
	(63,'El Quisco',18,NULL,NULL),
	(64,'El Tabo',18,NULL,NULL),
	(65,'San Antonio',18,NULL,NULL),
	(66,'Santo Domingo',18,NULL,NULL),
	(67,'Catemu',19,NULL,NULL),
	(68,'Llay Llay',19,NULL,NULL),
	(69,'Panquehue',19,NULL,NULL),
	(70,'Putaendo',19,NULL,NULL),
	(71,'San Felipe',19,NULL,NULL),
	(72,'Santa María',19,NULL,NULL),
	(73,'Casablanca',20,NULL,NULL),
	(74,'Concón',20,NULL,NULL),
	(75,'Juan Fernández',20,NULL,NULL),
	(76,'Puchuncaví',20,NULL,NULL),
	(77,'Quilpué',20,NULL,NULL),
	(78,'Quintero',20,NULL,NULL),
	(79,'Valparaíso',20,NULL,NULL),
	(80,'Villa Alemana',20,NULL,NULL),
	(81,'Viña del Mar',20,NULL,NULL),
	(82,'Colina',21,NULL,NULL),
	(83,'Lampa',21,NULL,NULL),
	(84,'Tiltil',21,NULL,NULL),
	(85,'Pirque',22,NULL,NULL),
	(86,'Puente Alto',22,NULL,NULL),
	(87,'San José de Maipo',22,NULL,NULL),
	(88,'Buin',23,NULL,NULL),
	(89,'Calera de Tango',23,NULL,NULL),
	(90,'Paine',23,NULL,NULL),
	(91,'San Bernardo',23,NULL,NULL),
	(92,'Alhué',24,NULL,NULL),
	(93,'Curacaví',24,NULL,NULL),
	(94,'María Pinto',24,NULL,NULL),
	(95,'Melipilla',24,NULL,NULL),
	(96,'San Pedro',24,NULL,NULL),
	(97,'Cerrillos',25,NULL,NULL),
	(98,'Cerro Navia',25,NULL,NULL),
	(99,'Conchalí',25,NULL,NULL),
	(100,'El Bosque',25,NULL,NULL),
	(101,'Estación Central',25,NULL,NULL),
	(102,'Huechuraba',25,NULL,NULL),
	(103,'Independencia',25,NULL,NULL),
	(104,'La Cisterna',25,NULL,NULL),
	(105,'La Granja',25,NULL,NULL),
	(106,'La Florida',25,NULL,NULL),
	(107,'La Pintana',25,NULL,NULL),
	(108,'La Reina',25,NULL,NULL),
	(109,'Las Condes',25,NULL,NULL),
	(110,'Lo Barnechea',25,NULL,NULL),
	(111,'Lo Espejo',25,NULL,NULL),
	(112,'Lo Prado',25,NULL,NULL),
	(113,'Macul',25,NULL,NULL),
	(114,'Maipú',25,NULL,NULL),
	(115,'Ñuñoa',25,NULL,NULL),
	(116,'Pedro Aguirre Cerda',25,NULL,NULL),
	(117,'Peñalolén',25,NULL,NULL),
	(118,'Providencia',25,NULL,NULL),
	(119,'Pudahuel',25,NULL,NULL),
	(120,'Quilicura',25,NULL,NULL),
	(121,'Quinta Normal',25,NULL,NULL),
	(122,'Recoleta',25,NULL,NULL),
	(123,'Renca',25,NULL,NULL),
	(124,'San Miguel',25,NULL,NULL),
	(125,'San Joaquín',25,NULL,NULL),
	(126,'San Ramón',25,NULL,NULL),
	(127,'Santiago',25,NULL,NULL),
	(128,'Vitacura',25,NULL,NULL),
	(129,'El Monte',26,NULL,NULL),
	(130,'Isla de Maipo',26,NULL,NULL),
	(131,'Padre Hurtado',26,NULL,NULL),
	(132,'Peñaflor',26,NULL,NULL),
	(133,'Talagante',26,NULL,NULL),
	(134,'Codegua',27,NULL,NULL),
	(135,'Coínco',27,NULL,NULL),
	(136,'Coltauco',27,NULL,NULL),
	(137,'Doñihue',27,NULL,NULL),
	(138,'Graneros',27,NULL,NULL),
	(139,'Las Cabras',27,NULL,NULL),
	(140,'Machalí',27,NULL,NULL),
	(141,'Malloa',27,NULL,NULL),
	(142,'Mostazal',27,NULL,NULL),
	(143,'Olivar',27,NULL,NULL),
	(144,'Peumo',27,NULL,NULL),
	(145,'Pichidegua',27,NULL,NULL),
	(146,'Quinta de Tilcoco',27,NULL,NULL),
	(147,'Rancagua',27,NULL,NULL),
	(148,'Rengo',27,NULL,NULL),
	(149,'Requínoa',27,NULL,NULL),
	(150,'San Vicente de Tagua Tagua',27,NULL,NULL),
	(151,'La Estrella',28,NULL,NULL),
	(152,'Litueche',28,NULL,NULL),
	(153,'Marchihue',28,NULL,NULL),
	(154,'Navidad',28,NULL,NULL),
	(155,'Peredones',28,NULL,NULL),
	(156,'Pichilemu',28,NULL,NULL),
	(157,'Chépica',29,NULL,NULL),
	(158,'Chimbarongo',29,NULL,NULL),
	(159,'Lolol',29,NULL,NULL),
	(160,'Nancagua',29,NULL,NULL),
	(161,'Palmilla',29,NULL,NULL),
	(162,'Peralillo',29,NULL,NULL),
	(163,'Placilla',29,NULL,NULL),
	(164,'Pumanque',29,NULL,NULL),
	(165,'San Fernando',29,NULL,NULL),
	(166,'Santa Cruz',29,NULL,NULL),
	(167,'Cauquenes',30,NULL,NULL),
	(168,'Chanco',30,NULL,NULL),
	(169,'Pelluhue',30,NULL,NULL),
	(170,'Curicó',31,NULL,NULL),
	(171,'Hualañé',31,NULL,NULL),
	(172,'Licantén',31,NULL,NULL),
	(173,'Molina',31,NULL,NULL),
	(174,'Rauco',31,NULL,NULL),
	(175,'Romeral',31,NULL,NULL),
	(176,'Sagrada Familia',31,NULL,NULL),
	(177,'Teno',31,NULL,NULL),
	(178,'Vichuquén',31,NULL,NULL),
	(179,'Colbún',32,NULL,NULL),
	(180,'Linares',32,NULL,NULL),
	(181,'Longaví',32,NULL,NULL),
	(182,'Parral',32,NULL,NULL),
	(183,'Retiro',32,NULL,NULL),
	(184,'San Javier',32,NULL,NULL),
	(185,'Villa Alegre',32,NULL,NULL),
	(186,'Yerbas Buenas',32,NULL,NULL),
	(187,'Constitución',33,NULL,NULL),
	(188,'Curepto',33,NULL,NULL),
	(189,'Empedrado',33,NULL,NULL),
	(190,'Maule',33,NULL,NULL),
	(191,'Pelarco',33,NULL,NULL),
	(192,'Pencahue',33,NULL,NULL),
	(193,'Río Claro',33,NULL,NULL),
	(194,'San Clemente',33,NULL,NULL),
	(195,'San Rafael',33,NULL,NULL),
	(196,'Talca',33,NULL,NULL),
	(197,'Arauco',34,NULL,NULL),
	(198,'Cañete',34,NULL,NULL),
	(199,'Contulmo',34,NULL,NULL),
	(200,'Curanilahue',34,NULL,NULL),
	(201,'Lebu',34,NULL,NULL),
	(202,'Los Álamos',34,NULL,NULL),
	(203,'Tirúa',34,NULL,NULL),
	(204,'Alto Biobío',35,NULL,NULL),
	(205,'Antuco',35,NULL,NULL),
	(206,'Cabrero',35,NULL,NULL),
	(207,'Laja',35,NULL,NULL),
	(208,'Los Ángeles',35,NULL,NULL),
	(209,'Mulchén',35,NULL,NULL),
	(210,'Nacimiento',35,NULL,NULL),
	(211,'Negrete',35,NULL,NULL),
	(212,'Quilaco',35,NULL,NULL),
	(213,'Quilleco',35,NULL,NULL),
	(214,'San Rosendo',35,NULL,NULL),
	(215,'Santa Bárbara',35,NULL,NULL),
	(216,'Tucapel',35,NULL,NULL),
	(217,'Yumbel',35,NULL,NULL),
	(218,'Chiguayante',36,NULL,NULL),
	(219,'Concepción',36,NULL,NULL),
	(220,'Coronel',36,NULL,NULL),
	(221,'Florida',36,NULL,NULL),
	(222,'Hualpén',36,NULL,NULL),
	(223,'Hualqui',36,NULL,NULL),
	(224,'Lota',36,NULL,NULL),
	(225,'Penco',36,NULL,NULL),
	(226,'San Pedro de La Paz',36,NULL,NULL),
	(227,'Santa Juana',36,NULL,NULL),
	(228,'Talcahuano',36,NULL,NULL),
	(229,'Tomé',36,NULL,NULL),
	(230,'Bulnes',37,NULL,NULL),
	(231,'Chillán',37,NULL,NULL),
	(232,'Chillán Viejo',37,NULL,NULL),
	(233,'Cobquecura',37,NULL,NULL),
	(234,'Coelemu',37,NULL,NULL),
	(235,'Coihueco',37,NULL,NULL),
	(236,'El Carmen',37,NULL,NULL),
	(237,'Ninhue',37,NULL,NULL),
	(238,'Ñiquen',37,NULL,NULL),
	(239,'Pemuco',37,NULL,NULL),
	(240,'Pinto',37,NULL,NULL),
	(241,'Portezuelo',37,NULL,NULL),
	(242,'Quillón',37,NULL,NULL),
	(243,'Quirihue',37,NULL,NULL),
	(244,'Ránquil',37,NULL,NULL),
	(245,'San Carlos',37,NULL,NULL),
	(246,'San Fabián',37,NULL,NULL),
	(247,'San Ignacio',37,NULL,NULL),
	(248,'San Nicolás',37,NULL,NULL),
	(249,'Treguaco',37,NULL,NULL),
	(250,'Yungay',37,NULL,NULL),
	(251,'Carahue',38,NULL,NULL),
	(252,'Cholchol',38,NULL,NULL),
	(253,'Cunco',38,NULL,NULL),
	(254,'Curarrehue',38,NULL,NULL),
	(255,'Freire',38,NULL,NULL),
	(256,'Galvarino',38,NULL,NULL),
	(257,'Gorbea',38,NULL,NULL),
	(258,'Lautaro',38,NULL,NULL),
	(259,'Loncoche',38,NULL,NULL),
	(260,'Melipeuco',38,NULL,NULL),
	(261,'Nueva Imperial',38,NULL,NULL),
	(262,'Padre Las Casas',38,NULL,NULL),
	(263,'Perquenco',38,NULL,NULL),
	(264,'Pitrufquén',38,NULL,NULL),
	(265,'Pucón',38,NULL,NULL),
	(266,'Saavedra',38,NULL,NULL),
	(267,'Temuco',38,NULL,NULL),
	(268,'Teodoro Schmidt',38,NULL,NULL),
	(269,'Toltén',38,NULL,NULL),
	(270,'Vilcún',38,NULL,NULL),
	(271,'Villarrica',38,NULL,NULL),
	(272,'Angol',39,NULL,NULL),
	(273,'Collipulli',39,NULL,NULL),
	(274,'Curacautín',39,NULL,NULL),
	(275,'Ercilla',39,NULL,NULL),
	(276,'Lonquimay',39,NULL,NULL),
	(277,'Los Sauces',39,NULL,NULL),
	(278,'Lumaco',39,NULL,NULL),
	(279,'Purén',39,NULL,NULL),
	(280,'Renaico',39,NULL,NULL),
	(281,'Traiguén',39,NULL,NULL),
	(282,'Victoria',39,NULL,NULL),
	(283,'Corral',40,NULL,NULL),
	(284,'Lanco',40,NULL,NULL),
	(285,'Los Lagos',40,NULL,NULL),
	(286,'Máfil',40,NULL,NULL),
	(287,'Mariquina',40,NULL,NULL),
	(288,'Paillaco',40,NULL,NULL),
	(289,'Panguipulli',40,NULL,NULL),
	(290,'Valdivia',40,NULL,NULL),
	(291,'Futrono',41,NULL,NULL),
	(292,'La Unión',41,NULL,NULL),
	(293,'Lago Ranco',41,NULL,NULL),
	(294,'Río Bueno',41,NULL,NULL),
	(295,'Ancud',42,NULL,NULL),
	(296,'Castro',42,NULL,NULL),
	(297,'Chonchi',42,NULL,NULL),
	(298,'Curaco de Vélez',42,NULL,NULL),
	(299,'Dalcahue',42,NULL,NULL),
	(300,'Puqueldón',42,NULL,NULL),
	(301,'Queilén',42,NULL,NULL),
	(302,'Quemchi',42,NULL,NULL),
	(303,'Quellón',42,NULL,NULL),
	(304,'Quinchao',42,NULL,NULL),
	(305,'Calbuco',43,NULL,NULL),
	(306,'Cochamó',43,NULL,NULL),
	(307,'Fresia',43,NULL,NULL),
	(308,'Frutillar',43,NULL,NULL),
	(309,'Llanquihue',43,NULL,NULL),
	(310,'Los Muermos',43,NULL,NULL),
	(311,'Maullín',43,NULL,NULL),
	(312,'Puerto Montt',43,NULL,NULL),
	(313,'Puerto Varas',43,NULL,NULL),
	(314,'Osorno',44,NULL,NULL),
	(315,'Puero Octay',44,NULL,NULL),
	(316,'Purranque',44,NULL,NULL),
	(317,'Puyehue',44,NULL,NULL),
	(318,'Río Negro',44,NULL,NULL),
	(319,'San Juan de la Costa',44,NULL,NULL),
	(320,'San Pablo',44,NULL,NULL),
	(321,'Chaitén',45,NULL,NULL),
	(322,'Futaleufú',45,NULL,NULL),
	(323,'Hualaihué',45,NULL,NULL),
	(324,'Palena',45,NULL,NULL),
	(325,'Aisén',46,NULL,NULL),
	(326,'Cisnes',46,NULL,NULL),
	(327,'Guaitecas',46,NULL,NULL),
	(328,'Cochrane',47,NULL,NULL),
	(329,'O\'higgins',47,NULL,NULL),
	(330,'Tortel',47,NULL,NULL),
	(331,'Coihaique',48,NULL,NULL),
	(332,'Lago Verde',48,NULL,NULL),
	(333,'Chile Chico',49,NULL,NULL),
	(334,'Río Ibáñez',49,NULL,NULL),
	(335,'Antártica',50,NULL,NULL),
	(336,'Cabo de Hornos',50,NULL,NULL),
	(337,'Laguna Blanca',51,NULL,NULL),
	(338,'Punta Arenas',51,NULL,NULL),
	(339,'Río Verde',51,NULL,NULL),
	(340,'San Gregorio',51,NULL,NULL),
	(341,'Porvenir',52,NULL,NULL),
	(342,'Primavera',52,NULL,NULL),
	(343,'Timaukel',52,NULL,NULL),
	(344,'Natales',53,NULL,NULL),
	(345,'Torres del Paine',53,NULL,NULL);

/*!40000 ALTER TABLE `comunas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contacto_clientes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacto_clientes`;

CREATE TABLE `contacto_clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clientes_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contacto_cliente_cliente1_idx` (`clientes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contacto_clientes` WRITE;
/*!40000 ALTER TABLE `contacto_clientes` DISABLE KEYS */;

INSERT INTO `contacto_clientes` (`id`, `nombre`, `telefono`, `email`, `clientes_id`, `created_at`, `updated_at`)
VALUES
	(1,'Mauro Muñoz','56-43-2332976','mauro.munoz@ssbiobio.cl',2088,'2017-03-09 17:23:26','2017-03-09 17:23:26'),
	(2,'René Antonio Astete Sepulveda','56-43-2332695','reneastete.udec@gmail.com',2113,'2017-03-09 17:24:31','2017-03-09 17:24:31'),
	(3,'Gustavo Cid Beltran','56-43-2-332840','gustavo.cid@ssbiobio.cl',1548,'2017-03-09 17:25:23','2017-03-09 17:25:23'),
	(4,'Evelin Alejandra Alfaro Perez','56-34-2490787','evelyn.alfaro@redsalud.gov.cl',4847,'2017-03-09 17:25:45','2017-03-09 17:25:45'),
	(5,'Marian Pinochet Guerrero','56-72-2856049','salud@municipalidadplacilla.cl',3932,'2017-03-09 17:26:16','2017-03-09 17:26:16'),
	(6,'Lissette Victoria Abalos Gomez','56-34-2492844','lissette.abalos@redsalud.gov.cl',1634,'2017-03-09 17:26:45','2017-03-09 17:26:45'),
	(7,'YISLEN ELIANA ANDIA BARRA','56-43-2581611','yislen.andia@santabarbara.cl',3977,'2017-03-09 17:27:10','2017-03-09 17:27:10'),
	(8,'Ana Luisa   Herrera Castillo','56-43-2336333','ana.herrera@ssbiobio.cl',5012,'2017-03-09 17:27:39','2017-03-09 17:27:39'),
	(9,'Blanca Astudillo','56-53-2663885','blanca.astudillo@redsalud.gov.cl',2125,'2017-03-09 17:28:11','2017-03-09 17:28:11'),
	(10,'Mirla Durán Pichilén','56-45-2842150','mirlasilvana16@gmail.com',3710,'2017-03-09 17:28:27','2017-03-09 17:28:27'),
	(13,'Claudio Cesar Acuña Garrido','56-32-2370220','cacuna@dassanpedrodelapaz.cl',2786,'2017-03-09 17:31:12','2017-03-09 17:31:12');

/*!40000 ALTER TABLE `contacto_clientes` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla laboratorios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `laboratorios`;

CREATE TABLE `laboratorios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rut` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dv` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `laboratorios` WRITE;
/*!40000 ALTER TABLE `laboratorios` DISABLE KEYS */;

INSERT INTO `laboratorios` (`id`, `nombre`, `rut`, `dv`, `direccion`, `ciudad`, `telefono`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'Clinical Market S.A.','76111113','2','Perez Valenzuela # 1087','118',NULL,NULL,NULL,NULL),
	(2,'Drogueria Global Phama SPA','76389383','9','Av. Vicuña Mackenna # 1220','115',NULL,NULL,NULL,NULL),
	(3,'Farmaceutica Insuval S.A.','77768990','8','Caupolicán # 1281','219',NULL,NULL,NULL,NULL),
	(4,'Labotario Maver S.A.','92121000','0','Las Encinas # 1777','83',NULL,NULL,NULL,NULL),
	(5,'Reutter S.A.','81210400','4','Av. El Salto # 4447','102',NULL,NULL,NULL,NULL),
	(6,'Servicios y Comercializadora Farmacéutica S.A','76630750','7','San Francisco # 1599','127',NULL,NULL,NULL,NULL),
	(7,'Farmaceutica Caribean LTDA.','76830090','9','Américo Vespucio # 138507','120',NULL,NULL,NULL,NULL),
	(8,'ITF Labomed Farmacéutica LTDA.','96884770','8','Av. Cerro el Plomo # 5420 Of 1405','109',NULL,NULL,NULL,NULL),
	(9,'Valma',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,'Saval',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(11,'Genfar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,'Andrómaco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(13,'Mintlab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,'Laboratorio Chile',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(99,'No Especificado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `laboratorios` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2017_02_27_135306_create_regions_table',1),
	(4,'2017_02_27_135320_create_provincias_table',1),
	(5,'2017_02_27_135330_create_comunas_table',1),
	(6,'2017_02_27_151540_create_clientes_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ocs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ocs`;

CREATE TABLE `ocs` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proveedores_id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla presentaciones_farmacologicas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `presentaciones_farmacologicas`;

CREATE TABLE `presentaciones_farmacologicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_corto` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `presentaciones_farmacologicas` WRITE;
/*!40000 ALTER TABLE `presentaciones_farmacologicas` DISABLE KEYS */;

INSERT INTO `presentaciones_farmacologicas` (`id`, `nombre`, `nombre_corto`, `created_at`, `updated_at`)
VALUES
	(1,'comprimido','comp',NULL,NULL),
	(2,'sobre','sob',NULL,NULL),
	(3,'frasco','fco',NULL,NULL),
	(4,'ampolla','amp',NULL,NULL),
	(5,'capsula','cap',NULL,NULL),
	(6,'unidad','unid',NULL,NULL),
	(7,'caja','caja',NULL,NULL),
	(8,'comprimido recubierto','comr',NULL,NULL),
	(9,'pomo','pomo',NULL,NULL);

/*!40000 ALTER TABLE `presentaciones_farmacologicas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla productos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidad_empaque` int(11) DEFAULT NULL,
  `concentracion` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipos_concentraciones_id` int(11) DEFAULT NULL,
  `precio_bodega` double(11,0) NOT NULL,
  `presentaciones_farmacologicas_id` int(11) NOT NULL DEFAULT '1',
  `laboratorios_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;

INSERT INTO `productos` (`id`, `nombre`, `unidad_empaque`, `concentracion`, `tipos_concentraciones_id`, `precio_bodega`, `presentaciones_farmacologicas_id`, `laboratorios_id`, `created_at`, `updated_at`)
VALUES
	(1,'bioflora',6,'250mg',1,498,2,4,'2017-03-13 14:44:12','2017-03-13 14:44:12'),
	(2,'dimecaina',NULL,'2%',2,2900,3,9,'2017-03-13 15:12:31','2017-03-13 15:12:31'),
	(3,'ciprodex',NULL,NULL,3,12000,3,10,'2017-03-13 15:15:25','2017-03-13 15:15:25'),
	(4,'t.r.o. 90',NULL,NULL,1,310,2,9,'2017-03-13 15:17:29','2017-03-13 15:17:29'),
	(5,'ketoprofeno',NULL,'100mg',NULL,430,4,11,'2017-03-13 15:19:23','2017-03-13 15:19:23'),
	(6,'polivitaminico',30,NULL,NULL,35,5,6,'2017-03-13 15:21:06','2017-03-13 15:21:06'),
	(7,'lovastatina',1050,'20mg',NULL,13,1,12,'2017-03-13 15:34:59','2017-03-13 15:34:59'),
	(8,'propanolol',1000,'40mg',NULL,9,1,13,'2017-03-13 15:42:28','2017-03-13 15:42:28'),
	(9,'digoxina',1000,'0,25mg',NULL,20,1,2,'2017-03-13 15:49:38','2017-03-13 15:49:38'),
	(10,'adroxef - cefadroxilo',NULL,'500mg/5ml',NULL,25900,3,14,'2017-03-13 15:50:57','2017-03-13 15:50:57'),
	(11,'clorfenamina',NULL,'4mg',NULL,4,1,99,'2017-03-15 12:15:20','2017-03-15 12:15:20'),
	(12,'eurovir - aciclovir',NULL,'800mg',1,1029,1,99,NULL,NULL),
	(13,'clorpromazina',NULL,'25 mg/2ml',1,245,4,99,'2017-03-15 12:26:00','2017-03-15 12:26:00'),
	(14,'isosorbide',1000,'10mg',NULL,12,1,99,'2017-03-15 12:30:00','2017-03-15 12:30:00'),
	(15,'azatioprina',100,'50mg',NULL,390,1,99,'2017-03-15 12:31:15','2017-03-15 12:31:15'),
	(16,'cotrimoxazol forte',NULL,'800mg/160mg',NULL,39,1,99,'2017-03-15 12:39:27','2017-03-15 12:39:27'),
	(17,'largactil',20,'100mg',NULL,495,1,99,'2017-03-15 12:40:53','2017-03-15 12:40:53'),
	(18,'carbón activado',1,'10gr',NULL,260,6,99,'2017-03-15 12:41:42','2017-03-15 12:41:42'),
	(19,'melatonina',30,'3mg',NULL,68,5,99,'2017-03-15 12:42:45','2017-03-15 12:42:45'),
	(20,'folacid',1000,'1mg',NULL,11,1,99,'2017-03-15 12:43:28','2017-03-15 12:43:28'),
	(21,'zoperil',30,'7,5mg',NULL,30,8,99,'2017-03-15 12:44:48','2017-03-15 12:44:48'),
	(22,'elixine',20,'250mg',NULL,500,1,99,'2017-03-15 12:45:11','2017-03-15 12:45:11'),
	(23,'micopirox 8%',1,'5ml',NULL,17350,3,99,'2017-03-15 12:56:02','2017-03-15 12:56:02'),
	(24,'ferranem',30,NULL,NULL,175,5,99,'2017-03-15 12:57:27','2017-03-15 12:57:27'),
	(25,'bengue',1,NULL,NULL,825,9,99,'2017-03-15 12:58:46','2017-03-15 12:58:46');

/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla proveedores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rut` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dv` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;

INSERT INTO `proveedores` (`id`, `nombre`, `rut`, `dv`, `direccion`, `ciudad`, `telefono`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'Clinical Market S.A.','76111113','2','Perez Valenzuela # 1087','118',NULL,NULL,NULL,NULL),
	(2,'Drogueria Global Phama SPA','76389383','9','Av. Vicuña Mackenna # 1220','115',NULL,NULL,NULL,NULL),
	(3,'Farmaceutica Insuval S.A.','77768990','8','Caupolicán # 1281','219',NULL,NULL,NULL,NULL),
	(4,'Labotario Maver S.A.','92121000','0','Las Encinas # 1777','83',NULL,NULL,NULL,NULL),
	(5,'Reutter S.A.','81210400','4','Av. El Salto # 4447','102',NULL,NULL,NULL,NULL),
	(6,'Servicios y Comercializadora Farmacéutica S.A.','76630750','7','San Francisco # 1599','127',NULL,NULL,NULL,NULL),
	(7,'Farmaceutica Caribean LTDA.','76830090','9','Américo Vespucio # 138507','120',NULL,NULL,NULL,NULL),
	(8,'ITF Labomed Farmacéutica LTDA.','96884770','8','Av. Cerro el Plomo # 5420 Of 1405','109',NULL,NULL,NULL,NULL),
	(99,'No Especificado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla provincias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provincias`;

CREATE TABLE `provincias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regions_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_provincias_regions_idx` (`regions_id`),
  CONSTRAINT `provincias_regions_id_foreign` FOREIGN KEY (`regions_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;

INSERT INTO `provincias` (`id`, `nombre`, `regions_id`, `created_at`, `updated_at`)
VALUES
	(1,'Arica',1,NULL,NULL),
	(2,'Parinacota',1,NULL,NULL),
	(3,'Iquique',2,NULL,NULL),
	(4,'El Tamarugal',2,NULL,NULL),
	(5,'Antofagasta',3,NULL,NULL),
	(6,'El Loa',3,NULL,NULL),
	(7,'Tocopilla',3,NULL,NULL),
	(8,'Chañaral',4,NULL,NULL),
	(9,'Copiapó',4,NULL,NULL),
	(10,'Huasco',4,NULL,NULL),
	(11,'Choapa',5,NULL,NULL),
	(12,'Elqui',5,NULL,NULL),
	(13,'Limarí',5,NULL,NULL),
	(14,'Isla de Pascua',6,NULL,NULL),
	(15,'Los Andes',6,NULL,NULL),
	(16,'Petorca',6,NULL,NULL),
	(17,'Quillota',6,NULL,NULL),
	(18,'San Antonio',6,NULL,NULL),
	(19,'San Felipe de Aconcagua',6,NULL,NULL),
	(20,'Valparaiso',6,NULL,NULL),
	(21,'Chacabuco',7,NULL,NULL),
	(22,'Cordillera',7,NULL,NULL),
	(23,'Maipo',7,NULL,NULL),
	(24,'Melipilla',7,NULL,NULL),
	(25,'Santiago',7,NULL,NULL),
	(26,'Talagante',7,NULL,NULL),
	(27,'Cachapoal',8,NULL,NULL),
	(28,'Cardenal Caro',8,NULL,NULL),
	(29,'Colchagua',8,NULL,NULL),
	(30,'Cauquenes',9,NULL,NULL),
	(31,'Curicó',9,NULL,NULL),
	(32,'Linares',9,NULL,NULL),
	(33,'Talca',9,NULL,NULL),
	(34,'Arauco',10,NULL,NULL),
	(35,'Bio Bío',10,NULL,NULL),
	(36,'Concepción',10,NULL,NULL),
	(37,'Ñuble',10,NULL,NULL),
	(38,'Cautín',11,NULL,NULL),
	(39,'Malleco',11,NULL,NULL),
	(40,'Valdivia',12,NULL,NULL),
	(41,'Ranco',12,NULL,NULL),
	(42,'Chiloé',13,NULL,NULL),
	(43,'Llanquihue',13,NULL,NULL),
	(44,'Osorno',13,NULL,NULL),
	(45,'Palena',13,NULL,NULL),
	(46,'Aisén',14,NULL,NULL),
	(47,'Capitán Prat',14,NULL,NULL),
	(48,'Coihaique',14,NULL,NULL),
	(49,'General Carrera',14,NULL,NULL),
	(50,'Antártica Chilena',15,NULL,NULL),
	(51,'Magallanes',15,NULL,NULL),
	(52,'Tierra del Fuego',15,NULL,NULL),
	(53,'Última Esperanza',15,NULL,NULL);

/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regions`;

CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordinal` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;

INSERT INTO `regions` (`id`, `nombre`, `ordinal`, `created_at`, `updated_at`)
VALUES
	(1,'Arica y Parinacota','XV',NULL,NULL),
	(2,'Tarapacá','I',NULL,NULL),
	(3,'Antofagasta','II',NULL,NULL),
	(4,'Atacama','III',NULL,NULL),
	(5,'Coquimbo','IV',NULL,NULL),
	(6,'Valparaiso','V',NULL,NULL),
	(7,'Metropolitana de Santiago','RM',NULL,NULL),
	(8,'Libertador General Bernardo O\'Higgins','VI',NULL,NULL),
	(9,'Maule','VII',NULL,NULL),
	(10,'Biobío','VIII',NULL,NULL),
	(11,'La Araucanía','IX',NULL,NULL),
	(12,'Los Ríos','XIV',NULL,NULL),
	(13,'Los Lagos','X',NULL,NULL),
	(14,'Aisén del General Carlos Ibáñez del Campo','XI',NULL,NULL),
	(15,'Magallanes y de la Antártica Chilena','XII',NULL,NULL);

/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tipos_concentraciones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipos_concentraciones`;

CREATE TABLE `tipos_concentraciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tipos_concentraciones` WRITE;
/*!40000 ALTER TABLE `tipos_concentraciones` DISABLE KEYS */;

INSERT INTO `tipos_concentraciones` (`id`, `nombre`, `created_at`, `updated_at`)
VALUES
	(1,'',NULL,NULL),
	(2,'gel oral',NULL,NULL),
	(3,'gotas óticas',NULL,NULL),
	(4,'jarabe',NULL,NULL);

/*!40000 ALTER TABLE `tipos_concentraciones` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Jonathan Isla','jisla@drogueriaconcepcion.cl','$2y$10$3qBtaBBbtm9ZsPoVULTYLeRi2KKX/E2Cv6ac8o13OG67KnbQJLfPe','dGijKFdjIFNUw6nVe3lBMbN1VH0pSuHafiADArp1oQrrDyg0UBwndhL3Ipi7','2017-03-08 18:06:12','2017-03-08 18:06:12');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

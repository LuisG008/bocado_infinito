
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bocado_infinito`
--
CREATE DATABASE IF NOT EXISTS `bocado_infinito` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bocado_infinito`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado_nombre` varchar(8) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estado`
--

DROP TABLE IF EXISTS `historial_estado`;
CREATE TABLE `historial_estado` (
  `idhistorial_estado` int(11) NOT NULL,
  `fk_pedido` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `fk_rol` int(11) DEFAULT NULL,
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
CREATE TABLE `item_pedido` (
  `iditem_pedido` int(11) NOT NULL,
  `fk_pedido` int(11) NOT NULL,
  `fk_menu` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo_consumo` varchar(255) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(2) NOT NULL,
  `ruta_imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_acceso`
--

DROP TABLE IF EXISTS `log_acceso`;
CREATE TABLE `log_acceso` (
  `idlog_acceso` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `fecha_cierre` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` int(11) NOT NULL,
  `ruta_imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `ruta_factura` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `fk_cargo` int(11) NOT NULL,
  `estado` varchar(8) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `estado` varchar(8) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vrol`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vrol`;
CREATE TABLE `vrol` (
`idrol` int(11)
,`idusuario` int(11)
,`identificacion` int(11)
,`usuario` varchar(255)
,`estado_usuario` varchar(8)
,`idcargo` int(11)
,`cargo` varchar(255)
,`estado_cargo` varchar(8)
,`estado_rol` varchar(8)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vpedido`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vpedido`;
CREATE TABLE `vpedido` (
`idpedido` int(11)
,`iditem_pedido` int(11)
,`identificacion` int(11)
,`cliente` varchar(255)
,`telefono_cliente` varchar(10)
,`fecha_hora_pedido` datetime
,`nombre_item_pedido` varchar(255)
,`descripcion_pedido` text
,`tipo_consumo` varchar(255)
,`precio` int(11)
,`cantidad` int(2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vhistorial_pedido`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vhistorial_pedido`;
CREATE TABLE `vhistorial_pedido` (
`idhistorial_estado` int(11)
,`idpedido` int(11)
,`usuario` varchar(255)
,`fecha_hora_estado` datetime
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vrol`
--
DROP TABLE IF EXISTS `vrol`;

DROP VIEW IF EXISTS `vrol`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vrol`  AS SELECT `r`.`idrol` AS `idrol`, `u`.`idusuario` AS `idusuario`, `u`.`identificacion` AS `identificacion`, `u`.`nombres` AS `usuario`, `u`.`estado` AS `estado_usuario`, `c`.`idcargo` AS `idcargo`, `c`.`nombre` AS `cargo`, `c`.`estado` AS `estado_cargo`, `r`.`estado` AS `estado_rol` FROM ((`usuario` `u` join `rol` `r` on(`u`.`idusuario` = `r`.`fk_usuario`)) join `cargo` `c` on(`c`.`idcargo` = `r`.`fk_cargo`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vpedido`
--
DROP TABLE IF EXISTS `vpedido`;

DROP VIEW IF EXISTS `vpedido`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpedido`  AS SELECT `p`.`idpedido` AS `idpedido`, `ip`.`iditem_pedido` AS `iditem_pedido`, `c`.`identificacion` AS `identificacion`, `c`.`nombres` AS `cliente`, `c`.`telefono` AS `telefono_cliente`, `p`.`fecha_hora` AS `fecha_hora_pedido`, `ip`.`nombre` AS `nombre_item_pedido`, `ip`.`descripcion` AS `descripcion_pedido`, `ip`.`tipo_consumo` AS `tipo_consumo`, `ip`.`precio` AS `precio`, `ip`.`cantidad` AS `cantidad` FROM ((`pedido` `p` join `cliente` `c` on(`p`.`fk_cliente` = `c`.`idcliente`)) join `item_pedido` `ip` on(`p`.`idpedido` = `ip`.`fk_pedido`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vhistorial_pedido`
--
DROP TABLE IF EXISTS `vhistorial_pedido`;

DROP VIEW IF EXISTS `vhistorial_pedido`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vhistorial_pedido`  AS SELECT `he`.`idhistorial_estado` AS `idhistorial_estado`, `p`.`idpedido` AS `idpedido`, CASE WHEN `vr`.`usuario` is null THEN 'cliente' ELSE `vr`.`usuario` END AS `usuario`, `he`.`fecha_hora` AS `fecha_hora_estado`, `e`.`nombre` AS `estado` FROM (((`historial_estado` `he` left join `vrol` `vr` on(`he`.`fk_rol` = `vr`.`idrol`)) join `pedido` `p` on(`he`.`fk_pedido` = `p`.`idpedido`)) join `estado` `e` on(`he`.`fk_estado` = `e`.`idestado`)) ORDER BY `he`.`idhistorial_estado` DESC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vpedido`
--
DROP TABLE IF EXISTS `vpedido`;

DROP VIEW IF EXISTS `vpedido`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpedido`  AS SELECT `p`.`idpedido` AS `idpedido`, `ip`.`iditem_pedido` AS `iditem_pedido`, `c`.`identificacion` AS `identificacion`, `c`.`nombres` AS `cliente`, `c`.`telefono` AS `telefono_cliente`, `p`.`fecha_hora` AS `fecha_hora_pedido`, `ip`.`nombre` AS `nombre_item_pedido`, `ip`.`descripcion` AS `descripcion_pedido`, `ip`.`tipo_consumo` AS `tipo_consumo`, `ip`.`precio` AS `precio`, `ip`.`cantidad` AS `cantidad` FROM ((`pedido` `p` join `cliente` `c` on(`p`.`fk_cliente` = `c`.`idcliente`)) join `item_pedido` `ip` on(`p`.`idpedido` = `ip`.`fk_pedido`))  ;




--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `historial_estado`
--
ALTER TABLE `historial_estado`
  ADD PRIMARY KEY (`idhistorial_estado`),
  ADD KEY `fk_historial_estado_estado` (`fk_estado`),
  ADD KEY `fk_historial_estado_pedido` (`fk_pedido`);

--
-- Indices de la tabla `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`iditem_pedido`),
  ADD KEY `fk_item_pedido_menu` (`fk_menu`),
  ADD KEY `fk_item_pedido_pedido` (`fk_pedido`);

--
-- Indices de la tabla `log_acceso`
--
ALTER TABLE `log_acceso`
  ADD PRIMARY KEY (`idlog_acceso`),
  ADD KEY `fk_log_acceso_usuario` (`fk_usuario`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `fk_pedido_cliente` (`fk_cliente`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`),
  ADD UNIQUE KEY `fk_usuario` (`fk_usuario`,`fk_cargo`),
  ADD KEY `fk_rol_cargo` (`fk_cargo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);


--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idcargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `historial_estado`
--
ALTER TABLE `historial_estado`
  MODIFY `idhistorial_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `iditem_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `log_acceso`
--
ALTER TABLE `log_acceso`
  MODIFY `idlog_acceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Filtros para la tabla `historial_estado`
--
ALTER TABLE `historial_estado`
  ADD CONSTRAINT `fk_historial_estado_estado` FOREIGN KEY (`fk_estado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historial_estado_pedido` FOREIGN KEY (`fk_pedido`) REFERENCES `pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historial_estado_rol` FOREIGN KEY (`fk_rol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `fk_item_pedido_menu` FOREIGN KEY (`fk_menu`) REFERENCES `menu` (`idmenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_pedido_pedido` FOREIGN KEY (`fk_pedido`) REFERENCES `pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log_acceso`
--
ALTER TABLE `log_acceso`
  ADD CONSTRAINT `fk_log_acceso_usuario` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `fk_rol_cargo` FOREIGN KEY (`fk_cargo`) REFERENCES `cargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_usuario` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

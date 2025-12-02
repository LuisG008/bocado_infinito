
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
USE `bocado_infinito`;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idcargo`, `nombre`, `estado`) VALUES
(1, 'Administrador', 'Activo'),
(2, 'Cocina', 'Activo'),
(3, 'Caja', 'Activo'),
(4, 'Entrega', 'Activo');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `identificacion`, `nombres`, `telefono`) VALUES
(1, 1087598654, 'Mark Andres Torres', '3156984562'),
(2, 1015697865, 'Felipe Lopez', '3019874562'),
(3, 314658442, 'Maria Andrea Cortez', '3026541475');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `nombre`, `estado_nombre`) VALUES
(1, 'Pendiente de pago', 'Activo'),
(2, 'Cancelado', 'Activo'),
(3, 'Pagado', 'Activo'),
(4, 'En preparación', 'Activo'),
(5, 'Listo para entrega', 'Activo'),
(6, 'Entregado', 'Activo');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idmenu`, `nombre`, `descripcion`, `precio`, `ruta_imagen`) VALUES
(1, 'Papas a la Francesa', 'Porción de 300 g de papas cortadas en tiras y fritas en aceite vegetal hasta lograr una textura crocante por fuera y suave por dentro. Sazonadas ligeramente con sal', 10000, 'public/imagenes_recetas/img1.png'),
(2, 'Cazuela de Mariscos', 'Preparada con aproximadamente 250 g de mezcla de mariscos (calamar, camarón, mejillón y pulpo), cocinados en una salsa cremosa a base de leche de coco, pimentón, cebolla, ajo, tomate y especias', 40000, 'public/imagenes_recetas/img2.png'),
(3, 'Bandeja Paisa', 'Plato completo que incluye:\n\nPorción de frijoles\n\nPorción de arroz blanco\n\n120 g de carne molida\n\n1 chicharrón crocante (aprox. 100–120 g)\n\n1 huevo frito\n\n1 tajada de plátano maduro\n\n1 arepa pequeña\n\n1 porción de aguacate (¼ unidad)\n', 30000, 'public/imagenes_recetas/img3.png');

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `fk_cliente`, `fecha_hora`, `ruta_factura`) VALUES
(1, 2, '2025-11-21 01:15:03', 'public/facturas/factura1.png'),
(2, 3, '2025-11-22 12:39:03', 'public/facturas/factura2.png'),
(3, 1, '2025-11-22 12:10:27', 'public/facturas/factura3.png'),
(4, 1, '2025-11-23 19:41:32', 'public/facturas/factura4.png');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `item_pedido`
--

INSERT INTO `item_pedido` (`iditem_pedido`, `fk_pedido`, `fk_menu`, `nombre`, `descripcion`, `tipo_consumo`, `precio`, `cantidad`, `ruta_imagen`) VALUES
(1, 1, 1, 'Papas a la Francesa', 'Porción de 300 g de papas cortadas en tiras y fritas en aceite vegetal hasta lograr una textura crocante por fuera y suave por dentro. Sazonadas ligeramente con sal', 'Para llevar', 10000, 1, 'public/imagenes_recetas/img1.png'),
(2, 2, 2, 'Cazuela de Mariscos', 'Preparada con aproximadamente 250 g de mezcla de mariscos (calamar, camarón, mejillón y pulpo), cocinados en una salsa cremosa a base de leche de coco, pimentón, cebolla, ajo, tomate y especias', 'Consumir en mesa', 40000, 2, 'public/imagenes_recetas/img2.png'),
(3, 3, 3, 'Bandeja Paisa', 'Plato completo que incluye:\r\n\r\nPorción de frijoles\r\n\r\nPorción de arroz blanco\r\n\r\n120 g de carne molida\r\n\r\n1 chicharrón crocante (aprox. 100–120 g)\r\n\r\n1 huevo frito\r\n\r\n1 tajada de plátano maduro\r\n\r\n1 arepa pequeña\r\n\r\n1 porción de aguacate (¼ unidad)', 'Consumir en mesa', 30000, 1, 'public/imagenes_recetas/img3.png'),
(4, 4, 3, 'Bandeja Paisa', 'Plato completo que incluye:\r\n\r\nPorción de frijoles\r\n\r\nPorción de arroz blanco\r\n\r\n120 g de carne molida\r\n\r\n1 chicharrón crocante (aprox. 100–120 g)\r\n\r\n1 huevo frito\r\n\r\n1 tajada de plátano maduro\r\n\r\n1 arepa pequeña\r\n\r\n1 porción de aguacate (¼ unidad)', 'Consumir en mesa', 30000, 3, 'public/imagenes_recetas/img3.png'),
(5, 4, 1, 'Papas a la Francesa', 'Porción de 300 g de papas cortadas en tiras y fritas en aceite vegetal hasta lograr una textura crocante por fuera y suave por dentro. Sazonadas ligeramente con sal', 'Consumir en mesa', 10000, 2, 'public/imagenes_recetas/img1.png');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `identificacion`, `nombres`, `telefono`, `clave`, `estado`) VALUES
(1, 1010141548, 'Carlos Andres Torres', '3136485659', '3be7ce150089bc6fe9c91feccf65be64ec3f243b00e1a057', 'Activo'),
(2, 31431948, 'Jacob Perez', '3009845612', '3be7ce150089bc6fe9c91feccf65be64ec3f243b00e1a057', 'Activo'),
(3, 1087965456, 'Andres Gomez', '3119654852', '3be7ce150089bc6fe9c91feccf65be64ec3f243b00e1a057', 'Activo');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `fk_usuario`, `fk_cargo`, `estado`) VALUES
(1, 1, 1, 'Activo'),
(2, 2, 2, 'Activo'),
(3, 3, 3, 'Activo');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `historial_estado`
--

INSERT INTO `historial_estado` (`idhistorial_estado`, `fk_pedido`, `fk_estado`, `fk_rol`, `fecha_hora`) VALUES
(2, 1, 1, NULL, '2025-11-21 01:15:03'),
(3, 2, 1, NULL, '2025-11-22 12:39:03'),
(4, 3, 1, NULL, '2025-11-22 12:10:27'),
(5, 4, 1, NULL, '2025-11-23 19:41:32'),
(6, 1, 3, 2, '2025-11-21 01:25:03'),
(7, 2, 3, 3, '2025-11-22 12:44:03'),
(8, 3, 2, NULL, '2025-11-22 12:15:30'),
(9, 4, 3, 3, '2025-11-23 19:46:32'),
(10, 1, 4, 2, '2025-11-21 01:45:03');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `log_acceso`
--

INSERT INTO `log_acceso` (`idlog_acceso`, `fk_usuario`, `fecha_ingreso`, `fecha_cierre`) VALUES
(1, 1, '2025-11-21 07:58:33', '2025-11-21 19:58:33'),
(2, 2, '2025-11-21 10:59:30', '2025-11-21 19:59:30'),
(3, 3, '2025-11-21 10:00:15', '2025-11-20 19:00:15');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

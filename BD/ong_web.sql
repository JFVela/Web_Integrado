-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-12-2023 a las 06:30:30
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
-- Base de datos: `ong_web`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaña`
--

CREATE TABLE `campaña` (
  `id_campaña` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `campaña`
--

INSERT INTO `campaña` (`id_campaña`, `nombre`, `descripcion`) VALUES
(3, 'Campaña Navideña', 'Campaña para aumentar las ventas durante la temporada navideña'),
(4, 'Campaña Verano', 'Campaña para promocionar productos de verano'),
(5, 'Campaña Vuelta al Cole', 'Campaña para la promoción de artículos escolares'),
(6, 'Campaña Black Friday', 'Grandes descuentos en todos los productos para el Black Friday'),
(7, 'Campaña Cyber Monday', 'Descuentos en productos tecnológicos para el Cyber Monday'),
(8, 'Campaña San Valentín', 'Promociones especiales para celebrar el Día de San Valentín'),
(9, 'Campaña Día de la Madre', 'Campaña para homenajear a las madres en su día especial'),
(10, 'Campaña Día del Padre', 'Campaña para celebrar el Día del Padre'),
(12, 'Campaña Aniversario', 'Campaña para celebrar el aniversario de nuestra empresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `numero` int(11) NOT NULL,
  `dueño` varchar(50) NOT NULL,
  `cvc` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `año` int(11) NOT NULL,
  `saldo_actual` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`numero`, `dueño`, `cvc`, `mes`, `año`, `saldo_actual`) VALUES
(123450089, '', 555, 10, 2020, 1200),
(123456789, 'Dueño 1', 123, 12, 2023, 8721.46),
(234567890, 'Dueño 2', 234, 1, 2024, 2000),
(345678901, 'Dueño 3', 345, 2, 2025, 3000),
(456789012, 'Dueño 4', 456, 3, 2026, 4000),
(567890123, 'Dueño 5', 567, 4, 2027, 5000),
(678901234, 'Dueño 6', 678, 5, 2028, 6000),
(789012345, 'Dueño 7', 789, 6, 2029, 7000),
(890123456, 'Dueño 8', 890, 7, 2030, 8000),
(901234567, 'Dueño 9', 901, 8, 2031, 9000),
(1234567890, 'Dueño 10', 123, 9, 2032, 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_depa` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_depa`, `nombre`, `descripcion`) VALUES
(1, 'Recursos Humanos', 'Gestiona la contratación, el desarrollo de emGestiona la contratación, el desarrollo de emGestiona la contratación, el desarrollo de emGestiona la contratación, el desarrollo de emGestiona la contrata'),
(2, 'Finanzas', 'Se encarga de la contabilidad, la planificaci...'),
(3, 'Ventas', 'Responsable de la estrategia de ventas, la adH'),
(4, 'Marketing', 'Lidera las estrategias de marketing, publicid'),
(6, 'Legal', 'Encargado de los asuntos legales de la empres'),
(7, 'Calidad', 'Se enfoca en garantizar la calidad de productos'),
(8, 'Comunicaciones', 'Encargado de las comunicaciones internas y exHHHH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donacion_fisica`
--

CREATE TABLE `donacion_fisica` (
  `id_fisica` int(11) NOT NULL,
  `donantes_dni` int(11) NOT NULL,
  `local_donacion_id_local` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `donacion_fisica`
--

INSERT INTO `donacion_fisica` (`id_fisica`, `donantes_dni`, `local_donacion_id_local`, `descripcion`, `estado`) VALUES
(1, 75792854, 1, 'Un polo', 1),
(2, 73090035, 7, 'Una muñeca infgajwecijawbcnjewcijerwnctyytty', 1),
(3, 73090035, 4, 'wvrwvrvrvervrvevervevvr', 1),
(4, 73090035, 8, 'Una caja de ropa y un paneton', 0),
(6, 73090035, 6, 'Deajare UNA CAJA DE PANETON Y GASEOSA', 1),
(7, 73090030, 6, 'UNA FANTA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donacion_virtual`
--

CREATE TABLE `donacion_virtual` (
  `id_Virtual` int(11) NOT NULL,
  `donantes_dni` int(11) NOT NULL,
  `campaña_id_campaña` int(11) NOT NULL,
  `moneda_id_moneda` int(11) NOT NULL,
  `monto` double NOT NULL,
  `cuenta_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `donacion_virtual`
--

INSERT INTO `donacion_virtual` (`id_Virtual`, `donantes_dni`, `campaña_id_campaña`, `moneda_id_moneda`, `monto`, `cuenta_numero`) VALUES
(1, 73090035, 3, 1, 30, 123456789),
(2, 73090035, 6, 2, 100, 123456789),
(3, 73090035, 5, 2, 1, 123456789),
(4, 73090035, 6, 2, 20, 123456789),
(5, 73090035, 4, 2, 100, 123456789),
(6, 73090035, 8, 1, 3000, 123456789),
(7, 73090035, 4, 1, 50, 123456789),
(8, 73090035, 4, 2, 12.58, 123456789),
(9, 73090035, 7, 2, 100, 123456789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donantes`
--

CREATE TABLE `donantes` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `celular` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `distrito` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `idONG` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `donantes`
--

INSERT INTO `donantes` (`dni`, `nombre`, `paterno`, `materno`, `celular`, `email`, `distrito`, `direccion`, `idONG`) VALUES
(73090030, 'Juan', 'Jose', 'Carkis', 985258555, 'jf_@hotmail.com', 'Ferreñafe', 'mz b1 ly7', 1),
(73090035, 'Juan ', 'Figueroa', 'Vela', 998187600, 'jfvela_2012@hotmail.com', 'Pueblo Nuevo', 'mz b1 lt6 Alfredo Villa', 1),
(73090037, 'Juan', 'González', 'Martínez', 985126511, 'diego.bautistamlp@gmail.com', 'Jequetepeque', 'mz b1 lt6 Alfredo Villa', 1),
(75792854, 'Juan', 'Fi', 'Vela', 924544445, 'jfvela_2012hotmail.com', 'Lima', 'mz b1 lt6 Alfredo Villa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `codigo` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `sueldo` double NOT NULL,
  `id_rol` int(11) NOT NULL,
  `idONG` int(11) NOT NULL DEFAULT 1,
  `id_depa` int(11) NOT NULL,
  `salt` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`codigo`, `dni`, `login`, `contraseña`, `nombre`, `paterno`, `materno`, `telefono`, `correo`, `direccion`, `sueldo`, `id_rol`, `idONG`, `id_depa`, `salt`) VALUES
(15, 73090035, 'JUAN', 'f657330a8ed0df88973b6af52bbc3e18aa77d2c815b64b55b40608f6cac2be81', 'Juan', 'Figueroa', 'Vela', 998187600, 'jfvela_2012@hotmail.com', 'mz b1 lt6 Alfredo Villa', 3500, 1, 1, 7, 0x5862fd1ecc48d654113ab4f23cc8d68e),
(23, 25819837, 'ALEX', 'd21c2aba1bd4570dd9ce2ab2458e1fc89c1e95831eaa84a051b5a0d3395f449e', 'Alex', 'Zurita', 'Toledo', 985555555, 'zurita@hotmail.com', 'mz 25 lt 8', 5000, 2, 1, 3, 0xf278bf085aa6ac7534206115c3e56850),
(24, 85888888, 'DIEGO', 'c3efb631f55e4863236381ebb21c87fefc518176ceb0662d9d8dd556a85511e3', 'Diego', 'Perez', 'Lopez', 988758472, 'diego@hotmail.com', 'mz 26 xl tj', 3500, 3, 1, 4, 0x1b7032ab662a13c80f3592c1596a432d),
(25, 23456789, 'JUANJO', '2b619ef5373e8222670379362be886a7c5d10279877669ac5eb0cf65356de1dc', 'Juan', 'Jose', 'Lopez', 985285288, 'juanJos@hotmail.com', 'mz26 lt 5', 2000, 4, 1, 8, 0x793224ccd0869ee95d50927dfda91a83),
(26, 73090037, 'JUA4', '9e0e24d54ef9bc2f5fe92537aa07e81d92d64fec2eeee22ed3d9f7ee68f586c0', 'Juan', 'Figueroa', 'Lopez', 998187607, 'jfvela_2012@hotail.com', 'mz b1 lt6 Alfredo Villa', 3000, 2, 1, 7, 0xc8f2987a0f3cdad8b50d4731b9a0fe3a),
(28, 73090033, 'dark0', '0fa00574b82bec94d553ed13e89e8987a22345725d25fe1ea2039c9d7f5f4ba4', 'Juan ', 'Perez', 'Martínez', 998187604, 'jfvessa_2012@hotmail.com', 'mz b1 lt6 Alfredo Villa', 5000, 2, 1, 3, 0xd39a67a5f86329bf4e3fd6e932857f98);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enlace`
--

CREATE TABLE `enlace` (
  `id_enlace` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `ruta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `enlace`
--

INSERT INTO `enlace` (`id_enlace`, `descripcion`, `ruta`) VALUES
(1, 'Especialida', 'AdEspecialidades.jsp'),
(2, 'Eventos', 'AdEventos.jsp'),
(3, 'Voluntarios', 'AdVoluntarios.jsp'),
(4, 'Campaña', 'Campania.jsp'),
(5, 'Departamentos', 'Depa.jsp'),
(6, 'Donacion Fisica', 'Donacion_Fisica.jsp'),
(7, 'Donantes', 'Donantes.jsp'),
(8, 'Empleado', 'Empleados.jsp'),
(9, 'Locacion', 'Locacion.jsp'),
(10, 'Roles', 'Roles.jsp'),
(12, 'Moneda', 'Moneda.jsp'),
(13, 'Donant.Virt', 'Donacion_Virtual.jsp'),
(14, 'Enlace-Rol', 'DesignarEnlace.jsp'),
(15, 'Recargar', 'Cuenta.jsp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_Especialidades` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_Especialidades`, `nombre`) VALUES
(2, 'Alimentación'),
(6, 'Deportes'),
(1, 'Educacion'),
(3, 'Emergencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `inicio_inscripcion` date NOT NULL,
  `final_inscripcion` date NOT NULL,
  `inicio` date NOT NULL,
  `finalE` date NOT NULL,
  `detalle` varchar(45) NOT NULL,
  `vacantes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `nombre`, `ubicacion`, `inicio_inscripcion`, `final_inscripcion`, `inicio`, `finalE`, `detalle`, `vacantes`) VALUES
(9, 'Carrera Benéfica', 'Arequipa', '2023-12-01', '2023-12-05', '2024-04-01', '2024-04-30', 'Carrera para recaudar fondos', 10),
(10, 'Feria de Adopción', 'Trujillo', '2023-12-01', '2023-12-05', '2024-06-01', '2024-06-30', 'Feria de adopción de mascotas', 50),
(11, 'Taller de Reciclaje', 'Cusco', '2024-07-01', '2024-07-31', '2024-08-01', '2024-08-31', 'Taller sobre la importancia del reciclaje', 30),
(12, 'Concierto Benéfico', 'Piura', '2023-12-01', '2023-12-05', '2024-10-01', '2024-10-31', 'Concierto para recaudar fondos', 70),
(13, 'Campaña de Reforestación', 'Iquitos', '2024-11-01', '2024-11-30', '2024-12-01', '2024-12-31', 'Plantación de árboles en áreas deforestadas', 100),
(14, 'Donación de Sangre', 'Tacna', '2025-01-01', '2025-01-31', '2025-02-01', '2025-02-28', 'Campaña de donación de sangre', 200),
(15, 'Taller de Primeros Auxilios', 'Ica', '2025-03-01', '2025-03-31', '2025-04-01', '2025-04-30', 'Taller de primeros auxilios básicos', 30),
(16, 'Campaña de Vacunación', 'Chiclayo', '2025-05-01', '2025-05-31', '2025-06-01', '2025-06-30', 'Campaña de vacunación gratuita', 300),
(18, 'Campaña de salud', 'ergaerg', '2023-11-30', '2023-12-03', '2023-12-20', '2023-12-30', 'graergaer', 3),
(19, 'Solidaridad', 'Ventanilla', '2023-12-06', '2023-12-10', '2023-12-14', '2023-12-20', 'Hola', 10),
(21, 'JOSUE', 'HOLA', '2023-12-06', '2023-12-10', '2023-12-15', '2023-12-17', 'HIASNCXIJASNX', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_inscripcion` int(11) NOT NULL,
  `voluntario_dni` int(11) NOT NULL,
  `eventos_id_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id_inscripcion`, `voluntario_dni`, `eventos_id_evento`) VALUES
(9, 73090037, 18),
(10, 25819837, 18),
(11, 85888888, 12),
(12, 73090035, 12),
(13, 85596258, 9),
(14, 73090030, 9),
(15, 73090032, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local_donacion`
--

CREATE TABLE `local_donacion` (
  `id_local` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `local_donacion`
--

INSERT INTO `local_donacion` (`id_local`, `nombre`, `direccion`) VALUES
(1, 'Lima', 'AV. Zurita beibi'),
(3, 'Local Central', 'Av. Principal 123, Lima'),
(4, 'Local Miraflores', 'Calle Comercio 456, Miraflores'),
(5, 'Local San Isidro', 'Av. Libertadores 789, San Isidro'),
(6, 'Local Surco', 'Jirón Los Olivos 321, Surco'),
(7, 'Local La Molina', 'Calle Las Gardenias 654, La Molina'),
(8, 'Local San Borja', 'Av. El Bosque 987, San Borja'),
(9, 'Local Barranco', 'Jirón Los Pinos 135, Barranco'),
(10, 'Local San Miguel', 'Calle Los Ficus 246, San Miguel'),
(11, 'Local Pueblo Libre', 'Av. La Marina 864, Pueblo Libre'),
(12, 'Local Jesús María', 'Jirón Los Laureles 357, Jesús María'),
(14, 'SAN MARRTIN', 'MZ 23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `id_moneda` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id_moneda`, `nombre`, `valor`) VALUES
(1, 'SOLES', 1),
(2, 'DOLAR', 3.7),
(3, 'EURO', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ong`
--

CREATE TABLE `ong` (
  `id_ong` int(11) NOT NULL DEFAULT 1,
  `nombre` varchar(45) NOT NULL,
  `mision` varchar(45) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `año` int(11) NOT NULL,
  `tipo_organización` varchar(45) NOT NULL,
  `financiamiento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ong`
--

INSERT INTO `ong` (`id_ong`, `nombre`, `mision`, `ubicacion`, `año`, `tipo_organización`, `financiamiento`) VALUES
(1, 'LOLO', 'HH', 'HH', 2015, 'GRANDE', 'SSS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`) VALUES
(1, 'Admin', 'Un administrador es responsable de gestionar los recursos y las actividades que realiza una organización para garantizar su buen funcionamiento y desempeño...'),
(2, 'Secretarios', 'El secretario de una ONG tiene varias responsabilidades. Estas incluyen dirigir los trabajos puramente administrativos de la Asociación, expedir certificaciones...'),
(3, 'Empleados', ' Los empleados en una ONG son esenciales para que la organización pueda cumplir de forma efectiva con su misión. '),
(4, 'Oficinista', 'Un oficinista en una ONG lleva un control del archivo, ya sea en carpetas virtuales o en el denominado físico en archivos o estantes donde se ordenan, clasifican y ...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_has_enlace`
--

CREATE TABLE `roles_has_enlace` (
  `roles_id_rol` int(11) NOT NULL,
  `enlace_id_enlace` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles_has_enlace`
--

INSERT INTO `roles_has_enlace` (`roles_id_rol`, `enlace_id_enlace`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(1, 13),
(1, 14),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 15),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 12),
(4, 2),
(4, 4),
(4, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntario`
--

CREATE TABLE `voluntario` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `distrito` varchar(45) NOT NULL,
  `idONG` int(11) NOT NULL DEFAULT 1,
  `id_Especialidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `voluntario`
--

INSERT INTO `voluntario` (`dni`, `nombre`, `paterno`, `materno`, `correo`, `telefono`, `ciudad`, `provincia`, `distrito`, `idONG`, `id_Especialidades`) VALUES
(25819837, 'María', 'González', 'Lopez', 'jf_@hotmail.com', 998187677, 'Lima', 'Huaral', 'San Miguel De Acos', 1, 2),
(73090030, 'Jose', 'Figueroa', 'Vela', 'jfdela_2012@hotmail.com', 998187603, 'Lima', 'Huaral', 'Aucallama', 1, 2),
(73090032, 'Juan', 'Jose', 'Carlos', 'jssela_2012@hotmail.com', 988187600, 'Lima', 'Canta', 'Canta', 1, 1),
(73090035, 'Alex', 'Marin', 'Montex', 'leon@gmail.com', 998187600, 'Lima', 'Callao', 'Callao', 1, 2),
(73090037, 'Juan ', 'Figueroa', 'Vela', 'jfvela_2012@hotmail.com', 998187608, 'Moquegua', 'General Sánchez Cerro', 'Omate', 1, 1),
(85596258, 'Diego', 'Bautista', 'Lopez', 'U21209622@utp.edu.pe', 998187607, 'Lima', 'Cajatambo', 'Gorgor', 1, 3),
(85888888, 'María', 'Perez', 'Martínez', 'iji@hotmail.com', 998187609, 'Lima', 'Cañete', 'Pacaran', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campaña`
--
ALTER TABLE `campaña`
  ADD PRIMARY KEY (`id_campaña`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`numero`),
  ADD UNIQUE KEY `numero_UNIQUE` (`numero`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_depa`);

--
-- Indices de la tabla `donacion_fisica`
--
ALTER TABLE `donacion_fisica`
  ADD PRIMARY KEY (`id_fisica`),
  ADD KEY `fk_donacion_fisica_donantes1_idx` (`donantes_dni`),
  ADD KEY `fk_donacion_fisica_local_donacion1_idx` (`local_donacion_id_local`);

--
-- Indices de la tabla `donacion_virtual`
--
ALTER TABLE `donacion_virtual`
  ADD PRIMARY KEY (`id_Virtual`),
  ADD KEY `fk_donacion_virtual_cuenta1_idx` (`cuenta_numero`),
  ADD KEY `fk_donacion_virtual_moneda1_idx` (`moneda_id_moneda`),
  ADD KEY `fk_donacion_virtual_donantes1_idx` (`donantes_dni`),
  ADD KEY `fk_donacion_virtual_campaña1_idx` (`campaña_id_campaña`);

--
-- Indices de la tabla `donantes`
--
ALTER TABLE `donantes`
  ADD PRIMARY KEY (`dni`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`),
  ADD UNIQUE KEY `celular_UNIQUE` (`celular`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_Donantes_Empresa_ONG1_idx` (`idONG`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`),
  ADD UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD KEY `fk_empleados_roles1_idx` (`id_rol`),
  ADD KEY `fk_empleados_ong1_idx` (`idONG`),
  ADD KEY `fk_empleados_departamento1_idx` (`id_depa`);

--
-- Indices de la tabla `enlace`
--
ALTER TABLE `enlace`
  ADD PRIMARY KEY (`id_enlace`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_Especialidades`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `fk_inscripcion_voluntario1_idx` (`voluntario_dni`),
  ADD KEY `fk_inscripcion_eventos1_idx` (`eventos_id_evento`);

--
-- Indices de la tabla `local_donacion`
--
ALTER TABLE `local_donacion`
  ADD PRIMARY KEY (`id_local`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `ong`
--
ALTER TABLE `ong`
  ADD PRIMARY KEY (`id_ong`),
  ADD UNIQUE KEY `idEmpresa_ONG_UNIQUE` (`id_ong`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `roles_has_enlace`
--
ALTER TABLE `roles_has_enlace`
  ADD PRIMARY KEY (`roles_id_rol`,`enlace_id_enlace`),
  ADD KEY `fk_roles_has_enlace_enlace1_idx` (`enlace_id_enlace`),
  ADD KEY `fk_roles_has_enlace_roles1_idx` (`roles_id_rol`);

--
-- Indices de la tabla `voluntario`
--
ALTER TABLE `voluntario`
  ADD PRIMARY KEY (`dni`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`),
  ADD UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  ADD KEY `fk_Voluntario_Empresa_ONG1_idx` (`idONG`),
  ADD KEY `fk_Voluntario_Especialidades1_idx` (`id_Especialidades`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campaña`
--
ALTER TABLE `campaña`
  MODIFY `id_campaña` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_depa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `donacion_fisica`
--
ALTER TABLE `donacion_fisica`
  MODIFY `id_fisica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `donacion_virtual`
--
ALTER TABLE `donacion_virtual`
  MODIFY `id_Virtual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `enlace`
--
ALTER TABLE `enlace`
  MODIFY `id_enlace` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_Especialidades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `local_donacion`
--
ALTER TABLE `local_donacion`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `donacion_fisica`
--
ALTER TABLE `donacion_fisica`
  ADD CONSTRAINT `fk_donacion_fisica_donantes1` FOREIGN KEY (`donantes_dni`) REFERENCES `donantes` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_donacion_fisica_local_donacion1` FOREIGN KEY (`local_donacion_id_local`) REFERENCES `local_donacion` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `donacion_virtual`
--
ALTER TABLE `donacion_virtual`
  ADD CONSTRAINT `fk_donacion_virtual_campaña1` FOREIGN KEY (`campaña_id_campaña`) REFERENCES `campaña` (`id_campaña`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_donacion_virtual_cuenta1` FOREIGN KEY (`cuenta_numero`) REFERENCES `cuenta` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_donacion_virtual_donantes1` FOREIGN KEY (`donantes_dni`) REFERENCES `donantes` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_donacion_virtual_moneda1` FOREIGN KEY (`moneda_id_moneda`) REFERENCES `moneda` (`id_moneda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `donantes`
--
ALTER TABLE `donantes`
  ADD CONSTRAINT `fk_Donantes_Empresa_ONG1` FOREIGN KEY (`idONG`) REFERENCES `ong` (`id_ONG`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_departamento1` FOREIGN KEY (`id_depa`) REFERENCES `departamento` (`id_depa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_ong1` FOREIGN KEY (`idONG`) REFERENCES `ong` (`id_ONG`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_roles1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_inscripcion_eventos1` FOREIGN KEY (`eventos_id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscripcion_voluntario1` FOREIGN KEY (`voluntario_dni`) REFERENCES `voluntario` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `roles_has_enlace`
--
ALTER TABLE `roles_has_enlace`
  ADD CONSTRAINT `fk_roles_has_enlace_enlace1` FOREIGN KEY (`enlace_id_enlace`) REFERENCES `enlace` (`id_enlace`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_roles_has_enlace_roles1` FOREIGN KEY (`roles_id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `voluntario`
--
ALTER TABLE `voluntario`
  ADD CONSTRAINT `fk_Voluntario_Empresa_ONG1` FOREIGN KEY (`idONG`) REFERENCES `ong` (`id_ONG`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Voluntario_Especialidades1` FOREIGN KEY (`id_Especialidades`) REFERENCES `especialidades` (`id_Especialidades`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

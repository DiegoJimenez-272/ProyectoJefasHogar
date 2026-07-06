-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2026 a las 06:47:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_emprendedora`
--

CREATE TABLE `app_emprendedora` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `rubro` varchar(100) NOT NULL,
  `territorio` varchar(100) NOT NULL,
  `historia` longtext NOT NULL,
  `imagen_perfil` varchar(100) DEFAULT NULL,
  `fecha_registro` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `app_emprendedora`
--

INSERT INTO `app_emprendedora` (`id`, `nombre`, `rubro`, `territorio`, `historia`, `imagen_perfil`, `fecha_registro`) VALUES
(1, 'María Gladys Troncoso', 'Textilería y Lanas', 'Los Ángeles', 'María heredó el arte del telar de su abuela. Trabaja con lana de oveja natural que ella misma limpia, carda, tiñe con hojas y raíces locales, y teje en telares de madera fabricados por su esposo. Sus mantas y chalecos son reconocidos en toda la provincia.', NULL, '2026-06-23 03:53:26.421826'),
(2, 'Carmen Gloria Muñoz', 'Orfebrería en Cobre', 'Nacimiento', 'Carmen trabaja metales desde hace 15 años. Su especialidad es el cobre batido y la plata envejecida, creando finas joyas inspiradas en los petroglifos y leyendas de la zona del Biobío.', NULL, '2026-06-23 03:53:26.425369'),
(3, 'Silvia Patricia Riquelme', 'Alfarería y Cerámica', 'Cabrero', 'Silvia moldea la greda con gran destreza. Su taller es un santuario donde la arcilla se transforma en piezas utilitarias decorativas para cocinas y comedores campesinos.', NULL, '2026-06-23 03:53:26.429782'),
(4, 'Patricia Alejandra Valenzuela', 'Papelería y Encuadernación', 'Negrete', 'Patricia ama los libros y el reciclaje. En su taller en Negrete produce cuadernos hechos a mano con cubiertas de tela recuperada y hojas de papel de fibras vegetales de la zona.', NULL, '2026-06-23 03:53:26.433966'),
(5, 'Juana Edith Soto', 'Manualidades en Madera', 'Santa Bárbara', 'Juana utiliza trozos de maderas nativas caídas (como roble y coihue) para tallar elementos utilitarios que destacan por la belleza natural de la veta del árbol.', NULL, '2026-06-23 03:53:26.438436'),
(6, 'Gabriela Paz Espinoza', 'Cestería en Mimbre', 'Mulchén', 'Gabriela es una cestera experimentada. Confecciona canastos y lámparas con mimbre cultivado a orillas del río en Mulchén, rescatando una tradición de trenzado manual.', NULL, '2026-06-23 03:53:26.441404'),
(7, 'Isabel Margarita Fuentes', 'Tejidos a Crochet', 'Laja', 'Isabel domina el crochet y la técnica de amigurumis. Crea juguetes infantiles y prendas de vestir ligeras con hilos de algodón hipoalergénicos de alta calidad.', NULL, '2026-06-23 03:53:26.444442'),
(8, 'Marta Inés Henríquez', 'Conservas y Mermeladas', 'Yumbel', 'Marta recolecta frutas frescas de las huertas familiares de Yumbel. Elabora mermeladas y almíbares tradicionales sin aditivos químicos, siguiendo recetas centenarias.', NULL, '2026-06-23 03:53:26.447980'),
(9, 'Elena Del Carmen Paredes', 'Bordados a Mano', 'San Rosendo', 'Elena retrata la fauna nativa y los paisajes históricos del Biobío en lienzos de lino usando hilos de colores vibrantes. Sus trabajos combinan arte e historia local.', NULL, '2026-06-23 03:53:26.451613'),
(10, 'Lucía Ayelén Alarcón', 'Artesanía Pehuenche', 'Alto Bio-Bio', 'Lucía vive en la cordillera y preserva viva la textilería tradicional de su cultura. Hila lana de cordero y teje en witral (telar mapuche) hermosas alfombras y ponchos.', NULL, '2026-06-23 03:53:26.454898'),
(11, 'Rosa Elena Inostroza', 'Tallado en Piedra', 'Antuco', 'Rosa talla piedras volcánicas extraídas del entorno del volcán Antuco. Fabrica morteros y fuentes decorativas que duran toda la vida y son muy apreciados por cocineros.', NULL, '2026-06-23 03:53:26.458296'),
(12, 'Verónica Patricia Salazar', 'Tejidos a Telar', 'Tucapel', 'Verónica produce pieceras y cojines decorativos combinando lanas de diferentes texturas. Sus diseños unen la calidez del campo con el diseño de interiores moderno.', '', '2026-06-23 03:53:26.462026');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_noticia`
--

CREATE TABLE `app_noticia` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `contenido` longtext NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fecha_publicacion` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `app_noticia`
--

INSERT INTO `app_noticia` (`id`, `titulo`, `contenido`, `imagen`, `fecha_publicacion`) VALUES
(1, 'Gran Encuentro Regional de Artesanas en Biobío', 'Este fin de semana se reunirán más de 50 emprendedoras en la Plaza Independencia para exhibir sus creaciones únicas de textilería, cerámica y orfebrería. Es una oportunidad excelente para conocer de cerca las técnicas y saberes tradicionales de las jefas de hogar de nuestra región.', NULL, '2026-06-23 03:53:26.415335'),
(2, 'Taller Exitoso de Comercialización y Ventas', 'Con la participación de artesanas de Cabrero y Negrete, se llevó a cabo el taller de comercialización justa en las dependencias de la red. Las participantes compartieron experiencias y aprendieron sobre fijación de precios, canales de distribución y estrategias de venta colaborativa.', NULL, '2026-06-23 03:53:26.416508'),
(3, 'Nuevas Alianzas para Exportar Artesanía Local', 'La Red Colaborativa ha concretado un importante acuerdo con organizaciones de comercio justo internacionales. Este convenio abrirá canales comerciales en el extranjero para las piezas de textilería y orfebrería fina creadas por nuestras artesanas de la provincia de Biobío.', NULL, '2026-06-23 03:53:26.417617'),
(4, 'Capacitación en Fotografía de Productos', 'Un grupo de 15 emprendedoras participó en la jornada de capacitación sobre registro fotográfico digital. Durante el taller práctico, aprendieron a utilizar luces naturales, fondos limpios y edición básica en smartphones para que sus productos luccan increíbles en redes sociales.', NULL, '2026-06-23 03:53:26.418688'),
(5, 'Inauguración de la Tienda Colectiva Talento de Mujer', 'Abrimos las puertas de nuestra primera tienda física colaborativa. En ella podrás encontrar una selección exclusiva de productos elaborados por artesanas de toda la región del Biobío. Ven a visitarnos y apoya directamente el sustento de las jefas de hogar de nuestra red.', NULL, '2026-06-23 03:53:26.419538'),
(6, 'Rescate del Telar Mapuche en Alto Biobío', 'Se inició un ciclo de talleres de rescate textil pehuenche enfocado en jóvenes de la comuna. Lucía Alarcón, destacada tejedora de la red, compartirá sus conocimientos sobre el teñido natural de lanas y el uso del telar vertical tradicional durante los próximos dos meses.', NULL, '2026-06-23 03:53:26.420460');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_proceso`
--

CREATE TABLE `app_proceso` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` longtext NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `emprendedora_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `app_proceso`
--

INSERT INTO `app_proceso` (`id`, `titulo`, `descripcion`, `imagen`, `emprendedora_id`) VALUES
(1, 'Hilado y Teñido Natural de la Lana', 'El proceso comienza con el lavado de la lana cruda, luego el escarmenado e hilado en rueca. Posteriormente, se tiñe usando cortezas de árboles y hierbas silvestres en grandes ollas de cobre.', NULL, 1),
(2, 'Fundición y Repujado de Metales', 'Carmen utiliza soplete para recocer el cobre, dándole maleabilidad para batirlo y grabarlo a mano con cinceles de precisión.', NULL, 2),
(3, 'Moldeado a Mano y Cocción en Horno de Barro', 'La greda se amasa pacientemente para eliminar burbujas de aire, se tornea o moldea a mano, y finalmente se cuece en horno de leña a más de 800 grados.', NULL, 3),
(4, 'Costura de Lomo Expuesta y Prensado', 'Las hojas se pliegan y perforan individualmente. Luego se cosen usando hilos encerados gruesos de alta resistencia y se prensan por 24 horas.', NULL, 4),
(5, 'Tallado y Sellado con Cera de Abeja Natural', 'La madera se corta en bloques, se esboza el diseño y se desbasta con gubias. Finalmente se pule a mano y se sella con cera de abejas local.', NULL, 5),
(6, 'Pelado, Remojo y Trenzado del Mimbre', 'Las varas de mimbre se hierven y pelan a mano, luego se remojan en agua para darles flexibilidad máxima antes de comenzar el intrincado proceso de trenzado.', NULL, 6),
(7, 'Diseño y Unión de Piezas con Crochet', 'Tejido circular de partes individuales que luego se cosen a mano firmemente para dar forma y firmeza a los diseños tridimensionales.', NULL, 7),
(8, 'Esterilización y Envasado al Vacío', 'La fruta se cocina a fuego lento con azúcar. El envasado se hace en caliente en frascos de vidrio esterilizados, sellándose al vacío para su conservación duradera.', NULL, 8),
(9, 'Puntadas Artísticas en Hilo Mouliné', 'Dibujo previo sobre tela, seguido de decenas de horas de puntadas minuciosas combinando punto satín, nudo francés y punto tallo.', NULL, 9),
(10, 'Hilado en Huso y Tejido en Witral', 'Uso de huso manual pehuenche para torcer la lana y urdido en witral para entrelazar las tramas creando los símbolos tradicionales.', NULL, 10),
(11, 'Corte, Cincelado y Pulido de Piedra', 'Búsqueda y recolección de piedras, corte inicial y cincelado fuerte para modelar la forma. Finaliza con esmerilado y lijas al agua para pulir el interior.', NULL, 11),
(12, 'Montaje de Urdimbre y Trama con Relieve', 'Cálculo y enhebrado de hilos guías en telar María, seguido del tejido manual agregando lanas desfibradas para generar texturas tridimensionales.', '', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_producto`
--

CREATE TABLE `app_producto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `emprendedora_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `app_producto`
--

INSERT INTO `app_producto` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `emprendedora_id`) VALUES
(1, 'Manta de Telar Rústica', 'Manta tejida a mano con lana de oveja 100% natural, teñida con tintes vegetales locales.', 45000.00, '', 1),
(2, 'Chaleco Lana de Oveja', 'Chaleco grueso tejido a palillo con lana hilada a mano, diseño tradicional con trenzas.', 35000.00, '', 1),
(3, 'Aros de Cobre Repujados', 'Hermosos aros en cobre puro con grabados geométricos de acento tradicional.', 12000.00, '', 2),
(4, 'Collar Cobre y Piedra Lapislázuli', 'Gargantilla ajustable de cobre oxidado artesanalmente con incrustación de piedra lapislázuli chilena.', 18000.00, '', 2),
(5, 'Olla de Greda Reforzada', 'Olla de arcilla roja ideal para cocinar sobre fuego directo o en hornos de barro.', 15000.00, '', 3),
(6, 'Jarra de Cerámica Esmaltada', 'Jarra para agua o vino con esmaltado rústico apto para alimentos.', 10000.00, '', 3),
(7, 'Bitácora de Viaje en Cuero Ecológico', 'Cuaderno de hojas lisas con costura expuesta tipo copta y solapa de cuero ecológico.', 15000.00, '', 4),
(8, 'Libreta Universitaria en Tela', 'Libreta de notas con cubiertas forradas en tela floreada y papel ahuesado reciclado.', 8500.00, '', 4),
(9, 'Tabla para Picar de Roble Nativo', 'Tabla gruesa y resistente sellada con cera de abejas y aceites minerales.', 20000.00, '', 5),
(10, 'Cucharas de Madera Talladas', 'Set de 3 cucharas de diferentes tamaños talladas a mano en madera de coihue.', 12000.00, '', 5),
(11, 'Canasto de Mimbre Grande', 'Canasto trenzado reforzado con asas ideal para la ropa o leña.', 25000.00, '', 6),
(12, 'Lámpara Colgante de Mimbre', 'Pantalla de lámpara tejida a mano que genera hermosos patrones de luz.', 30000.00, '', 6),
(13, 'Juguete Amigurumi Osito', 'Oso de peluche tejido a mano con ojos de seguridad y relleno hipoalergénico.', 10000.00, '', 7),
(14, 'Mantilla de Bebé a Crochet', 'Manta delicada para cuna tejida con hilado suave especial para recién nacidos.', 18000.00, '', 7),
(15, 'Mermelada Casera de Frutilla y Maqui', 'Mermelada artesanal con frutos silvestres ricos en antioxidantes.', 4000.00, '', 8),
(16, 'Frasco de Duraznos en Almíbar', 'Duraznos conserveros seleccionados embotellados en almíbar casero liviano.', 5000.00, '', 8),
(17, 'Cuadro Bordado Picaflor', 'Ilustración textil bordada en bastidor de madera de 20cm lista para colgar.', 15000.00, '', 9),
(18, 'Funda de Cojín Bordada', 'Funda de lino para cojín decorativo con motivos de flores silvestres.', 12000.00, '', 9),
(19, 'Trarihue Tradicional Pehuenche', 'Faja ornamental tejida a mano con iconografía ancestral que representa a la naturaleza.', 20000.00, '', 10),
(20, 'Alfombra Witral Pequeña', 'Tapiz rústico para piso o muro tejido en telar vertical tradicional.', 35000.00, '', 10),
(21, 'Mortero de Piedra Volcánica', 'Chancho de piedra ideal para moler aliños, ajo y preparar pebre.', 25000.00, '', 11),
(22, 'Fuente de Piedra Decorativa', 'Plato rústico tallado en piedra de río suave ideal para presentación de bocados.', 15000.00, '', 11),
(23, 'Piecera de Cuna o Cama', 'Piecera tejida en telar de mesa con relieves de lana bouclé suave.', 28000.00, '', 12),
(24, 'Funda de Cojín Telar Plumas', 'Funda tejida en telar María con flecos decorativos estilo bohemio.', 15000.00, '', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_zona`
--

CREATE TABLE `app_zona` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad_emprendedoras` int(11) NOT NULL,
  `descripcion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `app_zona`
--

INSERT INTO `app_zona` (`id`, `nombre`, `cantidad_emprendedoras`, `descripcion`) VALUES
(11, 'Negrete', 0, ''),
(12, 'Santa Bárbara', 0, ''),
(13, 'Mulchén', 0, ''),
(14, 'Quilaco', 0, ''),
(15, 'Antuco', 0, ''),
(16, 'Tucapel', 0, ''),
(17, 'Quilleco', 0, ''),
(18, 'Alto Bio-Bio', 0, ''),
(19, 'San Rosendo', 0, ''),
(20, 'Los Ángeles', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add producto', 7, 'add_producto'),
(26, 'Can change producto', 7, 'change_producto'),
(27, 'Can delete producto', 7, 'delete_producto'),
(28, 'Can view producto', 7, 'view_producto'),
(29, 'Can add emprendedora', 8, 'add_emprendedora'),
(30, 'Can change emprendedora', 8, 'change_emprendedora'),
(31, 'Can delete emprendedora', 8, 'delete_emprendedora'),
(32, 'Can view emprendedora', 8, 'view_emprendedora'),
(33, 'Can add proceso', 9, 'add_proceso'),
(34, 'Can change proceso', 9, 'change_proceso'),
(35, 'Can delete proceso', 9, 'delete_proceso'),
(36, 'Can view proceso', 9, 'view_proceso'),
(37, 'Can add zona', 10, 'add_zona'),
(38, 'Can change zona', 10, 'change_zona'),
(39, 'Can delete zona', 10, 'delete_zona'),
(40, 'Can view zona', 10, 'view_zona'),
(41, 'Can add noticia', 11, 'add_noticia'),
(42, 'Can change noticia', 11, 'change_noticia'),
(43, 'Can delete noticia', 11, 'delete_noticia'),
(44, 'Can view noticia', 11, 'view_noticia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$4IIMKiz0hIlZsxIYiFGmmR$9loLcEPiEtQxMapOuIriZ8hVXvncH/zgn0ThBHXAfCQ=', '2026-06-21 05:47:16.819089', 1, 'admin', '', '', 'admin@talento.cl', 1, 1, '2026-06-21 05:45:13.263194');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'App', 'emprendedora'),
(11, 'App', 'noticia'),
(9, 'App', 'proceso'),
(7, 'App', 'producto'),
(10, 'App', 'zona'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-05-22 02:54:31.022395'),
(2, 'auth', '0001_initial', '2026-05-22 02:54:31.196245'),
(3, 'admin', '0001_initial', '2026-05-22 02:54:31.232725'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-05-22 02:54:31.236986'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-05-22 02:54:31.241497'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-05-22 02:54:31.265599'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-05-22 02:54:31.282542'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-05-22 02:54:31.290487'),
(9, 'auth', '0004_alter_user_username_opts', '2026-05-22 02:54:31.295272'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-05-22 02:54:31.311951'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-05-22 02:54:31.313538'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-05-22 02:54:31.321529'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-05-22 02:54:31.331563'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-05-22 02:54:31.338744'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-05-22 02:54:31.347047'),
(16, 'auth', '0011_update_proxy_permissions', '2026-05-22 02:54:31.352249'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-05-22 02:54:31.360835'),
(18, 'sessions', '0001_initial', '2026-05-22 02:54:31.372347'),
(19, 'App', '0001_initial', '2026-05-24 00:01:39.939791'),
(20, 'App', '0002_emprendedora', '2026-05-25 01:59:58.050596'),
(21, 'App', '0003_producto_emprendedora_proceso', '2026-05-25 02:38:45.357599'),
(22, 'App', '0004_zona', '2026-05-27 03:51:22.946121'),
(24, 'App', '0005_noticia', '2026-06-21 01:34:36.401135');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ygppzn89mit0n1kp335q4l5xlfpuefzb', '.eJxVjMsOwiAURP-FtSE8L-DSfb-B8LhI1UBS2pXx322TLnQ5c87Mm_iwrdVvAxc_Z3IlnFx-uxjSE9sB8iO0e6ept3WZIz0UetJBp57xdTvdv4MaRt3XDp2zqYDkLEoJxaHWmSllWVQCtNBKG46wJwam8BwAtGJGuCSSZQXJ5wuzWTaP:1wbB1Y:tfi8J89ba3hHlvzi9v3A_hC4oaT5DkdhIm_7m_rzTnw', '2026-07-05 05:47:16.821904');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_emprendedora`
--
ALTER TABLE `app_emprendedora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_noticia`
--
ALTER TABLE `app_noticia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_proceso`
--
ALTER TABLE `app_proceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_proceso_emprendedora_id_1eb3a752_fk_App_emprendedora_id` (`emprendedora_id`);

--
-- Indices de la tabla `app_producto`
--
ALTER TABLE `app_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_producto_emprendedora_id_3f3dcb0b_fk_App_emprendedora_id` (`emprendedora_id`);

--
-- Indices de la tabla `app_zona`
--
ALTER TABLE `app_zona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_emprendedora`
--
ALTER TABLE `app_emprendedora`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `app_noticia`
--
ALTER TABLE `app_noticia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `app_proceso`
--
ALTER TABLE `app_proceso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `app_producto`
--
ALTER TABLE `app_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `app_zona`
--
ALTER TABLE `app_zona`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `app_proceso`
--
ALTER TABLE `app_proceso`
  ADD CONSTRAINT `App_proceso_emprendedora_id_1eb3a752_fk_App_emprendedora_id` FOREIGN KEY (`emprendedora_id`) REFERENCES `app_emprendedora` (`id`);

--
-- Filtros para la tabla `app_producto`
--
ALTER TABLE `app_producto`
  ADD CONSTRAINT `App_producto_emprendedora_id_3f3dcb0b_fk_App_emprendedora_id` FOREIGN KEY (`emprendedora_id`) REFERENCES `app_emprendedora` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

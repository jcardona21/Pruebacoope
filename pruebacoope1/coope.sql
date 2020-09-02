-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-09-2020 a las 00:19:54
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coope`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociado`
--

CREATE TABLE `asociado` (
  `id_asociado` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `DPI_Asociado` int(13) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Telefono` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `No_Cuenta` varchar(50) NOT NULL,
  `Tipo_Asociado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asociado`
--

INSERT INTO `asociado` (`id_asociado`, `name`, `DPI_Asociado`, `Direccion`, `Correo`, `Telefono`, `id_producto`, `No_Cuenta`, `Tipo_Asociado`) VALUES
(1, 'Repuestos', 0, '', '', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `total` varchar(100) DEFAULT NULL,
  `id` int(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`total`, `id`, `name`) VALUES
(NULL, NULL, 'AHORROS'),
(NULL, NULL, 'PRESTAMOS'),
(NULL, NULL, 'SEGUROS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `Id_producto` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) UNSIGNED DEFAULT NULL,
  `id_tran` int(11) DEFAULT 0,
  `date` datetime NOT NULL,
  `buy_price` varchar(20) DEFAULT NULL,
  `media_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `Id_producto`, `sale_price`, `categorie_id`, `id_tran`, `date`, `buy_price`, `media_id`) VALUES
(7, 'CORRIENTE', NULL, NULL, '0.00', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(8, 'AGRICULTURA', NULL, NULL, '0.00', NULL, 0, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `id_trans` int(11) UNSIGNED NOT NULL,
  `fecha_contacto` date NOT NULL,
  `fecha_adq_prod` date NOT NULL,
  `Id_asociado` int(10) NOT NULL,
  `Id_user` int(10) NOT NULL,
  `Acuerdo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`id_trans`, `fecha_contacto`, `fecha_adq_prod`, `Id_asociado`, `Id_user`, `Acuerdo`) VALUES
(1, '0000-00-00', '0000-00-00', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `id_Rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`, `id_Rol`) VALUES
(1, 'gycurso01-admin', 'Admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'pzg9wa7o1.jpg', 1, '0000-00-00 00:00:00', 0),
(2, 'Special User', 'special', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'no_image.jpg', 1, '2017-06-16 07:11:26', 0),
(3, 'Default User', 'user', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.jpg', 1, '2017-06-16 07:11:03', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_rol`
--

CREATE TABLE `user_rol` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_rol`
--

INSERT INTO `user_rol` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Gycurso01', 1, 1),
(2, 'Gycurso02', 2, 1),
(3, 'Gycurso03', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asociado`
--
ALTER TABLE `asociado`
  ADD PRIMARY KEY (`id_asociado`,`id_producto`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `media_id` (`id_tran`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`id_trans`,`Id_asociado`,`Id_user`),
  ADD KEY `id` (`id_trans`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`id_Rol`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_level` (`user_level`);

--
-- Indices de la tabla `user_rol`
--
ALTER TABLE `user_rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asociado`
--
ALTER TABLE `asociado`
  MODIFY `id_asociado` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id_trans` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `user_rol`
--
ALTER TABLE `user_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `asociado` (`id_asociado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_rol` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

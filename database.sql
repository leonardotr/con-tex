-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2021 a las 05:07:52
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `contex`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_cargo` (IN `descripcion` VARCHAR(50), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO cargo(descripcion
					 ,estado
					 ,fecha_creacion
					 ,fecha_modificacion
					 ,id_usuario_creacion
					 ,id_usuario_modificacion
					 )
	VALUES (descripcion
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_categoria` (IN `descripcion` VARCHAR(50), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO categoria(descripcion
						 ,estado
						 ,fecha_creacion
						 ,fecha_modificacion
						 ,id_usuario_creacion
						 ,id_usuario_modificacion
						 )
   VALUES (descripcion
   			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_cliente` (IN `idPersona` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO persona(id_persona
						,estado
						,fecha_creacion
						,fecha_modificacion
						,id_usuario_creacion
						,id_usuario_modificacion
						) 
	VALUES (idPersona
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_detalle_orden` (IN `valorInventario` DOUBLE, IN `valorVenta` DOUBLE, IN `cantidad` INT(11), IN `idOrden` INT(11), IN `idProducto` INT(11), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO detalle_orden(valor_inventario
							 ,valor_venta
							 ,cantidad
							 ,id_orden
							 ,id_producto
							 ,fecha_creacion
							 ,fecha_modificacion
							 ,id_usuario_creacion
							 ,id_usuario_modificacion
							 ) 
	VALUES (valorInventario
			,valorVenta
			,cantidad
			,idOrden
			,idProducto
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_empleado` (IN `idCargo` INT(11), IN `correoInstitucional` VARCHAR(50), IN `fechaIngreso` DATE, IN `arl` VARCHAR(20), IN `salud` VARCHAR(20), IN `pension` VARCHAR(20), IN `idPersona` INT(11), IN `sueldoBasico` DOUBLE, IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO empleado(id_cargo
						,correo_institucional
						,fecha_ingreso
						,arl
						,salud
						,pension
						,id_persona
						,sueldo_basico
						,estado
						,fecha_creacion
						,fecha_modificacion
						,id_usuario_creacion
						,id_usuario_modificacion
						)
	VALUES(idCargo
			,correoInstitucional
			,fechaIngreso
			,arl
			,salud
			,pension
			,idPersona
			,sueldoBasico
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_formulario` (IN `descripcion` VARCHAR(50), IN `etiqueta` VARCHAR(30), IN `ubicacion` VARCHAR(100), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO formulario(descripcion
							,etiqueta
							,ubicacion
							,estado
							,fecha_creacion
							,fecha_modificacion
							,id_usuario_creacion
							,id_usuario_modificacion
							) 
	VALUES (descripcion
			,etiqueta
			,ubicacion
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_formulario_rol` (IN `idRol` INT(11), IN `idFormulario` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO formulario_rol(id_rol
								,id_formulario
								,estado
								,fecha_creacion
								,fecha_modificacion
								,id_usuario_creacion
								,id_usuario_modificacion
								) 
	VALUES (idRol
			,idFormulario
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_generar_pago` (IN `valorPago` DOUBLE, IN `deduccion` DOUBLE, IN `fechaInicio` DATETIME, IN `fechaFin` DATETIME, IN `idEmpleado` INT(11), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO generar_pago(valor_pago
							,deduccion
							,fecha_inicio
							,fecha_fin
							,id_empleado
							,fecha_creacion
							,fecha_modificacion
							,id_usuario_creacion
							,id_usuario_modificacion
							) 
	VALUES (valorPago
			,deduccion
			,fechaInicio
			,fechaFin
			,idEmpleado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_orden` (IN `fechaOrden` DATETIME, IN `fechaEntrega` DATETIME, IN `descripcion` VARCHAR(50), IN `idCliente` INT(11), IN `idEmpleado` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO orden(fecha_orden
					 ,fecha_entrega
					 ,descripcion
					 ,id_cliente
					 ,id_empleado
					 ,estado
					 ,fecha_creacion
					 ,fecha_modificacion
					 ,id_usuario_creacion
					 ,id_usuario_modificacion
					 ) 
	VALUES (fechaOrden
		   ,fechaEntrega
		   ,descripcion
		   ,idCliente
		   ,idEmpleado
		   ,estado
		   ,NOW()
		   ,NOW()
		   ,idUsuarioCreacion
		   ,idUsuarioModificacion
           );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_pago_dia` (IN `idEmpleado` INT(11), IN `pagoDia` DOUBLE, IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO pago_dia(id_empleado
						,pago_dia
						,fecha_creacion
						,fecha_modificacion
						,id_usuario_creacion
						,id_usuario_modificacion
						) 
	VALUES (idEmpleado
			,pagoDia
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_persona` (IN `nombre` VARCHAR(100), IN `apellido` VARCHAR(100), IN `documento` INT(11), IN `edad` INT(11), IN `genero` ENUM('M','F'), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
INSERT INTO persona(nombre
					,apellido
					,documento
					,edad
					,genero
					,estado
					,fecha_creacion
					,fecha_modificacion
					,id_usuario_creacion
					,id_usuario_modificacion
					) 
VALUES (nombre
		,apellido
		,documento
		,edad
		,genero
		,estado
		,NOW()
		,NOW()
		,idUsuarioCreacion
		,idUsuarioModificacion
		);	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_producto` (IN `descripcion` VARCHAR(50), IN `talla` INT(11), IN `estado` ENUM('0','1'), IN `idCategoria` INT(11), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO producto(descripcion
						,talla
						,estado
						,id_categoria
						,fecha_creacion
						,fecha_modificacion
						,id_usuario_creacion
						,id_usuario_modificacion
						) 
	VALUES (descripcion
			,talla
			,estado
			,idCategoria
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_rol` (IN `descripcion` VARCHAR(50), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO rol(descripcion
					,estado
					,fecha_creacion
					,fecha_modificacion
					,id_usuario_creacion
					,id_usuario_modificacion
					) 
	VALUES (descripcion
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_tarea` (IN `descripcion` VARCHAR(100), IN `valorUnitario` DOUBLE, IN `cantidad` INT(11), IN `fecha` DATETIME, IN `estadoPago` ENUM('Pagado','Por pagar'), IN `idEmpleado` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO tarea (descripcion
					,valor_unitario
					,cantidad
					,fecha
					,estado_pago
					,id_empleado
					,estado
					,fecha_creacion
					,fecha_modificacion
					,id_usuario_creacion
					,id_usuario_modificacion
					) 
	VALUES(descripcion
			,valorUnitario
			,cantidad
			,fecha
			,estadoPago
			,idEmpleado
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_tipo_pago` (IN `descripcion` VARCHAR(100), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO tipo_pago(descripcion
						 ,estado
						 ,fecha_creacion
						 ,fecha_modificacion
						 ,id_usuario_creacion
						 ,id_usuario_modificacion
						 ) 
	VALUES (descripcion
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_usuario` (IN `usuario` VARCHAR(50), IN `contrasenia` VARCHAR(50), IN `fechaActivacion` DATE, IN `fechaExpiracion` DATE, IN `idPersona` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO usuario(usuario
						,contrasenia
						,fecha_activacion
						,fecha_expiracion
						,id_persona
						,estado
						,fecha_creacion
						,fecha_modificacion
						,id_usuario_creacion
						,id_usuario_modificacion
						) 
	VALUES (usuario
			,contrasenia
			,fechaActivacion
			,fechaExpiracion
			,idPersona
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_usuario_rol` (IN `idUsuario` INT(11), IN `idRol` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioCreacion` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	INSERT INTO usuario_rol(id_usuario
							,id_rol
							,estado
							,fecha_creacion
							,fecha_modificacion
							,id_usuario_creacion
							,id_usuario_modificacion
							) 
	VALUES (idUsuario
			,idRol
			,estado
			,NOW()
			,NOW()
			,idUsuarioCreacion
			,idUsuarioModificacion
			);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_cargo` (IN `descripcion` VARCHAR(50), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idCargo` INT(11))  BEGIN
	UPDATE cargo 
	SET descripcion = descripcion
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_cargo = idCargo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_categoria` (IN `descripcion` VARCHAR(50), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idCategoria` INT(11))  BEGIN
	UPDATE categoria 
	SET descripcion = descripcion
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion
	WHERE id_categoria = idCategoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_cliente` (IN `idPersona` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idCliente` INT(11))  BEGIN
	UPDATE cliente 
	SET id_persona = idPersona
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_cliente = idCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_detalle_orden` (IN `valorInventario` DOUBLE, IN `valorVenta` DOUBLE, IN `cantidad` INT(11), IN `idOrden` INT(11), IN `idProducto` INT(11), IN `idUsuarioModificacion` INT(11), IN `idDetalleOrden` INT(11))  BEGIN
	UPDATE detalle_orden 
	    SET 
		 	valor_inventario = valorInventario
			,valor_venta = valorVenta
			,cantidad = cantidad
			,id_orden = idOrden
			,id_producto = idProducto
			,fecha_modificacion = NOW()
			,id_usuario_modificacion = idUsuarioModificacion 
		WHERE id_detalle_orden = idDetalleOrden;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_empleado` (IN `idCargo` INT(11), IN `correoInstitucional` VARCHAR(50), IN `fechaIngreso` DATETIME, IN `arl` VARCHAR(20), IN `salud` VARCHAR(20), IN `pension` VARCHAR(20), IN `idPersona` INT(11), IN `sueldoBasico` DOUBLE, IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idEmpleado` INT(11))  BEGIN
	UPDATE empleado 
	SET id_cargo = idCargo
		,correo_institucional = correoInstitucional
		,fecha_ingreso = fechaIngreso
		,arl = arl
		,salud = salud
		,pension = pension
		,id_persona = idPersona
		,sueldo_basico = sueldoBasico
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_empleado = idEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_formulario` (IN `descripcion` VARCHAR(50), IN `etiqueta` VARCHAR(30), IN `ubicacion` VARCHAR(100), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idFormulario` INT(11))  BEGIN
	UPDATE formulario 
    SET descripcion = descripcion
		,etiqueta = etiqueta
		,ubicacion = ubicacion
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_formulario = idFormulario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_formulario_rol` (IN `idRol` INT(11), IN `idFormulario` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idFormularioRol` INT(11))  BEGIN
	UPDATE formulario_rol 
    SET id_rol = idRol
		,id_formulario = idFormulario
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_formulario_rol = idFormularioRol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_generar_pago` (IN `valorPago` DOUBLE, IN `deduccion` DOUBLE, IN `fechaInicio` DATETIME, IN `fechaFin` DATETIME, IN `idEmpleado` INT(11), IN `idUsuarioModificacion` INT(11), IN `idGenerarPago` INT(11))  BEGIN
	UPDATE generar_pago 
	SET valor_pago = valorPago
		,deduccion = deduccion
		,fecha_inicio = fechaInicio
		,fecha_fin = fechaFin
		,id_empleado = idEmpleado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_generar_pago = idGenerarPago;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_orden` (IN `fechaOrden` DATETIME, IN `fechaEntrega` DATETIME, IN `descripcion` VARCHAR(50), IN `idCliente` INT(11), IN `idEmpleado` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idOrden` INT(11))  BEGIN
	UPDATE orden 
	SET fecha_orden = fechaOrden
       ,fecha_entrega = fechaEntrega 
       ,descripcion = descripcion
       ,id_cliente = idCliente
       ,id_empleado = idEmpleado
       ,estado = estado
	   ,fecha_modificacion = NOW()
       ,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_orden = idOrden;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_pago_dia` (IN `idEmpleado` INT(11), IN `pagoDia` DOUBLE, IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idPagoDia` INT(11))  BEGIN
	UPDATE pago_dia 
	SET id_empleado = idEmpleado
		,pago_dia = pagoDia
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE 
		id_pago_dia = idPagoDia;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_persona` (IN `nombre` VARCHAR(100), IN `apellido` VARCHAR(100), IN `documento` INT(11), IN `edad` INT(11), IN `genero` ENUM('M','F'), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idPersona` INT(11))  BEGIN
	UPDATE persona 
	SET nombre = nombre
		,apellido = apellido
		,documento = documento
		,edad = edad
		,genero = genero
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE
		id_persona = idPersona;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_producto` (IN `descripcion` VARCHAR(50), IN `talla` VARCHAR(50), IN `estado` ENUM('0','1'), IN `idCategoria` INT, IN `idUsuarioModificacion` INT(11), IN `idProducto` INT(11))  BEGIN
	UPDATE producto 
    SET descripcion = descripcion
		,talla = talla
		,estado = estado
		,id_categoria = idCategoria
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_producto = idProducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_rol` (IN `descripcion` VARCHAR(50), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idRol` INT(11))  BEGIN
	UPDATE rol 
	SET	descripcion = descripcion
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_rol = idRol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_tarea` (IN `descripcion` VARCHAR(100), IN `valorUnitario` DOUBLE, IN `cantidad` INT(11), IN `fecha` DATETIME, IN `estadoPago` ENUM('Pagado','Por pagar'), IN `idEmpleado` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idTarea` INT(11))  BEGIN
	UPDATE rol
	set descripcion = descripcion
		,valor_unitario = valorUnitario
		,cantidad = cantidad
		,fecha = fecha
		,estado_pago = estadoPago
		,id_empleado = idEmpleado
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_Modificacion = idUsuarioModificacion
	WHERE
		id_tarea = idTarea;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_tipo_pago` (IN `descripcion` VARCHAR(100), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idTipoPago` INT(11))  BEGIN
	UPDATE persona 
	SET descripcion = descripcion
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_tipo_pago = idTipoPago;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_usuario` (IN `usuario` VARCHAR(50), IN `contrasenia` VARCHAR(50), IN `fechaActivacion` DATE, IN `fechaExpiracion` DATE, IN `idPersona` INT(11), IN `estado` ENUM('0','1'), IN `idUsuario` INT(11), IN `idUsuarioModificacion` INT(11))  BEGIN
	UPDATE usuario 
	SET usuario = usuario
		,contrasenia = contrasenia
		,fecha_activacion = fechaActivacion
		,fecha_expiracion = fechaExpiracion
		,id_persona = idPersona
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_usuario = idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_usuario_rol` (IN `idUsuario` INT(11), IN `idRol` INT(11), IN `estado` ENUM('0','1'), IN `idUsuarioModificacion` INT(11), IN `idUsuarioRol` INT(11))  BEGIN
	UPDATE usuario_rol 
	SET id_usuario = idUsuario
		,id_rol = idRol
		,estado = estado
		,fecha_modificacion = NOW()
		,id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_usuario_rol = idUsuarioRol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_carpeta` (IN `id` INT)  BEGIN
	SELECT 
		f.etiqueta AS modulo
		,COUNT(f.etiqueta) AS cantidad_formulario
	FROM 
		formulario AS f
		INNER JOIN formulario_rol AS  fr ON f.id_formulario = fr.id_formulario
		INNER JOIN rol AS r ON fr.id_rol = r.id_rol
		INNER JOIN usuario_rol AS ur ON r.id_rol = ur.id_rol
		INNER JOIN usuario AS u ON ur.id_usuario = u.id_usuario
	WHERE u.id_usuario = id
	GROUP BY etiqueta
	ORDER BY f.descripcion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_login` (IN `u_user` VARCHAR(50), `u_password` VARCHAR(100))  BEGIN
	SELECT 
		COUNT(u.usuario) AS autenticado
		,u.id_usuario
		,u.usuario
		,CONCAT(p.nombre,' ',p.apellido) AS nombre
	FROM
		usuario AS u
		INNER JOIN persona AS p ON u.id_persona = p.id_persona
	WHERE u.usuario = u_user AND u.contrasenia = u_password;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_menu` (IN `modulo` VARCHAR(50), `id` INT)  BEGIN
	SELECT 
		f.id_formulario
		,f.descripcion
		,CONVERT(CAST(CONVERT(f.ubicacion USING latin1) AS BINARY) USING utf8) AS ubicacion
		,f.etiqueta
	FROM 
		usuario AS u
		INNER JOIN usuario_rol AS ur ON u.id_usuario = ur.id_usuario
		INNER JOIN rol AS r ON ur.id_rol = r.id_rol
		INNER JOIN formulario_rol AS fr ON r.id_rol = fr.id_rol
		INNER JOIN formulario AS f ON fr.id_formulario = f.id_formulario
	WHERE f.etiqueta LIKE modulo AND u.id_usuario = id
	ORDER BY f.descripcion;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `descripcion`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'Administrador', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(2, 'Contador', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(3, 'Empleado', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(4, 'Vendedor', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `descripcion`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'Camisas', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(2, 'Pantalones', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(3, 'Vestidos', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(4, 'Sueteres', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(5, 'Interiores', '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `id_persona`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 5, '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(2, 6, '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(3, 7, '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(4, 8, '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(5, 9, '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_venta`
--

CREATE TABLE `compra_venta` (
  `id_compra_venta` int(11) NOT NULL,
  `control` enum('Compra','Venta','Cotizacion') NOT NULL,
  `fecha` datetime NOT NULL,
  `descuento` double DEFAULT NULL,
  `valor` double NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden`
--

CREATE TABLE `detalle_orden` (
  `id_detalle_orden` int(11) NOT NULL,
  `valor_inventario` double NOT NULL,
  `valor_venta` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_orden`
--

INSERT INTO `detalle_orden` (`id_detalle_orden`, `valor_inventario`, `valor_venta`, `cantidad`, `id_orden`, `id_producto`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 1100, 2100, 10, 1, 1, '1', '2021-05-26 19:07:00', '2021-05-26 19:07:00', 1, 1),
(2, 1200, 2200, 2, 2, 1, '1', '2021-05-26 19:07:00', '2021-05-26 19:07:00', 1, 1),
(3, 1100, 2300, 20, 1, 2, '1', '2021-05-27 19:07:00', '2021-05-27 19:07:00', 1, 1),
(4, 1300, 2400, 3, 2, 3, '1', '2021-05-28 19:07:00', '2021-05-28 19:07:00', 1, 1),
(5, 1400, 2500, 3, 3, 4, '1', '2021-05-29 19:07:00', '2021-05-29 19:07:00', 1, 1),
(6, 1500, 2200, 30, 5, 6, '0', '2021-05-30 19:07:00', '2021-05-30 19:07:00', 1, 1),
(7, 1600, 2700, 40, 3, 3, '0', '2021-05-31 19:07:00', '2021-05-31 19:07:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `correo_institucional` varchar(50) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `arl` varchar(20) NOT NULL,
  `salud` varchar(20) NOT NULL,
  `pension` varchar(20) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `sueldo_basico` double DEFAULT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `id_cargo`, `correo_institucional`, `fecha_ingreso`, `arl`, `salud`, `pension`, `id_persona`, `sueldo_basico`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 1, 'cargon@contex.com', '2021-05-08', 'Equidad Seguros', 'Comfamiliar', 'Colpesiones', 2, 1200000, '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(2, 2, 'yestov@contex.com', '2021-05-08', 'Equidad Seguros', 'Comfamiliar', 'Colpesiones', 1, 1200000, '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(3, 3, 'yestov@contex.com', '2021-05-08', 'Equidad Seguros', 'Comfamiliar', 'Colpesiones', 1, 1200000, '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(4, 4, 'aletov@context.com', '2021-05-08', 'Equidad Seguros', 'Comfamiliar', 'Colpesiones', 3, 1200000, '1', '2021-05-08 01:35:00', '2021-05-08 01:35:00', 1, 1),
(7, 1, 'hola@mundo.com', '2021-05-27', 'Sura', 'Comfamiliar', 'Porvenir', 1, 22222222222222, '1', '2021-05-27 13:58:47', '2021-05-27 13:58:47', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `id_formulario` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `etiqueta` varchar(30) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `formulario`
--

INSERT INTO `formulario` (`id_formulario`, `descripcion`, `etiqueta`, `ubicacion`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'Formulario', 'Seguridad', './vista/seguridad/formulario.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(2, 'Formularios de rol', 'Seguridad', './vista/seguridad/formularioRol.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(3, 'Persona', 'Seguridad', './vista/seguridad/persona.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(4, 'Rol', 'Seguridad', './vista/seguridad/rol.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(5, 'Usuario', 'Seguridad', './vista/seguridad/usuario.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(6, 'Cargo', 'Nomina', './vista/nomina/cargo.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(7, 'Empleado', 'Nomina', './vista/nomina/empleado.V.php', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(8, 'Generar pago', 'Nomina', './vista/nomina/generarPago.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(9, 'Pago del dia', 'Nomina', './vista/nomina/pagoDia.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(10, 'Categoria', 'Producción', './vista/produccion/categoria.V.php', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(11, 'Detalles de orden', 'Producción', './vista/produccion/detalleOrden.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(12, 'Insumo', 'Producción', './vista/produccion/insumo.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(13, 'Orden', 'Producción', './vista/produccion/orden.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(14, 'Producto', 'Producción', './vista/produccion/producto.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(15, 'Tarea', 'Producción', './vista/produccion/tarea.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(16, 'Roles de Usuario', 'Seguridad', './vista/seguridad/usuarioRol.V.html', '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_rol`
--

CREATE TABLE `formulario_rol` (
  `id_formulario_rol` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `formulario_rol`
--

INSERT INTO `formulario_rol` (`id_formulario_rol`, `id_rol`, `id_formulario`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 1, 1, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(2, 1, 2, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(3, 1, 3, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(4, 1, 4, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(5, 1, 5, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(6, 1, 6, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(7, 1, 7, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(8, 1, 8, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(9, 1, 9, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(10, 1, 10, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(11, 1, 11, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(12, 1, 12, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(13, 1, 13, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(14, 1, 14, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(15, 1, 15, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1),
(19, 4, 3, '0', '2021-05-10 22:22:00', '2021-05-10 22:22:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generar_pago`
--

CREATE TABLE `generar_pago` (
  `id_generar_pago` int(11) NOT NULL,
  `valor_pago` double NOT NULL,
  `deduccion` double NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `fecha_orden` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_orden`, `fecha_orden`, `fecha_entrega`, `descripcion`, `id_cliente`, `id_empleado`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, '2021-05-21 07:00:00', '2021-06-21 07:00:00', 'Camisas x 10', 5, 1, '1', '2021-05-21 07:00:00', '2021-05-21 07:00:00', 1, 1),
(2, '2021-05-22 08:00:00', '2021-05-27 08:00:00', 'Pantalones x 2', 4, 2, '1', '2021-05-22 08:00:00', '2021-05-22 08:00:00', 1, 1),
(3, '2021-05-22 09:00:00', '2021-06-22 09:00:00', 'Medias x 20', 3, 3, '1', '2021-05-22 09:00:00', '2021-05-22 09:00:00', 1, 1),
(4, '2021-05-23 10:00:00', '2021-06-13 10:00:00', 'Vestidos x 3', 2, 4, '0', '2021-05-23 10:00:00', '2021-05-23 10:00:00', 1, 1),
(5, '2021-05-23 11:00:00', '2021-06-16 11:00:00', 'Sacos x 3', 1, 1, '1', '2021-05-23 11:00:00', '2021-05-23 11:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_dia`
--

CREATE TABLE `pago_dia` (
  `id_pago_dia` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `pago_dia` double NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `documento` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `genero` enum('M','F') NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `documento`, `edad`, `genero`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'Yesica', 'Tovar', 1075264421, 26, 'F', '1', '2021-04-22 00:00:00', '2021-04-22 00:00:00', 1, 1),
(2, 'Carmenza', 'Gonzalez', 1075264422, 42, 'F', '1', '2021-04-22 00:00:00', '2021-04-22 00:00:00', 1, 1),
(3, 'Alejandra', 'Tovar', 1075264423, 22, 'F', '1', '2021-04-22 00:00:00', '2021-04-22 00:00:00', 1, 1),
(4, 'Costurera', 'SiDatos', 1075264424, 11, 'F', '0', '2021-04-22 00:00:00', '2021-04-22 00:00:00', 1, 1),
(5, 'Cliente#1', 'ACliente#1', 1075264425, 101, 'M', '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(6, 'Cliente#2', 'ACliente#2', 1075264426, 102, 'F', '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(7, 'Cliente#3', 'ACliente#3', 1075264427, 103, 'M', '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(8, 'Cliente#4', 'ACliente#4', 1075264428, 104, 'F', '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(9, 'Cliente#5', 'ACliente#5', 1075264429, 105, 'M', '1', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `talla` varchar(50) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `descripcion`, `talla`, `estado`, `id_categoria`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'camisa', 'L', '1', 1, '2021-05-26 19:07:00', '2021-05-26 19:07:00', 1, 1),
(2, 'pantalon', '32', '1', 2, '2021-05-26 19:07:00', '2021-05-26 19:07:00', 1, 1),
(3, 'medias', '43', '1', 3, '2021-05-26 19:07:00', '2021-05-26 19:07:00', 1, 1),
(4, 'vestido', 'S', '1', 4, '2021-05-26 19:07:00', '2021-05-26 19:07:00', 1, 1),
(5, 'saco', 'L', '1', 5, '2021-05-26 19:07:00', '2021-05-26 19:07:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `descripcion`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'Administrador', '0', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(2, 'Contador', '0', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(3, 'Vendedor', '0', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1),
(4, 'Empleado', '0', '2021-05-10 20:00:00', '2021-05-10 20:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `id_tarea` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `valor_unitario` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado_pago` enum('Pagado','Por pagar') NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`id_tarea`, `descripcion`, `valor_unitario`, `cantidad`, `fecha`, `estado_pago`, `id_empleado`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'Hola', 10000, 10, '2021-05-17 00:00:00', 'Por pagar', 2, '1', '2021-05-12 22:36:37', '2021-05-12 22:36:37', 1, 1),
(14, 'Hola', 10000, 10, '0000-00-00 00:00:00', 'Por pagar', 1, '1', '2021-05-29 21:59:45', '2021-05-29 21:59:45', 1, 1),
(15, 'Chao', 2334234, 3242342, '2021-05-29 00:00:00', 'Pagado', 3, '0', '2021-05-29 22:04:04', '2021-05-29 22:04:04', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(50) NOT NULL,
  `fecha_activacion` date NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `id_persona` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `contrasenia`, `fecha_activacion`, `fecha_expiracion`, `id_persona`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 'admin@', '21232f297a57a5a743894a0e4a801fc3', '2021-05-16', '2021-06-02', 1, '1', '2021-05-08 01:35:00', '2021-05-11 22:11:54', 1, 3),
(2, 'carmen@', '880cbc1ed48043cbcdaa7286e058ef7f', '2021-05-02', '2021-05-07', 2, '1', '2021-05-11 22:06:54', '2021-05-11 22:06:54', 1, 1),
(3, 'ariel@', '4900d0a19b6894a4a514e9ff3afcc2c0', '2021-05-16', '2021-06-02', 1, '1', '2021-05-11 22:11:21', '2021-05-11 22:26:44', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id_usuario_rol` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id_usuario_rol`, `id_usuario`, `id_rol`, `estado`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creacion`, `id_usuario_modificacion`) VALUES
(1, 1, 1, '0', '2021-05-10 05:00:22', '2021-05-12 05:00:24', 1, 1),
(2, 3, 4, '0', '2021-05-10 05:00:22', '2021-05-12 05:00:24', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `compra_venta`
--
ALTER TABLE `compra_venta`
  ADD PRIMARY KEY (`id_compra_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD PRIMARY KEY (`id_detalle_orden`),
  ADD KEY `fk_detalle_orden_producto` (`id_producto`),
  ADD KEY `fk_detalle_orden_orden` (`id_orden`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`id_formulario`);

--
-- Indices de la tabla `formulario_rol`
--
ALTER TABLE `formulario_rol`
  ADD PRIMARY KEY (`id_formulario_rol`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_formulario` (`id_formulario`);

--
-- Indices de la tabla `generar_pago`
--
ALTER TABLE `generar_pago`
  ADD PRIMARY KEY (`id_generar_pago`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `pago_dia`
--
ALTER TABLE `pago_dia`
  ADD PRIMARY KEY (`id_pago_dia`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id_tarea`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id_tipo_pago`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id_usuario_rol`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compra_venta`
--
ALTER TABLE `compra_venta`
  MODIFY `id_compra_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  MODIFY `id_detalle_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `id_formulario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `formulario_rol`
--
ALTER TABLE `formulario_rol`
  MODIFY `id_formulario_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `generar_pago`
--
ALTER TABLE `generar_pago`
  MODIFY `id_generar_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pago_dia`
--
ALTER TABLE `pago_dia`
  MODIFY `id_pago_dia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  MODIFY `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `compra_venta`
--
ALTER TABLE `compra_venta`
  ADD CONSTRAINT `compra_venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `compra_venta_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD CONSTRAINT `fk_detalle_orden_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  ADD CONSTRAINT `fk_detalle_orden_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`);

--
-- Filtros para la tabla `formulario_rol`
--
ALTER TABLE `formulario_rol`
  ADD CONSTRAINT `formulario_rol_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  ADD CONSTRAINT `formulario_rol_ibfk_2` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id_formulario`);

--
-- Filtros para la tabla `generar_pago`
--
ALTER TABLE `generar_pago`
  ADD CONSTRAINT `generar_pago_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `pago_dia`
--
ALTER TABLE `pago_dia`
  ADD CONSTRAINT `pago_dia_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `fk_tarea_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- MySQL Script generated by MySQL Workbench
-- Fri Mar 26 20:56:02 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema contex
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema contex
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `contex` DEFAULT CHARACTER SET utf8mb4 ;
USE `contex` ;

-- -----------------------------------------------------
-- Table `contex`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`cargo` (
  `id_cargo` INT NOT NULL AUTO_INCREMENT,
  `codigo_cargo` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `estado` BIT(1) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `id_usuario_creacion` INT NOT NULL,
  `id_usuario_modificacion` INT NOT NULL,
  PRIMARY KEY (`id_cargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`persona` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  `genero` ENUM('Masculino', 'Femenino', 'Otro') NOT NULL,
  `estado` BIT(1) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `id_usuario_creacion` INT NOT NULL,
  `id_usuario_modificacion` INT NOT NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `id_persona` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `id_persona` (`id_persona` ASC),
  CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `contex`.`persona` (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `id_persona` INT NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  INDEX `id_persona` (`id_persona` ASC),
  CONSTRAINT `proveedor_ibfk_1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `contex`.`persona` (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`compra_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`compra_venta` (
  `id_compra_venta` INT NOT NULL AUTO_INCREMENT,
  `control` ENUM('Compra', 'Venta', 'Cotizacion') NOT NULL,
  `fecha` DATETIME NOT NULL,
  `descuento` DOUBLE NULL,
  `valor` DOUBLE NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id_compra_venta`),
  INDEX `id_cliente` (`id_cliente` ASC),
  INDEX `id_proveedor` (`id_proveedor` ASC),
  CONSTRAINT `compra_venta_ibfk_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `contex`.`cliente` (`id_cliente`),
  CONSTRAINT `compra_venta_ibfk_2`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `contex`.`proveedor` (`id_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`empleado`(
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `id_cargo` INT NOT NULL,
  `correo_institucional` VARCHAR(50) NOT NULL,
  `fecha_ingreso` DATETIME NOT NULL,
  `arl` ENUM('ARL1', 'ARL2', 'ARL3') NOT NULL,
  `salud` ENUM('salud1', 'salud2', 'salud3') NOT NULL,
  `pension` ENUM('pension1', 'pension2', 'pension3') NOT NULL,
  `id_persona` INT(11) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `id_persona` (`id_persona` ASC),
  INDEX `id_cargo` (`id_cargo` ASC),
  CONSTRAINT `empleado_ibfk_1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `contex`.`persona` (`id_persona`),
  CONSTRAINT `empleado_ibfk_2`
    FOREIGN KEY (`id_cargo`)
    REFERENCES `contex`.`cargo` (`id_cargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`formulario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`formulario` (
  `id_formulario` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NOT NULL,
  `etiqueta` VARCHAR(30) NOT NULL,
  `ubicacion` VARCHAR(100) NOT NULL,
  `estado` BIT(1) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `id_usuario_creacion` INT NOT NULL,
  `id_usuario_modificacion` INT NOT NULL,
  PRIMARY KEY (`id_formulario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NOT NULL,
  `estado` BIT(1) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `id_usuario_creacion` INT NOT NULL,
  `id_usuario_modificacion` INT NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`formulario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`formulario_rol` (
  `id_formulario_rol` INT NOT NULL AUTO_INCREMENT,
  `id_rol` INT NOT NULL,
  `id_formulario` INT NOT NULL,
  `estado` BIT(1) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `id_usuario_creacion` INT NOT NULL,
  `id_usuario_modificacion` INT NOT NULL,
  PRIMARY KEY (`id_formulario_rol`),
  INDEX `id_rol` (`id_rol` ASC),
  INDEX `id_formulario` (`id_formulario` ASC),
  CONSTRAINT `formulario_rol_ibfk_1`
    FOREIGN KEY (`id_rol`)
    REFERENCES `contex`.`rol` (`id_rol`),
  CONSTRAINT `formulario_rol_ibfk_2`
    FOREIGN KEY (`id_formulario`)
    REFERENCES `contex`.`formulario` (`id_formulario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`generar_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`generar_pago` (
  `id_generar_pago` INT NOT NULL AUTO_INCREMENT,
  `valor_pago` DOUBLE NOT NULL,
  `deduccion` DOUBLE NOT NULL,
  `fecha_inicio` DATETIME NOT NULL,
  `fecha_fin` DATETIME NOT NULL,
  `id_empleado` INT NOT NULL,
  PRIMARY KEY (`id_generar_pago`),
  INDEX `id_empleado` (`id_empleado` ASC),
  CONSTRAINT `generar_pago_ibfk_1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `contex`.`empleado` (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`orden` (
  `id_orden` INT NOT NULL AUTO_INCREMENT,
  `fecha_orden` DATETIME NOT NULL,
  `fecha_entrega` DATETIME NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `id_persona` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `id_persona` (`id_persona` ASC),
  INDEX `id_empleado` (`id_empleado` ASC),
  CONSTRAINT `orden_ibfk_1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `contex`.`persona` (`id_persona`),
  CONSTRAINT `orden_ibfk_2`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `contex`.`empleado` (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`pago_dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`pago_dia` (
  `id_pago_dia` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` INT NOT NULL,
  `pago_dia` DOUBLE NOT NULL,
  PRIMARY KEY (`id_pago_dia`),
  INDEX `id_empleado` (`id_empleado` ASC),
  CONSTRAINT `pago_dia_ibfk_1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `contex`.`empleado` (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`tarea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`tarea` (
  `id_tarea` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  `valor_unitario` DOUBLE NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `estado_pago` ENUM('por pagar', 'pagado') NOT NULL,
  `id_empleado` INT NOT NULL,
  PRIMARY KEY (`id_tarea`),
  INDEX `id_empleado` (`id_empleado` ASC),
  CONSTRAINT `tarea_ibfk_1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `contex`.`empleado` (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `contrasenia` VARCHAR(50) NOT NULL,
  `fecha_activacion` DATETIME NOT NULL,
  `fecha_expiracion` DATETIME NOT NULL,
  `id_persona` INT NOT NULL,
  `estado` BIT(1) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `id_usuario_creacion` INT NOT NULL,
  `id_usuario_modificacion` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `id_persona` (`id_persona` ASC),
  CONSTRAINT `usuario_ibfk_1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `contex`.`persona` (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
-- -----------------------------------------------------
-- Table `contex`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contex`.`usuario_rol` (
  `id_usuario_rol` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `id_rol` INT NOT NULL,
  `estado` BIT(1) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fehca_modificacion` DATETIME NOT NULL,
  `id_usuario_creacion` INT NOT NULL,
  `id_usuario_modificacion` INT NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  INDEX `id_usuario` (`id_usuario` ASC),
  INDEX `id_rol` (`id_rol` ASC),
  CONSTRAINT `usuario_rol_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `contex`.`usuario` (`id_usuario`),
  CONSTRAINT `usuario_rol_ibfk_2`
    FOREIGN KEY (`id_rol`)
    REFERENCES `contex`.`rol` (`id_rol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

DELIMITER $$
CREATE PROCEDURE Agregar_formulario(IN descripcion VARCHAR(50),
					IN etiqueta VARCHAR(30),
                    IN ubicacion VARCHAR(100),
                    IN estado BIT(1),
                    IN idUsuarioCreacion INT(11))
BEGIN
	INSERT INTO formulario(
					descripcion,
                    etiqueta,
                    ubicacion,
                    estado,
                    fecha_creacion,
                    fecha_modificacion,
                    id_usuario_creacion,
                    id_usuario_modificacion) 
			VALUES (
				descripcion,
				etiqueta,
				ubicacion,
				estado,
				CURDATE(),
				CURDATE(),
				idUsuarioCreacion,
				idUsuarioCreacion);
END$$

DELIMITER $$
CREATE PROCEDURE Modificar_formulario(IN descripcion VARCHAR(50),
					IN etiqueta VARCHAR(30),
                    IN ubicacion VARCHAR(100),
                    IN estado BIT(1),
                    IN idUsuarioModificacion INT(11),
                    IN idFormulario INT(11))
BEGIN
	UPDATE formulario 
    SET descripcion = descripcion,
		etiqueta = etiqueta,
		ubicacion = ubicacion,
		estado = estado,
		fecha_modificacion = NOW(),
		id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_formulario = idFormulario;
END$$

DELIMITER $$
CREATE PROCEDURE Agregar_formulario_rol(IN idRol INT(11),
					IN idFormulario INT(11),
                    IN estado BIT(1),
                    IN idUsuarioCreacion INT(11))
BEGIN
	INSERT INTO formulario_rol(
					id_rol,
                    id_formulario,
                    estado,
                    fecha_creacion,
                    fecha_modificacion,
                    id_usuario_creacion,
                    id_usuario_modificacion) 
			VALUES (
				idRol,
				idFormulario,
				estado,
				CURDATE(),
				CURDATE(),
				idUsuarioCreacion,
				idUsuarioCreacion);
END$$

DELIMITER $$
CREATE PROCEDURE Modificar_formulario_rol(IN idRol INT(11),
					IN idFormulario INT(11),
                    IN estado BIT(1),
                    IN idUsuarioModificacion INT(11),
                    IN idFormularioRol INT(11))
BEGIN
	UPDATE formulario_rol 
    SET id_rol = idRol,
		id_formulario = idFormulario,
		estado = estado,
		fecha_modificacion = NOW(),
		id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_formulario_rol = idFormularioRol;
END$$

DELIMITER $$
CREATE PROCEDURE Agregar_persona(IN nombre VARCHAR(100),
					IN apellido VARCHAR(100),
                    IN edad INT(11),
                    IN genero ENUM('Masculino','Femenino','Otro'),
                    IN estado BIT(1),
                    IN idUsuarioCreacion INT(11))
BEGIN
	INSERT INTO persona(
					nombre,
                    apellido,
                    edad,
                    genero,
                    estado,
                    fecha_creacion,
                    fecha_modificacion,
                    id_usuario_creacion,
                    id_usuario_modificacion) 
			VALUES (
				nombre,
				apellido,
                edad,
                genero,
				estado,
				CURDATE(),
				CURDATE(),
				idUsuarioCreacion,
				idUsuarioCreacion);
END$$

DELIMITER $$
CREATE PROCEDURE Modificar_persona(IN nombre VARCHAR(100),
                    IN apellido VARCHAR(100),
                    IN edad INT(11),
                    IN genero ENUM('Masculino','Femenino','Otro'),
                    IN estado BIT(1),
                    IN idUsuarioModificacion INT(11),
                    IN idPersona INT(11))
BEGIN
	UPDATE persona 
    SET nombre = nombre,
		apellido = apellido,
        edad = edad,
        genero = genero,
		estado = estado,
		fecha_modificacion = NOW(),
		id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_persona = idPersona;
END$$

DELIMITER $$
CREATE PROCEDURE Agregar_rol(IN descripcion VARCHAR(50),
					IN estado BIT(1),
                    IN idUsuarioCreacion INT(11))
BEGIN
	INSERT INTO rol(
					descripcion,
                    estado,
                    fecha_creacion,
                    fecha_modificacion,
                    id_usuario_creacion,
                    id_usuario_modificacion) 
			VALUES (
				descripcion,
				estado,
				CURDATE(),
				CURDATE(),
				idUsuarioCreacion,
				idUsuarioCreacion);
END$$

DELIMITER $$
CREATE PROCEDURE Modificar_rol(IN descripcion VARCHAR(50),
					IN estado BIT(1),
                    IN idUsuarioModificacion INT(11),
                    IN idRol INT(11))
BEGIN
	UPDATE rol 
    SET descripcion = descripcion,
		estado = estado,
		fecha_modificacion = NOW(),
		id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_rol = idRol;
END$$

DELIMITER $$
CREATE PROCEDURE Agregar_usuario(IN usuario VARCHAR(50),
					IN contrasenia VARCHAR(50),
                    IN fechaActivacion DATETIME,
                    IN fechaExpiracion DATETIME,
                    IN idPersona INT(11),
					IN estado BIT(1),
                    IN idUsuarioCreacion INT(11))
BEGIN
	INSERT INTO usuario(
					usuario,
                    contrasenia,
                    fecha_activacion,
                    fecha_expiracion,
                    id_persona,
                    estado,
                    fecha_creacion,
                    fecha_modificacion,
                    id_usuario_creacion,
                    id_usuario_modificacion) 
			VALUES (
				usuario,
                contrasenia,
                fechaActivacion,
                fechaExpiracion,
                idPersona,
				estado,
				CURDATE(),
				CURDATE(),
				idUsuarioCreacion,
				idUsuarioCreacion);
END$$

DELIMITER $$
CREATE PROCEDURE Modificar_usuario(IN usuario VARCHAR(50),
					IN contrasenia VARCHAR(50),
                    IN fechaActivacion DATETIME,
                    IN fechaExpiracion DATETIME,
                    IN idPersona INT(11),
					IN estado BIT(1),
                    IN idUsuarioModificacion INT(11),
                    IN idUsuario INT(11))
BEGIN
	UPDATE usuario 
    SET usuario = usuario,
		contrasenia = contrasenia,
        fecha_activacion = fechaActivacion,
        fecha_expiracion = fechaExpiracion,
        id_persona = idPersona,
		estado = estado,
		fecha_modificacion = NOW(),
		id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_usuario = idUsuario;
END$$

DELIMITER $$
CREATE PROCEDURE Agregar_usuario_rol(IN idUsuario INT(11),
					IN idRol INT(11),
					IN estado BIT(1),
                    IN idUsuarioCreacion INT(11))
BEGIN
	INSERT INTO usuario_rol(
					id_usuario,
                    id_rol,
                    estado,
                    fecha_creacion,
                    fecha_modificacion,
                    id_usuario_creacion,
                    id_usuario_modificacion) 
			VALUES (
				idUsuario,
                idRol,
				estado,
				CURDATE(),
				CURDATE(),
				idUsuarioCreacion,
				idUsuarioCreacion);
END$$

DELIMITER $$
CREATE PROCEDURE Modificar_usuario_rol(IN idUsuario INT(11),
					IN idRol INT(11),
					IN estado BIT(1),
                    IN idUsuarioModificacion INT(11),
                    IN idUsuarioRol INT(11))
BEGIN
	UPDATE usuario_rol 
    SET id_usuario = idUsuario,
		id_rol = idRol,
		estado = estado,
		fecha_modificacion = NOW(),
		id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_usuario_rol = idUsuarioRol;
END$$

DELIMITER $$
CREATE PROCEDURE Agregar_empleado(IN idCargo INT(11),
					IN correoInstitucional VARCHAR(50),
                    IN fechaIngreso DATETIME,
                    IN arl ENUM('ARL1','ARL2','ARL3'),
                    IN salud ENUM('salud1','salud2','salud3'),
                    IN pension ENUM('pension1','pension2','pension3'),
                    IN idPersona INT(11),
					IN estado BIT(1),
                    IN idUsuarioCreacion INT(11))
BEGIN
	INSERT INTO empleado(
					id_usuario,
                    id_rol,
                    estado,
                    fecha_creacion,
                    fecha_modificacion,
                    id_usuario_creacion,
                    id_usuario_modificacion) 
			VALUES (
				idUsuario,
                idRol,
				estado,
				CURDATE(),
				CURDATE(),
				idUsuarioCreacion,
				idUsuarioCreacion);
END$$

DELIMITER $$
CREATE PROCEDURE Modificar_empleado(IN idUsuario INT(11),
					IN idRol INT(11),
					IN estado BIT(1),
                    IN idUsuarioModificacion INT(11),
                    IN idEmpleado INT(11))
BEGIN
	UPDATE empleado 
    SET id_usuario = idUsuario,
		id_rol = idRol,
		estado = estado,
		fecha_modificacion = NOW(),
		id_usuario_modificacion = idUsuarioModificacion 
	WHERE id_empleado = idEmpleado;
END$$
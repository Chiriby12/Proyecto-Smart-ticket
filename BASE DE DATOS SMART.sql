-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SMART
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SMART
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SMART` DEFAULT CHARACTER SET utf8 ;
USE `SMART` ;

-- -----------------------------------------------------
-- Table `SMART`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Documento` VARCHAR(45) NOT NULL,
  `numero_doc` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `interfaz` VARCHAR(45) NULL,
  `fecha_registro` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART`.`Abogado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART`.`Abogado` (
  `idAbogado` INT NOT NULL AUTO_INCREMENT,
  `nombre_completo` VARCHAR(100) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `idAdministrador` INT NULL,
  PRIMARY KEY (`idAbogado`),
  INDEX `registro_idx` (`idAdministrador` ASC) VISIBLE,
  CONSTRAINT `registro`
    FOREIGN KEY (`idAdministrador`)
    REFERENCES `SMART`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART`.`solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART`.`solicitud` (
  `idsolicitud` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NULL,
  `idAbogado` INT NULL,
  `fecha` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `descripcion` LONGTEXT NULL,
  `prioridad` VARCHAR(45) NULL,
  PRIMARY KEY (`idsolicitud`),
  INDEX `cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `abogado_idx` (`idAbogado` ASC) VISIBLE,
  CONSTRAINT `cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `SMART`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `abogado`
    FOREIGN KEY (`idAbogado`)
    REFERENCES `SMART`.`Abogado` (`idAbogado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART`.`Documento_solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART`.`Documento_solicitud` (
  `idDocumento` INT NOT NULL AUTO_INCREMENT,
  `idSolicitud` INT NULL,
  `Nombre_doc` VARCHAR(45) NULL,
  `fecha_carga` VARCHAR(45) NULL,
  `tipo_documento` VARCHAR(45) NULL,
  PRIMARY KEY (`idDocumento`),
  INDEX `documento_idx` (`idSolicitud` ASC) VISIBLE,
  CONSTRAINT `documento`
    FOREIGN KEY (`idSolicitud`)
    REFERENCES `SMART`.`solicitud` (`idsolicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

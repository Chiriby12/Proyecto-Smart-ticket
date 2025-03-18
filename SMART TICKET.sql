-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SmartiTicket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SmartiTicket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SmartiTicket` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema smartticket
-- -----------------------------------------------------
USE `SmartiTicket` ;

-- -----------------------------------------------------
-- Table `SmartiTicket`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SmartiTicket`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `cedula` LONGTEXT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `solicitud` LONGTEXT NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SmartiTicket`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SmartiTicket`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  INDEX `ID CLIENTE_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `ID CLIENTE`
    FOREIGN KEY (`idCliente`)
    REFERENCES `SmartiTicket`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SmartiTicket`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SmartiTicket`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  INDEX `ID FUNCIONARIO_idx` (`idFuncionario` ASC) VISIBLE,
  CONSTRAINT `ID FUNCIONARIO`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `SmartiTicket`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
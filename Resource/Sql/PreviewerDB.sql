-- MySQL Script generated by MySQL Workbench
-- Fri Oct 18 14:55:25 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
drop database if exists previewer_db;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema previewer_db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema previewer_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `previewer_db` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
USE `previewer_db` ;
-- -----------------------------------------------------
-- Table `previewer_db`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `previewer_db`.`Payment` (
  `grade` VARCHAR(10) NOT NULL,
  `price` INT NULL,
  PRIMARY KEY (`grade`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `previewer_db`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `previewer_db`.`User` (
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(70) NOT NULL,
  `auth` VARCHAR(25)  NOT NULL,
  PRIMARY KEY (`email`)
)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `previewer_db`.`User_Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `previewer_db`.`User_Payment` (
	`email` varchar(45) not null,
    `grade` VARCHAR(10) NOT NULL,
	`payment_date` timestamp,
    `expire_date` timestamp,
	CONSTRAINT `fk_User_Payment_Email`
    FOREIGN KEY (`email`)
    REFERENCES `previewer_db`.`User` (`email`)
    ON DELETE cascade
    ON UPDATE cascade,
	CONSTRAINT `fk_User_grade`
    FOREIGN KEY (`grade`)
    REFERENCES `previewer_db`.`Payment` (`grade`)
    ON DELETE cascade
    ON UPDATE cascade
);
-- -----------------------------------------------------
-- Table `previewer_db`.`SiteList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `previewer_db`.`SiteList` (
  `url` VARCHAR(200) NOT NULL,
  `analysisCheck` int NULL,
  `analysisResult` int NULL,
  PRIMARY KEY (`url`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `previewer_db`.`Request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `previewer_db`.`Request` (
  `number` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(200) NOT NULL,
  `request_date` DATE NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`number`, `email`),
  CONSTRAINT `fk_Request_User1`
    FOREIGN KEY (`email`)
    REFERENCES `previewer_db`.`User` (`email`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `previewer_db`.`XssList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `previewer_db`.`XssList` (
  `gadget` VARCHAR(256) NOT NULL
  PRIMARY KEY(`gadget`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `previewer_db`.`IPList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `previewer_db`.`IPList` (
  `ip` VARCHAR(200) NOT NULL,
  `analysisCheck` int NULL,
  `analysisResult` int NULL,
  PRIMARY KEY (`url`))
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

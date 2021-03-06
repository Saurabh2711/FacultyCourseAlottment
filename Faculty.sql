-- MySQL Script generated by MySQL Workbench
-- Tue Mar 31 23:53:49 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `user_id` INT NOT NULL,
  `passwd` VARCHAR(45) NULL,
  `DOB` DATETIME NULL,
  `email` VARCHAR(45) NULL,
  `contact` VARCHAR(45) NULL,
  `level` INT NULL,
  `category` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Academic_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Academic_Info` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Academic_Info` (
  `user_id` INT NOT NULL,
  `date_joining` DATETIME NULL,
  `designation` VARCHAR(45) NULL,
  `payscale` INT NULL,
  `class_hours` INT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Course` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `course_id` INT NOT NULL,
  `course_name` VARCHAR(45) NULL,
  `credit` INT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course_Record`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Course_Record` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Course_Record` (
  `course_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `occurrences` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`, `user_id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AOI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AOI` ;

CREATE TABLE IF NOT EXISTS `mydb`.`AOI` (
  `aoi_id` INT NOT NULL,
  `aoi_name` VARCHAR(45) NULL,
  PRIMARY KEY (`aoi_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_aoi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_aoi` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user_aoi` (
  `user_id` INT NOT NULL,
  `aoi_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `aoi_id`),
  INDEX `aoi_id_idx` (`aoi_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `aoi_id`
    FOREIGN KEY (`aoi_id`)
    REFERENCES `mydb`.`AOI` (`aoi_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`preferences`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`preferences` ;

CREATE TABLE IF NOT EXISTS `mydb`.`preferences` (
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `preference` INT NULL,
  PRIMARY KEY (`user_id`, `course_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

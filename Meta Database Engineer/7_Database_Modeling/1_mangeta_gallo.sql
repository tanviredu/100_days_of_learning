-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mangata_gello
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mangata_gello
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mangata_gello` DEFAULT CHARACTER SET utf8 ;
USE `mangata_gello` ;

-- -----------------------------------------------------
-- Table `mangata_gello`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gello`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gello`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gello`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Cost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mangata_gello`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

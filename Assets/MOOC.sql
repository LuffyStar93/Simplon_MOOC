-- MySQL Script generated by MySQL Workbench
-- Tue Aug 17 17:25:42 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`));


-- -----------------------------------------------------
-- Table `mydb`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rating` (
  `rating_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`rating_id`),
  INDEX `fk_rating_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_rating_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  ` comment_id` INT NOT NULL,
  `comment` VARCHAR(255) NOT NULL,
  PRIMARY KEY (` comment_id`));


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `requirements` VARCHAR(255) NOT NULL,
  `estimated_time` INT NOT NULL,
  `rating_rating_id` INT NOT NULL,
  `comment_ comment_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_rating1_idx` (`rating_rating_id` ASC) VISIBLE,
  INDEX `fk_course_comment1_idx` (`comment_ comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_rating1`
    FOREIGN KEY (`rating_rating_id`)
    REFERENCES `mydb`.`rating` (`rating_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_comment1`
    FOREIGN KEY (`comment_ comment_id`)
    REFERENCES `mydb`.`comment` (` comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `course_course_id` INT NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_category_course1_idx` (`course_course_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_course1`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`course_step`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_step` (
  `course_step_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `content` TEXT(3000) NOT NULL,
  `course_course_id` INT NOT NULL,
  PRIMARY KEY (`course_step_id`),
  INDEX `fk_course_step_course1_idx` (`course_course_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_step_course1`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`user_has_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_has_comment` (
  `user_user_id` INT NOT NULL,
  `comment_ comment_id` INT NOT NULL,
  PRIMARY KEY (`user_user_id`, `comment_ comment_id`),
  INDEX `fk_user_has_comment_comment1_idx` (`comment_ comment_id` ASC) VISIBLE,
  INDEX `fk_user_has_comment_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_comment_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_comment_comment1`
    FOREIGN KEY (`comment_ comment_id`)
    REFERENCES `mydb`.`comment` (` comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`user_has_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_has_course` (
  `user_user_id` INT NOT NULL,
  `course_course_id` INT NOT NULL,
  PRIMARY KEY (`user_user_id`, `course_course_id`),
  INDEX `fk_user_has_course_course1_idx` (`course_course_id` ASC) VISIBLE,
  INDEX `fk_user_has_course_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_course_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_course_course1`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `role_id` INT NOT NULL,
  `role_name` VARCHAR(255) NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`role_id`),
  INDEX `fk_role_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

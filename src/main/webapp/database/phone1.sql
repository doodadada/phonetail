
CREATE TABLE `phonetail`.`member` (
  `membernum` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `zip_num` VARCHAR(45) NOT NULL,
  `address1` VARCHAR(100) NOT NULL,
  `address2` VARCHAR(100) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `datetime` DATETIME NOT NULL DEFAULT now(),
  `usestate` CHAR(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`membernum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE address
(
	zip_num varchar(15) NOT NULL,
	sido varchar(30) NOT NULL,
	gugun varchar(30) NOT NULL,
	dong varchar(30) NOT NULL,
	bunji varchar(20),
	zip_code varchar(30)
	ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci);
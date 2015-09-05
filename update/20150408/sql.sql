/*建立消费者帐号数据表*/
CREATE TABLE `zfwx_people` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `community_id` INT NULL,
  `create_time` DATETIME NULL,
  `lastlogin_time` DATETIME NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC))
ENGINE = MyISAM AUTO_INCREMENT=1;
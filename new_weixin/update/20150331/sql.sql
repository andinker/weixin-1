/* 创建四级区域数据表  */
CREATE TABLE `zfwx_region_province` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `zfwx_region_city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `province_id` INT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `zfwx_region_district` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city_id` INT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `zfwx_region_community` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `district_id` INT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

/* 修改会员帐号数据表，增加社区id列和帐号类型列 */
ALTER TABLE `zfwx_users` 
ADD COLUMN `community_id` INT NOT NULL DEFAULT 0 AFTER `truename`,
ADD COLUMN `account_type` TINYINT NOT NULL DEFAULT 0 AFTER `community_id`;


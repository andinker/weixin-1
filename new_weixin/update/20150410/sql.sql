/* 分类自身特定头部内容 */
ALTER TABLE `zfwx_classify` 
ADD COLUMN `header_content` TEXT NULL AFTER `conttpid`;

/* 所有分类页头统一指定的内容 */
CREATE TABLE `zfwx_wxuser_site_classpagecontent` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(45) NOT NULL,
  `content_html` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;
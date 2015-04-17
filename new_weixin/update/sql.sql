/* 商城设置增加 商城首页的幻灯链接、头部banner、中部banner、背景图和背影色设置 */
ALTER TABLE `zfwx_product_setting` 
ADD COLUMN `piclink1` VARCHAR(200) NULL AFTER `copyright`,
ADD COLUMN `piclink2` VARCHAR(200) NULL AFTER `piclink1`,
ADD COLUMN `piclink3` VARCHAR(200) NULL AFTER `piclink2`,
ADD COLUMN `content_header` TEXT NULL AFTER `piclink3`,
ADD COLUMN `content_middle` TEXT NULL AFTER `content_header`,
ADD COLUMN `background_img` VARCHAR(200) NULL AFTER `content_middle`,
ADD COLUMN `background_color` VARCHAR(45) NULL AFTER `background_img`,
ADD COLUMN `font_color` VARCHAR(45) NULL AFTER `background_color`;

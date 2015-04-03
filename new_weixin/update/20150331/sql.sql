/* ÂàõÂª∫ÂõõÁ∫ßÂå∫ÂüüÊï∞ÊçÆË°®  */
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

<<<<<<< HEAD
/* ‰øÆÊîπ‰ºöÂëòÂ∏êÂè∑Êï∞ÊçÆË°®ÔºåÂ¢ûÂä†Á§æÂå∫idÂàóÂíåÂ∏êÂè∑Á±ªÂûãÂàó */
ALTER TABLE `zfwx_users` 
ADD COLUMN `community_id` INT NOT NULL DEFAULT 0 AFTER `truename`,
ADD COLUMN `account_type` TINYINT NOT NULL DEFAULT 0 AFTER `community_id`;

=======
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (1,'±±æ©','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (2,'…œ∫£','1');	
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (3,'ÃÏΩÚ','1');	  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (4,'÷ÿ«Ï','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (5,'∫⁄¡˙Ω≠','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (6,'º™¡÷','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (7,'¡…ƒ˛','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (8,'ƒ⁄√…π≈','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (9,'ƒ˛œƒ','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (10,'–¬ΩÆ','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (11,'«‡∫£','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (12,'∏ À‡','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (13,'…¬Œ˜','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (14,'∫”±±','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (15,'∫”ƒœ','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (16,'…Ω∂´','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (17,'…ΩŒ˜','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (18,'∫˛±±','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (19,'∫˛ƒœ','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (20,'∞≤ª’','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (21,'Ω≠À’','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (22,'’„Ω≠','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (23,'Ω≠Œ˜','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (24,'π„∂´','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (25,'π„Œ˜','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (26,'∏£Ω®','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (27,'Àƒ¥®','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (28,'‘∆ƒœ','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (29,'πÛ÷›','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (30,'Œ˜≤ÿ','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (31,'∫£ƒœ','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (32,'œ„∏€','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (33,'∞ƒ√≈','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (34,'Ã®ÕÂ','1');


	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('1','±±æ©','1','1');

	   INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('2','…œ∫£','2','1');

	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('3','ÃÏΩÚ','3','1');

	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('4','÷ÿ«Ï','4','1');

	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('5','π˛∂˚±ı','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('6','∆Î∆Îπ˛∂˚','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('7','ƒµµ§Ω≠','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('8','∫◊∏⁄','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('9','À´—º…Ω','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('10','º¶Œ˜','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('11','¥Û«Ï','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('12','“¡¥∫','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('13','º—ƒæÀπ','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('14','∆ﬂÃ®∫”','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('15','∫⁄∫”','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('16','ÀÁªØ','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('17','¥Û–À∞≤¡Î','5','1');
 
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('18','≥§¥∫','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('19','º™¡÷','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('20','Àƒ∆Ω','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('21','¡…‘¥','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('22','Õ®ªØ','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('23','∞◊…Ω','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('24','À…‘≠','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('25','∞◊≥«','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('26','—”±ﬂ≥Øœ ◊Â','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('27','∏ﬂ–¬','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('28','—”º™','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('29','√∑∫”ø⁄','6','1');
  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('30','…Ú—Ù','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('31','¥Û¡¨','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('32','Ωı÷›','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('33','∞∞…Ω','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('34','∏ßÀ≥','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('35','±æœ™','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('36','µ§∂´','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('37','∫˘¬´µ∫','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('38','”™ø⁄','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('39','≈ÃΩı','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('40','∏∑–¬','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('41','¡…—Ù','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('42','Ã˙¡Î','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('43','≥Ø—Ù','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('44','Õﬂ∑øµÍ','7','1');  
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('45','∫Ù∫Õ∫∆Ãÿ','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('46','∞¸Õ∑','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('47','Œ⁄∫£','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('48','≥‡∑Â','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('49','Õ®¡…','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('50','∂ı∂˚∂‡Àπ','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('51','Œ⁄¿º≤Ï≤º√À','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('52','Œ˝¡÷π˘¿’√À','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('53','∞Õ—Âƒ◊∂˚√À','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('54','∞¢¿≠…∆√À','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('55','–À∞≤√À','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('56','∞Õ—Âƒ◊∂˚','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('57','∫Ù¬◊±¥∂˚','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('58','ºØƒ˛','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('59',' Œ⁄¿º∫∆Ãÿ','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('60','Œ˝¡÷∫∆Ãÿ','8','1');
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('61','“¯¥®','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('62',' Ø◊Ï…Ω','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('63','Œ‚÷“','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('64','πÃ‘≠','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('460','÷–Œ¿','9','1');
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('65','Œ⁄¬≥ƒæ∆Î','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('66','øÀ¿≠¬Í“¿','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('67','Õ¬¬≥∑¨','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('68','π˛√‹','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('69','∫ÕÃÔ','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('70','∞¢øÀÀ’','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('71','ø¶ ≤','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('72','øÀ◊Œ¿’À’ø¬∂˚øÀ◊Œ','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('73','∞Õ“Ùπ˘¿„√…π≈','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('74','≤˝º™ªÿ◊Â','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('75','≤©∂˚À˛¿≠√…π≈','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('76','“¡¿Áπ˛»¯øÀ','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('77','À˛≥«','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('78','∞¢¿’Ã©','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('79',' °÷±œΩœÿº∂––’˛µ•Œª','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('82','øÀ¿≠¬Ì“¿','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('83','ø‚∂˚¿’','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('84',' Ø∫”◊”','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('85','Õ¬¬≥∑¨','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('86',' Œ⁄ –','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('87','ø¸ÕÕ','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('89','“¡ƒ˛','10','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('90','Œ˜ƒ˛','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('91','∫£∂´','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('92',' ∫£±±≤ÿ◊Â','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('93','ª∆ƒœ≤ÿ◊Â','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('94','∫£ƒœ≤ÿ◊Â','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('95','π˚¬Â≤ÿ◊Â','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('96','”Ò ˜≤ÿ◊Â','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('97','∫£Œ˜√…π≈◊Â≤ÿ◊Â','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('98','∏Ò∂˚ƒæ','11','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('99','¿º÷›','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('100','ÃÏÀÆ','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('101','Ω≤˝','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('102','∞◊“¯','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('103','ºŒ”¯πÿ','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('104','Œ‰ Õ˛ ','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('105','’≈“¥','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('106','∆Ω¡π','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('107','æ∆»™','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('108','«Ï—Ù','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('109','∂®Œ˜','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('459','¬§ƒœ','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('110','∏ ƒœ≤ÿ◊Â','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('111','¡Ÿœƒªÿ◊Â','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('112','ºŒ”¯','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('113','Œ‰Õ˛','12','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('114','Œ˜∞≤','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('115','±¶º¶','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('116','—”∞≤','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('117','Õ≠¥®','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('118','œÃ—Ù','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('119','Œºƒœ','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('120','∫∫÷–','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('121','”‹¡÷','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('122','∞≤øµ','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('123','…Ã¬Â','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('124','∫´≥«','13','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('125',' Øº“◊Ø','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('126','±£∂®','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('127','Ã∆…Ω','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('128','«ÿª µ∫','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('129','∫™µ¶','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('130','–œÃ®','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('131','’≈º“ø⁄','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('132','≥–µ¬','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('133','≤◊÷›','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('134','¿»∑ª','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('135','∫‚ÀÆ','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('136','∞‘÷›','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('137','«‡œÿ','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('138','»Œ«','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('139','‰√÷›','14','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('140','÷£÷›','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('141','¬Â—Ù','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('142','ø™∑‚','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('143','∆Ω∂•…Ω','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('144','Ωπ◊˜','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('145','∫◊±⁄','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('146','–¬œÁ','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('147','∞≤—Ù','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('148','Âß—Ù','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('149','–Ì≤˝','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('150','‰∫”','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('151','»˝√≈œø','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('152','ƒœ—Ù','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('153','…Ã«','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('154','–≈—Ù','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('155','÷‹ø⁄','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('156','◊§¬ÌµÍ','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('455','º√‘¥','15','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('157','º√ƒœ','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('158','«‡µ∫','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('159','—ÃÃ®','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('160','◊Õ≤©','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('161','‘Ê◊Ø','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('162','∂´”™','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('163','Œ´∑ª','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('164','Õ˛∫£','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('165','º√ƒ˛','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('166','Ã©∞≤','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('167','»’’’','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('168','¿≥Œﬂ','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('169','µ¬÷›','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('170','¡Ÿ“ ','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('171','¡ƒ≥«','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('172','±ı÷›','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('173','∫ ‘Û','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('174','∏ﬂ√‹','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('175','∫…‘Û','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('176','ª¥∑ª','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('177','º¥ƒ´','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('178','Ω∫ƒœ','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('179','¿≥÷›','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('180','¡÷“ ','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('181','¡Ÿ–√','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('182','¡˙ø⁄','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('183','≈Ó¿≥','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('184','«‡÷›','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('185','»È…Ω','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('186',' Ÿπ‚','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('187','Î¯÷›','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('188','Œƒµ«','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('189','’–‘∂','16','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('190','Ã´‘≠','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('191','¥ÛÕ¨','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('192','À∑÷›','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('193','—Ù»™','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('194','≥§÷Œ','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('195','Ω˙≥«','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('461','–√÷›','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('196','Ω˙÷–','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('197','¡Ÿ∑⁄','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('198','‘À≥«','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('199','¬¿¡∫','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('200','∫”ΩÚ','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('201','∫Ó¬Ì','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('202','–¢“Â','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('203','”‹¥Œ','17','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('204','Œ‰∫∫','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('205','ª∆ Ø','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('206','œÂ∑Æ','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('207',' Æ—ﬂ','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('208','æ£÷›','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('209','“À≤˝','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('210','æ£√≈','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('211','∂ı÷›','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('212','–¢∏–','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('213','ª∆∏‘','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('214','œÃƒ˛','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('215','ÀÊ÷›','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('216','∂˜ ©Õ¡º“◊Â√Á◊Â','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('217','∞≤¬Ω','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('218','∂˜ ©','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('219','∫∫ø⁄','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('220','∫∫—Ù','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('221','«±Ω≠','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('222','œ…Ã“','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('223','÷Í÷›','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('456',' °÷±œΩœÿº∂––’˛µ•Œª','18','1');
	
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('224','≥§…≥','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('225','÷Í÷ﬁ','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('226','œÊÃ∂','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('227','∫‚—Ù','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('228','…€—Ù','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('229','‘¿—Ù','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('230','≥£µ¬','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('231','’≈º“ΩÁ','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('232','“Ê—Ù','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('233','≥ª÷›','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('234','”¿÷›','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('235','ª≥ªØ','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('236','¬¶µ◊','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('237','œÊŒ˜Õ¡º“◊Â√Á◊Â','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('238','÷Í÷›','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('239','…€∂´','19','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('240','∫œ∑ ','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('241','Œﬂ∫˛','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('242','∞ˆ≤∫','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('243','ª¥ƒœ','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('244','¬Ì∞∞…Ω','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('245','ª¥±±','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('246','Õ≠¡Í','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('247','∞≤«Ï','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('248','ª∆…Ω','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('249','≥¸÷›','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('250','∏∑—Ù','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('251','Àﬁ÷›','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('252','≥≤∫˛','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('253','¡˘∞≤','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('254','ŸÒ÷›','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('255','≥ÿ÷›','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('256','–˚≥«','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('257','√…≥«','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('258','ƒ˛π˙','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('259','Õ©≥«','20','1');
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('260','ƒœæ©','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('261','–Ï÷›','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('262','¡¨‘∆∏€','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('263','ª¥∞≤','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('264','Àﬁ«®','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('265','—Œ≥«','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('266','—Ô÷›','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('267','Ã©÷›','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('268','ƒœÕ®','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('269','’ÚΩ≠','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('270','≥£÷›','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('271','ŒﬁŒ˝','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('272','À’÷›','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('273','≥£ Ï','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('274','µ§—Ù','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('275','∫£√≈','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('276','Ω≠∂º','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('277','Ω≠“ı','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('278','æ∏Ω≠','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('279','¿•…Ω','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('280','‰‡—Ù','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('281','Ã´≤÷','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('282','Ã©÷›ª™','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('283','Œ‚Ω≠','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('284','Œ‚œÿ','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('285','“À–À','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('286','’≈º“∏€','21','1');
	 
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('287','∫º÷›','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('288','ƒ˛≤®','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('289','Œ¬÷›','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('290','ºŒ–À','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('291','∫˛÷›','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('292','…‹–À','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('293','Ωª™','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('294','·È÷›','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('295','÷€…Ω','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('296','Ã®÷›','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('297','¿ˆÀÆ','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('298','¥»œ™','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('299','∂´—Ù','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('300','∑ÓªØ','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('301','¿÷«Â','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('302','¡Ÿ∞≤','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('303','¡Ÿ∫£','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('304','∆Ω∫˛','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('305','»∞≤','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('306','…œ”›','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('307','·”÷›','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('308','Œ¬¡Î','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('309','“ÂŒ⁄','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('310','”¿øµ','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('311','”‡“¶','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('312','÷ÓÙﬂ','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('313','–¬≤˝','22','1');
	  
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('314','ƒœ≤˝','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('315','æ∞µ¬’Ú','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('316','∆ºœÁ','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('317','–¬”‡','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('318','æ≈Ω≠','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('319','”•Ã∂','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('320','∏”÷›','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('321','º™∞≤','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('322','“À¥∫','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('323','∏ß÷›','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('324','…œ»ƒ','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('325','∏ﬂ∞≤','23','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('326','π„÷›','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('327','…Ó€⁄','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('328','÷È∫£','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('329','…«Õ∑','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('330','…ÿπÿ','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('331','∫”‘¥','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('332','√∑÷›','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('333','ª›÷›','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('334','…«Œ≤','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('335','∂´›∏','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('336','÷–…Ω','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('337','Ω≠√≈','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('338','∑…Ω','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('339','—ÙΩ≠','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('340','’øΩ≠','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('341','√Ø√˚','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('342','’ÿ«Ï','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('343','«Â‘∂','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('344','≥±÷›','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('345','Ω“—Ù','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('346','‘∆∏°','24','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('354','ƒœƒ˛','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('355','¡¯÷›','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('356','π¡÷','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('357','Œ‡÷›','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('358','±±∫£','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('359','∑¿≥«∏€','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('360','«’÷›','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('361','πÛ∏€','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('362','”Ò¡÷','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('363','∞Ÿ…´','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('364','∫ÿ÷›','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('365','∫”≥ÿ','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('366','¿¥±ˆ','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('367','≥Á◊Û','25','1');
	
	 
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('368','∏£÷›','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('369','œ√√≈','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('370','»˝√˜','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('371','∆ŒÃÔ','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('372','»™÷›','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('373','’ƒ÷›','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('374','ƒœ∆Ω','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('375','¡˙—“','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('376','ƒ˛µ¬','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('377','∏£«Â','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('378','Ω®Í±','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('379','Ω˙Ω≠','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('380','ƒœ∞≤','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('381','…€Œ‰','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('382',' Ø ®','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('383','œ…”Œ','26','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('384','≥…∂º','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('385','◊‘π±','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('386','≈ ÷¶ª®','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('387','„Ú÷›','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('388','µ¬—Ù','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('389','√‡—Ù','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('390','π„‘™','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('391','ÀÏƒ˛','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('392','ƒ⁄Ω≠','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('393','¿÷…Ω','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('394','ƒœ≥‰','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('395','“À±ˆ','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('396','π„∞≤','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('397','¥Ô÷›','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('398','∞Õ÷–','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('399','—≈∞≤','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('400','√º…Ω','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('401','◊ —Ù','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('402','∞¢∞”≤ÿ◊Â«º◊Â','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('403','∏ ◊Œ≤ÿ◊Â','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('404','¡π…Ω“Õ◊Â','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('405','π„∫∫','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('406','Ωı—Ù','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('407','Œ˜≤˝','27','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('408','¿•√˜','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('409','«˙æ∏','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('410','”Òœ™','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('411','±£…Ω','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('412','’—Õ®','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('413','Àº√©','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('414','¡Ÿ≤◊','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('415','¿ˆΩ≠','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('416',' Œƒ…Ω◊≥◊Â√Á◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('417','∫Ï∫”π˛ƒ·◊Â“Õ◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('418','Œ˜À´∞Êƒ…¥ˆ◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('419','≥˛–€“Õ◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('420','¥Û¿Ì∞◊◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('421','µ¬∫Í¥ˆ◊Âæ∞∆ƒ◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('422','≈≠Ω≠¿¸¿¸◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('423','µœ«Ï≤ÿ◊Â','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('424','¥Û¿Ì','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('458','∆’∂˝','28','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('425','πÛ—Ù','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('426','¡˘≈ÃÀÆ','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('427','◊Ò“Â','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('428','∞≤À≥','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('429','Õ≠» ','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('430','±œΩ⁄','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('431','«≠Œ˜ƒœ≤º“¿◊Â√Á◊Â','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('432','«≠∂´ƒœ√Á◊Â∂±◊Â','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('433','«≠ƒœ≤º“¿◊Â√Á◊Â','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('434','∂º‘»','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('435','πÛÌ¶','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('436','ø≠¿Ô','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('437','Õ≠» ','29','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('438','¿≠»¯','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('439','ƒ««˙','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('440','≤˝∂º','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('441','…Ωƒœ','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('442','»’ø¶‘Ú','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('443','∞¢¿Ô','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('444','¡÷÷•','30','1');

	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('445','∫£ø⁄','31','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('446','»˝—«','31','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('457',' °÷±œΩœÿº∂––’˛µ•Œª','31','1');
	  
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('447','œ„∏€','32','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('448','∞ƒ√≈','33','1');
	  
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('449','Ã®±±','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('450','∏ﬂ–€','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('451','Ã®÷–','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('452','Ã®ƒœ','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('453','ª˘¬°','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('454','–¬÷Ò','34','1');
  
 		 
 	  
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1','∂´≥«','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2','Œ˜≥«','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3','–˚Œ‰','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('4','≥ÁŒƒ','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('5','≥Ø—Ù','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('6','∫£µÌ','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('7','∑·Ã®','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('8',' Øæ∞…Ω','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('9','√≈Õ∑πµ','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('10','≤˝∆Ω','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('11','¥Û–À','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('12','ª≥»·','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('13','√‹‘∆','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('14','∆Ωπ»','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('15','À≥“Â','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('16','Õ®÷›','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('17','—”«Ï','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('18','∑ø…Ω','1','1');
		
		
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('19','∫”∂´','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('20','∫”Œ˜','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('21','∫”±±','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('22','ƒœø™','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('23','∫Ï«≈','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('24','Ã¡π¡','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('25','∫∫π¡','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('26','¥Û∏€','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('27','∂´¿ˆ','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('28','Œ˜«‡','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('29','ΩÚƒœ','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('30','±±≥Ω','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('31',' Œ‰«Â','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('32','±¶€Ê','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('33','ºªœÿ ','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('34','ƒ˛∫”','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('35','æ≤∫£','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('36','∫Õ∆Ω','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('37','±£À∞','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('38','æ≠º√ºº ıø™∑¢«¯','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('39','∏ﬂ–¬','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('40','±ı∫£–¬','3','1');
			
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('41','≥§∞≤','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('42','«≈∂´','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('43','«≈Œ˜','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('44','–¬ª™','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('45','æÆ⁄ÍøÛ','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('46','‘£ª™','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('47','æÆ⁄Í','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('48','’˝∂®','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('49','ËÔ≥«','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('50','––Ã∆','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('51','¡È Ÿ','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('52','∏ﬂ“ÿ','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('53','…Ó‘Û','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('54','‘ﬁª ','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('55','Œﬁº´','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('56','∆Ω…Ω','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('57','‘™ œ','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('58','’‘œÿ','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('59','–¡ºØ','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('60','ﬁª≥«','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('61','Ω˙÷›','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('62','–¬¿÷','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('63','¬π»™','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('64','∏ﬂ–¬ºº ıø™∑¢«¯','125','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('65','¬∑ƒœ','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('66','¬∑±±','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('67','π≈“±','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('68','ø™∆Ω','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('69','∑·ƒœ','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('70','∑·»Û','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('71','¬–œÿ','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('72','¬–ƒœ','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('73','¿÷Õ§','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('74','«®Œ˜','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('75','”ÒÃÔ','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('76','Ã∆∫£','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('77','◊ÒªØ','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('78','«®∞≤','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('79','∏ﬂ–¬','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('80','∫∫π¡π‹¿Ì','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('81','∫£∏€ø™∑¢«¯','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('82','¬´Ã®ø™∑¢«¯','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('83','ƒœ±§ø™∑¢«¯','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('84','≤‹Â˙µÈπ§“µ','127','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('87','±±¥˜∫”','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('88','«‡¡˙¬˙◊Â','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('89','≤˝¿Ë','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('90','∏ßƒ˛','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('91','¬¨¡˙','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('92','æ≠º√ºº ıø™∑¢«¯','128','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('93','∫™…Ω','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('94','¥‘Ã®','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('95','∏¥–À','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('96','∑Â∑ÂøÛ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('97','∫™µ¶','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('98','¡Ÿ’ƒ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('99','≥…∞≤','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('100','¥Û√˚','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('101','…Êœÿ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('102','¥≈œÿ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('103','∑ œÁ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('104','”¿ƒÍ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('105','«Òœÿ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('106','º¶‘Û','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('107','π„∆Ω','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('108','π›Ã’','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('109','Œ∫œÿ','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('110','«˙÷‹','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('111','Œ‰∞≤','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('112','æ≠º√ø™∑¢«¯','129','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('113','«≈∂´','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('114','«≈Œ˜','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('115','–œÃ®','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('116','¡Ÿ≥«','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('117','ƒ⁄«','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('118','∞ÿœÁ','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('119','¬°“¢','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('120','»Œœÿ','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('121','ƒœ∫Õ','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('122','ƒ˛Ω˙','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('123','æﬁ¬π','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('124','–¬∫”','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('125','π„◊⁄','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('126','∆ΩœÁ','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('127','Õ˛œÿ','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('128','«Â∫”','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('129','¡ŸŒ˜','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('130','ƒœπ¨','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('131','…≥∫”','130','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('132','–¬ –','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('133','ƒœ','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('134','±± –','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('135','¬˙≥«','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('136','«Â‘∑','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('137','‰µÀÆ','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('138','∏∑∆Ω','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('139','–ÏÀÆ','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('140','∂®–À','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('141','Ã∆œÿ','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('142','∏ﬂ—Ù','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('143','»›≥«','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('144','‰µ‘¥','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('145','Õ˚∂º','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('146','∞≤–¬','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('147','“◊œÿ','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('148','«˙—Ù','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('149','Ûªœÿ','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('150','À≥∆Ω','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('151','≤©“∞','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('152','–€œÿ','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('153','‰√÷›','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('154','∂®÷›','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('155','∞≤π˙','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('156','∏ﬂ±ÆµÍ','126','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('159','–˚ªØ','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('160','œ¬ª®‘∞','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('161','–˚ªØ','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('162','’≈±±','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('163','øµ±£','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('164','π¡‘¥','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('165','…–“Â','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('166','Œµœÿ','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('167','—Ù‘≠','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('168','ª≥∞≤','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('169','ÕÚ»´','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('170','ª≥¿¥','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('171','‰√¬π','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('172','≥‡≥«','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('173','≥Á¿Ò','131','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('174','À´«≈','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('175','À´¬–','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('176','”• ÷”™◊”øÛ','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('177','≥–µ¬','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('178','–À¬°','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('179','∆Ω»™','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('180','¬–∆Ω','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('181','¬°ªØ','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('182','∑·ƒ˛¬˙◊Â','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('183','øÌ≥«¬˙◊Â','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('184','Œß≥°¬˙◊Â√…π≈◊Â','132','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('185','–¬ª™','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('186','‘À∫”','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('187','≤◊œÿ','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('188','«‡œÿ','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('189','∂´π‚','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('190','∫£–À','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('191','—Œ…Ω','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('192','À‡ƒ˛','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('193','ƒœ∆§','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('194','Œ‚«≈','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('195','œ◊œÿ','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('196','√œ¥Âªÿ◊Â','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('197','≤¥Õ∑','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('198','»Œ«','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('199','ª∆ÊË','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('200','∫”º‰','133','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('201','∞≤¥Œ','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('202','π„—Ù','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('203','πÃ∞≤','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('204','”¿«Â','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('205','œ„∫”','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('206','¥Û≥«','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('207','Œƒ∞≤','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('208','¥Û≥ßªÿ◊Â','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('209','∞‘÷›','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('210','»˝∫”','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('211','ø™∑¢«¯','134','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('212','Ã“≥«','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('213','‘Ê«ø','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('214','Œ‰“ÿ','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('215','Œ‰«ø','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('216','»ƒ—Ù','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('217','∞≤∆Ω','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('218','π ≥«','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('219','æ∞','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('220','∏∑≥«','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('221','ºΩ÷›','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('222','…Ó÷›','135','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('223','–°µÍ','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('224','”≠‘Û','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('225','–”ª®¡Î','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('226','º‚≤›∆∫','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('227','ÕÚ∞ÿ¡÷','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('228','Ω˙‘¥','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('229','«Â–Ï','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('230','—Ù«˙','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('231','¬¶∑≥','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('232','π≈Ωª','190','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('233','≥«','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('234','øÛ','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('235','ƒœΩº','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('236','–¬»Ÿ','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('237','—Ù∏ﬂ','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('238','ÃÏ’Ú','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('239','π„¡È','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('240','¡È«','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('241','ªÎ‘¥','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('242','◊Û‘∆','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('243','¥ÛÕ¨','191','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('244','≥«','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('245','øÛ','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('246','Ωº','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('247','∆Ω∂®','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('248','”€œÿ','193','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('249','≥«','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('250','Ωº','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('251','≥§÷Œ','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('252','œÂ‘´','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('253','ÕÕ¡Ù','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('254','∆ΩÀ≥','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('255','¿Ë≥«','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('256','∫¯πÿ','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('257','≥§◊”','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('258','Œ‰œÁ','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('259','«ﬂœÿ','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('260','«ﬂ‘¥','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('261','¬∫≥«','194','1');
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('262','≥«','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('263','«ﬂÀÆ','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('264','—Ù≥«','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('265','¡Í¥®','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('266','‘Û÷›','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('267','∏ﬂ∆Ω','195','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('268','À∑≥«','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('269','∆Ω¬≥','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('270','…Ω“ı','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('271','”¶œÿ','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('272','”“”Ò','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('273','ª≥» ','192','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('274','”‹¥Œ','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('275','”‹…Á','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('276','◊Û»®','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('277','∫ÕÀ≥','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('278','ŒÙ—Ù','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('279',' Ÿ—Ù','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('280','Ã´π»','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('281','∆Óœÿ','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('282','∆Ω“£','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('283','¡È Ø','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('284','ΩÈ–›','196','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('285','—Œ∫˛','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('286','¡Ÿ‚¢','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('287','ÕÚ»Ÿ','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('288','Œ≈œ≤','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('289','¢…Ω','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('290','–¬Á≠','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('291','Á≠œÿ','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('292','‘´«˙','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('293','œƒœÿ','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('294','∆Ω¬Ω','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('295','‹«≥«','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('296','”¿º√','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('297','∫”ΩÚ','198','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('298','–√∏Æ','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('299','∂®œÂ','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('300','ŒÂÃ®','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('301','¥˙œÿ','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('302','∑±÷≈','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('303','ƒ˛Œ‰','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('304','æ≤¿÷','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('305','…Ò≥ÿ','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('306','ŒÂ’Ø','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('307','·≥·∞','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('308','∫”«˙','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('309','±£µ¬','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('310','∆´πÿ','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('311','‘≠∆Ω','195','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('312','“¢∂º','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('313','«˙Œ÷','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('314','“Ì≥«','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('315','œÂ∑⁄','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('316','∫È∂¥','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('317','π≈œÿ','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('318','∞≤‘Û','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('319','∏°…Ω','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('320','º™œÿ','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('321','œÁƒ˛','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('322','¥Ûƒ˛','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('323','⁄Ùœÿ','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('324','”¿∫Õ','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('325','∆—œÿ','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('326','∑⁄Œ˜','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('327','∫Ó¬Ì','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('328','ªÙ÷›','197','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('329','¿Î Ø','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('330','ŒƒÀÆ','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('331','Ωª≥«','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('332','–Àœÿ','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('333','¡Ÿœÿ','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('334','¡¯¡÷','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('335',' Ø¬•','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('336','·∞œÿ','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('337','∑Ω…Ω','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('338','÷–—Ù','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('339','Ωªø⁄','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('340','–¢“Â','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('341','∑⁄—Ù','199','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('342','ªÿ√Ò','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('343','”Ò»™','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('344','–¬≥«','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('345','»¸∫±','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('346','Õ¡ƒ¨Ãÿ◊Û∆Ï','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('347','Õ–øÀÕ–','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('348','∫Õ¡÷∏Ò∂˚','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('349','«ÂÀÆ∫”','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('350','Œ‰¥®','45','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('351','∂´∫”','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('352','¿•∂º¬ÿ','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('353','«‡…Ω','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('354',' Øπ’','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('355','∞◊‘∆øÛ','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('356','æ≈‘≠','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('357','Õ¡ƒ¨Ãÿ”“∆Ï','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('358','πÃ—Ù','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('359','¥Ô∂˚∫±√Ø√˜∞≤¡™∫œ∆Ï','46','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('360','∫£≤™ÕÂ','47','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('361','∫£ƒœ','47','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('362','Œ⁄¥Ô','47','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('363','∫Ï…Ω','47','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('364','‘™±¶…Ω','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('365','À……Ω','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('366','∞¢¬≥ø∆∂˚«ﬂ∆Ï','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('367','∞Õ¡÷◊Û∆Ï','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('368','∞Õ¡÷”“∆Ï','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('369','¡÷Œ˜','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('370','øÀ ≤øÀÃ⁄∆Ï','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('371','ŒÃ≈£Ãÿ∆Ï','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('372','ø¶¿Æ«ﬂ∆Ï','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('373','ƒ˛≥«','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('374','∞Ω∫∫∆Ï','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('375','–¬≥«','48','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('376','ø∆∂˚«ﬂ','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('377','ø∆∂˚«ﬂ◊Û“Ì÷–∆Ï','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('378','ø∆∂˚«ﬂ◊Û“Ì∫Û∆Ï','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('379','ø™¬≥','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('380','ø‚¬◊∆Ï','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('381','ƒŒ¬¸∆Ï','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('382','‘˙¬≥Ãÿ∆Ï','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('383','ªÙ¡÷π˘¿’','49','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('384','∂´ §','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('385','¥Ô¿≠Ãÿ∆Ï','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('386','◊º∏Ò∂˚∆Ï','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('387','∂ıÕ–øÀ«∞∆Ï','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('388','∂ıÕ–øÀ∆Ï','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('389','∫ºΩı∆Ï','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('390','Œ⁄…Û∆Ï','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('391','“¡ΩªÙ¬Â∆Ï','50','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('392','∫£¿≠∂˚','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('393','∞¢»Ÿ∆Ï','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('394','ƒ™¡¶¥ÔÕﬂ¥ÔŒ”∂˚◊Â◊‘÷Œ∆Ï','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('395','∂ı¬◊¥∫◊‘÷Œ∆Ï','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('396','∂ıŒ¬øÀ◊Â◊‘÷Œ∆Ï','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('397','≥¬∞Õ∂˚ª¢∆Ï','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('398','–¬∞Õ∂˚ª¢◊Û∆Ï','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('399','–¬∞Õ∂˚ª¢”“∆Ï','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('400','¬˙÷ﬁ¿Ô','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('401','—¿øÀ Ø','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('402','‘˙¿ºÕÕ','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('403','∂Ó∂˚π≈ƒ…','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('404','∏˘∫”','57','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('405','¡Ÿ∫”','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('406','ŒÂ‘≠','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('407','Ì„ø⁄','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('408','Œ⁄¿≠Ãÿ«∞∆Ï','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('409','Œ⁄¿≠Ãÿ÷–∆Ï','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('410','Œ⁄¿≠Ãÿ∫Û∆Ï','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('411','∫ºΩı∫Û∆Ï','53','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('412','ºØƒ˛','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('413','◊ø◊ ','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('414','ªØµ¬','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('415','…Ã∂º','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('416','–À∫Õ','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('417','¡π≥«','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('418','≤Ïπ˛∂˚”““Ì«∞∆Ï','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('419','≤Ïπ˛∂˚”““Ì÷–∆Ï','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('420','≤Ïπ˛∂˚”““Ì∫Û∆Ï','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('421','Àƒ◊”Õı∆Ï','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('422','∑·’Ú','59','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('423','Œ⁄¿º∫∆Ãÿ','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('424','∞¢∂˚…Ω','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('425','ø∆∂˚«ﬂ”““Ì«∞∆Ï','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('426','ø∆∂˚«ﬂ”““Ì÷–∆Ï','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('427','‘˙Í„Ãÿ∆Ï','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('428','Õª»™','55','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('429','∂˛¡¨∫∆Ãÿ','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('430','Œ˝¡÷∫∆Ãÿ','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('431','∞¢∞Õ∏¬∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('432','À’ƒ·Ãÿ◊Û∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('433','À’ƒ·Ãÿ”“∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('434','∂´Œ⁄÷Èƒ¬«ﬂ∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('435','Œ˜Œ⁄÷Èƒ¬«ﬂ∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('436','Ã´∆ÕÀ¬∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('437','œ‚ª∆∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('438','’˝œ‚∞◊∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('439','’˝¿∂∆Ï','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('440','∂‡¬◊','52','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('441','∞¢¿≠…∆◊Û∆Ï','54','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('442','∞¢¿≠…∆”“∆Ï','54','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('443','∂Óº√ƒ…∆Ï','54','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('444','∫Õ∆Ω','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('445','…Ú∫”','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('446','¥Û∂´','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('447','ª π√','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('448','Ã˙Œ˜','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('449','À’º“ÕÕ','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('450','∂´¡Í','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('451','…Ú±±–¬','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('452','”⁄∫È','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('453','¡…÷–','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('454','øµ∆Ω','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('455','∑®ø‚','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('456','–¬√Ò','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('457','æ≠º√ºº ıø™∑¢«¯','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('458','ªÎƒœ–¬','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('459','–¬≥«◊”æ≠º√ºº ıø™∑¢«¯','30','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('460','÷–…Ω','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('461','Œ˜∏⁄','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('462','…≥∫”ø⁄','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('463','∏ æÆ◊”','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('464','¬√À≥ø⁄','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('465','Ω÷›','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('466','≥§∫£','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('467','Õﬂ∑øµÍ','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('468','∆’¿ºµÍ','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('469','◊Ø∫”','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('470','ø™∑¢«¯','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('471','±£À∞','31','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('472','Ã˙∂´','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('473','Ã˙Œ˜','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('474','¡¢…Ω','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('475','«ß…Ω','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('476','Ã®∞≤','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('477','·∂—“¬˙◊Â','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('478','∫£≥«','33','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('479','–¬∏ß','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('480','∂´÷ﬁ','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('481','Õ˚ª®','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('482','À≥≥«','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('483','∏ßÀ≥','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('484','–¬±ˆ¬˙◊Â','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('485','«Â‘≠¬˙◊Â','34','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('486','∆Ω…Ω','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('487','√˜…Ω','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('488','œ™∫˛','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('489','ƒœ∑“','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('490','±æœ™¬˙◊Â','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('491','ª∏» ¬˙◊Â','35','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('492','‘™±¶','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('493','’Ò–À','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('494','’Ò∞≤','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('495','øÌµÈ¬˙◊Â','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('496','∂´∏€','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('497','∑Ô≥«','36','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('498','π≈À˛','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('499','¡Ë∫”','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('500','Ã´∫Õ','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('501','∫⁄…Ω','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('502','“Â','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('503','¡Ë∫£','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('504','±±ƒ˛','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('505','À……Ω–¬','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('506','æ≠º√ºº ıø™∑¢«¯','32','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('507','’æ«∞','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('508','Œ˜','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('509','ˆ—”„»¶','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('510','¿œ±ﬂ','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('511','∏«÷›','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('512','¥Û Ø«≈','38','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('513','∫£÷›','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('514','–¬«Ò','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('515','Ã´∆Ω','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('516','«Â∫”√≈','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('517','œ∏∫”','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('518','∏∑–¬√…π≈◊Â','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('519','’√Œ‰','40','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('520','∞◊À˛','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('521','Œƒ •','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('522','∫ÍŒ∞','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('523','π≠≥§¡Î','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('524','Ã´◊”∫”','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('525','¡…—Ù','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('526','µ∆À˛','41','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('527','À´Ã®◊”','39','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('528','–À¬°Ã®','39','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('529','¥ÛÕ›','39','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('530','≈Ã…Ω','39','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('531','“¯÷›','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('532','«Â∫”','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('533','Ã˙¡Î','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('534','Œ˜∑·','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('535','≤˝Õº','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('536','µ˜±¯…Ω','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('537','ø™‘≠','42','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('538','À´À˛','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('539','¡˙≥«','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('540','≥Ø—Ù','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('541','Ω®∆Ω','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('542','ø¶¿Æ«ﬂ◊Û“Ì√…π≈◊Â','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('543','±±∆±','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('544','¡Ë‘¥','43','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('545','¡¨…Ω','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('546','¡˙∏€','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('547','ƒœ∆±','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('548','ÀÁ÷–','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('549','Ω®≤˝','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('550','–À≥«','37','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('551','ƒœπÿ','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('552','øÌ≥«','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('553','≥Ø—Ù','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('554','∂˛µ¿','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('555','¬Ã‘∞','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('556','À´—Ù','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('557','≈©∞≤','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('558','æ≈Ã®','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('559','”‹ ˜','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('560','µ¬ª›','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('561','æª‘¬æ≠º√ø™∑¢«¯','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('562','∏ﬂ–¬ºº ı≤˙“µø™∑¢«¯','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('563','æ≠º√ºº ıø™∑¢«¯','18','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('564','≤˝“ÿ','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('565','¡˙Ã∂','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('566','¥¨”™','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('567','∑·¬˙','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('568','”¿º™','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('569','Ú‘∫”','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('570','ËÎµÈ','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('571',' Ê¿º','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('572','≈Õ Ø','19','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('573','Ã˙Œ˜','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('574','Ã˙∂´','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('575','¿Ê ˜','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('576','“¡Õ®¬˙◊Â','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('577','π´÷˜¡Î','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('578','À´¡…','20','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('579','¡˙…Ω','21','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('580','Œ˜∞≤','21','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('581','∂´∑·','21','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('582','∂´¡…','21','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('583','∂´≤˝','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('584','∂˛µ¿Ω≠','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('585','Õ®ªØ','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('586','ª‘ƒœ','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('587','¡¯∫”','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('588','√∑∫”ø⁄','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('589','ºØ∞≤','22','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('590','∞Àµ¿Ω≠','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('591','∏ßÀ…','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('592','æ∏”Ó','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('593','≥§∞◊≥Øœ ◊Â','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('594','Ω≠‘¥','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('595','¡ŸΩ≠','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('596','ƒ˛Ω≠','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('597','«∞π˘∂˚¬ﬁÀπ√…π≈◊Â','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('598','≥§¡Î','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('599','«¨∞≤','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('600','∑ˆ”‡','24','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('601','‰¨±±','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('602','’ÚÍ„','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('603','Õ®”‹','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('604','‰¨ƒœ','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('605','¥Û∞≤','25','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('606','—”º™','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('607','Õº√«','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('608','∂ÿªØ','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('609','Áı¥∫','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('610','¡˙æÆ','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('611','∫Õ¡˙','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('612','ÕÙ«Â','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('613','∞≤Õº','26','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('614','µ¿¿Ô','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('615','ƒœ∏⁄','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('616','µ¿Õ‚','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('617','œ„∑ª','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('618','∂Ø¡¶','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('619','∆Ω∑ø','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('620','À…±±','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('621','∫Ù¿º','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('622','“¿¿º','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('623','∑Ω’˝','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('624','±ˆ','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('625','∞Õ—Â','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('626','ƒæ¿º','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('627','Õ®∫”','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('628','—” Ÿ','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('629','∞¢≥«','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('630','À´≥«','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('631','…–÷æ','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('632','ŒÂ≥£','5','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('633','¡˙…≥','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('634','Ω®ª™','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('635','Ã˙∑Ê','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('636','∞∫∞∫œ™','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('637','∏ª¿≠∂˚ª˘','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('638','ƒÎ◊”…Ω','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('639','√∑¿ÔÀπ¥ÔŒ”∂˚◊Â','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('640','¡˙Ω≠','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('641','“¿∞≤','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('642','Ã©¿¥','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('643','∏ ƒœ','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('644','∏ª‘£','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('645','øÀ…Ω','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('646','øÀ∂´','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('647','∞›»™','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('648','⁄´∫”','6','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('649','º¶π⁄','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('650','∫„…Ω','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('651','µŒµ¿','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('652','¿Ê ˜','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('653','≥«◊”∫”','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('654','¬È…Ω','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('655','º¶∂´','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('656','ª¢¡÷','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('657','√‹…Ω','10','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('658','œÚ—Ù','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('659','π§≈©','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('660','ƒœ…Ω','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('661','–À∞≤','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('662','∂´…Ω','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('663','–À…Ω','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('664','¬‹±±','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('665','ÀÁ±ı','8','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('666','º‚…Ω','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('667','¡Î∂´','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('668','Àƒ∑ΩÃ®','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('669','±¶…Ω','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('670','ºØœÕ','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('671','”—“Í','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('672','±¶«Â','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('673','»ƒ∫”','9','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('674','»¯∂˚Õº','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('675','¡˙∑Ô','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('676','»√∫˙¬∑','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('677','∫Ï∏⁄','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('678','¥ÛÕ¨','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('679','’ÿ÷›','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('680','’ÿ‘¥','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('681','¡÷µÈ','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('682','∂≈∂˚≤ÆÃÿ√…π≈◊Â','11','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('683','“¡¥∫','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('684','ƒœ≤Ì','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('685','”—∫√','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('686','Œ˜¡÷','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('687','¥‰¬Õ','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('688','–¬«‡','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('689','√¿œ™','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('690','Ω…ΩÕÕ','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('691','ŒÂ”™','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('692','Œ⁄¬Ì∫”','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('693','Ã¿Õ˙∫”','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('694','¥¯¡Î','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('695','Œ⁄“¡¡Î','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('696','∫Ï–«','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('697','…œ∏ ¡Î','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('698','ºŒ“Ò','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('699','Ã˙¡¶','12','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('700','œÚ—Ù','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('701','«∞Ω¯','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('702','∂´∑Á','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('703','Ωºœÿ','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('704','ËÎƒœ','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('705','ËÎ¥®','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('706','Ã¿‘≠','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('707','∏ß‘∂','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('708','Õ¨Ω≠','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('709','∏ªΩı','13','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('710','–¬–À','14','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('711','Ã“…Ω','14','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('712','«—◊”∫”','14','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('713','≤™¿˚','14','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('714','∂´∞≤','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('715','∞Æ√Ò','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('716','—Ù√˜','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('717','Œ˜∞≤','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('718','∂´ƒ˛','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('719','¡÷ø⁄','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('720','ÀÁ∑“∫”','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('721','∫£¡÷','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('722','ƒ˛∞≤','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('723','ƒ¬¿‚','7','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('724','∞Æª‘','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('725','ƒ€Ω≠','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('726','—∑øÀ','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('727','ÀÔŒ‚','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('728','±±∞≤','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('729','ŒÂ¥Û¡¨≥ÿ','15','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('730','±±¡÷','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('731','Õ˚ø¸','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('732','¿ºŒ˜','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('733','«‡∏‘','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('734','«Ï∞≤','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('735','√˜ÀÆ','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('736','ÀÁ¿‚','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('737','∞≤¥Ô','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('738','’ÿ∂´','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('739','∫£¬◊','16','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('740','∫Ù¬Í','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('741','À˛∫”','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('742','ƒÆ∫”','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('743','º”∏Ò¥Ô∆Ê','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('744','À…¡Î','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('745','–¬¡÷','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('746','∫Ù÷–','17','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('747','ª∆∆÷','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('748','¬¨ÕÂ','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('749','–Ïª„','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('750','≥§ƒ˛','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('751','æ≤∞≤','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('752','∆’Õ”','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('753','’¢±±','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('754','∫Áø⁄','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('755','—Ó∆÷','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('756','„…––','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('757','±¶…Ω','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('758','ºŒ∂®','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('759','∆÷∂´–¬','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('760','Ω…Ω','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('761','À…Ω≠','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('762','«‡∆÷','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('763','ƒœª„','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('764','∑ÓœÕ','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('765','≥Á√˜','2','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('766','–˛Œ‰','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('767','∞◊œ¬','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('768','«ÿª¥','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('769','Ω®⁄˛','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('770','πƒ¬•','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('771','œ¬πÿ','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('772','∆÷ø⁄','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('773','∆‹œº','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('774','”Íª®Ã®','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('775','Ω≠ƒ˛','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('776','¡˘∫œ','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('777','‰‡ÀÆ','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('778','∏ﬂ¥æ','260','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('779','≥Á∞≤','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('780','ƒœ≥§','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('781','±±Ã¡','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('782','Œ˝…Ω','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('783','ª›…Ω','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('784','±ı∫˛','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('785','Ω≠“ı','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('786','“À–À','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('787','–¬œÿ','271','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('788','‘∆¡˙','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('789','πƒ¬•','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('790','æ≈¿Ô','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('791','»™…Ω','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('792','Õ≠…Ω','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('793','º÷ÕÙ','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('794','∑·œÿ','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('795','≈Êœÿ','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('796','Ó°ƒ˛','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('797','–¬“ ','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('798','⁄¸÷›','261','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('799','ÃÏƒ˛','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('800','÷”¬•','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('801','∆› ˚—ﬂ','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('802','–¬±±','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('803','Œ‰Ω¯','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('804','‰‡—Ù','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('805','ΩÃ≥','270','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('806','≤◊¿À','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('807','∆ΩΩ≠','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('808','Ω„—','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('809','ª¢«','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('810','Œ‚÷–','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('811','œ‡≥«','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('812','≥£ Ï','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('813','’≈º“∏€','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('814','¿•…Ω','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('815','Œ‚Ω≠','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('816','Ã´≤÷','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('817','π§“µ‘∞','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('818','∏ﬂ–¬','272','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('819','≥Á¥®','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('820','∏€’¢','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('821','∫£∞≤','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('822','»Á∂´','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('823','∆Ù∂´','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('824','»Á∏ﬁ','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('825','Õ®÷›','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('826','∫£√≈','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('827','æ≠º√ºº ıø™∑¢«¯','268','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('828','¡¨‘∆','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('829','–¬∆÷','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('830','∫£÷›','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('831','∏””‹','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('832','∂´∫£','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('833','π‡‘∆','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('834','π‡ƒœ','262','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('835','«Â∫”','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('836','≥˛÷›','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('837','ª¥“ı','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('838','«Â∆÷','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('839','¡∞ÀÆ','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('840','∫È‘Û','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('841','ÌÏÌÙ','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('842','Ω∫˛','263','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('843','Õ§∫˛','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('844','—Œ∂º','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('845','œÏÀÆ','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('846','±ı∫£','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('847','∏∑ƒ˛','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('848','…‰—Ù','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('849','Ω®∫˛','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('850','∂´Ã®','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('851','¥Û∑·','265','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('852','π„¡Í','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('853','⁄ıΩ≠','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('854','±¶”¶','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('855','“«’˜','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('856','∏ﬂ” ','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('857','Ω≠∂º','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('858','Œ¨—Ô','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('859','æ≠º√ø™∑¢«¯','266','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('860','æ©ø⁄','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('861','»Û÷›','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('862','µ§ÕΩ','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('863','µ§—Ù','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('864','—Ô÷–','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('865','æ‰»›','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('866','–¬œÿ','269','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('867','∫£¡Í','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('868','∏ﬂ∏€','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('869','–ÀªØ','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('870','æ∏Ω≠','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('871','Ã©–À','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('872','Ω™—ﬂ','267','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('873','Àﬁ≥«','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('874','Àﬁ‘•','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('875','„—Ù','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('876','„Ù—Ù','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('877','„Ù∫È','264','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('878','…œ≥«','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('879','œ¬≥«','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('880','Ω≠∏…','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('881','π∞ ˚','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('882','Œ˜∫˛','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('883','±ıΩ≠','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('884','œÙ…Ω','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('885','”‡∫º','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('886','Õ©¬Æ','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('887','¥æ∞≤','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('888','Ω®µ¬','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('889','∏ª—Ù','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('890','¡Ÿ∞≤','287','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('891','∫£ Ô','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('892','Ω≠∂´','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('893','Ω≠±±','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('894','±±¬ÿ','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('895','’Ú∫£','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('896','€¥÷›','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('897','œÛ…Ω','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('898','ƒ˛∫£','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('899','”‡“¶','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('900','¥»œ™','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('901','∑ÓªØ','288','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('902','¬π≥«','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('903','¡˙ÕÂ','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('904','Í±∫£','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('905','∂¥Õ∑','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('906','”¿ºŒ','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('907','∆Ω—Ù','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('908','≤‘ƒœ','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('909','Œƒ≥…','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('910','Ã©À≥','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('911','»∞≤','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('912','¿÷«Â','289','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('913','–„÷ﬁ','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('914','ºŒ…∆','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('915','∫£—Œ','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('916','∫£ƒ˛','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('917','∆Ω∫˛','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('918','Õ©œÁ','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('919','ƒœ∫˛','290','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('920','Œ‚–À','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('921','ƒœ‰±','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('922','µ¬«Â','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('923','≥§–À','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('924','∞≤º™','291','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('925','‘Ω≥«','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('926','…‹–À','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('927','–¬≤˝','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('928','÷ÓÙﬂ','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('929','…œ”›','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('930','·”÷›','292','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('931','Êƒ≥«','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('932','Ω∂´','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('933','Œ‰“Â','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('934','∆÷Ω≠','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('935','≈Õ∞≤','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('936','¿ºœ™','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('937','“ÂŒ⁄','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('938','∂´—Ù','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('939','”¿øµ','293','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('940','ø¬≥«','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('941','·ÈΩ≠','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('942','≥£…Ω','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('943','ø™ªØ','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('944','¡˙”Œ','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('945','Ω≠…Ω','294','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('946','∂®∫£','295','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('947','∆’Õ”','295','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('948','·∑…Ω','295','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('949','·”„Ù','295','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('950','Ω∑Ω≠','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('951','¬∑«≈','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('952','ª∆—“','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('953','”Òª∑','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('954','»˝√≈','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('955','ÃÏÃ®','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('956','œ…æ”','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('957','Œ¬¡Î','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('958','¡Ÿ∫£','296','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('959','¡´∂º','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('960','«‡ÃÔ','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('961','Á∆‘∆','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('962','ÀÏ≤˝','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('963','À…—Ù','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('964','‘∆∫Õ','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('965','«Ï‘™','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('966','æ∞ƒ˛Ó¥◊Â','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('967','¡˙»™','297','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('968','—˛∫£','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('969','¬Æ—Ù','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('970',' Ò…Ω','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('971','∞¸∫”','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('972','≥§∑·','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('973','∑ ∂´','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('974','∑ Œ˜','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('975','æ≠º√ºº ıø™∑¢«¯','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('976','–¬’æ ‘—È','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('977','’˛ŒÒŒƒªØ–¬','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('978','∏ﬂ–¬ºº ı≤˙“µø™∑¢«¯','240','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('979','æµ∫˛','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('980','ØΩ≠','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('981','Œﬂ∫˛','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('982','∑±≤˝','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('983','ƒœ¡Í','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('984','ﬂÆΩ≠','241','1');
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('985','»˝…Ω','241','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('986','¡˙◊”∫˛','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('987','∞ˆ…Ω','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('988','”Ìª·','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('989','ª¥…œ','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('990','ª≥‘∂','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('991','ŒÂ∫”','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('992','πÃ’Ú','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('993','¥ÛÕ®','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('994','ÃÔº“‚÷','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('995','–ªº“ºØ','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('996','∞Àπ´…Ω','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('997','≈ÀºØ','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('998','∑ÔÃ®','243','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('999','”Í…Ω','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1000','ª®…Ω','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1001','Ωº“◊Ø','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1002','µ±Õø','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1003','æ≠º√ºº ıø™∑¢«¯','244','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1004','∂≈ºØ','245','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1005','œ‡…Ω','245','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1006','¡“…Ω','245','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1007','Â°œ™','245','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1008','Õ≠πŸ…Ω','246','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1009',' ®◊”…Ω','246','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1010','Ωºœÿ','246','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1011','Õ≠¡Í','246','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1012','”≠Ω≠','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1013','¥Ûπ€','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1014','ª≥ƒ˛','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1015','Ë»—Ù','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1016','«±…Ω','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1017','Ã´∫˛','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1018','ÀﬁÀ…','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1019','Õ˚Ω≠','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1020','‘¿Œ˜','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1021','Õ©≥«','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1022','“À–„','247','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1023','ÕÕœ™','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1024','ª∆…Ω','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1025','ª’÷›','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1026','Ï®œÿ','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1027','–›ƒ˛','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1028','˜œÿ','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1029','∆Ó√≈','248','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1030','¿≈Á','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1031','ƒœ⁄€','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1032','¿¥∞≤','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1033','»´Ω∑','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1034','∂®‘∂','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1035','∑Ô—Ù','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1036','ÃÏ≥§','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1037','√˜π‚','249','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1038','Ú£÷›','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1039','Ú£∂´','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1040','Ú£»™','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1041','¡Ÿ»™','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1042','Ã´∫Õ','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1043','∏∑ƒœ','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1044','Ú£…œ','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1045','ΩÁ ◊','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1046','æ≠º√ø™∑¢«¯','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1047','à¨«≈','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1048','Ì∏…Ω','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1049','œÙœÿ','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1050','¡ÈËµ','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1051','„Ùœÿ','251','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1052','æ”≥≤','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1053','¬ÆΩ≠','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1054','ŒﬁŒ™','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1055','∫¨…Ω','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1056','∫Õœÿ','252','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1057','Ω∞≤','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1058','‘£∞≤','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1059',' Ÿœÿ','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1060','ªÙ«Ò','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1061',' Ê≥«','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1062','Ω’Ø','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1063','ªÙ…Ω','253','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1064','⁄€≥«','254','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1065','Œ–—Ù','254','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1066','√…≥«','254','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1067','¿˚–¡','254','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1068','πÛ≥ÿ','255','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1069','∂´÷¡','255','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1070',' ØÃ®','255','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1071','«‡—Ù','255','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1072','–˚÷›','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1073','¿…œ™','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1074','π„µ¬','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1075','„˛','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1076','º®œ™','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1077','Ï∫µ¬','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1078','ƒ˛π˙','256','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1079','πƒ¬•','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1080','Ã®Ω≠','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1081','≤÷…Ω','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1082','¬ÌŒ≤','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1083','Ω˙∞≤','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1084','√ˆ∫Ó','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1085','¡¨Ω≠','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1086','¬ﬁ‘¥','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1087','√ˆ«Â','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1088','”¿Ã©','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1089','∆ΩÃ∂','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1090','∏£«Â','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1091','≥§¿÷','368','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1092','Àº√˜','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1093','∫£≤◊','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1094','∫˛¿Ô','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1095','ºØ√¿','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1096','Õ¨∞≤','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1097','œË∞≤','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1098','πƒ¿À”Ï','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1099','œÛ”Ï±£À∞','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1100','ªæÊ∏ﬂ–¬','369','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1101','≥«œ·','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1102','∫≠Ω≠','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1103','¿Û≥«','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1104','–„”Ï','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1105','œ…”Œ','371','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1106','√∑¡–','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1107','»˝‘™','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1108','√˜œ™','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1109','«Â¡˜','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1110','ƒ˛ªØ','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1111','¥ÛÃÔ','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1112','”»œ™','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1113','…≥','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1114','Ω´¿÷','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1115','Ã©ƒ˛','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1116','Ω®ƒ˛','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1117','”¿∞≤','370','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1118','¿≥«','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1119','∑·‘Û','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1120','¬ÂΩ≠','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1121','»™∏€','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1122','ª›∞≤','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1123','∞≤œ™','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1124','”¿¥∫','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1125','µ¬ªØ','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1126','Ω√≈','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1127',' Ø ®','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1128','Ω˙Ω≠','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1129','ƒœ∞≤','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1130','æ≠º√ºº ıø™∑¢«¯','372','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1131','‹º≥«','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1132','¡˙Œƒ','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1133','‘∆œˆ','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1134','’ƒ∆÷','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1135','⁄Ø∞≤','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1136','≥§Ã©','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1137','∂´…Ω','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1138','ƒœæ∏','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1139','∆Ω∫Õ','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1140','ª™∞≤','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1141','¡˙∫£','373','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1142','—”∆Ω','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1143','À≥≤˝','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1144','∆÷≥«','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1145','π‚‘Û','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1146','À…œ™','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1147','’˛∫Õ','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1148','…€Œ‰','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1149','Œ‰“ƒ…Ω','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1150','Ω®Í±','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1151','Ω®—Ù','374','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1152','–¬¬ﬁ','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1153','≥§Õ°','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1154','”¿∂®','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1155','…œ∫º','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1156','Œ‰∆Ω','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1157','¡¨≥«','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1158','’ƒ∆Ω','375','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1159','Ω∂≥«','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1160','œº∆÷','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1161','π≈ÃÔ','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1162','∆¡ƒœ','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1163',' Ÿƒ˛','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1164','÷‹ƒ˛','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1165','Ëœ»Ÿ','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1166','∏£∞≤','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1167','∏£∂¶','376','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1168','∂´∫˛','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1169','Œ˜∫˛','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1170','«‡‘∆∆◊','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1171','ÕÂ¿Ô','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1172','«‡…Ω∫˛','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1173','ƒœ≤˝','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1174','–¬Ω®','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1175','∞≤“Â','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1176','Ω¯œÕ','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1177','æ≠º√ºº ıø™∑¢«¯','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1178','∫Ïπ»Ã≤–¬','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1179','∏ﬂ–¬ºº ı≤˙“µø™∑¢«¯','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1180','…£∫£æ≠º√ºº ıø™∑¢«¯','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1181','”¢–€æ≠º√ø™∑¢«¯','314','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1182','≤˝Ω≠','315','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1183','÷È…Ω','315','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1184','∏°¡∫','315','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1185','¿÷∆Ω','315','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1186','∞≤‘¥','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1187','œÊ∂´','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1188','¡´ª®','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1189','…œ¿ı','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1190','¬´œ™','316','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1191','¬Æ…Ω','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1192','‰±—Ù','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1193','æ≈Ω≠','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1194','Œ‰ƒ˛','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1195','–ﬁÀÆ','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1196','”¿–ﬁ','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1197','µ¬∞≤','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1198','–«◊”','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1199','∂º≤˝','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1200','∫˛ø⁄','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1201','≈Ì‘Û','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1202','»≤˝','318','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1203','”ÂÀÆ','317','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1204','∑÷“À','317','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1205','‘¬∫˛','319','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1206','”‡Ω≠','319','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1207','πÛœ™','319','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1208','’¬π±','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1209','∏”','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1210','–≈∑·','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1211','¥Û”‡','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1212','…œ”Ã','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1213','≥Á“Â','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1214','∞≤‘∂','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1215','¡˙ƒœ','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1216','∂®ƒœ','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1217','»´ƒœ','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1218','ƒ˛∂º','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1219','”⁄∂º','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1220','–Àπ˙','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1221','ª·≤˝','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1222','—∞Œ⁄','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1223',' Ø≥«','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1224','»Ω','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1225','ƒœøµ','320','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1226','º™÷›','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1227','«‡‘≠','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1228','º™∞≤','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1229','º™ÀÆ','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1230','œøΩ≠','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1231','–¬∏…','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1232','”¿∑·','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1233','Ã©∫Õ','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1234','ÀÏ¥®','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1235','ÕÚ∞≤','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1236','∞≤∏£','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1237','”¿–¬','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1238','æÆ∏‘…Ω','321','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1239','‘¨÷›','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1240','∑Ó–¬','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1241','ÕÚ‘ÿ','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1242','…œ∏ﬂ','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1243','“À∑·','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1244','æ∏∞≤','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1245','Õ≠πƒ','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1246','∑·≥«','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1247','’¡ ˜','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1248','∏ﬂ∞≤','322','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1249','¡Ÿ¥®','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1250','ƒœ≥«','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1251','¿Ë¥®','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1252','ƒœ∑·','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1253','≥Á» ','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1254','¿÷∞≤','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1255','“Àª∆','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1256','Ωœ™','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1257','◊ œ™','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1258','∂´œÁ','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1259','π„≤˝','323','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1260','–≈÷›','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1261','…œ»ƒ','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1262','π„∑·','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1263','”Ò…Ω','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1264','«¶…Ω','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1265','∫·∑Â','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1266','ﬂÆ—Ù','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1267','”‡∏…','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1268','€∂—Ù','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1269','ÕÚƒÍ','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1270','Êƒ‘¥','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1271','µ¬–À','324','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1272','¿˙œ¬','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1273',' –÷–','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1274','ª±“Ò','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1275','ÃÏ«≈','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1276','¿˙≥«','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1277','≥§«Â','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1278','∆Ω“ı','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1279','º√—Ù','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1280','…Ã∫”','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1281','’¬«','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1282','∏ﬂ–¬','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1283','æ≠º√ø™∑¢«¯','157','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1284',' –ƒœ','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1285',' –±±','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1286','Àƒ∑Ω','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1287','ª∆µ∫','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1288','·¿…Ω','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1289','¿Ó≤◊','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1290','≥«—Ù','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1291','Ω∫÷›','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1292','º¥ƒ´','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1293','∆Ω∂»','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1294','Ω∫ƒœ','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1295','¿≥Œ˜','158','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1296','◊Õ¥®','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1297','’≈µÍ','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1298','≤©…Ω','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1299','¡Ÿ◊Õ','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1300','÷‹¥Â','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1301','ª∏Ã®','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1302','∏ﬂ«‡','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1303','“ ‘¥','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1304','∏ﬂ–¬','160','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1305',' –÷–','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1306','—¶≥«','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1307','·ª≥«','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1308','Ã®∂˘◊Ø','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1309','…ΩÕ§','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1310','Î¯÷›','161','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1311','∂´”™','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1312','∫”ø⁄','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1313','ø—¿˚','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1314','¿˚ΩÚ','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1315','π„»ƒ','162','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1316','÷•Ó∑','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1317','∏£…Ω','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1318','ƒ≤∆Ω','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1319','¿≥…Ω','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1320','≥§µ∫','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1321','¡˙ø⁄','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1322','¿≥—Ù','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1323','¿≥÷›','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1324','≈Ó¿≥','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1325','’–‘∂','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1326','∆‹œº','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1327','∫£—Ù','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1328','ø™∑¢«¯','159','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1329','Œ´≥«','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1330','∫ÆÕ§','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1331','∑ª◊”','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1332','ø¸Œƒ','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1333','¡ŸÎ‘','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1334','≤˝¿÷','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1335','«‡÷›','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1336','÷Ó≥«','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1337',' Ÿπ‚','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1338','∞≤«','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1339','∏ﬂ√‹','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1340','≤˝“ÿ','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1341','æ≠º√ø™∑¢«¯','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1342','±ı∫£æ≠º√ø™∑¢«¯','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1343','∏ﬂ–¬ºº ıø™∑¢«¯','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1344','≥ˆø⁄º”π§','163','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1345',' –÷–','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1346','»Œ≥«','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1347','Œ¢…Ω','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1348','”„Ã®','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1349','ΩœÁ','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1350','ºŒœÈ','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1351','„Î…œ','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1352','„ÙÀÆ','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1353','¡∫…Ω','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1354','«˙∏∑','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1355','Ÿ÷›','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1356','◊ﬁ≥«','165','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1357','Ã©…Ω','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1358','·∑‘¿','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1359','ƒ˛—Ù','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1360','∂´∆Ω','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1361','–¬Ã©','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1362','∑ ≥«','166','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1363','ª∑¥‰','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1364','Œƒµ«','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1365','»Ÿ≥…','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1366','»È…Ω','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1367','æ≠º√ºº ıø™∑¢«¯','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1368','∏ﬂºº ıø™∑¢«¯','164','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1369','∂´∏€','167','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1370','·∞…Ω','167','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1371','ŒÂ¡´','167','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1372','‹Ï','167','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1373','¿≥≥«','168','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1374','∏÷≥«','168','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1375','¿º…Ω','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1376','¬ﬁ◊Ø','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1377','∫”∂´','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1378','“ ƒœ','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1379','€∞≥«','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1380','“ ÀÆ','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1381','≤‘…Ω','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1382','∑—','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1383','∆Ω“ÿ','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1384','‹Ïƒœ','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1385','√…“ı','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1386','¡Ÿ„','170','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1387','µ¬≥«','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1388','¡Í','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1389','ƒ˛ΩÚ','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1390','«Ï‘∆','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1391','¡Ÿ“ÿ','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1392','∆Î∫”','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1393','∆Ω‘≠','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1394','œƒΩÚ','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1395','Œ‰≥«','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1396','¿÷¡Í','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1397','”Ì≥«','169','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1398','∂´≤˝∏Æ','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1399','—Ùπ»','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1400','›∑','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1401','‹›∆Ω','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1402','∂´∞¢','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1403','π⁄','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1404','∏ﬂÃ∆','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1405','¡Ÿ«Â','171','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1406','±ı≥«','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1407','ª›√Ò','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1408','—Ù–≈','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1409','ŒﬁÈ¶','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1410','’¥ªØ','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1411','≤©–À','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1412','◊ﬁ∆Ω','172','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1413','ƒµµ§','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1414','≤‹','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1415','µ•','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1416','≥…Œ‰','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1417','æﬁ“∞','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1418','€©≥«','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1419','€≤≥«','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1420','∂®Ã’','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1421','∂´√˜','175','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1422','÷–‘≠','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1423','∂˛∆ﬂ','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1424','π‹≥«ªÿ◊Â','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1425','ΩÀÆ','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1426','…œΩ÷','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1427','÷–ƒ≤','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1428','πÆ“Â','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1429','‹˛—Ù','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1430','–¬√‹','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1431','–¬÷£','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1432','µ«∑‚','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1433','∏ﬂ–¬ºº ıø™∑¢«¯','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1434','ª›º√','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1435','æ≠º√ºº ıø™∑¢«¯','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1436','÷£∂´–¬','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1437','≥ˆø⁄º”π§','140','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1438','¡˙Õ§','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1439','À≥∫”ªÿ◊Â','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1440','πƒ¬•','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1441','ËΩ','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1442','Õ®–Ì','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1443','Œæ œ','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1444','ø™∑‚','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1445','¿ºøº','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1446','Ω√˜','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1447','”ÌÕıÃ®','142','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1448','¿œ≥«','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1449','Œ˜π§','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1450','ûe∫”ªÿ◊Â','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1451','ΩßŒ˜','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1452','º™¿˚','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1453','¬Â¡˙','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1454','√œΩÚ','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1455','–¬∞≤','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1456','ËÔ¥®','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1457','·‘œÿ','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1458','»Í—Ù','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1459','“À—Ù','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1460','¬Âƒ˛','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1461','“¡¥®','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1462','Ÿ» ¶','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1463','∏ﬂ–¬ºº ıø™∑¢«¯','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1464','æ≠º√ºº ıø™∑¢«¯','141','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1465','–¬ª™','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1466','Œ¿∂´','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1467',' Ø¡˙','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1468','’ø∫”','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1469','±¶∑·','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1470','“∂œÿ','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1471','¬≥…Ω','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1472','€£','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1473','ŒË∏÷','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1474','»Í÷›','143','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1475','Œƒ∑Â','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1476','±±πÿ','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1477','“Û∂º','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1478','¡˙∞≤','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1479','∞≤—Ù','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1480','Ã¿“ı','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1481','ª¨œÿ','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1482','ƒ⁄ª∆','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1483','¡÷÷›','147','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1484','∫◊…Ω','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1485','…Ω≥«','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1486','‰ø±ı','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1487','ø£œÿ','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1488','‰øœÿ','145','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1489','∫Ï∆Ï','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1490','Œ¿±ı','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1491','∑Ô»™','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1492','ƒ¡“∞','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1493','–¬œÁ','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1494','ªÒºŒ','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1495','‘≠—Ù','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1496','—”ΩÚ','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1497','∑‚«','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1498','≥§‘´','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1499','Œ¿ª‘','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1500','ª‘œÿ','146','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1501','Ω‚∑≈','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1502','÷–’æ','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1503','¬Ì¥Â','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1504','…Ω—Ù','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1505','–ﬁŒ‰','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1506','≤©∞Æ','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1507','Œ‰⁄Ï','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1508','Œ¬œÿ','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1509','«ﬂ—Ù','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1510','√œ÷›','144','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1511','ª™¡˙','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1512','«Â∑·','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1513','ƒœ¿÷','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1514','∑∂œÿ','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1515','Ã®«∞','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1516','Âß—Ù','148','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1517','Œ∫∂º','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1518','–Ì≤˝','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1519','€≥¡Í','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1520','œÂ≥«','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1521','”Ì÷›','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1522','≥§∏','149','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1523','‘¥ª„','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1524','€±≥«','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1525','’Ÿ¡Í','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1526','ŒË—Ù','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1527','¡ŸÚ£','150','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1528','∫˛±ı','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1529','‰≈≥ÿ','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1530','…¬œÿ','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1531','¬¨ œ','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1532','“Â¬Ì','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1533','¡È±¶','151','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1534','Õ≥«','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1535','Œ‘¡˙','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1536','ƒœ’Ÿ','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1537','∑Ω≥«','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1538','Œ˜œø','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1539','’Ú∆Ω','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1540','ƒ⁄œÁ','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1541','‰¿¥®','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1542','…Á∆Ï','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1543','Ã∆∫”','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1544','–¬“∞','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1545','Õ©∞ÿ','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1546','µÀ÷›','152','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1547','¡∫‘∞','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1548','Ó°—Ù','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1549','√Ò»®','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1550','Ó°œÿ','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1551','ƒ˛¡Í','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1552','Ëœ≥«','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1553','”›≥«','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1554','œƒ“ÿ','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1555','”¿≥«','153','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1556','õ∏∫”','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1557','∆Ω«≈','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1558','¬ﬁ…Ω','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1559','π‚…Ω','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1560','–¬œÿ','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1561','…Ã≥«','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1562','πÃ º','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1563','‰Í¥®','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1564','ª¥±ı','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1565','œ¢œÿ','154','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1566','¥®ª„','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1567','∑ˆπµ','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1568','Œ˜ª™','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1569','…ÃÀÆ','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1570','…Ú«','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1571','µ¶≥«','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1572','ª¥—Ù','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1573','Ã´øµ','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1574','¬π“ÿ','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1575','œÓ≥«','155','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1576','Ê‰≥«','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1577','Œ˜∆Ω','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1578','…œ≤Ã','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1579','∆Ω”ﬂ','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1580','’˝—Ù','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1581','»∑…Ω','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1582','√⁄—Ù','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1583','»Íƒœ','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1584','ÀÏ∆Ω','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1585','–¬≤Ã','156','1'); 
			 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1587','Ω≠∞∂','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1588','Ω≠∫∫','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1589','≥~ø⁄','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1590','∫∫—Ù','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1591','Œ‰≤˝','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1592','«‡…Ω','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1593','∫È…Ω','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1594','∂´Œ˜∫˛','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1595','∫∫ƒœ','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1596','≤ÃµÈ','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1597','Ω≠œƒ','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1598','ª∆⁄È','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1599','–¬÷ﬁ','204','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1600','ª∆ Ø∏€','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1601','Œ˜»˚…Ω','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1602','œ¬¬Ω','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1603','Ã˙…Ω','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1604','—Ù–¬','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1605','¥Û“±','205','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1606','√©º˝','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1607','’≈ÕÂ','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1608','‘«','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1609','‘«Œ˜','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1610','÷Ò…Ω','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1611','÷Òœ™','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1612','∑øœÿ','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1613','µ§Ω≠ø⁄','207','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1614','Œ˜¡Í','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1615','ŒÈº“∏⁄','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1616','µ„æ¸','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1617','ÎΩÕ§','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1618','“ƒ¡Í','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1619','‘∂∞≤','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1620','–À…Ω','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1621','ÔˆπÈ','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1622','≥§—ÙÕ¡º“◊Â','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1623','ŒÂ∑ÂÕ¡º“◊Â','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1624','“À∂º','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1625','µ±—Ù','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1626','÷¶Ω≠','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1627','æ≠º√ºº ıø™∑¢«¯','209','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1628','œÂ≥«','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1629','∑Æ≥«','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1630','œÂ—Ù','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1631','ƒœ’ƒ','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1632','π»≥«','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1633','±£øµ','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1634','¿œ∫”ø⁄','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1635','‘Ê—Ù','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1636','“À≥«','206','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1637','¡∫◊”∫˛','211','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1638','ª™»›','211','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1639','∂ı≥«','211','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1640','∂´±¶','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1641','∂ﬁµ∂','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1642','æ©…Ω','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1643','…≥—Û','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1644','÷”œÈ','210','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1645','–¢ƒœ','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1646','–¢≤˝','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1647','¥ÛŒÚ','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1648','‘∆√Œ','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1649','”¶≥«','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1650','∞≤¬Ω','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1651','∫∫¥®','212','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1652','…≥ –','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1653','æ£÷›','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1654','π´∞≤','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1655','º‡¿˚','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1656','Ω≠¡Í','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1657',' Ø ◊','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1658','∫È∫˛','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1659','À…◊Ã','208','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1660','ª∆÷›','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1661','Õ≈∑Á','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1662','∫Ï∞≤','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1663','¬ﬁÃÔ','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1664','”¢…Ω','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1665','‰ªÀÆ','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1666','ﬁ≠¥∫','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1667','ª∆√∑','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1668','¬È≥«','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1669','Œ‰—®','213','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1670','œÃ∞≤','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1671','ºŒ”„','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1672','Õ®≥«','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1673','≥Á—Ù','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1674','Õ®…Ω','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1675','≥‡±⁄','214','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1676','‘¯∂º','215','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1677','π„ÀÆ','215','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1678','∂˜ ©','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1679','¿˚¥®','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1680','Ω® º','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1681','∞Õ∂´','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1682','–˚∂˜','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1683','œÃ∑·','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1684','¿¥∑Ô','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1685','∫◊∑Â','216','1'); 
			 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2997',' °÷±œΩœÿº∂––’˛µ•Œª','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1686','œ…Ã“','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1687','«±Ω≠','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1688','ÃÏ√≈','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1689','…Ò≈©º‹¡÷','450','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1690','‹Ω»ÿ','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1691','ÃÏ–ƒ','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1692','‘¿¬¥','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1693','ø™∏£','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1694','”Íª®','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1695','≥§…≥','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1696','Õ˚≥«','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1697','ƒ˛œÁ','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1698','‰Ø—Ù','224','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1699','∫…Ã¡','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1700','¬´‰¡','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1701',' Ø∑Â','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1702','ÃÏ‘™','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1703','÷Í÷ﬁ','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1704','ÿ¸œÿ','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1705','≤Ë¡Í','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1706','—◊¡Í','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1707','ı∑¡Í','225','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1708','”Í∫˛','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1709','‘¿Ã¡','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1710','œÊÃ∂','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1711','œÊœÁ','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1712','…ÿ…Ω','226','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1713','÷ÈÍÕ','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1714','—„∑Â','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1715',' Øπƒ','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1716','’ÙœÊ','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1717','ƒœ‘¿','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1718','∫‚—Ù','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1719','∫‚ƒœ','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1720','∫‚…Ω','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1721','∫‚∂´','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1722','∆Ó∂´','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1723','ÒÁ—Ù','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1724','≥£ƒ˛','227','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1725','À´«Â','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1726','¥ÛœÈ','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1727','±±À˛','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1728','…€∂´','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1729','–¬…€','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1730','…€—Ù','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1731','¬°ªÿ','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1732','∂¥ø⁄','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1733','ÀÁƒ˛','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1734','–¬ƒ˛','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1735','≥«≤Ω√Á◊Â','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1736','Œ‰∏‘','228','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1737','‘¿—Ù¬•','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1738','‘∆œ™','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1739','æ˝…Ω','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1740','‘¿—Ù','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1741','ª™»›','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1742','œÊ“ı','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1743','∆ΩΩ≠','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1744','„Ë¬ﬁ','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1745','¡ŸœÊ','229','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1746','Œ‰¡Í','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1747','∂¶≥«','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1748','∞≤œÁ','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1749','∫∫ Ÿ','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1750','Â¢','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1751','¡ŸÂ¢','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1752','Ã“‘¥','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1753',' Ø√≈','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1754','ΩÚ –','230','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1755','”¿∂®','231','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1756','Œ‰¡Í‘¥','231','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1757','¥»¿˚','231','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1758','…£÷≤','231','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1759','◊ —Ù','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1760','∫’…Ω','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1761','ƒœœÿ','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1762','Ã“Ω≠','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1763','∞≤ªØ','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1764','„‰Ω≠','232','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1765','±±∫˛','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1766','À’œ…','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1767','π—Ù','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1768','“À’¬','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1769','”¿–À','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1770','ºŒ∫Ã','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1771','¡ŸŒ‰','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1772','»Í≥«','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1773','π∂´','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1774','∞≤» ','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1775','◊ –À','233','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1776','¿‰ÀÆÃ≤','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1777','∆Ó—Ù','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1778','∂´∞≤','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1779','À´≈∆','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1780','µ¿','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1781','Ω≠”¿','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1782','ƒ˛‘∂','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1783','¿∂…Ω','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1784','–¬ÃÔ','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1785','Ω≠ª™—˛◊Â','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1786','¡„¡Í','234','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1787','∫◊≥«','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1788','÷–∑Ω','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1789','„‰¡Í','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1790','≥Ωœ™','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1791','‰”∆÷','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1792','ª·Õ¨','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1793','¬È—Ù√Á◊Â','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1794','–¬ªŒ∂±◊Â','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1795','‹∆Ω≠∂±◊Â','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1796','æ∏÷›√Á◊Â∂±◊Â','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1797','Õ®µ¿∂±◊Â','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1798','∫ÈΩ≠','235','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1799','¬¶–«','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1800','À´∑Â','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1801','–¬ªØ','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1802','¿‰ÀÆΩ≠','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1803','¡∞‘¥','236','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1804','º™ ◊','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1805','„Úœ™','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1806','∑ÔªÀ','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1807','ª®‘´','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1808','±£æ∏','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1809','π≈’…','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1810','”¿À≥','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1811','¡˙…Ω','237','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1812','¿ÛÕÂ','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1813','‘Ω–„','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1814','∫£÷È','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1815','ÃÏ∫”','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1816','∞◊‘∆','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1817','ª∆∆“','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1818','∑¨ÿÆ','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1819','ª®∂º','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1820','‘ˆ≥«','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1821','¥”ªØ','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1822','ƒœ…≥','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1823','¬‹∏⁄','326','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1824','Œ‰Ω≠','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1825','‰•Ω≠','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1826','«˙Ω≠','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1827',' º–À','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1828','» ªØ','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1829','ŒÃ‘¥','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1830','»È‘¥—˛◊Â','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1831','–¬∑·','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1832','¿÷≤˝','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1833','ƒœ–€','330','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1834','¬ﬁ∫˛','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1835','∏£ÃÔ','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1836','ƒœ…Ω','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1837','±¶∞≤','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1838','¡˙∏⁄','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1839','—ŒÃÔ','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1840','π‚√˜–¬','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1841','∆∫…Ω–¬','327','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1842','œ„÷ﬁ','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1843','∂∑√≈','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1844','ΩÕÂ','328','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1845','¡˙∫˛','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1846','Ω∆Ω','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1847','Â©Ω≠','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1848','≥±—Ù','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1849','≥±ƒœ','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1850','≥Œ∫£','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1851','ƒœ∞ƒ','328','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1852','Ï¯≥«','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1853','ƒœ∫£','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1854','À≥µ¬','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1855','»˝ÀÆ','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1856','∏ﬂ√˜','338','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1857','≈ÓΩ≠','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1858','Ω≠∫£','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1859','–¬ª·','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1860','Ã®…Ω','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1861','ø™∆Ω','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1862','∫◊…Ω','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1863','∂˜∆Ω','337','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1864','≥‡ø≤','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1865','œº…Ω','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1866','∆¬Õ∑','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1867','¬È’¬','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1868','ÀÏœ™','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1869','–ÏŒ≈','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1870','¡ÆΩ≠','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1871','¿◊÷›','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1872','Œ‚¥®','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1873','ø™∑¢«¯','340','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1874','√Øƒœ','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1875','√Ø∏€','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1876','µÁ∞◊','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1877','∏ﬂ÷›','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1878','ªØ÷›','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1879','–≈“À','341','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1880','∂À÷›','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1881','∂¶∫˛','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1882','π„ƒ˛','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1883','ª≥ºØ','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1884','∑‚ø™','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1885','µ¬«Ï','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1886','∏ﬂ“™','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1887','Àƒª·','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1888','∏ﬂ–¬ºº ı≤˙“µø™∑¢«¯','342','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1889','ª›≥«','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1890','ª›—Ù','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1891','≤©¬ﬁ','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1892','ª›∂´','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1893','¡˙√≈','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1894','¥Û—«ÕÂ','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1895','÷Ÿ‚˝∏ﬂ–¬','333','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1896','√∑Ω≠','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1897','√∑œÿ','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1898','¥Û∆“','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1899','∑·À≥','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1900','ŒÂª™','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1901','∆Ω‘∂','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1902','Ω∂¡Î','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1903','–Àƒ˛','332','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1904','≥«','334','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1905','¬Ω∑·','334','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1906','∫£∑·','334','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1907','¬Ω∫”','334','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1908','‘¥≥«','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1909','◊œΩ','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1910','¡˙¥®','331','1'); 
		
		
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1911','¡¨∆Ω','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1912','∫Õ∆Ω','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1913','∂´‘¥','331','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1914','Ω≠≥«','339','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1915','—ÙŒ˜','339','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1916','—Ù∂´','339','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1917','—Ù¥∫','339','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1918','«Â≥«','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1919','∑∏‘','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1920','—Ù…Ω','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1921','¡¨…Ω◊≥◊Â—˛◊Â','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1922','¡¨ƒœ—˛◊Â','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1923','«Â–¬','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1924','”¢µ¬','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1925','¡¨÷›','343','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1926','ƒœ≥«','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1927',' Ø¡˙’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1928','≥§∞≤’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1929','ª¢√≈’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1930','∫·¡§’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1931','Âº≤Ω’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1932','ª∆Ω≠’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1933','«Âœ™’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1934','›∏≥«','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1935','ÕÚΩ≠','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1936','∂´≥«','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1937',' ØÌŸ’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1938','≤Ë…Ω’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1939',' Ø≈≈’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1940','∆Û Ø’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1941','«≈Õ∑’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1942','–ª∏⁄’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1943','∂´ø”’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1944','≥£∆Ω’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1945','¥Û¿ ’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1946','Ã¡œ√’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1947','∑Ô∏⁄’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1948','∫ÒΩ÷’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1949','…≥ÃÔ’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1950','µ¿úÚ’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1951','∫È√∑’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1952','¬È”ø’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1953','÷–Ã√’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1954','∏ﬂà∂’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1955','’¡ƒæÕ∑’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1956','¥Û¡Î…Ω’Ú','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1957','Õ˚≈£∂’’Ú','335','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1958','÷–…Ω','336','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1959','œÊ«≈','344','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1960','≥±∞≤','344','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1961','»ƒ∆Ω','344','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1962','È≈≥«','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1963','Ω“∂´','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1964','Ω“Œ˜','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1965','ª›¿¥','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1966','∆’ƒ˛','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1967','∂´…Ω','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1968','∆’«»','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1969','¥Ûƒœ…Ω«»','345','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1970','‘∆≥«','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1971','–¬–À','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1972','”Ùƒœ','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1973','‘∆∞≤','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1974','¬ﬁ∂®','346','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1975','–Àƒ˛','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1976','«‡–„','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1977','Ω≠ƒœ','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1978','Œ˜œÁÃ¡','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1979','¡º«Ï','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1980','Áﬂƒ˛','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1981','Œ‰√˘','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1982','¬°∞≤','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1983','¬Ì…Ω','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1984','…œ¡÷','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1985','±ˆ—Ù','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1986','∫·œÿ','354','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1987','≥«÷–','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1988','”„∑Â','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1989','¡¯ƒœ','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1990','¡¯±±','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1991','¡¯Ω≠','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1992','¡¯≥«','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1993','¬π’Ø','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1994','»⁄∞≤','355','1'); 

			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1995','»⁄ÀÆ√Á◊Â','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1996','»˝Ω≠∂±◊Â','355','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1997','–„∑Â','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1998','µ˛≤ ','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1999','œÛ…Ω','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2000','∆ﬂ–«','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2001','—„…Ω','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2002','—ÙÀ∑','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2003','¡Ÿπ','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2004','¡È¥®','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2005','»´÷›','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2006','–À∞≤','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2007','”¿∏£','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2008','π‡—Ù','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2009','¡˙ §∏˜◊Â','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2010','◊ ‘¥','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2011','∆Ω¿÷','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2012','¿Û∆÷','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2013','πß≥«—˛◊Â','356','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2014','ÕÚ–„','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2015','µ˚…Ω','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2016','≥§÷ﬁ','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2017','≤‘Œ‡','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2018','ÃŸœÿ','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2019','√……Ω','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2020','·Øœ™','357','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2021','∫£≥«','358','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2022','“¯∫£','358','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2023','Ã˙…Ω∏€','358','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2024','∫œ∆÷','358','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2025','∏€ø⁄','359','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2026','∑¿≥«','359','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2027','…œÀº','359','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2028','∂´–À','359','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2029','«’ƒœ','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2030','«’±±','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2031','¡È…Ω','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2032','∆÷±±','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2033','«’÷›∏€æ≠º√ø™∑¢«¯','360','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2034','∏€±±','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2035','∏€ƒœ','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2036','Ò˚Ã¡','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2037','∆Ωƒœ','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2038','π∆Ω','361','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2039','”Ò÷›','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2040','»›œÿ','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2041','¬Ω¥®','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2042','≤©∞◊','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2043','–À“µ','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2044','±±¡˜','362','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2045','”“Ω≠','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2046','ÃÔ—Ù','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2047','ÃÔ∂´','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2048','∆Ωπ˚','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2049','µ¬±£','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2050','æ∏Œ˜','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2051','ƒ«∆¬','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2052','¡Ë‘∆','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2053','¿÷“µ','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2054','ÃÔ¡÷','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2055','Œ˜¡÷','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2056','¬°¡÷∏˜◊Â','363','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2057','∞À≤Ω','364','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2058','’—∆Ω','364','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2059','÷”…Ω','364','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2060','∏ª¥®—˛◊Â','364','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2061','Ω≥«Ω≠','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2062','ƒœµ§','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2063','ÃÏ∂Î','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2064','∑Ô…Ω','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2065','∂´¿º','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2066','¬ﬁ≥«ÿÔ¿–◊Â','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2067','ª∑Ω≠√´ƒœ◊Â','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2068','∞Õ¬Ì—˛◊Â','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2069','∂º∞≤—˛◊Â','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2070','¥ÛªØ—˛◊Â','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2071','“À÷›','365','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2072','–À±ˆ','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2073','–√≥«','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2074','œÛ÷›','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2075','Œ‰–˚','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2076','Ω–„—˛◊Â','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2077','∫œ…Ω','366','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2078','Ω≠÷ﬁ','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2079','∑ˆÀÁ','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2080','ƒ˛√˜','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2081','¡˙÷›','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2082','¥Û–¬','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2083','ÃÏµ»','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2084','∆æœÈ','367','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2085','–„”¢','445','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2086','¡˙ª™','445','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2087','«Ì…Ω','445','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2088','√¿¿º','445','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2089','∫”Œ˜','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2090','∫”∂´','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2091','ÃÔ∂¿’Ú','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2092','∑ÔªÀ’Ú','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2093','»˝—«','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2094','—¬≥«’Ú','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2095','ÃÏ—ƒ’Ú','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2096','”˝≤≈œÁ','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2097','∫£ÃƒÕÂ’Ú','446','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2098','ŒÂ÷∏…Ω','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2099','«Ì∫£','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2100','ŸŸ÷›','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2101','Œƒ≤˝','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2102','ÕÚƒ˛','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2103','∂´∑Ω','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2104','∂®∞≤','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2105','ÕÕ≤˝','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2106','≥Œ¬ı','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2107','¡Ÿ∏ﬂ','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2108','∞◊…≥¿Ë◊Â','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2109','≤˝Ω≠¿Ë◊Â','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2110','¿÷∂´¿Ë◊Â','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2111','¡ÍÀÆ¿Ë◊Â','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2112','±£Õ§¿Ë◊Â√Á◊Â','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2113','«Ì÷–¿Ë◊Â√Á◊Â','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2114','Œ˜°¢ƒœ°¢÷–…≥»∫µ∫∞Ï ¬¥¶','457','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2115','ÕÚ÷›','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2116','∏¢¡Í','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2117','”Â÷–','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2118','¥Û∂…ø⁄','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2119','Ω≠±±','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2120','…≥∆∫∞”','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2121','æ≈¡˙∆¬','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2122','ƒœ∞∂','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2123','±±Ì’','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2124','ÕÚ ¢','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2125','À´«≈','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2126','”Â±±','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2127','∞Õƒœ','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2128','«≠Ω≠','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2129','≥§ Ÿ','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2130','ÙÎΩ≠','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2131','‰¸ƒœ','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2132','Õ≠¡∫','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2133','¥Û◊„','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2134','»Ÿ≤˝','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2135','Ëµ…Ω','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2136','¡∫∆Ω','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2137','≥«ø⁄','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2138','∑·∂º','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2139','µÊΩ≠','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2140','Œ‰¬°','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2141','÷“œÿ','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2142','ø™œÿ','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2143','‘∆—Ù','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2144','∑ÓΩ⁄','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2145','Œ◊…Ω','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2146','Œ◊œ™','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2147',' Ø÷˘Õ¡º“◊Â','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2148','–„…ΩÕ¡º“◊Â√Á◊Â','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2149','”œ—ÙÕ¡º“◊Â√Á◊Â','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2150','≈ÌÀÆ√Á◊ÂÕ¡º“◊Â','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2151','∏ﬂ–¬','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2152','Ω≠ΩÚ','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2153','∫œ¥®','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2154','”¿¥®','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2155','ƒœ¥®','4','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2156','ΩıΩ≠','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2157','«‡—Ú','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2158','Ω≈£','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2159','Œ‰∫Ó','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2160','≥…ª™','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2161','¡˙»™Ê‰','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2162','«‡∞◊Ω≠','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2163','–¬∂º','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2164','Œ¬Ω≠','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2165','ΩÃ√','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2166','À´¡˜','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2167','€Øœÿ','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2168','¥Û“ÿ','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2169','∆—Ω≠','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2170','–¬ΩÚ','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2171','∂ºΩ≠—ﬂ','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2172','≈Ì÷›','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2173','⁄ˆ·¡','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2174','≥Á÷›','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2175','∏ﬂ–¬','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2176','∏ﬂ–¬Œ˜','384','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2177','◊‘¡˜æÆ','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2178','π±æÆ','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2179','¥Û∞≤','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2180','—ÿÃ≤','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2181','»Ÿœÿ','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2182','∏ªÀ≥','385','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2183','∂´','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2184','Œ˜','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2185','» ∫Õ','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2186','√◊“◊','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2187','—Œ±ﬂ','386','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2188','Ω≠—Ù','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2189','ƒ…œ™','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2190','¡˙¬ÌÃ∂','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2191','„Úœÿ','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2192','∫œΩ≠','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2193','–”¿','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2194','π≈›˛','387','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2195','Ï∫—Ù','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2196','÷–Ω≠','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2197','¬ﬁΩ≠','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2198','π„∫∫','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2199',' ≤⁄˙','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2200','√‡÷Ò','388','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2201','∏¢≥«','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2202','”Œœ…','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2203','»˝Ã®','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2204','—ŒÕ§','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2205','∞≤œÿ','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2206','Ë˜‰¸','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2207','±±¥®«º◊Â','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2208','∆ΩŒ‰','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2209','Ω≠”Õ','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2210','≈©ø∆','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2211','æ≠º√ºº ıø™∑¢«¯','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2212','∏ﬂ–¬','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2213','œ…∫£','389','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2214','¿˚÷›','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2215','‘™∞”','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2216','≥ØÃÏ','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2217','Õ˙≤‘','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2218','«‡¥®','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2219','Ω£∏Û','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2220','≤‘œ™','390','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2221','¥¨…Ω','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2222','∞≤æ”','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2223','≈Óœ™','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2224','…‰∫È','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2225','¥Û”¢','391','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2226',' –÷–','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2227','∂´–À','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2228','Õ˛‘∂','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2229','◊ ÷–','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2230','¬°≤˝','392','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2231',' –÷–','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2232','…≥ÕÂ','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2233','ŒÂÕ®«≈','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2234','Ωø⁄∫”','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2235','Í˘Œ™','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2236','æÆ—–','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2237','º–Ω≠','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2238','„Â¥®','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2239','∂Î±ﬂ“Õ◊Â','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2240','¬Ì±ﬂ“Õ◊Â','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2241','∂Î√º…Ω','393','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2242','À≥«Ï','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2243','∏ﬂ∆∫','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2244','ºŒ¡Í','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2245','ƒœ≤ø','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2246','”™…Ω','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2247','≈Ó∞≤','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2248','“«¬§','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2249','Œ˜≥‰','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2250','„œ÷–','394','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2251','∂´∆¬','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2252','»  Ÿ','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2253','≈Ì…Ω','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2254','∫È—≈','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2255','µ§¿‚','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2256','«‡…Ò','400','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2257','¥‰∆¡','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2258','“À±ˆ','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2259','ƒœœ™','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2260','Ω≠∞≤','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2261','≥§ƒ˛','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2262','∏ﬂœÿ','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2263','ÁÓœÿ','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2264','Ûﬁ¡¨','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2265','–ÀŒƒ','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2266','∆¡…Ω','395','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2267','π„∞≤','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2268','‘¿≥ÿ','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2269','Œ‰ §','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2270','¡⁄ÀÆ','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2271','ª™›ˆ','396','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2272','Õ®¥®','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2273','¥Ôœÿ','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2274','–˚∫∫','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2275','ø™Ω≠','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2276','¥Û÷Ò','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2277','«˛œÿ','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2278','ÕÚ‘¥','397','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2279','”Í≥«','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2280','√˚…Ω','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2281','‹˛æ≠','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2282','∫∫‘¥','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2283',' Ø√ﬁ','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2284','ÃÏ»´','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2285','¬´…Ω','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2286','±¶–À','399','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2287','∞Õ÷›','398','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2288','Õ®Ω≠','398','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2289','ƒœΩ≠','398','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2290','∆Ω≤˝','398','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2291','—„Ω≠','401','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2292','∞≤‘¿','401','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2293','¿÷÷¡','401','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2294','ºÚ—Ù','401','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2295','„Î¥®','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2296','¿Ìœÿ','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2297','√Øœÿ','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2298','À…≈À','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2299','æ≈’Øπµ','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2300','Ω¥®','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2301','–°Ω','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2302','∫⁄ÀÆ','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2303','¬Ì∂˚øµ','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2304','»¿Ã¡','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2305','∞¢∞”','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2306','»Ù∂˚∏«','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2307','∫Ï‘≠','402','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2308','øµ∂®','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2309','„Ú∂®','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2310','µ§∞Õ','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2311','æ≈¡˙','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2312','—≈Ω≠','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2313','µ¿Ê⁄','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2314','¬ØªÙ','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2315','∏ ◊Œ','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2316','–¬¡˙','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2317','µ¬∏Ò','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2318','∞◊”Ò','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2319',' Ø«˛','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2320','…´¥Ô','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2321','¿ÌÃ¡','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2322','∞ÕÃ¡','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2323','œÁ≥«','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2324','µæ≥«','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2325','µ√»Ÿ','403','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2326','Œ˜≤˝','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2327','ƒæ¿Ô≤ÿ◊Â','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2328','—Œ‘¥','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2329','µ¬≤˝','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2330','ª·¿Ì','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2331','ª·∂´','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2332','ƒ˛ƒœ','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2333','∆’∏Ò','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2334','≤ºÕœ','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2335','Ω—Ù','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2336','’—æı','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2337','œ≤µ¬','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2338','√·ƒ˛','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2339','‘ΩŒ˜','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2340','∏ ¬Â','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2341','√¿π√','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2342','¿◊≤®','404','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2343','ƒœ√˜','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2344','‘∆—“','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2345','ª®œ™','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2346','Œ⁄µ±','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2347','∞◊‘∆','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2348','–°∫”','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2349','ø™—Ù','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2350','œ¢∑È','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2351','–ﬁŒƒ','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2352','«Â’Ú','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2353','Ω—Ù–¬','425','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2354','÷”…Ω','426','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2355','¡˘÷¶Ãÿ','426','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2356','ÀÆ≥«','426','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2357','≈Ãœÿ','426','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2358','∫Ïª®∏⁄','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2359','ª„¥®','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2360','◊Ò“Â','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2361','Õ©Ë˜','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2362','ÀÁ—Ù','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2363','’˝∞≤','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2364','µ¿’ÊÿÓ¿–◊Â√Á◊Â','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2365','ŒÒ¥®ÿÓ¿–◊Â√Á◊Â','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2366','∑Ô∏‘','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2367','‰ÿÃ∂','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2368','”‡«Ï','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2369','œ∞ÀÆ','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2370','≥‡ÀÆ','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2371','» ª≥','427','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2372','Œ˜–„','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2373','∆Ω∞”','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2374','∆’∂®','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2375','’Úƒ˛≤º“¿◊Â√Á◊Â','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2376','πÿ¡Î≤º“¿◊Â√Á◊Â','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2377','◊œ‘∆√Á◊Â≤º“¿◊Â','428','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2378','Õ≠» ','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2379','Ω≠ø⁄','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2380','”Ò∆¡∂±◊Â','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2381',' Ø⁄‰','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2382','Àºƒœ','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2383','”°Ω≠Õ¡º“◊Â√Á◊Â','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2384','µ¬Ω≠','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2385','—ÿ∫”Õ¡º“◊Â','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2386','À…Ã“√Á◊Â','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2387','ÕÚ…ΩÃÿ','429','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2388','–À“Â','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2389','–À» ','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2390','∆’∞≤','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2391','«Á¬°','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2392','’Í∑·','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2393','Õ˚⁄”','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2394','≤·∫‡','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2395','∞≤¡˙','431','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2396','±œΩ⁄','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2397','¥Û∑Ω','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2398','«≠Œ˜','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2399','Ω…≥','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2400','÷ØΩ','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2401','ƒ…”∫','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2402','Õ˛ƒ˛“Õ◊Âªÿ◊Â√Á◊Â','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2403','∫’’¬','430','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2404','ø≠¿Ô','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2405','ª∆∆Ω','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2406',' ©±¸','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2407','»˝ÀÎ','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2408','’Ú‘∂','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2409','·ØπÆ','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2410','ÃÏ÷˘','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2411','Ωı∆¡','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2412','Ω£∫”','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2413','Ã®Ω≠','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2414','¿Ë∆Ω','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2415','È≈Ω≠','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2416','¥”Ω≠','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2417','¿◊…Ω','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2418','¬ÈΩ≠','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2419','µ§’Ø','432','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2420','∂º‘»','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2421','∏£»™','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2422','¿Û≤®','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2423','πÛ∂®','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2424','ŒÕ∞≤','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2425','∂¿…Ω','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2426','∆ΩÃ¡','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2427','¬ﬁµÈ','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2428','≥§À≥','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2429','¡˙¿Ô','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2430','ª›ÀÆ','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2431','»˝∂ºÀÆ◊Â','433','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2432','ŒÂª™','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2433','≈Ã¡˙','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2434','πŸ∂…','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2435','Œ˜…Ω','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2436','∂´¥®','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2437','≥ π±','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2438','Ω˙ƒ˛','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2439','∏ª√Ò','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2440','“À¡º','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2441',' Ø¡÷“Õ◊Â','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2442','·‘√˜','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2443','¬ª»∞“Õ◊Â√Á◊Â','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2444','—∞µÈªÿ◊Â“Õ◊Â','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2445','∞≤ƒ˛','408','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2446','˜Ë˜Î','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2447','¬Ì¡˙','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2448','¬Ω¡º','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2449',' ¶◊⁄','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2450','¬ﬁ∆Ω','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2451','∏ª‘¥','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2452','ª·‘Û','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2453','’¥“Ê','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2454','–˚Õ˛','409','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2455','∫ÏÀ˛','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2456','Ω≠¥®','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2457','≥ŒΩ≠','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2458','Õ®∫£','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2459','ª™ƒ˛','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2460','“◊√≈','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2461','∂Î…Ω“Õ◊Â','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2462','–¬∆Ω“Õ◊Â¥ˆ◊Â','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2463','‘™Ω≠π˛ƒ·◊Â“Õ◊Â¥ˆ◊Â','410','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2464','¬°—Ù','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2465',' ©µÈ','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2466','Ã⁄≥Â','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2467','¡˙¡Í','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2468','≤˝ƒ˛','411','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2469','’——Ù','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2470','¬≥µÈ','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2471','«…º“','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2472','—ŒΩÚ','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2473','¥Ûπÿ','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2474','”¿…∆','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2475','ÀÁΩ≠','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2476','’Ú–€','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2477','“Õ¡º','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2478','Õ˛–≈','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2479','ÀÆ∏ª','412','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2480','π≈≥«','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2481','”Ò¡˙ƒ…Œ˜◊Â','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2482','”¿ §','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2483','ª™∆∫','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2484','ƒ˛›ı“Õ◊Â','415','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2485','Àº√©','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2486','ƒ˛∂˝π˛ƒ·◊Â“Õ◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2487','ƒ´Ω≠π˛ƒ·◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2488','æ∞∂´“Õ◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2489','æ∞π»¥ˆ◊Â“Õ◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2490','’Ú„‰“Õ◊Âπ˛ƒ·◊Â¿≠ÏÔ◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2491','Ω≠≥«π˛ƒ·◊Â“Õ◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2492','√œ¡¨¥ˆ◊Â¿≠ÏÔ◊ÂÿÙ◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2493','¿Ω≤◊¿≠ÏÔ◊Â','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2494','Œ˜√ÀÿÙ◊Â','458','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2495','¡ŸœË','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2496','∑Ô«Ï','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2497','‘∆œÿ','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2498','”¿µ¬','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2499','’Úøµ','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2500','À´Ω≠¿≠ÏÔ◊ÂÿÙ◊Â≤º¿ ◊Â¥ˆ◊Â','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2501','π¢¬Ì¥ˆ◊ÂÿÙ◊Â','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2502','≤◊‘¥ÿÙ◊Â','414','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2503','≥˛–€','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2504','À´∞ÿ','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2505','ƒ≤∂®','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2506','ƒœª™','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2507','“¶∞≤','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2508','¥Û“¶','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2509','”¿» ','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2510','‘™ƒ±','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2511','Œ‰∂®','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2512','¬ª∑·','419','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2513','∏ˆæ…','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2514','ø™‘∂','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2515','√…◊‘','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2516','∆¡±ﬂ√Á◊Â','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2517','Ω®ÀÆ','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2518',' Ø∆¡','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2519','√÷¿’','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2520','„ÚŒ˜','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2521','‘™—Ù','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2522','∫Ï∫”','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2523','Ω∆Ω√Á◊Â—˛◊Â¥ˆ◊Â','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2524','¬Ã¥∫','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2525','∫”ø⁄—˛◊Â','417','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2526','Œƒ…Ω','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2527','—‚…Ω','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2528','Œ˜≥Î','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2529','¬È¿ı∆¬','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2530','¬Ìπÿ','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2531','«±±','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2532','π„ƒœ','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2533','∏ªƒ˛','416','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2534','æ∞∫È','418','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2535','€¬∫£','418','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2536','€¬¿∞','418','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2537','¥Û¿Ì','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2538','—˙Â®“Õ◊Â','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2539','œÈ‘∆','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2540','±ˆ¥®','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2541','√÷∂…','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2542','ƒœΩß“Õ◊Â','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2543','Œ°…Ω“Õ◊Âªÿ◊Â','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2544','”¿∆Ω','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2545','‘∆¡˙','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2546','∂˝‘¥','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2547','Ω£¥®','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2548','∫◊«Ï','420','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2549','»¿ˆ','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2550','¬∫Œ˜','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2551','¡∫∫”','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2552','”ØΩ≠','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2553','¬§¥®','421','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2554','„ÚÀÆ','422','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2555','∏£π±','422','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2556','π±…Ω∂¿¡˙◊Â≈≠◊Â','422','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2557','¿º∆∫∞◊◊Â∆’√◊◊Â','422','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2558','œ„∏Ò¿Ô¿≠','423','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2559','µ¬«’','423','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2560','Œ¨Œ˜¿¸À€◊Â','423','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2561','≥«πÿ','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2562','¡÷÷‹','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2563','µ±–€','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2564','ƒ·ƒæ','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2565','«˙ÀÆ','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2566','∂—¡˙µ¬«Ï','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2567','¥Ô◊Œ','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2568','ƒ´÷Òπ§ø®','438','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2569','≤˝∂º','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2570','Ω≠¥Ô','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2571','π±æı','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2572','¿‡Œ⁄∆Î','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2573','∂°«‡','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2574','≤Ï—≈','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2575','∞ÀÀﬁ','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2576','◊Ûπ±','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2577','√¢øµ','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2578','¬Â¬°','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2579','±ﬂ∞”','440','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2580','ƒÀ∂´','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2581','‘˙ƒ“','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2582','π±∏¬','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2583','…£»’','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2584','«ÌΩ·','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2585','«˙À…','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2586','¥Î√¿','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2587','¬Â‘˙','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2588','º”≤È','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2589','¬°◊”','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2590','¥Ìƒ«','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2591','¿Àø®◊”','441','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2592','»’ø¶‘Ú','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2593','ƒœƒæ¡÷','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2594','Ω≠◊Œ','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2595','∂®»’','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2596','»¯Â»','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2597','¿≠◊Œ','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2598','∞∫» ','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2599','–ªÕ®√≈','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2600','∞◊¿ ','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2601','» ≤º','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2602','øµ¬Ì','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2603','∂®Ω·','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2604','÷Ÿ∞Õ','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2605','—«∂´','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2606','º™¬°','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2607','ƒÙ¿≠ƒæ','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2608','»¯∏¬','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2609','∏⁄∞Õ','442','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2610','ƒ««˙','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2611','ºŒ¿Ë','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2612','±»»Á','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2613','ƒÙ»Ÿ','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2614','∞≤∂‡','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2615','…Í‘˙','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2616','À˜','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2617','∞‡∏Í','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2618','∞Õ«‡','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2619','ƒ·¬Í','439','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2620','∆’¿º','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2621','‘˝¥Ô','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2622','∏¡∂˚','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2623','»’Õ¡','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2624','∏Ôº™','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2625','∏ƒ‘Ú','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2626','¥Î«⁄','443','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2627','¡÷÷•','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2628','π§≤ºΩ≠¥Ô','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2629','√◊¡÷','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2630','ƒ´Õ—','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2631','≤®√‹','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2632','≤Ï”Á','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2633','¿ œÿ','444','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2634','–¬≥«','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2635','±Æ¡÷','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2636','¡´∫˛','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2637','Â±«≈','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2638','Œ¥—Î','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2639','—„À˛','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2640','—÷¡º','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2641','¡Ÿ‰¸','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2642','≥§∞≤','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2643','¿∂ÃÔ','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2644','÷‹÷¡','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2645','ªßœÿ','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2646','∏ﬂ¡Í','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2647','∏ﬂ–¬','114','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2648','Õı“Ê','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2649','”°Ã®','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2650','“´÷›','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2651','“Àæ˝','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2652','–¬','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2653','Œº±ı','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2654','ΩÃ®','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2655','≥¬≤÷','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2656','∑ÔœË','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2657','·™…Ω','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2658','∑ˆ∑Á','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2659','√ºœÿ','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2660','¬§œÿ','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2661','«ß—Ù','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2662','˜Î”Œ','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2663','∑Ô','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2664','Ã´∞◊','115','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2665','«ÿ∂º','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2666','Œº≥«','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2667','—Ó¡Í','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2668','»˝‘≠','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2669','„˛—Ù','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2670','–À∆Ω','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2671','«¨œÿ','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2672','¿Ò»™','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2673','”¿ Ÿ','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2674','±Úœÿ','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2675','≥§Œ‰','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2676','—Æ“ÿ','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2677','¥æªØ','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2678','Œ‰π¶','118','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2679','¡ŸŒº','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2680','ª™œÿ','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2681','‰¸πÿ','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2682','¥Û¿Û','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2683','∫œ—Ù','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2684','≥Œ≥«','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2685','∆—≥«','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2686','∞◊ÀÆ','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2687','∏ª∆Ω','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2688','∫´≥«','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2689','ª™“ı','119','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2690','±¶À˛','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2691','—”≥§','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2692','—”¥®','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2693','◊”≥§','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2694','∞≤»˚','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2695','÷æµ§','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2696','Œ‚∆Ï','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2697','∏ »™','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2698','∏ª','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2699','¬Â¥®','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2700','“À¥®','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2701','ª∆¡˙','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2702','ª∆¡Í','116','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2703','∫∫Ã®','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2704','ƒœ÷£','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2705','≥«πÃ','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2706','—Û','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2707','Œ˜œÁ','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2708','√„œÿ','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2709','ƒ˛«ø','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2710','¬‘—Ù','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2711','’Ú∞Õ','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2712','¡Ù∞”','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2713','∑∆∫','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2714','æ≠º√ø™∑¢«¯','120','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2715','”‹—Ù','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2716','…Òƒæ','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2717','∏Æπ»','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2718','∫·…Ω','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2719','æ∏±ﬂ','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2720','∂®±ﬂ','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2721','ÀÁµ¬','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2722','√◊÷¨','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2723','º—œÿ','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2724','Œ‚±§','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2725','«ÂΩß','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2726','◊”÷ﬁ','121','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2727','∫∫±ı','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2728','∫∫“ı','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2729',' Ø»™','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2730','ƒ˛…¬','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2731','◊œ—Ù','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2732','·∞∏ﬁ','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2733','∆Ω¿˚','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2734','’Ú∆∫','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2735','—Æ—Ù','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2736','∞◊∫”','122','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2737','…Ã÷›','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2738','¬Âƒœ','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2739','µ§∑Ô','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2740','…Ãƒœ','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2741','…Ω—Ù','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2742','’Ú∞≤','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2743','◊ıÀÆ','123','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2744','≥«πÿ','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2745','∆ﬂ¿Ô∫”','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2746','Œ˜πÃ','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2747','∞≤ƒ˛','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2748','∫Ïπ≈','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2749','”¿µ«','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2750','∏ﬁ¿º','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2751','”‹÷–','99','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2752','ºŒ”¯πÿ','103','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2753','Ω¥®','101','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2754','”¿≤˝','101','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2755','∞◊“¯','102','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2756','∆Ω¥®','102','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2757','æ∏‘∂','102','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2758','ª·ƒ˛','102','1'); 
		
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2759','æ∞Ã©','102','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2760','«ÿ÷›','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2761','¬Ûª˝','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2762','«ÂÀÆ','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2763','«ÿ∞≤','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2764','∏ π»','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2765','Œ‰…Ω','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2766','’≈º“¥®ªÿ◊Â','100','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2767','¡π÷›','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2768','√Ò«⁄','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2769','π≈¿À','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2770','ÃÏ◊£≤ÿ◊Â','104','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2771','∏ ÷›','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2772','À‡ƒœ‘£πÃ◊Â','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2773','√Ò¿÷','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2774','¡Ÿ‘Û','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2775','∏ﬂÃ®','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2776','…Ωµ§','105','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2777','·«·º','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2778','„˛¥®','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2779','¡ÈÃ®','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2780','≥Á–≈','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2781','ª™Õ§','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2782','◊Ø¿À','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2783','æ≤ƒ˛','106','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2784','À‡÷›','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2785','ΩÀ˛','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2786','∞≤Œ˜','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2787','À‡±±√…π≈◊Â','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2788','∞¢øÀ»˚π˛»¯øÀ◊Â','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2789','”Ò√≈','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2790','∂ÿªÕ','107','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2791','Œ˜∑Â','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2792','«Ï≥«','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2793','ª∑','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2794','ª™≥ÿ','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2795','∫œÀÆ','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2796','’˝ƒ˛','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2797','ƒ˛','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2798','’Ú‘≠','108','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2799','∞≤∂®','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2800','Õ®Œº','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2801','¬§Œ˜','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2802','Œº‘¥','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2803','¡Ÿ‰¨','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2804','’ƒ','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2805','·∫','109','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2806','Œ‰∂º','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2807','≥…','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2808','Œƒ','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2809','Â¥≤˝','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2810','øµ','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2811','Œ˜∫Õ','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2812','¿Ò','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2813','ª’','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2814','¡Ωµ±','459','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2815','¡Ÿœƒ','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2816','¡Ÿœƒ','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2817','øµ¿÷','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2818','”¿æ∏','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2819','π„∫”','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2820','∫Õ’˛','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2821','∂´œÁ◊Â','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2822','ª˝ Ø…Ω±£∞≤◊Â∂´œÁ◊Â»ˆ¿≠◊Â','111','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2823','∫œ◊˜','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2824','¡ŸÃ∂','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2825','◊øƒ·','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2826','÷€«˙','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2827','µ¸≤ø','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2828','¬Í«˙','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2829','¬µ«˙','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2830','œƒ∫”','110','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2831','≥«∂´','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2832','≥«÷–','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2833','≥«Œ˜','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2834','≥«±±','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2835','¥ÛÕ®ªÿ◊ÂÕ¡◊Â','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2836','‰“÷–','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2837','‰“‘¥','90','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2838','∆Ω∞≤','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2839','√Ò∫Õªÿ◊ÂÕ¡◊Â','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2840','¿÷∂º','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2841','ª•÷˙Õ¡◊Â','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2842','ªØ¬°ªÿ◊Â','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2843','—≠ªØ»ˆ¿≠◊Â','91','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2844','√≈‘¥ªÿ◊Â','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2845','∆Ó¡¨','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2846','∫£ÍÃ','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2847','∏’≤Ï','92','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2848','Õ¨» ','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2849','º‚‘˙','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2850','‘Ûø‚','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2851','∫”ƒœ√…π≈◊Â','93','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2852','π≤∫Õ','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2853','Õ¨µ¬','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2854','πÛµ¬','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2855','–À∫£','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2856','πÛƒœ','94','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2857','¬Í«ﬂ','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2858','∞‡¬Í','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2859','∏ µ¬','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2860','¥Ô»’','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2861','æ√÷Œ','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2862','¬Í∂‡','95','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2863','”Ò ˜','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2864','‘”∂‡','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2865','≥∆∂‡','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2866','÷Œ∂‡','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2867','ƒ“«´','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2868','«˙¬È¿≥','96','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2869','∏Ò∂˚ƒæ','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2870','µ¬¡Óπ˛','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2871','Œ⁄¿º','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2872','∂º¿º','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2873','ÃÏæ˛','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2874','¥Û≤Òµ©––ŒØ','97','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2875','–À«Ï','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2876','Œ˜œƒ','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2877','Ω∑Ô','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2878','”¿ƒ˛','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2879','∫ÿ¿º','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2880','¡ÈŒ‰','61','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2881','¥ÛŒ‰ø⁄','62','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2882','ª›≈©','62','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2883','∆Ω¬ﬁ','62','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2884','¿˚Õ®','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2885','—Œ≥ÿ','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2886','Õ¨–ƒ','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2887','«‡Õ≠œø','63','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2888','‘≠÷›','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2889','Œ˜º™','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2890','¬°µ¬','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2891','„˛‘¥','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2892','≈Ì—Ù','64','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2893','…≥∆¬Õ∑','460','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2894','÷–ƒ˛','460','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2895','∫£‘≠','460','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2896','ÃÏ…Ω','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2897','…≥“¿∞ÕøÀ','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2898','–¬','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2899','ÀÆƒ•πµ','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2900','Õ∑ÕÕ∫”','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2901','¥Ô€‡≥«','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2902','√◊∂´','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2903','Œ⁄¬≥ƒæ∆Î','65','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2904','∂¿…Ω◊”','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2905','øÀ¿≠¬Í“¿','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2906','∞◊ºÓÃ≤','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2907','Œ⁄∂˚∫Ã','66','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2908','Õ¬¬≥∑¨','67','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2909','€∑…∆','67','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2910','Õ–øÀ—∑','67','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2911','π˛√‹','68','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2912','∞Õ¿Ô¿§π˛»¯øÀ','68','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2913','“¡Œ·','68','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2914','≤˝º™','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2915','∏∑øµ','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2916','√◊»™','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2917','∫ÙÕº±⁄','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2918','¬Íƒ…Àπ','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2919','∆ÊÃ®','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2920','º™ƒæ»¯∂˚','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2921','ƒæ¿›π˛»¯øÀ','74','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2922','≤©¿÷','75','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2923','æ´∫”','75','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2924','Œ¬»™','75','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2925','ø‚∂˚¿’','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2926','¬÷Ã®','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2927','Œæ¿Á','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2928','»Ù«º','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2929','«“ƒ©','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2930','—…Í»ªÿ◊Â','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2931','∫Õæ≤','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2932','∫ÕÀ∂','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2933','≤©∫˛','73','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2934','∞¢øÀÀ’','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2935','Œ¬Àﬁ','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2936','ø‚≥µ','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2937','…≥—≈','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2938','–¬∫Õ','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2939','∞›≥«','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2940','Œ⁄ ≤','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2941','∞¢ÕﬂÃ·','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2942','ø¬∆∫','70','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2943','∞¢Õº ≤','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2944','∞¢øÀÃ’','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2945','∞¢∫œ∆Ê','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2946','Œ⁄«°','72','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2947','ø¶ ≤','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2948',' Ë∏Ω','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2949',' Ë¿’','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2950','”¢º™…≥','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2951','‘Û∆’','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2952','…Ø≥µ','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2953','“∂≥«','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2954','¬Û∏«Ã·','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2955','‘¿∆’∫˛','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2956','Ÿ§ ¶','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2957','∞Õ≥˛','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2958','À˛ ≤ø‚∂˚∏…À˛º™øÀ','71','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2959','∫ÕÃÔ','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2960','∫ÕÃÔ','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2961','ƒ´”Ò','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2962','∆§…Ω','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2963','¬Â∆÷','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2964','≤ﬂ¿’','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2965','”⁄ÃÔ','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2966','√Ò∑·','69','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2967','“¡ƒ˛','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2968','ø¸ÕÕ','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2969','“¡ƒ˛','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2970','≤Ï≤º≤È∂˚Œ˝≤Æ','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2971','ªÙ≥«','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2972','πÆ¡Ù','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2973','–¬‘¥','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2974','’—À’','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2975','ÃÿøÀÀπ','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2976','ƒ·¿’øÀ','76','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2977','À˛≥«','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2978','Œ⁄À’','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2979','∂Ó√Ù','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2980','…≥ÕÂ','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2981','Õ–¿Ô','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2982','‘£√Ò','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2983','∫Õ≤ºøÀ»¸∂˚√…π≈','77','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2984','∞¢¿’Ã©','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2985','≤º∂˚ΩÚ','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2986','∏ª‘Ã','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2987','∏£∫£','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2988','π˛∞Õ∫”','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2989','«‡∫”','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2990','º™ƒæƒÀ','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2991',' Ø∫”◊”','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2992','∞¢¿≠∂˚','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2993','Õºƒæ ÊøÀ','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2994','ŒÂº“«˛','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2995','œ„∏€','447','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2996','∞ƒ√≈','448','1'); 
>>>>>>> 4bbe80dbe97eaaefe9308eea0f82ba3ed48d0de9

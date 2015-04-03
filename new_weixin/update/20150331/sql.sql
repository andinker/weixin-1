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

<<<<<<< HEAD
<<<<<<< HEAD
/* 修改会员帐号数据表，增加社区id列和帐号类型列 */
ALTER TABLE `zfwx_users` 
ADD COLUMN `community_id` INT NOT NULL DEFAULT 0 AFTER `truename`,
ADD COLUMN `account_type` TINYINT NOT NULL DEFAULT 0 AFTER `community_id`;

=======
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (1,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (2,'�Ϻ�','1');	
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (3,'���','1');	  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (4,'����','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (5,'������','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (6,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (7,'����','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (8,'���ɹ�','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (9,'����','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (10,'�½�','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (11,'�ຣ','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (12,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (13,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (14,'�ӱ�','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (15,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (16,'ɽ��','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (17,'ɽ��','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (18,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (19,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (20,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (21,'����','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (22,'�㽭','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (23,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (24,'�㶫','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (25,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (26,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (27,'�Ĵ�','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (28,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (29,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (30,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (31,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (32,'���','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (33,'����','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (34,'̨��','1');
=======
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (1,'北京','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (2,'上海','1');	
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (3,'天津','1');	  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (4,'重庆','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (5,'黑龙江','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (6,'吉林','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (7,'辽宁','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (8,'内蒙古','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (9,'宁夏','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (10,'新疆','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (11,'青海','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (12,'甘肃','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (13,'陕西','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (14,'河北','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (15,'河南','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (16,'山东','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (17,'山西','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (18,'湖北','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (19,'湖南','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (20,'安徽','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (21,'江苏','1');  
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (22,'浙江','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (23,'江西','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (24,'广东','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (25,'广西','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (26,'福建','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (27,'四川','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (28,'云南','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (29,'贵州','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (30,'西藏','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (31,'海南','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (32,'香港','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (33,'澳门','1');
INSERT INTO `zfwx_region_province`  (`id`,`name`, `status`) VALUES (34,'台湾','1');
>>>>>>> a4c43d1bdd49a9d30c2f48d19f2bc55d765ece28


	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('1','北京','1','1');

	   INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('2','上海','2','1');

	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('3','天津','3','1');

	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('4','重庆','4','1');

	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('5','哈尔滨','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('6','齐齐哈尔','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('7','牡丹江','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('8','鹤岗','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('9','双鸭山','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('10','鸡西','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('11','大庆','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('12','伊春','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('13','佳木斯','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('14','七台河','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('15','黑河','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('16','绥化','5','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('17','大兴安岭','5','1');
 
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('18','长春','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('19','吉林','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('20','四平','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('21','辽源','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('22','通化','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('23','白山','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('24','松原','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('25','白城','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('26','延边朝鲜族','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('27','高新','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('28','延吉','6','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('29','梅河口','6','1');
  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('30','沈阳','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('31','大连','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('32','锦州','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('33','鞍山','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('34','抚顺','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('35','本溪','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('36','丹东','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('37','葫芦岛','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('38','营口','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('39','盘锦','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('40','阜新','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('41','辽阳','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('42','铁岭','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('43','朝阳','7','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('44','瓦房店','7','1');  
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('45','呼和浩特','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('46','包头','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('47','乌海','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('48','赤峰','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('49','通辽','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('50','鄂尔多斯','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('51','乌兰察布盟','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('52','锡林郭勒盟','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('53','巴彦淖尔盟','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('54','阿拉善盟','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('55','兴安盟','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('56','巴彦淖尔','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('57','呼伦贝尔','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('58','集宁','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('59',' 乌兰浩特','8','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('60','锡林浩特','8','1');
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('61','银川','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('62','石嘴山','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('63','吴忠','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('64','固原','9','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('460','中卫','9','1');
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('65','乌鲁木齐','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('66','克拉玛依','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('67','吐鲁番','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('68','哈密','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('69','和田','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('70','阿克苏','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('71','喀什','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('72','克孜勒苏柯尔克孜','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('73','巴音郭楞蒙古','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('74','昌吉回族','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('75','博尔塔拉蒙古','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('76','伊犁哈萨克','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('77','塔城','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('78','阿勒泰','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('79','省直辖县级行政单位','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('82','克拉马依','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('83','库尔勒','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('84','石河子','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('85','吐鲁番','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('86',' 乌市','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('87','奎屯','10','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('89','伊宁','10','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('90','西宁','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('91','海东','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('92',' 海北藏族','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('93','黄南藏族','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('94','海南藏族','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('95','果洛藏族','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('96','玉树藏族','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('97','海西蒙古族藏族','11','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('98','格尔木','11','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('99','兰州','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('100','天水','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('101','金昌','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('102','白银','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('103','嘉峪关','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('104','武 威 ','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('105','张掖','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('106','平凉','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('107','酒泉','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('108','庆阳','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('109','定西','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('459','陇南','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('110','甘南藏族','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('111','临夏回族','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('112','嘉峪','12','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('113','武威','12','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('114','西安','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('115','宝鸡','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('116','延安','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('117','铜川','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('118','咸阳','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('119','渭南','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('120','汉中','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('121','榆林','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('122','安康','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('123','商洛','13','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('124','韩城','13','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('125','石家庄','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('126','保定','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('127','唐山','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('128','秦皇岛','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('129','邯郸','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('130','邢台','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('131','张家口','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('132','承德','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('133','沧州','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('134','廊坊','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('135','衡水','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('136','霸州','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('137','青县','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('138','任丘','14','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('139','涿州','14','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('140','郑州','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('141','洛阳','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('142','开封','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('143','平顶山','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('144','焦作','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('145','鹤壁','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('146','新乡','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('147','安阳','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('148','濮阳','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('149','许昌','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('150','漯河','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('151','三门峡','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('152','南阳','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('153','商丘','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('154','信阳','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('155','周口','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('156','驻马店','15','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('455','济源','15','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('157','济南','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('158','青岛','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('159','烟台','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('160','淄博','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('161','枣庄','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('162','东营','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('163','潍坊','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('164','威海','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('165','济宁','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('166','泰安','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('167','日照','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('168','莱芜','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('169','德州','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('170','临沂','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('171','聊城','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('172','滨州','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('173','菏泽','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('174','高密','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('175','荷泽','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('176','淮坊','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('177','即墨','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('178','胶南','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('179','莱州','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('180','林沂','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('181','临忻','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('182','龙口','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('183','蓬莱','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('184','青州','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('185','乳山','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('186','寿光','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('187','滕州','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('188','文登','16','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('189','招远','16','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('190','太原','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('191','大同','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('192','朔州','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('193','阳泉','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('194','长治','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('195','晋城','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('461','忻州','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('196','晋中','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('197','临汾','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('198','运城','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('199','吕梁','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('200','河津','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('201','侯马','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('202','孝义','17','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('203','榆次','17','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('204','武汉','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('205','黄石','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('206','襄樊','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('207','十堰','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('208','荆州','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('209','宜昌','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('210','荆门','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('211','鄂州','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('212','孝感','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('213','黄冈','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('214','咸宁','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('215','随州','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('216','恩施土家族苗族','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('217','安陆','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('218','恩施','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('219','汉口','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('220','汉阳','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('221','潜江','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('222','仙桃','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('223','株州','18','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('456','省直辖县级行政单位','18','1');
	
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('224','长沙','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('225','株洲','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('226','湘潭','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('227','衡阳','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('228','邵阳','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('229','岳阳','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('230','常德','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('231','张家界','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('232','益阳','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('233','郴州','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('234','永州','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('235','怀化','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('236','娄底','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('237','湘西土家族苗族','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('238','株州','19','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('239','邵东','19','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('240','合肥','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('241','芜湖','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('242','蚌埠','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('243','淮南','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('244','马鞍山','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('245','淮北','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('246','铜陵','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('247','安庆','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('248','黄山','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('249','滁州','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('250','阜阳','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('251','宿州','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('252','巢湖','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('253','六安','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('254','亳州','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('255','池州','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('256','宣城','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('257','蒙城','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('258','宁国','20','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('259','桐城','20','1');
	
	  
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('260','南京','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('261','徐州','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('262','连云港','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('263','淮安','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('264','宿迁','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('265','盐城','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('266','扬州','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('267','泰州','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('268','南通','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('269','镇江','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('270','常州','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('271','无锡','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('272','苏州','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('273','常熟','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('274','丹阳','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('275','海门','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('276','江都','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('277','江阴','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('278','靖江','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('279','昆山','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('280','溧阳','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('281','太仓','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('282','泰州华','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('283','吴江','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('284','吴县','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('285','宜兴','21','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('286','张家港','21','1');
	 
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('287','杭州','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('288','宁波','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('289','温州','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('290','嘉兴','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('291','湖州','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('292','绍兴','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('293','金华','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('294','衢州','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('295','舟山','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('296','台州','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('297','丽水','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('298','慈溪','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('299','东阳','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('300','奉化','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('301','乐清','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('302','临安','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('303','临海','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('304','平湖','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('305','瑞安','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('306','上虞','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('307','嵊州','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('308','温岭','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('309','义乌','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('310','永康','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('311','余姚','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('312','诸暨','22','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('313','新昌','22','1');
	  
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('314','南昌','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('315','景德镇','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('316','萍乡','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('317','新余','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('318','九江','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('319','鹰潭','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('320','赣州','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('321','吉安','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('322','宜春','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('323','抚州','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('324','上饶','23','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('325','高安','23','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('326','广州','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('327','深圳','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('328','珠海','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('329','汕头','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('330','韶关','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('331','河源','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('332','梅州','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('333','惠州','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('334','汕尾','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('335','东莞','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('336','中山','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('337','江门','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('338','佛山','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('339','阳江','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('340','湛江','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('341','茂名','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('342','肇庆','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('343','清远','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('344','潮州','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('345','揭阳','24','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('346','云浮','24','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('354','南宁','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('355','柳州','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('356','桂林','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('357','梧州','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('358','北海','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('359','防城港','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('360','钦州','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('361','贵港','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('362','玉林','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('363','百色','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('364','贺州','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('365','河池','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('366','来宾','25','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('367','崇左','25','1');
	
	 
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('368','福州','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('369','厦门','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('370','三明','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('371','莆田','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('372','泉州','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('373','漳州','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('374','南平','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('375','龙岩','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('376','宁德','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('377','福清','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('378','建瓯','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('379','晋江','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('380','南安','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('381','邵武','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('382','石狮','26','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('383','仙游','26','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('384','成都','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('385','自贡','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('386','攀枝花','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('387','泸州','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('388','德阳','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('389','绵阳','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('390','广元','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('391','遂宁','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('392','内江','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('393','乐山','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('394','南充','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('395','宜宾','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('396','广安','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('397','达州','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('398','巴中','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('399','雅安','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('400','眉山','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('401','资阳','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('402','阿坝藏族羌族','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('403','甘孜藏族','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('404','凉山彝族','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('405','广汉','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('406','锦阳','27','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('407','西昌','27','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('408','昆明','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('409','曲靖','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('410','玉溪','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('411','保山','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('412','昭通','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('413','思茅','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('414','临沧','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('415','丽江','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('416',' 文山壮族苗族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('417','红河哈尼族彝族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('418','西双版纳傣族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('419','楚雄彝族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('420','大理白族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('421','德宏傣族景颇族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('422','怒江傈傈族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('423','迪庆藏族','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('424','大理','28','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('458','普洱','28','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('425','贵阳','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('426','六盘水','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('427','遵义','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('428','安顺','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('429','铜仁','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('430','毕节','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('431','黔西南布依族苗族','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('432','黔东南苗族侗族','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('433','黔南布依族苗族','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('434','都匀','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('435','贵恙','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('436','凯里','29','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('437','铜仁','29','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('438','拉萨','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('439','那曲','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('440','昌都','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('441','山南','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('442','日喀则','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('443','阿里','30','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('444','林芝','30','1');

	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('445','海口','31','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('446','三亚','31','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('457','省直辖县级行政单位','31','1');
	  
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('447','香港','32','1');
	
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('448','澳门','33','1');
	  
	
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('449','台北','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('450','高雄','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('451','台中','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('452','台南','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('453','基隆','34','1');
	  INSERT INTO zfwx_region_city(id,name,province_id,status)VALUES('454','新竹','34','1');
  
 		 
 	  
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1','东城','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2','西城','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3','宣武','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('4','崇文','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('5','朝阳','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('6','海淀','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('7','丰台','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('8','石景山','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('9','门头沟','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('10','昌平','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('11','大兴','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('12','怀柔','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('13','密云','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('14','平谷','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('15','顺义','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('16','通州','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('17','延庆','1','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('18','房山','1','1');
		
		
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('19','河东','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('20','河西','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('21','河北','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('22','南开','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('23','红桥','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('36','和平','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('24','塘沽','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('25','汉沽','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('26','大港','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('27','东丽','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('28','西青','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('29','津南','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('30','北辰','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('31',' 武清','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('32','宝坻','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('33','蓟县 ','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('34','宁河','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('35','静海','3','1');
			  INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('40','滨海新区','3','1');
			
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('41','长安','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('42','桥东','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('43','桥西','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('44','新华','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('45','井陉矿','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('46','裕华','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('47','井陉','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('48','正定','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('49','栾城','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('50','行唐','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('51','灵寿','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('52','高邑','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('53','深泽','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('54','赞皇','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('55','无极','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('56','平山','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('57','元氏','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('58','赵县','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('59','辛集','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('60','藁城','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('61','晋州','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('62','新乐','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('63','鹿泉','125','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('64','高新技术开发区','125','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('65','路南','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('66','路北','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('67','古冶','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('68','开平','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('69','丰南','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('70','丰润','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('71','滦县','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('72','滦南','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('73','乐亭','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('74','迁西','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('75','玉田','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('76','唐海','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('77','遵化','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('78','迁安','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('79','高新','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('80','汉沽管理','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('81','海港开发区','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('82','芦台开发区','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('83','南堡开发区','127','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('84','曹妃甸工业','127','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('87','北戴河','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('88','青龙满族','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('89','昌黎','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('90','抚宁','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('91','卢龙','128','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('92','经济技术开发区','128','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('93','邯山','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('94','丛台','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('95','复兴','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('96','峰峰矿','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('97','邯郸','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('98','临漳','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('99','成安','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('100','大名','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('101','涉县','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('102','磁县','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('103','肥乡','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('104','永年','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('105','邱县','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('106','鸡泽','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('107','广平','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('108','馆陶','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('109','魏县','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('110','曲周','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('111','武安','129','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('112','经济开发区','129','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('113','桥东','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('114','桥西','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('115','邢台','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('116','临城','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('117','内丘','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('118','柏乡','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('119','隆尧','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('120','任县','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('121','南和','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('122','宁晋','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('123','巨鹿','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('124','新河','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('125','广宗','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('126','平乡','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('127','威县','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('128','清河','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('129','临西','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('130','南宫','130','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('131','沙河','130','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('132','新市','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('133','南','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('134','北市','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('135','满城','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('136','清苑','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('137','涞水','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('138','阜平','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('139','徐水','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('140','定兴','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('141','唐县','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('142','高阳','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('143','容城','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('144','涞源','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('145','望都','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('146','安新','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('147','易县','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('148','曲阳','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('149','蠡县','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('150','顺平','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('151','博野','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('152','雄县','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('153','涿州','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('154','定州','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('155','安国','126','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('156','高碑店','126','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('159','宣化','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('160','下花园','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('161','宣化','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('162','张北','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('163','康保','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('164','沽源','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('165','尚义','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('166','蔚县','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('167','阳原','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('168','怀安','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('169','万全','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('170','怀来','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('171','涿鹿','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('172','赤城','131','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('173','崇礼','131','1'); 
			
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('174','双桥','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('175','双滦','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('176','鹰手营子矿','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('177','承德','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('178','兴隆','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('179','平泉','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('180','滦平','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('181','隆化','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('182','丰宁满族','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('183','宽城满族','132','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('184','围场满族蒙古族','132','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('185','新华','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('186','运河','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('187','沧县','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('188','青县','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('189','东光','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('190','海兴','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('191','盐山','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('192','肃宁','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('193','南皮','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('194','吴桥','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('195','献县','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('196','孟村回族','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('197','泊头','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('198','任丘','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('199','黄骅','133','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('200','河间','133','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('201','安次','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('202','广阳','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('203','固安','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('204','永清','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('205','香河','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('206','大城','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('207','文安','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('208','大厂回族','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('209','霸州','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('210','三河','134','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('211','开发区','134','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('212','桃城','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('213','枣强','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('214','武邑','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('215','武强','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('216','饶阳','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('217','安平','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('218','故城','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('219','景','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('220','阜城','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('221','冀州','135','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('222','深州','135','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('223','小店','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('224','迎泽','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('225','杏花岭','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('226','尖草坪','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('227','万柏林','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('228','晋源','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('229','清徐','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('230','阳曲','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('231','娄烦','190','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('232','古交','190','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('233','城','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('234','矿','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('235','南郊','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('236','新荣','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('237','阳高','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('238','天镇','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('239','广灵','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('240','灵丘','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('241','浑源','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('242','左云','191','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('243','大同','191','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('244','城','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('245','矿','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('246','郊','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('247','平定','193','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('248','盂县','193','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('249','城','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('250','郊','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('251','长治','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('252','襄垣','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('253','屯留','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('254','平顺','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('255','黎城','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('256','壶关','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('257','长子','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('258','武乡','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('259','沁县','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('260','沁源','194','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('261','潞城','194','1');
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('262','城','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('263','沁水','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('264','阳城','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('265','陵川','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('266','泽州','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('267','高平','195','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('268','朔城','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('269','平鲁','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('270','山阴','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('271','应县','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('272','右玉','192','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('273','怀仁','192','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('274','榆次','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('275','榆社','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('276','左权','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('277','和顺','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('278','昔阳','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('279','寿阳','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('280','太谷','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('281','祁县','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('282','平遥','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('283','灵石','196','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('284','介休','196','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('285','盐湖','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('286','临猗','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('287','万荣','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('288','闻喜','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('289','稷山','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('290','新绛','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('291','绛县','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('292','垣曲','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('293','夏县','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('294','平陆','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('295','芮城','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('296','永济','198','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('297','河津','198','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('298','忻府','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('299','定襄','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('300','五台','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('301','代县','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('302','繁峙','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('303','宁武','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('304','静乐','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('305','神池','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('306','五寨','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('307','岢岚','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('308','河曲','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('309','保德','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('310','偏关','195','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('311','原平','195','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('312','尧都','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('313','曲沃','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('314','翼城','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('315','襄汾','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('316','洪洞','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('317','古县','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('318','安泽','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('319','浮山','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('320','吉县','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('321','乡宁','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('322','大宁','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('323','隰县','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('324','永和','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('325','蒲县','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('326','汾西','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('327','侯马','197','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('328','霍州','197','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('329','离石','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('330','文水','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('331','交城','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('332','兴县','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('333','临县','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('334','柳林','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('335','石楼','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('336','岚县','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('337','方山','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('338','中阳','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('339','交口','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('340','孝义','199','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('341','汾阳','199','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('342','回民','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('343','玉泉','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('344','新城','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('345','赛罕','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('346','土默特左旗','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('347','托克托','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('348','和林格尔','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('349','清水河','45','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('350','武川','45','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('351','东河','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('352','昆都仑','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('353','青山','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('354','石拐','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('355','白云矿','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('356','九原','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('357','土默特右旗','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('358','固阳','46','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('359','达尔罕茂明安联合旗','46','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('360','海勃湾','47','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('361','海南','47','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('362','乌达','47','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('363','红山','47','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('364','元宝山','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('365','松山','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('366','阿鲁科尔沁旗','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('367','巴林左旗','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('368','巴林右旗','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('369','林西','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('370','克什克腾旗','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('371','翁牛特旗','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('372','喀喇沁旗','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('373','宁城','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('374','敖汉旗','48','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('375','新城','48','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('376','科尔沁','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('377','科尔沁左翼中旗','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('378','科尔沁左翼后旗','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('379','开鲁','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('380','库伦旗','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('381','奈曼旗','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('382','扎鲁特旗','49','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('383','霍林郭勒','49','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('384','东胜','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('385','达拉特旗','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('386','准格尔旗','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('387','鄂托克前旗','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('388','鄂托克旗','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('389','杭锦旗','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('390','乌审旗','50','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('391','伊金霍洛旗','50','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('392','海拉尔','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('393','阿荣旗','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('394','莫力达瓦达斡尔族自治旗','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('395','鄂伦春自治旗','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('396','鄂温克族自治旗','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('397','陈巴尔虎旗','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('398','新巴尔虎左旗','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('399','新巴尔虎右旗','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('400','满洲里','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('401','牙克石','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('402','扎兰屯','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('403','额尔古纳','57','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('404','根河','57','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('405','临河','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('406','五原','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('407','磴口','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('408','乌拉特前旗','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('409','乌拉特中旗','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('410','乌拉特后旗','53','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('411','杭锦后旗','53','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('412','集宁','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('413','卓资','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('414','化德','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('415','商都','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('416','兴和','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('417','凉城','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('418','察哈尔右翼前旗','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('419','察哈尔右翼中旗','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('420','察哈尔右翼后旗','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('421','四子王旗','59','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('422','丰镇','59','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('423','乌兰浩特','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('424','阿尔山','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('425','科尔沁右翼前旗','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('426','科尔沁右翼中旗','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('427','扎赉特旗','55','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('428','突泉','55','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('429','二连浩特','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('430','锡林浩特','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('431','阿巴嘎旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('432','苏尼特左旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('433','苏尼特右旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('434','东乌珠穆沁旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('435','西乌珠穆沁旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('436','太仆寺旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('437','镶黄旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('438','正镶白旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('439','正蓝旗','52','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('440','多伦','52','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('441','阿拉善左旗','54','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('442','阿拉善右旗','54','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('443','额济纳旗','54','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('444','和平','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('445','沈河','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('446','大东','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('447','皇姑','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('448','铁西','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('449','苏家屯','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('450','东陵','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('451','沈北新','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('452','于洪','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('453','辽中','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('454','康平','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('455','法库','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('456','新民','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('457','经济技术开发区','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('458','浑南新','30','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('459','新城子经济技术开发区','30','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('460','中山','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('461','西岗','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('462','沙河口','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('463','甘井子','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('464','旅顺口','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('465','金州','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('466','长海','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('467','瓦房店','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('468','普兰店','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('469','庄河','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('470','开发区','31','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('471','保税','31','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('472','铁东','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('473','铁西','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('474','立山','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('475','千山','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('476','台安','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('477','岫岩满族','33','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('478','海城','33','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('479','新抚','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('480','东洲','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('481','望花','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('482','顺城','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('483','抚顺','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('484','新宾满族','34','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('485','清原满族','34','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('486','平山','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('487','明山','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('488','溪湖','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('489','南芬','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('490','本溪满族','35','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('491','桓仁满族','35','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('492','元宝','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('493','振兴','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('494','振安','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('495','宽甸满族','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('496','东港','36','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('497','凤城','36','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('498','古塔','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('499','凌河','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('500','太和','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('501','黑山','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('502','义','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('503','凌海','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('504','北宁','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('505','松山新','32','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('506','经济技术开发区','32','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('507','站前','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('508','西','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('509','鲅鱼圈','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('510','老边','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('511','盖州','38','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('512','大石桥','38','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('513','海州','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('514','新邱','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('515','太平','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('516','清河门','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('517','细河','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('518','阜新蒙古族','40','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('519','彰武','40','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('520','白塔','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('521','文圣','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('522','宏伟','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('523','弓长岭','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('524','太子河','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('525','辽阳','41','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('526','灯塔','41','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('527','双台子','39','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('528','兴隆台','39','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('529','大洼','39','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('530','盘山','39','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('531','银州','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('532','清河','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('533','铁岭','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('534','西丰','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('535','昌图','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('536','调兵山','42','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('537','开原','42','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('538','双塔','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('539','龙城','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('540','朝阳','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('541','建平','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('542','喀喇沁左翼蒙古族','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('543','北票','43','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('544','凌源','43','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('545','连山','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('546','龙港','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('547','南票','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('548','绥中','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('549','建昌','37','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('550','兴城','37','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('551','南关','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('552','宽城','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('553','朝阳','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('554','二道','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('555','绿园','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('556','双阳','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('557','农安','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('558','九台','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('559','榆树','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('560','德惠','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('561','净月经济开发区','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('562','高新技术产业开发区','18','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('563','经济技术开发区','18','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('564','昌邑','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('565','龙潭','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('566','船营','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('567','丰满','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('568','永吉','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('569','蛟河','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('570','桦甸','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('571','舒兰','19','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('572','磐石','19','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('573','铁西','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('574','铁东','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('575','梨树','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('576','伊通满族','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('577','公主岭','20','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('578','双辽','20','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('579','龙山','21','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('580','西安','21','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('581','东丰','21','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('582','东辽','21','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('583','东昌','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('584','二道江','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('585','通化','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('586','辉南','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('587','柳河','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('588','梅河口','22','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('589','集安','22','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('590','八道江','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('591','抚松','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('592','靖宇','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('593','长白朝鲜族','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('594','江源','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('595','临江','23','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('596','宁江','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('597','前郭尔罗斯蒙古族','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('598','长岭','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('599','乾安','24','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('600','扶余','24','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('601','洮北','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('602','镇赉','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('603','通榆','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('604','洮南','25','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('605','大安','25','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('606','延吉','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('607','图们','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('608','敦化','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('609','珲春','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('610','龙井','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('611','和龙','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('612','汪清','26','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('613','安图','26','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('614','道里','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('615','南岗','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('616','道外','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('617','香坊','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('618','动力','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('619','平房','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('620','松北','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('621','呼兰','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('622','依兰','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('623','方正','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('624','宾','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('625','巴彦','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('626','木兰','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('627','通河','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('628','延寿','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('629','阿城','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('630','双城','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('631','尚志','5','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('632','五常','5','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('633','龙沙','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('634','建华','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('635','铁锋','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('636','昂昂溪','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('637','富拉尔基','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('638','碾子山','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('639','梅里斯达斡尔族','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('640','龙江','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('641','依安','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('642','泰来','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('643','甘南','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('644','富裕','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('645','克山','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('646','克东','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('647','拜泉','6','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('648','讷河','6','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('649','鸡冠','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('650','恒山','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('651','滴道','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('652','梨树','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('653','城子河','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('654','麻山','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('655','鸡东','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('656','虎林','10','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('657','密山','10','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('658','向阳','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('659','工农','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('660','南山','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('661','兴安','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('662','东山','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('663','兴山','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('664','萝北','8','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('665','绥滨','8','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('666','尖山','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('667','岭东','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('668','四方台','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('669','宝山','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('670','集贤','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('671','友谊','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('672','宝清','9','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('673','饶河','9','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('674','萨尔图','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('675','龙凤','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('676','让胡路','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('677','红岗','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('678','大同','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('679','肇州','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('680','肇源','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('681','林甸','11','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('682','杜尔伯特蒙古族','11','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('683','伊春','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('684','南岔','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('685','友好','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('686','西林','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('687','翠峦','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('688','新青','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('689','美溪','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('690','金山屯','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('691','五营','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('692','乌马河','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('693','汤旺河','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('694','带岭','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('695','乌伊岭','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('696','红星','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('697','上甘岭','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('698','嘉荫','12','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('699','铁力','12','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('700','向阳','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('701','前进','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('702','东风','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('703','郊县','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('704','桦南','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('705','桦川','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('706','汤原','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('707','抚远','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('708','同江','13','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('709','富锦','13','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('710','新兴','14','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('711','桃山','14','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('712','茄子河','14','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('713','勃利','14','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('714','东安','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('715','爱民','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('716','阳明','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('717','西安','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('718','东宁','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('719','林口','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('720','绥芬河','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('721','海林','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('722','宁安','7','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('723','穆棱','7','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('724','爱辉','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('725','嫩江','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('726','逊克','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('727','孙吴','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('728','北安','15','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('729','五大连池','15','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('730','北林','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('731','望奎','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('732','兰西','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('733','青冈','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('734','庆安','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('735','明水','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('736','绥棱','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('737','安达','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('738','肇东','16','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('739','海伦','16','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('740','呼玛','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('741','塔河','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('742','漠河','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('743','加格达奇','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('744','松岭','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('745','新林','17','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('746','呼中','17','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('747','黄浦','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('748','卢湾','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('749','徐汇','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('750','长宁','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('751','静安','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('752','普陀','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('753','闸北','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('754','虹口','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('755','杨浦','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('756','闵行','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('757','宝山','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('758','嘉定','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('759','浦东新区','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('760','金山','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('761','松江','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('762','青浦','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('763','南汇','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('764','奉贤','2','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('765','崇明','2','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('766','玄武','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('767','白下','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('768','秦淮','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('769','建邺','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('770','鼓楼','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('771','下关','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('772','浦口','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('773','栖霞','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('774','雨花台','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('775','江宁','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('776','六合','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('777','溧水','260','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('778','高淳','260','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('779','崇安','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('780','南长','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('781','北塘','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('782','锡山','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('783','惠山','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('784','滨湖','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('785','江阴','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('786','宜兴','271','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('787','新县','271','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('788','云龙','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('789','鼓楼','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('790','九里','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('791','泉山','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('792','铜山','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('793','贾汪','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('794','丰县','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('795','沛县','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('796','睢宁','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('797','新沂','261','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('798','邳州','261','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('799','天宁','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('800','钟楼','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('801','戚墅堰','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('802','新北','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('803','武进','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('804','溧阳','270','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('805','金坛','270','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('806','沧浪','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('807','平江','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('808','金阊','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('809','虎丘','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('810','吴中','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('811','相城','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('812','常熟','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('813','张家港','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('814','昆山','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('815','吴江','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('816','太仓','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('817','工业园','272','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('818','高新','272','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('819','崇川','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('820','港闸','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('821','海安','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('822','如东','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('823','启东','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('824','如皋','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('825','通州','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('826','海门','268','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('827','经济技术开发区','268','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('828','连云','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('829','新浦','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('830','海州','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('831','赣榆','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('832','东海','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('833','灌云','262','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('834','灌南','262','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('835','清河','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('836','楚州','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('837','淮阴','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('838','清浦','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('839','涟水','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('840','洪泽','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('841','盱眙','263','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('842','金湖','263','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('843','亭湖','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('844','盐都','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('845','响水','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('846','滨海','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('847','阜宁','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('848','射阳','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('849','建湖','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('850','东台','265','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('851','大丰','265','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('852','广陵','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('853','邗江','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('854','宝应','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('855','仪征','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('856','高邮','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('857','江都','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('858','维扬','266','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('859','经济开发区','266','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('860','京口','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('861','润州','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('862','丹徒','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('863','丹阳','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('864','扬中','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('865','句容','269','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('866','新县','269','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('867','海陵','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('868','高港','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('869','兴化','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('870','靖江','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('871','泰兴','267','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('872','姜堰','267','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('873','宿城','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('874','宿豫','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('875','沭阳','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('876','泗阳','264','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('877','泗洪','264','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('878','上城','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('879','下城','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('880','江干','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('881','拱墅','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('882','西湖','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('883','滨江','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('884','萧山','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('885','余杭','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('886','桐庐','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('887','淳安','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('888','建德','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('889','富阳','287','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('890','临安','287','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('891','海曙','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('892','江东','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('893','江北','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('894','北仑','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('895','镇海','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('896','鄞州','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('897','象山','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('898','宁海','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('899','余姚','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('900','慈溪','288','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('901','奉化','288','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('902','鹿城','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('903','龙湾','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('904','瓯海','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('905','洞头','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('906','永嘉','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('907','平阳','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('908','苍南','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('909','文成','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('910','泰顺','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('911','瑞安','289','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('912','乐清','289','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('913','秀洲','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('914','嘉善','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('915','海盐','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('916','海宁','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('917','平湖','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('918','桐乡','290','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('919','南湖','290','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('920','吴兴','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('921','南浔','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('922','德清','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('923','长兴','291','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('924','安吉','291','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('925','越城','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('926','绍兴','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('927','新昌','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('928','诸暨','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('929','上虞','292','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('930','嵊州','292','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('931','婺城','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('932','金东','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('933','武义','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('934','浦江','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('935','磐安','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('936','兰溪','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('937','义乌','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('938','东阳','293','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('939','永康','293','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('940','柯城','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('941','衢江','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('942','常山','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('943','开化','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('944','龙游','294','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('945','江山','294','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('946','定海','295','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('947','普陀','295','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('948','岱山','295','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('949','嵊泗','295','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('950','椒江','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('951','路桥','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('952','黄岩','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('953','玉环','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('954','三门','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('955','天台','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('956','仙居','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('957','温岭','296','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('958','临海','296','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('959','莲都','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('960','青田','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('961','缙云','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('962','遂昌','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('963','松阳','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('964','云和','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('965','庆元','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('966','景宁畲族','297','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('967','龙泉','297','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('968','瑶海','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('969','庐阳','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('970','蜀山','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('971','包河','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('972','长丰','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('973','肥东','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('974','肥西','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('975','经济技术开发区','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('976','新站试验','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('977','政务文化新','240','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('978','高新技术产业开发区','240','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('979','镜湖','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('980','鸠江','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('981','芜湖','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('982','繁昌','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('983','南陵','241','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('984','弋江','241','1');
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('985','三山','241','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('986','龙子湖','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('987','蚌山','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('988','禹会','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('989','淮上','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('990','怀远','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('991','五河','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('992','固镇','242','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('993','大通','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('994','田家庵','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('995','谢家集','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('996','八公山','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('997','潘集','243','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('998','凤台','243','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('999','雨山','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1000','花山','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1001','金家庄','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1002','当涂','244','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1003','经济技术开发区','244','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1004','杜集','245','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1005','相山','245','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1006','烈山','245','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1007','濉溪','245','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1008','铜官山','246','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1009','狮子山','246','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1010','郊县','246','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1011','铜陵','246','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1012','迎江','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1013','大观','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1014','怀宁','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1015','枞阳','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1016','潜山','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1017','太湖','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1018','宿松','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1019','望江','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1020','岳西','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1021','桐城','247','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1022','宜秀','247','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1023','屯溪','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1024','黄山','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1025','徽州','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1026','歙县','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1027','休宁','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1028','黟县','248','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1029','祁门','248','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1030','琅琊','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1031','南谯','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1032','来安','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1033','全椒','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1034','定远','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1035','凤阳','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1036','天长','249','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1037','明光','249','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1038','颍州','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1039','颍东','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1040','颍泉','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1041','临泉','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1042','太和','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1043','阜南','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1044','颍上','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1045','界首','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1046','经济开发区','250','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1047','埇桥','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1048','砀山','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1049','萧县','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1050','灵璧','251','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1051','泗县','251','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1052','居巢','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1053','庐江','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1054','无为','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1055','含山','252','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1056','和县','252','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1057','金安','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1058','裕安','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1059','寿县','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1060','霍邱','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1061','舒城','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1062','金寨','253','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1063','霍山','253','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1064','谯城','254','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1065','涡阳','254','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1066','蒙城','254','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1067','利辛','254','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1068','贵池','255','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1069','东至','255','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1070','石台','255','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1071','青阳','255','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1072','宣州','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1073','郎溪','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1074','广德','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1075','泾','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1076','绩溪','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1077','旌德','256','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1078','宁国','256','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1079','鼓楼','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1080','台江','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1081','仓山','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1082','马尾','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1083','晋安','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1084','闽侯','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1085','连江','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1086','罗源','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1087','闽清','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1088','永泰','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1089','平潭','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1090','福清','368','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1091','长乐','368','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1092','思明','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1093','海沧','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1094','湖里','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1095','集美','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1096','同安','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1097','翔安','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1098','鼓浪屿','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1099','象屿保税','369','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1100','火炬高新','369','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1101','城厢','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1102','涵江','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1103','荔城','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1104','秀屿','371','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1105','仙游','371','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1106','梅列','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1107','三元','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1108','明溪','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1109','清流','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1110','宁化','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1111','大田','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1112','尤溪','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1113','沙','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1114','将乐','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1115','泰宁','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1116','建宁','370','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1117','永安','370','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1118','鲤城','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1119','丰泽','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1120','洛江','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1121','泉港','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1122','惠安','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1123','安溪','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1124','永春','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1125','德化','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1126','金门','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1127','石狮','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1128','晋江','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1129','南安','372','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1130','经济技术开发区','372','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1131','芗城','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1132','龙文','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1133','云霄','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1134','漳浦','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1135','诏安','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1136','长泰','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1137','东山','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1138','南靖','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1139','平和','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1140','华安','373','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1141','龙海','373','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1142','延平','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1143','顺昌','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1144','浦城','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1145','光泽','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1146','松溪','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1147','政和','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1148','邵武','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1149','武夷山','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1150','建瓯','374','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1151','建阳','374','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1152','新罗','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1153','长汀','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1154','永定','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1155','上杭','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1156','武平','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1157','连城','375','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1158','漳平','375','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1159','蕉城','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1160','霞浦','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1161','古田','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1162','屏南','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1163','寿宁','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1164','周宁','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1165','柘荣','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1166','福安','376','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1167','福鼎','376','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1168','东湖','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1169','西湖','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1170','青云谱','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1171','湾里','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1172','青山湖','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1173','南昌','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1174','新建','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1175','安义','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1176','进贤','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1177','经济技术开发区','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1178','红谷滩新','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1179','高新技术产业开发区','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1180','桑海经济技术开发区','314','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1181','英雄经济开发区','314','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1182','昌江','315','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1183','珠山','315','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1184','浮梁','315','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1185','乐平','315','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1186','安源','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1187','湘东','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1188','莲花','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1189','上栗','316','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1190','芦溪','316','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1191','庐山','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1192','浔阳','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1193','九江','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1194','武宁','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1195','修水','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1196','永修','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1197','德安','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1198','星子','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1199','都昌','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1200','湖口','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1201','彭泽','318','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1202','瑞昌','318','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1203','渝水','317','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1204','分宜','317','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1205','月湖','319','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1206','余江','319','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1207','贵溪','319','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1208','章贡','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1209','赣','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1210','信丰','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1211','大余','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1212','上犹','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1213','崇义','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1214','安远','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1215','龙南','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1216','定南','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1217','全南','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1218','宁都','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1219','于都','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1220','兴国','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1221','会昌','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1222','寻乌','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1223','石城','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1224','瑞金','320','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1225','南康','320','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1226','吉州','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1227','青原','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1228','吉安','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1229','吉水','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1230','峡江','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1231','新干','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1232','永丰','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1233','泰和','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1234','遂川','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1235','万安','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1236','安福','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1237','永新','321','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1238','井冈山','321','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1239','袁州','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1240','奉新','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1241','万载','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1242','上高','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1243','宜丰','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1244','靖安','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1245','铜鼓','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1246','丰城','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1247','樟树','322','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1248','高安','322','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1249','临川','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1250','南城','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1251','黎川','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1252','南丰','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1253','崇仁','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1254','乐安','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1255','宜黄','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1256','金溪','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1257','资溪','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1258','东乡','323','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1259','广昌','323','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1260','信州','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1261','上饶','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1262','广丰','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1263','玉山','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1264','铅山','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1265','横峰','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1266','弋阳','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1267','余干','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1268','鄱阳','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1269','万年','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1270','婺源','324','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1271','德兴','324','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1272','历下','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1273','市中','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1274','槐荫','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1275','天桥','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1276','历城','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1277','长清','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1278','平阴','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1279','济阳','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1280','商河','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1281','章丘','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1282','高新','157','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1283','经济开发区','157','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1284','市南','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1285','市北','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1286','四方','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1287','黄岛','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1288','崂山','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1289','李沧','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1290','城阳','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1291','胶州','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1292','即墨','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1293','平度','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1294','胶南','158','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1295','莱西','158','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1296','淄川','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1297','张店','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1298','博山','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1299','临淄','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1300','周村','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1301','桓台','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1302','高青','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1303','沂源','160','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1304','高新','160','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1305','市中','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1306','薛城','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1307','峄城','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1308','台儿庄','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1309','山亭','161','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1310','滕州','161','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1311','东营','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1312','河口','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1313','垦利','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1314','利津','162','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1315','广饶','162','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1316','芝罘','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1317','福山','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1318','牟平','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1319','莱山','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1320','长岛','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1321','龙口','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1322','莱阳','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1323','莱州','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1324','蓬莱','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1325','招远','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1326','栖霞','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1327','海阳','159','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1328','开发区','159','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1329','潍城','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1330','寒亭','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1331','坊子','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1332','奎文','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1333','临朐','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1334','昌乐','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1335','青州','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1336','诸城','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1337','寿光','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1338','安丘','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1339','高密','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1340','昌邑','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1341','经济开发区','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1342','滨海经济开发区','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1343','高新技术开发区','163','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1344','出口加工','163','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1345','市中','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1346','任城','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1347','微山','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1348','鱼台','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1349','金乡','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1350','嘉祥','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1351','汶上','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1352','泗水','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1353','梁山','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1354','曲阜','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1355','兖州','165','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1356','邹城','165','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1357','泰山','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1358','岱岳','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1359','宁阳','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1360','东平','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1361','新泰','166','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1362','肥城','166','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1363','环翠','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1364','文登','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1365','荣成','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1366','乳山','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1367','经济技术开发区','164','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1368','高技术开发区','164','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1369','东港','167','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1370','岚山','167','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1371','五莲','167','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1372','莒','167','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1373','莱城','168','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1374','钢城','168','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1375','兰山','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1376','罗庄','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1377','河东','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1378','沂南','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1379','郯城','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1380','沂水','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1381','苍山','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1382','费','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1383','平邑','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1384','莒南','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1385','蒙阴','170','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1386','临沭','170','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1387','德城','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1388','陵','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1389','宁津','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1390','庆云','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1391','临邑','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1392','齐河','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1393','平原','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1394','夏津','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1395','武城','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1396','乐陵','169','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1397','禹城','169','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1398','东昌府','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1399','阳谷','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1400','莘','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1401','茌平','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1402','东阿','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1403','冠','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1404','高唐','171','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1405','临清','171','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1406','滨城','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1407','惠民','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1408','阳信','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1409','无棣','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1410','沾化','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1411','博兴','172','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1412','邹平','172','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1413','牡丹','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1414','曹','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1415','单','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1416','成武','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1417','巨野','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1418','郓城','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1419','鄄城','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1420','定陶','175','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1421','东明','175','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1422','中原','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1423','二七','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1424','管城回族','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1425','金水','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1426','上街','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1427','中牟','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1428','巩义','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1429','荥阳','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1430','新密','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1431','新郑','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1432','登封','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1433','高新技术开发区','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1434','惠济','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1435','经济技术开发区','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1436','郑东新','140','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1437','出口加工','140','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1438','龙亭','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1439','顺河回族','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1440','鼓楼','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1441','杞','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1442','通许','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1443','尉氏','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1444','开封','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1445','兰考','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1446','金明','142','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1447','禹王台','142','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1448','老城','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1449','西工','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1450','瀍河回族','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1451','涧西','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1452','吉利','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1453','洛龙','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1454','孟津','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1455','新安','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1456','栾川','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1457','嵩县','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1458','汝阳','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1459','宜阳','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1460','洛宁','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1461','伊川','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1462','偃师','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1463','高新技术开发区','141','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1464','经济技术开发区','141','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1465','新华','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1466','卫东','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1467','石龙','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1468','湛河','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1469','宝丰','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1470','叶县','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1471','鲁山','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1472','郏','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1473','舞钢','143','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1474','汝州','143','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1475','文峰','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1476','北关','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1477','殷都','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1478','龙安','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1479','安阳','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1480','汤阴','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1481','滑县','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1482','内黄','147','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1483','林州','147','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1484','鹤山','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1485','山城','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1486','淇滨','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1487','浚县','145','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1488','淇县','145','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1489','红旗','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1490','卫滨','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1491','凤泉','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1492','牧野','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1493','新乡','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1494','获嘉','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1495','原阳','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1496','延津','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1497','封丘','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1498','长垣','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1499','卫辉','146','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1500','辉县','146','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1501','解放','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1502','中站','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1503','马村','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1504','山阳','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1505','修武','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1506','博爱','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1507','武陟','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1508','温县','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1509','沁阳','144','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1510','孟州','144','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1511','华龙','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1512','清丰','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1513','南乐','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1514','范县','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1515','台前','148','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1516','濮阳','148','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1517','魏都','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1518','许昌','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1519','鄢陵','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1520','襄城','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1521','禹州','149','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1522','长葛','149','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1523','源汇','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1524','郾城','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1525','召陵','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1526','舞阳','150','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1527','临颍','150','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1528','湖滨','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1529','渑池','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1530','陕县','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1531','卢氏','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1532','义马','151','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1533','灵宝','151','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1534','宛城','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1535','卧龙','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1536','南召','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1537','方城','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1538','西峡','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1539','镇平','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1540','内乡','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1541','淅川','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1542','社旗','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1543','唐河','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1544','新野','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1545','桐柏','152','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1546','邓州','152','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1547','梁园','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1548','睢阳','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1549','民权','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1550','睢县','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1551','宁陵','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1552','柘城','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1553','虞城','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1554','夏邑','153','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1555','永城','153','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1556','浉河','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1557','平桥','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1558','罗山','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1559','光山','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1560','新县','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1561','商城','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1562','固始','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1563','潢川','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1564','淮滨','154','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1565','息县','154','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1566','川汇','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1567','扶沟','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1568','西华','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1569','商水','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1570','沈丘','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1571','郸城','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1572','淮阳','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1573','太康','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1574','鹿邑','155','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1575','项城','155','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1576','驿城','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1577','西平','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1578','上蔡','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1579','平舆','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1580','正阳','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1581','确山','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1582','泌阳','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1583','汝南','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1584','遂平','156','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1585','新蔡','156','1'); 
			 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1587','江岸','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1588','江汉','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1589','硚口','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1590','汉阳','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1591','武昌','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1592','青山','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1593','洪山','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1594','东西湖','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1595','汉南','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1596','蔡甸','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1597','江夏','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1598','黄陂','204','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1599','新洲','204','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1600','黄石港','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1601','西塞山','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1602','下陆','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1603','铁山','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1604','阳新','205','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1605','大冶','205','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1606','茅箭','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1607','张湾','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1608','郧','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1609','郧西','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1610','竹山','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1611','竹溪','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1612','房县','207','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1613','丹江口','207','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1614','西陵','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1615','伍家岗','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1616','点军','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1617','虢亭','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1618','夷陵','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1619','远安','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1620','兴山','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1621','秭归','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1622','长阳土家族','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1623','五峰土家族','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1624','宜都','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1625','当阳','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1626','枝江','209','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1627','经济技术开发区','209','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1628','襄城','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1629','樊城','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1630','襄阳','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1631','南漳','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1632','谷城','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1633','保康','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1634','老河口','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1635','枣阳','206','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1636','宜城','206','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1637','梁子湖','211','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1638','华容','211','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1639','鄂城','211','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1640','东宝','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1641','掇刀','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1642','京山','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1643','沙洋','210','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1644','钟祥','210','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1645','孝南','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1646','孝昌','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1647','大悟','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1648','云梦','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1649','应城','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1650','安陆','212','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1651','汉川','212','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1652','沙市','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1653','荆州','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1654','公安','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1655','监利','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1656','江陵','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1657','石首','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1658','洪湖','208','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1659','松滋','208','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1660','黄州','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1661','团风','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1662','红安','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1663','罗田','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1664','英山','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1665','浠水','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1666','蕲春','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1667','黄梅','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1668','麻城','213','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1669','武穴','213','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1670','咸安','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1671','嘉鱼','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1672','通城','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1673','崇阳','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1674','通山','214','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1675','赤壁','214','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1676','曾都','215','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1677','广水','215','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1678','恩施','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1679','利川','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1680','建始','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1681','巴东','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1682','宣恩','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1683','咸丰','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1684','来凤','216','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1685','鹤峰','216','1'); 
			 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2997','省直辖县级行政单位','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1686','仙桃','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1687','潜江','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1688','天门','450','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1689','神农架林','450','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1690','芙蓉','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1691','天心','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1692','岳麓','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1693','开福','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1694','雨花','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1695','长沙','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1696','望城','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1697','宁乡','224','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1698','浏阳','224','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1699','荷塘','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1700','芦淞','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1701','石峰','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1702','天元','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1703','株洲','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1704','攸县','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1705','茶陵','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1706','炎陵','225','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1707','醴陵','225','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1708','雨湖','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1709','岳塘','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1710','湘潭','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1711','湘乡','226','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1712','韶山','226','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1713','珠晖','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1714','雁峰','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1715','石鼓','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1716','蒸湘','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1717','南岳','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1718','衡阳','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1719','衡南','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1720','衡山','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1721','衡东','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1722','祁东','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1723','耒阳','227','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1724','常宁','227','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1725','双清','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1726','大祥','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1727','北塔','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1728','邵东','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1729','新邵','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1730','邵阳','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1731','隆回','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1732','洞口','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1733','绥宁','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1734','新宁','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1735','城步苗族','228','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1736','武冈','228','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1737','岳阳楼','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1738','云溪','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1739','君山','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1740','岳阳','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1741','华容','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1742','湘阴','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1743','平江','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1744','汨罗','229','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1745','临湘','229','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1746','武陵','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1747','鼎城','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1748','安乡','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1749','汉寿','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1750','澧','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1751','临澧','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1752','桃源','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1753','石门','230','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1754','津市','230','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1755','永定','231','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1756','武陵源','231','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1757','慈利','231','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1758','桑植','231','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1759','资阳','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1760','赫山','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1761','南县','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1762','桃江','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1763','安化','232','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1764','沅江','232','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1765','北湖','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1766','苏仙','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1767','桂阳','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1768','宜章','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1769','永兴','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1770','嘉禾','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1771','临武','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1772','汝城','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1773','桂东','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1774','安仁','233','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1775','资兴','233','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1776','冷水滩','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1777','祁阳','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1778','东安','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1779','双牌','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1780','道','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1781','江永','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1782','宁远','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1783','蓝山','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1784','新田','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1785','江华瑶族','234','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1786','零陵','234','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1787','鹤城','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1788','中方','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1789','沅陵','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1790','辰溪','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1791','溆浦','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1792','会同','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1793','麻阳苗族','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1794','新晃侗族','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1795','芷江侗族','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1796','靖州苗族侗族','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1797','通道侗族','235','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1798','洪江','235','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1799','娄星','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1800','双峰','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1801','新化','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1802','冷水江','236','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1803','涟源','236','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1804','吉首','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1805','泸溪','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1806','凤凰','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1807','花垣','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1808','保靖','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1809','古丈','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1810','永顺','237','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1811','龙山','237','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1812','荔湾','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1813','越秀','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1814','海珠','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1815','天河','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1816','白云','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1817','黄埔','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1818','番禺','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1819','花都','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1820','增城','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1821','从化','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1822','南沙','326','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1823','萝岗','326','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1824','武江','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1825','浈江','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1826','曲江','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1827','始兴','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1828','仁化','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1829','翁源','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1830','乳源瑶族','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1831','新丰','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1832','乐昌','330','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1833','南雄','330','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1834','罗湖','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1835','福田','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1836','南山','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1837','宝安','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1838','龙岗','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1839','盐田','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1840','光明新区','327','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1841','坪山新区','327','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1842','香洲','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1843','斗门','328','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1844','金湾','328','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1845','龙湖','329','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1846','金平','329','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1847','濠江','329','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1848','潮阳','329','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1849','潮南','329','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1850','澄海','329','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1851','南澳','329','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1852','禅城','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1853','南海','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1854','顺德','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1855','三水','338','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1856','高明','338','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1857','蓬江','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1858','江海','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1859','新会','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1860','台山','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1861','开平','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1862','鹤山','337','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1863','恩平','337','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1864','赤坎','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1865','霞山','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1866','坡头','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1867','麻章','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1868','遂溪','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1869','徐闻','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1870','廉江','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1871','雷州','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1872','吴川','340','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1873','开发区','340','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1874','茂南','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1875','茂港','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1876','电白','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1877','高州','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1878','化州','341','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1879','信宜','341','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1880','端州','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1881','鼎湖','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1882','广宁','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1883','怀集','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1884','封开','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1885','德庆','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1886','高要','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1887','四会','342','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1888','高新技术产业开发区','342','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1889','惠城','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1890','惠阳','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1891','博罗','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1892','惠东','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1893','龙门','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1894','大亚湾经济技术开发区','333','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1895','仲恺高新技术产业开发区','333','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1896','梅江','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1897','梅县','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2998','嘉应','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1898','大埔','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1899','丰顺','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1900','五华','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1901','平远','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1902','蕉岭','332','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1903','兴宁','332','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1904','城区','334','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1905','陆丰','334','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1906','海丰','334','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1907','陆河','334','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1908','源城','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1909','紫金','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1910','龙川','331','1'); 
		
		
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1911','连平','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1912','和平','331','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1913','东源','331','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1914','江城','339','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1915','阳西','339','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1916','阳东','339','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1917','阳春','339','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1918','清城','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1919','佛冈','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1920','阳山','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1921','连山壮族瑶族','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1922','连南瑶族','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1923','清新','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1924','英德','343','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1925','连州','343','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1934','莞城','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1935','万江','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1936','东城','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1926','南城','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1927','石龙镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1928','长安镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1929','虎门镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1930','横沥镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1931','寮步镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1932','黄江镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1933','清溪镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1937','石碣镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1938','茶山镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1939','石排镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1940','企石镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1941','桥头镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1942','谢岗镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1943','东坑镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1944','常平镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1945','大朗镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1946','塘厦镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1947','凤岗镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1948','厚街镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1949','沙田镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1950','道滘镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1951','洪梅镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1952','麻涌镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1953','中堂镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1954','高埗镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1955','樟木头镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1956','大岭山镇','335','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1957','望牛墩镇','335','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2999','石歧','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3000','东区','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3001','南区','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3002','西区','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3003','小榄','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3004','沙溪','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3005','古镇','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3006','火炬','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3007','中山港','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3008','港口','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3009','神湾','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3010','大涌','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3011','板芙','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3012','横栏','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3013','民众','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3014','黄圃','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3015','阜沙','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3016','东凤','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3017','五桂山','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3018','三角','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3019','三乡','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3020',' 南朗','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3021','东升','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3022','坦洲','336','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3023','南头','336','1'); 
    
                  			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1959','湘桥','344','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1960','潮安','344','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1961','饶平','344','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3024','枫溪','344','1');
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1962','榕城','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1963','揭东','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1964','揭西','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1965','惠来','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1966','普宁','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1967','东山','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('3025','揭阳经济开发试验区','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1968','普宁华侨管理区','345','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1969','大南山华侨管理区','345','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1970','云城','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1971','新兴','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1972','郁南','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1973','云安','346','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1974','罗定','346','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1975','兴宁','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1976','青秀','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1977','江南','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1978','西乡塘','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1979','良庆','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1980','邕宁','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1981','武鸣','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1982','隆安','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1983','马山','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1984','上林','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1985','宾阳','354','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1986','横县','354','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1987','城中','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1988','鱼峰','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1989','柳南','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1990','柳北','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1991','柳江','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1992','柳城','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1993','鹿寨','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1994','融安','355','1'); 

			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1995','融水苗族','355','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1996','三江侗族','355','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1997','秀峰','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1998','叠彩','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('1999','象山','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2000','七星','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2001','雁山','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2002','阳朔','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2003','临桂','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2004','灵川','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2005','全州','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2006','兴安','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2007','永福','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2008','灌阳','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2009','龙胜各族','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2010','资源','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2011','平乐','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2012','荔浦','356','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2013','恭城瑶族','356','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2014','万秀','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2015','蝶山','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2016','长洲','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2017','苍梧','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2018','藤县','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2019','蒙山','357','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2020','岑溪','357','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2021','海城','358','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2022','银海','358','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2023','铁山港','358','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2024','合浦','358','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2025','港口','359','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2026','防城','359','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2027','上思','359','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2028','东兴','359','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2029','钦南','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2030','钦北','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2031','灵山','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2032','浦北','360','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2033','钦州港经济开发区','360','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2034','港北','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2035','港南','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2036','覃塘','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2037','平南','361','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2038','桂平','361','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2039','玉州','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2040','容县','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2041','陆川','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2042','博白','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2043','兴业','362','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2044','北流','362','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2045','右江','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2046','田阳','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2047','田东','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2048','平果','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2049','德保','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2050','靖西','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2051','那坡','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2052','凌云','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2053','乐业','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2054','田林','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2055','西林','363','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2056','隆林各族','363','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2057','八步','364','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2058','昭平','364','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2059','钟山','364','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2060','富川瑶族','364','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2061','金城江','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2062','南丹','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2063','天峨','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2064','凤山','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2065','东兰','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2066','罗城仫佬族','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2067','环江毛南族','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2068','巴马瑶族','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2069','都安瑶族','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2070','大化瑶族','365','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2071','宜州','365','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2072','兴宾','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2073','忻城','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2074','象州','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2075','武宣','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2076','金秀瑶族','366','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2077','合山','366','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2078','江洲','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2079','扶绥','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2080','宁明','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2081','龙州','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2082','大新','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2083','天等','367','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2084','凭祥','367','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2085','秀英','445','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2086','龙华','445','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2087','琼山','445','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2088','美兰','445','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2089','河西','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2090','河东','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2091','田独镇','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2092','凤凰镇','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2093','三亚','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2094','崖城镇','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2095','天涯镇','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2096','育才乡','446','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2097','海棠湾镇','446','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2098','五指山','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2099','琼海','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2100','儋州','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2101','文昌','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2102','万宁','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2103','东方','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2104','定安','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2105','屯昌','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2106','澄迈','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2107','临高','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2108','白沙黎族','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2109','昌江黎族','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2110','乐东黎族','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2111','陵水黎族','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2112','保亭黎族苗族','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2113','琼中黎族苗族','457','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2114','西、南、中沙群岛办事处','457','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2115','万州','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2116','涪陵','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2117','渝中','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2118','大渡口','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2119','江北','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2120','沙坪坝','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2121','九龙坡','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2122','南岸','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2123','北碚','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2124','万盛','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2125','双桥','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2126','渝北','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2127','巴南','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2128','黔江','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2129','长寿','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2130','綦江','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2131','潼南','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2132','铜梁','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2133','大足','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2134','荣昌','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2135','璧山','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2136','梁平','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2137','城口','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2138','丰都','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2139','垫江','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2140','武隆','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2141','忠县','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2142','开县','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2143','云阳','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2144','奉节','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2145','巫山','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2146','巫溪','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2147','石柱土家族','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2148','秀山土家族苗族','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2149','酉阳土家族苗族','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2150','彭水苗族土家族','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2152','江津','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2153','合川','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2154','永川','4','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2155','南川','4','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2156','锦江','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2157','青羊','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2158','金牛','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2159','武侯','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2160','成华','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2161','龙泉驿','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2162','青白江','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2163','新都','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2164','温江','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2165','金堂','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2166','双流','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2167','郫县','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2168','大邑','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2169','蒲江','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2170','新津','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2171','都江堰','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2172','彭州','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2173','邛崃','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2174','崇州','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2175','高新','384','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2176','高新西','384','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2177','自流井','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2178','贡井','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2179','大安','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2180','沿滩','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2181','荣县','385','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2182','富顺','385','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2183','东','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2184','西','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2185','仁和','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2186','米易','386','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2187','盐边','386','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2188','江阳','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2189','纳溪','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2190','龙马潭','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2191','泸县','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2192','合江','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2193','叙永','387','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2194','古蔺','387','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2195','旌阳','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2196','中江','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2197','罗江','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2198','广汉','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2199','什邡','388','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2200','绵竹','388','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2201','涪城','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2202','游仙','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2203','三台','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2204','盐亭','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2205','安县','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2206','梓潼','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2207','北川羌族','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2208','平武','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2209','江油','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2210','农科','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2211','经济技术开发区','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2212','高新','389','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2213','仙海','389','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2214','利州','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2215','元坝','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2216','朝天','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2217','旺苍','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2218','青川','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2219','剑阁','390','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2220','苍溪','390','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2221','船山','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2222','安居','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2223','蓬溪','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2224','射洪','391','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2225','大英','391','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2226','市中','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2227','东兴','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2228','威远','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2229','资中','392','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2230','隆昌','392','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2231','市中','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2232','沙湾','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2233','五通桥','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2234','金口河','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2235','犍为','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2236','井研','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2237','夹江','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2238','沐川','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2239','峨边彝族','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2240','马边彝族','393','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2241','峨眉山','393','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2242','顺庆','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2243','高坪','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2244','嘉陵','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2245','南部','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2246','营山','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2247','蓬安','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2248','仪陇','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2249','西充','394','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2250','阆中','394','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2251','东坡','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2252','仁寿','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2253','彭山','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2254','洪雅','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2255','丹棱','400','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2256','青神','400','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2257','翠屏','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2258','宜宾','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2259','南溪','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2260','江安','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2261','长宁','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2262','高县','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2263','珙县','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2264','筠连','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2265','兴文','395','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2266','屏山','395','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2267','广安','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2268','岳池','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2269','武胜','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2270','邻水','396','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2271','华蓥','396','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2272','通川','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2273','达县','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2274','宣汉','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2275','开江','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2276','大竹','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2277','渠县','397','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2278','万源','397','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2279','雨城','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2280','名山','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2281','荥经','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2282','汉源','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2283','石棉','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2284','天全','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2285','芦山','399','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2286','宝兴','399','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2287','巴州','398','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2288','通江','398','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2289','南江','398','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2290','平昌','398','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2291','雁江','401','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2292','安岳','401','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2293','乐至','401','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2294','简阳','401','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2295','汶川','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2296','理县','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2297','茂县','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2298','松潘','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2299','九寨沟','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2300','金川','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2301','小金','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2302','黑水','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2303','马尔康','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2304','壤塘','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2305','阿坝','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2306','若尔盖','402','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2307','红原','402','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2308','康定','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2309','泸定','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2310','丹巴','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2311','九龙','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2312','雅江','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2313','道孚','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2314','炉霍','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2315','甘孜','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2316','新龙','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2317','德格','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2318','白玉','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2319','石渠','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2320','色达','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2321','理塘','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2322','巴塘','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2323','乡城','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2324','稻城','403','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2325','得荣','403','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2326','西昌','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2327','木里藏族','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2328','盐源','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2329','德昌','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2330','会理','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2331','会东','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2332','宁南','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2333','普格','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2334','布拖','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2335','金阳','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2336','昭觉','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2337','喜德','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2338','冕宁','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2339','越西','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2340','甘洛','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2341','美姑','404','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2342','雷波','404','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2343','南明','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2344','云岩','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2345','花溪','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2346','乌当','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2347','白云','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2348','小河','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2349','开阳','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2350','息烽','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2351','修文','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2352','清镇','425','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2353','金阳新','425','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2354','钟山','426','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2355','六枝特','426','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2356','水城','426','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2357','盘县','426','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2358','红花岗','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2359','汇川','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2360','遵义','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2361','桐梓','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2362','绥阳','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2363','正安','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2364','道真仡佬族苗族','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2365','务川仡佬族苗族','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2366','凤冈','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2367','湄潭','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2368','余庆','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2369','习水','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2370','赤水','427','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2371','仁怀','427','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2372','西秀','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2373','平坝','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2374','普定','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2375','镇宁布依族苗族','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2376','关岭布依族苗族','428','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2377','紫云苗族布依族','428','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2378','铜仁','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2379','江口','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2380','玉屏侗族','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2381','石阡','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2382','思南','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2383','印江土家族苗族','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2384','德江','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2385','沿河土家族','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2386','松桃苗族','429','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2387','万山特','429','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2388','兴义','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2389','兴仁','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2390','普安','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2391','晴隆','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2392','贞丰','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2393','望谟','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2394','册亨','431','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2395','安龙','431','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2396','毕节','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2397','大方','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2398','黔西','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2399','金沙','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2400','织金','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2401','纳雍','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2402','威宁彝族回族苗族','430','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2403','赫章','430','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2404','凯里','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2405','黄平','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2406','施秉','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2407','三穗','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2408','镇远','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2409','岑巩','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2410','天柱','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2411','锦屏','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2412','剑河','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2413','台江','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2414','黎平','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2415','榕江','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2416','从江','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2417','雷山','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2418','麻江','432','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2419','丹寨','432','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2420','都匀','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2421','福泉','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2422','荔波','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2423','贵定','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2424','瓮安','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2425','独山','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2426','平塘','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2427','罗甸','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2428','长顺','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2429','龙里','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2430','惠水','433','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2431','三都水族','433','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2432','五华','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2433','盘龙','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2434','官渡','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2435','西山','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2436','东川','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2437','呈贡','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2438','晋宁','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2439','富民','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2440','宜良','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2441','石林彝族','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2442','嵩明','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2443','禄劝彝族苗族','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2444','寻甸回族彝族','408','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2445','安宁','408','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2446','麒麟','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2447','马龙','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2448','陆良','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2449','师宗','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2450','罗平','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2451','富源','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2452','会泽','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2453','沾益','409','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2454','宣威','409','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2455','红塔','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2456','江川','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2457','澄江','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2458','通海','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2459','华宁','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2460','易门','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2461','峨山彝族','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2462','新平彝族傣族','410','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2463','元江哈尼族彝族傣族','410','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2464','隆阳','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2465','施甸','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2466','腾冲','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2467','龙陵','411','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2468','昌宁','411','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2469','昭阳','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2470','鲁甸','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2471','巧家','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2472','盐津','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2473','大关','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2474','永善','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2475','绥江','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2476','镇雄','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2477','彝良','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2478','威信','412','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2479','水富','412','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2480','古城','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2481','玉龙纳西族','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2482','永胜','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2483','华坪','415','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2484','宁蒗彝族','415','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2485','思茅','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2486','宁洱哈尼族彝族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2487','墨江哈尼族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2488','景东彝族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2489','景谷傣族彝族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2490','镇沅彝族哈尼族拉祜族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2491','江城哈尼族彝族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2492','孟连傣族拉祜族佤族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2493','澜沧拉祜族','458','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2494','西盟佤族','458','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2495','临翔','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2496','凤庆','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2497','云县','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2498','永德','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2499','镇康','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2500','双江拉祜族佤族布朗族傣族','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2501','耿马傣族佤族','414','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2502','沧源佤族','414','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2503','楚雄','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2504','双柏','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2505','牟定','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2506','南华','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2507','姚安','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2508','大姚','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2509','永仁','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2510','元谋','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2511','武定','419','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2512','禄丰','419','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2513','个旧','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2514','开远','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2515','蒙自','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2516','屏边苗族','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2517','建水','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2518','石屏','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2519','弥勒','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2520','泸西','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2521','元阳','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2522','红河','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2523','金平苗族瑶族傣族','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2524','绿春','417','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2525','河口瑶族','417','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2526','文山','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2527','砚山','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2528','西畴','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2529','麻栗坡','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2530','马关','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2531','丘北','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2532','广南','416','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2533','富宁','416','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2534','景洪','418','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2535','勐海','418','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2536','勐腊','418','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2537','大理','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2538','漾濞彝族','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2539','祥云','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2540','宾川','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2541','弥渡','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2542','南涧彝族','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2543','巍山彝族回族','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2544','永平','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2545','云龙','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2546','洱源','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2547','剑川','420','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2548','鹤庆','420','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2549','瑞丽','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2550','潞西','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2551','梁河','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2552','盈江','421','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2553','陇川','421','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2554','泸水','422','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2555','福贡','422','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2556','贡山独龙族怒族','422','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2557','兰坪白族普米族','422','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2558','香格里拉','423','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2559','德钦','423','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2560','维西傈僳族','423','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2561','城关','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2562','林周','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2563','当雄','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2564','尼木','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2565','曲水','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2566','堆龙德庆','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2567','达孜','438','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2568','墨竹工卡','438','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2569','昌都','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2570','江达','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2571','贡觉','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2572','类乌齐','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2573','丁青','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2574','察雅','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2575','八宿','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2576','左贡','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2577','芒康','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2578','洛隆','440','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2579','边坝','440','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2580','乃东','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2581','扎囊','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2582','贡嘎','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2583','桑日','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2584','琼结','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2585','曲松','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2586','措美','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2587','洛扎','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2588','加查','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2589','隆子','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2590','错那','441','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2591','浪卡子','441','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2592','日喀则','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2593','南木林','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2594','江孜','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2595','定日','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2596','萨迦','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2597','拉孜','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2598','昂仁','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2599','谢通门','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2600','白朗','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2601','仁布','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2602','康马','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2603','定结','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2604','仲巴','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2605','亚东','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2606','吉隆','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2607','聂拉木','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2608','萨嘎','442','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2609','岗巴','442','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2610','那曲','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2611','嘉黎','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2612','比如','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2613','聂荣','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2614','安多','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2615','申扎','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2616','索','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2617','班戈','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2618','巴青','439','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2619','尼玛','439','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2620','普兰','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2621','札达','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2622','噶尔','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2623','日土','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2624','革吉','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2625','改则','443','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2626','措勤','443','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2627','林芝','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2628','工布江达','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2629','米林','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2630','墨脱','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2631','波密','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2632','察隅','444','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2633','朗县','444','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2634','新城','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2635','碑林','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2636','莲湖','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2637','灞桥','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2638','未央','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2639','雁塔','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2640','阎良','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2641','临潼','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2642','长安','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2643','蓝田','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2644','周至','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2645','户县','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2646','高陵','114','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2647','高新','114','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2648','王益','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2649','印台','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2650','耀州','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2651','宜君','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2652','新','117','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2653','渭滨','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2654','金台','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2655','陈仓','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2656','凤翔','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2657','岐山','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2658','扶风','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2659','眉县','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2660','陇县','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2661','千阳','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2662','麟游','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2663','凤','115','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2664','太白','115','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2665','秦都','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2666','渭城','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2667','杨陵','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2668','三原','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2669','泾阳','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2670','兴平','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2671','乾县','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2672','礼泉','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2673','永寿','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2674','彬县','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2675','长武','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2676','旬邑','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2677','淳化','118','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2678','武功','118','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2679','临渭','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2680','华县','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2681','潼关','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2682','大荔','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2683','合阳','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2684','澄城','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2685','蒲城','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2686','白水','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2687','富平','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2688','韩城','119','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2689','华阴','119','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2690','宝塔','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2691','延长','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2692','延川','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2693','子长','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2694','安塞','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2695','志丹','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2696','吴旗','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2697','甘泉','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2698','富','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2699','洛川','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2700','宜川','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2701','黄龙','116','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2702','黄陵','116','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2703','汉台','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2704','南郑','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2705','城固','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2706','洋','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2707','西乡','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2708','勉县','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2709','宁强','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2710','略阳','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2711','镇巴','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2712','留坝','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2713','佛坪','120','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2714','经济开发区','120','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2715','榆阳','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2716','神木','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2717','府谷','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2718','横山','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2719','靖边','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2720','定边','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2721','绥德','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2722','米脂','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2723','佳县','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2724','吴堡','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2725','清涧','121','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2726','子洲','121','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2727','汉滨','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2728','汉阴','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2729','石泉','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2730','宁陕','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2731','紫阳','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2732','岚皋','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2733','平利','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2734','镇坪','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2735','旬阳','122','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2736','白河','122','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2737','商州','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2738','洛南','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2739','丹凤','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2740','商南','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2741','山阳','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2742','镇安','123','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2743','柞水','123','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2744','城关','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2745','七里河','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2746','西固','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2747','安宁','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2748','红古','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2749','永登','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2750','皋兰','99','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2751','榆中','99','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2752','嘉峪关','103','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2753','金川','101','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2754','永昌','101','1');
			  
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2755','白银','102','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2756','平川','102','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2757','靖远','102','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2758','会宁','102','1'); 
		
<<<<<<< HEAD
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2759','��̩','102','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2760','����','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2761','���','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2762','��ˮ','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2763','�ذ�','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2764','�ʹ�','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2765','��ɽ','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2766','�żҴ�����','100','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2767','����','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2768','����','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2769','����','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2770','��ף����','104','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2771','����','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2772','����ԣ����','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2773','����','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2774','����','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2775','��̨','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2776','ɽ��','105','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2777','���','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2778','����','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2779','��̨','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2780','����','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2781','��ͤ','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2782','ׯ��','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2783','����','106','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2784','����','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2785','����','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2786','����','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2787','�౱�ɹ���','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2788','��������������','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2789','����','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2790','�ػ�','107','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2791','����','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2792','���','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2793','��','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2794','����','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2795','��ˮ','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2796','����','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2797','��','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2798','��ԭ','108','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2799','����','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2800','ͨμ','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2801','¤��','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2802','μԴ','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2803','���','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2804','��','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2805','�','109','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2806','�䶼','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2807','��','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2808','��','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2809','崲�','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2810','��','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2811','����','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2812','��','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2813','��','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2814','����','459','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2815','����','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2816','����','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2817','����','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2818','����','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2819','���','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2820','����','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2821','������','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2822','��ʯɽ�����嶫����������','111','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2823','����','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2824','��̶','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2825','׿��','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2826','����','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2827','����','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2828','����','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2829','µ��','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2830','�ĺ�','110','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2831','�Ƕ�','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2832','����','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2833','����','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2834','�Ǳ�','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2835','��ͨ��������','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2836','����','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2837','��Դ','90','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2838','ƽ��','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2839','��ͻ�������','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2840','�ֶ�','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2841','��������','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2842','��¡����','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2843','ѭ��������','91','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2844','��Դ����','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2845','����','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2846','����','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2847','�ղ�','92','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2848','ͬ��','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2849','����','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2850','���','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2851','�����ɹ���','93','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2852','����','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2853','ͬ��','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2854','���','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2855','�˺�','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2856','����','94','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2857','����','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2858','����','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2859','�ʵ�','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2860','����','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2861','����','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2862','���','95','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2863','����','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2864','�Ӷ�','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2865','�ƶ�','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2866','�ζ�','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2867','��ǫ','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2868','������','96','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2869','���ľ','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2870','�����','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2871','����','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2872','����','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2873','���','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2874','�����ί','97','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2875','����','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2876','����','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2877','���','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2878','����','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2879','����','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2880','����','61','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2881','�����','62','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2882','��ũ','62','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2883','ƽ��','62','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2884','��ͨ','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2885','�γ�','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2886','ͬ��','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2887','��ͭϿ','63','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2888','ԭ��','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2889','����','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2890','¡��','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2891','��Դ','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2892','����','64','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2893','ɳ��ͷ','460','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2894','����','460','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2895','��ԭ','460','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2896','��ɽ','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2897','ɳ���Ϳ�','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2898','��','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2899','ˮĥ��','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2900','ͷ�ͺ�','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2901','�����','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2902','�׶�','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2903','��³ľ��','65','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2904','��ɽ��','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2905','��������','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2906','�׼�̲','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2907','�ڶ���','66','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2908','��³��','67','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2909','۷��','67','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2910','�п�ѷ','67','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2911','����','68','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2912','������������','68','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2913','����','68','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2914','����','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2915','����','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2916','��Ȫ','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2917','��ͼ��','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2918','����˹','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2919','��̨','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2920','��ľ����','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2921','ľ�ݹ�����','74','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2922','����','75','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2923','����','75','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2924','��Ȫ','75','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2925','�����','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2926','��̨','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2927','ξ��','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2928','��Ǽ','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2929','��ĩ','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2930','���Ȼ���','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2931','�;�','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2932','��˶','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2933','����','73','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2934','������','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2935','����','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2936','�⳵','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2937','ɳ��','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2938','�º�','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2939','�ݳ�','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2940','��ʲ','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2941','������','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2942','��ƺ','70','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2943','��ͼʲ','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2944','������','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2945','������','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2946','��ǡ','72','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2947','��ʲ','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2948','�踽','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2949','����','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2950','Ӣ��ɳ','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2951','����','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2952','ɯ��','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2953','Ҷ��','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2954','�����','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2955','���պ�','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2956','٤ʦ','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2957','�ͳ�','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2958','��ʲ�����������','71','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2959','����','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2960','����','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2961','ī��','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2962','Ƥɽ','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2963','����','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2964','����','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2965','����','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2966','���','69','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2967','����','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2968','����','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2969','����','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2970','�첼�������','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2971','����','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2972','����','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2973','��Դ','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2974','����','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2975','�ؿ�˹','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2976','���տ�','76','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2977','����','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2978','����','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2979','����','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2980','ɳ��','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2981','����','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2982','ԣ��','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2983','�Ͳ��������ɹ�','77','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2984','����̩','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2985','������','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2986','����','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2987','����','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2988','���ͺ�','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2989','���','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2990','��ľ��','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2991','ʯ����','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2992','������','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2993','ͼľ���','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2994','�����','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2995','���','447','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2996','����','448','1'); 
>>>>>>> 4bbe80dbe97eaaefe9308eea0f82ba3ed48d0de9
=======
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2759','景泰','102','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2760','秦州','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2761','麦积','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2762','清水','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2763','秦安','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2764','甘谷','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2765','武山','100','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2766','张家川回族','100','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2767','凉州','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2768','民勤','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2769','古浪','104','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2770','天祝藏族','104','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2771','甘州','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2772','肃南裕固族','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2773','民乐','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2774','临泽','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2775','高台','105','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2776','山丹','105','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2777','崆峒','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2778','泾川','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2779','灵台','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2780','崇信','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2781','华亭','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2782','庄浪','106','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2783','静宁','106','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2784','肃州','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2785','金塔','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2786','安西','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2787','肃北蒙古族','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2788','阿克塞哈萨克族','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2789','玉门','107','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2790','敦煌','107','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2791','西峰','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2792','庆城','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2793','环','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2794','华池','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2795','合水','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2796','正宁','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2797','宁','108','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2798','镇原','108','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2799','安定','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2800','通渭','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2801','陇西','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2802','渭源','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2803','临洮','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2804','漳','109','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2805','岷','109','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2806','武都','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2807','成','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2808','文','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2809','宕昌','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2810','康','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2811','西和','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2812','礼','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2813','徽','459','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2814','两当','459','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2815','临夏','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2816','临夏','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2817','康乐','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2818','永靖','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2819','广河','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2820','和政','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2821','东乡族','111','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2822','积石山保安族东乡族撒拉族','111','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2823','合作','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2824','临潭','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2825','卓尼','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2826','舟曲','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2827','迭部','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2828','玛曲','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2829','碌曲','110','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2830','夏河','110','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2831','城东','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2832','城中','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2833','城西','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2834','城北','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2835','大通回族土族','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2836','湟中','90','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2837','湟源','90','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2838','平安','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2839','民和回族土族','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2840','乐都','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2841','互助土族','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2842','化隆回族','91','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2843','循化撒拉族','91','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2844','门源回族','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2845','祁连','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2846','海晏','92','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2847','刚察','92','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2848','同仁','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2849','尖扎','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2850','泽库','93','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2851','河南蒙古族','93','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2852','共和','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2853','同德','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2854','贵德','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2855','兴海','94','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2856','贵南','94','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2857','玛沁','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2858','班玛','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2859','甘德','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2860','达日','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2861','久治','95','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2862','玛多','95','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2863','玉树','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2864','杂多','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2865','称多','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2866','治多','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2867','囊谦','96','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2868','曲麻莱','96','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2869','格尔木','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2870','德令哈','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2871','乌兰','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2872','都兰','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2873','天峻','97','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2874','大柴旦行委','97','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2875','兴庆','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2876','西夏','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2877','金凤','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2878','永宁','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2879','贺兰','61','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2880','灵武','61','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2881','大武口','62','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2882','惠农','62','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2883','平罗','62','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2884','利通','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2885','盐池','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2886','同心','63','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2887','青铜峡','63','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2888','原州','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2889','西吉','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2890','隆德','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2891','泾源','64','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2892','彭阳','64','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2893','沙坡头','460','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2894','中宁','460','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2895','海原','460','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2896','天山','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2897','沙依巴克','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2898','新','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2899','水磨沟','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2900','头屯河','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2901','达坂城','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2902','米东','65','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2903','乌鲁木齐','65','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2904','独山子','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2905','克拉玛依','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2906','白碱滩','66','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2907','乌尔禾','66','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2908','吐鲁番','67','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2909','鄯善','67','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2910','托克逊','67','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2911','哈密','68','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2912','巴里坤哈萨克','68','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2913','伊吾','68','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2914','昌吉','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2915','阜康','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2916','米泉','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2917','呼图壁','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2918','玛纳斯','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2919','奇台','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2920','吉木萨尔','74','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2921','木垒哈萨克','74','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2922','博乐','75','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2923','精河','75','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2924','温泉','75','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2925','库尔勒','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2926','轮台','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2927','尉犁','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2928','若羌','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2929','且末','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2930','焉耆回族','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2931','和静','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2932','和硕','73','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2933','博湖','73','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2934','阿克苏','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2935','温宿','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2936','库车','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2937','沙雅','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2938','新和','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2939','拜城','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2940','乌什','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2941','阿瓦提','70','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2942','柯坪','70','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2943','阿图什','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2944','阿克陶','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2945','阿合奇','72','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2946','乌恰','72','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2947','喀什','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2948','疏附','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2949','疏勒','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2950','英吉沙','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2951','泽普','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2952','莎车','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2953','叶城','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2954','麦盖提','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2955','岳普湖','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2956','伽师','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2957','巴楚','71','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2958','塔什库尔干塔吉克','71','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2959','和田','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2960','和田','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2961','墨玉','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2962','皮山','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2963','洛浦','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2964','策勒','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2965','于田','69','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2966','民丰','69','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2967','伊宁','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2968','奎屯','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2969','伊宁','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2970','察布查尔锡伯','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2971','霍城','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2972','巩留','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2973','新源','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2974','昭苏','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2975','特克斯','76','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2976','尼勒克','76','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2977','塔城','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2978','乌苏','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2979','额敏','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2980','沙湾','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2981','托里','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2982','裕民','77','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2983','和布克赛尔蒙古','77','1'); 
			 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2984','阿勒泰','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2985','布尔津','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2986','富蕴','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2987','福海','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2988','哈巴河','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2989','青河','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2990','吉木乃','78','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2991','石河子','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2992','阿拉尔','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2993','图木舒克','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2994','五家渠','79','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2995','香港','447','1'); 
			 INSERT INTO zfwx_region_district(id,name,city_id,status)VALUES('2996','澳门','448','1'); 
>>>>>>> a4c43d1bdd49a9d30c2f48d19f2bc55d765ece28

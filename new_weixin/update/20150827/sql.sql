-- 社区运营商申请记录 数据表

CREATE TABLE IF NOT EXISTS `zfwx_applyforoperator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `community` int(11) DEFAULT NULL,
  `msg` text,
  `comment` varchar(255) DEFAULT NULL,
  `submit_time` varchar(100) DEFAULT NULL,
  `process_time` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='社区运营商申请记录' AUTO_INCREMENT=1 ;
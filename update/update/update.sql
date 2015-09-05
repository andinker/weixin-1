
DROP TABLE IF EXISTS `zfwx_inform`;
CREATE TABLE IF NOT EXISTS `zfwx_inform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(120) NOT NULL,
  `dining` varchar(60) NOT NULL DEFAULT '1' COMMENT '订餐配置1全开',
  `product` varchar(60) NOT NULL DEFAULT '1' COMMENT '商城通知',
  `group` varchar(60) NOT NULL DEFAULT '1' COMMENT '团购通知开关',
  `yuyue` varchar(60) NOT NULL DEFAULT '1' COMMENT '预约通知开关',
  `tydd` varchar(60) NOT NULL DEFAULT '1' COMMENT '通用订单通知开关',
  `biaodan` varchar(60) NOT NULL DEFAULT '1' COMMENT '自定义表单通知开关',
  `yiliao` varchar(60) NOT NULL DEFAULT '1' COMMENT '测试医疗',
  `jiudian` varchar(60) NOT NULL DEFAULT '1' COMMENT '酒店',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- 表的结构 `zfwx_product_detail`
--

CREATE TABLE IF NOT EXISTS `zfwx_product_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '商品ID',
  `format` varchar(100) NOT NULL COMMENT '商品的规格（大小）',
  `color` varchar(100) NOT NULL COMMENT '颜色',
  `num` int(10) unsigned NOT NULL COMMENT '数量',
  `price` float NOT NULL COMMENT '价格',
  `vprice` float NOT NULL,
  `logo` varchar(200) NOT NULL COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

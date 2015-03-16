--
-- 表的结构 `zfwx_market`
--

DROP TABLE IF EXISTS `zfwx_market`;
CREATE TABLE IF NOT EXISTS `zfwx_market` (
  `market_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `title` char(30) NOT NULL,
  `keyword` char(20) NOT NULL,
  `tel` char(25) NOT NULL,
  `address` varchar(100) NOT NULL,
  `longitude` char(20) NOT NULL,
  `latitude` char(20) NOT NULL,
  `line` varchar(100) NOT NULL,
  `intro` text NOT NULL,
  `logo_pic` varchar(300) NOT NULL,
  `token` char(20) NOT NULL,
  `market_index_tpl` mediumint(9) NOT NULL,
  `tenant_index_tpl` mediumint(9) NOT NULL,
  `tenant_list_tpl` mediumint(9) NOT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zfwx_market_nav`
--

DROP TABLE IF EXISTS `zfwx_market_nav`;
CREATE TABLE IF NOT EXISTS `zfwx_market_nav` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nav_name` char(35) NOT NULL,
  `nav_pic` varchar(300) NOT NULL,
  `nav_link` varchar(300) NOT NULL,
  `is_show` enum('0','1') NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `market_id` int(11) NOT NULL,
  `token` char(20) NOT NULL,
  `is_system` enum('0','1') NOT NULL,
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zfwx_market_park`
--

DROP TABLE IF EXISTS `zfwx_market_park`;
CREATE TABLE IF NOT EXISTS `zfwx_market_park` (
  `park_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `park_name` char(35) NOT NULL,
  `park_num` tinyint(4) NOT NULL,
  `park_intro` text NOT NULL,
  `is_use` enum('0','1') NOT NULL,
  `add_time` char(10) NOT NULL,
  `market_id` int(11) NOT NULL,
  `token` char(20) NOT NULL,
  PRIMARY KEY (`park_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zfwx_market_slide`
--

DROP TABLE IF EXISTS `zfwx_market_slide`;
CREATE TABLE IF NOT EXISTS `zfwx_market_slide` (
  `slide_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_title` varchar(60),
  `slide_url` varchar(300) NOT NULL,
  `slide_link` varchar(300) NOT NULL,
  `market_id` int(11) NOT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

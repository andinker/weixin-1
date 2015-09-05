
/*插入小区模板3*/
INSERT INTO `zfwx_tmpls` (`id`, `tplid`, `name`, `views`, `type`, `imgurl`, `info`, `attr`, `status`, `sort`) VALUES (NULL, 'xq3', '我的小区模板3', 'xq3_index', '1', 'xq_cate3.png', '我的小区模板3', 'myxq', '1', '255');

/*微站文章分类在分类导航页的显示开关*/
ALTER TABLE  `zfwx_classify` ADD  `navpage_status` TINYINT NOT NULL DEFAULT  '1' AFTER  `status`;


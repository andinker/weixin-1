<?php
//字段修改记录
header("Content-type: text/html; charset=utf-8");
$root_path="../../";
$vs=require($root_path.'Conf/version.php');
$current_banben=$vs['release'];
$update_banben='20141031.2';
$need_banben='20141011';
$ver='2.3';
error_reporting(0);//去除错误提示！

if($current_banben<$need_banben){
	exit('请升级到'.$need_banben.'后再升级此补丁');
}
if($current_banben>=$update_banben){
	exit('您已经升级过:<b> V</b>'.$ver.' <'.$update_banben.'> 版本了！<a href="javascript:history.go(-1);">返回上一页</a>');
}
$arr = require($root_path."Conf/db.php");
$dbpre=$arr['DB_PREFIX'];
$conn =mysql_connect($arr['DB_HOST'],$arr['DB_USER'],$arr['DB_PWD']) or die("连接数据库失败!");
mysql_select_db($arr['DB_NAME'],$conn);
mysql_query("set names utf8");

echo '更新开始...<br>';

session_start();
echo '启用session记录更新！';

if(!pdo_fieldexists("{$dbpre}company_cate",'isDining')){
	$sql="ALTER TABLE `".$dbpre."company_cate` ADD `sort`  int(6) NOT NULL DEFAULT 255 COMMENT '排序',
		ADD `isDining`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持订餐',
		ADD `isProduct`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持商城',
		ADD `isGroup`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持团购',
		ADD `isMarket`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持商圈';";	
	$sql=mysql_query($sql);
	if($sql){
		echo '表 company_cate 字段添加成功,数据表已准备就绪！';
		setcomcate($dbpre,$conn);
	}else{
		echo '表 company_cate 字段增加失败，数据不完整无法继续整合门店分类信息';	
	}
	echo "</br> ";
}else{
	setcomcate($dbpre,$conn);	
}

if(!pdo_fieldexists("{$dbpre}company_area",'isDining')){
	$sql="ALTER TABLE `".$dbpre."company_area` ADD `sort`  int(6) NOT NULL DEFAULT 255 COMMENT '排序',
		ADD `isDining`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持订餐',
		ADD `isProduct`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持商城',
		ADD `isGroup`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持团购',
		ADD `isMarket`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否支持商圈';";
	$sql=mysql_query($sql);
	if($sql){
		echo '表 company_area 字段添加成功,数据表已准备就绪！';
		setcomarea($dbpre,$conn);
	}else{
		echo '表 company_area 字段增加失败，数据不完整无法继续整合门店区域信息';
	}
	echo "</br> ";
}else{
	setcomarea($dbpre,$conn);
}

if(!pdo_fieldexists("{$dbpre}company",'qrcode')){
	$sql="ALTER TABLE `".$dbpre."company` ADD `add_time` varchar(60) DEFAULT NULL COMMENT '添加时间',
	ADD `cateid` int(10) DEFAULT NULL COMMENT '分类id', ADD `areaid` int(10) DEFAULT NULL COMMENT '区域id',
	ADD `qrcode` varchar(200) DEFAULT NULL COMMENT '商家宣传二维码';";
	$sql=mysql_query($sql);
	if($sql){
		echo '表 company 字段添加成功';
	}else{
		echo '表 company 字段增加失败';
	}
	echo "</br> ";
}


echo '创建数据表开始...<br>';
$sqlfile = 'update.sql';
$sqls = _get_sql($sqlfile);
foreach ($sqls as $sql) {
	//替换前缀
	$sql = str_replace('`zfwx_', '`' . $dbpre, $sql);
	$run = mysql_query($sql, $conn);
	//获得表名
	if (substr($sql, 0, 12) == 'CREATE TABLE') {
		$table_name = $dbpre . preg_replace("/CREATE TABLE IF NOT EXISTS `" . $dbpre . "([a-z0-9_]+)` .*/is", "\\1", $sql);
		echo $table_name.'创建成功...<br>';
	}
	//获得表名
	if (substr($sql, 0, 11) == 'INSERT INTO') {
		$table_name2 = $dbpre . preg_replace("/INSERT INTO `" . $dbpre . "([a-z0-9_]+)` .*/is", "\\1", $sql);
		echo $table_name2.'插入数据成功...<br>';
	}
}
/**整合分类表**/
function setcomcate($dbpre,$conn){
	$ccdb="`{$dbpre}company_cate`";
	$ccsql='SELECT * FROM '.$ccdb;
	$ccquery=mysql_query($ccsql, $conn);	 
	$a=0;
	$company_cate=array();
	while ($list=mysql_fetch_array($ccquery,MYSQL_ASSOC)){
		$company_cate[$i]=$list;
        $i++;
	}
	$isadd=pdo_fieldexists("{$dbpre}company_cate",'isProduct');
	$msg=array(
		'您已经更新过了！谢谢支持！',
		'过程不可中断，不可断网，不可关闭网页，若因客户原因造成问题，概不负责！有问题请马上前往论坛详细说明反馈！近期有专人负责解决！',
		'更新原门店分类数据！',
		'门店分类数据更新完毕',
		'门店区域数据更新失败，请联系技术支持智风论坛~温柔如斯！',
		);
	if($isadd){
		if($_SESSION['ifsetfield']){echo '</br>'.$msg[0];  	//unset($_SESSION['ifsetfield']);
		}else{	
			echo "</br>".$msg[1];	echo "</br> ".$msg[2].'</br>';
			$ccdata=ccdata($company_cate);
			foreach($ccdata as $k=>$c){			
				$id=isset($c['id'])?$c['id']:'';
				$ccsqlstr="UPDATE {$ccdb} SET ";
				if(is_array($c)){
					foreach($c as $kk=>$cc){
						if(!empty($cc)){	$ccsqlstr.= "`{$kk}`='{$cc}',";	}
					}
				}
				$saveccsql=trim($ccsqlstr,',')." WHERE ( `id` ='".$id."' );";					
				$ccsavequery=mysql_query($saveccsql, $conn);
				$saveccsql='';				
				if($ccsavequery){
					echo "更新id为{$id}的数据成功</br> ";
				}else{
					echo "更新id为{$id}的数据失败，请联系技术反馈！技术支持：智风论坛~温柔如斯</br> ";
				}
			}
			$_SESSION['ifsetfield']=1;
			if($ccsavequery){	echo "</br> ".$msg[3];	}else{	echo "</br> ".$msg[4];	}				
		}
	}else{
		echo "门店分类表字段数据不完整无法完成更新！请联系技术支持！技术支持：智风论坛~温柔如斯 ";
	}
	echo '</br> ';
}
/**整合区域表**/
function setcomarea($dbpre,$conn){
	$cadb="`{$dbpre}company_area`";
	$casql='SELECT * FROM '.$cadb;
	$caquery=mysql_query($casql, $conn);
	$a=0;
	$company_area=array();
	while ($list=mysql_fetch_array($caquery,MYSQL_ASSOC)){
		$company_area[$i]=$list;
        $i++;
	}
	$isadd=pdo_fieldexists($dbpre."company_area",'isProduct');
	$msg=array(
		'您已经更新过了！谢谢支持！',
		'过程不可中断，不可断网，不可关闭网页，若因客户原因造成问题，概不负责！有问题请马上前往论坛详细说明反馈！近期有专人负责解决！',
		'更新原门店区域数据！',
		'门店区域数据更新完毕',
		'门店区域数据更新失败，请联系技术支持智风论坛~温柔如斯！'
		);
	if($isadd){
		if($_SESSION['ifsetarea']){	
			echo '</br>'.$msg[0];  				
		}else{	
			echo "</br>".$msg[1];	echo "</br> ".$msg[2].'</br>';
			$ccdata=ccdata($company_area);
			foreach($ccdata as $c){
				$id=isset($c['id'])?$c['id']:'';
				$ccsqlstr="UPDATE {$cadb} SET ";
				if(is_array($c)){
					foreach($c as $kk=>$cc){
						if(!empty($cc)){	$ccsqlstr.= "`{$kk}`='{$cc}',";	}
					}
				}
				$saveccsql=trim($ccsqlstr,',')." WHERE ( `id` ='".$id."' );";					
				$ccsavequery=mysql_query($saveccsql, $conn);
				$saveccsql='';				
				if($ccsavequery){
					echo "更新id为{$id}的数据成功</br> ";
				}else{
					echo "更新id为{$id}的数据失败，请联系技术反馈！技术支持：智风论坛~温柔如斯</br> ";
				}
			}
			$_SESSION['ifsetarea']=1;	
			if($ifsavecc){	echo "</br> ".$msg[3];	}else{	echo "</br> ".$msg[4];	}			
		}
	}else{							
		echo "门店区域表字段数据不完整无法完成更新！请联系技术支持！技术支持：智风论坛~温柔如斯 ";
	}
	echo '</br> ';
}
	
function ccdata($company_cate){
	foreach($company_cate as $ck=>$cc){
		switch($cc['type']){
			case "dining":							
				$company_cate[$ck]['isDining']=1;
			break;
			case "shop":
				$company_cate[$ck]['isProduct']=1;
			break;
			case "group":
				$company_cate[$ck]['isGroup']=1;
			break;
			case "market":				
				$company_cate[$ck]['isMarket']=1;
			break;
			default :
				$company_cate[$ck]['isDining']=1;
				$company_cate[$ck]['isProduct']=1;
				$company_cate[$ck]['isGroup']=1;
				$company_cate[$ck]['isMarket']=1;
		}
		
	}
	return $company_cate;
}



file_put_contents($root_path.'data/update.log',$update_banben.' '.date('Y-m-d H:i:s')."\r\n",FILE_APPEND);
config_edit($ver,$update_banben,$root_path);
echo "<br>执行更新完成，开始清除缓存！";
echo "<br>缓存路径：/data/runtime";
$delrunlog=delrun($root_path.'data/runtime');
echo $delrunlog;
echo "<br>缓存清理完成！本次更新结束！！";
function _get_sql($sql_file) {
	$contents = file_get_contents($sql_file);
	$contents = str_replace("\r\n", "\n", $contents);
	$contents = trim(str_replace("\r", "\n", $contents));
	$return_items = $items = array();
	$items = explode(";\n", $contents);

	foreach ($items as $item) {
		$return_item = '';
		$item = trim($item);
		$lines = explode("\n", $item);
		foreach ($lines as $line) {
			if (isset($line[1]) && $line[0] . $line[1] == '--') {
				continue;
			}
			$return_item .= $line;
		}
		if ($return_item) {
			$return_items[] = $return_item; //.";";
		}
	}
	return $return_items;
}
//写入config文件
function config_edit($ver,$release,$root_path) {
	$config_file = $root_path.'Conf/version.php';
	$config_ver = include($config_file);
	$config_ver['ver']=$ver;
	$config_ver['release']=$release;
	if (phpversion() > 5.0){
		@file_put_contents($config_file, "<?php\nreturn ".var_export($config_ver,true).";\n?>");
	}
}
//验证数据字段
function pdo_fieldexists($tablename, $fieldname = '') {
	$isexists = mysql_query("DESCRIBE ".$tablename." `".$fieldname."`");
	$isexists = mysql_fetch_array($isexists);
	return !empty($isexists) ? true : false;
}
//判断属性值是否存在
function db_fieldvalue($tablename, $fieldname = '',$value='') {
	$isexists = mysql_fetch_array(mysql_query("select count(*) from ".$tablename." where ".$fieldname." = '".$value."'"));
	return $isexists[0]?true:false;
}
//检测表是否存在
function existTable($table){
	return mysql_num_rows(mysql_query("SHOW TABLES LIKE '".$table."'"))?true:false;
}
//clearRuntime
function delrun($rundir) {
    //先删除目录下的文件：
    $dh=opendir($rundir);
	$delstr='清理缓存开始..';
    while($file=readdir($dh)){
        if($file!="."&&$file!=".."){
            $fullpath=$rundir."/".$file;
            if(is_dir($fullpath)){
               $deldir= delrundir($fullpath);
				$delstr.="</br>文件夹：";
				$delstr.= $deldir ?"{$fullpath}删除成功！":"{$fullpath}删除失败！";
			}else{
                $delfile=unlink($fullpath);
				$delstr.="</br>文件：";
				$delstr.= $delfile?"{$fullpath}删除成功！":"{$fullpath}删除失败！";
            }
        }        
    }
    closedir($dh);
	return $delstr;
}
function delrundir($rundir){
    //先删除目录下的文件：
    $dh=opendir($rundir);
    while($file=readdir($dh)){
        if($file!="."&&$file!=".."){
            $fullpath=$rundir."/".$file;
            if(is_dir($fullpath)){
                delrundir($fullpath);
            }else{
                unlink($fullpath);
            }
        }        
    }
    closedir($dh);
    //删除目录文件夹
    if(rmdir($rundir)){
        return  true;
    }else{
        return false;
    }   
}
?>	
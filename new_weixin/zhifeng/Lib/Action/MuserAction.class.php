<?php
class MuserAction  extends UserAction{
	protected function _initialize(){
		parent::_initialize();
		
		// 引导用户选择公众号
		$token = session('token');
		
		if (empty($token) && MODULE_NAME != 'Index' && ACTION_NAME != 'index'){
			$this->redirect(U('Index/index')); 
		}
		
		// 如果已经登录、列出用户帐号下的所有公众号
		if (session('uid')!=false){
			$where['uid']=session('uid');
			$db=M('Wxuser');
			$wxusers=$db->where($where)->select();
			$this->assign('wxusers',$wxusers);
		}
		
		
	}
	
	protected function ___init_ppc_data_dir( &$url_path ){
		 
		$token = $_SESSION['token'];
		$first_c = mb_substr($_SESSION['token'],0,1,'UTF-8');
	
		$dir_Uploads =  SITE_ROOT.'/data/Uploads';
		$dir_first_c =  SITE_ROOT.'/data/Uploads/'.$first_c;
		$dir_token_d =  SITE_ROOT.'/data/Uploads/'.$first_c.'/'.$token;
		$dir_ckeditor_d = SITE_ROOT.'/data/Uploads/'.$first_c.'/'.$token.'/PhonePhotoUpload';
	
		if (!file_exists($dir_Uploads)||!is_dir($dir_Uploads)){
			mkdir($dir_Uploads,0777);
		}
	
		if (!file_exists($dir_first_c)||!is_dir($dir_first_c)){
			mkdir($dir_first_c,0777);
		}
	
		if (!file_exists($dir_token_d)||!is_dir($dir_token_d)){
			mkdir($dir_token_d,0777);
		}
	
		if (!file_exists($dir_ckeditor_d)||!is_dir($dir_ckeditor_d)){
			mkdir($dir_ckeditor_d,0777);
		}
	
		if (!file_exists($dir_ckeditor_d)||!is_dir($dir_ckeditor_d)){
			echo '初始化数据存放目录失败，不能使用上传功能！';
			exit();
		}else{
			$url_path = '/data/Uploads/'.$first_c.'/'.$token.'/PhonePhotoUpload';
			return $dir_ckeditor_d;
		}
	}
}
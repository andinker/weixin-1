<?php
class PhotoAction extends BaseAction{
	public function index(){
		$token=$this->_get('token');
		$reply_info_db=M('Reply_info');
		$config=$reply_info_db->where(array('token'=>$token,'infotype'=>'album'))->find();
		if ($config){
			$headpic=$config['picurl'];
		}else {
			$headpic=__ROOT__.'/tpl/Wap/default/common/css/Photo/banner.jpg';
		}
		$this->assign('headpic',$headpic);
		
		$agent = $_SERVER['HTTP_USER_AGENT']; 
		if(!strpos($agent,"MicroMessenger")) {
			//echo '此功能只能在微信浏览器中使用';exit;
		}
		
		if($token==false){
			echo '数据不存在';exit;
		}
		$photo=M('Photo')->where(array('token'=>$token,'status'=>1))->order('id desc')->select();
		if($photo==false){ }
		$this->assign('photo',$photo);
		$this->display();
	}
	public function plist(){
		$agent = $_SERVER['HTTP_USER_AGENT']; 
		if(!strpos($agent,"MicroMessenger")) {
		//	echo '此功能只能在微信浏览器中使用';exit;
		}
		$token=$this->_get('token');
		if($token==false){
			echo '数据不存在';exit;
		}

		$reply_info_db=M('Reply_info');
		$config=$reply_info_db->where(array('token'=>$token,'infotype'=>'album'))->find();
		if ($config){
			$headpic=$config['picurl'];
		}else {
			$headpic=__ROOT__.'/tpl/Wap/default/common/css/Photo/banner.jpg';
		}
		$this->assign('headpic',$headpic);

		$info=M('Photo')->where(array('token'=>$token,'id'=>$this->_get('id')))->find();
		$photo_list=M('Photo_list')->where(array('token'=>$token,'pid'=>$this->_get('id'),'status'=>1))->select();
		$this->assign('info',$info);
		$this->assign('photo',$photo_list);
		$this->display();
		
	
	}
}
?>
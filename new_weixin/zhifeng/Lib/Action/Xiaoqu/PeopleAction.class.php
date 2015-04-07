<?php
class PeopleAction extends XiaoquAction {
	function register() {
		$this->assign('error',$error);
		$this->display();
	}
	
	function getcode(){
		if (empty($_GET['phone'])){
			echo '手机号码不正确';
			return false;
		}
		
		$code = mt_rand(100000,999999);
		session('code',$code);
		
		$this->sendSMS(array($_GET['phone']), "您的验证码是$code", $error);
		
		echo $error;
	}
	
	function checkcode() {
		echo session('code');
	}
	
	function login() {
		$this->display(); 
	}
}
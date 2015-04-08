<?php
class PeopleAction extends XiaoquAction {
	
	/**
	 * 消费者用户注册
	 */
	public function register() {
		
		//检查提交 
		$error = '注册成功';
		if (IS_POST){
			$db = D('People');
			if ($rs = $db->create()){
				if ($id = $db->add()){
					//自动登录
					//$error = $error.''.$id;
					$this->login($id);
				}else{
					$error = $db->getDbError();
				}
			}else{
				$error = $db->getError();
			}
		}
		
		$this->assign('error',$error);
		
		$this->display();
	}

	/**
	 * 消费者用户登录
	 */
	public function login( $people_id = 0 ){
		
		// 读取帐号信息，生成虚拟wecha_id
		$db = D('People');
		$error = '';
		
		if ($people_id !== 0) {
			// 程序调用登录，免认证
			$people = $db->where(array('id'=>$people_id))->find();
			$error = '找不到用户数据';
		}else{
			if (IS_POST){
				// 表单提交登录
				$people = $db->login($_POST['phone'],$_POST['password'],$error);
			}
		}
		
		if (!empty($people)){
			//设置会话数据
			$this->setPeopleSession($people);
			
			//跳转
			$this->redirect('home');
		}
		
		$this->assign('error',$error);
		
		$this->display();
	}
	
	public function home() {
		
		if (!$this->is_logined()) $this->error('您还没有登录！',U('login'));
		
		$this->display();
	}
	
	public function logout(){
		$this->setPeopleSession();
		$this->display();
	}
	
	/**
	 * 消费者用户找回密码
	 */
	public function retrieve(){
		
		$error = '';
		
		if (IS_POST){
			//检查验证码
			if (session('code') != $_POST['code']){
				$error = '验证码不正确';
			}else{
				$new_pw = D('People')->retrieve($_POST['phone']);
				
				if (empty($new_pw)){
					$error = '找回密码失败，可能你的手机号并没有在本站注册';
				}else{
					// 把新密码发送到手机
					$status = $this->sendSMS(array($_POST['phone']), '您刚刚执行了找回密码操作，您现在的新密码是'.$new_pw, $err);
					if ($status) $error = '您已经成功找回密码！新的密码已经发送到号码为['.$_POST['phone'].']的手机，请查看手机短信，并妥善保管您的新密码！';
					else  $error = '找回密码失败了，短信发送服务器方面出了问题，请联系客服人员！错误：'.$err;
				}
			}
		}
		
		$this->assign('error',$error);
		$this->display();
	}
	
	/**
	 * ajax 方法发送验证码
	 * @return boolean
	 */
	public function getcode(){
		if (empty($_GET['phone'])){
			echo '手机号码不正确';
			return false;
		}
		
		$code = mt_rand(100000,999999);
		session('code',$code);
		
		$this->sendSMS(array($_GET['phone']), "您的验证码是$code", $error);
		
		echo $error;
	}
	
	/**
	 * ajax方法，检查输入的验证码是否正确
	 */
	public function checkcode() {
		echo session('code');
	}
	
	private function setPeopleSession($people = NULL) {
		session('people',$people);
	}
	
	/**
	 * 检查是否已经登录
	 */
	public function is_logined() {
		$s = session('people');
		if (empty($s))  return false;
		else return true;
	}
}
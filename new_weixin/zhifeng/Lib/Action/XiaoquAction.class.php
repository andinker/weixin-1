<?php
class XiaoquAction extends BaseAction {
	public $token;
	
	
    public function _initialize(){
    	parent::_initialize();
    	
    	// 查找当前token店铺所属的帐号->所在的小区->的小区号->的第一个公众帐号的token
    	$community_token = null;
    	if ( !empty($_GET['token']) ){
    	  //查找当前token所属的帐号
    	  $wxuser = M('Wxuser')->where(array('token'=>$_GET['token']))->find();
    	  
    	  if (!empty($wxuser)){
    	  	 //查找所属帐号
    	  	 $user = M('Users')->where(array('id'=>$wxuser['uid']))->find();
    	  	 if (!empty($user)){
    	  	 	
    	  	 	
    	  	 	// 查看用户所属小区的小区帐号
    	  	 	$user['community_id'];
    	  	 	$xq_user = M('Users')->where(array('community_id'=>$user['community_id'],'account_type'=>1))->find();
    	  	 	
    	  	 	if (!empty($xq_user)) {
    	  	 		
    	  	 		//查找该用户的所有公众号，并把第一个公众号作为小区公众号
    	  	 		$xq_wxusers = M('Wxuser')->where(array('uid'=>$xq_user['id']))->select();
    	  	 		
    	  	 		if (!empty($xq_wxusers)){
    	  	 			$community_token = $xq_wxusers[0]['token'];
    	  	 		}
    	  	 		
    	  	 	}
    	  	 	

    	  	 	
    	  	 }
    	  }
    	
    	}
    	$this->assign('community_token',$community_token);
    	
    }
	
	public function sendSMS($phones,$content,&$error) {
		//短信宝配置
		$username = 'itcocoa';
		$password = md5('piao0720');
		$phones = implode(',',$phones);
		$gateway = 'http://api.smsbao.com/sms?u='.$username.'&p='.$password.'&m='.$phones.'&c=【我的小区】'.$content;
		$err = array(
					'0'  =>"发送成功", 
					"-1" => "参数不全",
					"-2" => "服务器空间不支持,请确认支持curl或者fsocket，联系您的空间商解决或者更换空间！",
				    '30'=>'密码错误',
					'40'=>'账号不存在',
					'41'=>'余额不足',
					'42'=>'帐号过期',
					'43'=>'IP地址限制',
					'50'=>'内容含有敏感词',
					'51'=>'手机号码不正确');
		
		// 创建一个cURL资源
		$ch = curl_init();
		
		// 设置URL和相应的选项
		curl_setopt($ch, CURLOPT_URL, $gateway);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		
		// 抓取URL并把它传递给浏览器
		$rs = curl_exec($ch);
		$error = $err[$rs];
		
		// 关闭cURL资源，并且释放系统资源
		curl_close($ch);

		if ($rs === '0') return true;
		else{
			return false;
		}
	}
}
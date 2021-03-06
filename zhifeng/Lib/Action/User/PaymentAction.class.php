<?php
class PaymentAction extends UserAction{
	public $Payment_db;
	public function _initialize() {
		parent::_initialize();
        $this->canUseFunction('paysite');
		$this->Payment_db=M('payment');
		if (!$this->token){
			exit();
		}
	}
	
	/**
	 * 易支付
	 */
	public function easypay(){
	    
	    // 加密商家id，用于登录easypay商家后台
	    $file = 'file://'.SITE_ROOT.'/data/easypay/rsa_public_key.pem'; //echo $file.'<br>';
	    $pu_key = openssl_pkey_get_public($file);
	    
	    if (file_exists($file) && $pu_key){
	        
	        //echo $this->token;
	        openssl_public_encrypt($this->token,$encrypted_token,$pu_key);
	        $urltype_encrypted_token = urlencode(base64_encode($encrypted_token));
	        
	        //echo $_SERVER[REMOTE_ADDR];
	        openssl_public_encrypt(/*$_SERVER[REMOTE_ADDR]*/'127.0.0.1',$encrypted_ip,$pu_key);
	        $urltype_encrypted_ip = urlencode(base64_encode($encrypted_ip));
	        
	        $this->assign('urltype_encrypted_token',$urltype_encrypted_token);
	        $this->assign('urltype_encrypted_ip',$urltype_encrypted_ip);
	        
	        $this->display();
	    }else{
	        exit('数据加密时出错：公钥不存在或无效！');
	    }
	    
	}
	
	//微信支付
	public function index(){
		$payset = $this->Payment_db->where(array('token'=>$this->token,'pay_code'=>'wxpay'))->find();
		$pay_config = unserialize($payset['pay_config']);
		$config=array();
		if(IS_POST){
			$config['appId']=$this->_post('appId','trim');
			$config['appKey']=$this->_post('appKey','trim');
			$config['appSecret']=$this->_post('appSecret','trim');
			$config['partnerId']=$this->_post('partnerId','trim');
			$config['partnerKey']=$this->_post('partnerKey','trim');
			
			$row['enabled']= $this->_post('enabled');
			$row['pay_config']= serialize($config);
			if ($payset){
				$where=array('id'=>$payset['id']);
				$this->Payment_db->where($where)->save($row);
			}else {
				$row['pay_code']= 'wxpay';
				$row['pay_name']= "微信支付";
				$row['token']= $this->token;
				$this->Payment_db->add($row);
			}
			$this->success('设置成功',U('Payment/index',$where));
		}else{
			$this->assign('payset',$payset);
			$this->assign('pay_config',$pay_config);
			$this->display();
		}
	}
	
	
	/**
	 * 支付宝担保交易
	 */
	public function dbalipay(){
		$payset = $this->Payment_db->where(array('token'=>$this->token,'pay_code'=>'dbalipay'))->find();
		$pay_config = unserialize($payset['pay_config']);
		$config=array();
		if(IS_POST){
			$config['pid']=$this->_post('pid');
			$config['key']=$this->_post('key');
			$config['account']=$this->_post('account','trim');
				
			$row['enabled']= $this->_post('enabled');
			$row['pay_config']= serialize($config);
			if ($payset){
				$where=array('id'=>$payset['id']);
				$this->Payment_db->where($where)->save($row);
			}else {
				$row['pay_code']= 'dbalipay';
				$row['pay_name']= "支付宝担保交易";
				$row['token']= $this->token;
				$this->Payment_db->add($row);
			}
			$this->success('设置成功',U('Payment/dbalipay',$where));
		}else{
			$this->assign('payset',$payset);
			$this->assign('pay_config',$pay_config);
			$this->display();
		}
	}
	
	//手机支付宝
	public function wapalipay(){
		$payset = $this->Payment_db->where(array('token'=>$this->token,'pay_code'=>'wapalipay'))->find();
		$pay_config = unserialize($payset['pay_config']);
		$config=array();
		if(IS_POST){
			$config['pid']=$this->_post('pid');
			$config['key']=$this->_post('key');
			$config['account']=$this->_post('account','trim');
			
			$row['enabled']= $this->_post('enabled');
			$row['pay_config']= serialize($config);
			if ($payset){
				$where=array('id'=>$payset['id']);
				$this->Payment_db->where($where)->save($row);
			}else {
				$row['pay_code']= 'wapalipay';
				$row['pay_name']= "手机支付宝";
				$row['token']= $this->token;
				$this->Payment_db->add($row);
			}
			$this->success('设置成功',U('Payment/wapalipay',$where));
		}else{
			$this->assign('payset',$payset);
			$this->assign('pay_config',$pay_config);
			$this->display();
		}
	}
	//智风免签支付宝
	public function zfalipay(){
		$payset = $this->Payment_db->where(array('token'=>$this->token,'pay_code'=>'zfalipay'))->find();
		$pay_config = unserialize($payset['pay_config']);
		$config=array();
		if(IS_POST){
			$config['account']=$this->_post('account','trim');
			
			$row['enabled']= $this->_post('enabled');
			$row['pay_config']= serialize($config);
			if ($payset){
				$where=array('id'=>$payset['id']);
				$this->Payment_db->where($where)->save($row);
			}else {
				$row['pay_code']= 'zfalipay';
				$row['pay_name']= "支付宝";
				$row['token']= $this->token;
				$this->Payment_db->add($row);
			}
			$this->success('设置成功',U('Payment/zfalipay',$where));
		}else{
			$this->assign('payset',$payset);
			$this->assign('pay_config',$pay_config);
			$this->display();
		}
	}
		//wap财付通
	public function waptenpay(){
		$payset = $this->Payment_db->where(array('token'=>$this->token,'pay_code'=>'waptenpay'))->find();
		$pay_config = unserialize($payset['pay_config']);
		$config=array();
		if(IS_POST){
			$config['partnerId']=$this->_post('partnerId','trim');
			$config['partnerKey']=$this->_post('partnerKey','trim');
			
			$row['enabled']= $this->_post('enabled');
			$row['pay_config']= serialize($config);
			if ($payset){
				$where=array('id'=>$payset['id']);
				$this->Payment_db->where($where)->save($row);
			}else {
				$row['pay_code']= 'waptenpay';
				$row['pay_name']= "手机财付通";
				$row['token']= $this->token;
				$this->Payment_db->add($row);
			}
			$this->success('设置成功',U('Payment/waptenpay',$where));
		}else{
			$this->assign('payset',$payset);
			$this->assign('pay_config',$pay_config);
			$this->display();
		}
	}
		//财付通接口
	public function tenpay(){
		$payset = $this->Payment_db->where(array('token'=>$this->token,'pay_code'=>'tenpay'))->find();
		$pay_config = unserialize($payset['pay_config']);
		$config=array();
		if(IS_POST){
			$config['partnerId']=$this->_post('partnerId','trim');
			$config['partnerKey']=$this->_post('partnerKey','trim');
			
			$row['enabled']= $this->_post('enabled');
			$row['pay_config']= serialize($config);
			if ($payset){
				$where=array('id'=>$payset['id']);
				$this->Payment_db->where($where)->save($row);
			}else {
				$row['pay_code']= 'tenpay';
				$row['pay_name']= "财付通";
				$row['token']= $this->token;
				$this->Payment_db->add($row);
			}
			$this->success('设置成功',U('Payment/tenpay',$where));
		}else{
			$this->assign('payset',$payset);
			$this->assign('pay_config',$pay_config);
			$this->display();
		}
	}
}


?>
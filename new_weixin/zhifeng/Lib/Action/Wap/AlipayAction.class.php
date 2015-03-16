<?php
class AlipayAction extends BaseAction{
	public $token;
	public $wecha_id;
	public $alipayConfig;
	public function __construct(){
		$this->token = $this->_get('token');
		$this->wecha_id	= $this->_get('wecha_id');
		$this->price	= $this->_get('price');
		$this->orderid	= $this->_get('orderid');
		$this->out_trade_no	= $this->_get('orderid');
		$this->ordername	= $this->_get('orderName');
		$this->productid	= $this->_get('productid');
		$orderid = $this->orderid;
		$product_cart_model=M('product_cart');
		$this->order = $product_cart_model->where(array('orderid'=>$orderid))->find();
		if (!$this->token){
			//
			$out_trade_no = $this->_get('out_trade_no');
			$order=$product_cart_model->where(array('orderid'=>$out_trade_no))->find();
			if (!$order){
				$order=$product_cart_model->where(array('id'=>intval($this->_get('out_trade_no'))))->find();
			}
			$this->token=$order['token'];
		}
		//读取支付宝配置
		$alipay_config_db=M('Alipay_config');
		$this->alipayConfig=$alipay_config_db->where(array('token'=>$this->token))->find();
	}
	public function pay(){
	/*	$this->modelname	= $this->_get('modelname');
	if (!empty($this->modelname)){
			$model=$this->modelname;
			$this->product = M($model)->where(array('id'=>$this->productid))->find();
		}else{
			$model="Product";	
			$this->product = M('Product')->where(array('id'=>$this->productid))->find();
		}*/
	  	//参数数据
		$price=$_GET['price'];
		$orderName=$_GET['orderName'];
		$orderid=$_GET['orderid'];
		if (!$orderid){
			$orderid=$_GET['single_orderid'];//单个订单
		}
		//
		$alipayConfig=$this->alipayConfig;
		//
		if(!$price)exit('必须有价格才能支付');
		
		//支付宝接口类型
		$faceType=trim($alipayConfig['faceType']);
		
		import("@.ORG.Alipay.AlipaySubmit");
		//即时到帐	
		//支付类型
		$payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		$notify_url = C('site_url').U('Wap/Alipay/notify_url');
		//需http://格式的完整路径，不能加?id=123这类自定义参数
		//页面跳转同步通知页面路径
		$return_url = C('site_url').U('Wap/Alipay/return_url');
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
		//付款金额
		$total_fee =floatval($price);
		//卖家支付宝帐户
		$je= round($total_fee*0.985,2);
		$royalty_type = "10";
		$royalty_parameters=trim($alipayConfig['name'])."^".$je."^".$orderName;
		$seller_email =trim(C('alipay_name'));
		//商户订单号
		$out_trade_no = $orderid;
		//商户网站订单系统中唯一订单号，必填
		//订单名称
		$subject =$orderName;
		//必填
		//
		$partner	= trim(C('alipay_pid'));
		//安全检验码，以数字和字母组成的32位字符
		//如果签名方式设置为“MD5”时，请设置该参数
		$alipay_config['key']			= trim(C('alipay_key'));
		$body = $orderName;
		//商品展示地址
		$show_url = C('site_url').U('Home/Index/price');
		//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html

		//防钓鱼时间戳
		$anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数

		//客户端的IP地址
		$exter_invoke_ip = "";
		//非局域网的外网IP地址，如：221.0.0.1
		$body = $subject;
		$show_url = rtrim(C('site_url'),'/');
		//构造要请求的参数数组，无需改动
		$parameter = array(
		"service" => "create_direct_pay_by_user",
		"partner" =>$partner,
		"payment_type"	=> $payment_type,
		"notify_url"	=> $notify_url,
		"return_url"	=> $return_url,
		"royalty_type"=> $royalty_type,
		"royalty_parameters"=>$royalty_parameters,
		"seller_email"	=> $seller_email,
		"out_trade_no"	=> $out_trade_no,
		"subject"	=> $subject,
		"total_fee"	=> $total_fee,
		"body"	=> $body,
		"show_url"	=> $show_url,
		"anti_phishing_key"	=> $anti_phishing_key,
		"exter_invoke_ip"	=> $exter_invoke_ip,
		"_input_charset"	=>trim(strtolower('utf-8'))
		);
		//建立请求
		$alipaySubmit = new AlipaySubmit($this->setconfig());
		$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "进行支付");
		echo '正在跳转到支付宝进行支付...<div style="display:none">'.$html_text.'</div>';
		/*}else{
		echo exit('支付类型错误，请联系技术！');
		}*/

	}
		
	public function setconfig(){
		$alipay_config['partner']		= trim(C('alipay_pid'));
		//安全检验码，以数字和字母组成的32位字符
		$alipay_config['key']			= trim(C('alipay_key'));
		//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
		//签名方式 不需修改
		$alipay_config['sign_type']    = strtoupper('MD5');
		//字符编码格式 目前支持 gbk 或 utf-8
		$alipay_config['input_charset']= strtolower('utf-8');
		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$alipay_config['cacert']    = getcwd().'\\zhifeng\\Lib\\ORG\\Alipay\\cacert.pem';
		//访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
		$alipay_config['transport']    = 'http';		
		return $alipay_config;
	}
	//同步数据处理
	public function return_url (){
		import("@.ORG.Alipay.AlipayNotify");
		$alipayNotify = new AlipayNotify($this->setconfig());
		$verify_result = $alipayNotify->verifyReturn();	
		if($verify_result) {
			$out_trade_no = $this->_get('out_trade_no');
			//支付宝交易号
			$trade_no =  $this->_get('trade_no');
			//交易状态
			$trade_status =  $this->_get('trade_status');
			if( $this->_get('trade_status') == 'TRADE_FINISHED' ||  $this->_get('trade_status') == 'TRADE_SUCCESS') {
				//$product_cart_model=M($model.'_cart');
				$order=$product_cart_model->where(array('orderid'=>$out_trade_no))->find();
				$sepOrder=0;
				if (!$order){
					$order=$product_cart_model->where(array('id'=>$out_trade_no))->find();
					$sepOrder=1;
				}
				if($order){
					if($order['paid']==1){exit('该订单已经支付,请勿重复操作');}
					if (!$sepOrder){
						$product_cart_model->where(array('orderid'=>$out_trade_no))->setField('paid',1);
					}else {
						$product_cart_model->where(array('id'=>$out_trade_no))->setField('paid',1);
					}
					if($order['dining']==1&&$order['groupon']==0){
						$this->redirect(U('Dining/my',array('token'=>$order['token'],'wecha_id'=>$order['wecha_id'],'success'=>1)));
					}else{
						$this->redirect(U('Product/my',array('token'=>$order['token'],'wecha_id'=>$order['wecha_id'],'success'=>1)));
					}
					//if($back!=false&&$add!=false){
						
					//}else{
						//$this->error('充值失败,请在线客服,为您处理',U('User/Index/index'));
					//}
				}else{						
					exit('订单不存在：'.$out_trade_no);
				}
			}else {
			  exit('付款失败');
			}
		}else {
			exit('不存在的订单');
		}
	}
	public function notify_url(){
		echo "success"; 
		eixt();
	}
}
?>
<?php
class WxpayAction extends BaseAction{
	public $token;
	public $wecha_id;
	public $payConfig;
	public function _initialize() {
		parent::_initialize();
		$this->token = $this->_get('token');
		$this->wecha_id	= $this->_get('wecha_id');
		$this->orderid	= $this->_get('orderid');
		$this->order_db = M('product_cart');
		$this->order_list = M('product_cart_list');
		$order = M('product_cart')->where(array('orderid'=>$this->orderid))->find();
		if ($order){
			$order['ordername']="订单号：".$order['orderid'];
			if($order['dining'] ==1){
				$this->orders_url=U('Dining/dingdan',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'storeid'=>$order['storeid']));
			}else{
				$this->orders_url=U('Product/my',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'storeid'=>$order['storeid']));
			}
			$this->order=$order;
		}
		
		//微信支付
		$pay_config =M('payment')->where(array('token'=>$this->token,'pay_code'=>'wxpay'))->find();
		$pay_config = unserialize($pay_config['pay_config']);
		$wxpay_config['appId']=$pay_config['appId'];
		$wxpay_config['appKey']=$pay_config['appKey'];
		$wxpay_config['appSecret']=$pay_config['appSecret'];
		$wxpay_config['partnerId']=$pay_config['partnerId'];
		$wxpay_config['partnerKey']=$pay_config['partnerKey'];
		$this->wxpay_config = $wxpay_config;
	}
	
	private function getConfigData(){
		
		$wxpay_config = $this->wxpay_config;
		
		//从数据读取微支付设置
		$WxPayConf_pub_data['APPID'] = $this->wxpay_config['appId'];
		$WxPayConf_pub_data['APPSECRET'] = $this->wxpay_config['appSecret'];
		$WxPayConf_pub_data['MCHID'] = $this->wxpay_config['partnerId'];
		$WxPayConf_pub_data['KEY'] = $this->wxpay_config['partnerKey'];
		
		$WxPayConf_pub_data['JS_API_CALL_URL'] = urlencode($_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
		$WxPayConf_pub_data['SSLCERT_PATH'] = '';
		$WxPayConf_pub_data['SSLKEY_PATH'] = '';
		$WxPayConf_pub_data['NOTIFY_URL'] = $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].'/wxpay/index.php';
		$WxPayConf_pub_data['CURL_TIMEOUT'] = '30';
		
		return $WxPayConf_pub_data;
	}
	
	public function pay(){
		
		$order = $this->order;
		$wxpay_config = $this->wxpay_config;
		
		//从数据读取微支付设置
		$WxPayConf_pub_data = $this->getConfigData();
		
		include_once(APP_PATH.'Lib/ORG/Weixinpay2/WxPayPubHelper.php');
		

		//使用jsapi接口
		$jsApi = new JsApi_pub();
		
		//=========步骤1：网页授权获取用户openid============
		//通过code获得openid
		if (!isset($_GET['code']))
		{
			//触发微信返回code码
			$url = $jsApi->createOauthUrlForCode(WxPayConf_pub::JS_API_CALL_URL);
			Header("Location: $url");
		}else
		{
			//获取code码，以获取openid
			$code = $_GET['code'];
			$jsApi->setCode($code);
			$openid = $jsApi->getOpenId();
		}
		
		
		//=========步骤2：使用统一支付接口，获取prepay_id============
		//使用统一支付接口
		$unifiedOrder = new UnifiedOrder_pub();
		
		//设置统一支付接口参数
		//设置必填参数
		//appid已填,商户无需重复填写
		//mch_id已填,商户无需重复填写
		//noncestr已填,商户无需重复填写
		//spbill_create_ip已填,商户无需重复填写
		//sign已填,商户无需重复填写
		$unifiedOrder->setParameter("openid","$openid");//商品描述
		$unifiedOrder->setParameter("body","订单：".$order['orderid']);//商品描述
		

		//自定义订单号，此处仅作举例
		$unifiedOrder->setParameter("out_trade_no",$order['orderid']);//商户订单号
		$unifiedOrder->setParameter("total_fee",floatval($order['price'])*100);//总金额
		$unifiedOrder->setParameter("notify_url",WxPayConf_pub::NOTIFY_URL);//通知地址
		$unifiedOrder->setParameter("trade_type","JSAPI");//交易类型
		//非必填参数，商户可根据实际情况选填
		//$unifiedOrder->setParameter("sub_mch_id","XXXX");//子商户号
		//$unifiedOrder->setParameter("device_info","XXXX");//设备号
		//$unifiedOrder->setParameter("attach","XXXX");//附加数据
		//$unifiedOrder->setParameter("time_start","XXXX");//交易起始时间
		//$unifiedOrder->setParameter("time_expire","XXXX");//交易结束时间
		//$unifiedOrder->setParameter("goods_tag","XXXX");//商品标记
		//$unifiedOrder->setParameter("openid","XXXX");//用户标识
		//$unifiedOrder->setParameter("product_id","XXXX");//商品ID
		
		$prepay_id = $unifiedOrder->getPrepayId();
		//=========步骤3：使用jsapi调起支付============
		$jsApi->setPrepayId($prepay_id);
		
		$jsApiParameters = $jsApi->getParameters();
		
		$this->assign('payurl',$jsApiParameters);
		$this->assign('returnUrl',$this->orders_url);
		$this->assign('order',$order);
		
		
		//exit();
		
		/*

		$commonUtil = new CommonUtil();
		$wxPayHelper = new WxPayHelper($this->wxpay_config['appId'],$this->wxpay_config['appKey'],$this->wxpay_config['partnerKey']);

		$wxPayHelper->setParameter("bank_type", "WX");
		$wxPayHelper->setParameter("body", $order['orderid']);
		$wxPayHelper->setParameter("partner", $wxpay_config['partnerId']);
		$wxPayHelper->setParameter("out_trade_no",$order['orderid']);
		$wxPayHelper->setParameter("total_fee", floatval($order['price'])*100);
		$wxPayHelper->setParameter("fee_type", "1");
		$wxPayHelper->setParameter("notify_url", C('site_url').'/wxpay/?g=Wap&m=Wxpay&a=notify_url');
		$wxPayHelper->setParameter("spbill_create_ip", $_SERVER['REMOTE_ADDR']);
		$wxPayHelper->setParameter("input_charset", "GBK");
		$payurl=$wxPayHelper->create_biz_package();
		$this->assign('payurl',$payurl);
		$this->assign('returnUrl',$this->orders_url);
		$this->assign('order',$order);*/
		
		
		$this->display();
	}
	public function warning(){
		$postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
		if(!empty($postStr)){
			$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
			
			$this->logger("错误类型：".$postObj->ErrorType."错识描述：".$postObj->Description."错误详情：".$postObj->AlarmContent,'warning');
		}else{
			echo 'HTTP_RAW_POST_DATA Not Existed!';
		}
		
		echo 'success';	
	}
	public function payfeedback(){
		$postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
		if(!empty($postStr)){
 			$this->logger($postStr,'feedback');
		}else{
			echo 'HTTP_RAW_POST_DATA Not Existed!';
		}
		echo 'success';		
	}
	public function getpackage(){
		echo 'success';	
	}
	//日志记录
	protected function logger($log_content,$kind)
	{
		$max_size = 100000;
		$log_filename = LOG_PATH."wxpay_".$kind."_log.xml";
		if(file_exists($log_filename) and (abs(filesize($log_filename)) > $max_size)){unlink($log_filename);}
		file_put_contents($log_filename, date('H:i:s')." ".$log_content."\r\n", FILE_APPEND);
	}
	//同步数据处理
	public function notify_url(){
		
		try {

		
		
		$WxPayConf_pub_data = $this->getConfigData();
		
		include_once(APP_PATH.'Lib/ORG/Weixinpay2/Log_.php');
		include_once(APP_PATH.'Lib/ORG/Weixinpay2/WxPayPubHelper.php');
		
		
		//以log文件形式记录回调信息
		$log_ = new Log_();
		$log_name=APP_PATH."./../data/wxpay_notify_url-".date('Y-m-d',time()).".log";//log文件路径
		
		//使用通用通知接口
		$notify = new Notify_pub();
		
		//存储微信的回调
		//$xml = $GLOBALS['HTTP_RAW_POST_DATA'];
		$xml = file_get_contents("php://input");
		$notify->saveData($xml);
		
		//验证签名，并回应微信。
		//对后台通知交互时，如果微信收到商户的应答不是成功或超时，微信认为通知失败，
		//微信会通过一定的策略（如30分钟共8次）定期重新发起通知，
		//尽可能提高通知的成功率，但微信不保证通知最终能成功。
		/*
		if($notify->checkSign() == FALSE){
			$notify->setReturnParameter("return_code","FAIL");//返回状态码
			$notify->setReturnParameter("return_msg","签名失败");//返回信息
		}else{
			$notify->setReturnParameter("return_code","SUCCESS");//设置返回码
		}*/
		$notify->setReturnParameter("return_code","SUCCESS");//设置返回码
		$returnXml = $notify->returnXml();
		echo $returnXml;
		
		
		//==商户根据实际情况设置相应的处理流程，此处仅作举例=======
		
		
		$log_->log_result($log_name,"【接收到的notify通知】:\n\r".$xml."\n\r");
		

				
				
				
				    $out_trade_no = $notify->data["out_trade_no"];
				
					$product_cart_model=M('product_cart');
					
					$order=$product_cart_model->where(array('orderid'=>$out_trade_no))->find();
					
					if (!$this->wecha_id){
						$this->wecha_id=$order['wecha_id'];
					}
					
					if($order){
						
						$log_->log_result($log_name,"【订单状态处理进度】:订单 $out_trade_no 已经找到，正在处理\n\r");
						
						if($order['paid']==1){
							$log_->log_result($log_name,"【订单状态处理结果】:该订单已经支付,请勿重复操作\n\r");
						}else{
						
							$log_->log_result($log_name,"【订单状态处理进度】:订单 $out_trade_no 状态为未支付，正在处理成已支付\n\r");
							
							try {

							
							$returnRs=array();
							$returnRs['transaction_id']=$notify->data["transaction_id"];
							$returnRs['paid']=1;
							$product_cart_model->where(array('orderid'=>$out_trade_no))->save($returnRs);
					
							$log_->log_result($log_name,"【订单状态处理结果】:订单 $out_trade_no 状态已处理成已支付^_^,".$product_cart_model->getDbError()."。\n\r");


							} catch (Exception $e) {
								$log_->log_result($log_name,"发生异常：".var_export($e,true));
							}
							
							$member_card_create_db=M('Member_card_create');
							$userCard=$member_card_create_db->where(array('token'=>$order['token'],'wecha_id'=>$order['wecha_id']))->find();
							$member_card_set_db=M('Member_card_set');
							$thisCard=$member_card_set_db->where(array('id'=>intval($userCard['cardid'])))->find();
							$set_exchange = M('Member_card_exchange')->where(array('cardid'=>intval($thisCard['id'])))->find();
							//
							$arr['token']=$order['token'];
							$arr['wecha_id']=$order['wecha_id'];
							$arr['expense']=$order['price'];
							$arr['time']=time();
							$arr['cat']=99;
							$arr['staffid']=0;
							$arr['score']=intval($set_exchange['reward'])*$order['price'];
							M('Member_card_use_record')->add($arr);
							$userinfo_db=M('Userinfo');
							$thisUser = $userinfo_db->where(array('token'=>$thisCard['token'],'wecha_id'=>$arr['wecha_id']))->find();
							$userArr=array();
							$userArr['total_score']=$thisUser['total_score']+$arr['score'];
							$userArr['expensetotal']=$thisUser['expensetotal']+$arr['expense'];
							$userinfo_db->where(array('token'=>$thisCard['token'],'wecha_id'=>$arr['wecha_id']))->save($userArr);
						
						}
				
					}else{
						$log_->log_result($log_name,"【订单状态处理结果】:订单 $out_trade_no 不存在\n\r");
					}
			
				
				$log_->log_result($log_name,"【记录应答内容】:\n\r".ob_get_contents()); exit();

		} catch (Exception $e) {
			print_r($e);exit();
		}
	}
	
}
?>
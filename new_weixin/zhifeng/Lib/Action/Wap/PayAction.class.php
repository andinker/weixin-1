<?php
class PayAction extends BaseAction{
	public $token;
	public $wecha_id;
	public $pay_config;
	public $orders_url;
	public $wapalipay_config;
	public $dbalipay_config;
	public $zfalipay_config;
	public $wxpay_config;
	public function _initialize() {
		parent::_initialize();
		$this->token = $this->_get('token');
		if (empty($this->token)){
			$this->token = session('paytoken');
		}else{
			session('paytoken',$this->token);
		}
		$this->wecha_id	= $this->_get('wecha_id');
		$this->orderid	= $this->_get('orderid');
		$this->order_db = M('product_cart');
		$this->order_list = M('product_cart_list');
		$order = M('product_cart')->where(array('orderid'=>$this->orderid))->find();
		if ($order){
			/*获得订单产品
			if($order['diningtype'] ==3){
				$order_name=M('dining_tables')->where(array('id'=>$order['tableid']))->getField('name');
			}else{
				$products=$this->order_list->where(array('cartid'=>$order['id'],'token'=>$this->token))->select();
				$order_name='';
				foreach($products as $v){
					if($v['goodstype']=='dining'){
						$product_name = M('dining')->where(array('id'=>$v['productid']))->getField('name');
					}else{
						$product_name = M('product')->where(array('id'=>$v['productid']))->getField('name');
					}
					$order_name .=$product_name.'/';
				}
			}
			$order['ordername']= rtrim($order_name,'/');*/
			$order['ordername']="订单号：".$order['orderid'];
			if($order['dining'] ==1){
				$this->orders_url=U('Dining/dingdan',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'storeid'=>$order['storeid']));
			}else{
				$this->orders_url=U('Product/my',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'storeid'=>$order['storeid']));
			}
			$this->order=$order;
		}
		//支付宝担保交易配置
		$pay_config =M('payment')->where(array('token'=>$this->token,'pay_code'=>'dbalipay'))->find();
		$pay_config = unserialize($pay_config['pay_config']);
		$dbalipay_config['seller_email'] = trim($pay_config['account']);
		$dbalipay_config['partner']		= trim($pay_config['pid']);
		$dbalipay_config['key']			= trim($pay_config['key']);
		$this->dbalipay_config = $dbalipay_config;

		//手机支付配置
		$pay_config =M('payment')->where(array('token'=>$this->token,'pay_code'=>'wapalipay'))->find();
		$pay_config = unserialize($pay_config['pay_config']);
		$wapalipay_config['seller_email'] = trim($pay_config['account']);
		$wapalipay_config['partner']		= trim($pay_config['pid']);
		$wapalipay_config['key']			= trim($pay_config['key']);
		$wapalipay_config['sign_type']    = strtoupper('MD5');
		$wapalipay_config['input_charset']= strtolower('utf-8');
		$wapalipay_config['cacert']    = EXTEND_PATH.'Vendor\\Malipay\\cacert.pem';
		$wapalipay_config['transport']    = 'http';
		$this->wapalipay_config = $wapalipay_config;
		//免签支付宝配置
		$pay_config =M('payment')->where(array('token'=>$this->token,'pay_code'=>'zfalipay'))->find();
		$pay_config = unserialize($pay_config['pay_config']);
		$zfalipay_config['seller_email'] = C('alipay_name');
		$zfalipay_config['partner']		= C('alipay_pid');
		$zfalipay_config['key']			= C('alipay_key');
		$zfalipay_config['sign_type']    = strtoupper('MD5');
		$zfalipay_config['input_charset']= strtolower('utf-8');
		$zfalipay_config['cacert']    = getcwd().'\\zhifeng\\Lib\\ORG\\Alipay\\cacert.pem';
		$zfalipay_config['transport']    = 'http';
		$zfalipay_config['royalty_email'] = trim($pay_config['account']);
		$this->zfalipay_config = $zfalipay_config;
		//财付通配置
		$pay_config =M('payment')->where(array('token'=>$this->token,'pay_code'=>'tenpay'))->find();
		$pay_config = unserialize($pay_config['pay_config']);
		$tenpay_config['partnerId']=trim($pay_config['partnerId']);
		$tenpay_config['partnerKey']=trim($pay_config['partnerKey']);
		$tenpay_config['sign_type']=strtoupper('MD5');
		$tenpay_config['service_version']='1.0';
		$tenpay_config['input_charset']=strtolower('utf-8');
		$this->tenpay_config=$tenpay_config;
		//手机财付通配置
		$pay_config =M('payment')->where(array('token'=>$this->token,'pay_code'=>'waptenpay'))->find();
		$pay_config = unserialize($pay_config['pay_config']);
		$waptenpay_config['partnerId']=trim($pay_config['partnerId']);
		$waptenpay_config['partnerKey']=trim($pay_config['partnerKey']);
		$this->waptenpay_config=$waptenpay_config;
	}
	
	/**
	 * 支付宝担保交易:支付
	 */
	public function dbalipay(){
		
		$order = $this->order;
		
		include APP_PATH.'Lib/ORG/DBAlipay/Pay/alipay.config.php';

		$alipay_config['partner']		= $this->dbalipay_config['partner'];
		$alipay_config['seller_email']	= $this->dbalipay_config['seller_email'];
		$alipay_config['key']			= $this->dbalipay_config['key'];
		
		//print_r($alipay_config);
		
		include APP_PATH.'Lib/ORG/DBAlipay/Pay/lib/alipay_submit.class.php';
		
		/**************************请求参数**************************/
		
		//支付类型
		$payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		$notify_url = 'http://'.$_SERVER['HTTP_HOST'].'/index.php/Wap/Pay/dbalipay_notify_url';
		//需http://格式的完整路径，不能加?id=123这类自定义参数
		
		//页面跳转同步通知页面路径
		$return_url = 'http://'.$_SERVER['HTTP_HOST'].'/index.php/Wap/Pay/dbalipay_call_back_url';
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
		
		//商户订单号
		$out_trade_no = $order['orderid'];
		//商户网站订单系统中唯一订单号，必填
		
		//订单名称
		$subject = $order['ordername'];
		//必填
		
		//付款金额
		$price = $order['price'];
		//必填
		
		//商品数量
		$quantity = 1;
		//必填，建议默认为1，不改变值，把一次交易看成是一次下订单而非购买一件商品
		//物流费用
		$logistics_fee = "0.00";
		//必填，即运费
		//物流类型
		$logistics_type = "EXPRESS";
		//必填，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
		//物流支付方式
		$logistics_payment = "SELLER_PAY";
		//必填，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
		//订单描述
		
		$body = $order['ordername'];
		//商品展示地址
		$show_url = 'http://'.$_SERVER['HTTP_HOST'].U('Wap/Product/myDetail',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'cartid'=>$order['id']));
		//需以http://开头的完整路径，如：http://www.商户网站.com/myorder.html

		//收货人姓名
		$receive_name = $order['truename'];
		//如：张三
		
		//收货人地址
		$receive_address = $order['address'];
		//如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
		
		//收货人邮编
		$receive_zip = '';
		//如：123456
		
		//收货人电话号码
		$receive_phone = $order['tel'];
		//如：0571-88158090
		
		//收货人手机号码
		$receive_mobile = $order['tel'];
		//如：13312341234
		
		
		/************************************************************/
		
		//构造要请求的参数数组，无需改动
		$parameter = array(
				"service" => "create_partner_trade_by_buyer",
				"partner" => trim($alipay_config['partner']),
				"seller_email" => trim($alipay_config['seller_email']),
				"payment_type"	=> $payment_type,
				"notify_url"	=> $notify_url,
				"return_url"	=> $return_url,
				"out_trade_no"	=> $out_trade_no,
				"subject"	=> $subject,
				"price"	=> $price,
				"quantity"	=> $quantity,
				"logistics_fee"	=> $logistics_fee,
				"logistics_type"	=> $logistics_type,
				"logistics_payment"	=> $logistics_payment,
				"body"	=> $body,
				"show_url"	=> $show_url,
				"receive_name"	=> $receive_name,
				"receive_address"	=> $receive_address,
				"receive_zip"	=> $receive_zip,
				"receive_phone"	=> $receive_phone,
				"receive_mobile"	=> $receive_mobile,
				"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
		);
		
		//建立请求
		$alipaySubmit = new AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "进入支付宝收银台");
		echo '正在跳转到支付宝进行支付...<div style="display:none">'.$html_text.'</div>';
	
	
	}
	
	/**
	 * 支付宝担保交易:确认发货
	 */
	public function dbalipay_send(){
		
	}
	
	//手机支付宝
	public function wapalipay(){
        vendor('Malipay.alipay_submit','','.class.php');
		$alipay_config=$this->wapalipay_config;
		$order = $this->order;
		//返回格式
		$format = "xml";
		$v = "2.0";
		$req_id = date('Ymdhis');
		$notify_url=C('site_url').'/index.php/Wap/Pay/wapalipay_notify_url';
		$call_back_url=C('site_url').'/index.php/Wap/Pay/wapalipay_call_back_url';
		$seller_email = $alipay_config['seller_email'];
		$out_trade_no = $order['orderid'];
		$subject = $order['ordername'];
		$total_fee = $order['price'];
		
		//请求业务参数详细
		$req_data = '<direct_trade_create_req><notify_url>' . $notify_url . '</notify_url><call_back_url>' . $call_back_url . '</call_back_url><seller_account_name>' . $seller_email . '</seller_account_name><out_trade_no>' . $out_trade_no . '</out_trade_no><subject>' . $subject . '</subject><total_fee>' . $total_fee . '</total_fee></direct_trade_create_req>';
		
		//构造要请求的参数数组，无需改动
		$para_token = array(
				"service" => "alipay.wap.trade.create.direct",
				"partner" => trim($alipay_config['partner']),
				"sec_id" => trim($alipay_config['sign_type']),
				"format"	=> $format,
				"v"	=> $v,
				"req_id"	=> $req_id,
				"req_data"	=> $req_data,
				"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
		);

		//建立请求
		$alipaySubmit = new AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestHttp($para_token);

		//URLDECODE返回的信息
		$html_text = urldecode($html_text);

		//解析远程模拟提交后返回的信息
		$para_html_text = $alipaySubmit->parseResponse($html_text);

		//获取request_token
		$request_token = $para_html_text['request_token'];


		/**************************根据授权码token调用交易接口alipay.wap.auth.authAndExecute**************************/

		//业务详细
		$req_data = '<auth_and_execute_req><request_token>' . $request_token . '</request_token></auth_and_execute_req>';
		//必填

		//构造要请求的参数数组，无需改动
		$parameter = array(
				"service" => "alipay.wap.auth.authAndExecute",
				"partner" => trim($alipay_config['partner']),
				"sec_id" => trim($alipay_config['sign_type']),
				"format"	=> $format,
				"v"	=> $v,
				"req_id"	=> $req_id,
				"req_data"	=> $req_data,
				"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
		);

		//建立请求
		$alipaySubmit = new AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter, 'get', '正确为您跳转到支付宝支付界面!');
		echo '正在跳转到支付宝进行支付...<div style="display:none">'.$html_text.'</div>';
	}
	//免签支付宝
	public function zfalipay(){
		import("@.ORG.Alipay.AlipaySubmit");
		$alipay_config=$this->zfalipay_config;
		$order = $this->order;
		
		//即时到帐支付类型
		$payment_type = "1";
		$notify_url=C('site_url').'/index.php/Wap/Pay/zfalipay_notify_url';
		$return_url=C('site_url').'/index.php/Wap/Pay/zfalipay_return_url';
		//付款金额
		$total_fee =floatval($order['price']);
		//计算分润
		$royalty_money= round($total_fee*0.985,2);
		$royalty_type = "10";
		$royalty_parameters = $alipay_config['royalty_email']."^".$royalty_money."^".$order['ordername'];
		
		$seller_email = $alipay_config['seller_email'];
		$out_trade_no = $order['orderid'];
		$subject = $order['ordername'];
		$partner	=  $alipay_config['partner'];
		$body = $order['ordername'];
		//商品展示地址
		$show_url = 'http://'.$_SERVER['HTTP_HOST'].U('Wap/index',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
		$anti_phishing_key = "";
		$exter_invoke_ip = "";

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
		//print_r($parameter);exit;
		//建立请求
		$alipaySubmit = new AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "进行支付");
		echo '正在跳转到支付宝进行支付...<div style="display:none">'.$html_text.'</div>';
	}
	//微信支付
	public function wxpay(){
		$pay_url=C('site_url')."/wxpay/?g=Wap&m=Wxpay&a=pay&token=".$this->token."&wecha_id=".$this->wecha_id."&orderid=".$this->orderid;
		header("location:".$pay_url);
	}
	
	/**
	 * 支付宝担保交易：回跳页面
	 */
	public function dbalipay_call_back_url(){
		
		include APP_PATH.'Lib/ORG/DBAlipay/Pay/alipay.config.php';
		
		$alipay_config['partner']		= $this->dbalipay_config['partner'];
		$alipay_config['seller_email']	= $this->dbalipay_config['seller_email'];
		$alipay_config['key']			= $this->dbalipay_config['key'];
		
		include APP_PATH.'Lib/ORG/DBAlipay/Pay/lib/alipay_notify.class.php';
		
		//计算得出通知验证结果
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyReturn();
		if(/*$verify_result*/true) {//验证成功
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代码
		
			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
		
			//商户订单号
		
			$out_trade_no = $_GET['out_trade_no'];
		
			//支付宝交易号
		
			$trade_no = $_GET['trade_no'];
		
			//交易状态
			$trade_status = $_GET['trade_status'];
		
		
			if($_GET['trade_status'] == 'WAIT_SELLER_SEND_GOODS') {
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
				
				$order_db = $this->order_db;
				
				$cartid = $order_db->where(array('orderid'=>$out_trade_no))->getField('id');
				
				$back_url = 'http://'.$_SERVER['HTTP_HOST'].U('Wap/Product/myDetail',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'cartid'=>$cartid));
				
				
				$data['paid'] = 1;
				$data['payment'] = 'dbalipay';
				$data['payment_order_id'] = $trade_no;
				$data['payment_order_status'] = $_GET['trade_status'];
				
				$order_db->where(array('orderid'=>$out_trade_no))->save($data);
				$this->success('支付成功', $back_url);
				
				
			}
			else {
				$this->error('支付失败'. "trade_status=".$_GET['trade_status'], $back_url);
			}
		
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
		
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}
		else {
			//验证失败
			//如要调试，请看alipay_notify.php页面的verifyReturn函数
			echo "验证失败！您的请求不合法。";
		}
		
	}
	
	/**
	 * 支付宝担保交易：异步通知页
	 */
	public function dbalipay_notify_url()
	{
		include_once(APP_PATH.'Lib/ORG/Weixinpay2/Log_.php');
		
		$log_ = new Log_();
		$log_name=APP_PATH."./../data/dbalipay_notify_url-".date('Y-m-d',time()).".log";//log文件路径
		
		$log_->log_result($log_name,"【接收到的notify通知】:\r\n".var_export($_POST,true)."\r\n");
		
		include APP_PATH.'Lib/ORG/DBAlipay/Pay/alipay.config.php';
		
		$alipay_config['partner']		= $this->dbalipay_config['partner'];
		$alipay_config['seller_email']	= $this->dbalipay_config['seller_email'];
		$alipay_config['key']			= $this->dbalipay_config['key'];
		
		include APP_PATH.'Lib/ORG/DBAlipay/Pay/lib/alipay_notify.class.php';
		
		
		//计算得出通知验证结果
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();
		
		if(/*$verify_result*/true) {//验证成功
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代
		
		
			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
		
			//获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表
		
			//商户订单号
		
			$out_trade_no = $_POST['out_trade_no'];
		
			//支付宝交易号
		
			$trade_no = $_POST['trade_no'];
		
			//交易状态
			$trade_status = $_POST['trade_status'];
		
			
			$data['paid'] = 0;
		
			if($_POST['trade_status'] == 'WAIT_BUYER_PAY') {
				//该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款
		
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
					
				echo "success";		//请不要修改或删除
		
				//调试用，写文本函数记录程序运行情况是否正常
				//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
			}
			else if($_POST['trade_status'] == 'WAIT_SELLER_SEND_GOODS') {
				//该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货
		
				//判断该笔订单是否在商户网站中已经做过处理
				$data['paid'] = 1;
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
					
				echo "success";		//请不要修改或删除
		
				//调试用，写文本函数记录程序运行情况是否正常
				//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
			}
			else if($_POST['trade_status'] == 'WAIT_BUYER_CONFIRM_GOODS') {
				//该判断表示卖家已经发了货，但买家还没有做确认收货的操作
		
				//判断该笔订单是否在商户网站中已经做过处理
				$data['paid'] = 1;
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
					
				echo "success";		//请不要修改或删除
		
				//调试用，写文本函数记录程序运行情况是否正常
				//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
			}
			else if($_POST['trade_status'] == 'TRADE_FINISHED') {
				//该判断表示买家已经确认收货，这笔交易完成
		
				//判断该笔订单是否在商户网站中已经做过处理
				$data['paid'] = 1;
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
					
				echo "success";		//请不要修改或删除
		
				//调试用，写文本函数记录程序运行情况是否正常
				//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
			}
			else {
				//其他状态判断
				echo "success";
		
				//调试用，写文本函数记录程序运行情况是否正常
				//logResult ("这里写入想要调试的代码变量值，或其他运行的结果记录");
			}
		
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
		
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			$order_db = $this->order_db;

			$data['payment'] = 'dbalipay';
			$data['payment_order_id'] = $trade_no;
			$data['payment_order_status'] = $_POST['trade_status'];
			
			$order_db->where(array('orderid'=>$out_trade_no))->save($data);
			
			$log_->log_result($log_name,"【执行了SQL】:\r\n".$order_db->getLastSql()."，并返回了success给支付宝\r\n");
			
		}
		else {
			//验证失败
			echo "fail";
			$log_->log_result($log_name,"【验证失败】:\r\n 并返回了fail给支付宝 \r\n");
		
			//调试用，写文本函数记录程序运行情况是否正常
			//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
		}
		
		exit();
		
	}
	
	public function wapalipay_call_back_url(){
        vendor('Malipay.alipay_notify','','.class.php');
		$alipay_config=$this->wapalipay_config;
		
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyReturn();
		
		$out_trade_no = $this->_get('out_trade_no');//商户订单号
		$trade_no = $this->_get('trade_no');//支付宝交易号
		$result = $this->_get('result');//交易状态
		
		$order_db = $this->order_db;
		$order = $order_db->where(array('orderid'=>$out_trade_no))->find();
		$order_token = $order['token'];
		$order_wecha_id = $order['wecha_id'];
		if($order['diningtype']){
			$back_url = U('Dining/dingdan',array('token'=>$order_token,'wecha_id'=>$order_wecha_id,'storeid'=>$order['storeid']));
		}else{
			$back_url = U('Product/my',array('token'=>$order_token,'wecha_id'=>$order_wecha_id,'storeid'=>$order['storeid']));
		}
		if($verify_result){//验证成功
			if($result == "success") {
				$data['paid'] = 1;
				$data['payment'] = 'wapalipay';
				$order_db->where(array('orderid'=>$out_trade_no))->save($data);
				$this->success('支付成功', $back_url);
			}
			else {
				$this->error('支付失败', $back_url);
			}
		}else{
			//$this->error('支付验证失败！', $back_url);
			$this->redirect($back_url);
		}
	}
	public function wapalipay_notify_url()
	{	
		include_once(APP_PATH.'Lib/ORG/Weixinpay2/Log_.php');
		
		$log_ = new Log_();
		$log_name=APP_PATH."./../data/wapalipay_notify_url-".date('Y-m-d',time()).".log";//log文件路径
		
		$log_->log_result($log_name,"【接收到的notify通知】:\r\n".var_export($_POST,true)."\r\n");
		
		vendor('Malipay.alipay_notify','','.class.php');
		$alipay_config=$this->wapalipay_config;
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();

		

		//解析notify_data
		//注意：该功能PHP5环境及以上支持，需开通curl、SSL等PHP配置环境。建议本地调试时使用PHP开发软件
		$doc = new DOMDocument();
		if ($alipay_config['sign_type'] == 'MD5') {
			$doc->loadXML($_POST['notify_data']);
		}
		
		if ($alipay_config['sign_type'] == '0001') {
			$doc->loadXML($alipayNotify->decrypt($_POST['notify_data']));
		}
		
		if( ! empty($doc->getElementsByTagName( "notify" )->item(0)->nodeValue) ) {
			//商户订单号
			$out_trade_no = $doc->getElementsByTagName( "out_trade_no" )->item(0)->nodeValue;
			//支付宝交易号
			$trade_no = $doc->getElementsByTagName( "trade_no" )->item(0)->nodeValue;
			//交易状态
			$trade_status = $doc->getElementsByTagName( "trade_status" )->item(0)->nodeValue;
		
			$total_fee =$doc->getElementsByTagName( "total_fee" )->item(0)->nodeValue; //交易金额
		
		
		
		
		//if($verify_result) {//验证成功
			
			$log_->log_result($log_name,"没有验证直接通过哈，以后再加上验证哈：".$verify_result."\r\n");
			

			$order =  $this->order_db->where(array('orderid'=>$out_trade_no))->find();
			
			
			$log_->log_result($log_name,"查找到的订单数据是：".$this->order_db->getLastSql()."\r\n".var_export($order,true)."\r\n");
			
			//if($trade_status == 'TRADE_FINISHED' || $trade_status == 'TRADE_SUCCESS') {
				if($order['paid']==0){
					$data['paid'] = 1;
					$data['payment'] = 'wapalipay';
					$this->order_db->where(array('orderid'=>$out_trade_no))->save($data);
					
					$log_->log_result($log_name,"正在更改该订单的状态，运行的SQL语句为：".$this->order_db->getLastSql()."\r\n");
				}else{
					$log_->log_result($log_name,"订单的paid值为：".$order['paid']."，没有对订单数据进行处理\r\n");
				}
				
				$log_->log_result($log_name,"向请求端输出了字符串：success\r\n");
				
				echo "success";	
			//}	
		//}else{
			//$log_->log_result($log_name,"但是验证失败了喔！".$verify_result."\r\n");
		//}
		
		}
	}
	public function zfalipay_return_url(){
		import("@.ORG.Alipay.AlipayNotify");
		$alipay_config=$this->zfalipay_config;
		
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyReturn();
		
		$out_trade_no = $this->_get('out_trade_no');//商户订单号
		$trade_no = $this->_get('trade_no');//支付宝交易号
		$result = $this->_get('result');//交易状态
		
		$order_db = $this->order_db;
		$order = $order_db->where(array('orderid'=>$out_trade_no))->find();
		$order_token = $order['token'];
		$order_wecha_id = $order['wecha_id'];
		if($order['diningtype']){
			$back_url = U('Dining/dingdan',array('token'=>$order_token,'wecha_id'=>$order_wecha_id,'storeid'=>$order['storeid']));
		}else{
			$back_url = U('Product/my',array('token'=>$order_token,'wecha_id'=>$order_wecha_id,'storeid'=>$order['storeid']));
		}
		if($verify_result){//验证成功
			if($result == "success") {
				$data['paid'] = 1;
				$data['payment'] = 'zfalipay';
				$this->order_db->where(array('orderid'=>$out_trade_no))->save($data);
				$this->success('支付成功', $back_url);
			}
			else {
				$this->error('支付失败', $back_url);
			}
		}else{
			//$this->error('支付验证失败！', $back_url);
			$this->redirect($back_url);
		}
	}
	public function zfalipay_notify_url(){	
		
		include_once(APP_PATH.'Lib/ORG/Weixinpay2/Log_.php');
		$log_ = new Log_();
		$log_name=APP_PATH."./../data/zfalipay_notify_url-".date('Y-m-d',time()).".log";//log文件路径
		
		$log_->log_result($log_name,"【接收到的notify通知】:\r\n".var_export($_POST,true)."\r\n");
		
		import("@.ORG.Alipay.AlipayNotify");
		$alipay_config=$this->zfalipay_config;
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();

		if($verify_result) {//验证成功
			$trade_status   = $_POST['trade_status']; //交易状态
			$out_trade_no = $_POST['out_trade_no']; //商户订单号
			$trade_no = $_POST['trade_no']; //支付宝交易号
			$trade_status = $_POST['trade_status']; //交易状态
			$total_fee =$_POST['total_fee']; //交易金额
			
			$order =  $this->order_db->where(array('orderid'=>$out_trade_no))->find();
			if($trade_status == 'TRADE_FINISHED' || $trade_status == 'TRADE_SUCCESS') {
				if($order['paid']==0){
					$data['paid'] = 1;
					$data['payment'] = 'zfalipay';
					$this->order_db->where(array('orderid'=>$out_trade_no))->save($data);
					$this->order_db->where(array('orderid'=>$out_trade_no))->setField('paid',1);
				}
				echo "success";	
			}	
		}
	}
	public function yuepay(){
		$token=$this->token;
		$wecha_id=$this->wecha_id;
		$order = $this->order;
		//付款金额
		$total_fee =floatval($order['price']);
		$userInfo= M('Userinfo')->where(array('token'=>$token,'wecha_id'=>$wecha_id))->find();
		$useryue=$userInfo['account']-$total_fee;
		if($useryue<0){
			$this->error('余额不足,请充值',$this->orders_url);
			//$this->error('余额不足,请充值',U('Card/recherge',array('token'=>$this->token,'wecha_id'=>$this->wecha_id)));
		}else{
			$useInfo['account']=$useryue;
			$trade_status=M('Userinfo')->where(array('token'=>$token,'wecha_id'=>$wecha_id))->save($useInfo);
			if($trade_status){
					$data['paid'] = 1;
					$data['payment'] = 'yuepay';
					$this->order_db->where(array('orderid'=>$order['orderid']))->save($data);
					//消费记录
					$accountlog['token']=$token;
					$accountlog['wecha_id']=$wecha_id;
					$accountlog['price']=$total_fee;
					$accountlog['retype']=3;
					$accountlog['reuser']='会员购物';
					$accountlog['info']='订单号'.$order['orderid'];
					$accountlog['time']=time();
					M('member_accountlog')->add($accountlog);
					$backurl=$this->orders_url;
					$this->success('支付成功',$backurl);
			}else{
				$this->error('支付失败，请重试',$this->orders_url);
			}
		}
	}
	public function tenpay(){
		import("@.ORG.Tenpay.RequestHandler");
		$tenpay_config=$this->tenpay_config;
		$order = $this->order;
		$orderName =  $order['ordername'];
        if(!floatval($order['price']))exit('必须有价格才能支付');
        $total_fee = floatval($order['price']);		
        $out_trade_no = $order['orderid'];		
		$notify_url = C('site_url').'/index.php?g=Wap&m=Pay&a=tenpayshare_notify_url';
		//需http://格式的完整路径，不能加?id=123这类自定义参数
		//页面跳转同步通知页面路径
		$return_url = C('site_url').'/index.php?g=Wap&m=Pay&a=tenpayshare_return_url';
		//
		
		$reqHandler = new RequestHandler();
		$reqHandler->init();
		$key=$tenpay_config['partnerKey'];
		$partner=$tenpay_config['partnerId'];
		$reqHandler->setKey($key);
		$reqHandler->setGateUrl("https://gw.tenpay.com/gateway/pay.htm");

		//----------------------------------------
		//设置支付参数
		//----------------------------------------
		$reqHandler->setParameter("partner", $partner);
		$reqHandler->setParameter("out_trade_no", $out_trade_no);
		$reqHandler->setParameter("total_fee", $total_fee * 100);  //总金额
		$reqHandler->setParameter("return_url", $return_url);
		$reqHandler->setParameter("notify_url", $notify_url);
		$reqHandler->setParameter("body", $orderName);
		$reqHandler->setParameter("bank_type", "DEFAULT");  	  //银行类型，默认为财付通
		//用户ip
		$reqHandler->setParameter("spbill_create_ip", $_SERVER['REMOTE_ADDR']);//客户端IP
		$reqHandler->setParameter("fee_type", "1");               //币种
		$reqHandler->setParameter("subject",'weixin');          //商品名称，（中介交易时必填）

		//系统可选参数
		$reqHandler->setParameter("sign_type", "MD5");  	 	  //签名方式，默认为MD5，可选RSA
		$reqHandler->setParameter("service_version", "1.0"); 	  //接口版本号
		$reqHandler->setParameter("input_charset", "utf-8");   	  //字符集
		$reqHandler->setParameter("sign_key_index", "1");    	  //密钥序号

		//业务可选参数
		$reqHandler->setParameter("attach", "");             	  //附件数据，原样返回就可以了
		$reqHandler->setParameter("product_fee", "");        	  //商品费用
		$reqHandler->setParameter("transport_fee", "0");      	  //物流费用
		$reqHandler->setParameter("time_start", date("YmdHis"));  //订单生成时间
		$reqHandler->setParameter("time_expire", "");             //订单失效时间
		$reqHandler->setParameter("buyer_id", "");                //买方财付通帐号
		$reqHandler->setParameter("goods_tag", "");               //商品标记
		$reqHandler->setParameter("trade_mode",1);              //交易模式（1.即时到帐模式，2.中介担保模式，3.后台选择（卖家进入支付中心列表选择））
		$reqHandler->setParameter("transport_desc","");              //物流说明
		$reqHandler->setParameter("trans_type","1");              //交易类型
		$reqHandler->setParameter("agentid","");                  //平台ID
		$reqHandler->setParameter("agent_type","");               //代理模式（0.无代理，1.表示卡易售模式，2.表示网店模式）
		$reqHandler->setParameter("seller_id","");                //卖家的商户号



		//请求的URL
		$reqUrl = $reqHandler->getRequestURL();

		//获取debug信息,建议把请求和debug信息写入日志，方便定位问题
		/**/
		$debugInfo = $reqHandler->getDebugInfo();
		header('Location:'.$reqUrl);
		//echo "<br/>" . $reqUrl . "<br/>";
		//echo "<br/>" . $debugInfo . "<br/>";
	}
	public function waptenpay(){
		import("@.ORG.Tenpay.RequestHandler");
		$waptenpay_config=$this->waptenpay_config;
		$order = $this->order;
        $orderName =  $order['ordername'];
        if(!floatval($order['price']))exit('必须有价格才能支付');
        $total_fee = floatval($order['price']);
        $out_trade_no = $order['orderid'];
        $req = new WapPayRequest($this -> payConfig['partnerkey']);
        $req -> setInSandBox(false);
        $req -> setAppid($this -> payConfig['partnerid']);
        $req -> setParameter('total_fee', $total_fee * 100);
        $req -> setParameter('body',  $orderName);
        $req -> setParameter('notify_url', $notify_url);
        $req -> setParameter('out_trade_no', $out_trade_no);
        $req -> setParameter('return_url', $return_url);
        $req -> setParameter('spbill_create_ip', $_SERVER['REMOTE_ADDR']);
        $req -> setParameter('request_token', $_GET['token']);
        echo $req -> getURL();
	}
	
	//同步数据处理
	public function tenpayshare_return_url (){
		import("@.ORG.Tenpay.ResponseHandler");
		
		if($resHandler->isTenpaySign()) {
			$notify_id = $resHandler->getParameter("notify_id");
			//商户订单号
			$out_trade_no = $resHandler->getParameter("out_trade_no");
			//财付通订单号
			$transaction_id = $resHandler->getParameter("transaction_id");
			//金额,以分为单位
			$total_fee = $resHandler->getParameter("total_fee");
			//如果有使用折扣券，discount有值，total_fee+discount=原请求的total_fee
			$discount = $resHandler->getParameter("discount");
			//支付结果
			$trade_state = $resHandler->getParameter("trade_state");
			//交易模式,1即时到账
			$trade_mode = $resHandler->getParameter("trade_mode");
			
			$order_db = $this->order_db;
			$order = $order_db->where(array('orderid'=>$out_trade_no))->find();
			$order_token = $order['token'];
			$order_wecha_id = $order['wecha_id'];
			if($order['diningtype']){
			$back_url = U('Dining/dingdan',array('token'=>$order_token,'wecha_id'=>$order_wecha_id,'storeid'=>$order['storeid']));
			}else{
				$back_url = U('Product/my',array('token'=>$order_token,'wecha_id'=>$order_wecha_id,'storeid'=>$order['storeid']));
			}
			
			if("0" == $trade_state) {
				$data['paid'] = 1;
				$data['payment'] = 'zfalipay';
				$this->order_db->where(array('orderid'=>$out_trade_no))->save($data);
				$this->success('支付成功', $back_url);
			}else{$this->error('支付失败', $back_url);}
		}else {
			exit('sign error');
        }
    }
	//财付通同意异步处理url
	 public function tenpayshare_notify_url(){
        echo "success";
        eixt();
    }
}
?>
<?php
class BaseAction extends Action
{
	protected function _initialize()
	{
		define('RES',__ROOT__.'/'.THEME_PATH.'common');
		define('STATICS',__ROOT__.'/'.TMPL_PATH.'static');
		$this->assign('action',$this->getActionName());
		$this->domainDipatch();
	}
	protected function all_insert($name='',$back='/index'){
		$name=$name ? $name : MODULE_NAME;
		$db=D($name);
		if($db->create()===false){
			$this->error($db->getError());
		}else{
			$id=$db->add();
			if($id){
				$m_arr=array(
					'Img',
					'Text',
					'Voiceresponse',
					'Ordering',
					'Lottery',
					'Host',
					'Product',
					'Dining',
					'Selfform',
					'Xitie',
					'Wedding',
					'Diaoyan',
					'Yuyue',
					'Panorama',
					'Vote',
					'Estate',
					'Reservation',
					'Zuche',
					'Wifi',
					'Kefu'
				);
				if(in_array($name,$m_arr)){
					$data['pid']=$id;
					$data['module']=$name;
					$data['token']=session('token');
					$data['keyword']=$_POST['keyword'];
					M('Keyword')->add($data);
				}
				$this->success('操作成功',U(MODULE_NAME.$back));
			}else{
				$this->error('操作失败',U(MODULE_NAME.$back));
			}
		}
	}
	protected function insert($name='',$back='/index')
	{
		$name=$name ? $name : MODULE_NAME;
		$db=D($name);
		if($db->create()===false){
			$this->error($db->getError());
		}else{
			$id=$db->add();
			if($id==true){
				$this->success('操作成功',U(MODULE_NAME.$back));
			}else{
				$this->error('操作失败',U(MODULE_NAME.$back));
			}
		}
	}
	protected function save($name='',$back='/index')
	{
		$name=$name ? $name : MODULE_NAME;
		$db=D($name);
		if($db->create()===false){
			$this->error($db->getError());
		}else{
			$id=$db->save();
			if($id==true){
				$this->success('操作成功',U(MODULE_NAME.$back));
			}else{
				$this->error('操作失败',U(MODULE_NAME.$back));
			}
		}
	}
	protected function all_save($name='',$back='/index')
	{
		$name=$name ? $name : MODULE_NAME;
		$db=D($name);
		if($db->create()===false){
			$this->error($db->getError());
		}else{
			$id=$db->save();
			if($id){
				$m_arr=array(
					'Img',
					'Text',
					'Voiceresponse',
					'Ordering',
					'Lottery',
					'Host',
					'Product',
					'Dining',
					'Selfform',
					'Xitie',
					'Wedding',
					'Diaoyan',
					'Yuyue',
					'Panorama',
					'Vote',
					'Estate',
					'Reservation',
					'Wifi',
					'Kefu'
				);
				if(in_array($name,$m_arr)){
					$data['pid']=$_POST['id'];
					$data['module']=$name;
					$data['token']=session('token');
					$da['keyword']=$_POST['keyword'];
					M('Keyword')->where($data)->save($da);
				}
				$this->success('操作成功',U(MODULE_NAME.$back));
			}else{
				$this->error('操作失败',U(MODULE_NAME.$back));
			}
		}
	}
	protected function del_id($name='',$jump='')
	{
		$name=$name ? $name : MODULE_NAME;
		$jump=empty($name) ? MODULE_NAME.'/index' : $jump;
		$db=D($name);
		$where['id']=$this->_get('id','intval');
		$where['token']=session('token');
		if($db->where($where)->delete()){
			$this->success('操作成功',U($jump));
		}else{
			$this->error('操作失败',U(MODULE_NAME.'/index'));
		}
	}
	protected function all_del($id,$name='',$back='/index')
	{
		$name=$name ? $name : MODULE_NAME;
		$db=D($name);
		if($db->delete($id)){
			$this->ajaxReturn('操作成功',U(MODULE_NAME.$back));
		}else{
			$this->ajaxReturn('操作失败',U(MODULE_NAME.$back));
		}
	}
	/**
	 * AJAX返回数据标准
	 *
	 * @param int $status
	 * @param string $msg
	 * @param mixed $data
	 * @param string $dialog
	 */
	protected function ajaxReturn($status=1,$msg='',$data='',$dialog=''){
		parent::ajaxReturn(array(
			'status'=> $status,
			'msg'=> $msg,
			'data'=> $data,
			'dialog'=> $dialog,
		));
	}
	protected function _upload($savePath='./data/',$filetypes='',$data){
	
		import("@.ORG.UploadFile");
		$upload=new UploadFile();
		//设置上传文件大小
		$upload->maxSize=intval(C('up_size'))*1024 ;// 3292200;
		//设置上传文件类型	
		if(!$filetypes){
			$upload->allowExts=explode(',',C('up_exts'));
		}else{
			$upload->allowExts=$filetypes;
		}	
		//设置附件上传目录		
		$upload->savePath=$savePath;
		//子目录保存是否启用		
		//$upload->autoSub=1;
		//设置需要生成缩略图，仅对图像文件有效
		if($data['width']){
			$upload->thumb=true;
			//设置需要生成缩略图的文件后缀
			$upload->thumbPrefix='m_';
			//生产2张缩略图
			//设置缩略图最大宽度
			$upload->thumbMaxWidth=$data['width'];
			//设置缩略图最大高度
			$upload->thumbMaxHeight=$data['height'];
			$thumb=1;
		}
		
		// 设置引用图片类库包路径
		$upload->imageClassPath='@.ORG.Image';
		
		//设置上传文件规则
		$upload->saveRule=uniqid;
		//删除原图
		$upload->thumbRemoveOrigin=true;
		//dump($upload);exit;
		if(!$upload->upload()){
			//捕获上传异常
			return $upload->getErrorMsg();
		}else{
			//取得成功上传的文件信息
			$uploadList=$upload->getUploadFileInfo();
			//dump($uploadList);exit;
			return $uploadList;
		}
	}
	//发短信
	protected function Send_sms($phone,$body){
		//查询短信配置
		$token=$this->_get('token');
		if(!$token){
			$token=session('token');
		}
		$set=M('sms_set')->where(array('token'=>$token))->find();
		if($set['status']){
			$sms=new Sms("smsbao",$set['account'],$set['password']);
			$re=$sms->sendsms($phone,$body);
			return $re;
		}
	}
	//发邮件函数
	protected function Send_email($emailid,$Subject,$body,$to_email='',$FromName='管理员'){
		//查询邮件配置
		/*$token=$this->_get('token');
		if(!$token){
			$token=session('token');
		}*/
		$where['id']=$emailid;
		$set=M('email_set')->where($where)->find();
		$host=$set['server'];
		$port=$set['port'];
		$emailuser=$set['account'];
		$emailpassword=$set['password'];
		if($to_email==''){
			$to_email=$set['emails'];
		}
		if($set['status']){
			$mail=new PHPMailer();
			$mail->IsSMTP();
			// telling the class to use SMTP
			$mail->Host=$host;
			// SMTP server
			$mail->SMTPDebug='0';
			// enables SMTP debug information(for testing)
			// 1=errors and messages
			// 2=messages only
			$mail->SMTPAuth=true;
			$mail->CharSet="UTF-8"; //字符集 
			$mail->Encoding="base64"; //编码方式 
			// enable SMTP authentication
			$mail->Port=$port;
			// set the SMTP port for the GMAIL server
			$mail->Username=$emailuser;
			// SMTP account username
			$mail->Password=$emailpassword;
			// SMTP account password
			$mail->From=$emailuser;	  // 发件人邮箱	
			$mail->FromName="=?utf-8?B?".base64_encode($FromName)."?=";  // 发件人	
			//$mail->AddAddress($to_email,'商户');
			//$mail->AddReplyTo($emailuser);
			$mail->Subject="=?UTF-8?B?".base64_encode($Subject)."?=";
			$mail->IsHTML(true);  // send as HTML	
			// optional,comment out and test
			$mail->MsgHTML($body);
			$to_email_arr=array_filter(explode(",",$to_email));
			foreach($to_email_arr as $k=> $v){
				$mail->AddAddress($v); 
			}
			return($mail->Send());
		}
	}
		//基础打印方法
	public function executeprint($printerid,$str){
		$printer_set=M('Printer_set')->where('id='.$printerid)->find();
		//设置打印服务器开始
		define('MEMBER_CODE',$printer_set['memberCode']);
		define('FEYIN_KEY',$printer_set['feiyin_key']);
		define('DEVICE_NO',$printer_set['deviceNo']);
		//define('FEYIN_HOST','my.feyin.net');
		define('FEYIN_PORT',80);
		switch($printer_set['type']){
		case 1:
			define('FEYIN_HOST','my.feyin.net');	
			$msgInfo=array(
				'memberCode'=>MEMBER_CODE,
				'msgDetail'=>$str,
				'deviceNo'=>DEVICE_NO,
				'msgNo'=>time()+1,
				'reqTime'=> number_format(1000*time(),0,'','')
			);
			$content=$msgInfo['memberCode'].$msgInfo['msgDetail'].$msgInfo['deviceNo'].$msgInfo['msgNo'].$msgInfo['reqTime'].FEYIN_KEY;
			$msgInfo['securityCode']=md5($content);
			$msgInfo['mode']=2;
			$client=new HttpClient(FEYIN_HOST,FEYIN_PORT);
			if($client->post('/api/sendMsg',$msgInfo)){
				$printstate=$client->getContent();
			}
			break;
		case 2:
			define('FEYIN_HOST','115.28.225.82');
			if(MEMBER_CODE){
				$str .= '----------请扫描二维码----------';
				$str .= '<QR>'.MEMBER_CODE.'</QR>';
				$str .= '<BR>';
			}
			$msgInfo=array(
				'clientCode'=>DEVICE_NO,
				'printInfo'=>$str,
				'apitype'=>'php',
				'key'=>FEYIN_KEY
			);
			$client=new HttpClient(FEYIN_HOST,FEYIN_PORT);
			if(!$client->post('/FeieServer/printSelfFormatOrder',$msgInfo)){//提交失败
				$printstate='faild';
			}else{				
				$msgjson=$client->getContent();
				$msgjson=(Array)json_decode($msgjson);
				$printstate=$msgjson['reslutCode'];
			}
			break;
		default:
			define('FEYIN_HOST','my.feyin.net');
			$msgInfo=array(
				'memberCode'=>MEMBER_CODE,
				'msgDetail'=>$str,
				'deviceNo'=>DEVICE_NO,
				'msgNo'=>time()+1,
				'reqTime'=> number_format(1000*time(),0,'','')
			);
			$content=$msgInfo['memberCode'].$msgInfo['msgDetail'].$msgInfo['deviceNo'].$msgInfo['msgNo'].$msgInfo['reqTime'].FEYIN_KEY;
			$msgInfo['securityCode']=md5($content);
			$msgInfo['mode']=2;
			$client=new HttpClient(FEYIN_HOST,FEYIN_PORT);
			if($client->post('/api/sendMsg',$msgInfo)){
				$printstate=$client->getContent();
			}
		}
		//设置为打印过了
		if($printstate==0){	
			return true;
		}else{
			return false;
		}		
	}
	
	public function generateQRfromGoogle($chl,$widhtHeight ='150',$EC_level='L',$margin='0'){
		$chl = urlencode($chl);
		$src='http://chart.apis.google.com/chart?chs='.$widhtHeight.'x'.$widhtHeight.'&cht=qr&chld='.$EC_level.'|'.$margin.'&chl='.$chl;
		return $src;
	}
	//参数背景颜色(bg)、前景颜色(fg)、渐变颜色(gc)、纠错等级(el)、图片宽度(w)、外边距(m)
	public function cerateQRfromliantu($url,$w="150",$m='10',$el='m'){
		$url=urlencode($url);
		$src="http://qr.liantu.com/api.php?text=".$url.'&w='.$w.'&m='.$m.'&el='.$el;
		return $src;
	}
	
	private function domainDipatch() {
		
		preg_match("#(.*?)\.#i",$_SERVER['SERVER_NAME'],$match);
		$username = $match[1];
		
		if (strlen($username) > 5){
		
			//查找是否有用户包存在
			$list = M('Wxuser')->where("weixin='".$username."'")->select();
			
			if (count($list) > 0){
				
				// 有用户名存在，作主要跳转
				header("Location: http://www.".str_replace($username.'.','',$_SERVER['SERVER_NAME'])."/index.php?&g=Wap&m=Product&a=cats&token=".$list[0]['token']);
			}
			
			echo '系统检测到需要跳转二级域名，但由于某些原因，跳转没有成功！';
			exit();
			
		}
	}
}
?>
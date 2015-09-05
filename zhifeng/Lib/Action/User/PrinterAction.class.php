<?php
class PrinterAction extends UserAction{
	public $token;
	public $wecha_id;
	
	public function _initialize() {
		parent::_initialize();
		$this->token= $this->token;

        $this->canUseFunction('print');
		
		$this->wecha_id	= $this->_get('wecha_id');
		if (!$this->wecha_id){
			$this->wecha_id='';
		}
		$where['id']=$this->_get('id');
		$where['token']=$this->token;
		$this->assign('token',$this->token);
		$this->assign('wecha_id',$this->wecha_id);
		$this->printer_model = M('printer_set');
		$this->printer_set = M('printer_set')->where($where)->find();
		
		//查询店铺列表
		$stores =M('Company')->where(array('token'=>$this->token))->select();
		if(!$stores){
			$this->error('请设置公司LBS信息',U('Company/index',array('token'=>$this->token)));
		}
		$this->stores=$stores;
		$this->assign('stores',$stores);
		$storeid=$this->_get('storeid','intval');
		$this->storeid=$storeid;
		$this->assign('storeid',$storeid);
		
	}
	public function index(){
		$set=$this->printer_set;
		$db=$this->printer_model;
		if(IS_POST){
			$_POST['uid']=SESSION('uid');
			$_POST['token']=SESSION('token');
			if($set==false){
				if ($db->create() === false) {
					$this->error($db->getError());
				} else {
					$id = $db->add();
					if ($id == true) {
						$this->success('操作成功', U('Printer/lists',array('token'=>$this->token)));
					} else {
						$this->error('操作失败', U('Printer/lists',array('token'=>$this->token)));
					}
				}
			}else{
				$_POST['id']=$set['id'];
				if ($db->create() === false) {
					$this->error($db->getError());
				} else {
					$id = $db->save();
					if ($id == true) {
						$this->success('操作成功', U('Printer/index',array('token'=>$this->token,'id'=>$set['id'])));
					} else {
						$this->error('操作失败', U('Printer/index',array('token'=>$this->token,'id'=>$set['id'])));
					}
				}	
			}
		}else{
			$this->assign('set',$set);
			$this->display();
		}
	}
	//测试打印
	public function test(){
		if($this->_get('id')){
			$where['id']=$this->_get('id');
		}else{
		$this->error('错误的打印机id，请重试');
		}
		$where['token']=$this->token;
		//设置打印服务器开始
		$printer_set = M('printer_set')->where($where)->find();
		
		define('MEMBER_CODE', $printer_set['memberCode']);
		define('FEYIN_KEY', $printer_set['feiyin_key']);
		define('DEVICE_NO', $printer_set['deviceNo']);
		//define('FEYIN_HOST','my.feyin.net');
		define('FEYIN_PORT', 80);
		
		$str='
    智风订餐打印测试
	
	条目      单价（元）   数量
	----------------------------
	番茄炒粉     10.0       1
	客家咸香鸡   20.0       1

	备注：请快点送到。
	----------------------------
	合计：30.0元 

	送货地址：*******
	联系电话：1380017****
	订购时间：'.date("Y-m-d H:i:s").'
	
	'.$printer_set['head'];
	
		switch($printer_set['type']){
			case 1:
				define('FEYIN_HOST','my.feyin.net');	
				$msgInfo=array(
					'memberCode'=>MEMBER_CODE,
					'msgDetail'=>$str,
					'deviceNo'=>DEVICE_NO,
					'msgNo'=>time()+1,
					'reqTime' => number_format(1000*time(), 0, '', '')
				);
				$content = $msgInfo['memberCode'].$msgInfo['msgDetail'].$msgInfo['deviceNo'].$msgInfo['msgNo'].$msgInfo['reqTime'].FEYIN_KEY;
				$msgInfo['securityCode'] = md5($content);
				$msgInfo['mode']=2;
				$client = new HttpClient(FEYIN_HOST,FEYIN_PORT);
				if($client->post('/api/sendMsg',$msgInfo)){
					$printstate=$client->getContent();
				}
				break;
			case 2:
				define('FEYIN_HOST','115.29.201.123');
				$msgInfo = array(
					'memberCode'=>MEMBER_CODE, 
					'apiKey'=>FEYIN_KEY, 
					'printInfo'=>$str,
					'clientCode'=>DEVICE_NO, 
					'apitype'=>'php', 
				);
				$client = new HttpClient(FEYIN_HOST,FEYIN_PORT);
				if(!$client->post('/CServer/printSelfFormatOrder',$msgInfo)){ //提交失败
					$printstate = 'faild';
				}
				else{				
					$msgjson =$client->getContent();
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
					'reqTime' => number_format(1000*time(), 0, '', '')
				);
				$content = $msgInfo['memberCode'].$msgInfo['msgDetail'].$msgInfo['deviceNo'].$msgInfo['msgNo'].$msgInfo['reqTime'].FEYIN_KEY;
				$msgInfo['securityCode'] = md5($content);
				$msgInfo['mode']=2;
				$client = new HttpClient(FEYIN_HOST,FEYIN_PORT);
				if($client->post('/api/sendMsg',$msgInfo)){
					$printstate=$client->getContent();
				}

		}
		
		
		if($printstate==0){
			$this->success('打印成功', U('Printer/index',array('token'=>$this->token,'id'=>$this->_get('id'))));
		}else{
			$this->error('打印失败，错误代码：'.$printstate);
		}
	}
	public function lists(){
		$where['token']=$this->token;
		if($this->_get('storeid')){
			$where['_string']="storeid ='' or storeid=".$this->_get('storeid');
		}
		if($this->_get('type')){
			$where['type']=$this->_get('type');
		}
		$lists=$this->printer_model->where($where)->select();
		$this->assign('lists',$lists);
		$this->display();
	}
	//删除打印机
	public function delete(){
		$where['token']=$this->token;
		$id=$this->_get('id');
		if($id){
			$where['id']=$this->_get('id');
		}else{
			$this->error('系统错误，请重试！');exit;
		}
		$status==$this->printer_model->where($where)->delete();
		if(!$status){
			$this->success('删除成功！');
		}else{
			$this->error('删除失败');
		}
	}
}
?>
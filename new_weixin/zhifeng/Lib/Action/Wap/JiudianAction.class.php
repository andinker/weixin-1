<?php
//wap
class JiudianAction extends BaseAction{
	public $token;
	public $wecha_id;
	public $Jiudian_model;
	public $jiudian_order;
	public function __construct(){
		parent::__construct();
		$this->token = $this->_get('token');
		$this->assign('token',$this->token);
		$this->wecha_id	= $this->_get('wecha_id');
		if (!$this->wecha_id){
			$this->wecha_id='';
		}
		$this->assign('wecha_id',$this->wecha_id);
		$this->Jiudian_model=M('jiudian');
		$this->jiudian_order=M('jiudian_order');
		$this->type='Jiudian';
	}
	//预约列表
	public function index(){
		$pid = $this->_get('id');
		$wecha_id = $this->_get('wecha_id');
		$where = array('token'=> $this->_get('token'),'id'=>$pid);
		$data = $this->Jiudian_model->where($where)->find();
		$info = M('jiudian_setcin')->where(array('pid'=>$pid,'type'=>$this->type))->select();
		
		$data['count'] = $this->jiudian_order->where(array('wecha_id'=> $wecha_id,'pid'=>$pid))->count();
		$data['token'] = $this->_get('token');
		$data['wecha_id'] = $wecha_id;
	
		$this->assign('data', $data);
		$this->assign('info', $info);
		$this->display();
	}
	public function info(){
		$pid = $this->_get('id');
		$id = $this->_get('aid');
		$where = array('token'=> $this->_get('token'),'id'=>$pid);
		
		$cast = array(
			'token'=> $this->_get('token'),
			'wecha_id'=> $this->_get('wecha_id')
		);
		$info = M('jiudian_setcin')->where(array('id'=>$id))->find();
		$info['sheng']=$info['yuanjia']-$info['youhui'];
		$data = $this->Jiudian_model->where($where)->find();
		for($i=1;$i<6;$i++){
			if(!empty($info['pic'.$i])){
				$info['pic'][]=$info['pic'.$i];
				unset($info['pic'.$i]);
			}
		}
		$data['token'] = $this->_get('token');
		$data['wecha_id'] = $this->_get('wecha_id');
		$wap= M('setinfo')->where(array('pid'=>$pid,'type'=>$this->type))->select();
		$str=array();
		foreach($wap as $v){

			if($v['kind']==5){
				$str["message"]=$v["name"];
			}else{
				$str[$v["name"]]=$v["value"];
			}		
		}
		$arr= M('setinfo')->where(array('kind'=>'3','pid'=>$pid,'type'=>$this->type))->select();
		$list= M('setinfo')->where(array('kind'=>'4','pid'=>$pid,'type'=>$this->type))->select();
		$i=0;
		foreach($list as $v){
			$list[$i]['value']= explode("|",$v['value']);
			$i++;
		}
		
		$this->assign('str', $str);
		$this->assign('arr',$arr);
		$this->assign('list',$list);
		$this->assign('data', $data);
		$this->assign('info', $info);
		$this->display();
	}
	
	//添加订单
	public function add(){
		if(IS_POST){
			$url = U($this->type.'/order',array('token'=>$_POST['token'], 'wecha_id'=>$_POST['wecha_id'],'id'=>$_POST['pid']));
			$_POST['addtime']= time();
			if($this->jiudian_order->add($_POST)){
				$json = array(
					'error'=> 1,
					'msg'=> '预定成功！',
					'url'=> $url
				);
				$jiudian['title']=$_GET['title'];
				$this->inform($_POST,$jiudian);
				echo  json_encode($json);
			}else{
				$json = array(
					'error'=> 0,
					'msg'=> '预定失败！',
					'url'=> U($this->type.'/index',array('token'=>$_POST['token'], 'wecha_id'=>$_POST['wecha_id'],'id'=>$_POST['pid']))
				);
				echo  json_encode($json);
			}
		}
	}
	//下单通知
	private function inform($data,$jiudian){
		$token=$data['token'];
		//是否通知开关
		$inform=S('inform_'.$token);
		if(!$inform){
			$inform=M('Inform')->where(array('token'=>$token))->find();
			S('inform_'.$token,$inform);
		}
		if($inform['jiudian']==1){
			$informstatus=true;
		}else{
			$proInform=unserialize($inform['jiudian']);
		}
		$date=time();
		//邮件,打印条件是否开启
		$emailwhere['token']=$token;
		$emailwhere['status']=1;
		$emailwhere['storeid']=0;
		//订单详情
		$info="酒店订单提醒：《".$jiudian['title']."》\r\n 提交时间：".date('Y-m-d H:i:s',$date)."\r\n姓名：".$data['name']."\r\n电话：".$data['phone']."\r\n时间：".$data['or_date'].$data['time']."\r\n类型：".$data['kind']."\r\n备注：".$data['memo'];
		if($data['fieldsigle']){
			$info.=str_replace(array('$','#'),array('\r\n',':'),$data['fieldsigle']);
		}
		if($data['fielddownload']){
			$info.=str_replace(array('$','#'),array('\r\n',':'),$data['fielddownload']);
		}
		if($informstatus||$proInform['s']==1){
			//给客户发信息
			if($data['phone']){
				$smsbody="温馨提示：您通过微信提交的在线挂号已经成功了！请于".$data['or_date'].$data['time']."按时前往";
				$this->Send_sms($data['tel'],$smsbody);
			}			
			//给商家发短信
			$smsset=M('sms_set')->where(array('token'=>$token,'status'=>1))->find();
			if($smsset['phone']){
				$sms_body="您的酒店房间：《".$jiudian['title']."》于".date('Y-m-d H:i:s',$date)."有新客户预定了，请注意联系客户跟进（".$data['phone']."）";
				$this->Send_sms($smsset['phone'],$sms_body);
			}
		}
		//发邮件
		if($informstatus||$proInform['e']==1){
			$subject="您的酒店房间《".$jiudian['title']."》又有客户预定了！";
			$body=str_replace("\r\n",'</br>',$info);	
			//邮件列表
			$set_state =M('email_set')->field('id')->where($emailwhere)->order('storeid DESC')->limit(0,1)->select();
			$this->Send_email($set_state[0]['id'],$subject,$body);
		}
		//打印
		if($informstatus||$proInform['p']==1){
			$content=$info;
			$printset_state =M('Printer_set')->field('id')->where($emailwhere)->order('storeid','DESC')->limit(0,3)->select();
			foreach($printset_state as $val){
				$status=$this->executeprint($val['id'],$content);
			}					
		}
	}
	//订单列表
	public function order(){
		$id = $this->_get('id');
		$token = $this->_get('token');
		$wecha_id = $this->_get('wecha_id');
		$where = array(
			'wecha_id'=> $wecha_id,
			'pid'=> $id
		);
		$data = $this->jiudian_order->where($where)->order('id desc')->select();
		$info= $this->Jiudian_model->where(array('token'=> $this->_get('token'),'id'=>$id))->find();
		
		$this->assign('data',$data);
		$this->assign('info',$info);
		$this->display();
	}
	
	//修改订单视图
	public function set(){
		$id = $this->_get('id');
		$pid = $this->_get('pid');
		
		$cast = array(
			'token'=> $this->_get('token'),
			'wecha_id'=> $this->_get('wecha_id')
		);
		$data = M('jiudian_order')->where(array('id'=>$id))->find();
		$info = M('jiudian_setcin')->where(array('name'=>$data['kind']))->find();
		$info['sheng']=$info['yuanjia']-$info['youhui'];
		
		$copyright=$this->Jiudian_model->where(array('token'=> $this->_get('token'),'id'=>$pid))->find();
		$data['copyright']=$copyright['copyright'];
		
		$data['token'] = $this->_get('token');
		$data['wecha_id'] = $this->_get('wecha_id');
		$wap= M('setinfo')->where(array('pid'=>$pid,'type'=>$this->type))->select();
		$str=array();
		foreach($wap as $v){
			if($v['kind']==5){
				$str["message"]=$v["name"];
			}
			else{
				$str[$v["name"]]=$v["value"];
			}
		}
		$arr= M('setinfo')->where(array('kind'=>'3','pid'=>$pid,'type'=>$this->type))->select();
		$list= M('setinfo')->where(array('kind'=>'4','pid'=>$pid,'type'=>$this->type))->select();
		$list_arr =array();
		$i=0;
		foreach($list as $v){
			$list[$i]['value']= explode("|",$v['value']);
			$i++;
		}

		$text=$data['fieldsigle'];
		$down=$data['fielddownload'];
		$text=substr($text,1);
		$down=substr($down,1);
		$text=explode('$',$text);
		$down=explode('$',$down);
		$detail=array();
		$i=1;
		foreach($text as $v){
			$detail['text'][$i]=explode('#',$v);
			$i++;
		}
		$i=1;
		foreach($down as $v){
			$detail['down'][$i]=explode('#',$v);	
		}

		$this->assign('detail', $detail);
		
		$this->assign('str', $str);
		$this->assign('arr',$arr);
		$this->assign('list',$list);
		$this->assign('list_arr',$list);
		$this->assign('data', $data);
		$this->assign('info', $info);
		$this->display();
	}
	
	//修改订单
	public function runSet(){
	
		$id = $_POST['id']; 
		if(IS_POST){
			$url = U($this->type.'/order',array('token'=>$_POST['token'], 'wecha_id'=>$_POST['wecha_id'],'id'=>$_POST['pid'],));
			$where = array(
				'id' =>$id
			);
			if($this->jiudian_order->where($where)->save($_POST)){
				$json = array(
					'error'=> 1,
					'msg'=> '修改成功！',
					'url'=> $url
				);
				echo  json_encode($json);
			}else{
				$json = array(
					'error'=> 0,
					'msg'=> '修改失败！',
					'url'=> $url
				);
				echo  json_encode($json);
			}
		}
		
	}
	
	//删除订单
	public function del(){
		if(IS_POST){
			$url = U($this->type.'/order',array('token'=>$_POST['token'], 'wecha_id'=>$_POST['wecha_id'],'id'=>$_POST['pid'],));
			$where = array(
				'id' =>$_POST['id']
			);
			if($this->jiudian_order->where($where)->delete()){
				$json = array(
					'error'=> 1,
					'msg'=> '删除成功！',
					'url'=> $url
				);
				echo  json_encode($json);
			}else{
				$json = array(
					'error'=> 0,
					'msg'=> '删除失败！',
					'url'=> $url
				);
				echo  json_encode($json);
			}
		}
	}
	
}


?>
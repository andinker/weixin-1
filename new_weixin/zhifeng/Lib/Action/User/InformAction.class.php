<?php
/**
**消息通知设置
**/
class InformAction extends UserAction{
	public $token;
	public $wecha_id;
	
	public function _initialize() {
		parent::_initialize();
		$token= $this->token;				
		//$this->canUseFunction('Email');
		$this->token=$token?$token:$_REQUEST['token'];
		$this->assign('token',$this->token);
				
	}
	public function index(){
		$db=M('Inform');
		$where['token']=$this->token;
		$inform=$db->where($where)->find();
		if(IS_POST){
			$_POST['token']=$_REQUEST['token'];
			$_POST['dining']=serialize($_REQUEST['dining']);
			$_POST['product']=serialize($_REQUEST['product']);
			$_POST['group']=serialize($_REQUEST['group']);
			$_POST['yuyue']=serialize($_REQUEST['yuyue']);
			$_POST['tydd']=serialize($_REQUEST['tydd']);
			$_POST['biaodan']=serialize($_REQUEST['biaodan']);				
			$_POST['yiliao']=serialize($_REQUEST['yiliao']);	
			$_POST['jiudian']=serialize($_REQUEST['jiudian']);				
			if($inform){				
				$status=$db->where($where)->save($_POST);
				if($status){
					S('inform_'.$_REQUEST['token'],$_POST);
					$this->success('保存成功');
				}else{
					$this->error('保存失败');
				}
			}else{
				$status=$db->add($_POST);
				if($status){
					S('inform_'.$_REQUEST['token'],$_POST);
					$this->success('初次保存成功');
				}else{
					$this->error('初次保存失败');
				}
			}
		}else{
			$inform['dining']=unserialize($inform['dining']);
			$inform['product']=unserialize($inform['product']);
			$inform['group']=unserialize($inform['group']);
			$inform['yuyue']=unserialize($inform['yuyue']);
			$inform['tydd']=unserialize($inform['tydd']);
			$inform['biaodan']=unserialize($inform['biaodan']);
			$inform['yiliao']=unserialize($inform['yiliao']);
			$inform['jiudian']=unserialize($inform['jiudian']);
			$this->assign('inform',$inform);
			$this->display();
		}		
	}	
}
?>
<?php
/**
**邮箱设置
**/
class EmailAction extends UserAction{
	public $token;
	public $wecha_id;
	
	public function _initialize() {
		parent::_initialize();
		$this->token= $this->token;
		$this->wecha_id	= $this->_get('wecha_id');
		if (!$this->wecha_id){
			$this->wecha_id='';
		}
		
		$this->canUseFunction('Email');
		
		$this->assign('token',$this->token);
		$this->assign('wecha_id',$this->wecha_id);
		
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
		
		$where['id']=$this->_get('id');
		$where['token']=$this->token;
		$set=M('email_set')->where($where)->find();
		$db=M('email_set');
		if(IS_POST){
			$_POST['uid']=SESSION('uid');
			$_POST['token']=SESSION('token');
			$_POST['storeid']=$this->_POST('storeid');
			if($set==false){
				if ($db->create() === false) {
					$this->error($db->getError());
				} else {
					$id = $db->add();
					if ($id == true) {
						$this->success('操作成功', U('Email/lists',array('token'=>$this->token)));
					} else {
						$this->error('操作失败', U('Email/lists',array('token'=>$this->token)));
					}
				}
			}else{
				$_POST['id']=$set['id'];
				if ($db->create() === false) {
					$this->error($db->getError());
				} else {
					$id = $db->save();
					if ($id == true) {
						$this->success('操作成功',  U('Email/lists',array('token'=>$this->token)));
					} else {
						$this->error('操作失败',  U('Email/lists',array('token'=>$this->token)));
					}
				}	
			}
		}else{
			$this->assign('set',$set);
			$this->display();
		}
	}
	//测试发送邮件
	public function send(){
		if($this->_get('id')){
			$where['id']=$this->_get('id');
		}else{
			$this->error('错误操作，请重试');
		}
		$where['token']=$this->token;
		$set=M('email_set')->where($where)->find();
		if(!$set['status']){
			$this->error('请先开启功能！',U('Email/lists',array('token'=>$this->token)));
		}
		$re = $this->Send_email($where['id'],"这是测试邮件","这是测试邮件内容",$set['emails'], "智风微信CMS");
		if($re){
			$this->success('邮件发送成功',U('Email/index',array('token'=>$this->token,'id'=>$where['id'])));
		}else{
			$this->error('邮件发送失败',U('Email/index',array('token'=>$this->token,'id'=>$where['id'])));
		}
	}
	//邮箱列表
	public function lists(){
		$where['token']=$this->token;
		if($this->_get('storeid')){
			$where['_string']="storeid ='' or storeid=".$this->_get('storeid');
		}
		$lists=M('email_set')->where($where)->select();
		$this->assign('lists',$lists);
		$this->display();
	}
	//删除邮箱
	public function delete(){
		$where['token']=$this->token;
		$id=$this->_get('id');
		if($id){
			$where['id']=$this->_get('id');
		}else{
			$this->error('系统错误，请重试！');exit;
		}
		$status==M('email_set')->where($where)->delete();
		if(!$status){
			$this->success('删除成功！');
		}else{
			$this->error('删除失败');
		}
	}
}
?>
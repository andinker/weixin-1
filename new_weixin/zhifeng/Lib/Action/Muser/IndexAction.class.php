<?php
class IndexAction extends MuserAction{
	
	public function index() {
		
		$this->assign('PAGE_TITLE','管理后台首页');
		
		// 列出用户帐号下的所有公众号
		$where['uid']=session('uid');
		$token=session('token');

		
		$db=M('Wxuser');
		$wxusers=$db->where($where)->select();
		
		$this->assign('wxusers',$wxusers); 
		$this->assign('token',$token);
		
		$this->display();
		
	}

	public function wxuser_login(){
		
		$id=$this->_get('id','intval');
		$token=$this->_get('token','trim');
		$info=M('Wxuser')->find($id);
		if($info==false||$info['token']!==$token){
			
			$this->redirect(U('Muser/Index/index'));
			
		}else{
			session('token',$token);
			session('wxid',$info['id']);
			session('wxname',$info['wxname']);
			
			$this->redirect(U('Muser/Index/index',array('token'=>$token)));
			
		}
	
	}
}
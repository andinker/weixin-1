<?php 
class AuthAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
	} 
	function index(){
		$wxuser=$this->wxuser;
		if(empty($wxuser)){
			$this->wxuser=$wxuser=M('Wxuser')->where(array('token'=>$this->token))->find(); 
		}		
		if($wxuser['winxintype']!=3){
			$this->error('亲，只有高级号才能使用这项功能哦！',U('Index/edit',array('id'=>$wxuser['id'])));
		}
		$this->assign('info',$this->wxuser);
		if(IS_POST){
			M('Wxuser')->where(array('token'=>$this->token))->save(array('oauth'=>intval($_POST['oauth']))); 
			$this->success('设置成功'); 
		}else{
			$this->assign('tab','index'); 
			$this->display(); 
		} 
	} 
	function advantage(){
		$this->assign('tab','advantage'); 
		$this->display(); 
	} 
	function help(){
		$this->assign('tab','help'); $this->display(); 
	} 
}
?>
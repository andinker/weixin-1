<?php
class IndexAction extends BaseAction{
	//关注回复
	public function index(){
		
		if ( strpos($_SERVER['SCRIPT_NAME'],'/wxpay/index.php') === false ){ 
			$this->display();
		}else{
			//微支付通知url
			R('Wap/Wxpay/notify_url');
		}
	}
	public function price(){
		//遍历功能列表
		$group=M('User_group')->field('id,name,price')->where('status=1')->select();
		foreach($group as $key=>$vo){
			$fun=M('Function')->where(array('status'=>1,'gid'=>$vo['id']))->select();
			foreach($fun as $vkey=>$vo){
				$function[$key][$vkey]=$vo;
			}
		}
		$this->assign('group',$group);
		//print_r($function);
		$this->assign('fun',$function);
		$this->display();
	}
	public function resetpwd(){
			
		if(isset($_GET['code'])){
			$uid=$this->_get('uid','intval');
			$code=$this->_get('code','trim');
			$rtime=$this->_get('resettime','intval');
			$time=time();
			if(($rtime+3*24*3600)<$time){
				$this->error('校验码已过期！',U('Index/checkpwd'));
			}
			$list=M('Users')->find($uid);
			$checkcode=md5($_GET['uid'].$list['password'].$list['email']);
			if($checkcode!==$_GET['code']){
				$this->error('校验码不正确，请重试！',U('Index/checkpwd'));
			}
			$this->assign('uid',$uid);
		}
		
		$this->display();
		
	}
	public function dayin(){
		$this->display();
	}
	public function wifi(){
		$this->display();
	}
	/**
	if($_GET['code']){
				$time=time();
				if(($_GET['resettime']+3*24*3600)<$time){
					$this->error('校验码已过期！',U('Index/checkpwd'));
				}
				$list=M('Users')->where(array('id'=>$_GET['uid']))->find();
				$checkcode=md5($_GET['uid'].$list['password'].$list['email']);
				if(!$checkcode==$_GET['code']){
					$this->error('校验码不正确，请重试！',U('Index/checkpwd'));
				}
			}else{
				$this->error('校验码不正确，请重试！',U('Index/index'));
			}
	**/
	
	public function reg() {
		
		//读取省、市、区、小区数据表进行显示
		$where = array('status'=>1);
		$province_data 	= M('region_province')->where($where)->select();
		$city_data     	= M('region_city')->where($where)->select();
		$district_data 	= M('region_district')->where($where)->select();
		$community_data = M('region_community')->where($where)->select(); 
		
		$this->assign('province_data'	,$province_data);
		$this->assign('city_data'		,$city_data);
		$this->assign('district_data'	,$district_data);
		$this->assign('community_data'	,$community_data);
		
		$this->display(); 
	}
	
	public function login() {
		
		$uid = session('uid');
		
		if (!empty($uid)) $this->redirect('User/Index/index');
		
		$this->display();
	}
}
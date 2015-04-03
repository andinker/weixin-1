<?php
class UsersModel extends Model{

	protected $_map = array(
			'community' =>'community_id'
	);
	
	//自动验证
	protected $_validate=array(
		array('username','require','用户名称必须填写！',1,'',3),
		array('password','require','用户密码必须填写！',0,'',3),
		array('repassword','password','两次密码不一致',0,'confirm'), 
		array('username','','用户名称已经存在！',1,'unique',1), // 新增修改时候验证username字段是否唯一
		array('email','email','邮箱格式不正确'),
		array('email','','邮箱已经存在！',1,'unique',1),
	    array('community_id','checkIt','你所选择的社区已经存在小区号，每个社区只能存在一个小区号，该小区现在只能申请商家号',1,'callback',self::MODEL_BOTH),
		array('community_id','require','必须选择您所在的社区！',1,'',self::MODEL_BOTH),
		array('account_type','require','必须选择要申请的帐号类型！',1,'',self::MODEL_BOTH) 
	);
	
	protected $_auto = array (
		array('password','md5',self::MODEL_BOTH,'function'),
		array('repassword','md5',self::MODEL_BOTH,'function'),
		array('createtime','time',self::MODEL_INSERT,'function'),
		array('createip','getip',self::MODEL_INSERT,'callback'),
		array('viptime','time',self::MODEL_BOTH,'function'),
		array('lasttime','time',self::MODEL_BOTH,'function'),
		array('lastip','getip',self::MODEL_BOTH,'callback'),
		array('status','getstatus',self::MODEL_BOTH,'callback'),
		array('gid','getgid',self::MODEL_INSERT,'callback'),
	);
	
	public function getip(){
		return $_SERVER['REMOTE_ADDR'];
	}
	
	public function getstatus(){
		if ( intval($_POST['account_type']) == 1 ){
			return 0;
		}else{
			return C('ischeckuser')=='true'?1:0;
		}
		
	}
	
	public function getgid(){
		return 1;
	}
	
	public function checkIt() {
		
		if ( intval($_POST['account_type']) == 1 ){
			// 查找所选小区下所有帐号
			$rs = $this->where(array('community_id'=>intval($_POST['community']),'account_type'=>1))->find();

			if ($rs == NULL) return true;
			else return false; 
		}else{
			return true;
		}
	}
}
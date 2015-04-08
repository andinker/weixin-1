<?php
class PeopleModel extends Model{

	//自动验证
	protected $_validate=array(
			array('phone','require','手机号必须填写！',1,'',self::MODEL_BOTH),
			array('password','require','用户密码必须填写！',1,'',self::MODEL_BOTH),
			array('password_c','password','两次密码不一致',1,'confirm',self::MODEL_BOTH),
			array('phone','','该手机号已经注册！',1,'unique',self::MODEL_BOTH)
	);

	protected $_auto = array (
			array('name','getName',self::MODEL_INSERT,'callback'), 
			array('password','md5',self::MODEL_BOTH,'function'),
			array('password_c','md5',self::MODEL_BOTH,'function'),
			array('create_time','getdatatime',self::MODEL_INSERT,'callback'),
			array('lastlogin_time','getdatatime',self::MODEL_BOTH,'callback'), 
			array('status','1')
	);
	
	public function getName(){
		return '手机用户'.$_POST['phone'];
	}
	
	Public function getdatatime(){
		return date("Y-m-d H:i:s",time());
	}
	
	/**
	 * 密码登录,返回people记录数组,失败返回FALSE
	 * @param unknown $phone
	 * @param unknown $password
	 * @param unknown $error
	 */
	public function login( $phone, $password, &$error ){
		$rs = $this->where(array('phone'=>$phone,'password'=>md5($password)))->find();
		if (empty($rs)) {
			$error = '手机号或者密码错误';
			return false;
		}else{
			if ($rs['status'] == 0){
				$error = '帐号已被冻结';
				return false;
			}else{
				return $rs;
			}
		}
	}
	
	/**
	 * 找回密码
	 */
	public function retrieve($phone) {
		// 生成新的密码
		$new_pw = mt_rand(10000000,99999999);
		
		// 保存到数据库
		if ($this->where(array('phone',$phone))->setField('password',md5($new_pw))){
			return $new_pw;
		}else{
			return false;
		}
	}
}
<?php
class UserAction extends BaseAction{
	public $userGroup;
	public $token;
	public $user;
	public $userFunctions;
	protected function _initialize(){
        parent::_initialize();
				$userinfo=M('User_group')->where(array('id'=>session('gid')))->find();
		$this->userGroup=$userinfo;
		$users=M('Users')->where(array('id'=>$_SESSION['uid']))->find();
		$this->user=$users;
		//套餐价格为0，使用不限时长！
		if(empty($_SESSION['userGropInfo']['price'])){
			$viptime=0;
		}else{
			$viptime=$users['viptime'];
		}
		$this->assign('thisUser',$users);
		$this->assign('viptime',$viptime);
		if(session('uid')){
			if(!empty($viptime)&&$users['viptime']<time()&&MODULE_NAME != 'Alipay'&&MODULE_NAME != 'Index'){
				session(null);
				session_destroy();
				unset($_SESSION);
				$this->error('您的帐号已经到期，请充值后再使用');
			}
		}
		$wecha=M('Wxuser')->where(array('token'=>session('token'),'uid'=>session('uid')))->find();
		$this->assign('wecha',$wecha);
		$this->token=session('token');
		$this->assign('token',$this->token);
		$token_open=M('token_open')->field('queryname')->where(array('token'=>$this->token))->find();
		$this->userFunctions=explode(',',$token_open['queryname']);
		$this->assign('userinfo',$userinfo);
		if(session('uid')==false){
			if (MODULE_NAME!='Upyun'){
				
				if (GROUP_NAME == 'Muser') $this->redirect('Home/Index/mlogin');
				else $this->redirect('Home/Index/login');
			}
		}
		/****************upyun*********************/
		define('UNYUN_BUCKET',C('up_bucket'));
		define('UNYUN_USERNAME',C('up_username'));
		define('UNYUN_PASSWORD',C('up_password'));
		define('UNYUN_FORM_API_SECRET',C('up_form_api_secret'));
		define('UNYUN_DOMAIN',C('up_domainname'));
		$this->assign('upyun_domain','http://'.UNYUN_DOMAIN);
		$this->assign('upyun_bucket',UNYUN_BUCKET);
		$token=$this->_session('token');
		if (!$token){
			if (isset($_GET['token'])){
				$token=$this->_get('token');
			}else {
				$token='admin';
			}
		}
		$options = array();
		$now=time();
		$options['bucket'] = UNYUN_BUCKET; /// 空间名
		$options['expiration'] = $now+600; /// 授权过期时间
		$options['save-key'] = '/'.$token.'/{year}/{mon}/{day}/'.$now.'_{random}{.suffix}'; /// 文件名生成格式，请参阅 API 文档
		$options['allow-file-type'] = C('up_exts'); /// 控制文件上传的类型，可选
		$options['content-length-range'] = '0,'.intval(C('up_size'))*1000; /// 限制文件大小，可选
		if (intval($_GET['width'])){
			$options['x-gmkerl-type'] = 'fix_width';
			$options['fix_width '] = $_GET['width'];
		}
		$policy = base64_encode(json_encode($options));
		$sign = md5($policy.'&'.UNYUN_FORM_API_SECRET); /// 表单 API 功能的密匙（请访问又拍云管理后台的空间管理页面获取）
		$this->assign('editor_upyun_sign',$sign);
		$this->assign('editor_upyun_policy',$policy);
	}
	public function canUseFunction($funname){
		$token_open=M('token_open')->field('queryname')->where(array('token'=>$this->token))->find();
		if (C('agent_version')&&$this->agentid){
			$function=M('Agent_function')->where(array('funname'=>$funname,'agentid'=>$this->agentid))->find();
		}else {
			$function=M('Function')->where(array('funname'=>$funname))->find();
		}
		if (intval($this->user['gid'])<intval($function['gid'])||strpos($token_open['queryname'],$funname)===false){
			$this->error('您还没有开启该模块的使用权,请到功能模块中添加',U('Function/index',array('token'=>$this->token,'id'=>session('wxid'))));
		}
	}
	
	
	/**
	 * 把类别名加上级别前缀
	 */
	protected function makeLevelClassNames($data){
		return $this->makeLevelClassNames_getChilds($data,0,0);
	}
	
	protected function makeLevelClassNames_getChilds($data,$fid,$level){
	
		$childs = array();
	
		$mark = '';
		for ($i=0;$i<$level;$i++){
			$mark = '　　'.$mark;
		}
	
	
	
		foreach ($data as $item){
			if ( intval($item['fid']) == intval($fid)){
	
				$item['name'] = $mark.$item['name'];
				array_push($childs, $item);
	
				$next_childs = $this->makeLevelClassNames_getChilds($data,$item['id'],$level+1);
	
				foreach ($next_childs as $next_child){
					array_push($childs, $next_child);
				}
	
			}
		}
	
		return $childs;
	}
}
?>
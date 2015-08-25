<?php
class RegisterAction extends BaseAction{
	
	/**
	 * 阅读协议
	 */
	public function index() {
		$this->display();
	}
	
	/**
	 * 注册帐号
	 */
	public function account() {
		
		$this->display();
	}
	
	/**
	 * 填写必要信息
	 */
	public function information() {
		
		C('TOKEN_ON',false);
		
		// 必须先登录才可以访问
		$uid_session = session('uid');
		if (empty($uid_session)) throw new ThinkException("非法访问！");

		if (IS_POST && $_POST['ajax'] == 'yes'){
			
			$state = true;
			$msg = '保存成功！';
			
			// 验证数据
			$enterprise_name = trim($_POST['enterprise_name']);
			$site_name = trim($_POST['site_name']);
			$people_name = trim($_POST['people_name']);
			$tel = trim($_POST['tel']);
			$address = trim($_POST['address']);
			
			if ( empty($enterprise_name) ) {
				$state = false;
				$msg = '请填写企业名称！';
			}elseif ( empty($site_name) ){
				$state = false;
				$msg = '请填写网站名称！';
			}elseif ( empty($people_name) ){
				$state = false;
				$msg = '请填写联系人！';
			}elseif ( empty($tel) ){
				$state = false;
				$msg = '请填写联系电话！';
			}elseif ( empty($address) ){
				$state = false;
				$msg = '请填写联系地址！';
			}else{
				
				// 保存数据，在当前帐号中创建店铺
				// 1、先添加公众号，得到token
				// 2、根据token添加公司信息，门店信息
					
				$data=M('User_group')->field('wechat_card_num')->where(array('id'=>session('gid')))->find();
				$users=M('Users')->field('wechat_card_num')->where(array('id'=>session('uid')))->find();
				if($users['wechat_card_num']>=$data['wechat_card_num']){
					$state = false;
					$msg = '您的VIP等级所能创建的公众号数量已经到达上线，请购买后再创建';
				}else{
					
					$db=D('Wxuser');
					
					// 生成公众号token
					$randLength=6;
					$chars='abcdefghijklmnopqrstuvwxyz';
					$len=strlen($chars);
					$randStr='';
					for ($i=0;$i<$randLength;$i++){
						$randStr.=$chars[rand(0,$len-1)];
					}
					$tokenvalue=$randStr.time();
					
					$data = array(
							'wxname'=>$_POST['site_name'], // 公众号名称
							'wxid'=>$tokenvalue,//公众号原始id
							'weixin'=>$tokenvalue,//微信号
							'appid'=>$tokenvalue,//AppID
							'appsecret'=>$tokenvalue,//AppSecret
							'winxintype'=>1,//微信号类型
							'headerpic'=>'/tpl/static/attachment/icon/canyin/canyin_red/11.png',//头像地址
							'token'=>$tokenvalue,//token
							'province'=>$tokenvalue,//省
							'city'=>$tokenvalue,//市
							'qq'=>time().'@yourdomain.com',//公众号邮箱
							'wxfans'=>0,//粉丝数
					);
					
					$_POST['type'] = '6,购物';
					
					if($db->create($data)===false){
						
						$state = false;
						$msg = $db->getError();
						
					}else{
						
						$id=$db->add();
						
						if(!$id){
							
							$state = false;
							$msg = '保存店铺数据时出错:'.$db->getError().$db->getLastSql().$db->getDbError();
							
						}else{
							
							M('Users')->field('wechat_card_num')->where(array('id'=>session('uid')))->setInc('wechat_card_num');
							$this->addfc($tokenvalue);
							
							// 初始化公司信息(门店信息)
							$company_model=M('Company');
							$thisCompany_where=array(
									'token'=>$tokenvalue,
									'isbranch'=>0
							);
							$thisCompany=$company_model->where($thisCompany_where)->find();
							
							
							$company_data = array(
									'token'=>$tokenvalue,
									'name'=>$_POST['enterprise_name'],
									'shortname'=>$_POST['site_name'],
									'mp'=>$_POST['tel'],
									'tel'=>$_POST['tel'],
									'address'=>$_POST['address'],
									'latitude'=>'0.00',
									'longitude'=>'0.00',
									'intro'=>$_POST['enterprise_name'].'官方网站',
									'catid'=>0,
									'taxis'=>0,
									'isbranch'=>0,
									'logourl'=>'/tpl/static/attachment/icon/canyin/canyin_red/11.png',
									'status'=>1,
									'add_time'=>time(),
									//'cateid'=>'',
									//'areaid'=>'',
									//'qrcode'=>'',
							);
							
							if ($thisCompany){
								
								// 更新已有数据
								$company_model_savers = $company_model->where(array('id'=>$thisCompany['id']))->save($company_data);
								if ($company_model_savers == false){
									$state = false;
									$msg = '更新公司数据时出错：'.$company_model->getError().$company_model->getLastSql().$company_model->getDbError().var_export($thisCompany,true);
								}
								
							}else {
								
								// 新增数据 
								$company_model_addrs = $company_model->add($company_data);
								if($company_model_addrs == false){
									$state = false;
									$msg = '新增公司数据时出错：'.$company_model->getError().$company_model->getLastSql().$company_model->getDbError();
								}
							}
							
						}
					}
				}
			}
			
			exit(json_encode(array(
					'state'=>$state,
					'msg'=>$msg,
			)));
			
		}else{
			$this->display();
		}
	}
	
	/**
	 * 选择社区
	 */
	public function community() {
		
		// 必须先登录才可以访问
		$uid_session = session('uid');
		if (empty($uid_session)) throw new ThinkException("非法访问！");
		
		if ( IS_POST && isset($_POST['ajax']) && $_POST['ajax'] == 'yes' ){
			
			$state = true;
			$msg = '保存成功！';
			
			if ( !isset($_POST['community']) || empty($_POST['community']) ){
				$state = false;
				$msg = '处理失败:还没有选择社区！';
			}else{
				
				// 保存社区
				$db = M("Users");
				$save_rs = $db->where(array("id"=>$uid_session))->save(array(
						'community_id'=>intval($_POST['community'])
				));
				
				if (!$save_rs){
					$state = false;
					$msg = '处理失败:'.$db->getError().$db->getDbError();
				}
				
			}
			
			exit(json_encode(array(
					'state'=>$state,
					'msg'=>$msg,
			)));
			
			
		}else{
			
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
		
	}
	
	/**
	 * 完成注册
	 */
	public function done() {
		$this->display();
	}
	
	/**
	 * 初始化公众号能够使用的功能
	 * Copy From Lib/Action/User/IndexAction.class.php
	 */
	private function addfc($tokenvalue){
		$token_open=M('Token_open');
		$open['uid']=session('uid');
		$open['token']=$tokenvalue;
		$gid=session('gid');
		$fun=M('Function')->field('funname,gid,isserve')->where('`gid` <= '.$gid)->select();
		foreach($fun as $key=>$vo){
			$queryname.=$vo['funname'].',';
		}
		$open['queryname']=rtrim($queryname,',');
		$token_open->data($open)->add();
	}
	
	/**
	 * 社区运营商申请页面
	 */
	public function applyforoperator() {
		// 保存数据库 或者发送邮件 
			if ( IS_POST && isset($_POST['ajax']) && $_POST['ajax'] == 'yes' ){
			
			$state = true;
			$msg = '保存成功！';
			
			// 验证数据
			$company = trim($_POST['company']);
			$principal = trim($_POST['principal']);
			$tel = trim($_POST['tel']);
			$email = trim($_POST['email']);
			$msg = trim($_POST['msg']);
			$community = trim($_POST['community']);
			
			if (empty($company)) {
				$state = false;
				$msg = '处理失败:还没有填写公司名字！';
			}elseif (empty($principal)) {
				$state = false;
				$msg = '处理失败:还没有填写项目负责人！';
			}elseif (empty($tel)) {
				$state = false;
				$msg = '处理失败:还没有填写项目负责人联系电话！';
			}elseif (empty($email)) {
				$state = false;
				$msg = '处理失败:还没有填写电子邮件！';
			}elseif (empty($community)){
				$state = false;
				$msg = '处理失败:还没有选择社区！';
			}else{
				
				// 保存社区
				$db = M("Users");
				$save_rs = $db->where(array("id"=>$uid_session))->save(array(
						'community_id'=>intval($_POST['community'])
				));
				
				if (!$save_rs){
					$state = false;
					$msg = '处理失败:'.$db->getError().$db->getDbError();
				}
				
			}
			
			exit(json_encode(array(
					'state'=>$state,
					'msg'=>$msg,
			)));
			
			
		}else{
			
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
	}
	
}
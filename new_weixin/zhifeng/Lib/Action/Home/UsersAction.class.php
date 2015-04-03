<?php
class UsersAction extends BaseAction{
	public function index(){
		header("Location: /");
	}

	public function checklogin(){
		$db=D('Users');
		$where['username']=$this->_post('username','trim');
		
		// if($db->create()==false)
			// $this->error($db->getError());
		$pwd=$this->_post('password','trim,md5');
		$res=$db->where($where)->find();
		if($res&&($pwd===$res['password'])){
			if($res['status']==0){
				$this->error('请联系在线客户，为你人工审核帐号');exit;
			}
			session('uid',$res['id']);
			session('gid',$res['gid']);
			session('uname',$res['username']);
			$info=M('user_group')->find($res['gid']);
			session('diynum',$res['diynum']);
			session('connectnum',$res['connectnum']);
			session('activitynum',$res['activitynum']);
			session('viptime',$res['viptime']);
			session('gname',$info['name']);
			//此等级信息
			session('userGropInfo',$info);
			//每个月第一次登陆数据清零
			$now=time();
			$month=date('m',$now);
			if($month!=$res['lastloginmonth']&&$res['lastloginmonth']!=0){
				$data['id']=$res['id'];
				$data['imgcount']=0;
				$data['diynum']=0;
				$data['textcount']=0;
				$data['musiccount']=0;
				$data['connectnum']=0;
				$data['activitynum']=0;
				$db->save($data);
				//
				session('diynum',0);
				session('connectnum',0);
				session('activitynum',0);
			}
			//登陆成功，记录本月的值到数据库
			
			//
			$db->where(array('id'=>$res['id']))->save(array('lasttime'=>$now,'lastloginmonth'=>$month,'lastip'=>$_SERVER['REMOTE_ADDR']));//最后登录时间
			$this->success('登录成功',U('User/Index/index'));
		}else{
			$this->error('帐号密码错误',U('Index/login'));
		}
	}
	
	public function checkreg(){
		$db=D('Users');
		if($db->create()){
			/*echo '<pre>';
			print_r($_POST);
			print_r($db->data());
			echo '</pre>';
			exit();*/
			$id=$db->add();
			if($id){				
				if(C('ischeckuser')!='true' || intval($_POST['account_type']) == 1){
					$this->success('注册成功,请联系在线客服审核帐号',U('User/Index/index'));exit;
				}
				$gid=intval(C('reg_groupid'))?intval(C('reg_groupid')):1;
				$regdays=intval(C('reg_validdays'))?intval(C('reg_validdays')):3;
				$viptime=time()+$regdays*24*3600;
				
				$info=M('User_group')->find($gid);
				$db->where(array('id'=>$id))->save(array('gid'=>$gid,'viptime'=>$viptime));
				session('uid',$id);
				session('gid',$gid);
				session('uname',$_POST['username']);
				session('diynum',0);
				session('connectnum',0);
				session('activitynum',0);
				session('gname',$info['name']);
				session('viptime',$viptime);
				//此等级信息
				session('userGropInfo',$info);
			
			
			
				$body="感谢您注册<a href=".C('site_url').">".C('site_name')."</a>:</br>会员名：".$_POST['username']."<br/>密码：".substr_replace($_POST['password'],'****',3)." 出于安全考虑，仅显示前3位密码！<br/>若在使用中发现问题，请前往<a href=".C('site_url').">".C('site_url')."</a>";
			    $this->regSendEmail(C('email_server'),C('email_port'),C('email_user'),C('email_pwd'),"[".C('site_name')."]账号中心",'欢迎注册'.C('site_name'),$body,$_POST['email']);
				$this->success('注册成功',U('User/Index/index'));
			}else{
				$this->error('注册失败',U('Index/reg'));
			}
		}else{
			$this->error($db->getError(),U('Index/reg'));
		}
	}
	
	public function regSendEmail($host,$port,$emailuser,$emailpassword,$FromName='管理员',$Subject,$body,$to_email){
			$mail = new PHPMailer();
			$mail->IsSMTP();
			$mail->Host = $host;
			$mail->SMTPDebug = '0';
			$mail->SMTPAuth = true;
			$mail->CharSet  = "UTF-8"; //字符集 
			$mail->Encoding = "base64"; //编码方式 
			$mail->Port = $port;
			$mail->Username = $emailuser;
			$mail->Password = $emailpassword;
			$mail->From = $emailuser;      // 发件人邮箱    
			$mail->FromName =  "=?utf-8?B?" . base64_encode($FromName) . "?=";  // 发件人    
			$mail->Subject = "=?UTF-8?B?" . base64_encode($Subject) . "?=";
			$mail->IsHTML(true);  // send as HTML    
			$mail->MsgHTML($body);
			$mail->AddAddress($to_email); 
			return($mail->Send());
	}
	public function checkpwd(){
		if(IS_POST){
			//$_POST=array('username'=>'123456','email'=>'910757807@qq.com');
			//dump($_POST);
			
			$where['username']=$this->_post('username','trim');
			$where['email']=$this->_post('email','trim');
			$db=D('Users');
			$list=$db->where($where)->find();
			//dump($list);exit;
			if($list==false) $this->error('邮箱和帐号不正确',U('Index/resetpwd'));
			
			$smtpserver = C('email_server'); 
			$port = C('email_port');
			$smtpuser = C('email_user');
			$smtppwd = C('email_pwd');
			$to = $list['email']; 
			$subject = C('pwd_email_title');
			$code = 'http://'.$_SERVER['HTTP_HOST'].U('Index/resetpwd',array('uid'=>$list['id'],'code'=>md5($list['id'].$list['password'].$list['email']),'resettime'=>time()));
			$fetchcontent = C('pwd_email_content');
			$fetchcontent = str_replace('{username}',$where['username'],$fetchcontent);
			$fetchcontent = str_replace('{time}',date('Y-m-d H:i:s',$_SERVER['REQUEST_TIME']),$fetchcontent);
			$fetchcontent = str_replace('{code}',$code,$fetchcontent);
			$body=$fetchcontent;
			$this->regSendEmail($smtpserver,$port,$smtpuser,$smtppwd ,'',$subject,$body,$to);
			$this->success('请访问你的邮箱进行验证,验证邮箱后可修改密码,验证链接3天有效!<br/>',U('Index/index'));
			
		}else{
			$this->error('非法访问，请重试！',U('Index/index'));
		}
	
		
	}
	
	public function resetpwd(){
		if(IS_POST){
			$password=$this->_post('password','md5');
			$repassword=$this->_post('repassword','md5');
			if($password!=$repassword){
				$this->error('两次输入密码不一致哦！');
			}
			$where['id']=$this->_post('uid','intval');
			$where['password']=$password;
			if(M('Users')->save($where)){
				$this->success('修改成功，请登录！',U('Index/login'));
			}else{
				$this->error('密码修改失败！',U('Index/index'));
			}
		}else{
			$this->error('非法操作！',U('Index/index'));			
		}
	}
	
}
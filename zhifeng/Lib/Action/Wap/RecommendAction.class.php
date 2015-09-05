<?php
class RecommendAction extends BaseAction{
	public $token;
	public $wecha_id;

	public function _initialize(){
		parent::_initialize();
		$agent = $_SERVER['HTTP_USER_AGENT']; 
		if(!strpos($agent,"icroMessenger")) {
		//	echo '此功能只能在微信浏览器中使用';exit;
		}
		
		$this->token = $this->_get('token');
		$this->wecha_id	= $this->_get('wecha_id');
		if (!$this->wecha_id){
			$this->wecha_id='null';
		}
		$this->acid=$this->_get('acid');
		$this->recommend_model=M('Recommend');
		$this->assign('token',$this->token);
		$this->assign('wecha_id',$this->wecha_id);
		$this->assign('acid',$this->acid);
		$this->userdb=M('Userinfo');		
		$this->recoUserdb=M('Recommend_user');
		//
		if($this->acid){			
			$footuser=$this->recoUserdb->where(array('wecha_id'=>$this->wecha_id,'token'=>$this->token,'acid'=>$this->acid))->find();
			$this->assign('footuser',$footuser);
		}
	}
	
	public function index(){
	$acid=$this->acid;
	if(!$acid){
		$this->redirect('Recommend/lists', array('token' => $this->token,'wecha_id'=>$this->wecha_id));
	}
	$token=$this->token;
	$w['token']=$token;
	$w['wecha_id']=$this->wecha_id;
	$w['acid']=$acid;
	if($this->_get('tjsn')){
		$wh['tjsn']=$this->_get('tjsn');
		$wh['acid']=$acid;
		
		$fuser=$this->recoUserdb->where($wh)->find();
		$fuser['user']=$this->userdb->field('truename,tel')->where(array('id'=>$fuser['uid']))->find();
		$this->assign('fuser',$fuser);
	}
	$tjnum['tjnum']=$this->recoUserdb->where(array('token'=>$token,'acid'=>$acid))->count();
	$db=$this->recommend_model;
	$where['id']=$acid;
	$recomtjnum=$db->where($where)->save($tjnum);
	$recommend=$db->where($where)->find();
	$this->assign('recommend',$recommend);
	$user=$this->recoUserdb->where($w)->find();
	//$user['user']=$this->userdb->field('truename,tel')->where(array('id'=>$user['uid']))->find();
	$this->assign('user',$user);
	$db->where($where)->setInc('seenum');
	$this->display();
	}
	//推荐活动列表
	public function lists(){
		if($this->wecha_id){
			$user=$this->userdb->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
			$this->assign('user',$user);
		}else{
			exit('请使用关键字回复微信进入;');
		}
		$db=$this->recommend_model;
		$lists=$db->where(array('token'=>$this->token))->select();
		$this->assign('lists',$lists);
		$this->display();
	}
	//推荐信息提交
	public function recommendRight(){
		$userdb=M('Userinfo');		
		$recoUserdb=M('Recommend_user');
		$ruledb=M('Recommend_rule');
		$logsdb=M('score_logs');
		$rule=$ruledb->where(array('acid'=>$this->acid,'ruletype'=>1,'status'=>1))->find();
		$rule2=$ruledb->where(array('acid'=>$this->acid,'ruletype'=>2,'status'=>1))->find();
		$token=$this->token;
		$acid=$this->acid;
		//~~623wzh
		if(!$acid){
			$this->redirect('Recommend/lists', array('token' => $this->token,'wecha_id'=>$this->wecha_id));
		}
//		
		$wecha_id=$this->wecha_id;
		$where['wecha_id']=$wecha_id;
		$where['token']=$token;
		$map['_complex'] = $where;
		$map['acid']=$acid;
		//信息
		$recouser=$recoUserdb->where($map)->find();
		$user=$userdb->field('id,truename,tel,wechaname,recommend_score')->where($where)->find();
		if(IS_POST){
			$url=U('Recommend/recommendRight',array('token'=>$token,'wecha_id'=>$wecha_id,'acid'=>$acid));
			if($_POST['truename']==''||intval($_POST['tel'])==''){
				$data=array('error'=>0,'msg'=>'姓名手机号不能为空！');
				echo json_encode($data);exit;}
			//yzsjh
			$result=$this->verify_phone($_POST['tel'],$token,$wecha_id);
			if($result){
				$data=array('error'=>0,'msg'=>'手机号码已存在！');
			}else{
				if($_POST['tjsn']){
					if($_POST['tjsn']==$_POST['ftjsn']){
						$data=array('error'=>0,'msg'=>'亲，推荐自己不算数的哦！');
						echo json_encode($data);exit;}
				}else{
					$_POST['tjsn']=$this->tjmt_rand(8);
					while($this->verify_tjsn($acid.$_POST['tjsn'],$token,$acid)){$_POST['tjsn']=$this->tjmt_rand(8);}
					$_POST['tjsn']=$acid.$_POST['tjsn'];
				}				
				$recodata['acid']=$acid;				
				$recodata['tjsn']=$_POST['tjsn'];
				if(trim($_POST['ftjsn'])){
					$recodata['ftjsn']=trim($_POST['ftjsn']);
					$recodata['fuid']=$this->getftjuserid(trim($_POST['ftjsn']),$token,$acid);
					if(!$recodata['fuid']){
						$data=array('error'=>0,'msg'=>'不正确的推荐码,请输入正确的推荐码');
						echo json_encode($data);exit;
					}
				}
			
				if($recouser['id']){
					if($user){
					//更新会员信息
						$savetj=$userdb->where(array('id'=>$user['id']))->save($_POST);
					}else{
						$_POST['token']=$token;					
						$_POST['wecha_id']=$wecha_id;	
						//添加会员信息
						$addtj=$userdb->add($_POST);					
					}
					$savetjxx=$recoUserdb->where(array('id'=>$recouser['id']))->save($recodata);				
					if($savetjxx){
						//jl
						if(!trim($_POST['ftjsn'])==''){
							$logfuid=$userdb->field('id,truename,total_score,recommend_score')->where(array('id'=>$recodata['fuid']))->find();
							$logsd['time']=time();
							$logsd['uid']=$logfuid['id'];						
							$logsd['scoretype']=2;
							$logsd['typename']='推荐成功';
							$str=date('Y年m月d日 H:i',$logsd['time']).' 会员:"'.$logfuid['truename'].'" 成功推荐'.$_POST['truename'].'获赠积分'.$rule['score'];
							$logsd['info']=$str;
							$logsd['acid']=$acid;
							$logsdb->add($logsd);
							if($rule){
								$score['total_score']=intval($logfuid['total_score'])+intval($rule['score']);
								$score['recommend_score']=intval($logfuid['recommend_score'])+intval($rule['score']);
								$userdb->where(array('id'=>$logfuid['id']))->save($score);
							}
							if($rule2){
								$userdb->where(array('id'=>$recouser['uid']))->setInc('total_score',$rule2['score']);
								$userdb->where(array('id'=>$recouser['uid']))->setInc('recommend_score',$rule2['score']);
								$jslogsd['time']=$logsd['time'];
								$jslogsd['uid']=$recouser['uid'];
								$jslogsd['scoretype']=2;
								$jslogsd['typename']='成功接受推荐';
								$str2=date('Y年m月d日 H:i',$logsd['time']).' 会员:"'.$_POST['truename'].'" 成功接受'.$logfuid['truename'].'的推荐获赠积分'.$rule2['score'];
								$jslogsd['info']=$str2; 
								$jslogsd['acid']=$acid;
								$logsdb->add($jslogsd);
							}
							$recoUserdb->where(array('tjsn'=>$_POST['ftjsn'],'acid'=>$acid))->setInc('tjnum');
						}
						$data=array('error'=>1,'msg'=>'推荐信息提交成功');
						$url.='&recoadd=1';
					}else{
						$data=array('error'=>0,'msg'=>'推荐信息提交失败');
					}
				}
				else{
					if($user){
					//更新会员信息
						$savetj=$userdb->where(array('id'=>$user['id']))->save($_POST);
						$recodata['uid']=$user['id'];
					}else{
						$_POST['token']=$token;					
						$_POST['wecha_id']=$wecha_id;	
						//添加会员信息
						$addtj=$userdb->add($_POST);
						$recodata['uid']=$addtj;
					}
					
					$recodata['token']=$token;	
					$recodata['wecha_id']=$wecha_id;	
					//添加推荐码
					$addtjxx=$recoUserdb->add($recodata);
					if($addtjxx){
						//jl
						if(!trim($_POST['ftjsn'])==''){
							$logfuid=$userdb->field('id,truename,total_score,recommend_score')->where(array('id'=>$recodata['fuid']))->find();
							$logsd['time']=time();
							$logsd['uid']=$logfuid['id'];
							$logsd['scoretype']=2;
							$logsd['typename']='推荐成功';
							$str=date('Y年m月d日 H:i',$logsd['time']).' 会员:"'.$logfuid['truename'].'" 成功推荐'.$_POST['truename'].'获赠积分'.$rule['score'];
							$logsd['info']=$str; 
							$logsd['acid']=$acid;
							$logsdb->add($logsd);
							if($rule){
								$score['total_score']=intval($logfuid['total_score'])+intval($rule['score']);
								$score['recommend_score']=intval($logfuid['recommend_score'])+intval($rule['score']);
								$userdb->where(array('id'=>$logfuid['id']))->save($score);
							}
							if($rule2){
								$userdb->where(array('id'=>$recodata['uid']))->setInc('total_score',$rule2['score']);
								$userdb->where(array('id'=>$recodata['uid']))->setInc('recommend_score',$rule2['score']);
								$jslogsd['time']=$logsd['time'];
								$jslogsd['uid']=$recodata['uid'];
								$jslogsd['scoretype']=2;
								$jslogsd['typename']='成功接受推荐';
								$str2=date('Y年m月d日 H:i',$logsd['time']).' 会员:"'.$_POST['truename'].'" 成功接受'.$logfuid['truename'].'的推荐获赠积分'.$rule2['score'];
								$jslogsd['info']=$str2; 
								$jslogsd['acid']=$acid;
								$logsdb->add($jslogsd);
							}
							$recoUserdb->where(array('tjsn'=>$_POST['ftjsn'],'acid'=>$acid))->setInc('tjnum');
						}
						$data=array('error'=>1,'msg'=>'推荐信息提交成功');
						$url.='&recoadd=1';
					}else{
						$data=array('error'=>0,'msg'=>'推荐信息提交失败');
					}
				}
			}
			$data['url']=$url;
			echo json_encode($data);
		}
		else{
			if($recouser){
				$fuser=$userdb->field('id,truename,tel,wechaname')->where(array('id'=>$recouser['fuid']))->find();
				$this->assign('recouser',$recouser);
				$this->assign('fuser',$fuser);
			}
			if($this->_get('recoadd')==1){
				$this->assign('recoadd',1);
			}
			
			$this->assign('user',$user);
			//dump($user);exit;
			//dump($fuser);exit;
			$this->display();
		}
	}
	
	//注册推荐
	public function recommendMyinfo(){
		$userdb=M('Userinfo');
		$token=$this->token;
		$where['wecha_id']=$this->wecha_id;
		$where['token']=$token;
		//信息
		$user=$userdb->where($where)->find();
		if(IS_POST){
			if($_POST['truename']==''||$_POST['tel']==''){
				$data=array('error'=>0,'msg'=>'姓名手机号不能为空！');
				echo json_encode($data);exit;
			}
			$result=$this->verify_phone($_POST['tel']);
			if($result){
				$data=array('error'=>0,'msg'=>'手机号码已存在！');
			}else{
				$_POST['tjsn']=$this->tjmt_rand(8);
				while($this->verify_tjsn($_POST['tjsn'],$token)){
					$_POST['tjsn']=$this->tjmt_rand(8);
				}
				if($user['id']){
					$savetj=$userdb->where(array('id'=>$user['id']))->save($_POST);
					if($savetj){
						$data=array('error'=>1,'msg'=>'推荐信息提交成功');
					}else{
						$data=array('error'=>0,'msg'=>'推荐信息提交失败');
					}
				}else{
					$_POST['token']=$token;					
					$_POST['wecha_id']=$this->wecha_id;	
					$addtj=$userdb->add($_POST);
					if($addtj){
						$data=array('error'=>1,'msg'=>'推荐信息提交成功');
					}else{
						$data=array('error'=>0,'msg'=>'推荐信息提交失败');
					}
				}
			}
			echo json_encode($data);
		}
		else{
			if($user){
				$fuser=$userdb->where(array('id'=>$user['fuid']))->find();
				$this->assign('fuser',$fuser);
				$this->assign('user',$user);
			}
			$this->display();
		}
	}
	//推荐排行
	public function tjnumsort(){
		//~~623zh start~~
		$acid=$this->acid;
		if(!$acid){
			$this->redirect('Recommend/lists', array('token' => $this->token,'wecha_id'=>$this->wecha_id));
		}
		//~~623zh~~
		$where['token']=$this->token;
		$where['acid']=$acid;
		$where['_string']="tjsn <> ' '";
		$userlist=M('Recommend_user')->where($where)->order('tjnum DESC')->limit(0,20)->select();
		foreach($userlist as $key=>$val){
			$user=M('Userinfo')->field('truename,recommend_score,total_score')->where(array('id'=>$val['uid']))->find();
			$userlist[$key]['truename']=$user['truename'];
			$userlist[$key]['recommend_score']=$user['recommend_score'];
			$userlist[$key]['total_score']=$user['total_score'];
		}
		//dump($userlist);
		$this->assign('userlist',$userlist);
		$this->display();
	}
	//我的推荐
	public function myRecommendUser(){
		//~~623zh start~~
		$acid=$this->acid;
		if(!$acid){
			$this->redirect('Recommend/lists', array('token' => $this->token,'wecha_id'=>$this->wecha_id));
		}
		//~~623zh~~
		//$where['wecha_id']=$this->wecha_id;
		$where['token']=$this->token;
		$where['ftjsn']=$this->_get('tjsn');		
		$where['acid']=$acid;
		$my=M('Recommend_user')->where($where)->select();
		foreach($my as $k=>$v){
			$my[$k]['user']=M('Userinfo')->field('truename,recommend_score')->where(array('id'=>$v['uid']))->find();	
		}
		$this->assign('mytjuser',$my);
		$this->display();
	}
	
	//验证tjsn
	function verify_tjsn($tjsn,$token,$acid){
		$result=M('Recommend_user')->where(array('token'=>$token,'acid'=>$acid,'tjsn'=>$tjsn))->count();
		return $result?true:false;
	}
	//验证手机号码
	function verify_phone($tel,$token,$wecha_id){		
		$where2=array('token'=>$token,'tel'=>$tel);
		$where['_complex'] = $where2;
		$where['_string']="wecha_id <> '".$wecha_id."'";
		$result=M('Userinfo')->where($where)->count();
		//return M()->getLastSql();
		return  $result?true:false;
	} 
	//8位随机数
	function tjmt_rand($length=8){
		$chars = "0123456789";  
		$str ="";  
		for ( $i = 0; $i < $length; $i++ ){  
			$str.= substr($chars, mt_rand(0, strlen($chars)-1), 1);  
		}  
		return $str;  
	}
	//get推荐人id
	function getftjuserid($tjsn,$token,$acid=1){
		$reuser=M('Recommend_user')->field('uid')->where(array('tjsn'=>$tjsn,'token'=>$token,'acid'=>$acid))->find();
		if($reuser){
			$uid=M('Userinfo')->field('id')->where(array('id'=>$reuser['uid']))->find();
			return $uid?$uid['id']:false;
		}else{return false;}
	}
}
?>
<?php
class WapAction extends BaseAction{
	public $token;
	public $wecha_id;
	public $fans;
	public $homeInfo;
	public $bottomeMenus;
	public $wxuser;
	public $user;
	public $group;
	public $company;
	public $shareScript;
	public function _initialize(){
		parent::_initialize();
		$this->token=$this->_get('token','trim');
		$this->assign('token',$this->token);
		$this->wxuser=S('wxuser_'.$this->token);
		if(!$this->wxuser||1){
			$this->wxuser=D('Wxuser')->where(array('token'=>$this->token))->find();
			//S('wxuser_'.$this->token,$this->wxuser);
		}
		$this->siteUrl=C('site_url');
		$this->assign('wxuser',$this->wxuser);
		if(!$_GET['wecha_id']&&$this->wxuser['winxintype']==3&&!isset($_GET['code'])&&$this->wxuser['oauth']){
			$customeUrl=$this->siteUrl.$_SERVER['REQUEST_URI'];
			$scope='snsapi_userinfo';
			if(isset($_GET['diymenu'])){$scope='snsapi_base';}
			$oauthUrl='https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->wxuser['appid'].'&redirect_uri='.urlencode($customeUrl).'&response_type=code&scope='.$scope.'&state=oauth#wechat_redirect';
			header('Location:'.$oauthUrl);
		}
		if(isset($_GET['code'])&&isset($_GET['state'])&&isset($_GET['state'])=='oauth'){
			$rt=$this->curlGet('https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$this->wxuser['appid'].'&secret='.$this->wxuser['appsecret'].'&code='.$_GET['code'].'&grant_type=authorization_code');
			$jsonrt=json_decode($rt,1);
			$openid=$jsonrt['openid'];
			$access_token=$jsonrt['access_token'];
			$_GET['wecha_id']=$openid;
			$this->wecha_id=$openid;
		}else{
			$this->wecha_id=$this->_get('wecha_id');
		}
		$this->assign('wecha_id',$this->wecha_id);
		$fansInfo=S('fans_'.$this->token.'_'.$this->wecha_id);
		if(!$fansInfo){
			$fansInfo=M('Userinfo')->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
			$advanceInfo=M('Wechat_group_list')->where(array('token'=>$this->token,'openid'=>$this->wecha_id))->find();
			if($advanceInfo){
				$fansInfo['nickname']=$advanceInfo['nickname'];
				if(!$fansInfo['wechaname']){
					$fansInfo['wechaname']=$advanceInfo['nickname'];
				}
				$fansInfo['sex']=$advanceInfo['sex'];
				$fansInfo['province']=$advanceInfo['province'];
				$fansInfo['city']=$advanceInfo['city'];
			}
			//S('fans_'.$this->token.'_'.$this->wecha_id,$fansInfo);
		}
		$this->fans=$fansInfo;
		$this->assign('fans',$fansInfo);
		$kefu=M('kefu')->where(array('token'=>$this->token))->find();
		$this->assign('kefu',$kefu);
		//微站配置
		$homeInfo=S('homeinfo_'.$this->token);
		if(!$homeInfo){
			$homeInfo=M('home')->where(array('token'=>$this->token))->find();
			//S('homeinfo_'.$this->token,$homeInfo);
		}
		//公司信息
		$this->company=S('company_'.$this->token);
		if(!$this->company){
			$company_db=M('company');
			$this->company=$company_db->where(array('token'=>$this->token,'isbranch'=>0))->find();
			//S('company_'.$this->token,$this->company);
		}
		//总店信息数据替代电话等数据
		if(empty($homeInfo['dianhua'])){$homeInfo['dianhua']=$this->company['mp'];}
		if(empty($homeInfo['animation'])){$homeInfo['animation']=0;}
		
		$this->homeInfo=$homeInfo;
		$this->assign('homeInfo',$this->homeInfo);
		$catemenu=S('bottomMenus_'.$this->token);
		if(!$catemenu){
			$catemenu_db=M('catemenu');
			$catemenu=$catemenu_db->where(array('token'=>$this->token,'status'=>1))->order('orderss desc')->select();
			//S('bottomMenus_'.$this->token,$catemenu);
		}
		$menures=array();
		if($catemenu){
			$res=array();
			$rescount=0;
			foreach($catemenu as $val){
				$val['url']=$this->getLink($val['url']);
				$res[$val['id']]=$val;
				if($val['fid']==0){
					$val['vo']=array();
					$menures[$val['id']]=$val;
					$menures[$val['id']]['k']=$rescount;
					$rescount++;
				}
			}
			foreach($catemenu as $val){
				$val['url']=$this->getLink($val['url']);
				if($val['fid']>0){
					array_push($menures[$val['fid']]['vo'],$val);
				}
			}
		}
		$catemenu=$menures;
		$this->bottomeMenus=$catemenu;
		$this->assign('catemenu',$this->bottomeMenus);
		//判断菜单风格
		$footmenuid=$homeInfo['footmenuid'];
		if(empty($footmenuid)){
			$footmenuid=0;
		}
		$cateMenuFileName='tpl/Wap/default/Index/menustyle'.$footmenuid.'.html';
		$this->assign('cateMenuFileName',$cateMenuFileName);
		$this->assign('radiogroup',$footmenuid);
		$this->user=S('user_'.$this->wxuser['uid']);
		if(!$this->user){
			$this->user=D('Users')->find(intval($this->wxuser['uid']));
			//S('user_'.$this->wxuser['uid'],$this->user);
		}
		$this->assign('user',$this->user);
		$this->group=S('group_'.$this->user['gid']);
		if(!$this->group){
			$this->group=M('User_group')->where(array('id'=>intval($this->user['gid'])))->find();
			//S('group_'.$this->user['gid'],$this->group);
		}
		$this->assign('group',$this->group);
		
		$this->assign('company',$this->company);
		$this->iscopyright=$this->group['iscopyright'];
		$this->assign('iscopyright',$this->iscopyright);//是否允许自定义版权
		$this->assign('siteCopyright',C('copyright'));//站点版权信息
		$this->assign('copyright',$this->copyright);
		
		$this->shareScript="
	<script>
		window.shareData.sendFriendLink=window.shareData.sendFriendLink.replace('".C('site_url')."','".$this->siteUrl."');
		document.addEventListener('WeixinJSBridgeReady',function onBridgeReady(){
			WeixinJSBridge.on('menu:share:appmessage',function(argv){
				shareHandle('friend');
				WeixinJSBridge.invoke('sendAppMessage',{
					\"img_url\":window.shareData.imgUrl,
					\"img_width\":\"640\",
					\"img_height\":\"640\",
					\"link\":window.shareData.sendFriendLink,
					\"desc\":window.shareData.tContent,
					\"title\":window.shareData.tTitle
				},function(res){
					_report('send_msg',res.err_msg);
				})
			});

			WeixinJSBridge.on('menu:share:timeline',function(argv){
				shareHandle('frineds');
				WeixinJSBridge.invoke('shareTimeline',{
					\"img_url\":window.shareData.imgUrl,
					\"img_width\":\"640\",
					\"img_height\":\"640\",
					\"link\":window.shareData.sendFriendLink,
					\"desc\":window.shareData.tContent,
					\"title\":window.shareData.tTitle
				},function(res){
					_report('timeline',res.err_msg);
				});
			});

			WeixinJSBridge.on('menu:share:weibo',function(argv){
				shareHandle('weibo');
				WeixinJSBridge.invoke('shareWeibo',{
					\"content\":window.shareData.tContent,
					\"url\":window.shareData.sendFriendLink,
				},function(res){
					_report('weibo',res.err_msg);
				});
			});
		},false)

		function shareHandle(to){
			var submitData = {
				module:window.shareData.moduleName,
				moduleid:window.shareData.moduleID,
				token:'".$this->token."',
				wecha_id:'".$this->wecha_id."',
				url:window.shareData.sendFriendLink,
				to:to
			};
			$.post('".U('Share/shareData',array('token'=>$this->token,'wecha_id'=>$this->wecha_id))."',submitData,function(data){},'json')
		}
	</script>";
		$this->assign('shareScript',$this->shareScript);
	}
	//link 选择
	public function getLink($url){
		$url=$url?$url:'javascript:void(0)';
		$urlArr=explode(' ',$url);
		$urlInfoCount=count($urlArr);
		if($urlInfoCount>1){
			$itemid=intval($urlArr[1]);
		}
		if($this->strExists($url,'刮刮卡')){
			$link='{siteUrl}/index.php?g=Wap&m=Guajiang&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&id='.$itemid;}
		}elseif($this->strExists($url,'大转盘')){
			$link='{siteUrl}/index.php?g=Wap&m=Lottery&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&id='.$itemid;}
		}elseif($this->strExists($url,'砸金蛋')){
			$link='{siteUrl}/index.php?g=Wap&m=Zadan&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&id='.$itemid;}
		}elseif($this->strExists($url,'优惠券')){
			$link='{siteUrl}/index.php?g=Wap&m=Coupon&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&id='.$itemid;}
		}elseif($this->strExists($url,'喜帖')){
			$link='{siteUrl}/index.php?g=Wap&m=Wedding&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&id='.$itemid;}
		}elseif($this->strExists($url,'商家订单')){
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Host&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&hid='.$itemid;
			}else {
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'万能表单')){
			if($itemid){
				$link=$link='{siteUrl}/index.php?g=Wap&m=Selfform&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'相册')){
			$link='{siteUrl}/index.php?g=Wap&m=Photo&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&id='.$itemid;}
		}elseif($this->strExists($url,'全景')){
			$link='{siteUrl}/index.php?g=Wap&m=Panorama&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&id='.$itemid;}
		}elseif($this->strExists($url,'调研')){
			$link='{siteUrl}/index.php?g=Wap&m=Diaoyan&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Diaoyan&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'会员卡')){
			$link='{siteUrl}/index.php?g=Wap&m=Card&a=vip&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}elseif($this->strExists($url,'商城')){
			$link='{siteUrl}/index.php?g=Wap&m=Product&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}elseif($this->strExists($url,'订餐')){
			$link='{siteUrl}/index.php?g=Wap&m=Dining&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}elseif($this->strExists($url,'团购')){
			$link='{siteUrl}/index.php?g=Wap&m=Groupon&a=grouponIndex&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}elseif($this->strExists($url,'首页')){
			$link='/index.php?g=Wap&m=Index&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}elseif($this->strExists($url,'网站分类')){
			$link='/index.php?g=Wap&m=Index&a=lists&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&classid='.$itemid;}
		}elseif($this->strExists($url,'图文回复')){
			if($itemid){
				$link='/index.php?g=Wap&m=Index&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'LBS信息')){
			$link='/index.php?g=Wap&m=Company&a=map&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){$link.='&companyid='.$itemid;}
		}elseif($this->strExists($url,'DIY宣传页')){
			$link='/index.php/show/'.$this->token;
		}elseif($this->strExists($url,'婚庆喜帖')){
			if($itemid){$link='/index.php?g=Wap&m=Wedding&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;}
		}elseif($this->strExists($url,'投票')){
			if($itemid){$link='/index.php?g=Wap&m=Vote&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;}
		}else{
			$link=str_replace(array('{wechat_id}','{siteUrl}','&amp;'),array($this->wecha_id,C('site_url'),'&'),$url);
			if(!!(strpos($url,'tel')===false)&&$url!='javascript:void(0)'&&!strpos($url,'wecha_id=')){
				if(strpos($url,'?')){
					$link=$link.'&wecha_id='.$this->wecha_id;
				}else{
					$link=$link.'?wecha_id='.$this->wecha_id;
				}
			}
		}
		return $link;
	}
	function strExists($haystack,$needle){
		return !(strpos($haystack,$needle) === FALSE);
	}
	function curlGet($url){
		$ch=curl_init();
		$header="Accept-Charset:utf-8";
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_CUSTOMREQUEST,"GET");
		curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
		curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		curl_setopt($curl,CURLOPT_HTTPHEADER,$header);
		curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0(compatible;MSIE5.01;WindowsNT5.0)');
		curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);
		curl_setopt($ch,CURLOPT_AUTOREFERER,1);
		curl_setopt($ch,CURLOPT_POSTFIELDS,$data);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
		$temp=curl_exec($ch);
		return $temp;
	}
}
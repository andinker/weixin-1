<?php
class IndexAction extends WapAction{
	private $tpl;	//微信公共帐号信息
	private $info;	//分类信息
	private $info2;	//2级分类信息	
	public $wecha_id;
	public $copyright;
	public $company;
	public $token;
	public $weixinUser;
	public $homeInfo;
	public function _initialize(){
		parent::_initialize();
		$where['token']=$this->token;
		$tpl=$this->wxuser;
		$this->weixinUser=$tpl;
		$kefu=$this->kefu;
		$this->assign('kefu',$kefu);
		
		if(isset($_GET['wecha_id'])&&$_GET['wecha_id']){
			$_SESSION['wecha_id']=$_GET['wecha_id'];
			$this->wecha_id=$this->_get('wecha_id');
		}
		if(isset($_SESSION['wecha_id'])){
			$this->wecha_id=$_SESSION['wecha_id'];
		}
		//$info=M('Classify')->where(array('token'=>$this->_get('token'),'status'=>1,'fid'=>0))->order('sorts desc')->select();
		$allClasses=M('Classify')->where(array('token'=>$this->_get('token'),'status'=>1))->order('sorts desc')->select();
		$allClasses=$this->convertLinks($allClasses);//加外链等信息
		$info=array();
		if($allClasses){
			$classByID=array();
			$firstGradeCatCount=0;
			foreach($allClasses as $c){
				$classByID[$c['id']]=$c;
				if($c['fid']==0){
					$c['sub']=array();
					$info[$c['id']]=$c;
					$firstGradeCatCount++;
				}
			}
		
			foreach($allClasses as $c){
				if($c['fid']>0&&$info[$c['fid']]){
					array_push($info[$c['fid']]['sub'],$c);
				}
			}
			
			//
			if($info){
			    foreach($info as $c){
				$info[$c['id']]['key']=$firstGradeCatCount--;
				}
			}
		}
		$homeInfo=$this->homeInfo;
		$homeInfo['info'] = str_replace(array("\r\n","\"","&quot;"),array(' ','',''),$homeInfo['info']);
		$this->homeInfo['info'] = $homeInfo['info'];
		$this->info=$info;
		$tpl['color_id']=intval($tpl['color_id']);
		$this->tpl=$tpl;
		
		
		////~~~即將替代~~ plugmenus~~old~~ 
		$plugMenus=$this->_getPlugMenu();
		$this->assign('plugmenus',$catemenu);
		$this->assign('showPlugMenu',count($catemenu));
		
		$this->assign('token',$this->token);
	}
	
	
	public function classify(){
		$this->assign('info',$this->info);
		$this->display($this->tpl['tpltypename']);
	}
	public function index_classify(){
		
		$info = array();
		
		foreach ($this->info as $item){
			if ($item['navpage_status'] == 1){
				
				$subitems = $item['sub'];
				$item['sub'] = array();
				
				foreach ($subitems as $subitem){
					if ($subitem['navpage_status'] == 1){
						array_push($item['sub'], $subitem);
					}
				}
				 
				array_push($info, $item);
			}
		}
		
		$this->assign('info',$info);
		$this->display();
		
	}
	public function index(){
		//是否是高级模板
		if($this->homeInfo['advancetpl']){
			echo '<script>window.location.href="'.C('site_url').'/cms/index.php?token='.$this->token.'&wecha_id='.$this->wecha_id.'";</script>';
			exit();
		}
		//
		$where['token']=$this->token;
		//bywzh~14.9.3 轮播背景图，轮播幻灯片
		$allflash=M('Flash')->where($where)->select();
		$allflash=$this->convertLinks($allflash);
		$flash=array();
		$flashbg=array();
		foreach($allflash as $af){
			if($af['url']==''){
				$af['url']='javascript:void(0)';
			}
			if($af['tip']==1){
				array_push($flash,$af);
			}elseif($af['tip']==2) {
				array_push($flashbg,$af);
			}
		}
		$this->assign('flashbg',$flashbg);
		//wzh9.3照顾老版本，背景图升级为轮播背景图
		if(!$flashbg&&$this->homeInfo['homeurl']){
			$flash_db=M('Flash');
			$arr=array();
			$arr['token']=$this->token;
			$arr['img']=$this->homeInfo['homeurl'];
			$arr['url']='';
			$arr['info']='';
			$arr['tip']=2;
			if($arr['img']){
			$flash_db->add($arr);
			}
		}
		//add轮播图结束
		
		$info = $this->info;
		//获取模板信息
		$tpldata=$this->tpl;
		//兼容老版本对老版本tpid进行处理
		$wxoldtpl=!(strpos($tpldata['tpltypeid'], 'y') === FALSE);
		if($wxoldtpl){$tpldata['tpltypeid']=2;}		
		$tplinfo=M('tmpls')->where(array('tplid'=>$tpldata['tpltypeid'],'type'=>1))->find();
		$tpldata['tpltypename'] = $tplinfo['views']?$tplinfo['views']:$tpldata['tpltypeid'].'_index';
		$this->tpl=$tpldata;
		foreach($info as $k=>$v){
			if($info[$k]['url'] == ''){
				$info[$k]['url'] = U('Index/lists',array('classid'=>$v['id'],'token'=>$where['token'],'wecha_id'=>$this->wecha_id));
			}
		//解决二级分类
			if($v['sub'] != NULL){
				foreach($v['sub'] as $ke=>$va){
					if($v['sub'][$ke]['url'] == ''){
						$info[$k]['sub'][$ke]['url'] = U('Index/lists',array('classid'=>$v['sub'][$ke]['id'],'token'=>$where['token'],'wecha_id'=>$this->wecha_id));
					}
				}
			}
			
		}
		
		$count=count($flash);
		$this->assign('flash',$flash);
		$this->assign('homeInfo',$this->homeInfo);
		$this->assign('indexanimation',$this->homeInfo['animation']);//引导动画，只有首页才有
		$this->assign('info',$info);
		$this->assign('num',$count);
		$this->assign('flashbgcount',count($flashbg));
		$this->assign('tpl',$this->tpl);
		$this->assign('bjmp3',$this->homeInfo['musicurl']);
		$this->assign('tongji',$this->homeInfo['tongji']);//统计代码暂时无用
		if($this->homeInfo['bjdh']!=''&&$this->homeInfo['bjdh']!=0){
			if(empty($this->homeInfo['yxslide'])){
				$yxslide='.banner{z-index:-2} #wrapper{z-index:-2}';
			}
			$bjdh='<div id="leafContainer"></div>
			<style>
			.mainmenu{z-index:3}'.$yxslide.'
			 #leafContainer{position: fixed;z-index:-1;width:100%;height: 690px;top:0;overflow:hidden;}
			 #leafContainer > div 
			{
				position: absolute;
				max-width: 100px;
				max-height: 100px;
				-webkit-animation-iteration-count: infinite, infinite;
				-webkit-animation-direction: normal, normal;
				-webkit-animation-timing-function: linear, ease-in;
			}

			#leafContainer > div > img {
				 position: absolute;
				 width: 100%;
				 -webkit-animation-iteration-count: infinite;
				 -webkit-animation-direction: alternate;
				 -webkit-animation-timing-function: ease-in-out;
				 -webkit-transform-origin: 50% -100%;
			}

			 @-webkit-keyframes fade{0%{ opacity: 1; }95%{ opacity: 1; }100%{ opacity: 0; }}

			 @-webkit-keyframes drop{0%{ -webkit-transform: translate(0px, -50px); }100% { -webkit-transform: translate(0px, 650px); }}
			 @-webkit-keyframes clockwiseSpin{0%{ -webkit-transform: rotate(-50deg); }100% { -webkit-transform: rotate(50deg); }}
			 @-webkit-keyframes counterclockwiseSpinAndFlip{0%{ -webkit-transform: scale(-1, 1) rotate(50deg); }100% { -webkit-transform: scale(-1, 1) rotate(-50deg); }}
			 </style>
			<script src="'.RES.'/Index/bjdh/'.$this->homeInfo['bjdh'].'/bjdh'.$this->homeInfo['bjdh'].'.js" type="text/javascript"></script>';
			$this->assign('bjdh',$bjdh);
		}
		
		//读取门店（公司）信息
		$where=array('token'=>$this->token);
		$thisCompany=M('Company')->where($where)->find();
		$this->assign('company',$thisCompany); 
		
		//读取后台设置的首页内容
		$indexContent = M('WxuserSiteIndexcontent')->where($where)->find();
		
		   //生成功能库链接
		   for ($i = 1; $i < 7; $i++){
			   	for ($j = 1; $j < 3; $j++){
				   	$indexContent['content_menu'.$j.'_item'.$i.'_link'] = str_replace('{siteUrl}', C('site_url'), $indexContent['content_menu'.$j.'_item'.$i.'_link']);
				   	$indexContent['content_menu'.$j.'_item'.$i.'_link'] = str_replace('{wechat_id}', $this->wecha_id, $indexContent['content_menu'.$j.'_item'.$i.'_link']);
			   	}
		   }
		
		   //抽取商品数据
			$ids_1 = explode(',',$indexContent['content_goodslist1_ids']);
			$ids_2 = explode(',',$indexContent['content_goodslist2_ids']);
			$ids_3 = explode(',',$indexContent['content_goodslist3_ids']);
			$ids_4 = explode(',',$indexContent['content_goodslist4_ids']);
			
			foreach ($ids_1 as $k=>$v) { if (empty($v)) unset($ids_1[$k]); }
			foreach ($ids_2 as $k=>$v) { if (empty($v)) unset($ids_2[$k]); }
			foreach ($ids_3 as $k=>$v) { if (empty($v)) unset($ids_3[$k]); }
			foreach ($ids_4 as $k=>$v) { if (empty($v)) unset($ids_4[$k]); }
			
			$ids_1_str = implode(",", $ids_1);
			$ids_2_str = implode(",", $ids_2);
			$ids_3_str = implode(",", $ids_3);
			$ids_4_str = implode(",", $ids_4);
			
			$product_model=M('Product');
			$list1 = $product_model->where('`id` in ('. $ids_1_str .')')->order('id desc')->select();
			$list2 = $product_model->where('`id` in ('. $ids_2_str .')')->order('id desc')->select();
			$list3 = $product_model->where('`id` in ('. $ids_3_str .')')->order('id desc')->select();
			$list4 = $product_model->where('`id` in ('. $ids_4_str .')')->order('id desc')->select();
			
			$indexContent['content_goodslist1'] = $list1;
			$indexContent['content_goodslist2'] = $list2;
			$indexContent['content_goodslist3'] = $list3;
			$indexContent['content_goodslist4'] = $list4;
			
			
		$this->assign('indexContent',$indexContent);
		
		
		// 获取公告文章列表
		$db=D('Img');
		$where['token']=$this->token;
		$where['classid']=$indexContent['announcements_class_id'];
		$announcements = $db->where($where)->order('uptatetime DESC')->select();
		
		//print_r($announcements);
		$this->assign('announcements',$announcements);
		
			
		$this->assign('token',$this->token);
		$this->assign('wecha_id',$this->wecha_id);
		
		
     
		$this->display($tpldata['tpltypename']);
	}
	
	public function lists(){
		$token=$this->token;
		$classid=$this->_get('classid','intval');
		$db=D('Img');
		$where['token']=$token;
		$classify=M('classify');
		//本分类信息
		$info=$classify->where(array("id"=>$classid,"token"=>$token))->find();
		//子类信息
		$sub=$classify->where(array("fid"=>$classid,'status'=>1,"token"=>$token))->order('sorts asc')->select(); 
		//获取模板信息
		$tpldata=$this->wxuser;
		//兼容老版本对老版本tpid进行处理
		$wxoldtpl=!(strpos($tpldata['tpltypeid'], 'y') === FALSE);  //id里面有'y'字符存在的就是老版本的tid,也就是所谓的老模板？
		if($wxoldtpl){
			$tpldata['tpltypeid']=101;//老版本tpid
			$tpldata['tpltypename'] ='101_index';
		}
		$tpldata['color_id']=intval($tpldata['color_id']);
		//设置过分类模板
		if(!empty($info['tpid'])){
			//兼容老版本对老版本tpid进行处理
			$oldtpl=!(strpos($info['tpid'], 'y') === FALSE);
			if($oldtpl){$info['tpid']=2;}
			
			$tplinfo=M('tmpls')->where(array('tplid'=>$info['tpid'],'type'=>1))->find();
			$tpldata['tpltypeid'] = $info['tpid'];
			$tpldata['tpltypename'] = $tplinfo['views']?$tplinfo['views']:$info['tpid'].'_index';
		}
		//bywzh~14.9.3 轮播背景图，轮播幻灯片
		$allflash=M('Flash')->where($where)->select();
		$allflash=$this->convertLinks($allflash);
		$flash=array();
		$flashbg=array();
		foreach($allflash as $af){
			if($af['url']==''){
				$af['url']='javascript:void(0)';
			}
			if($af['tip']==1){
				array_push($flash,$af);
			}elseif($af['tip']==2) {
				array_push($flashbg,$af);
			}
		}
		$this->assign('flashbg',$flashbg);
		//wzh9.3照顾老版本，背景图升级为轮播背景图
		if(!$flashbg&&$this->homeInfo['homeurl']){
			$flash_db=M('Flash');
			$arr=array();
			$arr['token']=$this->token;
			$arr['img']=$this->homeInfo['homeurl'];
			$arr['url']='';
			$arr['info']='';
			$arr['tip']=2;
			if($arr['img']){
			$flash_db->add($arr);
			}
		}
		//add轮播图结束
	
		//
		if($sub){          //  ===========  当前分类下存在子分类，把子分类当作列表内容列出  ============
			//处理url
			$sub=$this->convertLinks($sub);
			//有子类
			$j=count($sub);
			foreach($sub as $ke=>$va){
				$subpid=$va['id'];
				$sub[$ke]['sub']=$classify->where("fid=$subpid")->select();
				$sub[$ke]['sub']=$this->convertLinks($sub[$ke]['sub']);
				if($va['url'] == ''){
					$sub[$ke]['url']=U('Index/lists',array('classid'=>$va['id'],'token'=>$where['token'],'wecha_id'=>$this->wecha_id));
				}
				$sub[$ke]['key']=$j--;
			}
			$this->assign('info',$sub);
			$this->assign('thisClassInfo',$info);
			$tpllistname=$tpldata['tpltypename'];
			
		}else{        //  =======  当前分类下没有子分类，把当前分类下的文章当作列表内容列出  ========
			
			//部分列表模板使用快捷切换分类			
			$classlist=$classify->where(array("fid"=>0,'status'=>1,"token"=>$token))->order('sorts asc')->select(); 
			$classlist=$this->convertLinks($classlist);
			//图文信息
			$imgw['token']=$token;
			$imgw['classid']=$classid;
			$count=$db->where($imgw)->count();	
			$res=$db->where($imgw)->order('sorts ASC,uptatetime DESC')->select();
			$res=$this->convertLinks($res);
			if($count==1){
				$this->content($res[0]['id'],$info['conttpid']);exit();
			}
			foreach($res as $key=>$val){
				$res[$key]['name'] = $val['title'];
				$res[$key]['img'] = $val['pic'];
				if($res[$key]['url'] == ''){
					$res[$key]['url'] = U('Index/content',array('id'=>$val['id'],'classid'=>$val['classid'],'token'=>$where['token'],'wecha_id'=>$this->wecha_id));
				}
				$res[$key]['info'] = strip_tags(htmlspecialchars_decode(mb_substr($val['text'],0,10,'utf-8')));
			}	
			$this->assign('res',$res);//list模板数据
			if(empty($info['tpid'])){	
				$this->assign('info',$classlist);//分类列表信息
				$tpllistname=$tpldata['tpllistname'];
			}else{						
				$this->assign('info',$res);//index模板数据
				$tpllistname=$tpldata['tpltypename'];
			}

			$this->assign('thisClassInfo',$info);
		}		
		$flashNum=count($flash);
		$this->assign('flash',$flash);
		$this->assign('num',$flashNum);
		$this->assign('flashbgcount',count($flashbg));		
		$this->assign('tpl',$tpldata);
		$this->display($tpllistname);	
	}
	
	public function content($contid='',$cid=''){
		$token=$this->token;
		$class=M('Classify');
		$img=M('Img');
		//从模板直接浏览，或在列表方法中调用
		if($contid == '' AND $cid == ''){
			$id=$this->_get('id','intval');
			$classid=$this->_get('classid','intval');
		}else{		
			$id=intval($contid);
			$classid=intval($cid);
		}
		$res=$img->where(array('id'=>$id,'token'=>$token))->find();
		if(empty($classid)){
			$classid=$res['classid'];
		}
		//增加浏览量		
		$img->where(array('id'=>$id,'token'=>$token))->setInc('click');
		
		$classinfo=$class->where(array('id'=>$classid,'token'=>$token))->find();
		//分类列表
		$sub=$class->where(array("fid"=>$classid,'status'=>1,"token"=>$token))->order('sorts asc')->select(); 
		//优先显示子类，不存在显示根分类
		if(empty($sub)){
			$sub=$class->where(array("fid"=>0,'status'=>1,"token"=>$token))->order('sorts asc')->select(); 
		}		
		$sub=$this->convertLinks($sub);
		
		//获取模板信息
		$tpldata=$this->wxuser;
		if(!empty($classinfo['conttpid'])){
			$tplinfo=M('tmpls')->where(array('tplid'=>$classinfo['conttpid'],'type'=>3))->find();
			$tpldata['tplcontentname'] =  $tplinfo['views']?$tplinfo['views']:'content'.$tplinfo['tplid'];
		}
		
		$where['id']=array('neq',$contid);
		$where['token']=$token;
		$lists=$img->where($where)->limit(5)->order('uptatetime')->select();
		$lists=$this->convertLinks($lists);
		
		// 获取当前文章的所有评论
		$comments = NULL;
		if (!empty($id)){
			$comments = M('Img_comment')->where(array('img_id'=>$id))->order('createtime desc')->select();
		}		
		
	    // 获取评论者的名字
	    foreach ($comments as $key=>$comment){
	    	$rs = M('people')->where(array('id'=>$comment['uid']))->getField('name');
	    	if (empty($rs)){
	    		$comments[$key]['name'] = '游客';
	    	}else{
	    		$comments[$key]['name'] = $rs;
	    	}
	    }
		
	    $this->assign('comments',$comments);
		
		$this->assign('info',$sub);	//分类列表信息
		$this->assign('lists',$lists);		//推荐文章
		$this->assign('res',$res);			//内容详情;
		$this->assign('tpl',$tpldata);				//微信帐号信息
		$this->assign('copyright',$this->copyright);	//版权是否显示
		$this->display($tpldata['tplcontentname']);
		echo $tpldata['tplcontentname'];
	}
	
	public function save_comment(){ 
		
		$this->checked_login();
		
		$comment_content = trim($_POST['comment_content']);
		$people = session('people');
		
		
		if (empty($comment_content)){
			
			$this->error('请先填写评论内容再发表！');
		}else{
			
			$db = M('Img_comment');
			
			$data['img_id'] = intval($_POST['img_id']);
			$data['uid'] = intval($people['id']);
			$data['content'] = $comment_content;
			
			$rs = $db->add($data);
			
			if ($rs){
				if (!empty($_GET['re'])){
					$this->redirect($_GET['re']);
				}else{
					$this->success('评论成功！');
				}
			}else{
				$this->error('发表评论失败！');
			}
		}
		
	}
	
	public function flash(){
		$where['token']=$this->_get('token','trim');
		$flash=M('Flash')->where($where)->select();
		$count=count($flash);
		$this->assign('flash',$flash);
		$this->assign('info',$this->info);
		$this->assign('num',$count);
		$this->display('ty_index');
	}
	//digg code 0未成功 1顶过了 2踩过了
	public function ajaxDigg(){
		if(IS_POST){
			//echo json_encode(array('code'=>0,'msg'=>$_POST));exit;
			$cache=S('Digg_'.$this->token.'_'.$this->wecha_id);			
			//echo json_encode(array('code'=>0,'msg'=>$cache));exit;
			if($cache){
				$msg=($cache==1)?"顶过了":"踩过了";
				echo json_encode(array('code'=>0,'msg'=>$msg));exit;
			}
			$date=strtotime(date('Y-m-d',strtotime('+1 day')));//明日零点			
			$date2=time();//this time
			$cacheValidity=$date-$date2;
			
			if($_POST['type']==1){
				M('img')->where(array('token'=>$this->token,'id'=>$_POST['id']))->setInc('usertop');
				S('Digg_'.$this->token.'_'.$this->wecha_id,1,$cacheValidity);
				echo json_encode(array('code'=>1));exit;
			}else{
				M('img')->where(array('token'=>$this->token,'id'=>$_POST['id']))->setInc('userdown');
				S('Digg_'.$this->token.'_'.$this->wecha_id,2,$cacheValidity);
				echo json_encode(array('code'=>2));exit;
			}
		}else{
			$msg='<script type="text/javascript">	alert("这样是不能发表观点的哦！");</script>';
			$this->show($msg);
		}
	}	
	/**
	 * 获取链接
	 *
	 * @param unknown_type $url
	 * @return unknown
	 */
	public function getLink($url){
		$url=$url?$url:'javascript:void(0)';
		$urlArr=explode(' ',$url);
		$urlInfoCount=count($urlArr);
		if($urlInfoCount>1){
			$itemid=intval($urlArr[1]);
		}
		if($this->strExists($url,'刮刮卡')){
			$link='{siteUrl}/index.php?g=Wap&m=Guajiang&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'大转盘')){
			$link='{siteUrl}/index.php?g=Wap&m=Lottery&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'砸金蛋')){
			$link='{siteUrl}/index.php?g=Wap&m=Zadan&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'优惠券')){
			$link='{siteUrl}/index.php?g=Wap&m=Coupon&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'喜帖')){
			$link='{siteUrl}/index.php?g=Wap&m=Wedding&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'商家订单')){
			if($itemid){
				$link=$link='{siteUrl}/index.php?g=Wap&m=Host&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&hid='.$itemid;
			}else {
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'万能表单')){
			if($itemid){
				$link=$link='{siteUrl}/index.php?g=Wap&m=Selfform&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'相册')){
			$link='{siteUrl}/index.php?g=Wap&m=Photo&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link.='&id='.$itemid;
			}
		}elseif($this->strExists($url,'全景')){
			$link='{siteUrl}/index.php?g=Wap&m=Panorama&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link.='&id='.$itemid;
			}
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
		}elseif($this->strExists($url,'留言')){
			$link='{siteUrl}/index.php?g=Wap&m=Liuyan&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}elseif($this->strExists($url,'贺卡')){
			$link='{siteUrl}/index.php?g=Wap&m=Heka&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Heka&a=item&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'房产')){
			$link='{siteUrl}/index.php?g=Wap&m=Fang&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}elseif($this->strExists($url,'调研')){
			$link='{siteUrl}/index.php?g=Wap&m=Diaoyan&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Diaoyan&a=item&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'医疗')){
			$link='{siteUrl}/index.php?g=Wap&m=Yiliao&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link='/index.php?g=Wap&m=Yiliao&a=item&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'酒店')){
			$link='{siteUrl}/index.php?g=Wap&m=Jiudian&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link='/index.php?g=Wap&m=Jiudian&a=item&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'网站分类')){
			$link='{siteUrl}/index.php?g=Wap&m=Index&a=lists&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Index&a=lists&token='.$this->token.'&wecha_id='.$this->wecha_id.'&classid='.$itemid;
			}
		}elseif($this->strExists($url,'图文回复')){
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Index&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'LBS信息')){
			$link='{siteUrl}/index.php?g=Wap&m=Company&a=map&token='.$this->token.'&wecha_id='.$this->wecha_id;
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Company&a=map&token='.$this->token.'&wecha_id='.$this->wecha_id.'&companyid='.$itemid;
			}
		}elseif($this->strExists($url,'DIY宣传页')){
			$link='{siteUrl}/index.php/show/'.$this->token;
		}elseif($this->strExists($url,'投票')){
			if($itemid){
				$link='{siteUrl}/index.php?g=Wap&m=Vote&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$itemid;
			}
		}elseif($this->strExists($url,'首页')){
			$link='{siteUrl}/index.php?g=Wap&m=Index&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id;
		}else{
			if((strpos($url,'tel')===false)&&(strpos($url,'http')===false)&&$url!='javascript:void(0)'&&(strpos($url,'wecha_id=')===false)){
				if(strpos($url,'?')){
					$link=$link.'&wecha_id='.$this->wecha_id;
				}else {
					$link=$link.'?wecha_id='.$this->wecha_id;
				}
			}else{
				$link=$url;
			}					
		}
		$link = str_replace(array(
                    '{wechat_id}',
                    '{siteUrl}',
                    '&amp;'
                ), array(
                    $this->wecha_id,
                    C('site_url'),
                    '&'
                ), $link);
		return $link;
	}
	public function convertLinks($arr){
		$i=0;
		foreach($arr as $a){
			if($a['url']){
				$arr[$i]['url']=$this->getLink($a['url']);
			}
			$i++;
		}
		return $arr;
	}
	public function _getPlugMenu(){
		$company_db=M('company');
		$this->company=$company_db->where(array('token'=>$this->token,'isbranch'=>0))->find();
		$plugmenu_db=M('site_plugmenu');
		$plugmenus=$plugmenu_db->where(array('token'=>$this->token,'display'=>1))->order('taxis ASC')->limit('0,4')->select();
		if($plugmenus){
			$i=0;
			foreach($plugmenus as $pm){
				switch($pm['name']){
					case 'tel':
						if(!$pm['url']){
							$pm['url']='tel:'.$this->company['tel'];
						}else {
							$pm['url']='tel:'.$pm['url'];
						}
						break;
					case 'memberinfo':
						if(!$pm['url']){
							$pm['url']=U('Wap/Userinfo/index',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
						}
						break;
					case 'nav':
						if(!$pm['url']){
							$pm['url']=U('Wap/Company/map',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
						}
						break;
					case 'message':
						break;
					case 'share':
						break;
					case 'home':
						if(!$pm['url']){
							$pm['url']=U('Wap/Index/index',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
						}
						break;
					case 'album':
						if(!$pm['url']){
							$pm['url']=U('Wap/Photo/index',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
						}
						break;
					case 'email':
						$pm['url']='email:'.$pm['url'];
						break;
					case 'shopping':
						if(!$pm['url']){
							$pm['url']=U('Wap/Product/index',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
						}
						break;
					case 'membercard':
						$card=M('member_card_create')->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
						if(!$pm['url']){
							if($card==false){
								$pm['url']=U('Wap/Card/get_card',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
							}else{
								$pm['url']=U('Wap/Card/vip',array('token'=>$this->token,'wecha_id'=>$this->wecha_id));
							}
						}
						break;
					case 'activity':
						$pm['url']=$this->getLink($pm['url']);
						break;
					case 'weibo':
						break;
					case 'tencentweibo':
						break;
					case 'qqzone':
						break;
					case 'wechat':
						$pm['url']='weixin://addfriend/'.$this->weixinUser['wxid'];
						break;
					case 'music':
						break;
					case 'video':
						break;
					case 'recommend':
						$pm['url']=$this->getLink($pm['url']);
						break;
					case 'other':
						$pm['url']=$this->getLink($pm['url']);
						break;
				}
				$plugmenus[$i]=$pm;
				$i++;
			}
			
		}else {//默认的
			$plugmenus=array();
			/*
			$plugmenus=array(
			array('name'=>'home','url'=>'/index.php?g=Wap&m=Index&a=index&token='.$this->token.'&wecha_id='.$this->wecha_id),
			array('name'=>'nav','url'=>'/index.php?g=Wap&m=Company&a=map&token='.$this->token.'&wecha_id='.$this->wecha_id),
			array('name'=>'tel','url'=>'tel:'.$this->company['tel']),
			array('name'=>'share','url'=>''),
			);
			*/
		}
		return $plugmenus;
	}
	public function strExists($haystack, $needle)
	{
		return !(strpos($haystack, $needle) === FALSE);
	}
	
	
}
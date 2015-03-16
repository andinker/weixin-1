<?php

	class MarketAction extends WapAction{
		public $market_db;
		public $token;
		public $wecha_id;
		public $thisMarket;
		public $homeInfo;
		public function _initialize() {
        	parent::_initialize();
        	$this->market_db	= M('market'); 
       	 	$this->token 		= $this->_get('token');
        	$this->market_id 	= $this->_get('id');

			if (!defined('RES')){define('RES',THEME_PATH.'common');}
			$this->wecha_id		= $this->_get('wecha_id');
			if (!$this->wecha_id){$this->wecha_id	= 'null';}
			/*
			$catemenu = array(
				array(
					'url' 		=> U('Market/tenant',array('token'=>$this->token,'wecha_id'=>$this->wecha_id)),
					'picurl'	=> __ROOT__."/tpl/User/default/common/images/photo/plugmenu5.png",
					'name' 		=> '商户',
				),
				array(
					'url' 		=> U('Market/index',array('token'=>$this->token,'wecha_id'=>$this->wecha_id)),
					'picurl'	=> __ROOT__."/tpl/User/default/common/images/photo/plugmenu6.png",
					'name' 		=> '首页',
				),
				array(
					'url' 		=> U('Market/intro',array('token'=>$this->token,'wecha_id'=>$this->wecha_id)),
					'picurl'	=> __ROOT__."/tpl/User/default/common/images/photo/plugmenu4.png",
					'name' 		=> '简介',
				),

			);
			$this->assign('catemenu',$catemenu);
			*/
			
        	$this->thisMarket	= $this->market_db->where(array('token'=>$this->token))->find(); //设置信息
        	$this->assign('siteCopyright',$this->siteCopyright);
        	$this->assign('thisMarket',$this->thisMarket);
        	$this->assign('token',$this->token);
        	$this->assign('wecha_id',$this->wecha_id);
        	$this->assign('addtype',$addtype);
    	}

/*--------------------------------商圈首页------------------------------------------*/
		public function index(){	
			$nav			= M('Market_nav')->where(array('token'=>$this->token,'market_id'=>$this->thisMarket['market_id']))->order('sort desc')->limit('5')->select(); //菜单
			$tplData 	= array(); 	//模板
			
			$tplData['color_id'] 	= 0;
			$tplData['tpltypeid'] 	= $this->thisMarket['market_index_tpl'];
			
			$tplinfo=M('tmpls')->where(array('tplid'=>$tplData['tpltypeid'],'type'=>1))->find();
			$tplData['tpltypename'] = $tplinfo['views']?$tplinfo['views']:$tplData['tpltypeid'].'_index';
			
			$tplData['wxname'] 		= $this->thisMarket['name'];
			$nav 	= M('Market_nav')->where(array('market_id'=>$this->thisMarket['market_id'],'token'=>$this->token,'is_show'=>'1'))->order('sort desc')->select();

			foreach($nav as $key=>$value){			
				$info[] 	= array('url'=>str_replace(array('{$token}','{$wecha_id}','{siteUrl}'),array($this->token,$this->wecha_id,$this->siteUrl),$value['nav_link']),'name'=>$value['nav_name'],'img'=>$value['nav_pic']);
			}
			
			$this->assign('flash',$this->_getFlash());
			$this->assign('tpl',$tplData);
			$this->assign('info',$info);	
			$this->display('Index:'.$tplData['tpltypename']);			
		}
		/*商圈介绍*/
		public function intro(){
			$this->display();
		}

		/*商圈介绍*/
		public function maps(){
			$this->apikey	= C('baidu_map_api');
			$this->assign('apikey',$this->apikey);
			$this->display();
		}
/*-----------------------------商圈停车场-----------------------------------------*/
		public function park(){
			$park_db 	= M('market_park');
			$park_list 	= $park_db->where(array('market_id'=>$this->thisMarket['market_id'],'token'=>$this->token))->select();

			$this->assign('park_list',$park_list);
			$this->display();
		}

/*-----------------------------商户首页-------------------------------------------*/
		public function tenant(){
			$tplData 	= array(); 	//模板
		
			$tplData['color_id'] 	= 0;
			$tplData['tpltypeid'] 	= $this->thisMarket['tenant_index_tpl'];			
			$tplinfo=M('tmpls')->where(array('tplid'=>$tplData['tpltypeid'],'type'=>1))->find();
			$tplData['tpltypename'] = $tplinfo['views']?$tplinfo['views']:$tplData['tpltypeid'].'_index';			
			$tplData['wxname'] 		= $this->thisMarket['name'];

			//分类信息
			$info 		= array(
				array(
						'url'	=>U('Market/tenant',array('token'=>$this->token,'wecha_id'=>$this->wecha_id)),
						'name'	=>'最新加入',
						'img'	=>'',
						'sub'	=>$this->_getTenant('','',9)
					),
				array(
						'url'	=>U('Market/tenant',array('token'=>$this->token,'wecha_id'=>$this->wecha_id)),
						'name'	=>'按类别',
						'img'	=>'',
						'sub' 	=>$this->_getCate()
					),
				array(
						'url'	=>U('Market/tenant',array('token'=>$this->token,'wecha_id'=>$this->wecha_id)),
						'name'	=>'按楼层',
						'img'	=>'',
						'sub'	=>$this->_getArea()
					),				
				//'sub'=>$sub,
			);  
			$this->assign('info',$info);
			$this->assign('flash',$this->_getFlash());
			$this->assign('tpl',$tplData);
			$this->display('Index:'.$tplData['tpltypename']);
		}

		public function tenant_list(){
			$cate_id 	= $this->_get('cate_id','intval');
			$area_id 	= $this->_get('area_id','intval');
			$tplData 	= array(); 	//模板			
			$info = $this->_getTenant($cate_id,$area_id);
			
			$tplData['color_id'] 	= 0;			
			$tplData['tpltypeid'] 	= $this->thisMarket['tenant_list_tpl'];
			$tplinfo=M('tmpls')->where(array('tplid'=>$tplData['tpltypeid'],'type'=>1))->find();
			$tplData['tpltypename'] = $tplinfo['views']?$tplinfo['views']:$tplData['tpltypeid'].'_index';			
			$tplData['wxname'] 		= $this->thisMarket['name'].'-'.$info[0]['name'];
			
			$this->assign('flash',$this->_getFlash());
			$this->assign('info',$info);
			$this->assign('tpl',$tplData);
			$this->display('Index:'.$tplData['tpltypename']);
		}


		/*商户详情页*/
		public function tenant_info(){
			$id 	= $this->_get('id','intval');
			$tenant = M('Company')->where(array('token'=>$this->token,'id'=>$id,'isbranch'=>'1'))->find();			
			$this->assign('tenant',$tenant);
			$this->display();
		}		

		public function tenant_maps(){
			$tenant = M('Company')->where(array('token'=>$this->token,'id'=>$this->_get('id','intval'),'isbranch'=>'1'))->find();
			$this->assign('tenant',$tenant);
			$this->apikey	= C('baidu_map_api');
			$this->assign('apikey',$this->apikey);
			$this->display();
		}

/*-------------------------数据调用方法-----------------------------*/

		/*分类查询*/
		public function _getCate(){

			$where	= array('token'=>$this->token,'isMarket'=>1,'status'=>'1');
			$cate 	= M('Company_cate')->where($where)->order('sort')->select(); 
			$sub = array();
			foreach($cate as $key=>$value){
				$sub[$key]['img'] 	= $value['logourl'];
				$sub[$key]['name'] 	= $value['name'];
				//$sub[$key]['url'] 	= "/index.php?g=Wap&m=Market&a=tenant_list&token=$this->token&wecha_id=$this->wecha_id&cate_id={$value['cate_id']}";
				$sub[$key]['url'] 	= U('Market/tenant_list',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'cate_id'=>$value['id']));
				
			}

			return $sub;
		}

		/*分类查询*/
		public function _getArea(){
			$where	= array('token'=>$this->token,'isMarket'=>1,'status'=>'1');
			$area 	= M('Company_area')->where($where)->order('sort')->select(); 
			$sub = array();
			foreach($area as $key=>$value){
				$sub[$key]['img'] 	= $value['logourl'];
				$sub[$key]['name'] 	= $value['name'];
				$sub[$key]['url'] 	= U('Market/tenant_list',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'area_id'=>$value['id']));
				
			}
			return $sub;
		}

		/*楼层查询*/
		/*查询商户信息*/
		public function _getTenant($cate_id="",$area_id="",$num=""){
			$where = array('token'=>$this->token,'isbranch'=>'1');
			$order = 'add_time desc';
			if($cate_id){	$where['cateid'] 	= $cate_id;	}
			if($area_id){	$where['areaid'] 	= $area_id;	}
			$tenant_list = M('Company')->where($where)->order($order)->limit($num)->select();			
			$sub = array();
			foreach($tenant_list as $key=>$value){
				$sub[$key]['img'] 	= $value['logourl'];
				$sub[$key]['name'] 	= $value['name'];
				$sub[$key]['info'] 	= $value['shortname'];
				$sub[$key]['url'] 	= U('Market/tenant_info',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'id'=>$value['id']));
			}
			return $sub;
		}	
		/*获取幻灯片*/
		public function _getFlash(){
			//幻灯片
			$flash 	= array();			
			$slide 	= M('Market_slide')->where(array('market_id'=>$this->thisMarket['market_id'],'slide_url'=>array('neq','')))->order('slide_id desc')->limit('5')->select(); 

			foreach($slide as $key=>$value){		
				$flash[$key]['info'] 	= $value['slide_title'];
				$flash[$key]['url'] 	= $value['slide_link'];
				$flash[$key]['img'] 	= $value['slide_url'];
			}
			return $flash;
		}




	}
?>
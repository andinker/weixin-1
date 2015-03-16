<?php 
/**商圈**/
class MarketAction extends UserAction{ 
	public $market_db;
	public $area_db;
	public $park_db;
	public $cate_db;
	public $tenant_db;
	public $token;
	public $market_id;
	public function _initialize(){
		parent::_initialize();
		$this->market_db = D('Market');
		$this->area_db = D('Company_area');
		$this->park_db = D('Market_park');
		$this->cate_db = D('Company_cate');
		$this->tenant_db = D('Company');
		$market_id = $this->market_db->where(array('token'=>$this->token))->getField('market_id');
		if(empty($market_id) && ACTION_NAME != 'index'){ 
			$this->error('设置商圈后才能使用',U('Market/index',array('token'=>$this->token)));
		}else{ 
			$this->market_id = $market_id;
		}
		$this->token = session('token');
	}
	public function index(){ 
		$keyword_db = M('keyword');
		$where = array('token'=>$this->token);
		$market = $this->market_db->where($where)->find();
		if(IS_POST){ 
			$slide['slide_title'] = $this->_request('slid_title','trim');
			$slide['slide_link'] = $this->_request('link','trim');
			$slide['slide_url'] = $this->_request('slide','trim');
			if($this->market_db->create()){ 
				$keyword['module'] = 'Market';
				$keyword['token'] = $this->token;
				$keyword['keyword'] = $this->_post('keyword','trim');
				if($market){ 
					$this->market_db->where($where)->save($_POST);
					$this->_market_slide($this->_post('market_id','intval'),$slide,'update');
					$keyword['pid'] = $this->_post('market_id','intval');					
					$keyword_db->where(array('token'=>$this->token,'pid'=>$this->_post('market_id','intval'),'module'=>'Market'))->save($keyword);
					$this->success('修改成功',U('Market/index',array('token'=>$this->token)));
				}else{ 
					$_POST['token'] = $this->token;
					$id = $this->market_db->add($_POST);
					$this->_market_slide($id,$slide);
					$this->_create_nav($id);
					$keyword['pid'] = $id;
					$keyword_db->add($keyword);
					$this->success('设置成功',U('Market/index',array('token'=>$this->token)));
				}
			}else{ 
				$this->error($this->market_db->getError());
			}
		}else{ 
			$slide = $this->_get_slide($market['market_id']);
			$this->assign('slide',$slide);
			$this->assign('market',$market);
			$this->display();
		}
	}
	public function _create_nav($id){ 
		$name = array( '商家', '停车场', '简介');
		$url = array( '{siteUrl}/index.php?g=Wap&m=Market&a=tenant&token='.$this->token.'&wecha_id={$wecha_id}', '{siteUrl}/index.php?g=Wap&m=Market&a=park&token='.$this->token.'&wecha_id={$wecha_id}', '{siteUrl}/index.php?g=Wap&m=Market&a=intro&token='.$this->token.'&wecha_id={$wecha_id}');
		$pic = array(  STATICS.'/attachment/icon/white/1.png',  STATICS.'/attachment/icon/white/4.png',  STATICS.'/attachment/icon/white/9.png',  STATICS.'/attachment/icon/white/7.png',  STATICS.'/attachment/icon/white/14.png',);
		$system = array( '1', '1', '1', '0', '0', '0' );		
		for ($i=0;$i < count($name) ;$i++){
			M('Market_nav')->add(array('nav_name'=>$name[$i],'nav_link'=>$url[$i],'nav_pic'=>$pic[$i],'is_show'=>'1','is_system'=>$system[$i],'sort'=>(100-$i),'token'=>$this->token,'market_id'=>$id));
		}
	}
	public function _market_slide($market_id,$data,$handle='insert'){ 
		$slide_db = M('market_slide');
		if($handle == 'insert'){ 
			$count = count($data['slide_url']);
			for($i=0;$i<$count;$i++){ 
				$arr['market_id'] = $market_id;
				$arr['slide_url'] = $data['slide_url'][$i];
				$arr['slide_title'] = $data['slide_title'][$i];
				$arr['slide_link'] = $data['slide_link'][$i];
				$slide_db->add($arr);
			}
		}else{ 
			$slide_id = $slide_db->where(array('market_id'=>$market_id))->getField('slide_id',true);
			$count = count($data['slide_url']);
			for($i=0;$i<$count;$i++){ 
				$arr['slide_url'] = $data['slide_url'][$i];
				$arr['slide_title'] = $data['slide_title'][$i];
				$arr['slide_link'] = $data['slide_link'][$i];
				$slide_db->where(array('market_id'=>$market_id,'slide_id'=>$slide_id[$i]))->save($arr);
			}
		}
	}
	public function _get_slide($market_id){ 
		$slide_db = M('market_slide');
		$arr = array();
		$where = array('market_id'=>$market_id);
		$list = $slide_db->where($where)->order('slide_id asc')->select();
		$arr = array();
		foreach($list as $key=>$value){ 
			if($value['slide_url'] != ''){ 
				$arr['slide_'.$key] = $value['slide_url'];
				$arr['link_'.$key] = $value['slide_link'];
				$arr['title_'.$key] = $value['slide_title'];
			}
		}
		if(empty($arr)){ 
			$arr['slide_0'] =  STATICS.'/attachment/focus/default/2.jpg';
			$arr['slide_1'] =  STATICS.'/attachment/focus/default/3.jpg';
			$arr['slide_2'] =  STATICS.'/attachment/focus/default/4.jpg';
		}
		return $arr;
	}
	public function area(){ 
		$where = array('token'=>$this->token,'isMarket'=>1);
		$count = $this->area_db->where($where)->count();
		$Page = new Page($count,15);
		$area = $this->area_db->where($where)->order('sort desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('page',$Page->show());
		$this->assign('area',$area);
		$this->display();
	}
	public function area_set(){ 
		$where = array('token'=>$this->token,'isMarket'=>1,'id'=>$this->_get('area_id','intval'));
		$area = $this->area_db->where($where)->find();
		if(IS_POST){ 
			if($this->area_db->create()){ 
				if($area){ 
					$_POST['status'] = empty($_POST['status'])?'0':$_POST['status'];
					$_POST['info'] = $this->_post('info','trim');
					$this->area_db->where($where)->save($_POST);
					$this->success('修改成功',U('Market/area',array('token'=>$this->token)));
				}else{ 
					$_POST['token'] = $this->token;
					$_POST['status'] = empty($_POST['status'])?'0':$_POST['status'];
					$_POST['info'] = $this->_post('info','trim');
					$_POST['isMarket']=1;
					$this->area_db->add($_POST);
					$this->success('添加成功',U('Market/area',array('token'=>$this->token)));
				}
			}else{ 
				$this->error($this->area_db->getError());
			}
		}else{ $this->assign('area',$area);$this->display();}
	}
	public function area_del(){ 
		$where = array('token'=>$this->token,'isMarket'=>1,'id'=>$this->_get('area_id','intval'));
		if($this->area_db->where($where)->delete()){ $this->success('删除成功',U('Market/area',array('token'=>$this->token)));}
	}
	public function park(){ 
		$where = array('token'=>$this->token,'market_id'=>$this->market_id);
		$count = $this->park_db->where($where)->count();
		$Page = new Page($count,15);
		$park = $this->park_db->where($where)->order('add_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('page',$Page->show());
		$this->assign('park',$park);
		$this->display();
	}
	public function park_set(){ 
		$where = array('token'=>$this->token,'market_id'=>$this->market_id,'park_id'=>$this->_get('park_id','intval'));
		$park = $this->park_db->where($where)->find();
		if(IS_POST){ 
			if($this->park_db->create()){ 
				if($park){ 
					$_POST['add_time'] = time();
					$_POST['is_use'] = empty($_POST['is_use'])?'0':$_POST['is_use'];
					$_POST['park_intro'] = $this->_post('park_intro','trim');
					$this->park_db->where($where)->save($_POST);
					$this->success('修改成功',U('Market/park',array('token'=>$this->token)));
				}else{ 
					$_POST['token'] = $this->token;
					$_POST['market_id'] = $this->market_id;
					$_POST['add_time'] = time();
					$_POST['is_use'] = empty($_POST['is_use'])?'0':$_POST['is_use'];
					$_POST['park_intro'] = $this->_post('park_intro','trim');
					$this->park_db->add($_POST);
					$this->success('添加成功',U('Market/park',array('token'=>$this->token)));
				}
			}else{ 
				$this->error($this->park_db->getError());
			}
		}else{ 
			$this->assign('park',$park);
			$this->display();
		}
	}
	public function park_del(){ 
		$where = array('token'=>$this->token,'park_id'=>$this->_get('park_id','intval'));
		if($this->park_db->where($where)->delete()){ $this->success('删除成功',U('Market/park',array('token'=>$this->token)));}
	}
	public function cate(){ 
		$where = array('token'=>$this->token,'isMarket'=>1);
		$count = $this->cate_db->where($where)->count();
		$Page = new Page($count,15);
		$cate = $this->cate_db->where($where)->order('sort desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('page',$Page->show());
		$this->assign('cate',$cate);
		$this->display();
	}
	public function cate_set(){ 
		$where = array('token'=>$this->token,'isMarket'=>1,'id'=>$this->_get('cate_id','intval'));
		$cate = $this->cate_db->where($where)->find();
		if(IS_POST){ 
			if($this->cate_db->create()){ 
				if($cate){ 
					$_POST['status'] = empty($_POST['status'])?'0':$_POST['status'];
					$this->cate_db->where($where)->save($_POST);
					$this->success('修改成功',U('Market/cate',array('token'=>$this->token)));
				}else{ 
					$_POST['token'] = $this->token;
					$_POST['status'] = empty($_POST['status'])?'0':$_POST['status'];
					$_POST['isMarket']=1;
					$this->cate_db->add($_POST);
					$this->success('添加成功',U('Market/cate',array('token'=>$this->token)));
				}
			}else{ 
				$this->error($this->cate_db->getError());
			}
		}else{ 
			$this->assign('cate',$cate);$this->display();
		}
	}
	function cate_del(){ 
		$where = array('token'=>$this->token,'id'=>$this->_get('cate_id','intval'));
		if($this->cate_db->where($where)->delete()){ $this->success('删除成功',U('Market/cate',array('token'=>$this->token)));}
	}

	public function tenant(){ 
		$cate_list = $this->cate_db->where(array('token'=>$this->token,'isMarket'=>1,'status'=>'1'))->field('name,id')->order('sort desc')->select();
		$area_list = $this->area_db->where(array('token'=>$this->token,'isMarket'=>1,'status'=>'1'))->field('name,id')->order('sort desc')->select();
		$where = array('token'=>$this->token,'isbranch'=>'1');
		$like = $this->_post('like','trim');
		$cate_id = $this->_post('cate_id','intval');
		$area_id = $this->_post('area_id','intval');
		if($like){ $where['name|shortname'] = array('like',"%$like%");}
		if($cate_id){ $where['cateid'] = $cate_id;}
		if($area_id){ $where['areaid'] = $area_id;}
		$count = $this->tenant_db->where($where)->count();
		$Page = new Page($count,15);
		$tenant = $this->tenant_db->where($where)->order('taxis asc,add_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($tenant as $key=>$value){ 
			$tenant[$key]['cate_name'] = $this->cate_db->where(array('token'=>$this->token,'isMarket'=>1,'id'=>$value['cateid']))->getField('name');
			$tenant[$key]['area_name'] = $this->area_db->where(array('token'=>$this->token,'isMarket'=>1,'id'=>$value['areaid']))->getField('name');
		}
		$this->assign('cate_list',$cate_list);
		$this->assign('area_list',$area_list);
		$this->assign('page',$Page->show());
		$this->assign('tenant',$tenant);
		$this->display();
	}
	public function tenant_set(){ 
		$cate_list = $this->cate_db->where(array('token'=>$this->token,'isMarket'=>1,'status'=>'1'))->field('name,id')->order('sort desc')->select();
		$area_list = $this->area_db->where(array('token'=>$this->token,'isMarket'=>1,'status'=>'1'))->field('name,id')->order('sort desc')->select();
		$this->assign('area_list',$area_list);
		$this->assign('cate_list',$cate_list);
		$tenant_info = $this->tenant_db->where(array('token'=>$this->token,'id'=>$this->_get('id','intval')))->find();
		if(IS_POST){ 
			if($this->tenant_db->create()){ 
				if($tenant_info){ 
					$status=$this->tenant_db->where(array('token'=>$this->token,'isbranch'=>'1','id'=>$this->_get('id','intval')))->save($_POST);
					if($status){
						$this->success('修改成功',U('Market/tenant',array('token'=>$this->token)));
					}else{
						$this->error('修改失败',U('Market/tenant',array('token'=>$this->token)));
					}					
				}else{ 
					$_POST['add_time'] = time();
					//$_POST['market_id'] = $this->market_id;
					$_POST['isbranch'] = 1;
					$_POST['token'] = $this->token;
					$this->tenant_db->add($_POST);
					$this->success('添加成功',U('Market/tenant',array('token'=>$this->token)));
				}
			}else{ 
				$this->error($this->tenant_db->getError());
			}
		}else{ 
			$this->assign('tenant',$tenant_info);
			$this->assign('area_list',$area_list);
			$this->assign('cate_list',$cate_list);
			$this->display();
		}
	}
	public function tenant_del(){ 
		$id = $this->_get('id','intval');
		$where = array('token'=>$this->token,'isbranch'=>'1','id'=>$id);
		if($this->tenant_db->where($where)->delete()){ $this->success('删除成功',U('Market/tenant',array('token'=>$this->token)));}
	}
	public function menu(){ $this->display();}
	public function wap_nav(){ 
		$nav_db = M('Market_nav');
		$cate = $nav_db->where(array('token'=>$this->token,'market_id'=>$this->market_id))->order('sort desc')->select();
		$this->assign('cate',$cate);
		$this->display();
	}
	public function wap_nav_set(){ 
		$nav_db = D('Market_nav');
		$nav_id = $this->_get('nav_id','intval');
		$nav_info = $nav_db->where(array('token'=>$this->token,'nav_id'=>$nav_id))->find();
		if(IS_POST){ 
			if($nav_db->create()){ 
				if($nav_info){ 
					$_POST['is_show'] = empty($_POST['is_show'])?'0':$_POST['is_show'];
					$nav_db->where(array('token'=>$this->token,'nav_id'=>$this->_post('nav_id','intval')))->save($_POST);
					$this->success('修改成功',U('Market/wap_nav',array('token'=>$this->token)));
				}else{ 
					$_POST['token'] = $this->token;
					$_POST['market_id'] = $this->market_id;
					$_POST['is_show'] = empty($_POST['is_show'])?'0':$_POST['is_show'];
					if($nav_db->add($_POST)){ $this->success('添加成功',U('Market/wap_nav',array('token'=>$this->token)));}
				}
			}else{ 
				$this->error($nav_db->getError());
			}
		}else{ 
			$this->assign('nav',$nav_info);
			$this->display();
		}
	}
	public function wap_nav_del(){ 
		$nav_db = M('Market_nav');
		$where = array('token'=>$this->token,'nav_id'=>$this->_get('nav_id','intval'));
		if($nav_db->where($where)->delete()){ $this->success('删除成功',U('Market/wap_nav',array('token'=>$this->token)));}
	}
}
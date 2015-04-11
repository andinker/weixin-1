<?php
/**
 *语音回复
**/
class ClassifyAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->canUseFunction('shouye');
	}
	public function index(){
		$db=D('Classify');
		$where['token']=session('token');
		if($this->_get('fid')){
			$where['fid']=$this->_get('fid');
			$thisClassify=$db->where(array('id'=>$where['fid']))->find();
			$this->assign('thisClassify',$thisClassify);
		}
		$count=$db->where($where)->count();
		$page=new Page($count,25);
		$info=$db->where($where)->order('fid asc,sorts asc')->limit($page->firstRow.','.$page->listRows)->select();
		$this->assign('page',$page->show());
		$this->assign('info',$info);
		$this->display();
	}
	
	public function add(){
		   $db=D('Classify');
		   $pname=$db->field('id,fid,sorts,name')->where(array('token'=>$this->token))->order('fid,sorts')->select();
		   $this->assign('fidlist',$pname);

		$this->display();
	}
	
	public function edit(){
		$id=$this->_get('id','intval');
		$info=M('Classify')->find($id);
		$this->assign('info',$info);
		
		$pname=M('Classify')->where("token ='".$this->token."' and id <> $id")->order('fid,sorts')->select();
		$this->assign('fidlist',$pname);
		$this->display();
	}
	
	public function del(){
		$where['id']=$this->_get('id','intval');
		$where['uid']=session('uid');
		if(D(MODULE_NAME)->where($where)->delete()){
			$this->success('操作成功',U(MODULE_NAME.'/index'));
		}else{
			$this->error('操作失败',U(MODULE_NAME.'/index'));
		}
	}
	public function insert(){
		$this->all_insert();
	}
	public function upsave(){ //print_r($_POST); exit();
		$this->all_save();
	}
	public function chooseTpl(){	
		$tpid = $this->_get('tpid','intval');
		$db=M('tmpls');	
		$tpl=S('indextpl_'.$where['token']);
		if(empty($tpl)){
			$tpl = $db->where(array('type'=>1,'status'=>1))->order('sort asc,id DESC')->select();
			S('indextpl_'.$where['token'],$tpl,3600);//缓存数据，减少数据库查询量
		}
		//拼接生成图片url
		foreach($tpl as $key=>$t){
			if(!strpos('http',$t['imgurl'])){
				$tpl[$key]['imgurl']=RES.'/tmplimg/index/'.$t['imgurl'];
			}
			if($tpid==$t['tplid']){
				$info['tplview'] =$tpl[$key]['imgurl'];
			}
		}

		/* 2015.4.10 添加类型为2的列表页模板数据 
		$listTpl =$db->where(array('type'=>2,'status'=>1))->order('sort asc,id DESC')->select();
		foreach($listTpl as $key=>$con){
			if(!strpos('http',$con['imgurl'])){
				$listTpl[$key]['imgurl']=RES.'/tmplimg/list/'.$con['imgurl'];
			}
			if($tpid==$con['tplid']){
				$info['tplview2'] = $listTpl[$key]['imgurl'];
			}
		}
		$this->assign('listTpl',$listTpl);
		============================*/
		
		
		$contTpl =$db->where(array('type'=>3,'status'=>1))->order('sort asc,id DESC')->select();	
		foreach($contTpl as $key=>$con){
			if(!strpos('http',$con['imgurl'])){
				$contTpl[$key]['imgurl']=RES.'/tmplimg/detail/'.$con['imgurl'];
			}
			if($tpid==$con['tplid']){
				$info['tplview2'] = $contTpl[$key]['imgurl'];
			}
		}
		
		$this->assign('info',$info);
		$this->assign('contTpl',$contTpl);
		$this->assign('tpl',$tpl);

		$this->display();
	}
}
?>
<?php
class essayAction extends BackAction{
	protected function _initialize(){
        parent::_initialize();
		$this->db=D('essay');
	}

	public function index(){
		$db=D('essay');
		$count=$db->where(array('status'=>1))->order('sort ASC')->count();
		$page=new Page($count,25);
		$info=$db->where(array('status'=>1))->order('sort ASC')->limit($page->firstRow.','.$page->listRows)->select();
		$this->assign('page',$page->show());
		$this->assign('info',$info);
		$this->display();
	}
	public function detail(){
		$id=$this->_get('id','intval');
		$essay=$this->db->where(array('id'=>$id))->find();
		if($essay){
			$this->assign('essay',$essay);			
			$this->display();			
		}else{
			$this->error('非法请求，请联系管理员！');
		}
	}
}
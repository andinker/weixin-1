<?php
class RegionAction extends Action{
	
	public function index() {

		$where = array();
		$province_data 	= M('region_province')->where($where)->select();
		$city_data     	= M('region_city')->where($where)->select();
		$district_data 	= M('region_district')->where($where)->select();
		$community_data = M('region_community')->where($where)->select();
		 
		$this->assign('province_data'	,$province_data);
		$this->assign('city_data'		,$city_data);
		$this->assign('district_data'	,$district_data);
		$this->assign('community_data'	,$community_data);
		
		$type = 'community';
		if ( !empty($_GET['type']) ) $type = $_GET['type'];
		
		$rs = M('region_'.$type)->order('status Asc')->select();
		
		$this->assign('type',$type);
		$this->assign('rs',$rs);
		
		$this->display();
	}
	
	public function ok() {
		$type = NULL;
		$id = NULL;
		if ( !empty($_GET['type']) ) $type = $_GET['type'];
		if ( !empty($_GET['id']) ) $id = $_GET['id'];
		
		if (M('region_'.$type)->where(array('id'=>$id))->setField('status',1)){
			$this->success("审核成功！");
		}else {
			$this->error("审核失败！");
		}
	}
	
	Public function del() {
		$type = NULL;
		$id = NULL;
		if ( !empty($_GET['type']) ) $type = $_GET['type'];
		if ( !empty($_GET['id']) ) $id = $_GET['id'];
		
		if (M('region_'.$type)->where(array('status'=>0,'id'=>$id))->delete()){
			$this->success("删除成功！");
		}else {
			$this->error("删除失败！");
		}
	}
	
}
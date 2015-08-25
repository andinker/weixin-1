<?php
class ApplyforoperatorAction extends Action{
	
	public function index() {
		
		// 显示所有申请
		$db = M('Applyforoperator');
		$select_rs = $db->select();
		
		$this->assign('ListData',$select_rs);
		
		$this->display();
	}
	
	/**
	 * 设置申请为已处理状态
	 */
	public function setStatus() {
		
		$state = true;
		$msg = '保存成功！';
		
		if ( IS_POST && isset($_POST['ajax']) && $_POST['ajax'] == 'yes' ){
			$db = M('Applyforoperator');
			$rs = $db->where(array('id'=>$_POST['id']))->setField('status',1);
			
			if (!$rs){
				$state = false;
				$msg = '数据库出错！';
			}
		}else{
			$state = false;
			$msg = '处理失败！';
		}
		
		exit(json_encode(array(
				'state'=>$state,
				'msg'=>$msg,
		)));
	}
	
	/**
	 * 删除一个申请
	 */
	public function delete() {
		$state = true;
		$msg = '保存成功！';
		
		if ( IS_POST && isset($_POST['ajax']) && $_POST['ajax'] == 'yes' ){
			$db = M('Applyforoperator');
			$rs = $db->where(array('id'=>$_POST['id']))->delete();
			
			if (!$rs){
				$state = false;
				$msg = '数据库出错！';
			}
		}else{
			$state = false;
			$msg = '处理失败！';
		}
		
		exit(json_encode(array(
				'state'=>$state,
				'msg'=>$msg,
		)));
	}
	
}
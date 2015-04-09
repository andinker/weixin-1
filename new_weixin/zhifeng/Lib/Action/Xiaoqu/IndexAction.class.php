<?php
class IndexAction extends XiaoquAction {
	
	public function index() {
		
		$rs = M('Wxuser')->select();
		
		$this->assign('wxusers',$rs);
		
		$this->display();
	}
	
}
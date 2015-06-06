<?php
class MuserAction  extends UserAction{
	protected function _initialize(){
		parent::_initialize();
		
		// 引导用户选择公众号
		$token = session('token');
		
		if (empty($token) && MODULE_NAME != 'Index' && ACTION_NAME != 'index'){
			$this->redirect(U('Index/index')); 
		}
	}
}
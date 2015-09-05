<?php
class SiteAction extends BackAction{
	public function _initialize() {
        parent::_initialize();  //RBAC 验证接口初始化
    }
	
	public function index(){
		$groups=M('User_group')->order('id ASC')->select();
		$this->assign('groups',$groups);
		$this->display();
	}
	public function email(){
		$this->display();
	}	
	public function alipay(){
		$this->display();
	}
	public function safe(){
		$this->display();
	}
	public function template() {
		$configt= require CONF_PATH ."Home/config.php";
		$this->assign('template',$configt['DEFAULT_THEME']);
		$this->display();
	}
	public function template_up() {
		$data=$this->_post('beer');
		$setfile = CONF_PATH ."Home/config.php";
	    $settingstr="<?php \n return array(\n   'TMPL_FILE_DEPR'=>'_',\n   'DEFAULT_THEME' => '".$data."',    \n   );\n?>\n";
	    file_put_contents($setfile,$settingstr); //通过file_put_contents保存setting.config.php文件；

	    $this->success('操作成功',U('Site/template'));
	}
	public function upfile(){
		$this->display();
	}
	public function insert(){
		$file=$this->_post('files');
		unset($_POST['files']);
		unset($_POST[C('TOKEN_NAME')]);
		
		if($this->update_config($_POST,CONF_PATH.$file)){
			$this->success('操作成功',U('Site/index',array('pid'=>6,'level'=>3)));
		}else{
			$this->success('操作失败',U('Site/index',array('pid'=>6,'level'=>3)));
		}
	}
	
	private function update_config($config, $config_file = '') {
		!is_file($config_file) && $config_file = CONF_PATH . 'web.php';
		if (is_writable($config_file)) {
			$config['tongji']=base64_encode($config['tongji']);
			file_put_contents($config_file, "<?php \nreturn " .var_export($config, true) . ";", LOCK_EX);
			@unlink(RUNTIME_FILE);
			return true;
		} else {
			return false;
		}
	}
}
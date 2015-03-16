<?php
class KefuAction extends UserAction{
	public $token;
	public $kefu_db;
	public function _initialize() {
		parent::_initialize();
		$this->token=$this->_session('token');
		$this->kefu_db=M('kefu');
		$this->canUseFunction('Kefu');
	}
	//配置
	public function index(){
		$kefu=$this->kefu_db->where(array('token'=>session('token')))->find();
		if(IS_POST){
			//写入关键字			
			$keyword_model=M('Keyword');			
			if($kefu==false){
				$id = $this->kefu_db->add($_POST);
				if($id){
					$key = array('keyword'=>$_POST['keyword'],'pid'=>$id,'token'=>$this->token,'module'=>'Kefu',);	
					$keyword_model->add($key);					
					$this->success('添加成功');
				}else{$this->error('添加失败！');}
			}else{	
				$savekefu = $this->kefu_db->where(array('id'=>$kefu['id']))->save($_POST);
				if($savekefu){
					$check = $keyword_model->where(array('token'=>$this->token,'module'=>'Kefu'))->find();
					if(empty($check)){
						$key = array('keyword'=>$_POST['keyword'],'pid'=>$kefu['id'],'token'=>$this->token,'module'=>'Kefu');
						$keyword_model->add($key);
					}else{
						$keyword_model->where(array('token'=>$this->token,'module'=>'Kefu'))->save(array('keyword'=>$_POST['keyword']));
					}
					$this->success('保存成功');
				}else{$this->error('保存失败！');}	
			}
		}else{
			$this->assign('kefu',$kefu);
			$this->display();
		}
	}}
?>
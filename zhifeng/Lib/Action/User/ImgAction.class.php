<?php
//图文回复
class ImgAction extends UserAction{
	public function index(){
		$db=D('Img');
		//$where['uid']=session('uid');
		$where['token']=session('token');
		$count=$db->where($where)->count();
		$page=new Page($count,25);
		$info=$db->where($where)->order('sorts ASC,uptatetime DESC')->limit($page->firstRow.','.$page->listRows)->select();
		$this->assign('page',$page->show());
		$this->assign('info',$info);
		$this->display();
	}
	public function add(){
		$class=M('Classify')->where(array('token'=>session('token')))->select();
		if($class==false){$this->error('请先添加3G网站分类',U('Classify/index',array('token'=>session('token'))));}
		$db=M('Classify');
		$where['token']=session('token');
		$info=$db->where($where)->select();
		
		$info = $this->makeLevelClassNames($info);
		
		$this->assign('info',$info);
		$this->display();
	}
	public function edit(){
		$db=M('Classify');
		$where['token']=session('token');
		$info=$db->where($where)->select();
		
		$info = $this->makeLevelClassNames($info);
		
		$where['id']=$this->_get('id','intval');
		$where['uid']=session('uid');
		$res=D('Img')->where($where)->find();
		$this->assign('info',$res);
		$this->assign('res',$info);
		$this->display();
	}
	
	public function del(){
		$where['id']=$this->_get('id','intval');
		$where['uid']=session('uid');
		if(D(MODULE_NAME)->where($where)->delete()){
			M('Keyword')->where(array('pid'=>$this->_get('id','intval'),'token'=>session('token'),'module'=>'Img'))->delete();
			$this->success('操作成功',U(MODULE_NAME.'/index'));
		}else{
			$this->error('操作失败',U(MODULE_NAME.'/index'));
		}
	}
	public function insert(){
		$_POST['info']=str_replace('\'','&apos;',$_POST['info']);
		$usersdata=M('Users');
		$usersdata->where(array('id'=>$this->user['id']))->setInc('diynum');
		$this->all_insert();
	}
	public function upsave(){		
		$_POST['info']=str_replace('\'','&apos;',$_POST['info']);
		$this->all_save();
	}
	
	public function multiImgDel(){
		$id = (int)$this->_get('id');
		if(M('Img_multi')->where(array('token'=>$this->token,'id'=>$id))->delete() && M('Keyword')->where(array('token'=>$this->token,'pid'=>$id))->delete()){
			$this->success('删除成功');
		}else{
			$this->error('删除失败，请稍后再试~');
		}
	}
	
	public function multi(){
		if((int)$this->_get('tip') == 2){
			$multi = M('Img_multi');
			$img = M('Img');
			$where['token'] = $this->token;
			$count=$multi->where($where)->count();
			$page=new Page($count,20);
			$list = $multi->where($where)->limit($page->firstRow.','.$page->listRows)->order('id DESC')->select();
			$p = $page->show();
			
			foreach($list as $k=>$v){
				$id = explode(',',$v['imgs']);
					foreach($id as $key=>$val){
						$title[$k][$val] = $img->where(array('token'=>$this->token,'id'=>$val))->getField('title');
					}
				$list[$k]['title'] = $title[$k]; 
			}
			$this->assign('list',$list);
			$this->assign('page',$p);
		}
		$this->display();
	}
	
	
	public function multiSave(){
		$keywords = $this->_post('keywords','trim');
		$imgs = $this->_post('imgids');
		$imgs = trim($imgs,',');
		
		if(!$keywords) $this->error('请填写关键词。');
		if(!$imgs) $this->error('请选择图文消息。');
		
		if(M('Img_multi')->where(array('token'=>$this->token,'keywords'=>$keywords))->getField(id)){
			$this->error('这个关键词已经存在了，请换个关键词哦。');
		}
		
		$data['imgs'] = $imgs;
		$data['keywords'] = $keywords;
		$data['token'] = $this->token;
		$data['__hash__'] = $_POST['__hash__'];
		$multi = M('Img_multi');
		if($multi->create($data)){
			if($multiid = $multi->add($data)){
				$keyInfo['keyword'] = $keywords;
				$keyInfo['token'] = $this->token;
				$keyInfo['module'] = 'Multi';
				$keyInfo['pid'] = $multiid;
				if(M('Keyword')->add($keyInfo)){
					$this->success('保存成功',U('Img/multi',array('tip'=>2)));
				}
			}else{
				$this->error('保存失败，请稍后再试~');
			}
		
		}else{
			$this->error($multi->getError());
		}
	}
	
	
	
}
?>
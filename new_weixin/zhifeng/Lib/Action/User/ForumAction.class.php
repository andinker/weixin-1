<?php
class ForumAction extends UserAction{
	
	
	public function _initialize() {
		parent::_initialize();
			$this->canUseFunction('forum');
		}
		
	//帖子管理
	public function index(){
		
		$catid=intval($_GET['catid']);
		$catid=empty($catid)?0:$catid;
		
		$topics = M('Forum_topics');
		
		$token = $this->token;

		$where = array('token'=>$token);
		if (!empty($catid)) $where['catid']=$catid; 
		
		$count      = $topics->where( $where )->count();
        $Page       = new Page($count,10);
        $show       = $Page->show();
		$list = $topics->where( $where )->order('status ASC,createtime DESC')->limit($Page->firstRow.','.$Page->listRows)->select();

		foreach ($list as $k=>$v){
		
			$list[$k]['content'] = htmlspecialchars_decode($v['content']);
		}
		
		
		// 读取分类数据
		$cats = M('Forum_cats')->select();
		$this->assign('cats',$cats);
		
		$this->assign('tabid',1);
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->display();
		
	}
	
	//评论管理
	public function comment(){
	
		$comment = M('Forum_comment');

		$token = $this->token;
		$where = array('token'=>$token);
		$count      = $comment->where( $where )->count();
        $Page       = new Page($count,10);
        $show       = $Page->show();
		$list = $comment->where( $where )->order('status ASC,createtime DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
		
		foreach ($list as $k=>$v){
		
			$list[$k]['content'] = htmlspecialchars_decode($v['content']);
		}
		
		$this->assign('tabid',2);
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->display();
	
	}
	//消息管理
	public function message(){
	
		$message = M('Forum_message');

		$token = $this->token;
		$where = array('token'=>$token);
		$count      = $message->where( $where )->count();
        $Page       = new Page($count,10);
        $show       = $Page->show();
		$list = $message->where( $where )->order('createtime DESC')->limit($Page->firstRow.','.$Page->listRows)->select();		
		
		$this->assign('tabid',3);
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->display();
	
	}
	//删除消息
	public function delMessage(){
	
		$id = $this->_request('id','intval');

		$token = $this->token;
		if(empty($id)){
			$this->error('请勾选要删除的内容');
		}
		
		if(is_array($id)){
		
			$id = implode(',',$id);
			$where = "token = '$token' AND id in($id)";
			
		}else{	
			$where = "token = '$token' AND id = $id";
		}
		
		if(M('Forum_message')->where( $where )->delete()){
		
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
		
	}
	//删除评论
	public function delComment(){
	
		$id = $this->_request('id','intval');

		$token = $this->token;
		if(empty($id)){
			$this->error('请勾选要删除的内容');
		}
		
		if(is_array($id)){
		
			$id = implode(',',$id);
			$where = "token = '$token' AND id in($id)";
			
		}else{	
			$where = "token = '$token' AND id = $id";
		}
		
		if(M('Forum_comment')->where( $where )->delete()){
		
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
		
	}
	
	//审核帖子
	public function checkTopics(){
	
		$id = $this->_request('id','intval');
		
		$token = $this->token;
				
		if(empty($id)){
			$this->error('请勾选要通过审核的内容');
		}
		
		if(is_array($id)){
		
			$id = implode(',',$id);
			$where = "token = '$token' AND id in($id)";
			
		}else{	
			$where = "token = '$token' AND id = $id";
		}
		
		if(M('Forum_topics')->where( $where )->setField('status',1)){
		
			$this->success('审核成功');
		}else{
			$this->error('审核失败');
		}
	
	}
	
	//删除帖子
	public function delTopics(){
	
		$id = $this->_get('id','intval');

		$token = $this->token;
		

	//查帖子信息
		$topics = M('Forum_topics');
		$data = $topics->field('photos')->where("token = '$token' AND id = $id")->find();
	//删除硬盘上图片	
		if($data['photos'] != NULL){
			$photos = explode(',',$data['photos']);
			$photoNum = count($photos);
			for($i=0;$i<$photoNum;$i++){
				$site = C('site_url').'/';
				$photos[$i] = str_replace("$site",'',$photos[$i]);
				$res = @unlink($photos[$i]);
			}
		}
	
	
	//删除对应评论
		$comment = M('Forum_comment');
		$res2 = $comment->where("tid = $id AND token = '$token'")->delete();
	//删除对应的消息
		$message = M('Forum_message');
		$res3 = $message->where("token = '$token' AND tid = $id")->delete();
	//删除帖子记录
		$res4 = $topics->where("token = '$token' AND id = $id")->delete();
		

		$this->success('删除成功');

	
	}
	
	
	//论坛配置页面
	public function config(){
	

		$token = $this->token;
		$conf = M('Forum_config')->where("token = '$token'")->find();
		$logo = M('Home')->field('logo')->where("token = '$token'")->find();
		$wxname = M('Wxuser')->field('wxname')->where("token = '$token'")->find();
		if($conf['logo'] == NULL){
			if($logo['logo'] == NULL){
				$conf['logo'] = '/tpl/Wap/default/common/images/forum/face.png';
			}else{
				$conf['logo'] = $logo['logo'];
			}
		}
		$this->assign('tabid',4);
		$this->assign('wxname',$wxname['wxname']);
		$this->assign('conf',$conf);
		$this->assign('token',$token);
		
		$this->display();
	}
	
	//论坛配置提交处理
	public function set(){

		$token = $this->token;
		$data['forumname'] = $this->_post('forumname');
		$data['logo'] = $this->_post('logo');
		$data['intro'] = $this->_post('intro');
		$data['picurl'] = $this->_post('picurl');
		$data['bgurl'] = $this->_post('bgurl');
		$data['ischeck'] = $this->_post('ischeck','intval');
		$data['comcheck'] = $this->_post('comcheck','intval');
		$data['isopen'] = $this->_post('isopen','intval');
		$data['token'] = $token;
		
		$conf = M('Forum_config');
		$res = $conf->field('id')->where("token = '$token'")->find();
		
		if(empty($res)){
			if($conf->create()){
			
					if($conf->add($data)){
						$this->success('操作成功');
					}else{
						$this->error('操作失败');
					}
			}else{
				$this->error('系统错误');
			}
		}else{
			if($conf->where("token = '$token'")->setField($data)){
				$this->success('操作成功');
			}else{
				$this->error('操作失败');
			}
		}
		
	}
	
	//审核评论
	public function checkComment(){
		
		$id = $this->_request('id','intval');
		
		$token = $this->token;
				
		if(empty($id)){
			$this->error('请勾选要通过审核的内容');
		}
		
		if(is_array($id)){
		
			$id = implode(',',$id);
			$where = "token = '$token' AND id in($id)";
			
		}else{	
			$where = "token = '$token' AND id = $id";
		}
		
		if(M('Forum_comment')->where( $where )->setField('status',1)){
		
			$this->success('审核成功');
		}else{
			$this->error('审核失败');
		}
	
	
	}
	

	public function cats(){
		$parentid=intval($_GET['parentid']);
		$parentid=$parentid==''?0:$parentid;
		$data=M('Forum_cat');
		$where=array('parentid'=>$parentid,'token'=>session('token'));
		if(IS_POST){
			$key = $this->_post('searchkey');
			if(empty($key)){
				$this->error("关键词不能为空");
			}
			$map['token'] = $this->_get('token');
			$map['name|des'] = array('like',"%$key%");
			$list = $data->where($map)->select();
			$count      = $data->where($map)->count();
			$Page       = new Page($count,20);
			$show       = $Page->show();
		}else{
			$count      = $data->where($where)->count();
			$Page       = new Page($count,20);
			$show       = $Page->show();
			$list = $data->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
		}
		$this->assign('page',$show);
		$this->assign('list',$list);
		if ($parentid){
			$parentCat = $data->where(array('id'=>$parentid))->find();
		}
		$this->assign('parentCat',$parentCat);
		$this->assign('parentid',$parentid);
		$this->display();
	}
	
	public function catAdd(){
		if(IS_POST){
			$this->insert('Forum_cat','/cats?parentid='.$this->_post('parentid'));
		}else{
			$parentid=intval($_GET['parentid']);
			$parentid=$parentid==''?0:$parentid;
			//查询所有分类
			$catlist =M('Forum_cat')->where("token='".$this->token."'")->select();
			$this->assign('catlist',$catlist);
			$this->assign('parentid',$parentid);
			$this->display('catSet');
		}
	}
	
	public function catDel(){
		if($this->_get('token')!=session('token')){$this->error('非法操作');}
		$id = $this->_get('id');
		if(IS_GET){
			$where=array('id'=>$id,'token'=>session('token'));
			$data=M('Forum_cat');
			$check=$data->where($where)->find();
			if($check==false)   $this->error('非法操作');
			$product_model=M('Product');
			$productsOfCat=$product_model->where(array('catid'=>$id))->select;
			if (count($productsOfCat)){
				$this->error('本分类下有商品，请删除商品后再删除分类',U('Forum/cats',array('token'=>session('token'))));
			}
			$back=$data->where($wehre)->delete();
			if($back==true){
				$this->success('操作成功',U('Forum/cats',array('token'=>session('token'),'parentid'=>$check['parentid'],'dining'=>1)));
			}else{
				$this->error('服务器繁忙,请稍后再试',U('Forum/cats',array('token'=>session('token'))));
			}
		}
	}
	
	public function catSet(){ 
		$id = $this->_get('id');
		$checkdata = M('Forum_cat')->where(array('id'=>$id))->find();
		if(empty($checkdata)){
			$this->error("没有相应记录.您现在可以添加.",U('Forum/catAdd'));
		}
		if(IS_POST){
			$data=D('Forum_cat');
			$where=array('id'=>$this->_post('id'),'token'=>session('token'));
			$check=$data->where($where)->find();
			if($check==false)$this->error('非法操作');
			if($data->create()){
				if($data->where($where)->save($_POST)){
						
					$this->success('修改成功',U('Forum/cats',array('token'=>session('token'),'parentid'=>$this->_post('parentid'),'dining'=>1)));
						
				}else{
					$this->error('操作失败');
				}
			}else{
				$this->error($data->getError());
			}
		}else{
			//查询所有分类
			$catlist =M('Forum_cat')->where("token='".$this->token."' and id <> '$id'")->select();
			$this->assign('catlist',$catlist);
			$this->assign('parentid',$checkdata['parentid']);
			$this->assign('set',$checkdata);
			$this->display();
	
		}
	}

	
}
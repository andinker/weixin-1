<?php

/**
 * 通用模板管理
 * */
class TmplsAction extends UserAction {
    public function _initialize()
    {
        parent::_initialize();
        //一站到底
        $this->canUseFunction('shouye');
    }

    public function index() {
        $db = D('Wxuser');
        $where['token'] = session('token');
        $where['uid'] = session('uid');
        $info = $db->where($where)->find();
        $this->assign('info', $info);
		$tmplsdb=M('Tmpls');
		$indextpl=S('indextpl_'.$where['token']);
		if(empty($indextpl)){
			$indextpl=$tmplsdb->where(array('type'=>1,'status'=>1))->order('sort desc,id DESC')->select();
			S('indextpl_'.$where['token'],$indextpl,3600);//缓存数据，减少数据库查询量
		}
		$this->assign('indextpl',$indextpl);
		$liststpl=$tmplsdb->where(array('type'=>2,'status'=>1))->order('sort asc,id DESC')->select();
		$this->assign('liststpl',$liststpl);
		$contenttpl=$tmplsdb->where(array('type'=>3,'status'=>1))->order('sort asc,id DESC')->select();
		$this->assign('contenttpl',$contenttpl);
		$url='http://'.$_SERVER['HTTP_HOST'].U('Wap/Index/index',array('token'=>$where['token']));
		$wapimgurl=$this->cerateQRfromliantu($url,200);
		$this->assign('wapimgurl',$wapimgurl);
        $this->display();
    }
	
    public function add() {
        $gets = $this->_get('style');		
        $views = $this->_get('views');
        $db = M('Wxuser');
		$data['tpltypeid'] =  $gets;
		if(!empty($views)){
			$data['tpltypename'] = $views;
		}else{
			$data['tpltypename'] = $gets.'_index';
		}
		$where['token'] = session('token');
        $db->where($where)->save($data);
        M('Home')->where(array('token'=>session('token')))->save(array('advancetpl'=>0));
    }

    public function lists() {
        $gets = $this->_get('style');
		$views = $this->_get('views');
        $db = M('Wxuser');		
		$data['tpllistid'] =  $gets;
		if(!empty($views)){
			$data['tpllistname'] = $views;
		}else{			
			$data['tpllistname'] = 'list'.$gets;  
		}     
        $where['token'] = session('token');
        $db->where($where)->save($data);
    }
	public function clearScache($token){
		S('indextpl_'.$where['token'],NULL);
		$this->success('清除成功',U('Tmpls/index'));
	}
    public function content() {
        $gets = $this->_get('style');
		$views = $this->_get('views');
        $db = M('Wxuser');
		$data['tplcontentid'] = $gets;
		if(!empty($views)){
			$data['tplcontentname'] = $views;
		}else{			
			$data['tplcontentname'] = 'content'.$gets;  
		}   
        $where['token'] = session('token');
        $db->where($where)->save($data);
    }
    
    public function background() {
        $data['color_id'] = $this->_get('style');
        $db = M('Wxuser');
        $where['token'] = session('token');
        $db->where($where)->save($data);
    }

    public function insert(){
		/*$tmpls= M('Tmpls');
        $str='INSERT INTO  __TABLE__ (`tplid`, `name`, `views`, `type`, `imgurl`, `info`, `attr`, `status`, `sort`) VALUES ';
		for($i=16;$i<71;$i++){
			$str.="('y".$i."', '模板".$i."', '', 1, '/images/cate1".$i.".png', '模板".$i."', 'yesmenutpl', 1, 255),";
		}
		 $str= substr($str, 0, -1).";";
		$tmpls->execute($str);
		echo M()->getLastSql();
		 */
		/* $tmpls= M('Tmpls');
        $str='INSERT INTO  __TABLE__ (`tplid`, `name`, `views`, `type`, `imgurl`, `info`, `attr`, `status`, `sort`) VALUES ';
		
		//lists
		for($i=0;$i<9;$i++){
			$str.="('".$i."', '列表".$i."', '', 2, '/tmplimg/list-".$i.".png', '列表".$i."', '', 1, 255),";
		}
			//content
		for($i=1;$i<8;$i++){
			$str.="('".$i."', '详情".$i."', 'content".$i."', 3, '/tmplimg/detail-".$i.".png', '详情".$i."', '', 1, 255),";
		}
		 $str= substr($str, 0, -1).";";
		$tmpls->execute($str);
		echo M()->getLastSql();*/
    }

    public function upsave() {
	
    }

}

?>
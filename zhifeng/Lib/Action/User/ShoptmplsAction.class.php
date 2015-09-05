<?php

/**
 * 通用模板管理
 * */
class ShoptmplsAction extends UserAction {

    public function index() {
        $db = D('Wxuser');
        $where['token'] = session('token');
        $where['uid'] = session('uid');
        $info = $db->where($where)->find();
        $this->assign('info', $info);
		require APP_PATH.'/Lib/ORG/Shop.Tpl.php';
		require APP_PATH.'/Lib/ORG/Shoplist.Tpl.php';
		foreach($shoptpl as $k=>$v){
			$sort[$k] = $v['sort'];
			$tpltypeid[$k] = $v['tpltypeid'];
		}
		array_multisort($sort, SORT_DESC , $tpltypeid , SORT_DESC ,$shoptpl);
		
		$this->assign('info', $info);
		$this->assign('shoptpl',$shoptpl);
		$this->assign('shoplisttpl',$shoplisttpl);
        $this->display();
    }

    public function add(){		
        $gets = $this->_get('style');
        $views = $this->_get('views');
        $db = M('Wxuser');
		$data['shoptpltypeid'] =  $gets;
		if(!empty($views)){
			$data['shoptpltypename'] = $views;
		}else{
			$data['shoptpltypename'] = $gets.'_index';
		}
		$where['token'] = session('token');
        $db->where($where)->save($data);       
    }	
	public function lists(){		
        $gets = $this->_get('style');
        $views = $this->_get('views');
        $db = M('Wxuser');
		$data['shoplistid'] =  $gets;
		if(!empty($views)){
			$data['shoplistname'] = $views;
		}else{
			$data['shoplistname'] = $gets.'_index';
		}
		$where['token'] = session('token');
        $db->where($where)->save($data);       
    }
}
   
?>
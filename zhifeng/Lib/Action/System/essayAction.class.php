<?php
class essayAction extends BackAction{
	protected function _initialize(){
        parent::_initialize();		
		$this->pid=$this->_get('pid','intval');
		$this->level=$this->_get('level','intval');
		
		$this->assign('pid',$this->pid);		
		$this->assign('level',$this->level);
		$this->db=D('essay');
		$this->cate_db=D('essay_cate');
	}

	public function index(){
		$db=D('essay');
		$count=$db->order('sort ASC')->count();
		$page=new Page($count,25);
		$info=$db->order('sort ASC')->limit($page->firstRow.','.$page->listRows)->select();
		foreach($info as $k=>$v){
			$info[$k]['cate']=$this->cate_db->field('name')->where(array('id'=>$v['cid']))->find();
		}
		$this->assign('page',$page->show());
		$this->assign('info',$info);
		$this->display();
	}
	public function set(){
		$id=$this->_get('id','intval');		
		$essay=$this->db->where(array('id'=>$id))->find();
		if(IS_POST){
			$time=time();
			$_POST['updatetime']=$time;
			$urlarray=array('pid'=>$this->pid,'level'=>$this->level);
			if($_POST['id']){				
				$status=$this->db->where(array('id'=>$_POST['id']))->save($_POST);
				$status?$this->success('保存成功',U('essay/index',$urlarray)):$this->error('保存失败',U('essay/index',$urlarray));
			}else{
				$_POST['time']=$time;
				$status=$this->db->add($_POST);
				$status?$this->success('添加成功',U('essay/index',$urlarray)):$this->error('添加失败',U('essay/index',$urlarray));
			}
		}else{
			$essay_cate=$this->cate_db->where(array('status'=>1))->order('sort ASC')->select();
			if($essay){
				$this->assign('info',$essay);
				$this->assign('title','编辑文章');
			}
			$this->assign('essay_cate',$essay_cate);
			$this->display();
		}
	}
	
	public function del(){
		$id=$this->_get('id','intval');
		if($this->db->delete($id)){
			$this->success('操作成功',U(MODULE_NAME.'/index'));
		}else{
			$this->error('操作失败',U(MODULE_NAME.'/index'));
		}
	}
	/*
	**cate
	*/
	public function cateIndex(){
		$db=D('essay_cate');
		/*$count=$db->count();
		$page=new Page($count,25);
		$info=$db->order('sort ASC')->limit($page->firstRow.','.$page->listRows)->select();
		$this->assign('page',$page->show());
		$this->assign('info',$info);*/
		$info=$db->order('sort')->select();
		$html_tree = $this->list_to_tree($info);
		dump($html_tree);exit;
		$this->assign('info',$html_tree);
		$this->display();
	}
	
	/**
 * 把返回的数据集转换成Tree
 * @param array $list 要转换的数据集
 * @param string $pid parent标记字段
 * @param string $level level标记字段
 * @return array
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function list_to_tree($list, $pk='id', $pid = 'pid', $child = '_child', $root = 0) {
    // 创建Tree
    $tree = array();
    if(is_array($list)) {
        // 创建基于主键的数组引用
        $refer = array();
        foreach ($list as $key => $data) {
            $refer[$data[$pk]] =& $list[$key];
        }
        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId =  $data[$pid];
            if ($root == $parentId) {
                $tree[] =& $list[$key];
            }else{
                if (isset($refer[$parentId])) {
                    $parent =& $refer[$parentId];
                    $parent[$child][] =& $list[$key];
                }
            }
        }
    }
    return $tree;
}

/**
 * 将list_to_tree的树还原成列表
 * @param  array $tree  原来的树
 * @param  string $child 孩子节点的键
 * @param  string $order 排序显示的键，一般是主键 升序排列
 * @param  array  $list  过渡用的中间数组，
 * @return array        返回排过序的列表数组
 * @author yangweijie <yangweijiester@gmail.com>
 */
function tree_to_list($tree, $child = '_child', $order='id', &$list = array()){
    if(is_array($tree)) {
        $refer = array();
        foreach ($tree as $key => $value) {
            $reffer = $value;
            if(isset($reffer[$child])){
                unset($reffer[$child]);
                tree_to_list($value[$child], $child, $order, $list);
            }
            $list[] = $reffer;
        }
        $list = list_sort_by($list, $order, $sortby='asc');
    }
    return $list;
}


	//cateset
	public function cateset(){
		if(IS_POST){
			$time=time();
			if($_POST['id']){				
				$status=$this->cate_db->where(array('id'=>$_POST['id']))->save($_POST);
				$status?$this->success('保存成功',U('essay/cateIndex')):$this->error('保存失败',U('essay/cateIndex'));
			}else{
				$status=$this->cate_db->add($_POST);
				$status?$this->success('添加成功',U('essay/cateIndex')):$this->error('添加失败',U('essay/cateIndex'));
			}
		}else{		
			$id=$this->_get('id','intval');
			$essay=$this->cate_db->where(array('id'=>$id))->find();
			if($essay){
				$this->assign('info',$essay);
				$this->assign('title','编辑文章');
			}
			$this->display();
		}
	}
	//catedel
	public function catedel(){
		$id=$this->_get('id','intval');
		$essaycount=$this->db->where(array('cid'=>$id))->count();
		if($essaycount){
			if($this->db->delete($id)){
				$this->success('操作成功',U(MODULE_NAME.'/cateIndex'));
			}else{
				$this->error('操作失败',U(MODULE_NAME.'/cateIndex'));
			}
		}else{
			$this->error('此分类下还有文章没有删除！',U(MODULE_NAME.'/index'));
		}
		
	}
	
}
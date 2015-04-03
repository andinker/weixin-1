<?php
class RegionAction extends BaseAction{
	
	public function addregionitem() {
		
		//检查要添加的项类型，省、市、区、小区
		$item_type = empty($_GET['type']) ? NULL : $_GET['type'];
		if (empty($item_type)) $this->error('没有指定要添加的区域项类型！');
		
		$item_types = array('province','city','district','community');
		
		if ( !in_array($item_type,$item_types) ){
			$this->error('非法的区域项类型！');
		}else{
			
			// 设置模板显示的控件类型
			$this->assign('type',$item_type);
			
			$pid_col_name = NULL;
			$p_db = NULL;
			$db = NULL;
			
			switch ($item_type) {
				case 'province':
					$db = M('region_province');
					break;
			
				case 'city':
					$pid_col_name = 'province_id';
					$p_db = M('region_province');
					$db = M('region_city');
					break;
			
				case 'district':
					$pid_col_name = 'city_id';
					$p_db = M('region_city');
					$db = M('region_district');
					break;
						
				case 'community':
					$pid_col_name = 'district_id';
					$p_db = M('region_district');
					$db = M('region_community');
					break;
			}
			
			//获取要显示的控件数据，即父级项列表
			if ( !empty($p_db) ) {
				if (!empty($_GET['pid'])){
					$p_items = $p_db->where(array($pid_col_name=>intval($_GET['pid'])))->select();
				}else{
					$p_items = $p_db->select();
				}
				$this->assign('p_items',$p_items);
			}else{
				$this->assign('p_items',NULL);
			}
			
			//获取未审核的本级数据
			if (!empty($_GET['pid'])){
				$perItems_where = array($pid_col_name=>intval($_GET['pid']),'status'=>0);
			}else{
				$perItems_where = array('status'=>0);
			}
			$preItems = $db->where($perItems_where)->order('id desc')->select();
			if (!empty($preItems)){
				$this->assign('preItems',$preItems);
			}else{
				$this->assign('preItems',NULL);
			}
			
			// 如果是表单提交操作，那么插入数据
			if (IS_POST){
				
				$p_item = empty($_POST['p_item']) ? NULL : intval($_POST['p_item']);
				if (empty($p_item) && $item_type != 'province') $this->error('非法的父项！');
				
				$new_item_name = empty(trim($_POST['new_item_name'])) ? NULL : trim($_POST['new_item_name']);
				if (empty($new_item_name)) $this->error('区域名称不能为空！');
				
				// 检查项是否已经存在
				$check_rs = $db->where(array('name'=>$new_item_name))->select();
				if (count($check_rs) > 0) $this->error('区域['.$new_item_name.']已经存在！');
				
				// 把数据插入数据库
				$data['name'] = $new_item_name;
				if (!empty($pid_col_name)) $data[$pid_col_name] = $p_item;
				
				if ($db->add($data) ){
					$this->success('数据插入成功！');
				}else{
					$this->error('数据插入失败！');
				}
				
			}
			
		}
		
		$this->display();
		
		
	}
	
}
<?php
class ClasspageAction extends UserAction{

	public $token;
	public $product_model;
	public $product_cat_model;
	public $isDining;
	public function _initialize() {
		parent::_initialize();
		$this->token=session('token');
		$this->canUseFunction('shop');
		//查询店铺
		$Companys =M('Company')->where(array('token'=>$this->token))->select();
		if(!$Companys){
			$this->error('请设置lbs公司信息',U('Company/index',array('token'=>$this->token)));
		}
		$this->Companys=$Companys;
		$this->Payment_db=M('payment');
		$this->assign('Companys',$Companys);
	}
	
	
	public function edit(){
		
		$m = M('WxuserSiteClasspagecontent');
		
		$data = $m->where(array('token'=>$this->token))->select();
		
		if (count($data) < 1){
			
			do {
				$m->add( array('token'=>$this->token) );
				$data = $m->where(array('token'=>$this->token))->select();
			}while (count($data) < 1);
			
		}

		
		//读取文章分类数据，作为公告的设置值
		$db=D('Classify');
		$where['token']=session('token');
		$thisClassify=$db->where($where)->select();
		$this->assign('thisClassify',$thisClassify);
		
		//print_r($thisClassify); 
		
		if (IS_POST){
			
			$posted_data['id']  = $data[0]['id'];
			
			$posted_data['announcements_class_id']   = $_POST['announcements'];
			$posted_data['content_html']             = $_POST['info'];

			$posted_data['content_menu1_title']      = $_POST['menu_1_name'];
			$posted_data['content_menu1_item1_text'] = $_POST['menu_1_item_1_name'];
			$posted_data['content_menu1_item1_link'] = $_POST['menu_1_item_1_url'];
			$posted_data['content_menu1_item2_text'] = $_POST['menu_1_item_2_name'];
			$posted_data['content_menu1_item2_link'] = $_POST['menu_1_item_2_url'];
			$posted_data['content_menu1_item3_text'] = $_POST['menu_1_item_3_name'];
			$posted_data['content_menu1_item3_link'] = $_POST['menu_1_item_3_url'];
			$posted_data['content_menu1_item4_text'] = $_POST['menu_1_item_4_name'];
			$posted_data['content_menu1_item4_link'] = $_POST['menu_1_item_4_url'];
			$posted_data['content_menu1_item5_text'] = $_POST['menu_1_item_5_name'];
			$posted_data['content_menu1_item5_link'] = $_POST['menu_1_item_5_url'];
			$posted_data['content_menu1_item6_text'] = $_POST['menu_1_item_6_name'];
			$posted_data['content_menu1_item6_link'] = $_POST['menu_1_item_6_url'];

			$posted_data['content_menu2_title']      = $_POST['menu_2_name'];
			$posted_data['content_menu2_item1_text'] = $_POST['menu_2_item_1_name'];
			$posted_data['content_menu2_item1_link'] = $_POST['menu_2_item_1_url'];
			$posted_data['content_menu2_item2_text'] = $_POST['menu_2_item_2_name'];
			$posted_data['content_menu2_item2_link'] = $_POST['menu_2_item_2_url'];
			$posted_data['content_menu2_item3_text'] = $_POST['menu_2_item_3_name'];
			$posted_data['content_menu2_item3_link'] = $_POST['menu_2_item_3_url'];
			$posted_data['content_menu2_item4_text'] = $_POST['menu_2_item_4_name'];
			$posted_data['content_menu2_item4_link'] = $_POST['menu_2_item_4_url'];
			$posted_data['content_menu2_item5_text'] = $_POST['menu_2_item_5_name'];
			$posted_data['content_menu2_item5_link'] = $_POST['menu_2_item_5_url'];
			$posted_data['content_menu2_item6_text'] = $_POST['menu_2_item_6_name'];
			$posted_data['content_menu2_item6_link'] = $_POST['menu_2_item_6_url'];

			$posted_data['content_menu3_title']      = $_POST['menu_3_name'];
			$posted_data['content_menu3_item1_text'] = $_POST['menu_3_item_1_name'];
			$posted_data['content_menu3_item1_link'] = $_POST['menu_3_item_1_url'];
			$posted_data['content_menu3_item2_text'] = $_POST['menu_3_item_2_name'];
			$posted_data['content_menu3_item2_link'] = $_POST['menu_3_item_2_url'];
			$posted_data['content_menu3_item3_text'] = $_POST['menu_3_item_3_name'];
			$posted_data['content_menu3_item3_link'] = $_POST['menu_3_item_3_url'];
			$posted_data['content_menu3_item4_text'] = $_POST['menu_3_item_4_name'];
			$posted_data['content_menu3_item4_link'] = $_POST['menu_3_item_4_url'];
			$posted_data['content_menu3_item5_text'] = $_POST['menu_3_item_5_name'];
			$posted_data['content_menu3_item5_link'] = $_POST['menu_3_item_5_url'];
			$posted_data['content_menu3_item6_text'] = $_POST['menu_3_item_6_name'];
			$posted_data['content_menu3_item6_link'] = $_POST['menu_3_item_6_url'];
			
			$posted_data['content_goodslist1_ids']   = $_POST['adgoods_1_data'];
			$posted_data['content_goodslist2_ids']   = $_POST['adgoods_2_data'];
			$posted_data['content_goodslist3_ids']   = $_POST['adgoods_3_data'];
			$posted_data['content_goodslist4_ids']   = $_POST['adgoods_4_data'];

			$posted_data['content_banner_1']         = $_POST['banner_1']; 
			$posted_data['content_banner_2']         = $_POST['banner_2'];
			$posted_data['content_banner_3']         = $_POST['banner_3'];
			
			
			if ( $m ->save($posted_data) ) $this->success('保存成功');
			else {
				$this->error('保存失败，请稍后再试~');
				//echo $m->getLastSql();
				//echo $m->getDbError();
				//print_r($posted_data);
			}
			
			exit();
			
		}
		
		$this->assign('content',$data[0]);
		
		
		$this->display();
	}
	
	
	public function showgoods(){
		
		//根据GET[]中的ID串
		$ids = explode(',',$_GET['ids']);
		
		foreach ($ids as $k=>$v){
			
			if (empty($v)) unset($ids[$k]);
				
			
		}
		
		$ids_str = implode(",", $ids);
		
		$product_model=M('Product'); 
		$list = $product_model->where('`id` in ('. $ids_str .')')->order('id desc')->select();
		//echo $product_model->getLastSql();
		foreach($list as $k=>$v){
			$list[$k]['catname']=M('Product_cat')->where(array('id'=>$v['catid']))->getField('name');
		}
		
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->assign('isProductPage',1);
		
		$this->display();
	}
	
	
	Public function selectgoods() {

		$product_model=M('Product');
		$where['dining']=0;
		$where['groupon']=0;

			$count      = $product_model->where($where)->count();
			$Page       = new Page($count,20);
			$Page->setConfig('theme','<span style="font-size:16px;">共 %totalRow% %header% %first% %prePage% %upPage% <span style="color:red;">%linkPage%</span> %downPage% %nextPage% %end% 第 %nowPage% 页/共 %totalPage% 页</span>');
			$show       = $Page->show();
			$list = $product_model->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();

			
		foreach($list as $k=>$v){
			$list[$k]['catname']=M('Product_cat')->where(array('id'=>$v['catid']))->getField('name');
		}

		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->assign('isProductPage',1);
		
		$this->display();
	}
	
}
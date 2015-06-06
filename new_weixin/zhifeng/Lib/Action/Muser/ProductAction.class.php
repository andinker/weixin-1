<?php
class ProductAction extends MuserAction{
	public function product_list() {
		
		
		$catid=intval($_GET['catid']);
		$catid=$catid==''?0:$catid;
		$product_model=M('Product');
		$product_cat_model=M('Product_cat');
		$where=array('token'=>session('token'));
		if ($catid){	$where['catid']=$catid;		}
		$where['dining']=0;
		$where['groupon']=0;
		if(IS_POST){
			$key = $this->_post('searchkey');
			if(empty($key)){
				$this->error("关键词不能为空");
			}
			$map['token'] = $this->_get('token');
			$map['name'] = array('like',"%$key%");
			$list = $product_model->where($map)->select();
			$count      = $product_model->where($map)->count();
			$Page       = new Page($count,5);
			$show       = $Page->show();
		}else{
			$count      = $product_model->where($where)->count();
			$Page       = new Page($count,5);
			$show       = $Page->show();
			$list = $product_model->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		}
		foreach($list as $k=>$v){
			$list[$k]['catname']=M('Product_cat')->where(array('id'=>$v['catid']))->getField('name');
		}
		$this->assign('catid',$catid);
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->assign('isProductPage',1);
		
		$this->assign('PAGE_TITLE','商品列表'); 
		$this->display();
	}
	
	public function product_edit(){

		$catid = intval($_GET['catid']);	// 正在编辑或添加的产品的类别ID
		$id = intval($_GET['id']);			// 正在编辑的产品的ID
		
		// 读取产品类别的数据记录
		if($productCatData = M('Product_cat')->where(array('id' => $catid, 'token' => session('token')))->find()){
			$this->assign('catData', $productCatData);
		} else {
			$this->error("没有选择相应的分类.", U('Store/index'));
		}
		
		//读取当前产品类别的 “规格”和“外观”设置，可能会分别都有多条记录，type=0的记录是规格，type=1的记录是外观
		$normsData = M("Product_norms")->where(array('catid' => $catid))->select();
		$colorData = $formatData = array();
		foreach ($normsData as $row) {
			if ($row['type']) {
				$colorData[] = $row;
			} else {
				$formatData[] = $row;
			}
			$normsList[$row['id']] = $row['value'];
		}
		
		// 如果是编辑已经存在数据，那么根据产品ID查找数据库记录
		if ($id && ($product = M('Product')->where(array('catid' => $catid, 'token' => session('token'), 'id' => $id))->find())) {
			
			// 读取产品的自定义属性值
			$attributeData = M("Product_attribute")->where(array('pid' => $id))->select();
			// 读取产品的，不同的 “规格”和“外观”组合下的，“价格”、“会员价”、“库存”数据
			$productDetailData = M("Product_detail")->where(array('pid' => $id))->select();
			
			// 读取产品展示图（在一般情况下是每个产品6张）
			$productimage = M("Product_image")->where(array('pid' => $id))->select();
			
			
			$colorList = $formatList = $pData = array();
			foreach ($productDetailData as $p) {
				$p['formatName'] = $normsList[$p['format']];
				$p['colorName'] = $normsList[$p['color']];
				$formatList[] = $p['format'];
				$colorList[] = $p['color'];
				$pData[] = $p;
			}
			
			$this->assign('set', $product);
			$this->assign('formatList', $formatList);
			$this->assign('colorList', $colorList);
			$this->assign('imageList', $productimage);
			
			//print_r($formatList);
			//print_r($colorList); 
			//print_r($pData);
			
			
		} else { // 编辑新数据			
			
			// 当前分类的自定义属性
			$data = M("Product_attrs")->where(array('catid' => $catid))->select();
			$attributeData = array();
			foreach ($data as $row) {
				$row['aid'] = $row['id'];
				$row['id'] = 0;
				$attributeData[] = $row;
			}
			
		}
		
		
		// 读取小区号的微站分类
		/*     本公众号所属的帐号           */
		/*     帐号类型如果是小区，则读取本帐号下的第一个公众号的微站分类        */
		/* 否则查找本帐号的所属小区，再找到该小区的小区帐号，读取该帐号下的第一个公众号的微站分类 */
		/*  因此，关键是找到一个token，再去读取这个token下的微站分类数据 */
		$xq_user = null;
		if ($this->user['account_type'] == 1){
			$xq_user = $this->user;
		}else{
			if ($this->user['community_id'] != 0){
				$xq_user = M('Users')->where(array('community_id'=>$this->user['community_id'],'account_type'=>1))->find();
			}
		}
		
		$wz_category_data = NULL;
		if (!empty($xq_user)){
			$xq_wx = M('Wxuser')->where(array('uid'=>$xq_user['id']))->find();
			if (!empty($xq_wx)){
				$wz_category_data = M('Classify')->where(array(
						'token'=>$xq_wx['token'],
						'navpage_status'=>1
				))->select();
			}
		}
		//print_r($xq_user);
		//print_r($xq_wx);
		//print_r($wz_category_data);
		//处理分类的级别显示
		$wz_category_data = $this->makeLevelClassNames($wz_category_data);
		
		$this->assign('wz_cates',$wz_category_data);
		
		
		
		$this->assign('color', $this->color);
		$this->assign('attributeData', $attributeData);
		$this->assign('normsData', $normsData);
		$this->assign('colorData', $colorData);
		$this->assign('formatData', $formatData);
		$this->assign('productCatData', $productCatData);
		$this->assign('productDetailData', $pData);
		$this->assign('catid', $catid);
		$this->display();
		
	} 
	
	public function order_list() {
	
		$this->assign('PAGE_TITLE','订单列表');
		$this->display();
	}
}
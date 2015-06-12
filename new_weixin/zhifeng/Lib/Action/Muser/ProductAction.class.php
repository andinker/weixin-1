<?php
class ProductAction extends MuserAction{
	
	/**
	 * 列出某一类别的所有商品，如果没有指定类别，则列出所有商品
	 */
	public function product_list() {
		
		
		$catid=intval($_GET['catid']);
		$catid=$catid==''?0:$catid;
		
		// 读取产品类别的数据记录
		if($productCatData = M('Product_cat')->where(array('token' => session('token')))->select()){
			$this->assign('catData', $productCatData);
		}else{
			$this->assign('catData', null);
		}
		
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
	
	/**
	 *  编辑一个已存在数据库中的商品，或者添加一个新的商品
	 */
	public function product_edit(){

		$catid = intval($_GET['catid']);	// 正在编辑或添加的产品的类别ID
		$id = intval($_GET['id']);			// 正在编辑的产品的ID
		
		// 读取产品类别的数据记录
		if($productCatData = M('Product_cat')->where(array('id' => $catid, 'token' => session('token')))->find()){
			$this->assign('catData', $productCatData);
		} else {
			$this->error("没有选择相应的分类.", U('product_list'));
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
		
		
		
		
		$this->assign('PAGE_TITLE','编辑商品');
		$this->display();
		
	}
	
	/**
	 * 为一个已经保存到数据中的商品设置商品设置主图（缩略图）
	 */
	public function product_edit_setimage(){
		
		$catid = intval($_GET['catid']);	// 正在编辑或添加的产品的类别ID
		$id = intval($_GET['id']);			// 正在编辑的产品的ID
		
		if (empty($catid) || empty($id)) $this->error("参数不正确", U('product_list'));
		
		// 读取产品类别的数据记录
		if($productCatData = M('Product_cat')->where(array('id' => $catid, 'token' => session('token')))->find()){
			$this->assign('catData', $productCatData);
		} else {
			$this->error("没有选择相应的分类.", U('product_list'));
		}
		
		// 读取商品数据
		$product = M('Product')->where(array('catid' => $catid, 'token' => session('token'), 'id' => $id))->find();
		$this->assign('image',$product['logourl']);
		$this->assign('name',$product['name']);
		
		
		// 图片上传
		if (IS_POST){
			
			// 检查权限
			if (empty($_SESSION['token'])) {
				exit(json_encode(array('status'=>'error','msg'=>'你没有权限上传！')));
			}
			
			// 检查数据可靠性
			if (empty($_POST) || empty($_POST['image0'])){
				exit(json_encode(array('status'=>'error','msg'=>'检测不到上传数据，可能是因为上传数据的结构不是约定的！')));
			}
			
			// 保存图片数据为文件
			
			$upload_data = explode(",", $_POST['image0']);
			$upload_data = base64_decode($upload_data[1]);
			
			$get_image_url_path = null;
			$upload_dirname = $this->___init_ppc_data_dir($get_image_url_path); // 引用传参
			$save_image_filename = time().'_'.rand(10000,99999).'.png';
		
			$save_status = @file_put_contents($upload_dirname.'/'.$save_image_filename, $upload_data);
			
			if (empty($save_status)){
				exit(json_encode(array('status'=>'error','msg'=>($_POST['image0']).'由于服务器系统的原因，数据没能成功保存！')));
			}else{
				// 保存图片文件成功，修改数据库记录
				
				// 删除旧图片，如果有的话
				$this->___delete_ppc_file($product['logourl']);
				
				// 更新数据库记录
				M('Product')->where(array('catid' => $catid, 'token' => session('token'), 'id' => $id))->setField('logourl',$get_image_url_path.'/'.$save_image_filename);
				
				exit(json_encode(array('status'=>'success')));
			}
		}
		
		$this->assign('PAGE_TITLE','设置商品缩略图');
		$this->display();
	}
	
	/**
	 * 为一个已经保存到数据中的商品添加展示图片
	 */
	public function product_edit_uploadphotos(){
		
		$catid = intval($_GET['catid']);	// 正在编辑或添加的产品的类别ID
		$id = intval($_GET['id']);			// 正在编辑的产品的ID
		
		if (empty($catid) || empty($id)) $this->error("参数不正确", U('product_list'));
		
		// 读取产品类别的数据记录
		if($productCatData = M('Product_cat')->where(array('id' => $catid, 'token' => session('token')))->find()){
			$this->assign('catData', $productCatData);
		} else {
			$this->error("没有选择相应的分类.", U('product_list'));
		}
		
		// 读取商品数据
		$product = M('Product')->where(array('catid' => $catid, 'token' => session('token'), 'id' => $id))->find();
		$this->assign('name',$product['name']);
		
		// 读取产品展示图（在一般情况下是每个产品6张）
		$productimage = M("Product_image")->where(array('pid' => $id))->select();
		$this->assign('photos',$productimage);
		
		// 照片上传
		if (IS_POST){
			// 检查权限
			if (empty($_SESSION['token'])) {
				exit(json_encode(array('status'=>'error','msg'=>'你没有权限上传！')));
			}
				
			// 检查数据可靠性
			if (empty($_POST) || empty($_POST['image0'])){
				exit(json_encode(array('status'=>'error','msg'=>'检测不到上传数据，可能是因为上传数据的结构不是约定的！')));
			}
			
			$photos = array();
			
			foreach ($_POST as $key=>$image){
			
				// 保存照片数据为文件
				$upload_data = explode(",", $image);
				$upload_data = base64_decode($upload_data[1]);
					
				$get_image_url_path = null;
				$upload_dirname = $this->___init_ppc_data_dir($get_image_url_path); // 引用传参
				$save_image_filename = time().'_'.$key.'_'.rand(10000,99999).'.png';
				
				$save_status = @file_put_contents($upload_dirname.'/'.$save_image_filename, $upload_data);
				
				if ($save_status){
					array_push($photos, $get_image_url_path.'/'.$save_image_filename);
				}
			
			}
			
			
			if (empty($photos)){
				exit(json_encode(array('status'=>'error','msg'=>'由于服务器系统的原因，数据没能成功保存！')));
			}else{
				// 保存照片文件成功，修改数据库记录
				$add_count = 0;
				$img_html = '';
				foreach ($photos as $k=>$v){
					$photo_data = array('pid'=>$id,'image'=>$v);
					$add_status = M("Product_image")->add($photo_data);
					
					if ($add_status){
						$add_count++;
						$img_html = $img_html . $this->___make_ppc_htmlimgtags($add_status, $v);
					}
				}
				
				$intro_update_status = M('Product')->where(array('catid' => $catid, 'token' => session('token'), 'id' => $id))->setField('intro',$product['intro'].$img_html);
				$intro_update_msg = '但是未能把图片插入到商品详情介绍图文中';
				if ($intro_update_status){
					$intro_update_msg = '同时已成功把图片插入到商品详情介绍图文中';
				}
				exit(json_encode(array('status'=>'success','msg'=>'已经成功保存了'.$add_count.'张照片，'.$intro_update_msg)));
			}
		}
		
		
		$this->assign('PAGE_TITLE','添加商品照片');
		$this->display();
	}
	
	/**
	 * 删除一个展示图
	 */
	public function product_edit_deletephoto(){
		
		if (IS_POST){
		
			$catid = intval($_POST['catid']);	// 正在编辑或添加的产品的类别ID
			$pid = intval($_POST['pid']);			// 正在编辑的产品的ID
			$imageid = intval($_POST['imageid']);			// 正在删除的展示数据库ID
			
			if (empty($catid) || empty($pid) || empty($imageid)) exit(json_encode(array('status'=>'error','msg'=>'参数不正确')));
			
			$product = M('Product')->where(array('catid' => $catid, 'token' => session('token'), 'id' => $pid))->find();
			
			// 查找是否有该imageid的数据库记录
			$image = M("Product_image")->where(array('id'=>$imageid,'pid'=>$pid))->find();
			
			if (empty($image)){
				exit(json_encode(array('status'=>'error','msg'=>'在服务器找不到该展示图片')));
			}else{
				// 找到了展示图，进行删除
				$delete_status = M("Product_image")->where(array('id'=>$imageid,'pid'=>$pid))->delete();
				if ($delete_status) {
					
					// 删除文件
					$this->___delete_ppc_file($image['image']);
					
					// 删除商品描述中的IMG标签
					if (!empty($product)){
						$description_html = $this->___delete_ppc_htmltags($product['intro'],$imageid);
						M('Product')->where(array('catid' => $catid, 'token' => session('token'), 'id' => $pid))->setField('intro',$description_html);
					}
					
					exit(json_encode(array('status'=>'success','msg'=>'删除成功','intro'=>$description_html)));
				}else{
					exit(json_encode(array('status'=>'error','msg'=>'执行删除操作失败')));
				}
			}
			
		}
		
	}
	
	/**
	 * 列出当前店铺的所有分类
	 */
	public function category_list(){
		
		$parentid=intval($_GET['parentid']);
		$parentid=$parentid==''?0:$parentid;
		$data=M('Product_cat');
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
		
		$this->assign('PAGE_TITLE','分类列表');
		$this->display();
		
	}
	
	/**
	 * 编辑一个商品分类
	 */
	public function category_edit(){
		
		$this->assign('PAGE_TITLE','编辑分类');
		
		
		if(IS_POST){
				
			$data=D('Product_cat');
			
			$catid = $this->_post('id');
			
			if (empty($catid)){
				
				// 新增数据
				if($data->create()){
					if($data->add()){
				
						$this->success('添加成功',U('category_list',array('token'=>session('token'),'parentid'=>$this->_post('parentid'),'dining'=>1)));
				
					}else{
						$this->error('添加失败');
					}
				}else{
					$this->error($data->getError());
				}
				
			}else{
				
				// 更新旧数据
				
				$where=array('id'=>$catid,'token'=>session('token'));
				$check=$data->where($where)->find();
				if($check==false) $this->error('非法操作');
				
				if($data->create()){
					if($data->where($where)->save($_POST)){
				
						$this->success('修改成功',U('category_list',array('token'=>session('token'),'parentid'=>$this->_post('parentid'),'dining'=>1)));
				
					}else{
						$this->error('操作失败');
					}
				}else{
					$this->error($data->getError());
				}
				
			}
				
		}else{
		
		
			$id = $this->_get('id');
			if (!empty($id)){
				// 编辑分类
				$checkdata = M('Product_cat')->where(array('id'=>$id,'token'=>session('token')))->find();
				if(empty($checkdata)){ // 要编辑的分类数据不存在
					$this->error("没有相应记录.您现在可以添加");
				}
				$parentid=$checkdata['parentid'];
			}else{
				// 新增分类
				$id = 0;
				$parentid=$this->_get('parentid');
			}
				
			//查询所有分类
			$catlist =M('product_cat')->where("token='".$this->token."' and id <> '$id'")->select();
			$this->assign('catlist',$catlist);
			
			$this->assign('parentid',$parentid);
			$this->assign('set',$checkdata);
			
			$this->display();
		
		}
		
	}
	
	/**
	 * 删除一个商品分类（AJAX）
	 */
	public function category_delete(){

		
		if(IS_POST){
			
			if($this->_post('token')!=session('token')){
				exit(json_encode(array('status'=>'error','msg'=>'非法操作')));
			}
			
			$id = $this->_post('id');
			
			$where=array('id'=>$id,'token'=>session('token'));
			
			$data=M('Product_cat');
			$check=$data->where($where)->find();
			if($check==false)  exit(json_encode(array('status'=>'error','msg'=>'要删除的数据不存在')));
			
			$check2=$data->where(array('parentid'=>$id))->find();
			if(!empty($check2))  exit(json_encode(array('status'=>'error','msg'=>'本分类下存在子分类，请先删除这些子分类')));
			
			
			$product_model=M('Product');
			$productsOfCat=$product_model->where(array('catid'=>$id))->select();
			if (count($productsOfCat)){
				exit(json_encode(array('status'=>'error','msg'=>'本分类下有商品，请先删除商品，才能该删除分类')));
			}
			
			
			$back=$data->where($wehre)->delete();
			if($back==true){
				exit(json_encode(array('status'=>'success','msg'=>'操作成功')));
			}else{
				exit(json_encode(array('status'=>'error','msg'=>'数据服务没有正确响应')));
			}
			
		}
	}
	
	/**
	 * 管理规格和外观属性
	 */
	public function category_norms(){
		
	}
	
	/**
	 * 管理自定义属性
	 */
	public function category_attrs(){
		
	}
	
	public function order_list() {
	
		$this->assign('PAGE_TITLE','订单列表');
		$this->display();
	}

}
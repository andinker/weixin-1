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
	 * 删除一个商品
	 */
	public function product_delete(){
		
		$product_model=M('Product');
		if($this->_get('token')!=session('token')){$this->error('非法操作');}
		
		$id = $this->_get('id');
		
		if(IS_GET){
			
			// 确认是否存在该数据
			$where=array('id'=>$id,'token'=>session('token'));
			$check=$product_model->where($where)->find();
			if($check==false)   $this->error('非法操作');
			
			$this->delete_product_resource($id);
		
			$back=$product_model->where($wehre)->delete();
			if($back==true){
				$keyword_model=M('Keyword');
				$keyword_model->where(array('token'=>session('token'),'pid'=>$id,'module'=>'Product'))->delete();
				$this->success('操作成功',U('product_list',array('token'=>session('token'))));
			}else{
				$this->error('服务器繁忙,请稍后再试',U('product_list',array('token'=>session('token'))));
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
	public function category_norms_list(){
		
		$type = isset($_GET['type']) ? intval($_GET['type']) : 0;
		$catid = intval($_GET['catid']);
		
		if($checkdata = M('Product_cat')->where(array('id' => $catid, 'token' => session('token')))->find()){
			$this->assign('catData', $checkdata);
		} else {
			$this->error("没有选择相应的分类");
		}
		
		if ($type) $this->assign('PAGE_TITLE','外观属性列表');
		else $this->assign('PAGE_TITLE','规格属性列表');
		
		$data = M('product_norms');
		$where = array('catid' => $catid, 'type' => $type);
		$count      = $data->where($where)->count();
		$Page       = new Page($count,20);
		$show       = $Page->show();
		$list = $data->where($where)->limit($Page->firstRow.','.$Page->listRows)->order('ordid asc')->select();
		$this->assign('page', $show);
		$this->assign('list', $list);
		$this->assign('catid', $catid);
		$this->assign('type', $type);
		$this->display();
		
	}
	
	/**
	 * 编辑一个规格或属性
	 */
	public function category_norms_edit(){
		
		$type = intval($_REQUEST['type']) ? intval($_REQUEST['type']) : 0;
		if($data = M('Product_cat')->where(array('id' => $this->_get('catid'), 'token' => session('token')))->find()){
			$this->assign('catData', $data);
		} else {
			$this->error("没有选择相应的分类.", U('index'));
		}
		if (IS_POST) {
			$data = D('product_norms');
			$id = intval($this->_post('id'));
			if ($id) {
				$where = array('id' => $id, 'type' => $type, 'catid' => $this->_get('catid'));
				$check = $data->where($where)->find();
				if ($check == false) $this->error('非法操作');
			}
			if ($data->create()) {
				if ($id) {
					if ($data->where($where)->save($_POST)) {
						$this->success('修改成功', U('category_norms_list',array('token' => session('token'), 'catid' => $this->_post('catid'), 'type' => $type)));
					} else {
						$this->error('操作失败');
					}
				} else {
					if ($data->add($_POST)) {
						$this->success('添加成功', U('category_norms_list',array('token' => session('token'), 'catid' => $this->_post('catid'), 'type' => $type)));
					} else {
						$this->error('操作失败');
					}
				}
			} else {
				$this->error($data->getError());
			}
		} else {
			$data = M('product_norms')->where(array('id' => $this->_get('id'), 'type' => $type, 'catid' => $this->_get('catid')))->find();
			//print_r($data);die;
			$this->assign('catid', $this->_get('catid'));
			$this->assign('type', $type);
			$this->assign('token', session('token'));
			$this->assign('set', $data);
			$this->display();
		}
		
	}
	
	/**
	 * 删除一个规格或属性
	 */
	public function category_norms_delete(){
		
		if($this->_get('token') != session('token')){$this->error('非法操作');}
		$id = intval($this->_get('id'));
		$catid = intval($this->_get('catid'));
		$type = intval($this->_get('type'));
		if(IS_GET){
			$where = array('id' => $id, 'type' => $type, 'catid' => $catid);
			$data = M('product_norms');
			$check = $data->where($where)->find();
			if($check == false) $this->error('非法操作');
			if ($back = $data->where($wehre)->delete()) {
				$this->success('操作成功',U('category_norms_list', array('type' => $type, 'catid' => $check['catid'])));
			} else {
				$this->error('操作失败',U('category_norms_list', array('type' => $type, 'catid' => $check['catid'])));
			}
		}
		
	}
	
	/**
	 * 管理自定义属性
	 */
	public function category_attrs_list(){
		$catid = intval($_GET['catid']);
		if($checkdata = M('Product_cat')->where(array('id' => $catid, 'token' => session('token')))->find()){
			$this->assign('catData', $checkdata);
		} else {
			$this->error("没有选择相应的分类");
		}
		$data = M('Product_attrs');
		$where = array('catid' => $catid, 'token' => session('token'));
		$count      = $data->where($where)->count();
		$Page       = new Page($count,20);
		$show       = $Page->show();
		$list = $data->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('page', $show);
		$this->assign('list', $list);
		$this->assign('catid', $catid);
		$this->display();
	}
	/**
	 * 编辑一个自定义属性
	 */
	public function category_attrs_edit(){
		if($checkdata = M('Product_cat')->where(array('id' => $this->_get('catid'), 'token' => session('token')))->find()){
			$this->assign('catData', $checkdata);
		} else {
			$this->error("没有选择相应的分类");
		}
		if (IS_POST) {
			$data = D('Product_attrs');
			$id = intval($this->_post('id'));
			$catid = intval($this->_post('catid'));
			if ($id) {
				$where = array('id' => $id, 'token' => session('token'), 'catid' => $catid);
				$check = $data->where($where)->find();
				if ($check == false) $this->error('非法操作');
			}
			if ($data->create()) {
				if ($id) {
					if ($data->where($where)->save($_POST)) {
						$this->success('修改成功', U('category_attrs_list',array('token' => session('token'), 'catid' => $this->_post('catid'))));
					} else {
						$this->error('操作失败');
					}
				} else {
					if ($data->add($_POST)) {
						$this->success('添加成功', U('category_attrs_list',array('token' => session('token'), 'catid' => $this->_post('catid'))));
					} else {
						$this->error('操作失败');
					}
				}
			} else {
				$this->error($data->getError());
			}
		} else {
			$data = M('Product_attrs')->where(array('id' => $this->_get('id'), 'token' => session('token'), 'catid' => $this->_get('catid')))->find();
			$this->assign('catid', $this->_get('catid'));
			$this->assign('token', session('token'));
			$this->assign('set', $data);
			$this->display();
		}
	}
	
	/**
	 * 删除一个自定义属性
	 */
	public function category_attrs_delete(){
		if($this->_get('token') != session('token')){$this->error('非法操作');}
		$id = intval($this->_get('id'));
		$catid = intval($this->_get('catid'));
		if(IS_GET){
			$where = array('id' => $id, 'token' => session('token'), 'catid' => $catid);
			$data = M('Product_attrs');
			$check = $data->where($where)->find();
			if($check == false) $this->error('非法操作');
			if ($back = $data->where($wehre)->delete()) {
				$this->success('操作成功',U('category_attrs_list', array('token' => session('token'), 'catid' => $catid)));
			} else {
				$this->error('操作失败',U('category_attrs_list', array('token' => session('token'), 'catid' => $catid)));
			}
		}
	}
	
	public function order_list() {
		
		$this->assign('PAGE_TITLE','订单列表');
		
		$product_cart_model=M('product_cart');
		if (IS_POST){
			if ($_POST['token']!=$this->_session('token')){
				exit($_POST['token'].':'.$this->_session('token'));
			}
			for ($i=0;$i<40;$i++){
				if (isset($_POST['id_'.$i])){
					$thiCartInfo=$product_cart_model->where(array('id'=>intval($_POST['id_'.$i])))->find();
					if ($thiCartInfo['handled']){
						$product_cart_model->where(array('id'=>intval($_POST['id_'.$i])))->save(array('handled'=>0));
					}else {
						$product_cart_model->where(array('id'=>intval($_POST['id_'.$i])))->save(array('handled'=>1));
					}
				}
			}
			$this->success('操作成功',U('order_list',array('token'=>session('token'))));
		}else{
			$where=array('token'=>$this->_session('token'));
			$where['dining']=0;
			$where['groupon']=0;
			if(IS_POST){
				$key = $this->_post('searchkey');
				if(empty($key)){
					$this->error("关键词不能为空");
				}
		
				$where['truename|address'] = array('like',"%$key%");
				$orders = $product_cart_model->where($where)->select();
				$count      = $product_cart_model->where($where)->limit($Page->firstRow.','.$Page->listRows)->count();
				$Page       = new Page($count,20);
				$show       = $Page->show();
			}else {
				if (isset($_GET['handled'])){
					$where['handled']=intval($_GET['handled']);
				}
				$count      = $product_cart_model->where($where)->count();
				$Page       = new Page($count,20);
				$show       = $Page->show();
				$orders=$product_cart_model->where($where)->order('time DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
			}
			$where['handled']=0;
			$unHandledCount=$product_cart_model->where($where)->count();
			$this->assign('unhandledCount',$unHandledCount);
		
			$this->assign('orders',$orders);
			$this->assign('page',$show);
			$this->display();
		}
		
	}
	
	public function order_edit() {
		
		$this->product_model=M('Product');
		$this->product_cat_model=M('Product_cat');
		$product_cart_model=M('product_cart');
		$thisOrder=$product_cart_model->where(array('id'=>intval($_GET['id'])))->find();
		//检查权限
		if (strtolower($thisOrder['token'])!=strtolower($this->_session('token'))){
			exit();
		}
		if (IS_POST){
			$sent=intval($_POST['sent']);
			$product_cart_model->where(array('id'=>$_GET['id']))->save(array('paid'=>intval($_POST['paid']),'sent'=>$sent,'logistics'=>$_POST['logistics'],'logisticsid'=>$_POST['logisticsid'],'handled'=>1));
			/*已付款***/
			if (intval($_POST['paid'])&&intval($thisOrder['price'])){
				$member_card_create_db=M('Member_card_create');
				$wecha_id=$thisOrder['wecha_id'];
				$userCard=$member_card_create_db->where(array('token'=>$this->token,'wecha_id'=>$wecha_id))->find();
				$member_card_set_db=M('Member_card_set');
				$thisCard=$member_card_set_db->where(array('id'=>intval($userCard['cardid'])))->find();
				$set_exchange = M('Member_card_exchange')->where(array('cardid'=>intval($thisCard['id'])))->find();
				if($set_exchange){
					$arr['token']=$this->token;
					$arr['wecha_id']=$wecha_id;
					$arr['expense']=$thisOrder['price'];
					$arr['time']=time();
					$arr['cat']=99;
					$arr['staffid']=0;
					$arr['score']=intval($set_exchange['reward'])*$order['price'];
					M('Member_card_use_record')->add($arr);
					$userinfo_db=M('Userinfo');
					$thisUser = $userinfo_db->where(array('token'=>$thisCard['token'],'wecha_id'=>$arr['wecha_id']))->find();
					$userArr=array();
					$userArr['total_score']=$thisUser['total_score']+$arr['score'];
					$userArr['expensetotal']=$thisUser['expensetotal']+$arr['expense'];
					$userinfo_db->where(array('token'=>$thisCard['token'],'wecha_id'=>$arr['wecha_id']))->save($userArr);
				}
			}
			if($sent){
				//短信通知买家
				$company = D('Company')->where(array('token' => $thisOrder['token'], 'isbranch' => 0))->find();
				$this->Send_sms($thisOrder['tel'],"您在{$company['name']}商城购买的商品，商家已经给您发货了，请您注意查收");
				//微信支付发货通知
				/* 新版微信支付已经取消发货通知接口
				if($thisOrder['payment']=='wxpay'){
					import("@.ORG.Weixinpay.WxpayMyExt");
					$payset = $this->Payment_db->where(array('token'=>$this->token,'pay_code'=>'wxpay'))->find();
					$pay_config = unserialize($payset['pay_config']);
					$orderinfo=array(
							'openid' => $thisOrder['wecha_id'],
							'transid' => $thisOrder['transaction_id'],
							'out_trade_no' => $thisOrder['orderid'],
					);
					
					$wxpay_myext=new WxpayMyExt($pay_config,$orderinfo);
					发送发货通知
					$result=$wxpay_myext->delivernotify_sent();
				}*/
			}
			$this->success('修改成功',U('order_list',array('token'=>session('token'),'id'=>$_GET['id'])));
		}else {
			$this->assign('thisOrder',$thisOrder);
			$carts=unserialize($thisOrder['info']);

			$totalFee=0;
			$totalCount=0;
			
			
			
			$data = $this->getCat($carts);
			if (isset($data[1])) {
				foreach ($data[1] as $pid => $row) {
					$totalCount += $row['total'];
					$totalFee += $row['totalPrice'];
					$listNum[$pid] = $row['total'];
				}
			}
			$list = $data[0];
			$this->assign('products', $list);
			$this->assign('totalFee',$totalFee);
			$this->assign('totalCount',$totalCount);
			$this->assign('totalMailprice',$data[2]);
			$this->display();
		}
	}
	
	public function order_delete(){
		
		$product_model=M('product');
		$product_cart_model=M('product_cart');
		$product_cart_list_model=M('product_cart_list');
		$thisOrder=$product_cart_model->where(array('id'=>intval($_GET['id'])))->find();
		//检查权限
		$id=$thisOrder['id'];
		if ($thisOrder['token']!=$this->_session('token')){
			exit();
		}
		//
		//删除订单和订单列表
		$product_cart_model->where(array('id'=>$id))->delete();
		$product_cart_list_model->where(array('cartid'=>$id))->delete();
		//商品销量做相应的减少
		$carts=unserialize($thisOrder['info']);
		foreach ($carts as $k=>$c){
			if (is_array($c)){
				$productid=$k;
				$price=$c['price'];
				$count=$c['count'];
				$product_model->where(array('id'=>$k))->setDec('salecount',$c['count']);
			}
		}
		$this->success('操作成功',$_SERVER['HTTP_REFERER']);
		
	}

}
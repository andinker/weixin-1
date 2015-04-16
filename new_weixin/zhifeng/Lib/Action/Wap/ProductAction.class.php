<?php
class ProductAction extends WapAction{
	public $token;
	public $wecha_id;
	public $product_model;
	public $product_cat_model;
	public $session_cart_name;
	public function _initialize() {
		parent::_initialize();
		
		//改session id
		if (!empty($_GET['PHPSESSID'])){
			session_id($_GET['PHPSESSID']);
			setcookie('PHPSESSID',$_GET['PHPSESSID']);
		}

		$agent = $_SERVER['HTTP_USER_AGENT']; 
		if(!strpos($agent,"MicroMessenger")) {
		//	echo '此功能只能在微信浏览器中使用';exit;
		}

		$this->token = isset($_REQUEST['token']) ? htmlspecialchars($_REQUEST['token']) : session('token');
		$this->session_cart_name = 'session_cart_products_' . $this->token;
		$this->assign('token', $this->token);
		$this->wecha_id	= isset($_REQUEST['wecha_id']) ? htmlspecialchars($_REQUEST['wecha_id']) : '';
		$this->assign('wecha_id',$this->wecha_id);
		$this->product_model=M('Product');
		$this->product_cat_model=M('Product_cat');
		$this->assign('staticFilePath',RES.'/css/product');
		//购物车
		$calCartInfo=$this->calCartInfo();
		$this->assign('totalProductCount',$calCartInfo[0]);
		$this->assign('totalProductFee',$calCartInfo[1]);
		//分类
		$cats = $this->product_cat_model->where(array('token' => $this->token))->order('sortrank asc')->select();
		$this->assign('cats', $cats);
		
		$this->company=M('Company')->where(array('token'=>$this->token,'isbranch'=>0))->find();
		//在线客服
		$kefu=M('Kefu')->where(array('token' => $this->token))->find();
		$this->assign('kefu',$kefu);
		//是否支持在线支付
		$payment =M('payment')->where(array('token'=>$this->token,'enabled'=>1))->select();
		$this->payment = $payment;
		$this->assign('payment',$payment);
		
		$Userinfo=M('Userinfo')->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
		$this->assign('Userinfo',$Userinfo);
		/*this's wxoauth2.0 by 9.10wzh start*/	
		$wxuser=$this->wxuser;	
		if(!$wxuser){
			$this->wxuser=$wxuser=D('Wxuser')->where(array('token'=>$this->token))->find();
			//S('wxuser_'.$this->token,$this->wxuser);
		}
	}
	public function index(){
		$caturl=U('Product/cats', array('token' => $this->token, 'wecha_id' => $this->wecha_id));
		$this->assign('metaTitle','微信购物');
		$this->redirect($caturl);
	}
	public function cats(){
		$catWhere=array('parentid'=>0,'token'=>$this->token);
		if (isset($_GET['parentid'])){
			$parentid=intval($_GET['parentid']);
			$catWhere['parentid']=$parentid;
			
			$thisCat=$this->product_cat_model->where(array('id'=>$parentid))->find();
			$this->assign('thisCat',$thisCat);
			$this->assign('parentid',$parentid);
		}
		$cats = $this->product_cat_model->where($catWhere)->order('sortrank asc')->select();
		//获取商城模版名称
		$wh=array('token'=>$this->token);
		$Wxuser=D('Wxuser')->where($wh)->find();
		$shoptpl=$Wxuser['shoptpltypename'];
	    //幻灯
		$setting = M('product_setting')->where($wh)->find();
		for($i=1;$i<6;$i++){
			if(!empty($setting['picurl'.$i])){
				$setting['picurls'][]=$setting['picurl'.$i];
				unset($setting['picurl'.$i]);
			}
		}
		
		//按分类读取商品列表
		$products = array();
		foreach ($cats as $cat){
			$where = array('token' => $this->token, 'groupon' => 0,'catid'=>$cat['id']);
			$cat_products = $this->product_model-> where($where) ->order("sort ASC ")->limit('0, 6')->select();
			$products[$cat['id']] = $cat_products;
		}
		$this->assign('products', $products);
		
		$this->assign('cats',$cats);
		$this->assign('info', $setting);
		$this->assign('metaTitle','商品分类');
		//print_r($cats);print_r($setting);print_r($products);
		//echo $shoptpl;
		$this->display($shoptpl);
	}
	public function products() {
		$where = array('token' => $this->token, 'groupon' => 0);
		$catid = isset($_GET['catid']) ? intval($_GET['catid']) : 0;
		if ($catid) {
			$where['catid'] = $catid;
			$thisCat = $this->product_cat_model->where(array('id'=>$catid))->find();
			$this->assign('thisCat', $thisCat);
		}
		if (IS_POST){
			$key = $this->_post('search_name');
			$gourl=U('Product/products',array('token'=> $this->token,'wecha_id'=> $this->wecha_id,'keyword'=> $key));
            $this->redirect($gourl);
		}
		if (isset($_GET['keyword'])){
            $where['name|intro|keyword'] = array('like', "%".$_GET['keyword']."%");
            $this->assign('isSearch', 1);
		}
		$count = $this->product_model->where($where)->count();
		$this->assign('count', $count); 
		//排序方式
		$method = isset($_GET['method']) && ($_GET['method']=='DESC' || $_GET['method']=='ASC') ? $_GET['method'] : 'DESC';
		$orders = array('time', 'discount', 'price', 'salecount');
		$order = isset($_GET['order']) && in_array($_GET['order'], $orders) ? $_GET['order'] : 'time';
		$this->assign('order', $order);
		$this->assign('method', $method);
        	
		$products = $this->product_model->where($where)->order("sort ASC, " . $order.' '.$method)->limit('0, 8')->select();
		$this->assign('products', $products);
		$name = isset($thisCat['name']) ? $thisCat['name'] . '列表' : "商品列表";
		$this->assign('metaTitle', $name);
		$listtpl=$this->wxuser['shoplistname'];
		if($listtpl){
			$this->display($listtpl);
		}else{
			$this->display('list1_products');
		}
	}
	public function ajaxProducts(){
		$where=array('token'=>$this->token);
		if (isset($_GET['catid'])){
			$catid=intval($_GET['catid']);
			$where['catid']=$catid;
		}
		$page = isset($_GET['page']) && intval($_GET['page'])>1 ? intval($_GET['page']) : 2;
		$pageSize = isset($_GET['pagesize']) && intval($_GET['pagesize']) > 1 ? intval($_GET['pagesize']) : 8;
		
		$method = isset($_GET['method']) && ($_GET['method']=='DESC' || $_GET['method']=='ASC') ? $_GET['method'] : 'DESC';
		$orders = array('time', 'discount', 'price', 'salecount');
		$order = isset($_GET['order']) && in_array($_GET['order'], $orders) ? $_GET['order'] : 'time';
		$start=($page-1)*$pageSize;
		$products = $this->product_model->where($where)->order("sort ASC, " . $order.' '.$method)->limit($start . ',' . $pageSize)->select();
		$str='{"products":[';
		if ($products){
			$comma='';
			foreach ($products as $p){
				$str.=$comma.'{"id":"'.$p['id'].'","catid":"'.$p['catid'].'","storeid":"'.$p['storeid'].'","name":"'.$p['name'].'","price":"'.$p['price'].'","token":"'.$p['token'].'","keyword":"'.$p['keyword'].'","salecount":"'.$p['salecount'].'","logourl":"'.$p['logourl'].'","time":"'.$p['time'].'","oprice":"'.$p['oprice'].'"}';
				$comma=',';
			}
		}
		$str.=']}';
		$this->show($str);
	}
	public function product() {
		$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
		$where = array('token' => $this->token, 'id' => $id);
		$product = $this->product_model->where($where)->find();
		if (empty($product)) {
			$this->redirect(U('Product/products',array('token' => $this->token,'wecha_id' => $this->wecha_id)));
		}
		
		$product['intro'] = isset($product['intro']) ? htmlspecialchars_decode($product['intro']) : '';
		$this->assign('product', $product);
		if ($product['endtime']){
			$leftSeconds = intval($product['endtime'] - time());
			$this->assign('leftSeconds', $leftSeconds);
		}
        $normsData = M("product_norms")->where(array('catid' => $product['catid']))->select();
        foreach ($normsData as $row) {
        	$normsList[$row['id']] = $row['value'];
        }
        if($productCatData = M('Product_cat')->where(array('id' => $product['catid'], 'token' => $this->token))->find()) {
        	$this->assign('catData', $productCatData);
        }
		$colorDetail = $normsDeatail = $productDetail = array();
		$attributeData = M("Product_attribute")->where(array('pid' => $product['id']))->select();
		
		$productDetailData = M("Product_detail")->where(array('pid' => $product['id']))->select();
		foreach ($productDetailData as $p) {
			$p['formatName'] = $normsList[$p['format']];
			$p['colorName'] = $normsList[$p['color']];
			
			$formatData[$p['format']] = $colorData[$p['color']] = $productDetail[] = $p;
			
			$colorDetail[$p['color']][] = $p;
			$normsDetail[$p['format']][] = $p;
		}
		$productimage = M("Product_image")->where(array('pid' => $product['id']))->select();
		
		$this->assign('imageList', $productimage);
		$this->assign('productDetail', $productDetail);
		$this->assign('attributeData', $attributeData);
		$this->assign('normsDetail', $normsDetail);
		$this->assign('colorDetail', $colorDetail);
		$this->assign('formatData', $formatData);
		$this->assign('colorData', $colorData);
		$this->assign('metaTitle', $product['name']);
		$product['intro'] = str_replace(array('&lt;','&gt;','&quot;','&amp;nbsp;'),array('<','>','"',' '), $product['intro']);
		$intro = $this->remove_html_tag($product['intro']);
		$intro = mb_substr($intro, 0, 30,'utf-8');
		$this->assign('intro',$intro);
		$this->display();
	}
	public function productDetail(){
		$where=array('token'=>$this->token);
		if (isset($_GET['id'])){
			$id=intval($_GET['id']);
			$where['id']=$id;
		}
		$product=$this->product_model->where($where)->find();
		$product['intro']=str_replace(array('&lt;','&gt;','&quot;','&amp;nbsp;'),array('<','>','"',' '),$product['intro']);
		$this->assign('product',$product);
		$this->assign('metaTitle',$product['name']);
		
		$this->display();
	}
	public function company($display=1){
		//店铺信息
		$company_model=M('company');
		$where['token']=$this->token;
		if (isset($_GET['companyid'])){
			$where['id']=intval($_GET['companyid']);
		}
		$thisCompany=M('company')->where($where)->find();
		$this->assign('thisCompany',$thisCompany);		
		//分店信息
		$branchProducts=$company_model->where(array('token'=>$this->token,'isbranch'=>1))->order('taxis ASC')->select();
		$branchProductCount=count($branchProducts);
		$this->assign('branchProductCount',$branchProductCount);
		$this->assign('branchProducts',$branchProducts);
		
		if($display){
		$this->assign('metaTitle','公司信息');
		$this->display();
		}else{
		$this->assign('metaTitle','公司地图');
		}
	}
	public function companyMap(){
		$this->apikey=C('baidu_map_api');
		$this->assign('apikey',$this->apikey);
		$this->company(0);		
		$this->display();
	}
	/**
	 * 添加购物车
	 */
	public function addProductToCart() {
		$count = isset($_GET['count']) ? intval($_GET['count']) : 1;
		if (empty($this->wecha_id)) {
			echo false;
			die;
		}
		$carts = $this->_getCart();
		$id = intval($_GET['id']);
		$did = isset($_GET['did']) ? intval($_GET['did']) : 0;//商品的详细id,即颜色与尺寸
		if (isset($carts[$id])) {
			if ($did) {
				if (isset($carts[$id][$did])) {
					$carts[$id][$did]['count'] += $count;
				} else {
					$carts[$id][$did]['count'] = $count;
				}
			} else {
				$carts[$id] += $count;
			}
		} else {
			if ($did) {
				$carts[$id][$did]['count'] = $count;
			} else {
				$carts[$id] = $count;
			}
		}
		$_SESSION[$this->session_cart_name] = serialize($carts);
		$calCartInfo = $this->calCartInfo();
		echo $calCartInfo[0].'|'.$calCartInfo[1];
	}
	
	private function calCartInfo($carts=''){
		$totalCount = $totalFee = 0;
		if (!$carts) {
			$carts = $this->_getCart();
		}
		$data = $this->getCat($carts);
		if (isset($data[1])) {
			foreach ($data[1] as $pid => $row) {
				$totalCount += $row['total'];
				$totalFee += $row['totalPrice'];
			}
		}
		
		return array($totalCount, $totalFee, $data[2]);
	}
	
	private function _getCart() {
		//setCookie('PHPSESSID',$_GET['PHPSESSID']);
		//setCookie('PHPSESSID222',$_GET['PHPSESSID']);
		//echo session_id();
		if (!isset($_SESSION[$this->session_cart_name])||!strlen($_SESSION[$this->session_cart_name])){
			$carts = array();
		} else {
			$carts=unserialize($_SESSION[$this->session_cart_name]);
		}
		return $carts;
	}
	
	/**
	 * 购物车列表
	 */
	public function cart(){
		
		$this->checked_login();
		
		if (empty($this->wecha_id)) {
			unset($_SESSION[$this->session_cart_name]);
		}
		$totalCount = $totalFee = 0;
		$data = $this->getCat($this->_getCart());
		if (isset($data[1])) {
			foreach ($data[1] as $pid => $row) {
				$totalCount += $row['total'];
				$totalFee += $row['totalPrice'];
			}
		}
		$list = $data[0];
		
		$this->assign('products', $list);
		$this->assign('totalFee', $totalFee);
		$this->assign('totalCount', $totalCount);
		$this->assign('metaTitle','购物车');
		$this->assign('cookie',$_COOKIE['PHPSESSID']);
		$this->display();
	}
	
	/**
	 * 计算一次购物的总的价格与数量
	 * @param array $carts
	 */
	public function getCat($carts = '')
	{
		$carts = empty($carts) ? $this->_getCart() : $carts;
		//邮费
		$mailPrice = 0;
		//商品的IDS
		$pids = array_keys($carts);
		
		//商品分类IDS
		$productList = $cartIds = array();
		if (empty($pids)) {
			return array(array(), array(), array());
		}
		
		$productdata = $this->product_model->where(array('id'=> array('in', $pids)))->select();
		foreach ($productdata as $p) {
			if (!in_array($p['catid'], $cartIds)) {
				$cartIds[] = $p['catid'];
			}
			$mailPrice = max($mailPrice, $p['mailprice']);
			$productList[$p['id']] = $p;
		}
		//商品规格参数值
		$catlist = $norms = array();
		if ($cartIds) {
			$normsdata = M('Product_norms')->where(array('catid' => array('in', $cartIds)))->select();
			foreach ($normsdata as $r) {
				$norms[$r['id']] = $r['value'];
			}
			//商品分类
			$catdata = M('Product_cat')-> where(array('id' => array('in', $cartIds)))->select();
			foreach ($catdata as $cat) {
				$catlist[$cat['id']] = $cat;
			}
		}
		$dids = array();
		foreach ($carts as $pid => $rowset) {
			if (is_array($rowset)) {
				$dids = array_merge($dids, array_keys($rowset));
			}
		}
		//商品的详细
		$totalprice = 0;
		$data = array();
		if ($dids) {
			$dids = array_unique($dids);
			$detail = M('Product_detail')->where(array('id'=> array('in', $dids)))->select();
			foreach ($detail as $row) {
				$row['colorName'] = isset($norms[$row['color']]) ? $norms[$row['color']] : '';
				$row['formatName'] = isset($norms[$row['format']]) ? $norms[$row['format']] : '';
				$row['count'] = isset($carts[$row['pid']][$row['id']]['count']) ? $carts[$row['pid']][$row['id']]['count'] : 0;
				if ($this->fans['getcardtime'] > 0) {
					$row['price'] = $row['vprice'] ? $row['vprice'] : $row['price'];
				}
				$productList[$row['pid']]['detail'][] = $row;
				$data[$row['pid']]['total'] = isset($data[$row['pid']]['total']) ? intval($data[$row['pid']]['total'] + $row['count']) : $row['count'];
				$data[$row['pid']]['totalPrice'] = isset($data[$row['pid']]['totalPrice']) ? intval($data[$row['pid']]['totalPrice'] + $row['count'] * $row['price']) : $row['count'] * $row['price'];
				$totalprice += $data[$row['pid']]['totalPrice'];
			}
		}
		//商品的详细列表
		$list = array();
		foreach ($productList as $pid => $row) {
			if (!isset($data[$pid]['total'])) {
				$row['count'] = $data[$pid]['total'] = isset($carts[$pid]['count']) ? $carts[$pid]['count'] : (isset($carts[$pid]) && is_int($carts[$pid]) ? $carts[$pid] : 0);
				if ($this->fans['getcardtime'] > 0) {
					$row['price'] = $row['vprice'] ? $row['vprice'] : $row['price'];
				}
				$data[$pid]['totalPrice'] = $data[$pid]['total'] * $row['price'];
				$totalprice += $data[$pid]['totalPrice'];
			}
			$row['formatTitle'] =  isset($catlist[$row['catid']]['norms']) ? $catlist[$row['catid']]['norms'] : '';
			$row['colorTitle'] =  isset($catlist[$row['catid']]['color']) ? $catlist[$row['catid']]['color'] : '';
			$list[] = $row;
		}
		if ($obj = M('Product_setting')->where(array('token' => $this->token))->find()) {
			if ($totalprice >= $obj['price']) $mailPrice = 0;
		}
		return array($list, $data, $mailPrice);
	}
	
	public function deleteCart(){
		$products=array();
		$ids=array();
		$carts=$this->_getCart();
		$did = isset($_GET['did']) ? intval($_GET['did']) : 0;
		$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
		if ($did) {
			unset($carts[$id][$did]);
			if (empty($carts[$id])) {
				unset($carts[$id]);
			}
		} else {
			unset($carts[$id]);
		}
		$_SESSION[$this->session_cart_name] = serialize($carts);
		$this->redirect(U('Product/cart',array('token'=>$_GET['token'],'wecha_id'=>$_GET['wecha_id'])));
	}
	public function ajaxUpdateCart(){

		$this->checked_login();
		
		$count = isset($_GET['count']) ? intval($_GET['count']) : 1;
		$carts = $this->_getCart();
		$id = intval($_GET['id']);
		$did = isset($_GET['did']) ? intval($_GET['did']) : 0;
		if (isset($carts[$id])) {
			if ($did) {
				$carts[$id][$did]['count'] = $count;
			} else {
				$carts[$id] = $count;
			}
		} else {
			if ($did) {
				$carts[$id][$did]['count'] = $count;
			} else {
				$carts[$id] = $count;
			}
		}
		$_SESSION[$this->session_cart_name] = serialize($carts);
		$calCartInfo = $this->calCartInfo();
		echo $calCartInfo[0].'|'.$calCartInfo[1];
	}
	
	//订单详情
	public function orderCart() {
		
		$this->checked_login();
		
		if (empty($this->wecha_id)) {
			unset($_SESSION[$this->session_cart_name]);
		}
		$setting = M('Product_setting')->where(array('token' => $this->token))->find();
		$this->assign('setting', $setting);
		//是否支持在线支付
		$payment =M('payment')->where(array('token'=>$this->token,'enabled'=>1))->select();
		$this->assign('payment',$payment);

		$totalCount = $totalFee = 0;
		$data = $this->getCat($this->_getCart());
		if (empty($data[0])) {
			$this->redirect(U('Product/cart', array('token' => $this->token, 'wecha_id' => $this->wecha_id)));
		}
		if (isset($data[1])) {
			foreach ($data[1] as $pid => $row) {
				$totalCount += $row['total'];
				$totalFee += $row['totalPrice'];
			}
		}
		if (empty($totalCount)) {
			$this->error('没有购买商品!', U('Product/cart', array('token' => $this->token, 'wecha_id' => $this->wecha_id)));
		}
		$list = $data[0];
		$this->assign('products', $list);
		$this->assign('totalFee', $totalFee);
		$this->assign('totalCount', $totalCount);
		$this->assign('mailprice', $data[2]);
		$this->assign('metaTitle', '购物车结算');
		$this->assign('cookie',$_COOKIE['PHPSESSID']);
		$this->display();
	}
	
	public function ordersave(){
		
		$this->checked_login();
		
		$row = array();
		$token=$this->token;
		$row['orderid'] = $orderid =date("YmdHis").rand(1000,2000);
		$row['truename'] = $this->_post('truename');
		$row['tel'] = $this->_post('tel');
		$row['address'] = $this->_post('address');
		$row['token'] = $token;
		$row['wecha_id'] = $this->wecha_id;
		$row['time'] = $time = time();
		$row['payment']=$this->_post('payment');
		//积分
		$score = isset($_POST['score']) ? intval($_POST['score']) : 0;
		$normal_rt = 0;
		$carts = $this->_getCart();
		if ($carts){
			$calCartInfo = $this->calCartInfo($carts);
			$setting = M('Product_setting')->where(array('token' => $token))->find();
			$totalprice = $calCartInfo[1] + $calCartInfo[2];
			if ($score && $setting && $setting['score'] > 0 && $this->fans['total_score'] >= $score) {
				$totalprice -= $score / $setting['score'];
				if ($totalprice < 0) {
					$score = ($calCartInfo[1] + $calCartInfo[2]) * $setting['score'];
					$totalprice = 0;
					$row['paid'] = 1;
				}
			}
			
			$row['total'] = $calCartInfo[0];
			$row['price'] = $totalprice;
			$row['diningtype'] = 0;
			$row['buytime'] = '';
			$row['tableid'] = 0;
			$row['info'] = serialize($carts);
			$row['groupon']=0;
			$row['dining'] = 0;
			$row['score'] = $score;
			
			$product_cart_model = M('product_cart');
			//保存订单
			$normal_rt = $product_cart_model->add($row);
		}
		//处理订单
		if ($normal_rt){
			$product_model = M('product');
			$product_cart_list_model = M('product_cart_list');
			$crow = array();
			$tdata = $this->getCat($carts);
			foreach ($carts as $k => $c){
				$crow['cartid'] = $normal_rt;
				$crow['productid'] = $k;
				$crow['price'] = $tdata[1][$k]['totalPrice'];//$c['price'];
				$crow['total'] = $tdata[1][$k]['total'];
				$crow['wecha_id'] = $row['wecha_id'];
				$crow['token'] = $row['token'];
				$crow['time'] = $time;
				$product_cart_list_model->add($crow);
				
				//增加销量
				$product_model->where(array('id'=>$k))->setInc('salecount', $tdata[1][$k]['total']);
			}
			
			//删除库存
			foreach ($carts as $pid => $rowset) {
				$total = 0;
				if (is_array($rowset)) {
					foreach ($rowset as $did => $ro) {
						M('Product_detail')->where(array('id' => $did, 'pid' => $pid, 'num' => array('gt', $ro['count'])))->setDec('num', $ro['count']);
						$total += $ro['count'];
					}
				} else {
					$total = $rowset;
				}
				$product_model->where(array('id' => $pid, 'num' => array('gt', $total)))->setDec('num', $total);
			}
			$_SESSION[$this->session_cart_name] = null;
			unset($_SESSION[$this->session_cart_name]);
			//保存个人信息
			if ($_POST['saveinfo']){
				$userinfo_model = M('Userinfo');
				$thisUser = $userinfo_model->where(array('token'=>$token,'wecha_id'=>$this->wecha_id))->find();
				$this->assign('thisUser', $thisUser);
				$userRow=array('tel'=>$row['tel'],'truename'=>$row['truename'],'address'=>$row['address']);
				if ($thisUser) {
					$userinfo_model->where(array('id' => $thisUser['id']))->save($userRow);
					$userinfo_model->where(array('id' => $thisUser['id'], 'total_score' => array('gt', $score)))->setDec('total_score', $score);
					F('fans_token_wechaid', NULL);
				} else {
					$userRow['token']=$token;
					$userRow['wecha_id']=$this->wecha_id;
					$userRow['wechaname']='';
					$userRow['qq']=0;
					$userRow['sex']=-1;
					$userRow['age']=0;
					$userRow['birthday']='';
					$userRow['info']='';

					$userRow['total_score']=0;
					$userRow['sign_score']=0;
					$userRow['expend_score']=0;
					$userRow['continuous']=0;
					$userRow['add_expend']=0;
					$userRow['add_expend_time']=0;
					$userRow['live_time']=0;
					$userinfo_model->add($userRow);
				}
			}
		}
		//下单通知
		if($normal_rt){
			//店铺信息
			$cominfo=$this->company;
			//是否通知开关
			$inform=S('inform_'.$token);
			if(!$inform){
				$inform=M('Inform')->where(array('token'=>$token))->find();
				S('inform_'.$token,$inform);
			}
			if($inform['product']==1){
				$informstatus=true;
			}else{
				$proInform=unserialize($inform['product']);
			}
			//发短信
			if($informstatus||$proInform['s']==1){
				$phone=$row['tel'];
				$content =$row['truename']." 您在".$cominfo['name']."的订单已经提交成功,合计：".$totalprice." 元,";
				$content .="服务电话:".$cominfo['tel'].",感谢您的预订！";
				$this->Send_sms($phone,$content);
				//给商家发短信
				$smsset=M('sms_set')->where(array('token'=>$token,'status'=>1))->find();
				if($smsset['phone']){
					$sms_body="您的店铺：".$cominfo['name']."有新的订单，单号：".$orderid."，金额".$totalprice." 元";
					$this->Send_sms($smsset['phone'],$sms_body);
				}
			}
			//发邮件
			if($informstatus||$proInform['e']==1){				
				$subject="您有新的订单，单号：".$orderid."，预定人：".$row['truename'];
				$body="预定店铺：".$this->company['name']."<br>".$this->email_body();
				//邮件是否开启
				$emailwhere['token']=$token;
				$emailwhere['status']=1;
				$emailwhere['_string']='storeid=0 OR storeid='.$this->company['id'];
		
				//邮件列表
				$set_state =M('email_set')->field('id')->where($emailwhere)->order('storeid DESC')->limit(0,1)->select();
				$this->Send_email($set_state[0]['id'],$subject,$body);
			}
			//打印订单
			if($informstatus||$proInform['p']==1){
				//打印机是否开启
				$emailwhere['token']=$token;
				$emailwhere['status']=1;
				$emailwhere['_string']='storeid=0 OR storeid='.$this->company['id'];
		
				$content=$this->getPrintcontet($orderid);
				$printset_state =M('Printer_set')->field('id')->where($emailwhere)->order('storeid','DESC')->limit(0,3)->select();
				foreach($printset_state as $val){
					$status=$this->executeprint($val['id'],$content);
				}
				if($status){
					M('Product_cart')->where(array('orderid'=>$orderid))->save(array('printed'=>1));
				}
			}
			//支付方式
			$pay_code=$this->_post('payment');
			if (empty($pay_code)){
				$this->redirect(U('Product/my',array('token'=>$token,'wecha_id'=>$this->wecha_id,'success'=>1)));
			}else {
				$this->redirect(U('Pay/'.$pay_code,array('token'=>$token,'wecha_id'=>$this->wecha_id,'orderid'=>$orderid)));
			}
		}
	}

	public function my(){
		
		$this->checked_login();
		
		$offset = 5;
		$page = isset($_GET['page']) ? max(intval($_GET['page']), 1) : 1;
		$start = ($page - 1) * $offset;
		$product_cart_model = M('product_cart');
		$orders = $product_cart_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id, 'groupon' => 0))->limit($start, $offset)->order('time DESC')->select();
		$count = $product_cart_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id, 'groupon' => 0))->count();
		$list = array();
		if ($orders){
			foreach ($orders as $o){
				$products = unserialize($o['info']);
				$pids = array_keys($products);
				$o['productInfo'] = array();
				if ($pids) {
					$o['productInfo'] = M('product')->where(array('id' => array('in', $pids)))->select();
				}
				$list[] = $o;
			}
		}
		$totalpage = ceil($count / $offset);
		$this->assign('orders', $list);
		$this->assign('ordersCount', $count);
		$this->assign('totalpage', $totalpage);
		$this->assign('page', $page);
		$this->assign('metaTitle', '我的订单');
		
		//是否支持在线支付
		$payment =M('payment')->where(array('token'=>$this->token,'enabled'=>1))->select();
		$this->assign('payment',$payment);
		$this->display();
	}
	public function myDetail(){
		
		$this->checked_login();
		
		$cartid = isset($_GET['cartid']) && intval($_GET['cartid'])? intval($_GET['cartid']) : 0;
		$product_cart_model = M('product_cart');

		$list = array();
		if ($cartObj = $product_cart_model->where(array('token' => $this->token, 'wecha_id' => $this->wecha_id, 'id' => $cartid))->find()){
			$products = unserialize($cartObj['info']);
			$data = $this->getCat($products);
			$pids = array_keys($products);
			$cartObj['productInfo'] = array();
			if ($pids) {
				$cartObj['productInfo'] = M('product')->where(array('id' => array('in', $pids)))->select();
			}
			
			$totalCount = $totalFee = 0;
			if (isset($data[1])) {
				foreach ($data[1] as $pid => $row) {
					$totalCount += $row['total'];
					$totalFee += $row['totalPrice'];
				}
			}
			$list = $data[0];
			$this->assign('products', $list);
			$this->assign('totalFee', $totalFee);
			$this->assign('totalCount', $totalCount);
			$this->assign('mailprice', $data[2]);
			$this->assign('cartData', $cartObj);
			$this->assign('cartid', $cartid);
		}
		$this->assign('metaTitle', '我的订单');
		$this->display();
	}
	public function cancelCart(){
		
		$this->checked_login();
		
		$cartid = isset($_GET['cartid']) && intval($_GET['cartid'])? intval($_GET['cartid']) : 0;
		$product_model=M('product');
		$product_cart_model = M('product_cart');
		$product_cart_list_model = M('product_cart_list');
		$thisOrder = $product_cart_model->where(array('id'=> $cartid,'token'=>$this->token))->find();
		if (empty($thisOrder)) {
			exit(json_encode(array('error_code' => true, 'msg' => '没有此订单')));
		}
		$id = $thisOrder['id'];
		if (empty($thisOrder['paid'])) {
			//删除订单和订单列表
			$product_cart_model->where(array('id' => $cartid))->delete();
			$product_cart_list_model->where(array('cartid' => $cartid))->delete();
			//还原积分
			$userinfo_model = M('Userinfo');
			$thisUser = $userinfo_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
			$userinfo_model->where(array('id' => $thisUser['id']))->setInc('total_score', $thisOrder['score']);
			F('fans_token_wechaid', NULL);
			//商品销量做相应的减少
			$carts = unserialize($thisOrder['info']);
			//还原库存
			foreach ($carts as $pid => $rowset) {
				$total = 0;
				if (is_array($rowset)) {
					foreach ($rowset as $did => $row) {
						M('product_detail')->where(array('id' => $did, 'pid' => $pid))->setInc('num', $row['count']);
						$total += $row['count'];
					}
				} else {
					$total = $rowset;
				}
				$product_model->where(array('id' => $pid))->setInc('num', $total);
				$product_model->where(array('id' => $pid))->setDec('salecount', $total);
			}
			exit(json_encode(array('error_code' => false, 'msg' => '订单取消成功')));
		}
		exit(json_encode(array('error_code' => true, 'msg' => '购买成功的订单不能取消')));
	}
	
	public function updateOrder(){
		
		$this->checked_login();
		
		$product_cart_model = M('product_cart');
		$thisOrder = $product_cart_model->where(array('id'=>intval($_GET['id'])))->find();
		//检查权限
		if ($thisOrder['wecha_id']!=$this->wecha_id){
			exit();
		}
		$this->assign('thisOrder',$thisOrder);
		$carts = unserialize($thisOrder['info']);
		$totalCount = $totalFee = 0;
		$listNum = array();
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
		$this->assign('totalFee', $totalFee);
		$this->assign('listNum', $listNum);
		$this->assign('metaTitle','修改订单');
		
		$this->display();
	}
	public function deleteOrder(){
		
		$this->checked_login();
		
		$product_model=M('product');
		$product_cart_model=M('product_cart');
		$product_cart_list_model=M('product_cart_list');
		$thisOrder=$product_cart_model->where(array('id'=>intval($_GET['id'])))->find();
		//检查权限
		$id=$thisOrder['id'];
		if ($thisOrder['wecha_id']!=$this->wecha_id||$thisOrder['handled']==1){
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
		$this->redirect(U('Product/my',array('token'=>$_GET['token'],'wecha_id'=>$_GET['wecha_id'])));
	}
	
	//订单内容
	public function email_body(){
		$where['token']=$this->token;
		$where['wecha_id']=$this->wecha_id;
		$this->product_model=M('product');
		$this->product_cart_model=M('product_cart');
		$count= $this->product_cart_model->where($where)->count();
		$orders=$this->product_cart_model->where($where)->order('time DESC')->limit(0,1)->select();
		
		$now=time();
		if ($orders){
			$thisOrder=$orders[0];
			//订单信息
			$ordertype=$thisOrder['groupon']?"团购":"购物";
			$str="订单类型：".$ordertype."<br>订单编号：".$thisOrder['orderid']."<br>姓名：".$thisOrder['truename']."\r\n电话：".$thisOrder['tel']."\r\n地址：".$thisOrder['address']."\r\n下单时间：".date('Y-m-d H:i:s',$thisOrder['time'])."<br>";
			
			//订单详情
			$orderinfo = unserialize($thisOrder['info']);
			$data = $this->getCat($orderinfo);
			$products = $data[0];
			foreach ($products as $p){
				if(empty($p['detail'])){
					$str .=$p['name']."  ".$p['count']."件  单价：".$p['price']."元<br>";
				}else{
					foreach ($p['detail'] as $row){
						$detail=$p['formatTitle'].":".$row['formatName']."，".$p['colorTitle'].":".$row['colorName'];
						$str .=$p['name']."（".$detail."）  ".$row['count']."件  单价：".$row['price']."元<br>";
					}
				}
			}
			$str .="合计：".$thisOrder['price']."元";
			return $str;
		}else {
			return '';
		}
	}
	//打印内容
	//获得要打印内容
	public function getPrintcontet($orderid){
		$thisOrder =M('Product_cart')->where(array('orderid'=>$orderid))->find();
		if ($thisOrder){
			$orderType=$thisOrder['groupon']?"团购":"购物";;
			
			//商品信息
			
			$str="订单类型：".$orderType."\r\n订单编号：".$thisOrder['orderid']."\r\n姓名：".$thisOrder['truename']."\r\n电话：".$thisOrder['tel']."\r\n地址：".$thisOrder['address']."\r\n下单时间：".date('Y-m-d H:i:s',$thisOrder['time'])."\r\n打印时间：".date('Y-m-d H:i:s',time())."\r\n--------------------------------\r\n";
			//订单详情
			$orderinfo = unserialize($thisOrder['info']);
			$data = $this->getCat($orderinfo);
			$products = $data[0];
			foreach ($products as $p){
				if(empty($p['detail'])){
					$str .=$p['name']."  ".$p['count']."件  单价：".$p['price']."元<br>";
				}else{
					foreach ($p['detail'] as $row){
						$detail=$p['formatTitle'].":".$row['formatName']."，".$p['colorTitle'].":".$row['colorName'];
						$str .=$p['name']."（".$detail."）  ".$row['count']."件  单价：".$row['price']."元<br>";
					}
				}
			}
			$str.="\r\n----------------------------\r\n合计：".$thisOrder['price']."元\r\n";
			if($thisOrder['beizhu']!=''){
				$str=$str."     "."\r\n----------------------------\r\n".$thisOrder['beizhu'];
			}
			//$str=$str."     "."\r\n--------------------------------\r\n".$printermodel['Describe'];
			$str=$str."     "."\r\n------".$printer_set['head']."------\r\n";
			$str=$str."     "."\r\n     谢谢惠顾，欢迎下次光临\r\n----------------------------\r\n     智风微信提供技术支持\r\n";	
			return $str;
		}else{
			$this->error("无效订单！");			
		}	
	}
	
	function remove_html_tag($str){  //清除HTML代码、空格、回车换行符
		//trim 去掉字串两端的空格
		//strip_tags 删除HTML元素

		$str = trim($str);
		$str = @preg_replace('/<script[^>]*?>(.*?)<\/script>/si', '', $str);
		$str = @preg_replace('/<style[^>]*?>(.*?)<\/style>/si', '', $str);
		$str = @strip_tags($str,"");
		$str = @ereg_replace("\t","",$str);
		$str = @ereg_replace("\r\n","",$str);
		$str = @ereg_replace("\r","",$str);
		$str = @ereg_replace("\n","",$str);
		$str = @ereg_replace(" ","",$str);
		$str = @ereg_replace("&nbsp;","",$str);
		return trim($str);
	}
	
	private function checked_login() {
		// 如果whcha_id为空，则引导用户登录 
		$people = session('people');
		if (empty($_GET['wecha_id']) && empty($people)){
			//echo '空的wecha_id'.$_GET['wecha_id'];
			$this->redirect('Xiaoqu/People/login',array('re'=>urlencode($_SERVER['REQUEST_URI'])));
		}
	}
}

?>
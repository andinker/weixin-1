<?php
class GrouponAction extends ProductAction{
	public $token;
	public $wecha_id;
	public $product_model;
	public $product_cat_model;
	public $isDining;
	public $tplid;
	public $pageSize;
	public function _initialize(){
		parent::_initialize();
		$this->pageSize=8;
		$grouponConfig=S('grouponConfig'.$this->token);
		$grouponDetailConfig=unserialize($grouponConfig['config']);
		$this->tplid=intval($grouponDetailConfig['tplid']);
		$this->assign('pageSize',$this->pageSize);
		$this->assign('wecha_id',$this->_get('wecha_id'));
		$this->product_model=M('Product');
	}
	public function grouponIndex(){
		$where=array('token'=>$this->token,'groupon'=>1);
		$where['endtime']=array('gt',time());
		if (isset($_GET['catid'])){
			$catid=intval($_GET['catid']);
			$where['catid']=$catid;
			
			$thisCat=$this->product_cat_model->where(array('id'=>$catid))->find();
			$this->assign('thisCat',$thisCat);
		}
		if(IS_POST){
			$key = $this->_post('search_name');
            	$this->redirect(U('Groupon/grouponIndex',array('token'=>$this->token,'keyword'=>$key)));
		}
		if (isset($_GET['keyword'])){
            $where['name|intro|keyword'] = array('like',"%".$_GET['keyword']."%");
            $this->assign('isSearch',1);
		}
		$count = $this->product_model->where($where)->count();
		$this->assign('count',$count); 
		//排序方式
		$method=isset($_GET['method'])&&($_GET['method']=='DESC'||$_GET['method']=='ASC')?$_GET['method']:'DESC';
		$orders=array('time','discount','price','salecount');
		$order=isset($_GET['order'])&&in_array($_GET['order'],$orders)?$_GET['order']:'time';
		$this->assign('order',$order);
		$this->assign('method',$method);
		//
        	
		$products = $this->product_model->where($where)->order($order.' '.$method)->limit($this->pageSize)->select();
		$now=time();
		$i=0;
		if ($products){
			foreach ($products as $p){
				$products[$i]['new']=0;
				if ($now-$p['time']<3*24*3600){
					$products[$i]['new']=1;
				}
				$i++;
			}
		}
		$this->assign('products',$products);
		$this->assign('metaTitle','团购');
		$this->display('grouponIndex_');
		//$this->display('grouponIndex_'.$this->tplid);
	}
	public function ajaxGrouponProducts(){
		$where=array('token'=>$this->token,'groupon'=>1);
		$where['endtime']=array('gt',time());
		$page=isset($_GET['page'])&&intval($_GET['page'])>1?intval($_GET['page']):2;
		$pageSize=isset($_GET['pagesize'])&&intval($_GET['pagesize'])>1?intval($_GET['pagesize']):$this->pageSize;
		$start=($page-1)*$pageSize;
		//排序方式
		$method=isset($_GET['method'])&&($_GET['method']=='DESC'||$_GET['method']=='ASC')?$_GET['method']:'DESC';
		$method=$method=='ASC'?'DESC':'ASC';
		$orders=array('time','discount','price','salecount');
		$order=isset($_GET['order'])&&in_array($_GET['order'],$orders)?$_GET['order']:'time';
		//
		$products = $this->product_model->where($where)->order($order.' '.$method)->limit($start.','.$pageSize)->select();
		$str='{"products":[';
		if ($products){
			$comma='';
			foreach ($products as $p){
				$membercount=intval($p['salecount'])+intval($p['fakemembercount']);
				$str.=$comma.'{"id":"'.$p['id'].'","catid":"'.$p['catid'].'","storeid":"'.$p['storeid'].'","name":"'.$p['name'].'","price":"'.$p['price'].'","token":"'.$p['token'].'","keyword":"'.$p['keyword'].'","salecount":"'.$p['salecount'].'","logourl":"'.$p['logourl'].'","time":"'.$p['time'].'","oprice":"'.$p['oprice'].'","fakemembercount":"'.$p['fakemembercount'].'","membercount":"'.$membercount.'","enddate":"'.date('Y-m-d',$p['endtime']).'"}';
				$comma=',';
			}
		}
		$str.=']}';
		$this->show($str);
	}
	public function product(){
		$where=array('token'=>$this->token);
		if (isset($_GET['id'])){
			$id=intval($_GET['id']);
			$where['id']=$id;
		}
		$product=$this->product_model->where($where)->find();
		$this->assign('product',$product);
		if ($product['endtime']){
			$leftSeconds=intval($product['endtime']-time());
			$this->assign('leftSeconds',$leftSeconds);
		}
		$this->assign('metaTitle',$product['name']);
		$product['intro']=str_replace(array('&lt;','&gt;','&quot;','&amp;nbsp;'),array('<','>','"',' '),$product['intro']);
		$intro=$this->remove_html_tag($product['intro']);
		$intro=mb_substr($intro,0,30,'utf-8');
		$this->assign('intro',$intro);
		//店铺信息
		$company_model=M('Company');
		$where=array('token'=>$this->token,'display'=>1);
		
		$thisCompany=$company_model->where($where)->find();
		$this->assign('thisCompany',$thisCompany);
		//分店信息
		$branchStoreCount=$company_model->where(array('token'=>$this->token,'isbranch'=>1,'display'=>1))->count();
		$this->assign('branchStoreCount',$branchStoreCount);
		//销量最高的商品
		$sameCompanyProductWhere=array('token'=>$this->token,'id'=>array('neq',$product['id']));
		if ($product['dining']){
			$sameCompanyProductWhere['dining']=1;
		}
		if ($product['groupon']){
			$sameCompanyProductWhere['groupon']=1;
		}
		if (!$product['groupon']&&!$product['dining']){
			$sameCompanyProductWhere['groupon']=array('neq',1);
			$sameCompanyProductWhere['dining']=array('neq',1);
		}
		$products=$this->product_model->where($sameCompanyProductWhere)->limit('salecount DESC')->limit('0,5')->select();
		$this->assign('products',$products);
		$this->display('product_');
		//$this->display('product_'.$this->tplid);
	}
	public function detail(){
		$where=array('token'=>$this->token);
		if (isset($_GET['id'])){
			$id=intval($_GET['id']);
			$where['id']=$id;
		}
		$product=$this->product_model->where($where)->find();
		$product['intro']=html_entity_decode($product['intro']);
		$this->assign('product',$product);
		
		$this->assign('metaTitle',$product['name']);
		$this->display('detail_');
		//$this->display('detail_'.$this->tplid);
	}
	public function my(){
		$this->noaccess();
		$product_cart_model=M('product_cart');
		//$this->wecha_id
		$orders=$product_cart_model->where(array('token'=>$this->token,'groupon'=>1,'wecha_id'=>$this->wecha_id))->order('time DESC')->select();
		$unpaidCount=0;
		$unusedCount=0;
		if ($orders){
			foreach ($orders as $o){
				$products=unserialize($o['info']);
				//$firstProductID=$products
				if (!$o['paid']){
					$unpaidCount++;
				}
				if (!$o['sent']){
					$unusedCount++;
				}
			}
		}
		$this->assign('orders',$orders);
		$this->assign('unpaidCount',$unpaidCount);
		$this->assign('unusedCount',$unusedCount);
		$this->assign('ordersCount',count($orders));
		$this->assign('metaTitle','我的订单');
		$this->assign('hideTopButton',1);
		$this->display('my_');
		//$this->display('my_'.$this->tplid);
	}
	public function myOrders(){
		$this->noaccess();
		$where=array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'groupon'=>1);
		if (isset($_GET['used'])){
			if (intval($_GET['used'])==1){
				$title='已使用团购';
			}else {
				$title='未使用团购';
			}
			$where['handled']=intval($_GET['used']);
		}elseif (isset($_GET['paid'])){
			$title='待付款订单';
			$where['paid']=intval($_GET['paid']);
		}else{
			$title='全部订单';
		}
		$this->assign('title',$title);
		$product_cart_model=M('product_cart');
		//$this->wecha_id
		$orders=$product_cart_model->where($where)->order('time DESC')->select();
		//
		$productsIDs=array();
		if ($orders){
			foreach ($orders as $o){
				array_push($productsIDs,$o['productid']);
			}
		}
		if ($productsIDs){
		$products=M('Product')->where(array('id'=>array('in',$productsIDs)))->select();
		}
		//
		$productsByID=array();
		if ($products){
			foreach ($products as $p){
				$productsByID[$p['id']]=$p;
			}
		}
		if ($orders){
			$i=0;
			foreach ($orders as $o){
				$orders[$i]['logourl']=$productsByID[$o['productid']]['logourl'];
				$orders[$i]['productName']=$productsByID[$o['productid']]['name'];
				//$orders[$i]['productPrice']=$productsByID[$o['productid']]['price'];
				if (!$o['paid']&&$alipayConfig&&!$o['handled']){
					$orders[$i]['needPay']=1;
				}else {
					$orders[$i]['needPay']=0;
				}
				$i++;
			}
		}
		//
		$this->assign('orders',$orders);
		$this->assign('unpaidCount',$unpaidCount);
		$this->assign('unusedCount',$unusedCount);
		$this->assign('ordersCount',count($orders));
		$this->assign('metaTitle','我的订单');
		//
		
		//
		$this->assign('hideTopButton',1);
		$this->display('myOrders_');
		//$this->display('myOrders_'.$this->tplid);
	}
	public function search(){
		$this->display('search_');
		//$this->display('search_'.$this->tplid);
	}
	public function orderCart(){
		$this->noaccess();
		$userinfo_model=M('Userinfo');
		$token=$this->token;
		$thisUser=$userinfo_model->where(array('token'=>$token,'wecha_id'=>$this->wecha_id))->find();
		$this->assign('thisUser',$thisUser);

		if (IS_POST){
			$row=array();
			$orderid=$this->randStr(4).time();
			$row['orderid']=$orderid;
			//
			$row['truename']=$this->_post('truename');
			$row['tel']=$this->_post('tel');
			$row['address']=$this->_post('address');


			$row['token']=$token;
			$row['wecha_id']=$this->wecha_id;
			if (!$row['wecha_id']){
				$row['wecha_id']='null';
			}
			$time=time();
			$row['time']=$time;
			//分别加入3类订单
			$product_cart_model=M('product_cart');
			$row['total']=intval($_POST['quantity']);
			$row['price']=$row['total']*floatval($_POST['price']);
			$row['diningtype']=0;
			$row['productid']=intval($_POST['productid']);
			$row['code']=substr($row['wecha_id'],0,6).$time;
			$row['tableid']=0;
			$row['info']=serialize(array(intval($_POST['productid'])=>array('count'=>$row['total'],'price'=>intval($_POST['price']))));
			$row['groupon']=1;
			$row['dining']=0;
			$row['payment']=$this->_post('payment');
			$groupon_rt=$product_cart_model->add($row);
			//。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。

			$product_model=M('product');
			$product_cart_list_model=M('product_cart_list');
			$product_model->where(array('id'=>intval($_POST['productid'])))->setInc('salecount',$_POST['quantity']);
			//保存个人信息
			if ($_POST['saveinfo']){
				$userRow=array('tel'=>$row['tel'],'truename'=>$row['truename'],'address'=>$row['address']);
				if ($thisUser){
					$userinfo_model->where(array('id'=>$thisUser['id']))->save($userRow);
				}else {
					$userRow['token']=$token;
					$userRow['wecha_id']=$this->wecha_id;
					$userRow['wechaname']='';
					$userRow['qq']=0;
					$userRow['sex']=-1;
					$userRow['age']=0;
					$userRow['birthday']='';
					$userRow['info']='';
					//
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
			//下单成功通知
			if($groupon_rt){
				//店铺信息
				$cominfo=$this->company;
				//是否通知开关
				$inform=S('inform_'.$token);
				if(!$inform){
					$inform=M('Inform')->where(array('token'=>$token))->find();
					S('inform_'.$token,$inform);
				}
				if($inform['group']==1){
					$informstatus=true;
				}else{
					$proInform=unserialize($inform['group']);
				}
				if($informstatus||$proInform['s']==1){
					//发短信
					$phone=$row['tel'];
					$content =$row['truename']." 您在".$cominfo['name']."的订单已经提交成功,合计：".$totalFee." 元,";
					$content .="服务电话:".$cominfo['tel'].",感谢您的预订！";
					$this->Send_sms($phone,$content);
					//给商家发短信
					$smsset=M('sms_set')->where(array('token'=>$token,'status'=>1))->find();
					if($smsset['phone']){
						$sms_body="您的店铺：".$cominfo['name']."有新的订单，单号：".$orderid."，金额".$totalFee." 元";
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
				//打印
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
				$msgstr='订单提交成功，即将前往';
				$url='';
				//$url=$_SERVER['HTTP_HOST'];
				//支付方式
				$pay_code=$this->_post('payment');
				if ($pay_code){
					$msgstr.='支付页面';
					$url.=U('Pay/'.$pay_code,array('token'=>$token,'wecha_id'=>$this->wecha_id,'orderid'=>$orderid));
				}else {
					$msgstr.='订单列表';
					$url.=U('Groupon/my',array('token'=>$_GET['token'],'wecha_id'=>$_GET['wecha_id'],'success'=>1));
				}				
				$data=array('code'=>1,'msg'=>$msgstr,'url'=>$url);
				echo json_encode($data);exit;
			}else{
				$data=array('code'=>0,'msg'=>'订单提交失败！请重试！');
				echo json_encode($data);exit;
			}			
		}else {
			$where=array('token'=>$token);
			if (isset($_GET['id'])){
				$id=intval($_GET['id']);
				$where['id']=$id;
			}
			$product=$this->product_model->where($where)->find();
			$this->assign('product',$product);
			$this->display('orderCart_');
			//$this->display('orderCart_'.$this->tplid);
		}
	}
	public function deleteOrder(){
		$this->noaccess();
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
		$product_model->where(array('id'=>$k))->setDec('salecount',$thisOrder['total']);
		$this->redirect($_SERVER['HTTP_REFERER']);
	}
	public function orderDetail(){
		//是否要支付
		/*$alipay_config_db=M('Alipay_config');
		$alipayConfig=$alipay_config_db->where(array('token'=>$this->token))->find();
		$this->assign('alipayConfig',$alipayConfig);*/
		//
		$product_cart_model=M('product_cart');
		$thisOrder=$product_cart_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'id'=>intval($_GET['id'])))->find();

		//
		$product_model=M('product');
		$thisProduct=$product_model->where(array('id'=>$thisOrder['productid']))->find();
		$this->assign('thisProduct',$thisProduct);
		//
		if (!$thisOrder['paid']&&$alipayConfig&&!$thisOrder['handled']){
			$thisOrder['needPay']=1;
		}else {
			$thisOrder['needPay']=0;
		}
		$this->assign('thisOrder',$thisOrder);
		$this->assign('hideTopButton',1);
		//
		$this->display('orderDetail_');
		//$this->display('orderDetail_'.$this->tplid);
	}
	public function company($display=1){
		//店铺信息
		$company_model=M('Company');
		$where=array('token'=>$this->token);
		if (isset($_GET['companyid'])){
			$where['id']=intval($_GET['companyid']);
		}
		$where['display']=1;
		$thisCompany=$company_model->where($where)->find();
		$this->assign('thisCompany',$thisCompany);
		//分店信息
		$branchStores=$company_model->where(array('token'=>$this->token,'isbranch'=>1,'display'=>1))->order('taxis ASC')->select();
		$branchStoreCount=count($branchStores);
		$this->assign('branchStoreCount',$branchStoreCount);
		$this->assign('branchStores',$branchStores);
		$this->assign('metaTitle','公司信息');
		if($display){
			$this->display('company_');
			//$this->display('company_'.$this->tplid);
		}
	}
	public function companyMap(){
		$this->apikey=C('baidu_map_api');
		$this->assign('apikey',$this->apikey);
		$this->company(0);
		$this->assign('hideTopButton',1);
		$this->display('companyMap_');
		//$this->display('companyMap_'.$this->tplid);
	}
	public function handle(){
		$this->noaccess();
		$product_cart_model=M('product_cart');
		if (IS_POST){
			$staff_db=M('Company_staff');
			$thisStaff=$staff_db->where(array('username'=>$this->_post('username'),'token'=>$this->_get('token')))->find();
			if (!$thisStaff){
				echo'{"success":-4,"msg":"用户名和密码不匹配"}';
				exit();
			}else {
				if (md5($this->_post('password'))!=$thisStaff['password']){
					echo'{"success":-4,"msg":"用户名和密码不匹配"}';
					exit();
				}else {
					$now=time();
					$arr['handleduid']=$thisStaff['id'];
					$arr['handledtime']=$time;
					$arr['handled']=1;
					$arr['sent']=1;
					//
					$product_cart_model->where(array('id'=>intval($_POST['id'])))->save($arr);
					echo'{"success":1,"msg":"处理成功"}';
					exit();
				}
			}
			//
		}else{
			//是否要支付
			/*$alipay_config_db=M('Alipay_config');
			$alipayConfig=$alipay_config_db->where(array('token'=>$this->token))->find();
			$this->assign('alipayConfig',$alipayConfig);*/
			//
			
			$thisOrder=$product_cart_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'id'=>intval($_GET['id'])))->find();

			//
			$product_model=M('product');
			$thisProduct=$product_model->where(array('id'=>$thisOrder['productid']))->find();
			$this->assign('thisProduct',$thisProduct);
			//
			if (!$thisOrder['paid']&&$alipayConfig&&!$thisOrder['handled']){
				$thisOrder['needPay']=1;
			}else {
				$thisOrder['needPay']=0;
			}
			$this->assign('thisOrder',$thisOrder);
			$this->assign('hideTopButton',1);
			$this->display('handle_');
			//$this->display('handle_'.$this->tplid);
		}
	}
	//groupon sn
	function randStr($randLength){
		$randLength=intval($randLength);
		$chars='abcdefghjkmnpqrstuvwxyz';
		$len=strlen($chars);
		$randStr='';
		for ($i=0;$i<$randLength;$i++){
			$randStr.=$chars[rand(0,$len-1)];
		}
		return $randStr;
	}
	public function payReturn(){
		//$this->noaccess();
		$product_cart_model=M('product_cart');
		$out_trade_no=$_GET['orderid'];
		$order=$product_cart_model->where(array('orderid'=>$out_trade_no))->find();
		if (!$this->wecha_id){
			$this->wecha_id=$order['wecha_id'];
		}
		$sepOrder=0;
		if (!$order){
			$order=$product_cart_model->where(array('id'=>$out_trade_no))->find();
			$sepOrder=1;
		}
		if($order){
			if($order['paid']!=1){exit('该订单还未支付');}
			/************************************************/
			Sms::sendSms($this->token,'您的微信里有团购订单已经付款');
			/************************************************/
			$this->redirect(U('Groupon/myOrders',array('token'=>$order['token'],'wecha_id'=>$order['wecha_id'])));
		}else{
			exit('订单不存在：'.$out_trade_no);
		}
	}
	
	/**
	 * 计算一次购物的总的价格与数量
	 * @param array $carts
	 */
	public function getCat($carts = '')
	{
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
	
	public function noaccess(){
		if (!$this->wecha_id){
			$this->error('您无权参与，请关注微信号“'.$this->wxuser['wxname'].'”，然后回复“团购”便可进行',U('Groupon/grouponIndex',array('token'=>$this->token)));
		}
	}
}
	
?>
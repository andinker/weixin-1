<?php
class DiningAction extends BaseAction{
	public $token;
	public $wecha_id;
	public $dining_model;
	public $dining_cat_model;

	public function _initialize(){
		parent::_initialize();
		$this->token = $this->_get('token');
		$this->wecha_id	= $this->_get('wecha_id');
		
		/*this's wxoauth2.0 by 9.10wzh start*/	
		$wxuser=$this->wxuser;	
		if(!$wxuser){
			$this->wxuser=$wxuser=D('Wxuser')->where(array('token'=>$this->token))->find();
			//S('wxuser_'.$this->token,$this->wxuser);
		}
		$this->siteUrl=C('site_url');
		$this->assign('wxuser',$this->wxuser);
		if(empty($_GET['wecha_id'])&&$this->wxuser['winxintype']==3&&!isset($_GET['code'])&&$this->wxuser['oauth']){
			$customeUrl=$this->siteUrl.$_SERVER['REQUEST_URI'];
			$scope='snsapi_base';
			$oauthUrl='https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->wxuser['appid'].'&redirect_uri='.urlencode($customeUrl).'&response_type=code&scope='.$scope.'&state=oauth#wechat_redirect';
			header('Location:'.$oauthUrl);
		}
		if(isset($_GET['code'])&&isset($_GET['state'])&&isset($_GET['state'])=='oauth'){
			$rt=$this->curlGet('https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$this->wxuser['appid'].'&secret='.$this->wxuser['appsecret'].'&code='.$_GET['code'].'&grant_type=authorization_code');
			$jsonrt=json_decode($rt,1);
			$openid=$jsonrt['openid'];
			$access_token=$jsonrt['access_token'];
			$_GET['wecha_id']=$openid;
			$this->wecha_id=$openid;
		}
		/*this's wxoauth2.0 by 9.10wzh end*/
		/*if (!$this->wecha_id){
			$this->wecha_id='null';
		}*/
		$this->assign('token',$this->token);
		$this->assign('wecha_id',$this->wecha_id);
		
		$this->dining_model=M('Dining');
		$this->dining_cat_model=M('Dining_cat');
		$this->dining_company=M('dining_company');
		$this->dining_tables=M('dining_tables');
		$this->dining_cart_model=M('Product_cart');
		$this->dining_cart_list=M('Product_cart_list');
		$this->assign('staticFilePath',RES."/weidingcan");
		//订单类型
		if (isset($_GET['dtype'])){
			$dtype=$this->_get('dtype');
			$_SESSION['dtype']=$dtype;
		}else{
			$dtype=$_SESSION['dtype'];
		}
		switch ($dtype){
			case 1:
				$dtype_name='点餐';
				break;
			case 2:
				$dtype_name='外卖';
				break;
			case 3:
				$dtype_name='预定餐桌';
				break;
		}
		$this->dtype=$dtype;
		$this->assign('dtype_name',$dtype_name);
		$this->assign('dtype',$dtype);
		//当前店铺
		$storeid=$this->_get('storeid','intval');
		$company_info=M('company')->where(array('token'=>$this->token,'id'=>$storeid))->find();
		$store_info=$this->dining_company->where(array('token'=>$this->token,'storeid'=>$storeid))->find();
		$this->storeid=$storeid;
		$this->company_info=$company_info;
		$this->store_info=$store_info;
		$this->assign('storeid',$storeid);
		$this->assign('company_info',$company_info);
		$this->assign('store_info',$store_info);
		
		//获取首页配置
		$diningConfig =M('Reply_info')->where(array('infotype'=>'Dining','token'=>$this->token))->find();
		$this->assign('diningConfig',unserialize($diningConfig['config']));
		
		//是否支持在线支付
		$payment =M('payment')->where(array('token'=>$this->token,'enabled'=>1))->select();
		$this->payment=$payment;
		$this->assign('payment',$payment);
		//在线客服
		$kefu=M('Kefu')->where(array('token'=>$this->token))->find();
		$this->assign('kefu',$kefu);
		//是否通知开关
		//$inform=S('inform_'.$this->token);
		if(!$inform){
			$inform=M('Inform')->where(array('token'=>$this->token))->find();
			//S('inform_'.$this->token,$inform);
		}
		if($inform['dining']==1){
			$this->informstatus=true;
		}else{
			$this->proInform=unserialize($inform['dining']);
		}
		
	}
	
	public function index(){
		//查询总店信息
		$Company=M('Company')->where(array('token'=>$this->token,'isbranch'=>0))->find();
		//查询首页配置
		$Reply_info=M('Reply_info')->where(array('token'=>$this->token,'infotype'=>'Dining'))->find();
		
		$this->assign('logourl',$Company['logourl']);
		$this->assign('diningSet',$Reply_info);
		$this->assign('metaTitle','订餐首页');
		$this->display();
	}
	public function stores(){
		$company_model=M('company');		
		$stores=$company_model->where(array('token'=>$this->token,'status'=>1))->select();
		/*if($_GET['category']){
			$where['category']=intval($_GET['category']);
		}
		if($_GET['areaid']){
			$where['areaid']=intval($_GET['areaid']);
		}*/
		foreach ($stores as $k=>$c){
				$storeid=$c['id'];
				$where['storeid']=$storeid;
				$dining_company=$this->dining_company->where($where)->find();
				$stores[$k]['time']=$dining_company['time'];
				$stores[$k]['scope']=$dining_company['scope'];
				$stores[$k]['money']=$dining_company['money'];
				$stores[$k]['areaid']=$dining_company['areaid'];
				$stores[$k]['category']=$dining_company['category'];
		}	
		
		$where['token']=$this->token;
		$where['_string']="type='dining' or type=''";
		$category=M('Company_cate')->where($where)->select();
		$storearea=M('Company_area')->where($where)->select();
		$this->assign('category',$category);
		$this->assign('storearea',$storearea);
		//订餐类型默认为1
		$dtype=$_GET['dtype']?$_GET['dtype']:1;
		
		$this->assign('stores',$stores);
		$this->assign('StoreCount',count($stores));
		$this->assign('metaTitle','店铺列表');
		if(count($stores)==1){
			($dtype==3)?$this->redirect('Dining/tables',array('token'=>$this->token,'storeid'=>$stores[0]['id'],'dtype'=>$this->dtype,'wecha_id'=>$this->wecha_id)):$this->redirect('Dining/cats',array('token'=>$this->token,'storeid'=>$stores[0]['id'],'dtype'=>$this->dtype,'wecha_id'=>$this->wecha_id));
		}else{
			$this->display();
		}
	}
	
	public function cats(){	
		$catid=intval($_GET['catid']);
		$this->assign('Catid',$catid);
		if($catid){
			$cat_data=$this->dining_cat_model->where(array('id'=>$catid,'token'=>$this->token))->find();
			
			$this->assign('thisCat',$cat_data);
		}
		//多级分类支持
		$subcats_num =$this->dining_cat_model->where(array('parentid'=>$catid,'token'=>$this->token))->count();
		$parentid = $subcats_num?$catid:$cat_data['parentid'];
		$catWhere = array('parentid'=>$parentid,'token'=>$this->token);
		if ($parentid==0){
			$catWhere['storeid']=array(array('eq',$this->storeid),array('eq',0),'or');
		}
		$cats = $this->dining_cat_model->where($catWhere)->order('id asc')->select();
		$this->assign('cats',$cats);
		//产品列表
		$where=array('token'=>$this->token);
		//取下级所有分类ID
		$subids=$this->subcat_ids($catid);
		if($subids){
		$where['catid']=array('in',$subids);
		}
		$count = $this->dining_model->where($where)->count();
		$this->assign('count',$count); 
		//排序方式
		$method=isset($_GET['method'])&&($_GET['method']=='DESC'||$_GET['method']=='ASC')?$_GET['method']:'DESC';
		$orders=array('time','discount','price','salecount');
		$order=isset($_GET['order'])&&in_array($_GET['order'],$orders)?$_GET['order']:'time';
		$this->assign('order',$order);
		$this->assign('method',$method);
		//
		$products = $this->dining_model->where($where)->order($order.' '.$method)->select();
		//格式化简介
		foreach($products as $k=>$v){
			$products[$k]['intro']=$this->remove_html_tag($v['intro']);
		}
		$this->assign('products',$products);
		$this->display();
	}
	public function subcat_ids($pid=0){
		$where=array('token'=>$this->token,'parentid'=>$pid);
		if ($pid==0){
			$where['storeid']=array(array('eq',$this->storeid),array('eq',0),'or');
		}
		$cats = $this->dining_cat_model->where($where)->order('id asc')->select();
		$ids="";
		foreach ($cats as $v){
			$ids .=','.$this->subcat_ids($v['id']);
		}
		if($pid)
		return $pid.$ids;
		else
		return substr($ids,1);
	}
	public function about(){
		$thisCompany=$this->dining_company->where(array('token'=>$this->token,'storeid'=>$this->storeid))->find();
		$Company=M('Company')->where(array('token'=>$this->token,'id'=>$this->storeid))->find();
		$this->assign('thisCompany',$thisCompany);
		$this->assign('Company',$Company);
		$this->display();
	}

	public function calCartInfo($carts=''){
		$totalFee=0;
		$totalCount=0;
		if (!$carts){
			if (!isset($_SESSION['session_cart_products'])||!strlen($_SESSION['session_cart_products'])){
			$carts=array();
			}else {
			$carts=unserialize($_SESSION['session_cart_products']);
			}
		}
		if ($carts){
			foreach ($carts as $c){
				if ($c){
					$totalFee+=floatval($c['price'])*$c['count'];
					$totalCount+=intval($c['count']);
				}
			}
		}
		return array($totalCount,$totalFee);
	}

	public function cart(){
		$totalFee=0;
		$totalCount=0;
		$token=$this->token;
		//获取个人信息
		$userinfo_model=M('Userinfo');
		$thisUser=$userinfo_model->where(array('token'=>$token,'wecha_id'=>$this->wecha_id))->find();
		$this->assign('thisUser',$thisUser);
		
		//获取首页配置
		$diningConfig =M('Reply_info')->where(array('infotype'=>'Dining','token'=>$token))->find();
		$this->assign('diningConfig',$diningConfig);
		//可以预定多少天内的
		$diningConfigDetail=unserialize($diningConfig['config']);
		if (!$diningConfigDetail||!$diningConfigDetail['yudingdays']){
			$days=7;
		}else {
			$days=$diningConfigDetail['yudingdays'];
		}
		$time=time();
		$secondsOfDay=24*60*60;
		$dateTimes=array();
		for ($i=0;$i<$days;$i++){
			array_push($dateTimes,$time+$i*$secondsOfDay);
		}
		$this->assign('dateTimes',$dateTimes);

		$orderHour=date('H',$time);
		$this->assign('orderHour',$orderHour);
		$hours=array();
		for ($i=0;$i<24;$i++){
			array_push($hours,$i);
		}
		//餐桌
		$map['token']=$token;
		$map['storeid']=$this->storeid;
		$tables=$this->dining_tables->where($map)->order('taxis ASC')->select();
		$this->assign('tables',$tables);
		$this->assign('hours',$hours);
		$this->assign('totalCount',$totalCount);
		$this->assign('totalFee',$totalFee);
		$this->assign('metaTitle',"下订单");
		//店铺信息
		$store_info=$this->store_info;
		$sctime=explode(',',unserialize($store_info['sctime']));
		$this->assign('sctime',$sctime);
		$this->display();
	}
	public function dingdanpost(){
			//查询当前会员信息
			$userinfo_model=M('Userinfo');
			$thisUser=$userinfo_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
			$dining_cart_model=M('Product_cart');
			
			//提交
			if (IS_POST){
				$token=$this->_post('token');
				$wecha_id=$this->_post('wecha_id');
				$storeid=$this->_post('storeid');
				$carts=array();
				$goodsData=$this->_post('goodsData');
				if($this->_post('diningtype') !=3){
				//商品信息
					$arr = array_filter(explode(';',$goodsData));
					if(empty($arr)){
						//$this->error('购物车为空！');
						$json = array(
							'error'=> 1,
							'msg'=> '购物车为空！',
							'url'=> U('Dining/cart',array('token'=>$token,'wecha_id'=>$wecha_id,'dtype'=>$this->_post('diningtype'),'storeid'=>$storeid))
						);
						echo  json_encode($json);exit;
					}
					foreach ($arr as $k=>$v){
						$p = explode(',',$v);
						$carts[$p[0]]=array('price'=>$p[1],'count'=>$p[2]);
					}
				}
				//订单信息
				$totalFee=$this->_post('price');
				$totalnum=$this->_post('count');
				$productids=array();
				foreach ($carts as $k=>$c){
					array_push($productids,$k);
				}
				//订单号
				$orderid=date("YmdHis").rand(1000,2000);
				$row=array();
				$row['token']=$token;
				$row['wecha_id']=$wecha_id;
				$row['storeid']=$storeid;
				$row['diningtype']=$this->_post('diningtype');
				$row['orderid']=$orderid;
				//联系资料
				$row['truename']=$this->_post('truename');
				$row['tel']=$this->_post('tel');
				$row['address']=$this->_post('address');
				$row['beizhu']=$this->_post('beizhu');
				//$payment=$this->_post('payment');
				//支付方式
				//$row['payment']=$payment?$payment:0;
				$row['payment']=0;
				$buytimestamp=$this->_post('buytimestamp');//购买时间
				if ($buytimestamp){
					$row['year']=date('Y',$buytimestamp);
					$row['month']=date('m',$buytimestamp);
					$row['day']=date('d',$buytimestamp);
					$row['hour']=$this->_post('hour');
				}
				$row['time']=time();
				//加入订餐订单
				$row['total']=$totalnum;
				$row['price']=$totalFee;
				$row['diningtype']=intval($this->_post('diningtype'));
				$row['buytime']=$buytimestamp?$row['month'].'月'.$row['day'].'日'.$row['hour'].'点':'';
				$row['tableid']=intval($this->_post('tableid'));
				$row['info']=$carts?serialize($carts):'';
				$row['groupon']=0;
				$row['dining']=1;
				$order_id=$dining_cart_model->add($row);
				if(empty($order_id)){
					//$this->error('订单提交失败');
					$json = array(
						'error'=> 1,
						'msg'=> '订单提交失败',
						'url'=> U('Dining/cart',array('token'=>$token,'wecha_id'=>$wecha_id,'dtype'=>$this->_post('diningtype'),'storeid'=>$storeid))
					);
					echo  json_encode($json);exit;
				}
				//订单商品列表
				$dining_model=M('Dining');
				$dining_cart_list_model=M('Product_cart_list');
				$crow=array();
				foreach ($carts as $k=>$c){
					$crow['cartid']=$order_id;
					$crow['productid']=$k;
					$crow['price']=$c['price'];
					$crow['total']=$c['count'];
					$crow['wecha_id']=$wecha_id;
					$crow['token']=$token;
					$crow['time']=time();
					$crow['goodstype']='dining';
					$dining_cart_list_model->add($crow);
					$dining_model->where(array('id'=>$k))->setInc('salecount',$c['count']);
				}
				
				//保存个人信息
				$userRow=array('tel'=>$row['tel'],'truename'=>$row['truename'],'address'=>$row['address']);
				if ($thisUser){
					$userinfo_model->where(array('id'=>$thisUser['id']))->save($userRow);
				}else {
					$userRow['token']=$token;
					$userRow['wecha_id']=$wecha_id;
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
				
				//下单通知
				if($order_id){
					//$this->Sendsms($order_id);
					//$this->Sendemail($order_id);
					//$this->print_order($order_id);//无线打印
					
					if( ( (empty($this->payment)===true)||($thisUser['account'] > 0) ) && $totalFee>0){
						$url=U('Dining/orderpay',array('token'=>$token,'wecha_id'=>$wecha_id,'id'=>$order_id,'storeid'=>$storeid));
					}else {
						$url=U('Dining/dingdan',array('token'=>$token,'wecha_id'=>$wecha_id,'storeid'=>$storeid));
					}
					$json = array(
						'error'=> 0,
						'order_id'=> $order_id,
						'msg'=> '订单提交成功',
						'url'=> $url
					);
					echo  json_encode($json);exit;
				}
			}
		}
	public function orderpay(){
		if (IS_POST){
			$orderid=$this->_post('orderid');
			$pay_code=$this->_post('payment');
			if ($pay_code){
				$this->redirect(U('Pay/'.$pay_code,array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'orderid'=>$orderid,'storeid'=>$this->storeid)));
			}
		}
		$thisOrder=$this->dining_cart_model->where(array('id'=>intval($_GET['id']),'wecha_id'=>$this->wecha_id))->find();
		$thisOrder['storename']=M('company')->where(array('token'=>$this->token,'id'=>$thisOrder['storeid']))->getField('name');
		$this->assign('thisOrder',$thisOrder);

		$carts=unserialize($thisOrder['info']);
		$totalFee=$thisOrder['price'];
		$totalCount=$thisOrder['total'];
		$products=array();
		$ids=array();
		foreach ($carts as $k=>$c){
			if (is_array($c)){
				$productid=$k;
				if (!in_array($productid,$ids)){
					array_push($ids,$productid);
				}
			}
		}
		if (count($ids)){
			$products=$this->dining_model->where(array('id'=>array('in',$ids)))->select();
			foreach ($products as $k=>$p){
				$products[$k]['count']=$carts[$p['id']]['count'];
			}
		}			
		$this->assign('products',$products);
		$this->assign('totalFee',$totalFee);
		$this->assign('orderName',$orderName);
		$this->assign('totalCount',$totalCount);	
		$this->display();
	}
	public function dingdan(){
		$where['token']=$this->token;
		$where['wecha_id']=$this->wecha_id;
		$where['dining']=1;
		if($this->_get('isstore','intval')){
			if($this->storeid){$where['storeid']=$this->storeid;}
		}
		$orders=$this->dining_cart_model->where($where)->order('time DESC')->select();
		if(!$orders[0]['printed']){
			$this->print_order($orders[0]['token'],$orders[0]['storeid'],$orders[0]['orderid']);
		}
		$this->assign('orders',$orders);
		$this->assign('ordersCount',count($orders));
		$this->assign('metaTitle','我的订单');
		$this->display();
	}
	public function xiangqing(){
		$thisOrder=$this->dining_cart_model->where(array('id'=>intval($_GET['id']),'wecha_id'=>$this->wecha_id))->find();
		$thisOrder['storename']=M('company')->where(array('token'=>$this->token,'id'=>$thisOrder['storeid']))->getField('name');
		$thisOrder['tableName']=$this->dining_tables->where(array('token'=>$this->token,'id'=>$thisOrder['tableid']))->getField('name');
		$this->assign('thisOrder',$thisOrder);

		$carts=unserialize($thisOrder['info']);
		$totalFee=$thisOrder['price'];
		$totalCount=$thisOrder['total'];
		$products=array();
		$ids=array();
		foreach ($carts as $k=>$c){
			if (is_array($c)){
				$productid=$k;
				if (!in_array($productid,$ids)){
					array_push($ids,$productid);
				}
			}
		}
		if (count($ids)){
			$products=$this->dining_model->where(array('id'=>array('in',$ids)))->select();
			foreach ($products as $k=>$p){
				$products[$k]['count']=$carts[$p['id']]['count'];
			}
		}
		$this->assign('products',$products);
		$this->assign('totalFee',$totalFee);
		$this->assign('orderName',$orderName);
		$this->assign('totalCount',$totalCount);
		if($thisOrder['diningtype']==3){
			$this->display('tables_orderinfo');
		}else{
			$this->display();
		}
	}
	public function deleteOrder(){
		$dining_cart_list_model=M('Product_cart_list');
		$thisOrder=$this->dining_cart_model->where(array('id'=>intval($_GET['id'])))->find();
		//检查权限
		$id=$thisOrder['id'];
		if ($thisOrder['wecha_id'] !=$this->wecha_id || $thisOrder['handled']==1){
			$this->error('不能进行此操作!');
		}
		//删除订单和订单列表
		$this->dining_cart_model->where(array('id'=>$id))->delete();
		$dining_cart_list_model->where(array('cartid'=>$id))->delete();
		//商品销量做相应的减少
		$carts=unserialize($thisOrder['info']);
		foreach ($carts as $k=>$c){
			if (is_array($c)){
				$productid=$k;
				$price=$c['price'];
				$count=$c['count'];
				$this->dining_model->where(array('id'=>$k))->setDec('salecount',$c['count']);
			}
		}
		$this->redirect(U('Dining/dingdan',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'storeid'=>$this->storeid)));	
	}
	//独立订座页
	public function tables(){
		//获取个人信息
		$userinfo_model=M('Userinfo');
		$thisUser=$userinfo_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
		$this->assign('thisUser',$thisUser);
		//获取首页配置
		$diningConfig =M('Reply_info')->where(array('infotype'=>'Dining','token'=>$this->token))->find();
		$this->assign('diningConfig',$diningConfig);
		//可以预定多少天内的
		$diningConfigDetail=unserialize($diningConfig['config']);
		if (!$diningConfigDetail||!$diningConfigDetail['yudingdays']){
			$days=7;
		}else {
			$days=$diningConfigDetail['yudingdays'];
		}
		$time=time();
		$secondsOfDay=24*60*60;
		$dateTimes=array();
		for ($i=0;$i<$days;$i++){
			array_push($dateTimes,$time+$i*$secondsOfDay);
		}
		$this->assign('dateTimes',$dateTimes);

		$orderHour=date('H',$time);
		$this->assign('orderHour',$orderHour);
		$hours=array();
		for ($i=0;$i<24;$i++){
			array_push($hours,$i);
		}
		$this->assign('hours',$hours);
		//查询可订桌
		$map['token']=$this->token;
		$map['storeid']=$this->storeid;
		$tables=$this->dining_tables->where($map)->select();
		$this->assign('tables',$tables);
		$this->assign('metaTitle','桌台列表');
		$this->display();
	}
	/**
	 * 检查某时间段内是否已经有桌子被预定
	 *
	 */
	public function ajaxTables(){
		$token=$this->_get('token');
		$time=$this->_get('time');
		$hour=intval($this->_get('hour'));
		$year=date('Y',$time);
		$month=date('m',$time);
		$day=date('d',$time);
		$occupiedTables=array();
		$dining_cart_model=M('Product_cart');;
		$otableWhere=array();
		$otableWhere['token']=$token;
		$otableWhere['storeid']=$this->storeid;
		$otableWhere['hour']=array('between',array($hour-1,$hour+1));//1个小时内不能再定
		$otableWhere['year']=$year;
		$otableWhere['month']=$month;
		$otableWhere['day']=$day;
		$otables=$dining_cart_model->where($otableWhere)->select();
		$str='';
		$comma='';
		if ($otables){
			foreach ($otables as $t){
				if (!in_array($t['tableid'],$occupiedTables)){
					$str.=$comma.$t['tableid'];
					array_push($occupiedTables,$t['tableid']);
					$comma=',';
				}
			}
		}
		/*查询可订桌
		$map['id']  = array('not in',$str);
		$map['token']=$this->token;
		$map['storeid']=$this->storeid;
		$tables=$this->dining_tables->where($map)->select();
		$select='<option value="">请选择餐桌</option';
		foreach ($tables as $t){
			$select .='<option value="'.$t['id'].'">'.$t['name'].'</option';
		}*/
		echo $str;
	}
	public function my(){
		if(IS_POST){
			$row['wechaname']=$this->_post('wechaname');
			$row['truename']=$this->_post('truename');
			$row['tel']=$this->_post('tel');
			$row['address']=$this->_post('address');
			
			$row['token']=$this->token;
			$row['wecha_id']=$this->wecha_id;
			if (!$row['wecha_id']){
				$row['wecha_id']='null';
			}
			$userinfo_model=M('Userinfo');
			$where=array('token'=>$this->token,'wecha_id'=>$this->wecha_id);
			if($where){
			$thisUser=$userinfo_model->where($where)->save($row);
			}else{
				$thisUser=$userinfo_model->where($where)->add($row);
				}
			if($thisUser){
				$this->success('成功',U('Dining/my',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'storeid'=>$this->storeid)));
			}else{
				$this->error('操作失败，请稍候再试');
			}
		}else{
			$userinfo_model=M('Userinfo');
			$thisUser=$userinfo_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
			$this->assign('thisUser',$thisUser);
			
			$this->assign('metaTitle','我的资料');
			$this->display();
		}
	}
	//发邮件
	public function Sendemail(){	
		if($this->informstatus||$this->proInform['e']==1){
			$order_id=$this->_get('orderid');
			$storeid=$this->_get('storeid');
			$cominfo=$this->company_info;
			$where['token']=$this->token;
			$where['wecha_id']=$this->wecha_id;
			$where['id']=$order_id;
			//邮件是否开启
			$emailwhere['token']=$this->token;
			$emailwhere['status']=1;
			$emailwhere['_string']='storeid='.$storeid.' OR storeid=0';
			$set_state =M('email_set')->where($emailwhere)->getField('status');
			if ($set_state==0) return;
			
			$thisOrder =$this->dining_cart_model->where($where)->find();
			if ($thisOrder){
				$diningtype = $thisOrder['diningtype'];
				switch ($diningtype){
					case 0:
						$orderType='购物';
						break;
					case 1:
						$orderType='点餐';
						break;
					case 2:
						$orderType='外卖';
						break;
					case 3:
						$orderType='预定';
						break;
				}
				//订餐信息
				if ($thisOrder['tableid']) {
					$thisTable=$this->dining_tables->where(array('id'=>$thisOrder['tableid']))->find();
					$thisOrder['tableName']=$thisTable['name'];
				}else{
					$thisOrder['tableName']='未指定';
				}
				$str="订单类型：".$orderType."<br>订单编号：".$thisOrder['orderid']."<br>姓名：".$thisOrder['truename']."\r\n电话：".$thisOrder['tel']."\r\n地址：".$thisOrder['address']."\r\n下单时间：".date('Y-m-d H:i:s',$thisOrder['time'])."<br>";
				if($diningtype !=2){
					$str .="桌台：".$thisOrder['tableName']."<br>";
				}
				//订单详情
				if($diningtype==3){
					$str .="订金：".$thisOrder['price']."元";
				}else{
					$carts=unserialize($thisOrder['info']);
					$totalFee=0;
					$totalCount=0;
					$products=array();
					$ids=array();
					foreach ($carts as $k=>$c){
						if (is_array($c)){
							$productid=$k;
							$price=$c['price'];
							$count=$c['count'];
							if (!in_array($productid,$ids)){
								array_push($ids,$productid);
							}
							$totalFee +=$price*$count;
							$totalCount +=$count;
						}
					}
					if (count($ids)){
						$products=$this->dining_model->where(array('id'=>array('in',$ids)))->select();
					}
					if ($products){
						$i=0;
						foreach ($products as $p){
							$products[$i]['count']=$carts[$p['id']]['count'];
							$str .=$p['name']."  ".$products[$i]['count']."份  单价：".$p['price']."元<br>";
							$i++;
						}
					}
					$str .="合计：".$thisOrder['price']."元";
				}
				//发邮件
				$subject="您有新的订单，单号：".$thisOrder['orderid']."，预定人：".$thisOrder['truename'];
				$body="预定店铺：".$cominfo['name']."<br>".$str;
				//邮件列表
				$set_state =M('email_set')->field('id')->where($emailwhere)->order('storeid','DESC')->limit(0,1)->select();
				//foreach($set_state as $val){
				$this->Send_email($set_state[0]['id'],$subject,$body);
				//}			
			}
		}
	}
	//发短信
	public function Sendsms(){		
		if($this->informstatus||$this->proInform['s']==1){
			$order_id=$this->_get('orderid');
			//短信是否开启
			$set=M('sms_set')->where(array('token'=>$this->token))->find();
			if ($set['status']==0) return;
			//店铺信息
			$cominfo=$this->company_info;
			$where['token']=$this->token;
			$where['wecha_id']=$this->wecha_id;
			$where['id']=$order_id;
			$order_data =$this->dining_cart_model->where($where)->find();
			$diningtype = $order_data['diningtype'];
			$orderid=$order_data['orderid'];
			$totalFee=$order_data['price'];
			if($diningtype ==1){
				$sms_body=$order_data['truename'].",您在".$cominfo['name']."订餐成功,合计：".$totalFee." 元,订单号：".$orderid."，感谢您的预订！";
			}
			if($diningtype ==2){
				$sms_body=$order_data['truename'].",您在".$cominfo['name']."订单将在30分钟内送到,合计：".$totalFee." 元,订单号：".$orderid."，送餐查询:".$cominfo['tel'].",感谢您的预订！";
			}
			if($diningtype ==3){
				$sms_body=$order_data['truename'].",您在".$cominfo['name']."订座成功,订金：".$totalFee." 元,订单号：".$orderid."，感谢您的预订！";
			}
			if ($sms_body) {
				$this->Send_sms($order_data['tel'],$sms_body);
			}
			//给商家发短信
			if($set['phone']){
				$sms_body="您的店铺：".$cominfo['name']."有新的订单,单号：".$orderid."，金额".$totalFee." 元";
				$this->Send_sms($set['phone'],$sms_body);
			}
		}
	}
	/*public function print_order(){
		$order_id=$this->_get('orderid');
		
		$where['token']=$this->token;
		$where['wecha_id']=$this->wecha_id;
		$where['id']=$order_id;
		$where['printed']=0;
		$thisOrder =$this->dining_cart_model->where($where)->find();
		//是否开启打印
		$printwhere['token']=$this->token;
		$printwhere['status']=1;
		$printwhere['_string']='storeid='.$thisOrder['storeid'].' OR storeid=0';
		$set_state =M('Printer_set')->where($printwhere)->order('storeid','DESC')->limit(0,3)->select();
		if (count($set_state)==0) return;
		
		if ($thisOrder){
			switch ($thisOrder['diningtype']){
				case 1:
					$orderType='点餐';
					break;
				case 2:
					$orderType='外卖';
					break;
				case 3:
					$orderType='预定餐桌';
					break;
			}
			//订餐信息
			if ($thisOrder['tableid']) {
				$thisTable=$this->dining_tables->where(array('id'=>$thisOrder['tableid']))->find();
				$thisOrder['tableName']=$thisTable['name'];
			}else{
				$thisOrder['tableName']='未指定';
			}
			$str="订单类型：".$orderType."\r\n订单编号：".$thisOrder['orderid']."\r\n姓名：".$thisOrder['truename']."\r\n电话：".$thisOrder['tel']."\r\n地址：".$thisOrder['address']."\r\n桌台：".$thisOrder['tableName']."\r\n下单时间：".date('Y-m-d H:i:s',$thisOrder['time'])."\r\n打印时间：".date('Y-m-d H:i:s',time())."\r\n--------------------------------\r\n";
			//菜单
			$carts=unserialize($thisOrder['info']);
			$totalFee=0;
			$totalCount=0;
			$products=array();
			$ids=array();
			foreach ($carts as $k=>$c){
				if (is_array($c)){
					$productid=$k;
					$price=$c['price'];
					$count=$c['count'];
					if (!in_array($productid,$ids)){
						array_push($ids,$productid);
					}
					$totalFee+=$price*$count;
					$totalCount+=$count;
				}
			}
			if (count($ids)){
				$products=$this->dining_model->where(array('id'=>array('in',$ids)))->select();
			}
			if ($products){
				foreach ($products as $k=>$p){
					$products[$k]['count']=$carts[$p['id']]['count'];
					$str.=$p['name']." X ".$products[$k]['count']."份  单价：".$p['price']."元\r\n";
				}
			}
			$str.="\r\n----------------------------\r\n合计：".$thisOrder['price']."元\r\n";
			if($thisOrder['beizhu']!=''){
				$str=$str."     "."\r\n----------------------------\r\n".$thisOrder['beizhu'];
			}
			$str=$str."     "."\r\n-*_*-".$printer_set['head']."-*_*-\r\n";
			$str=$str."     "."\r\n     谢谢惠顾，欢迎下次光临\r\n----------------------------\r\n     智风微信提供技术支持\r\n";
			
			
			//设置打印服务器开始
			$printer_set = M('printer_set')->where(array('token'=>$this->token))->find();
			define('MEMBER_CODE', $printer_set['memberCode']);
			define('FEYIN_KEY', $printer_set['feiyin_key']);
			define('DEVICE_NO', $printer_set['deviceNo']);
			//define('FEYIN_HOST','my.feyin.net');
			define('FEYIN_PORT', 80);
			switch($printer_set['type']){
			case 1:
				define('FEYIN_HOST','my.feyin.net');	
				$msgInfo=array(
					'memberCode'=>MEMBER_CODE,
					'msgDetail'=>$str,
					'deviceNo'=>DEVICE_NO,
					'msgNo'=>time()+1,
					'reqTime' => number_format(1000*time(), 0, '', '')
				);
				$content = $msgInfo['memberCode'].$msgInfo['msgDetail'].$msgInfo['deviceNo'].$msgInfo['msgNo'].$msgInfo['reqTime'].FEYIN_KEY;
				$msgInfo['securityCode'] = md5($content);
				$msgInfo['mode']=2;
				$client = new HttpClient(FEYIN_HOST,FEYIN_PORT);
				if($client->post('/api/sendMsg',$msgInfo)){
					$printstate=$client->getContent();
				}
				break;
			case 2:
				define('FEYIN_HOST','115.29.201.123');
				$msgInfo = array(
					'memberCode'=>MEMBER_CODE, 
					'apiKey'=>FEYIN_KEY, 
					'printInfo'=>$str,
					'clientCode'=>DEVICE_NO, 
					'apitype'=>'php', 
				);
				$client = new HttpClient(FEYIN_HOST,FEYIN_PORT);
				if(!$client->post('/CServer/printSelfFormatOrder',$msgInfo)){ //提交失败
					$printstate = 'faild';
				}
				else{				
					$msgjson =$client->getContent();
					$msgjson=(Array)json_decode($msgjson);
					$printstate=$msgjson['reslutCode'];
				}
				break;
			default:
				define('FEYIN_HOST','my.feyin.net');
				$msgInfo=array(
					'memberCode'=>MEMBER_CODE,
					'msgDetail'=>$str,
					'deviceNo'=>DEVICE_NO,
					'msgNo'=>time()+1,
					'reqTime' => number_format(1000*time(), 0, '', '')
				);
				$content = $msgInfo['memberCode'].$msgInfo['msgDetail'].$msgInfo['deviceNo'].$msgInfo['msgNo'].$msgInfo['reqTime'].FEYIN_KEY;
				$msgInfo['securityCode'] = md5($content);
				$msgInfo['mode']=2;
				$client = new HttpClient(FEYIN_HOST,FEYIN_PORT);
				if($client->post('/api/sendMsg',$msgInfo)){
					$printstate=$client->getContent();
				}
			}
			//设置为打印过了
			if($printstate==0){
				$this->dining_cart_model->where(array('id'=>$thisOrder['id']))->save(array('printed'=>1));
			}
		}
	}
	*/
	
	//获得打印机列表执行打印方法
	public function print_order($token,$storeid,$orderid,$allprint=false){		
		if($this->informstatus||$this->proInform['p']==1){
			isset($token)?$token:$token=$this->_get('token');
			if($token!=$this->token){
				$this->error('错误操作！');exit;
			}
			isset($storeid)?$storeid:$storeid=$this->_get('storeid');
			isset($orderid)?$orderid:$orderid=$this->_get('orderid');
			//是否开启打印
			$printwhere['token']=$token;
			$printwhere['status']=1;
			$printwhere['_string']='storeid='.$storeid.' OR storeid=0';
			$printer_set_state =M('Printer_set')->where($printwhere)->getField('status');
			if ($printer_set_state==0) return;
			
			$content=$this->getPrintcontet($orderid);
			
			$set_state =M('Printer_set')->field('id')->where($printwhere)->order('storeid','DESC')->limit(0,3)->select();
			$url=U('Dining/orders',array('token'=>$token));
			foreach($set_state as $val){
				$status=$this->executeprint($val['id'],$content);
			}
			if($status){
				M('Product_cart')->where(array('orderid'=>$orderid))->save(array('printed'=>1));
			}
		}
	}
	//获得要打印内容
	public function getPrintcontet($orderid){
		$thisOrder =M('Product_cart')->where(array('orderid'=>$orderid))->find();
		if ($thisOrder){
			switch ($thisOrder['diningtype']){
				case 1:
					$orderType='点餐';
					break;
				case 2:
					$orderType='外卖';
					break;
				case 3:
					$orderType='预定餐桌';
					break;
			}
			//订餐信息
			if ($thisOrder['tableid']) {
				$thisTable=M('dining_tables')->where(array('id'=>$thisOrder['tableid']))->find();
				$thisOrder['tableName']=$thisTable['name'];
			}else{
				$thisOrder['tableName']='未指定';
			}
			$str="订单类型：".$orderType."\r\n订单编号：".$thisOrder['orderid']."\r\n姓名：".$thisOrder['truename']."\r\n电话：".$thisOrder['tel']."\r\n地址：".$thisOrder['address']."\r\n桌台：".$thisOrder['tableName']."\r\n下单时间：".date('Y-m-d H:i:s',$thisOrder['time'])."\r\n打印时间：".date('Y-m-d H:i:s',time())."\r\n--------------------------------\r\n";
			//菜单
			$carts=unserialize($thisOrder['info']);
			$totalFee=0;
			$totalCount=0;
			$products=array();
			$ids=array();
			foreach ($carts as $k=>$c){
				if (is_array($c)){
					$productid=$k;
					$price=$c['price'];
					$count=$c['count'];
					if (!in_array($productid,$ids)){
						array_push($ids,$productid);
					}
					$totalFee+=$price*$count;
					$totalCount+=$count;
				}
			}
			if (count($ids)){
				$products=$this->dining_model->where(array('id'=>array('in',$ids)))->select();
			}
			if ($products){
				foreach ($products as $k=>$p){
					$products[$k]['count']=$carts[$p['id']]['count'];
					$str.=$p['name']." X ".$products[$k]['count']."份  单价：".$p['price']."元\r\n";
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
	/*get请求*/
	function curlGet($url){
		$ch=curl_init();
		$header="Accept-Charset:utf-8";
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_CUSTOMREQUEST,"GET");
		curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
		curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		curl_setopt($curl,CURLOPT_HTTPHEADER,$header);
		curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0(compatible;MSIE5.01;WindowsNT5.0)');
		curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);
		curl_setopt($ch,CURLOPT_AUTOREFERER,1);
		curl_setopt($ch,CURLOPT_POSTFIELDS,$data);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
		$temp=curl_exec($ch);
		return $temp;
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
}
?>
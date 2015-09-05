<?php
class ScoregiftAction extends BaseAction{
	public function _initialize(){
		parent::_initialize();
		$this->pageSize=8;		
		$this->assign('pageSize',$this->pageSize);
		$this->token = $this->_get('token');
		$this->assign('wecha_id',$this->_get('wecha_id'));
		$this->product_model=M('Score_gift');
	}
	public function index(){
		$where=array('token'=>$this->token);
		if(IS_POST){
			$key = $this->_post('search_name');
            	$this->redirect(U('Groupon/indexndex',array('token'=>$this->token,'keyword'=>$key)));
		}
		if (isset($_GET['keyword'])){
            $where['name|info'] = array('like',"%".$_GET['keyword']."%");
            $this->assign('isSearch',1);
		}
		$count = $this->product_model->where($where)->count();
		$this->assign('count',$count); 
		//排序方式
		$method=isset($_GET['method'])&&($_GET['method']=='DESC'||$_GET['method']=='ASC')?$_GET['method']:'DESC';
		$orders=array('time','num','score','salenum');
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
		$this->assign('metaTitle','积分换礼');
		$this->display();
	}
	public function ajaxGrouponProducts(){
		$where=array('token'=>$this->token);		
		$page=isset($_GET['page'])&&intval($_GET['page'])>1?intval($_GET['page']):2;
		$pageSize=isset($_GET['pagesize'])&&intval($_GET['pagesize'])>1?intval($_GET['pagesize']):$this->pageSize;
		$start=($page-1)*$pageSize;
		//排序方式
		$method=isset($_GET['method'])&&($_GET['method']=='DESC'||$_GET['method']=='ASC')?$_GET['method']:'DESC';
		$method=$method=='ASC'?'DESC':'ASC';
		$orders=array('time','num','score','salenum');
		$order=isset($_GET['order'])&&in_array($_GET['order'],$orders)?$_GET['order']:'time';
		//
		$products = $this->product_model->where($where)->order($order.' '.$method)->limit($start.','.$pageSize)->select();
		$str='{"products":[';
		if ($products){
			$comma='';
			foreach ($products as $p){
				$membercount=intval($p['salenum'])+intval($p['basenum']);
				$str.=$comma.'{"id":"'.$p['id'].'","name":"'.$p['name'].'","price":"'.$p['score'].'","token":"'.$p['token'].'","salenum":"'.$p['salenum'].'","img":"'.$p['img'].'","time":"'.$p['time'].'","basenum":"'.$p['basenum'].'","membercount":"'.$membercount.'"}';
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
		
		$this->assign('metaTitle',$product['name']);
		$product['info']=str_replace(array('&lt;','&gt;','&quot;','&amp;nbsp;'),array('<','>','"',' '),$product['info']);
		$info=$this->remove_html_tag($product['info']);
		$info=mb_substr($info,0,30,'utf-8');
		$this->assign('info',$info);
		
		//销量最高的商品
		$sameCompanyProductWhere=array('token'=>$this->token,'id'=>array('neq',$product['id']));
		$products=$this->product_model->where($sameCompanyProductWhere)->limit('salenum DESC')->limit('0,5')->select();
		$this->assign('products',$products);
		$this->display();
	}
	public function detail(){
		$where=array('token'=>$this->token);
		if (isset($_GET['id'])){
			$id=intval($_GET['id']);
			$where['id']=$id;
		}
		$product=$this->product_model->where($where)->find();
		$product['info']=html_entity_decode($product['info']);
		$this->assign('product',$product);
		
		$this->assign('metaTitle',$product['name']);
		$this->display();
	}
	public function my(){
		$this->noaccess();
		$product_cart_model=M('Score_order');
		//$this->wecha_id
		$orders=$product_cart_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->order('time DESC')->select();
		$status0=0;
		$status1=0;
		if ($orders){
			foreach ($orders as $o){			
				switch($o['status']){
					case 0:
						$status0++;
						break;
					case 1:
						$status1++;
						break;
				}
			}
		}
		$this->assign('orders',$orders);
		$this->assign('status1',$status1);
		$this->assign('status0',$status0);
		$this->assign('ordersCount',count($orders));
		$this->assign('metaTitle','我的订单');
		$this->assign('hideTopButton',1);
		$this->display();
		//$this->display('my_'.$this->tplid);
	}
	public function myOrders(){
		$this->noaccess();
		$where=array('token'=>$this->token,'wecha_id'=>$this->wecha_id);
		switch($_GET['status']){
			case '0':
				$title='未完成订单';
				break;
			case 1:
				$title='客服已处理';
				break;
			case 2:
				$title='已结束';
				break;
			case 3:
				$title='已关闭订单';
				break;
			default:
				$title='全部订单';
		}
		if(isset($_GET['status'])&&$_GET['status']<3){
			$where['status']=$_GET['status'];
		}
		$this->assign('title',$title);
		$product_cart_model=M('Score_order');
		$orders=$product_cart_model->where($where)->order('status ASC,time DESC')->select();
		//
		$productsIDs=array();
		if ($orders){
			foreach ($orders as $o){
				array_push($productsIDs,$o['giftid']);
			}
		}
		if ($productsIDs){
		$products=M('Score_gift')->where(array('id'=>array('in',$productsIDs)))->select();
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
				$orders[$i]['img']=$productsByID[$o['giftid']]['img'];
				$orders[$i]['productName']=$productsByID[$o['giftid']]['name'];
				$orders[$i]['productPrice']=$productsByID[$o['giftid']]['score'];				
				$i++;
			}
		}
		//
		$this->assign('orders',$orders);
		$this->assign('ordersCount',count($orders));
		$this->assign('metaTitle','我的订单');
		//
		$this->assign('hideTopButton',1);
		$this->display();
		//$this->display('myOrders_'.$this->tplid);
	}
	public function search(){$this->display();}
	public function orderCart(){
		$this->noaccess();
		$userinfo_model=M('Userinfo');
		$thisUser=$userinfo_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->find();
		$this->assign('thisUser',$thisUser);
		if (IS_POST){
			$row=array();
			$orderid=$this->randStr(4).time();
			$row['orderid']=$orderid;
			$row['truename']=$this->_post('truename');
			$row['tel']=$this->_post('tel');
			$row['address']=$this->_post('address');
			$row['token']=$this->token;
			$row['wecha_id']=$this->wecha_id;
			if (!$row['wecha_id']){
				$row['wecha_id']='null';
			}
			$time=time();
			$row['time']=$time;
			//分别加入订单
			$product_cart_model=M('score_order');
			$row['total']=intval($_POST['quantity']);
			$row['score']=$row['total']*floatval($_POST['score']);
			if($thisUser['total_score']<$row['score']){
				$this->error('积分不足！');exit;
			}
			$row['ordertype']=2;//自己下单
			$row['giftid']=intval($_POST['giftid']);			
			$groupon_rt=$product_cart_model->add($row);
			//。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
			//扣除积分
			$userinfo_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id))->setDec('total_score',$row['score']);
			
			$product_model=M('Score_gift');
			$product_model->where(array('id'=>intval($_POST['giftid'])))->setInc('salenum',$_POST['quantity']);
			
			//下单成功且通知开关开启
			if($groupon_rt&&$inform){
				//店铺信息
				$cominfo=$this->company;
				//发短信
				$phone=$row['tel'];
				$content =$row['truename']." 您在".$cominfo['name']."的订单已经提交成功,合计：".$totalFee." 元,";
				$content .="服务电话:".$cominfo['tel'].",感谢您的预订！";
				$this->Send_sms($phone,$content);
				//给商家发短信
				$smsset=M('sms_set')->where(array('token'=>$this->token,'status'=>1))->find();
				if($smsset['phone']){
					$sms_body="您的店铺：".$cominfo['name']."有新的订单，单号：".$orderid."，金额".$totalFee." 元";
					$this->Send_sms($smsset['phone'],$sms_body);
				}
				
				//发邮件
				$subject="您有新的订单，单号：".$orderid."，预定人：".$row['truename'];
				$body="预定店铺：".$this->company['name']."<br>".$this->email_body();
				//邮件是否开启
				$emailwhere['token']=$this->token;
				$emailwhere['status']=1;
				$emailwhere['_string']='storeid=0 OR storeid='.$this->company['id'];
		
				//邮件列表
				$set_state =M('email_set')->field('id')->where($emailwhere)->order('storeid DESC')->limit(0,1)->select();
				$this->Send_email($set_state[0]['id'],$subject,$body);
			}
			$this->redirect(U('Scoregift/my',array('token'=>$_GET['token'],'wecha_id'=>$_GET['wecha_id'],'success'=>1)));		
		}else {
			$where=array('token'=>$this->token);
			if (isset($_GET['id'])){
				$id=intval($_GET['id']);
				$where['id']=$id;
			}
			$product=$this->product_model->where($where)->find();
			$this->assign('product',$product);
			$this->display();
		}
	}
	public function deleteOrder(){
		$this->noaccess();
		$product_model=M('Score_gift');
		$product_cart_model=M('Score_order');
		$thisOrder=$product_cart_model->where(array('id'=>intval($_GET['id'])))->find();
		//检查权限
		$id=$thisOrder['id'];
		if ($thisOrder['wecha_id']!=$this->wecha_id||!in_array($thisOrder['status'],array(0,1))){
			$this->show('删除失败！');
		}
		//
		//删除订单和订单列表
		$product_cart_model->where(array('id'=>$id))->delete();
		//商品销量做相应的减少
		$product_model->where(array('id'=>$k))->setDec('salenum',$thisOrder['total']);
		$this->show('删除成功');
	}
	public function orderDetail(){
		$product_cart_model=M('Score_order');
		$thisOrder=$product_cart_model->where(array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'id'=>intval($_GET['id'])))->find();

		//
		$product_model=M('Score_gift');
		$thisProduct=$product_model->where(array('id'=>$thisOrder['giftid']))->find();
		$this->assign('thisProduct',$thisProduct);
		
		$this->assign('thisOrder',$thisOrder);
		$this->assign('hideTopButton',1);
		//
		$this->display();
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
	
	public function noaccess(){
		if (!$this->wecha_id){
			$this->error('您无权参与，请关注微信号“'.$this->wxuser['wxname'].'”，然后回复“推荐有礼”便可进行',U('Groupon/grouponIndex',array('token'=>$this->token)));
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
}
	
?>
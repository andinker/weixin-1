<?php
class UserAction extends BaseAction{
	public $userGroup;
	public $token;
	public $user;
	public $userFunctions;
	protected function _initialize(){
        parent::_initialize();
				$userinfo=M('User_group')->where(array('id'=>session('gid')))->find();
		$this->userGroup=$userinfo;
		$users=M('Users')->where(array('id'=>$_SESSION['uid']))->find();
		$this->user=$users;
		//套餐价格为0，使用不限时长！
		if(empty($_SESSION['userGropInfo']['price'])){
			$viptime=0;
		}else{
			$viptime=$users['viptime'];
		}
		$this->assign('thisUser',$users);
		$this->assign('viptime',$viptime);
		if(session('uid')){
			if(!empty($viptime)&&$users['viptime']<time()&&MODULE_NAME != 'Alipay'&&MODULE_NAME != 'Index'){
				session(null);
				session_destroy();
				unset($_SESSION);
				$this->error('您的帐号已经到期，请充值后再使用');
			}
		}
		$wecha=M('Wxuser')->where(array('token'=>session('token'),'uid'=>session('uid')))->find();
		$this->assign('wecha',$wecha);
		$this->token=session('token');
		$this->assign('token',$this->token);
		$token_open=M('token_open')->field('queryname')->where(array('token'=>$this->token))->find();
		$this->userFunctions=explode(',',$token_open['queryname']);
		$this->assign('userinfo',$userinfo);
		if(session('uid')==false){
			if (MODULE_NAME!='Upyun'){
				
				if (GROUP_NAME == 'Muser') $this->redirect('Home/Index/mlogin');
				else $this->redirect('Home/Index/login');
			}
		}
		/****************upyun*********************/
		define('UNYUN_BUCKET',C('up_bucket'));
		define('UNYUN_USERNAME',C('up_username'));
		define('UNYUN_PASSWORD',C('up_password'));
		define('UNYUN_FORM_API_SECRET',C('up_form_api_secret'));
		define('UNYUN_DOMAIN',C('up_domainname'));
		$this->assign('upyun_domain','http://'.UNYUN_DOMAIN);
		$this->assign('upyun_bucket',UNYUN_BUCKET);
		$token=$this->_session('token');
		if (!$token){
			if (isset($_GET['token'])){
				$token=$this->_get('token');
			}else {
				$token='admin';
			}
		}
		$options = array();
		$now=time();
		$options['bucket'] = UNYUN_BUCKET; /// 空间名
		$options['expiration'] = $now+600; /// 授权过期时间
		$options['save-key'] = '/'.$token.'/{year}/{mon}/{day}/'.$now.'_{random}{.suffix}'; /// 文件名生成格式，请参阅 API 文档
		$options['allow-file-type'] = C('up_exts'); /// 控制文件上传的类型，可选
		$options['content-length-range'] = '0,'.intval(C('up_size'))*1000; /// 限制文件大小，可选
		if (intval($_GET['width'])){
			$options['x-gmkerl-type'] = 'fix_width';
			$options['fix_width '] = $_GET['width'];
		}
		$policy = base64_encode(json_encode($options));
		$sign = md5($policy.'&'.UNYUN_FORM_API_SECRET); /// 表单 API 功能的密匙（请访问又拍云管理后台的空间管理页面获取）
		$this->assign('editor_upyun_sign',$sign);
		$this->assign('editor_upyun_policy',$policy);
	}
	public function canUseFunction($funname){
		$token_open=M('token_open')->field('queryname')->where(array('token'=>$this->token))->find();
		if (C('agent_version')&&$this->agentid){
			$function=M('Agent_function')->where(array('funname'=>$funname,'agentid'=>$this->agentid))->find();
		}else {
			$function=M('Function')->where(array('funname'=>$funname))->find();
		}
		if (intval($this->user['gid'])<intval($function['gid'])||strpos($token_open['queryname'],$funname)===false){
			$this->error('您还没有开启该模块的使用权,请到功能模块中添加',U('Function/index',array('token'=>$this->token,'id'=>session('wxid'))));
		}
	}
	
	
	/**
	 * 把类别名加上级别前缀
	 */
	protected function makeLevelClassNames($data){
		return $this->makeLevelClassNames_getChilds($data,0,0);
	}
	
	protected function makeLevelClassNames_getChilds($data,$fid,$level){
	
		$childs = array();
	
		$mark = '';
		for ($i=0;$i<$level;$i++){
			$mark = '- - - - '.$mark;
		}
	
	
	
		foreach ($data as $item){
			if ( intval($item['fid']) == intval($fid)){
	
				$item['name'] = $mark.$item['name'];
				array_push($childs, $item);
	
				$next_childs = $this->makeLevelClassNames_getChilds($data,$item['id'],$level+1);
	
				foreach ($next_childs as $next_child){
					array_push($childs, $next_child);
				}
	
			}
		}
	
		return $childs;
	}
	
	/**
	 * 计算一次购物的总的价格与数量
	 * @param array $carts
	 */
	public function getCat($carts)
	{
		if (empty($carts)) {
			return array();
		}
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
		$data = array();
		if ($dids) {
			$dids = array_unique($dids);
			$detail = M('Product_detail')->where(array('id'=> array('in', $dids)))->select();
			foreach ($detail as $row) {
				$row['colorName'] = isset($norms[$row['color']]) ? $norms[$row['color']] : '';
				$row['formatName'] = isset($norms[$row['format']]) ? $norms[$row['format']] : '';
				$row['count'] = isset($carts[$row['pid']][$row['id']]['count']) ? $carts[$row['pid']][$row['id']]['count'] : 0;
				$productList[$row['pid']]['detail'][] = $row;
				$data[$row['pid']]['total'] = isset($data[$row['pid']]['total']) ? intval($data[$row['pid']]['total'] + $row['count']) : $row['count'];
				$data[$row['pid']]['totalPrice'] = isset($data[$row['pid']]['totalPrice']) ? intval($data[$row['pid']]['totalPrice'] + $row['count'] * $row['price']) : $row['count'] * $row['price'];//array('total' => $totalCount, 'totalPrice' => $totalFee);
			}
		}
		//商品的详细列表
		$list = array();
		foreach ($productList as $pid => $row) {
			if (!isset($data[$pid]['total'])) {
				$data[$pid] = array();
				$row['count'] = $data[$pid]['total'] = isset($carts[$pid]['count']) ? $carts[$pid]['count'] : (isset($carts[$pid]) && is_int($carts[$pid]) ? $carts[$pid] : 0);
				$data[$pid]['totalPrice'] = $data[$pid]['total'] * $row['price'];
			}
			$row['formatTitle'] =  isset($catlist[$row['catid']]['norms']) ? $catlist[$row['catid']]['norms'] : '';
			$row['colorTitle'] =  isset($catlist[$row['catid']]['color']) ? $catlist[$row['catid']]['color'] : '';
			$list[] = $row;
		}
	
			
		// 改为按商品件数来计算累加运费
		// 把582行处的“取最大邮费”改为累加邮费
	
		$mailPrice = 0;
		foreach ($data as $k=>$v){
			$the_p = null;
			foreach ($list as $tmp_p){
				if ($tmp_p['id'] == $k){
					$the_p = $tmp_p;
				}
			}
			$mailPrice = $mailPrice+($the_p['mailprice']*$v['total']);
		}
	
		// 免运费处理
		if ($obj = M('Product_setting')->where(array('token' => $this->token))->find()) {
			if ($obj['price'] >= 0){
				if ($totalprice >= $obj['price']) $mailPrice = 0;
			}
		}
	
		//print_r(array($list, $data, $mailPrice));
	
		return array($list, $data, $mailPrice);
		die;
		if (empty($carts)) {
			return array();
		}
		$pdata = $data = $list = $ids = $detail_list = $products = array();
		$mailPrice = 0;
		foreach ($carts as $pid => $rowset) {
			$totalCount = $totalFee = 0;
			$tmp = $this->product_model->where(array('id'=> $pid))->find();
			if (is_array($rowset)) {
				$norms = $cntArray = $dids = array();
				foreach ($rowset as $did => $count) {
					if (!in_array($did, $dids)){
						array_push($dids, $did);
						$cntArray[$did] = $count['count'];
					}
					$totalCount += $count['count'];
				}
				$normsdata = M('Product_norms')->where(array('catid' => $tmp['catid']))->select();
				foreach ($normsdata as $r) {
					$norms[$r['id']] = $r['value'];
				}
				if ($dids) {
					$temp = M('Product_detail')->where(array('id'=> array('in', $dids), 'pid' => $pid))->select();
					foreach ($temp as $row) {
						if (isset($rowset[$row['id']])) {
							$row['colorName'] = isset($norms[$row['color']]) ? $norms[$row['color']] : '';
							$row['formatName'] = isset($norms[$row['format']]) ? $norms[$row['format']] : '';
							$row['count'] = $cntArray[$row['id']];
							$totalFee += $cntArray[$row['id']] * $row['price'];
							$detail_list[$pid][] = $row;
						}
					}
				}
			} else {
				$totalCount += $rowset;
				$totalFee += $rowset * $tmp['price'];
				$pdata[$pid] = $rowset;
			}
			$mailPrice = max($mailPrice, $tmp['mailprice']);
			$data[$pid] = array('total' => $totalCount, 'totalPrice' => $totalFee);
		}
	
		$ids = array_keys($carts);
		if (count($ids)) {
			$tmp = $this->product_model->where(array('id'=>array('in', $ids)))->select();
			foreach ($tmp as $row) {
				if (isset($detail_list[$row['id']])) {
					if ($catData = M('Product_cat')-> where(array('id' => $row['catid']))->find()) {
						$row['formatTitle'] =  $catData['norms'];
						$row['colorTitle'] =  $catData['color'];
					}
					$row['detail'] =  $detail_list[$row['id']];
				} else {
					$row['detail'] = '';
					$row['count'] = $pdata[$row['id']];
				}
				$list[] = $row;
			}
		}
		return array($list, $data, $mailPrice);
	
		$list = $ids = $detail_list = $products = array();
		$carts = empty($carts) ? $this->_getCart() : $carts;
		$pdata = $data = array();
		$mailPrice = 0;
		foreach ($carts as $pid => $rowset) {
			$totalCount = $totalFee = 0;
			$tmp = $this->product_model->where(array('id'=> $pid))->find();
			if (is_array($rowset)) {
				$norms = $cntArray = $dids = array();
				foreach ($rowset as $did => $count) {
					if (!in_array($did, $dids)){
						array_push($dids, $did);
						$cntArray[$did] = $count['count'];
					}
					$totalCount += $count['count'];
				}
				$normsdata = M('Product_norms')->where(array('catid' => $tmp['catid']))->select();
				foreach ($normsdata as $r) {
					$norms[$r['id']] = $r['value'];
				}
				if ($dids) {
					$temp = M('Product_detail')->where(array('id'=> array('in', $dids), 'pid' => $pid))->select();
					foreach ($temp as $row) {
						if (isset($rowset[$row['id']])) {
							$row['colorName'] = isset($norms[$row['color']]) ? $norms[$row['color']] : '';
							$row['formatName'] = isset($norms[$row['format']]) ? $norms[$row['format']] : '';
							$row['count'] = $cntArray[$row['id']];
							$totalFee += $cntArray[$row['id']] * $row['price'];
							$detail_list[$pid][] = $row;
						}
					}
				}
			} else {
				$totalCount += $rowset;
				$totalFee += $rowset * $tmp['price'];
				$pdata[$pid] = $rowset;
			}
			$mailPrice = max($mailPrice, $tmp['mailprice']);
			$data[$pid] = array('total' => $totalCount, 'totalPrice' => $totalFee);
		}
		$ids = array_keys($carts);
		if (count($ids)) {
			$tmp = $this->product_model->where(array('id'=>array('in', $ids)))->select();
			foreach ($tmp as $row) {
				if (isset($detail_list[$row['id']])) {
					if ($catData = M('Product_cat')-> where(array('id' => $row['catid']))->find()) {
						$row['formatTitle'] = $catData['norms'];
						$row['colorTitle'] = $catData['color'];
					}
					$row['detail'] =  $detail_list[$row['id']];
				} else {
					$row['detail'] = '';
					$row['count'] = $pdata[$row['id']];
				}
				$list[] = $row;
			}
		}
	
	
		return array($list, $data, $mailPrice);
	}
}
?>
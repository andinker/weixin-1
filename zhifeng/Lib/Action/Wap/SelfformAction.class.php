<?php
class SelfformAction extends BaseAction{
	public $token;
	public $wecha_id;
	public $selfform_model;
	public $selfform_input_model;
	public $selfform_value_model;
	public function __construct(){
		parent::__construct();
		$this->token		= $this->_get('token');
		$this->assign('token',$this->token);
		$this->wecha_id	= $this->_get('wecha_id');
		if (!$this->wecha_id){
			$this->wecha_id='null';
		}
		$this->assign('wecha_id',$this->wecha_id);
		//
		$this->selfform_model=M('Selfform');
		$this->selfform_input_model=M('Selfform_input');
		$this->selfform_value_model=M('Selfform_value');
		$this->assign('staticFilePath',str_replace('./','/',THEME_PATH.'common/css/product'));
	}
	public function index(){
		$formid=intval($_GET['id']);
		$thisForm=$this->selfform_model->where(array('id'=>$formid))->find();
		$thisForm['successtip']=$thisForm['successtip']==''?'提交成功':$thisForm['successtip'];
		$this->assign('thisForm',$thisForm);
		$where=array('formid'=>$formid);
		$list = $this->selfform_input_model->where($where)->order('taxis ASC')->select();
		$listByKey=array();
		if ($list){
			$i=0;
			foreach ($list as $l){
				if ($l['inputtype']=='select'){
					$options=explode('|',$l['options']);
					$optionStr='<option value="" selected>请选择'.$l['displayname'].'</option>';
					if ($options){
						foreach ($options as $o){
							$optionStr.='<option value="'.$o.'">'.$o.'</option>';
						}
					}
					$list[$i]['optionStr']=$optionStr;
				}
				if ($l['errortip']==''){
					$list[$i]['errortip']='请输入'.$l['displayname'];
				}
				$listByKey[$l['fieldname']]=$l;
				$i++;
			}
		}
		if (IS_POST){
			$row=array();
			$fields=array();
			$bodystr='';
			if ($list){
				foreach ($list as $l){
					$fields[$l['fieldname']]=$_POST[$l['fieldname']];
				}
			}
			//提交时间
			$date=time();					
			$row['values']=serialize($fields);
			$row['formid']=$thisForm['id'];
			$row['wecha_id']=$this->wecha_id;
			$row['time']=time();
			$submitInfo=$this->selfform_value_model->where(array('wecha_id'=>$this->wecha_id,'formid'=>$thisForm['id']))->find();
			if (!$submitInfo){
				$bodyinfo=$this->bodyinfo($fields);
				$this->inform($bodyinfo,$thisForm['name'],$this->token);
				$this->selfform_value_model->add($row);
			}
			$this->redirect(U('Selfform/index',array('token'=>$this->token,'wecha_id'=>$this->wecha_id,'id'=>$thisForm['id'],'success'=>1)));
		}else {
			//判断是否提交过信息了
			$submitInfo=$this->selfform_value_model->where(array('wecha_id'=>$this->wecha_id,'formid'=>$thisForm['id']))->find();
			if ($submitInfo){
				$info=unserialize($submitInfo['values']);
				if ($info){
					foreach ($info as $k=>$v){
						$info[$k]=array('displayname'=>$listByKey[$k]['displayname'],'value'=>$v);
					}
				}
				$this->assign('submitInfo',$info);
				$submitted=1;
				//二维码图片
				$imgSrc=generateQRfromGoogle(C('site_url').'/index.php?g=Wap&m=Selfform&a=submitInfo&token='.$this->token.'&wecha_id='.$this->wecha_id.'&id='.$thisForm['id']);
				
				$this->assign('imgSrc',$imgSrc);
			}else {
				$submitted=0;
			}
			$this->assign('submitted',$submitted);
			$this->assign('list',$list);
			$this->display();
		}
	}
	private function bodyinfo($info){
		$str='';
		if(!$info){return $str;}
		foreach($info as $k=>$v){
			$str.=" ".$k.": ".$v."\r\n";
		}
		return $str;
	}
	private function inform($info,$name,$token){
		//是否通知开关
		$inform=S('inform_'.$token);
		if(!$inform){
			$inform=M('Inform')->where(array('token'=>$token))->find();
			S('inform_'.$token,$inform);
		}
		if($inform['biaodan']==1){
			$informstatus=true;
		}else{
			$proInform=unserialize($inform['biaodan']);
		}
		//邮件,打印条件是否开启
		$emailwhere['token']=$token;
		$emailwhere['status']=1;
		$emailwhere['storeid']=0;
		if($informstatus||$proInform['s']==1){
			//给商家发短信
			$smsset=M('sms_set')->where(array('token'=>$token,'status'=>1))->find();
			if($smsset['phone']){
				$sms_body="您的万能表单：《".$name."》于".date('Y-m-d H:i:s',$date)."有新的提交了,请注意查看";
				$this->Send_sms($smsset['phone'],$sms_body);
			}
		}
		//发邮件
		if($informstatus||$proInform['e']==1){
			$subject="您的万能表单《".$name."》有新的申请了";
			$body="主题：《".$name."》<br>".str_replace("\r\n",'</br>',$info);
			//邮件列表
			$set_state =M('email_set')->field('id')->where($emailwhere)->order('storeid DESC')->limit(0,1)->select();
			$this->Send_email($set_state[0]['id'],$subject,$body);
		}
		//打印
		if($informstatus||$proInform['p']==1){
			$content="主题：《".$name."》\r\n".$info;
			$printset_state =M('Printer_set')->field('id')->where($emailwhere)->order('storeid','DESC')->limit(0,3)->select();
			foreach($printset_state as $val){
				$status=$this->executeprint($val['id'],$content);
			}					
		}
	}
	public function detail(){
		$formid=intval($_GET['id']);
		$thisForm=$this->selfform_model->where(array('id'=>$formid))->find();
		$thisForm['content']=html_entity_decode($thisForm['content']);
		//$thisForm['intro']=str_replace(array('&lt;','&gt;','&quot;','&amp;nbsp;'),array('<','>','"',' '),$thisForm['intro']);
		$this->assign('thisForm',$thisForm);
		$this->display();
	}
	public function submitInfo(){
		$formid=intval($_GET['id']);
		$thisForm=$this->selfform_model->where(array('id'=>$formid))->find();
		$thisForm['successtip']=$thisForm['successtip']==''?'提交成功':$thisForm['successtip'];
		$this->assign('thisForm',$thisForm);
		$where=array('formid'=>$formid);
		$list = $this->selfform_input_model->where($where)->order('taxis ASC')->select();
		$listByKey=array();
		if ($list){
			$i=0;
			foreach ($list as $l){
				if ($l['inputtype']=='select'){
					$options=explode('|',$l['options']);
					$optionStr='<option value="" selected>请选择'.$l['displayname'].'</option>';
					if ($options){
						foreach ($options as $o){
							$optionStr.='<option value="'.$o.'">'.$o.'</option>';
						}
					}
					$list[$i]['optionStr']=$optionStr;
				}
				if ($l['errortip']==''){
					$list[$i]['errortip']='请输入'.$l['displayname'];
				}
				$listByKey[$l['fieldname']]=$l;
				$i++;
			}
		}
		$submitInfo=$this->selfform_value_model->where(array('wecha_id'=>$this->wecha_id,'formid'=>$thisForm['id']))->find();
		if ($submitInfo){
			$info=unserialize($submitInfo['values']);
			if ($info){
				foreach ($info as $k=>$v){
					$info[$k]=array('displayname'=>$listByKey[$k]['displayname'],'value'=>$v);
				}
			}
			$this->assign('submitInfo',$info);
		}else {
			$submitted=0;
		}
		$this->assign('submitted',$submitted);
		$this->assign('list',$list);
		$this->display();
	}
}
function generateQRfromGoogle($chl,$widhtHeight ='150',$EC_level='L',$margin='0'){
	$chl = urlencode($chl);
    $src='http://chart.apis.google.com/chart?chs='.$widhtHeight.'x'.$widhtHeight.'&cht=qr&chld='.$EC_level.'|'.$margin.'&chl='.$chl;
    return $src;
}
?>
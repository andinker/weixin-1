<?php
class HostAction extends BaseAction{
    public function index(){
        $agent = $_SERVER['HTTP_USER_AGENT']; 
        if(!strpos($agent,"MicroMessenger")) {
           // echo '此功能只能在微信浏览器中使用';exit;
        }
        $token      = $this->_get('token'); 
        $hid         = $this->_get('hid'); 
        $where      = array('token'=>$token,'hid'=>$hid);             
        $list_add     = M('Host_list_add')->where($where)->select();   
        $hostset =  M('Host')->where(array('token'=>$token,'id'=>$hid))->find();
        $this->assign('list',$list_add);
        //company info
        $company_db=M('Company');
        $thisCompany=$company_db->where(array('token'=>$token,'isbranch'=>0))->find();
        $hostset['address']=$thisCompany['address'];
        $this->assign('set',$hostset);
      //  $this->assign('isAndroid',isAndroid());
        $this->display();
    }
    
    //首次进入，罗列在线商家
    public function online($display=1){
        $agent = $_SERVER['HTTP_USER_AGENT']; 
        if(!strpos($agent,"MicroMessenger")) {
            echo '此功能只能在微信浏览器中使用';exit;
        }
        $token      = $this->_get('token'); 
        if(empty($token))  $this->error('非法操作');

        $where      = array('token'=>$token); 
        $data=M('Host');
        $count      = $data->where( $where )->count();
        $Page       = new Page($count,7);
        $show       = $Page->show();
        $list = $data->where( $where )->limit($Page->firstRow.','.$Page->listRows)->select();

        $this->assign('list',$list);
        $this->assign('show',$show);
        //
        $hid         = $this->_get('hid'); 
        $hostset =  M('Host')->where(array('token'=>$token,'id'=>$hid))->find();
        $this->assign('set',$hostset);
        if ($display){
        $this->display();
        }
    }
    public function companyDetail(){
    	$this->online(0);
    	$this->display();
    }
    public function lists(){
       $agent = $_SERVER['HTTP_USER_AGENT']; 
        if(!strpos($agent,"MicroMessenger")) {
            echo '此功能只能在微信浏览器中使用';exit;
        }
       $id    = $this->_get('id');
       $token = $this->_get('token');
       $hid = $this->_get('hid');
       $wecha_id = $this->_get('wecha_id');
       $userinfo = M('userinfo')->where(array('wecha_id'=>$wecha_id,'token'=>$token))->find();

       $host = M('Host')->where(array('id'=>$hid,'token'=>$token))->find();
       $where = array('id'=>$id,'token'=>$token);
       $types = M('Host_list_add')->where($where)->find();
	   //dump($types);
       $this->assign('types',$types);
       $save_monery = $types['price'] - $types['yhprice']; 
       $this->assign('userinfo',$userinfo);
       $this->assign('saves',$save_monery );
       $this->assign('host',$host);
		
        $this->display();

    }
    
    //在线预定
    public function book(){ 
        $agent = $_SERVER['HTTP_USER_AGENT']; 
        if(!strpos($agent,"MicroMessenger")) {
            echo '此功能只能在微信浏览器中使用';exit;
        }
        if($_POST['action'] == 'book'){           

            $data['wecha_id']  =  $this->_post('wecha_id');
            $data['book_people']  =  $this->_post('truename'); 
            $data['remarks']   =  $this->_post('remarks');  
            $data['tel']       = $this->_post('tel');  
            $data['book_num']      = $this->_post('nums'); 
            $data['book_time']  = strtotime($this->_post('dateline'));           
            $id       = $this->_post('id');
            $data['room_type'] = $this->_post('roomtype'); 
            $data['order_status'] = 3 ;
            $data['hid'] = $this->_get('hid');
            $data['token'] = $this->_get('token');
			$host['name']=$this->_post('hosttitle'); 
			$host['tel']=$this->_post('hosttel'); 
            $price = M('Host_list_add')->where(array('id'=>$id,'token'=>$data['token'],'hid'=>$data['hid']))->find();

            $data['price'] = $price['yhprice'] * $data['book_num'];
                    
          
            $order = M('Host_order')->data($data)->add();    

            if($order){                
				echo'{"success":1,"msg":"恭喜,预定成功。"}';
				$this->inform($data,$host);//提醒
            }else{
                echo'{"success":0,"msg":"请从新预定。"}';
            }            
            exit;
        }    
            
        
    }
	private function inform($data,$host){
		//是否通知开关
		$inform=S('inform_'.$token);
		if(!$inform){
			$inform=M('Inform')->where(array('token'=>$token))->find();
			S('inform_'.$token,$inform);
		}
		if($inform['tydd']==1){
			$informstatus=true;
		}else{
			$proInform=unserialize($inform['tydd']);
		}
		$date=time();
		//邮件,打印条件是否开启
		$emailwhere['token']=$token;
		$emailwhere['status']=1;
		$emailwhere['storeid']=0;
		//订单详情
		$info="您的店铺：《".$host['name']."》\r\n 下单时间：".date('Y-m-d H:i:s',$date)."\r\n姓名：".$data['book_people']."\r\n电话：".$data['tel']."\r\n时间：".$data['book_time']."\r\n数量：".$data['book_num']."\r\n价格：".$data['price']."\r\n类型：".$data['room_type']."\r\n备注：".$data['remarks'];
		if($informstatus||$proInform['s']==1){
			//给客户发信息
			if($data['tel']){
				$smsbody="您在 ".$host['name']." 预定了".$data['book_num']."个".$data['room_type']."请等待商家确认。商家服务电话：".$host['tel'];
				$this->Send_sms($data['tel'],$smsbody);
			}			
			//给商家发短信
			$smsset=M('sms_set')->where(array('token'=>$token,'status'=>1))->find();
			if($smsset['phone']){
				$sms_body="您的店铺：《".$host['name']."》于".date('Y-m-d H:i:s',$date)."有客户预定了".$data['book_num']."个".$data['room_type']."请注意联系客户跟进（".$data['tel']."）";
				$this->Send_sms($smsset['phone'],$sms_body);
			}
		}
		//发邮件
		if($informstatus||$proInform['e']==1){
			$subject="您的店铺《".$host['name']."》有新的预定了";
			$body=str_replace("\r\n",'</br>',$info);	
			//邮件列表
			$set_state =M('email_set')->field('id')->where($emailwhere)->order('storeid DESC')->limit(0,1)->select();
			$this->Send_email($set_state[0]['id'],$subject,$body);
		}
		//打印
		if($informstatus||$proInform['p']==1){
			$content=$info;
			$printset_state =M('Printer_set')->field('id')->where($emailwhere)->order('storeid','DESC')->limit(0,3)->select();
			foreach($printset_state as $val){
				$status=$this->executeprint($val['id'],$content);
			}					
		}
	}
}
    
?>
<?php
class UsersAction extends BackAction{
	public function index(){
		
		//读取省、市、区、小区数据表进行显示
		$where = array();
		$province_data 	= M('region_province')->where($where)->select();
		$city_data     	= M('region_city')->where($where)->select();
		$district_data 	= M('region_district')->where($where)->select();
		$community_data = M('region_community')->where($where)->select();

		$this->assign('province_data'	,$province_data);
		$this->assign('city_data'		,$city_data);
		$this->assign('district_data'	,$district_data);
		$this->assign('community_data'	,$community_data);
		
		$db=D('Users');
		$group=M('User_group')->field('id,name')->order('id desc')->select();
		$count= $db->count();
		$Page= new Page($count,25);
		$show= $Page->show();
		$list = $db->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach($group as $key=>$val){
			$g[$val['id']]=$val['name'];
		}
		unset($group);
		$this->assign('info',$list);
		$this->assign('page',$show);
		$this->assign('group',$g);
		$this->display();
	}
	
	// 添加用户
    public function add(){
    	
    	//读取省、市、区、小区数据表进行显示
    	$where = array();
    	$province_data 	= M('region_province')->where($where)->select();
    	$city_data     	= M('region_city')->where($where)->select();
    	$district_data 	= M('region_district')->where($where)->select();
    	$community_data = M('region_community')->where($where)->select();
    	
    	$this->assign('province_data'	,$province_data);
    	$this->assign('city_data'		,$city_data);
    	$this->assign('district_data'	,$district_data);
    	$this->assign('community_data'	,$community_data);
    	
    	
        $UserDB = D("Users");
        if(isset($_POST['dosubmit'])) {
            $password = $_POST['password'];
            $repassword = $_POST['repassword'];
            if(empty($password) || empty($repassword)){
                $this->error('密码必须填写！');
            }
            if($password != $repassword){
                $this->error('两次输入密码不一致！');
            }
            //根据表单提交的POST数据创建数据对象
			$_POST['viptime']=strtotime($_POST['viptime']);
            if($UserDB->create()){				
                $user_id = $UserDB->add();
                if($user_id){
					$this->success('添加成功！',U('Users/index'));                    
                }else{
                     $this->error('添加失败!');
                }
            }else{
                $this->error($UserDB->getError());
            }
        }else{
            $role = M('User_group')->field('id,name')->where('status = 1')->select();
            $this->assign('role',$role);
            $this->assign('tpltitle','添加');
            $this->display();
        }
    }
	public function search(){
		$name=$this->_post('name');
		$type=$this->_post('type');
		switch($type){
			case 1:
			$data['username']=$name;
			break;
			case 2:
			$data['id']=$name;
			break;
			case 3:
			$data['email']=$name;
		}
		//dump($where);
		$list=M('Users')->where($data)->select();
		$this->assign('info',$list);
		$this->display('index');
	
	}
    // 编辑用户
    public function edit(){

    	//读取省、市、区、小区数据表进行显示
    	$where = array();
    	$province_data 	= M('region_province')->where($where)->select();
    	$city_data     	= M('region_city')->where($where)->select();
    	$district_data 	= M('region_district')->where($where)->select();
    	$community_data = M('region_community')->where($where)->select();
    	
    	$this->assign('province_data'	,$province_data);
    	$this->assign('city_data'		,$city_data);
    	$this->assign('district_data'	,$district_data);
    	$this->assign('community_data'	,$community_data);
    	
    	$UserDB = D("Users");
        if(isset($_POST['dosubmit'])) {
            $password = $this->_post('password','trim',0);
            $repassword = $this->_post('repassword','trim',0);
			$users=M('Users')->field('gid')->find($_POST['id']);
            if($password != $repassword){
                $this->error('两次输入密码不一致！');
            }
            if($password==false){ 
				unset($_POST['password']);
				unset($_POST['repassword']);
			}else{
				$_POST['password']=md5($password);
			}
			unset($_POST['dosubmit']);
			unset($_POST['__hash__']);
            //根据表单提交的POST数据创建数据对象
				$_POST['viptime']=strtotime($_POST['viptime']);
				$_POST['community_id'] = $_POST['community'];
                if($UserDB->save($_POST)){
					if($_POST['gid']!=$users['gid']){
						$fun=M('Function')->field('funname,gid,isserve')->where('`gid` <= '.$_POST['gid'])->select();
						foreach($fun as $key=>$vo){
							$queryname.=$vo['funname'].',';
						}
						$open['queryname']=rtrim($queryname,',');
						$uid['uid']=$_POST['id'];
						$token=M('Wxuser')->field('token')->where($uid)->select();
						if($token){
							$token_db=M('Token_open');
							foreach($token as $key=>$val){
								$wh['token']=$val['token'];
								$token_db->where($wh)->save($open);
							}
						}
					}
                    $this->success('编辑成功！',U('Users/edit',array('id'=>$_POST['id'])));
                }else{
                	echo '<pre>';
                	print($UserDB->getLastSql());
                	print_r($UserDB->data());
                	print_r($_POST);echo '</pre>';
                	exit();
                     $this->error('编辑失败：'.$UserDB->getError(),U('Users/edit',array('id'=>$_POST['id'])));
                }
            
        }else{
            $id = $this->_get('id','intval',0);
            if(!$id)$this->error('参数错误!');
            $role = M('User_group')->field('id,name')->where('status = 1')->select();
            $info = $UserDB->find($id);
            $this->assign('tpltitle','编辑');
            $this->assign('role',$role);
            $this->assign('info',$info);
            $this->display('add');
        }
    }
	
	public function addfc(){
		$token_open=M('Token_open');
		$open['uid']=session('uid');
		$open['token']=$_POST['token'];
		$gid=session('gid');
		$fun=M('Function')->field('funname,gid,isserve')->where('`gid` <= '.$gid)->select();
		foreach($fun as $key=>$vo){
			$queryname.=$vo['funname'].',';
		}
		$open['queryname']=rtrim($queryname,',');
		$token_open->data($open)->add();
	}
	
	//删除用户
    public function del(){
        $id = $this->_get('id','intval',0);
        if(!$id)$this->error('参数错误!');
        $UserDB = D('Users');
        if($UserDB->delete($id)){
			$where['uid']=$id;
			M('wxuser')->where($where)->delete();
			M('token_open')->where($where)->delete();
			M('text')->where($where)->delete();
			M('img')->where($where)->delete();
			M('member')->where($where)->delete();
			M('indent')->where($where)->delete();
			M('areply')->where($where)->delete();
			$this->assign("jumpUrl",U('Users/index'));
			$this->success('删除成功！');            
        }else{
            $this->error('删除失败!');
        }
    }

    public function getRegions() {
    	//读取省、市、区、小区数据表进行显示
    	$where = array();
    	$province_data 	= M('region_province')->where($where)->select();
    	$city_data     	= M('region_city')->where($where)->select();
    	$district_data 	= M('region_district')->where($where)->select();
    	$community_data = M('region_community')->where($where)->select();
    	
    	$this->assign('province_data'	,$province_data);
    	$this->assign('city_data'		,$city_data);
    	$this->assign('district_data'	,$district_data);
    	$this->assign('community_data'	,$community_data);
    }
}
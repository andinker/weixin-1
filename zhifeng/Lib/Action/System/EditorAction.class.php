<?php
class EditorAction extends BackAction{
	public function _initialize() {
		parent::_initialize();
		$this->upload_path='/data/Uploads/';
		 $this->savePath = $_SERVER['DOCUMENT_ROOT'].__ROOT__.'/data/Uploads/';
	}
    protected function _upload_init($upload) {
        $file_type = empty($_GET['dir']) ? 'image' : trim($_GET['dir']);
        $ext_arr = array(
            'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
            'flash' => array('swf', 'flv'),
            'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
            'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2'),
        );
        $allow_exts_conf = explode(',', C('up_exts')); // 读取配置
        $allow_max = C('up_size'); // 读取配置
        //和总配置取交集
        $allow_exts = array_intersect($ext_arr[$file_type], $allow_exts_conf);
        $allow_max && $upload->maxSize = $allow_max * 1024;   //文件大小限制
        $allow_exts && $upload->allowExts = $allow_exts;  //文件类型限制
        $upload->savePath =  './data/Uploads/' . $file_type . '/';
        $upload->saveRule = 'uniqid';
        $upload->autoSub = true;
        $upload->subType = 'date';
        $upload->dateFormat = 'Y/m/d/';
        return $upload;
    }
    
    /**
     * 编辑器上传
     */
    public function editer_upload() {
		//dump($_REQUEST);
        $file_type = empty($_GET['dir']) ? 'image' : trim($_GET['dir']);
		//dump($_FILES);
		
         $root_path =  $this->savePath.$file_type.'/';
		//echo $root_path;
        $result = $this->_upload($root_path,'');
		//dump($result);exit;
        if ($result['error']) {
            echo json_encode(array('error'=>1, 'message'=>$this->upload_path.$file_type . '/' .$result[0]['savename']));
        } else {
            echo json_encode(array('error'=>0, 'url'=>C('SITE_URL').$this->upload_path.$file_type . '/' .strtolower($result[0]['savename'])));
        }
        exit;
     }
    
/*	function localUpload($filetypes=''){
		$upload = new UploadFile();
		$upload->maxSize  = intval(C('up_size'))*1024 ;
		if (!$filetypes){
			$upload->allowExts  = explode(',',C('up_exts'));
		}else {
			$upload->allowExts  = $filetypes;
		}
		$upload->autoSub=1;
		if (isset($_POST['width'])){
			$upload->thumb = true;
			$upload->thumbMaxWidth=$_POST['width'];
			$upload->thumbMaxHeight=$_POST['height'];
			//$upload->thumbPrefix='';
			$thumb=1;
		}
		$upload->thumbRemoveOrigin=true;
		//
		$firstLetter=substr($this->token,0,1);
		$up_path=$this->upload_path.'/'.$firstLetter.'/'.$this->token.'/';
		$upload->savePath = $_SERVER['DOCUMENT_ROOT'].__ROOT__.$up_path;// 设置附件上传目录
		//
		if (!file_exists($_SERVER['DOCUMENT_ROOT'].__ROOT__.$this->upload_path)||!is_dir($_SERVER['DOCUMENT_ROOT'].__ROOT__.$this->upload_path)){
			mkdir($_SERVER['DOCUMENT_ROOT'].__ROOT__.$this->upload_path,0777);
		}
		$firstLetterDir=$_SERVER['DOCUMENT_ROOT'].__ROOT__.$this->upload_path."/".$firstLetter;
		if (!file_exists($firstLetterDir)||!is_dir($firstLetterDir)){
			mkdir($firstLetterDir,0777);
		}
		if (!file_exists($firstLetterDir.'/'.$this->token)||!is_dir($firstLetterDir.'/'.$this->token)){
			mkdir($firstLetterDir.'/'.$this->token,0777);
		}
		//
		$upload->hashLevel=0;
		if(!$upload->upload()) {// 上传错误提示错误信息
			$error=1;
			$msg=$upload->getErrorMsg();
		}else{// 上传成功 获取上传文件信息
			$error=0;
			$info =  $upload->getUploadFileInfo();
			
			if ($thumb==1){
				$paths=explode('/',$info[0]['savename']);
				$fileName=$paths[count($paths)-1];
				$msg=C('site_url').$up_path.str_replace($fileName,'thumb_'.$fileName,$info[0]['savename']);
				$file_url=$up_path.str_replace($fileName,'thumb_'.$fileName,$info[0]['savename']);
			}else {
				$msg=C('site_url').$up_path.$info[0]['savename'];
				$file_url=$up_path.$info[0]['savename'];
			}
			
			M('Users')->where(array('id'=>$this->user['id']))->setInc('attachmentsize',intval($info[0]['size']));
			M('Files')->add(array('token'=>$this->token,'size'=>intval($info[0]['size']),'time'=>time(),'type'=>$info[0]['extension'],'url'=>$file_url,'uptype'=>'local'));
		}
		return array('error'=>$error,'msg'=>$msg);
	}
	*/
    /**
     * 编辑器图片空间 
     */
     public function editer_manager() {
         $root_path = './data/Uploads/image/';
         $root_url = './data/Uploads/image/';
         $ext_arr = array('gif', 'jpg', 'jpeg', 'png', 'bmp');
         $dir_name = empty($_GET['dir']) ? '' : trim($_GET['dir']);
        
         if (!in_array($dir_name, array('', 'image', 'flash', 'media', 'file'))) {
             echo "Invalid Directory name.";
             exit;
         }
         if ($dir_name !== '' && $dir_name != 'file') {
             $root_path .= $dir_name . "/";
             $root_url .= $dir_name . "/";
            if (!file_exists($root_path)) {
			mkdir($root_path);
             }
         }
        
        //根据path参数，设置各路径和URL
         if (empty($_GET['path'])) {
             $current_path = realpath($root_path) . '/';
             $current_url = $root_url;
             $current_dir_path = '';
             $moveup_dir_path = '';
         } else {
             $current_path = realpath($root_path) . '/' . $_GET['path'];
             $current_url = $root_url . $_GET['path'];
             $current_dir_path = $_GET['path'];
             $moveup_dir_path = preg_replace('/(.*?)[^\/]+\/$/', '$1', $current_dir_path);
         }
         echo realpath($root_path);
        //排序形式，name or size or type
        $this->_order = empty($_GET['order']) ? 'name' : strtolower($_GET['order']);

        //不允许使用..移动到上一级目录
        if (preg_match('/\.\./', $current_path)) {
            echo 'Access is not allowed.';
            exit;
        }
        //最后一个字符不是/
        if (!preg_match('/\/$/', $current_path)) {
            echo 'Parameter is not valid.';
            exit;
        }
        //目录不存在或不是目录
        if (!file_exists($current_path) || !is_dir($current_path)) {
            echo 'Directory does not exist.';
            exit;
        }

        //遍历目录取得文件信息
        $file_list = array();
        if ($handle = opendir($current_path)) {
            $i = 0;
            while (false !== ($filename = readdir($handle))) {
		if ($filename{0} == '.') continue;
		$file = $current_path . $filename;
		if (is_dir($file)) {
			$file_list[$i]['is_dir'] = true; //是否文件夹
			$file_list[$i]['has_file'] = (count(scandir($file)) > 2); //文件夹是否包含文件
			$file_list[$i]['filesize'] = 0; //文件大小
			$file_list[$i]['is_photo'] = false; //是否图片
			$file_list[$i]['filetype'] = ''; //文件类别，用扩展名判断
		} else {
			$file_list[$i]['is_dir'] = false;
			$file_list[$i]['has_file'] = false;
			$file_list[$i]['filesize'] = filesize($file);
			$file_list[$i]['dir_path'] = '';
			$file_ext = strtolower(array_pop(explode('.', trim($file))));
			$file_list[$i]['is_photo'] = in_array($file_ext, $ext_arr);
			$file_list[$i]['filetype'] = $file_ext;
		}
		$file_list[$i]['filename'] = $filename; //文件名，包含扩展名
		$file_list[$i]['datetime'] = date('Y-m-d H:i:s', filemtime($file)); //文件最后修改时间
		$i++;
            }
            closedir($handle);
        }
        usort($file_list, array($this, '_cmp_func'));
        $result = array();
        //相对于根目录的上一级目录
        $result['moveup_dir_path'] = $moveup_dir_path;
        //相对于根目录的当前目录
        $result['current_dir_path'] = $current_dir_path;
        //当前目录的URL
        $result['current_url'] = $current_url;
        //文件数
        $result['total_count'] = count($file_list);
        //文件列表数组
        $result['file_list'] = $file_list;

        //输出JSON字符串
        header('Content-type: application/json; charset=UTF-8');
        echo json_encode($result);
        exit;
    }
    
    //排序
    private function _cmp_func($a, $b) {
        if ($a['is_dir'] && !$b['is_dir']) {
            return -1;
        } else if (!$a['is_dir'] && $b['is_dir']) {
            return 1;
        } else {
            if ($this->_order == 'size') {
                if ($a['filesize'] > $b['filesize']) {
                    return 1;
                } else if ($a['filesize'] < $b['filesize']) {
                    return -1;
                } else {
                    return 0;
                }
            } else if ($this->_order == 'type') {
                return strcmp($a['filetype'], $b['filetype']);
            } else {
                return strcmp($a['filename'], $b['filename']);
            }
	}
    }
}
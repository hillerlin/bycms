<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class Index extends Home{
    
	public function index(){     
	    $ua = strtolower($_SERVER['HTTP_USER_AGENT']);
		$uachar = "/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera |Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i";
		if($ua == '' || preg_match($uachar, $ua)){
           $this->redirect("wap/index/index");
		}

	 //顶级栏目
		$Category=new \app\index\model\Category;
		$tree=$Category->maketree(1) ;
		$this->assign ( 'tree', $tree );
		
		//统计
		addCount("visitor","访客数+1");		
		$meta_title="首页";  
		$this->assign('meta_title', $meta_title);
	    return $this->fetch();
	}
	public function pic(){     
	   //顶级栏目
		$Category=new \app\index\model\Category;
		$tree=$Category->maketree(2) ;
		$this->assign ( 'tree', $tree );
		//统计
		addCount("visitor","访客数+1");		
		$meta_title="首页";  
		$this->assign('meta_title', $meta_title);
	    return $this->fetch();
	}
	public function download(){     
	   //顶级栏目
		$Category=new \app\index\model\Category;
		$tree=$Category->maketree(3) ;
		$this->assign ( 'tree', $tree );
		//统计
		addCount("visitor","访客数+1");		
		$meta_title="首页";  
		$this->assign('meta_title', $meta_title);
	    return $this->fetch();
	}
}

<?php
namespace app\index\controller;
use app\index\lib\contentsBuild\indexContent;
use think\Controller;
use think\Db;
use xunsearch;
use app\index\lib\xunsearchLib\xunsearchDecorator;
use app\index\lib\contentsBuild\contentsRender;
class Index extends Home{
    
	public function index(){
        //$aa=config('customConfig');
	    $ids=['123','1143'];
	    $list=array_map('change_to_quotes',$ids);
        $lists= implode(',',array_map('change_to_quotes',$ids));
/*        $xunsearchObj = new xunsearchDecorator(xunsearch\SoClass::getInstance());
	    $sql="select id,description from bycms_document where description <>''";
	    $list=Db::query($sql);
	    foreach ($list as $key=>$value)
        {
            $xunsearchObj->add(['id' => intval($value['id']), 'description' => $value['description']]);
        }*/
        //var_dump($xunsearchObj->query('',100,0));

	    $ua = strtolower($_SERVER['HTTP_USER_AGENT']);
		$uachar = "/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera |Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i";
		if($ua == '' || preg_match($uachar, $ua)){
           $this->redirect("wap/index/index");
		}

	    //顶级栏目
		$Category=new \app\index\model\Category;
		$tree=$Category->maketree(1) ;
		//找出大麦的新闻分类和内容（）
		$damaiTotal=getCategoryInfoByWords($tree,'大麦理财');
        //数据合成
        $contentsObj=new contentsRender();
        $list=$contentsObj->render(new indexContent(),$damaiTotal);
		$this->assign ( 'list', $list );
		
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

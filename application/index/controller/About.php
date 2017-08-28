<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class About extends Home{
	
	//关于我们
	public function cate($id=""){     
		$id=input('id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('分类ID错误！');
		}else{
		   $where["id"]=$id;
		}	
		$info= Db::name('Category')->where($where)->find();
		if(!$info){
		    $this->error('分类不存在！');
		}
		$meta_title=$info["title"];  
		$this->assign('meta_title', $meta_title);
		unset($info);
		$map["category_id"]=$id;
	    $info= Db::name('document')->where($map)->find();
		$this->assign("info",$info);
		return $this->fetch();
	}
		
	
}
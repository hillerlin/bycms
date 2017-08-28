<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class Comment extends Home{
	
	
	public function add($id=""){  
        if(!is_login()){
			$this->error("请先登录");
		}
	   $id=input('doc_id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('ID错误！');
		}else{
		   $where["id"]=$id;
		}
	    $info= Db::name('document')->where($where)->find();
		if(!$info){
		    $this->error('文章不存在！');
		} 
		 if($_POST){
		   $Comment = new \app\index\model\Comment;
           $res=$Comment->validate(true)->allowField(true)->save($_POST);
	       if($res){
			   Db::name('document')->where($where)->setInc("comments");
		      $this->success("发布成功！");
		   }else{
			  $error=$Comment->getError()?$Comment->getError():"发布失败！";
			  $this->error($error);
		   } 
	  }
	}
	public function update($id=""){  
        if(!is_login()){
			$this->error("请先登录");
		}
	    $id=input('id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('ID错误！');
		}else{
		   $where["id"]=$id;
		}
	    $info= Db::name('comment')->where($where)->find();
		if(!$info){
		    $this->error('评论不存在！');
		}
		$res= Db::name('comment')->where($where)->setInc("zan");
	    if($res){
		      $this->success("操作成功！");
		}else{
			  $this->error("操作失败！");
		 } 
	  }	
	public function reply($id=""){  
        if(!is_login()){
			$this->error("请先登录");
		}
	    $id=input('doc_id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('ID错误！');
		}else{
		   $where["id"]=$id;
		}
	    $info= Db::name('document')->where($where)->find();
		if(!$info){
		    $this->error('文章不存在！');
		} 
		$pid=input('pid'); 	
        if(!($pid && is_numeric($pid))){
		   $this->error('ID错误！');
		}else{
		   $where["id"]=$pid;
		}
	    $info= Db::name('comment')->where($where)->find();
		if(!$info){
		    $this->error('评论不存在！');
		}
		 $Comment = new \app\index\model\Comment;
         $res=$Comment->validate(true)->allowField(true)->save($_POST);
	    if($res){
		      $this->success("操作成功！");
		}else{
			  $this->error("操作失败！");
		 } 
	  }	
}
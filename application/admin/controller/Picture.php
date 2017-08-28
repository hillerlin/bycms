<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Controller;
use think\Db;

class Picture extends Admin{
    public function index(){     
        if(isset($_GET['title'])){
            $map['title']  = array('like', '%'.(string)input('title').'%');
        }else{
			$map="";
		}
        $res=getLists('Picture',$map,10,'id desc',"");;
	    $this->assign('res', $res);
		$this->meta_title="图片管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}
	


	public function edit($id){   
	    if($_POST){
		   $Picture= new \app\admin\model\Picture;
           $res=$Picture->validate(true)->allowField(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
			  addUserLog("edit_picture",session_uid());
		      $this->success("更新成功！");
		   }else{
			    $error=$Picture->getError()?$Picture->getError():"更新失败！";
			    $this->error($error);
		   } 
	  }
	  else{
		 $map['id']=$id;
		 $info=Db::name("Picture")->where($map)->find();
	     $this->assign('info', $info);
		
		 $this->meta_title="编辑图片";
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
	  public function add($id=""){  
	  if($_POST){
		  $Picture=new \app\admin\model\Picture;
            // 过滤post数组中的非数据表字段数据
          $res=$Picture->validate(true)->allowField(true)->save($_POST);
	      if($res){
			   addUserLog("add_picture",session_uid());
		       $this->success("新增成功！");
		  }else{
			   $error=$Picture->getError()?$Picture->getError():"新增失败！";
			   $this->error($error);
		  } 
	}
	  else{
		  $map['pid']=0;
	      $list =Db::name('category')->where($map)->select(); 
	      $this->assign('list', $list);
		  $this->meta_title="新增图片";
		  $this->assign('meta_title', $this->meta_title);
	      return $this->fetch("ad/edit");
	  }
	}
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		if(!$map["id"]){
			 $this->error("未选择数据！");
		}
		$res=Db::name("Picture")->where($map)->delete();
		if($res){
		   addUserLog("del_picture",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}
	
}

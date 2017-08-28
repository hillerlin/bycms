<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuwei <1010422715@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Slide extends Admin{ 
   
    public function index(){     
      
        if(isset($_GET['title'])){
            $map['title']  = array('like', '%'.(string)input('title').'%');
        }else{
			$map="";
		}
        $res=getLists('Slide',$map,10,'id desc',"");;
	    $this->assign('res', $res);
		$this->meta_title="幻灯片管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}
	
	public function edit($id){   
	    if($_POST){
		   $Slide = new \app\admin\model\Slide;
           $res=$Slide->validate(true)->allowField(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
			  addUserLog("edit_slide",session_uid());
		      $this->success("更新成功");
		   }else{
			    $error=$Slide->getError()?$Slide->getError():"更新失败";
			    $this->error($error);
		   } 
	  }
	  else{
		 $map['id']=$id;
		 $info=Db::name("Slide")->where($map)->find();
	     $this->assign('info', $info);
		 unset($map);

		unset($map);
	
		$map["pid"]=0;
        $list=Db::name('category')->where($map)->select();
		$this->assign('list',$list);
		
		
		 $this->meta_title="编辑-".$info["title"];
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
    public function add($id=""){  
	    if($_POST){
		   $Slide =  new \app\admin\model\Slide;
           // 过滤post数组中的非数据表字段数据
           $res=$Slide->validate(true)->allowField(true)->save($_POST);
	     if($res){
			    addUserLog("add_slide",session_uid());
		      $this->success("新增成功！");
		  }else{
			  $error=$Slide->getError()?$Slide->getError():"新增失败";
			  $this->error($error);
		  } 
	   }
	  else{
		
         $map["pid"]=0;
		 $list =Db::name('category')->where($map)->select();
		 $this->assign('list',$list);
		 $this->meta_title="新增幻灯片";
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch("slide/edit");
	  }
	}   //切换分类
    public function change($pid){
	   $field="id,pid,title";
       $pid=input('pid'); // 用intval过滤$_POST['pid']
	   $map["pid"]=$pid; 
	   $data=Db::name("category")->where($map)->field($field)->select();
	   if($data){
		   exit(json_encode($data));
	   }
   }
   
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		if(!$map["id"]){
			 $this->error("未选择数据！");
		}
		$res=Db::name("Slide")->where($map)->delete();
		if($res){
		   addUserLog("del_slide",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}
}

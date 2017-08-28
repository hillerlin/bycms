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

class Attributes extends Admin{
    public function index(){     
        if(isset($_GET['title'])){
            $map['title']  = array('like', '%'.(string)input('title').'%');
        }
		if(input('pid')){
            $map['pid']=input('pid');
        }else{
		    $map="";
		}
		$res=getLists('Attributes',$map,10,'id desc',"");;
	    $this->assign('res', $res);
		$this->meta_title="属性配置管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}

   public function edit($id){   
	    if($_POST){
		   $Attributes = model('Attributes');
           $res=$Attributes->save($_POST,['id' => $_POST['id']]);
	       if($res){
		      $this->success("更新成功！");
		   }else{
			   $this->success("更新失败！");
		   } 
	  }
	  else{
		     $map['id']=$id;
            /* 获取数据 */
             $info=Db::name('Attributes')->where($map)->find($id);       
             $list =Db::name('models')->select();
		     $this->assign('list',$list);
		     $group_list= C("DOCUMENT_GROUP");
		     $group_list=explode("|",$group_list);
             $this->assign('group_list',$group_list);
			 $this->assign('info', $info);
		     $this->meta_title="编辑属性-".$info["title"];
		     $this->assign('meta_title', $this->meta_title);
	         return $this->fetch();
	   }
	}
    public function add($id=""){  
	    if($_POST){
		   $Attributes = model('Attributes');
           // 过滤post数组中的非数据表字段数据
           $res=$Attributes->allowField(true)->save($_POST);
	     if($res){
		      $this->success("新增成功！");
		  }else{
			  $this->success("新增失败！");
		  } 
	   }
	  else{
		   $group_list= C("DOCUMENT_GROUP");
		   $group_list=explode("|",$group_list);
           $this->assign('group_list',$group_list);
		   $list =Db::name('models')->select();
		   $this->assign('list',$list);
	       return $this->fetch("edit");
	  }
	}
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		if(!$map["id"]){
			 $this->error("未选择数据！");
		}
		$res=Db::name("Attributes")->where($map)->delete();
		if($res){
		   $this->success("删除成功！");
		}else{
			 $this->success("删除失败！");
		}
	}



}
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

class Group extends Admin{
    public function index(){     
        if($_POST){
			foreach ($_POST as $key=>$value){
				if($value!=""){
					$map[$key]  = array('like', '%'.$value.'%');
				 }
			}
        }
		$map=isset($map)?$map:'';
        $res=getLists('group',$map,10,'id desc',"");;
	    $this->assign('res', $res);
		$this->meta_title="分组管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}
	


	public function edit($id){   
	    if($_POST){
		   $Group = new \app\admin\model\Group;
           $res=$Group->validate(true)->allowField(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
			    addUserLog("edit_group",session_uid());
		      $this->success("更新成功！");
		   }else{
			  $error=$Group->getError()?$Group->getError():"更新失败！";
			  $this->error($error);
		   } 
	  }
	  else{
		 $map['id']=$id;
		 $info=Db::name("Group")->where($map)->find();
	     $this->assign('info', $info);
		 unset($map);
		 
		 $map['pid']=0;
	     $list =Db::name('module')->where($map)->select(); 
		 foreach($list as $key=>$v){
			 $ids[]=$v["id"];
		 }
		 unset($list);
		 unset($map);
		 $map['pid']=array("in",$ids);
	     $list =Db::name('module')->where($map)->select(); 
            /* 获取模块信息 */
         $this->assign('list', $list);
		 
		 
		 $this->meta_title="编辑分组-".$info["title"];
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
	  public function add($id=""){  
	  if($_POST){
		   $Group =new \app\admin\model\Group;
        // 过滤post数组中的非数据表字段数据
       $res=$Group->validate(true)->allowField(true)->save($_POST);
	   if($res){
		     addUserLog("add_group",session_uid());
		    $this->success("新增成功！");
		}else{
		   $error=$Group->getError()?$Group->getError():"新增失败！";
		   $this->error($error);
		} 
	}
	  else{
		  $map['pid']=0;
	      $list =Db::name('Group')->where($map)->select(); 
	      $this->assign('list', $list);
		  $this->meta_title="新增分组";
		  $this->assign('meta_title', $this->meta_title);
	      return $this->fetch("group/edit");
	  }
	}
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		if(!$map["id"]){
			 $this->error("未选择数据！");
		}
		$res=Db::name("Group")->where($map)->delete();
		if($res){
		   addUserLog("del_group",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}
	
}

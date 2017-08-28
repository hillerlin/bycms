<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------

namespace app\admin\controller;
use think\Controller;
use think\Db;
class Channel extends Admin{
    public function index(){     
        if($_POST){
			foreach ($_POST as $key=>$value){
				if($value!=""){
					$map[$key]  = array('like', '%'.$value.'%');
				 }
			}
        }
		$map=isset($map)?$map:'';
        $res=getLists('Channel',$map,10,'id desc',"");;
	    $this->assign('res', $res);
		$this->meta_title="导航管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}
	


	public function edit($id){   
	    if($_POST){
		   $Channel = new \app\admin\model\Channel;
           $res=$Channel->validate(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
			   addUserLog("edit_channel",session_uid());
		      $this->success("更新成功！");
		   }else{
			  $error=$Channel->getError()?$Channel->getError():"更新失败！";
			  $this->error($error);
		   } 
	  }
	  else{
		 $map['id']=$id;
		 $info=Db::name("Channel")->where($map)->find();
	     $this->assign('info', $info);
		
		 $this->meta_title="编辑导航";
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
	  public function add($id=""){  
	  if($_POST){
		  $Channel =new \app\admin\model\Channel;
            // 过滤post数组中的非数据表字段数据
          $res=$Channel->validate(true)->allowField(true)->save($_POST);
	      if($res){
			  addUserLog("add_channel",session_uid());
		      $this->success("新增成功！");
		  }else{
			  $error=$Channel->getError()?$Channel->getError():"新增失败！";
			  $this->error($error);
		   } 
	}
	  else{
		
		  $this->meta_title="新增导航";
		  $this->assign('meta_title', $this->meta_title);
	      return $this->fetch("Channel/edit");
	  }
	}
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		if(!$map["id"]){
			 $this->error("未选择数据！");
		}
		$res=Db::name("Channel")->where($map)->delete();
		if($res){
		   addUserLog("del_channel",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}
	
}

<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\cache\driver\Redis;

class Ad extends Admin{
    protected $adList=['文章内页'];
    public function index(){     
        if(isset($_GET['title'])){
            $map['title']  = array('like', '%'.(string)input('title').'%');
        }else{
			$map="";
		}
        $res=getLists('ad',$map,10,'id desc',"");;
	    $this->assign('res', $res);
		$this->meta_title="广告管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}
	


	public function edit($id){   
	    if($_POST){
		   $Ad = new \app\admin\model\Ad;
           $res=$Ad->validate(true)->allowField(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
               $redis= new Redis();
               if(in_array($_POST['title'],$this->adList))
               {
                   $sql="select p.path,a.url from bycms_ad as a left join bycms_picture as p on a.cover_id=p.id where a.title='".$_POST['title']."' limit 1 ";
                   $list=Db::query($sql);
                   $redis->handler()->set('documentAd',json_encode($list));
               }

			  addUserLog("edit_ad",session_uid());
		      $this->success("更新成功！");
		   }else{
			    $error=$Ad->getError()?$Ad->getError():"更新失败！";
			    $this->error($error);
		   } 
	  }
	  else{
		 $map['id']=$id;
		 $info=Db::name("Ad")->where($map)->find();
	     $this->assign('info', $info);
		 unset($map);
		 $map['pid']=0;
	     $list =Db::name('category')->where($map)->select(); 
            /* 获取模块信息 */
         $this->assign('list', $list);
		 $this->meta_title="编辑广告-".$info["title"];
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
	  public function add($id=""){  
	  if($_POST){
		  $Ad =new \app\admin\model\Ad;
            // 过滤post数组中的非数据表字段数据
          $res=$Ad->validate(true)->allowField(true)->save($_POST);
	      if($res){
              $redis= new Redis();
              if(in_array($_POST['title'],$this->adList))
              {
                  $sql="select p.path,a.url from bycms_ad as a left join bycms_picture as p on a.cover_id=p.id where a.title='".$_POST['title']."' limit 1 ";
                  $list=Db::query($sql);
                  $redis->handler()->set('documentAd',json_encode($list));
              }
			   addUserLog("add_ad",session_uid());
		      $this->success("新增成功！");
		  }else{
			  $error=$Ad->getError()?$Ad->getError():"新增失败！";
			  $this->error($error);
		  } 
	}
	  else{
		  $map['pid']=0;
	      $list =Db::name('category')->where($map)->select(); 
	      $this->assign('list', $list);
		  $this->meta_title="新增广告";
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
		$res=Db::name("Ad")->where($map)->delete();
		if($res){
		   addUserLog("del_ad",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}
	
}

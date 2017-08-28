<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Config extends Admin{
    public function index(){     
        if($_POST){
			foreach ($_POST as $key=>$value){
				if($value!=""){
					$map[$key]  = array('like', '%'.$value.'%');
				 }
			}
        }
		$map=isset($map)?$map:'';
		$type   = C("GROUP");
		$type=explode("|",$type);
        $list   = Db::name("Config")->where($map)->select();
      
        $this->assign('list',$list);
		$res=getLists('Config',$map,10,'id desc',"");;
	    $this->assign('res', $res);
		$this->meta_title="配置管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	} 
	public function change(){   
        $ISDES=C('ISDES');	
        if($ISDES){
            $data['value']=0;
        }else{
			$data['value']=1;
		}
		$map['name']="ISDES";
		
		$group=Db::name('Config')->where($map)->update($data);
	    $url=input("server.HTTP_REFERER");
		$this->redirect($url); 
	}
	//系统配置
	public function systems($config =""){   
	    if($_POST){
		   if($config && is_array($config)){
            $Config =Db::name('Config');
			$res=array();
            foreach ($config as $name => $value) {
                $map = array('name' => $name);
				$res[]=$value;
                $Config->where($map)->setField('value', $value);
            }
           }
	       if($res){
			     addUserLog("edit_config",session_uid());
		      $this->success("更新成功！");
		   }else{
			   $this->error("更新失败！");
		   } 
	  }
	  else{
		$group  =  input('group');
        $map['group']=$group?$group:0;
		$type   = C("GROUP");
		$type=explode("|",$type);
        $list   = Db::name("Config")->where($map)->select();
      
        $this->assign('list',$list);
        $this->assign('type',$group);//dump($type);
		$this->assign('groups',$type);
        $this->meta_title = '系统设置';
       
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch();
	   }
	}
  
	public function edit($id){   
	    if($_POST){
		   $config =  new \app\admin\model\Config;
           $res=$config->validate(true)->allowField(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
			     addUserLog("edit_config",session_uid());
		      $this->success("更新成功！");
		   }else{
			    $error=$config->getError()?$Ad->getError():"更新失败";
			    $this->error($error);
		   } 
	  }
	  else{
		$group  =  input('group');
        $map['group']=$group?$group:0;
		$type   = C("GROUP");
		$type=explode("|",$type);
         $list   = Db::name("Config")->where($map)->select();
         $this->assign('list',$list);
		 $map2['id']=$id;
		 $info=Db::name("config")->where($map2)->find();
	     $this->assign('info', $info);
		 $this->meta_title="编辑配置";
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
    public function add($id=""){  
	  if($_POST){
		    $config =  new \app\admin\model\Config;
        // 过滤post数组中的非数据表字段数据
           $res=$config->validate(true)->allowField(true)->save($_POST);
	   if($res){
		     addUserLog("add_config",session_uid());
		   $this->success("新增成功！");
		}else{
			$error=$config->getError()?$config->getError():"新增失败";
		 $this->error($error);
		} 
	}
	  else{
		$group  =  input('group');
        $map['group']=$group?$group:0;
		$type   = C("GROUP");
		$type=explode(",",$type);
        $list   = Db::name("Config")->where($map)->select();
      
         $this->assign('list',$list);
		 $this->meta_title="新增配置";
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch("config/edit");
	  }
	}
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		$res=Db::name("config")->where($map)->delete();
		if($res){
		   addUserLog("del_config",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->success("删除失败！");
		}
	}
	
}

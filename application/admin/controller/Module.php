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

class Module extends Admin{
    public function index(){     
         if(isset($_GET['title'])){
            $map['title']  = array('like', '%'.(string)input('title').'%');
        }else{
			$map="";
		}
        $field = 'id,pid,title,url,sort,icon,group_id,font';
		//$list=Db::name( 'Module' )->where($map)->field($field)->order("id asc")->select();
	    //$this->assign('list', getSort($list));
		$list=$this->getCategory();
	    $this->assign('list', $list);
		$this->meta_title="模块管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}
	
		 		/**商品分类菜单调用**/
 public function getCategory(){
	  
		$field = 'id,pid,title,status,sort,url,group_id,font';
		$category =Db::name( 'Module' )->field($field)->order('sort asc,id asc')->select( );
		$list = $this->unlimitedForLevel($category);
		return $list;
		}
 public function unlimitedForLevel($cate,$name = 'child',$pid = 0){
		$arr = array( );
		foreach ( $cate as $key => $v ) {
		//判断，如果$v['pid'] == $pid的则压入数组Child
			if ($v['pid'] == $pid) {
			//递归执行
				$v[$name] = self::unlimitedForLevel($cate,$name,$v['id']);
				$arr[] = $v;
			}
		}
		return $arr;
	}

	public function edit($id){   
	    if($_POST){
		   $Module = new \app\admin\model\Module;
           $res=$Module->validate(true)->allowField(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
			  addUserLog("edit_module",session_uid());
		      $this->success("更新成功！",'Module/index');
		   }else{
			    $error=$Module->getError()?$Module->getError():"更新失败！";
			    $this->error($error);
		   } 
	  }
	  else{
		 $map['id']=$id;
		 $info=Db::name("Module")->where($map)->find();
	     $this->assign('info', $info);
		 unset($map);
		 $list =Db::name('Module')->select(); 
	     $this->assign('list', getSort($list));;
		 $group_list =Db::name('group')->select(); 
            /* 获取模块信息 */
         $this->assign('group_list', $group_list);
		 $this->meta_title="编辑模块-".$info["title"];
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
	  public function add($pid=""){  
	  if($_POST){
		   $Module = new \app\admin\model\Module;
        // 过滤post数组中的非数据表字段数据
       $res=$Module->validate(true)->allowField(true)->save($_POST);
	   if($res){
		    addUserLog("add_module",session_uid());
		   $this->success("新增成功！");
		}else{
			 $error=$Module->getError()?$Module->getError():"新增失败！";
			 $this->error($error);
		} 
	}
	  else{
		if($pid){
             $info['pid']=$pid;
			 $this->assign('info', $info);
         }
	     $list =Db::name('Module')->select(); 
	     $this->assign('list', getSort($list));
		 $this->meta_title="新增模块"; 
		 $group_list =Db::name('group')->select(); 
            /* 获取模块信息 */
         $this->assign('group_list', $group_list);
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch("Module/edit");
	  }
	}
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		if(!$map["id"]){
			 $this->error("未选择数据！");
		}
		
		$res=Db::name("Module")->where($map)->delete();
		if($res){
		   addUserLog("del_module",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}
	
}

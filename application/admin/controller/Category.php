<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Category extends Admin{ 
   
    public function index(){     
		$list=$this->getCategory();
	    $this->assign('list', $list);
		$this->meta_title="分类管理";
		$this->assign('meta_title', $this->meta_title);
	    return $this->fetch(); 
	}

	
	public function edit($id){   
	    if($_POST){
		   $category = new \app\admin\model\Category;
           $res=$category->validate(true)->allowField(true)->save($_POST,['id' => $_POST['id']]);
	       if($res){
			  addUserLog("edit_category",session_uid());
		      $this->success("更新成功！");
		   }else{
			    $error=$category->getError()?$category->getError():"更新失败";
			    $this->error($error);
		   } 
	  }
	  else{
		 $map['id']=$id;
		 $info=Db::name("category")->where($map)->find();
	     $this->assign('info', $info);
		 unset($map);
	
	     $map['status']=1;
         $field = 'id,pid,title,sort';
		 $list=Db::name( 'category' )->where($map)->field($field)->order("id asc")->select();
	     $this->assign('list', getSort($list));
		 $model_list=Db::name( 'models' )->order("id asc")->select();
	     $this->assign('model_list', $model_list);
		 $this->meta_title="编辑分类-".$info["title"];
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch();
	   }
	}
    public function add($pid=""){  
	    if($_POST){
		   $category =  new \app\admin\model\Category;
           // 过滤post数组中的非数据表字段数据
           $res=$category->validate(true)->allowField(true)->save($_POST);
	     if($res){
			 addUserLog("add_category",session_uid());
		      $this->success("新增成功！");
		  }else{
			 $error=$category->getError()?$category->getError():"新增失败";
			 $this->error($error);
		  } 
	   }
	  else{
		 if($pid){
             $info['pid']=$pid;
			 $this->assign('info', $info);
         }
         $field = 'id,pid,title,sort';
		 $list=Db::name( 'category' )->field($field)->order("id desc")->select();
	     $this->assign('list', getSort($list));
        
		 $model_list=Db::name( 'models' )->order("id asc")->select();
	     $this->assign('model_list', $model_list);

		 $this->meta_title="新增商品分类";
		 $this->assign('meta_title', $this->meta_title);
	     return $this->fetch("category/edit");
	  }
	}
	 		/**商品分类菜单调用**/
 public function getCategory(){
	    
		$field = 'id,pid,title,status,sort,model_id';
		$category =Db::name( 'category' )->field($field)->order('id asc')->select( );
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
	 public function del(){   
	    $id=input("id");
	    $map['id']=array("in",$id);
		if(!$map["id"]){
			 $this->error("未选择数据！");
		}
		$res=Db::name("category")->where($map)->delete();
		if($res){
			addUserLog("del_category",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}
}

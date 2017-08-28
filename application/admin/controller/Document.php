<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Document extends Admin{
    public function index(){     
        if($_POST){
			foreach ($_POST as $key=>$value){
				if($value!=""){
					$map[$key]  = array('like', '%'.$value.'%');
				 }
			}
        }
		$map=isset($map)?$map:'';
		$pid=input('pid');
        if($pid){
			$Category=new \app\admin\model\Category;
            //当前id及子类列表
			$cate_ids  = $Category->getChildrenId($pid);
			$this->assign("cate_ids",$cate_ids);
			$map["category_id"]=array("in",$cate_ids);
			//当前id
			
        }
		$res=getLists('Document',$map,10,'id desc',"");
	    $this->assign('res', $res);
		$this->meta_title="文章管理";
		$this->assign('meta_title', $this->meta_title);
		$cate_list=$this->getCategory();
	    $this->assign('cate_list', $cate_list);
		$pid=$pid?$pid:159;
		$this->assign("pid",$pid);
	    return $this->fetch(); 
	}

   public function edit($id){   
	    if($_POST){ 
		   $Document = new \app\admin\model\Document;
           $Document->validate(true)->allowField(true)->save($_POST,['id' => input('id')]);
		   $res=$Document->updatePost();
	       if($res){
			   addUserLog("edit_document",session_uid());
		      $this->success("更新成功！");
		   }else{
			   $error=$Document->getError()?$Document->getError():"更新失败！";
			    $this->error($error);
		   } 
	  }
	  else{
		    $map['id']=$id;
            /* 获取数据 */
             $Document=new \app\admin\model\Document;
             $info=$Document->getInfo($id); 
			
             $pid=$info["category_id"];
		     if($pid){
				 $this->assign('pid',$pid); 
			     $category=new \app\admin\model\Category;
			     $ids=$category->getParentId($pid);
				 array_push($ids,$pid);
			     $this->assign("ids",$ids);
             }
			 unset($map);
			 $Attributes=new \app\admin\model\Attributes;
			 $list = $Attributes->getData($info["model_id"]);
			
             $this->assign('list', $list);
             $cate_list=$this->getCategory();
	         $this->assign('cate_list', $cate_list);
		     $this->meta_title="编辑文章-".$info["title"];
		     $this->assign('meta_title', $this->meta_title);
			 $this->assign('info', $info);
	         return $this->fetch();
	   }
	}
    public function add($id=""){  
	    if($_POST){
		   $Document =  new \app\admin\model\Document;
           // 过滤post数组中的非数据表字段数据
           $Document->validate(true)->allowField(true)->save($_POST);
		   $id= $Document->getLastInsID();
		   $res=$Document->updatePost($id);
	         if($res){
			  addUserLog("add_document",session_uid());
             $this->success('新增成功','Document/index');
		  }else{
			 $error=$Document->getError()?$Document->getError():"新增失败！";
			    $this->error($error);
		  } 
	   }
	  else{
		    $pid=input('pid');
		     if($pid){
				$this->assign('pid',$pid); 
			    $info["category_id"]=$pid;
			    $this->assign('info',$info); 
				$Category=new \app\admin\model\Category;
			    $ids=$Category->getParentId($pid);
				array_push($ids,$pid);
			    $this->assign("ids",$ids);
            } 
		    $map["id"]=$pid;
			$cate =Db::name('category')->where($map)->find();
			$this->assign("cate",$cate);
			
			unset($map);
            $Attributes=new \app\admin\model\Attributes;
			$list = $Attributes->getData($cate["model_id"]);
			
            $this->assign('list', $list);
            $cate_list=$this->getCategory();
	        $this->assign('cate_list', $cate_list);
			$this->meta_title="新增文章";
		    $this->assign('meta_title', $this->meta_title);
	       return $this->fetch();
	  }
	}
	
   //切换分类
    public function change($pid){
	   $field="id,pid,title";
       $pid=input('pid'); // 用intval过滤$_POST['pid']
	   $map["pid"]=$pid; 
	
	   if($data=Db::name("category")->where($map)->field($field)->select()){
		   exit(json_encode($data));
	   }
   }
   public function getCategory(){
	    
		$field = 'id,pid,title,status,sort';
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
		$res=Db::name("Document")->where($map)->delete();
		if($res){
			 addUserLog("del_document",session_uid());
		   $this->success("删除成功！");
		}else{
			 $this->error("删除失败！");
		}
	}



}
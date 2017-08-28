<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
/**
 * 前台移动端api
 * 主要获取聚合数据
 */
class Api extends Home {
	/**指定栏目商品**/
    public function getCateByid(){
		$id=input('id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('分类ID错误！');
		}else{
		   $where["id"]=$id;
		}	
		$info= Db::name('Category')->where($where)->find();
		if(!$info){
		    $this->error('分类不存在！');
		}
		$Category=new \app\index\model\Category;
		$cid=$Category->getChildrenId($id);	
		$map['category_id']=array("in",$cid);
	   $api=apiLists('document',$map,10,"sort asc",1);
		      $list=$api["list"];
		 
			foreach($list as &$vo){					
					$vo['pic'] =get_cover($vo['cover_id'],'path');
				}	
		if($list){
		   $res["data"]=$list;
		   $res["code"]=1;
		}else{
		  $res["code"]=0;		
		}
		echo json_encode($res);
	
	}
   /**api首页幻灯片和前10篇文档**/
	public function slide(){
		
			$map['status']=1;
			$slide=DB::name('slide')->where($map)->order("id desc")->select();
			foreach($slide as &$vo){
					
					$vo['pic'] = get_cover($vo['cover_id'],'path');
			}
		  if($slide){
			   $res["slide"]=$slide;
			  
		  }
		  $api=apiLists('document','',7,"sort asc",1);
		  //DB::name('document')->order('sort asc,id asc')->select();
		  $list=$api["list"];
		 
			foreach($list as &$vo){					
					$vo['pic'] =get_cover($vo['cover_id'],'path');
				}	
		if($slide){
		   $res["data"]=$list;
		   $res["code"]=1;
		   $res["key"]=config('database.key').time();
		}else{
		  $res["code"]=0;		
		}
		echo json_encode($res);
	}
	
  /**api首页文档分页**/
public function pagelists($p){
		
			
		  $api=apiLists('document','',7,"sort asc",$p);
		  //DB::name('document')->order('sort asc,id asc')->select();
		  $list=$api["list"];
		 
			foreach($list as &$vo){					
					$vo['pic'] =get_cover($vo['cover_id'],'path');
				}	
		if($api){
		   $res["data"]=$list;
		   $res["code"]=1;
		}else{
		  $res["code"]=0;		
		}
		echo json_encode($res);
	}
  /**api首页文档分页**/
public function pageCatelists($p,$id){
		$id=input('id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('分类ID错误！');
		}else{
		   $where["id"]=$id;
		}	
		$info= Db::name('Category')->where($where)->find();
		if(!$info){
		    $this->error('分类不存在！');
		}
		$Category=new \app\index\model\Category;
		$cid=$Category->getChildrenId($id);	
		$map['category_id']=array("in",$cid);
		$api=apiLists('document',$map,10,"sort asc",$p);
		$list=$api["list"];
		foreach($list as &$vo){					
			$vo['pic'] =get_cover($vo['cover_id'],'path');
		}	
		if($list){
		   $res["data"]=$list;
		   $res["code"]=1;
		}else{
		  $res["code"]=0;		
		}
		echo json_encode($res);
	}
/**api首页导航**/
 public function channel(){
		$map['status']=1;
			//$map['ismenu']=1;
		$list= DB::name( 'menu' )->where($map)->order('id asc')->select();
	     foreach($list as &$vo){
					//$vo['url'] =get_index_url().get_nav_url($vo['url']);
					$vo['extra'] =$vo['id'];
		 }
		 if($list){
		        $res["data"]=$list;
		        $res["code"]=1;
		}else{
		       $res["code"]=0;		
		}
		echo json_encode($res);
	}


 /**api文档详情页**/
  public function detail(){
		$id=input('id');
         //$id=trim(str_replace("+","",$id));		
        if(!($id && is_numeric($id))){
		   $this->error('分类ID错误！');
		}else{
		   $where["id"]=$id;
		}
		$Document=new \app\admin\model\Document;
        $info=$Document->getInfo($id); 
		if(!$info){
		    $this->error('文章不存在！');
		}
		$info['create_time'] =date("Y-m-d",$info['create_time']);
		$info['username'] =get_username($info['uid']);
		Db::name('document')->where($where)->setInc('view');
        $info['pic']=get_cover($info['cover_id'],'path');
		 $api=apiLists('document','',3,"sort asc",1);
		  //DB::name('document')->order('sort asc,id asc')->select();
		  $list=$api["list"];
		 
			foreach($list as &$vo){					
					$vo['pic'] =get_cover($vo['cover_id'],'path');
				}	
		 if($list){
		   $res["relation"]=$list;
		}	
		$map["doc_id"]=$id;
		$comment=Db::name('comment')->where($map)->select();
		
		foreach($comment as &$vo){
					$vo['username']=get_username($vo["uid"]);
		}
		 if($comment){
		   $res["comment"]=$comment;
		}		
        if($info){
		   $res["data"]=$info;
		   $res["code"]=1;
		  
		}else{
		    $res["code"]=1;		
		}
        echo json_encode($res);
	}

}
<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://yershop.com All rights reserved.
// +----------------------------------------------------------------------
use think\Db;
/**
 * 获取分类名称
 * @param id $id   传入分类的id
 * @return string
 */
function get_category_title($id){
   
	$map['id']=$id;
	$info=Db::name("category")->where($map)->find();
    return $info['title'];  
}
function get_comment($id,$field = null){
   
	$map['id']=$id;
	$info=Db::name("comment")->where($map)->find();
    return $info[$field];  
}		
/**
 * 标签库解析广告位标签
 * @param int $place   传入广告的位置
 * @return string
 */
function  parseAd($place){
	$map['place']=$place;
	$list=Db::name("ad")->where($map)->select();
    return $list;  
}
/**
 * 标签库解析推荐位标签
 * @param id $position   传入推荐位
 * @return string
 */	
function  parsePos($pos){
   
	$map['position']=$pos;
	$list=Db::name("document")->where($map)->select();
    return $list;  
}
/**
 * 标签库解析知道分类下位置标签
 * @param id $id   传入分类的id
 * @return string
 */
function  parseCate($id,$order,$limit){
	$Category=new \app\index\model\Category;
	$ids=$Category->getChildrenId($id);	
    $map['category_id']=array("in",$ids);
	$list=Db::name("document")->where($map)->order($order)->limit($limit)->select();
    return $list;  
}
/**
 * 标签库解析知道分类下位置标签
 * @param string $ids   传入分类的id
 * @return string
 */
function  parseMix($ids,$order,$limit){
    $map['category_id']=array("in",$ids);
	$list=Db::name("document")->where($map)->order($order)->limit($limit)->select();
    return $list;  
}
/**
 * 标签库解析知道幻灯片位置标签
 * @param string $ids   传入分类的id
 * @return string
 */
function  parseSlide($place,$order,$limit){
    $map['place']=$place;
	$list=Db::name("slide")->where($map)->order($order)->limit($limit)->select();
    return $list;  
}
/**
 * 标签库解析文章位置标签
 * @param string $ids   传入分类的id
 * @return string
 */
function  parseRead($model_id,$order,$limit){
    $map['model_id']=$model_id;
	$list=Db::name("document")->where($map)->order($order)->limit($limit)->select();
    return $list;  
}
/**
 * 标签库解析友情链接标签
 * @param string $ids   传入分类的id
 * @return string
 */
function  parseLink($order,$limit){
   
	$list=Db::name("friendlink")->order($order)->limit($limit)->select();
    return $list;  
}
/**
 * 标签库解析导航位置标签
 * @param string $ids   传入分类的id
 * @return string
 */
function  parseChannel($order,$limit){
   
	$list=Db::name("Channel")->order($order)->limit($limit)->select();
    return $list;  
}
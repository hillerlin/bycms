<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace app\admin\model;
use think\Model;
use think\Db;
/**
 * 文档基础模型
 */
class Attributes extends Model{
   
     public function getData($model_id=""){
             $data = array('0'=>array('group_id'=>'0'),  
                     '1'=>array('group_id'=>1),  
             );  
			 foreach($data as $n=>$v){
				  $map["model_id"]=array("in","1,{$model_id}");
				  $map["group_id"]=$n;
			      $data[$n]["data"]=Db::name('Attributes')->where($map)->order("sort asc,id asc")->select();
			 }
        return $data;
    }
   
}

<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuwei <1010422715@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\model;
use think\Model;
use think\Db;
/**
 * 文档基础模型
 */
class Goods extends Model{

    protected $auto = ['attributes'];
    protected $insert = ['status' => 1];  
    protected $update = [];  

    protected function setAttributesAttr()
    {   
       if(input('attributes')){ 
	       return implode(",",$_POST['attributes']);
	   }
      
    }


}

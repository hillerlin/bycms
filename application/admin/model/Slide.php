<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\model;
use think\Model;
/**
 * 分类模型
 */
class Slide extends Model{
    protected $insert = ['status' => 1];   
	
	protected function setCreateTimeAttr($value){
        return strtotime($value);
    }
	protected function setUpdateTimeAttr($value){
        return strtotime($value);
    }

}

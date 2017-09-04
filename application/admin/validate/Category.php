<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\validate;
use think\Validate;
use think\Db;

class Category extends Validate{
  protected $rule = [
        'title'  =>  'require|max:25',
        'keywords'=>'require'
		
    ];

    protected $message = [
        'title.require'  =>  '名称必须',
        'keywords.require'  =>  '关键字必填',

    ];

    protected $scene = [
        'add'   =>  ['title','keywords'],
        'edit'  =>  ['title'],
    ];   
	
}

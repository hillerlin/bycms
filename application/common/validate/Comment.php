<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\common\validate;
use think\Validate;

class Comment extends Validate{
  protected $rule = [
        'content'  =>  'require|max:225',
        
    ];

    protected $message = [
        
        'content.require'  =>  '内容必须',
		
    ];

    protected $scene = [
        'add'   =>  ['content'],
        'edit'  =>  ['content'],
    ];   
	
}

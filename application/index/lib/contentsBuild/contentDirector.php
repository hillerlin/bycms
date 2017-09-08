<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/6 0006
 * Time: 下午 2:11
 */
namespace app\index\lib\contentsBuild;
class contentDirector{
       public function build($builder,$pamrams)
       {
           $builder->joinData($pamrams);
           return $builder->getData();
       }
}
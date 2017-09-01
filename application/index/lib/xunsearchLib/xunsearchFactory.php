<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/31 0031
 * Time: 下午 7:05
 */
namespace app\index\lib\xunsearchLib;
abstract class xunsearchFactory{
    abstract protected function init($_class);
    public function domain($_class)
    {
       $obj=$this->init($_class);
       $obj->srender();
       return $obj;
    }
}
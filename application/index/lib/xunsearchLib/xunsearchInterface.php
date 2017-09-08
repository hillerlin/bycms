<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/31 0031
 * Time: 下午 7:05
 */
namespace app\index\lib\xunsearchLib;
abstract class xunsearchInterface{
    protected $_xunsearchObj;
    //装饰者模式
    public function __construct($xunsearchObj)
    {
        $this->_xunsearchObj=$xunsearchObj;
    }
    abstract public function add($params);
    abstract public function updata($params);
    abstract public function query($params,$num,$jump);
}
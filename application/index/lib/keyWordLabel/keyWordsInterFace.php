<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/5 0005
 * Time: 下午 3:00
 */
namespace app\index\lib\keyWordLabel;
use think\cache\driver\Redis;
class keyWordsInterFace{
    protected  $_redis;
    protected  $_handle;
    public function __construct()
    {
      $this->_redis =new Redis();
    }
    //为标签添加点击量
    public function addClick($keyWords,$views,$categoryId)
    {
        //primaryKey : newKeyWords
        //categoryKey: newKeyWordsCategory:xxx
        foreach (explode(',',$keyWords) as $key=>$value)
        {
           $count=$this->_redis->handler()->hGet('newKeyWords',$value);
           if($count)
           {
               //已经点击过的标签，直接在原来的基础上加1
               $this->_redis->handler()->hSet('newKeyWords',$value,$views+1);
               $this->_redis->handler()->hSet('newKeyWordsCategory:'.$categoryId,$value,$views+1);
           }else
           {
               $this->_redis->handler()->hSetNx('newKeyWords',$value,$views+1);
               $this->_redis->handler()->hSetNx('newKeyWordsCategory:'.$categoryId,$value,$views+1);
           }
        }
    }
    //排序
    public function sort()
    {
        $list=$this->_redis->handler()->hGetAll('newKeyWords');
        arsort($list);
        return $list;
    }

}
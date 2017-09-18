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
    //获取分类下的所有标签
    public function getCategoryLabel($parentCatagoryId)
    {
      $Category=new \app\index\model\Category;
      $cid=$Category->getChildrenId($parentCatagoryId);
      $list=[];
      foreach ($cid as $key=>$value)
      {
          $redisList=$this->_redis->handler()->hKeys('newKeyWordsCategory:'.$value);
           if($redisList)
           {
               $list=array_merge($list,$redisList);
           }
      }
      return array_unique($list);
    }
    //删除文章时，把相对应分类和总标签删除
    public function delLabelByDocumentId($keyWords,$categoryId)
    {
        $listTotalFormat=$this->_redis->handler()->hGetAll('newKeyWords');
       // $listTotalFormat=json_decode($listTotal,true);
        $listCategoryTotalFormat=$this->_redis->handler()->hGetAll('newKeyWordsCategory:'.$categoryId);
       // $listCategoryTotalFormat=json_decode($listCategoryTotal,true);
        foreach (explode(',',$keyWords) as $key=>$value)
        {
            if($listTotalFormat[$keyWords])
            {
                unset($listTotalFormat[$keyWords]);
            }
            if($listCategoryTotalFormat[$keyWords])
            {
                unset($listCategoryTotalFormat[$keyWords]);
            }

        }
        $this->_redis->handler()->delete('newKeyWords');
        $this->_redis->handler()->delete('newKeyWordsCategory:'.$categoryId);
        $this->_redis->handler()->hMSet('newKeyWords',$listTotalFormat);
        $this->_redis->handler()->hMSet('newKeyWordsCategory:'.$categoryId,$listCategoryTotalFormat);


    }

}
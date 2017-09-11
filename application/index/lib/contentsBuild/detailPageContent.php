<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/7 0007
 * Time: 下午 3:43
 */
namespace app\index\lib\contentsBuild;
use think\cache\driver\Redis;
use think\Db;
class detailPageContent implements contentInterface{
    protected $rule=['行业资讯'];
    protected $list=[];
    protected $redis;
    public function __construct()
    {
        $this->redis=new Redis();
    }

    public function joinData($params)
    {

        // TODO: Implement joinData() method.
         $this->list['relateArticles']=$this->relateArticles('191',$params['category_title']);
         $this->list['relateQuestion']=$params['category_title']=='All'?$this->relateQuestionAll():$this->relateQuestion('193',$params['category_title']);//目前相关问答id:190,以后基本不会变

    }
    public function getData()
    {
        // TODO: Implement getData() method.
        return $this->list;
    }
    //相关文章
    public function relateArticles($parentCategoryId,$name)
    {
        $Category=new \app\index\model\Category;
        $categoryId=$Category->getCategoryIdByName($name,$parentCategoryId)['id'];
         //key:getCategoryDataListById
          $list=$this->redis->handler()->get('getCategoryDataListById:'.$categoryId);
          if($list)
          {
              return json_decode($list,true);
          }
          else
          {
              $categoryObj=new \app\index\model\Category();
              $list=$categoryObj->getDatalist($categoryId);
              $this->redis->handler()->setEx('getCategoryDataListById:'.$categoryId,300,json_encode($list));
              return $list;
          }
    }
    //相关行业问答
    protected function relateQuestion($categoryParentId,$categoryName)
    {
        $sql="select id from bycms_category where pid=$categoryParentId and title='".$categoryName."'";
        $sqlRuslt=Db::query($sql);
        if(!$sqlRuslt)
            return null;
        $categoryId=Db::query($sql)[0]['id'];
        //key:getCategoryQuestionListById
        $list=$this->redis->handler()->get('getCategoryQuestionListById:'.$categoryId);
        if($list)
        {
            return json_decode($list,true);
        }else
        {
            $map['category_id']=$categoryId;
            $list=Db::name('document')->where($map)->order("id desc")->field('id,title,category_id,view,create_time')->limit(5)->select();
            $this->redis->handler()->setEx('getCategoryQuestionListById:'.$categoryId,300,json_encode($list));
            return $list;
        }
    }
    //相关行业问答--全部
    public function relateQuestionAll()
    {

        $list=$this->redis->handler()->get('getCategoryQuestionListById:All');
        if($list)
        {
            return json_decode($list,true);
        }else
        {
            $Category=new \app\index\model\Category;
            $cid=$Category->getChildrenId('193');
            $map['category_id']=array("in",$cid);
            $num=5;
            $list=getLists('document',$map,$num,'id desc',"id,title,create_time");
            unset($list['page']);
            unset($list['count']);
            $this->redis->handler()->setEx('getCategoryQuestionListById:All',300,json_encode($list['list']));
            return $list['list'];
        }
    }
}
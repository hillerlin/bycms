<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/10 0010
 * Time: 下午 10:23
 */
namespace app\index\lib\contentsBuild;
use think\cache\driver\Redis;
use think\Db;
class questionContent implements contentInterface {
    protected $rule=['行业资讯'];
    protected $list=[];
    protected $redis;
    public function joinData($params)
    {
        $this->redis=new Redis();
        // TODO: Implement joinData() method.
        $this->list['hotQuestion']=$this->hotQuestion();
        $this->list['relateQuestion']=$params['keyWord']=='All'?$this->relateQuestionAll():$this->relateQuestion('193',$params['keyWord']);

    }
    public function getData()
    {
        // TODO: Implement getData() method.
        return $this->list;
    }
    public function relateQuestionAll()
    {
        $detailPageObj=new detailPageContent();
        return $detailPageObj->relateQuestionAll();
    }
    //
    public function relateQuestion($categoryParentId,$keyWord)
    {
        $sql="select id from bycms_category where pid=$categoryParentId and description like %$keyWord%";
        $sqlRuslt=Db::query($sql);
        if(!$sqlRuslt)
            return null;
        $categoryId=array_column($sqlRuslt,'id');
        //key:getCategoryQuestionListById
        $list=$this->redis->handler()->get('getCategoryQuestionListByName:'.$keyWord);
        if($list)
        {
            return json_decode($list,true);
        }else
        {
            $map['category_id']=array('in',$categoryId);
            $list=Db::name('document')->where($map)->order("id desc")->field('id,title,category_id,view,create_time')->limit(5)->select();
            $this->redis->handler()->setEx('getCategoryQuestionListByName:'.$keyWord,300,json_encode($list));
            return $list;
        }

    }
    //hotQuestion
    public function hotQuestion()
    {
        $Category=new \app\index\model\Category;
        $categoryId=$Category->getCategoryIdByName('大麦问答','189')['id'];
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


}
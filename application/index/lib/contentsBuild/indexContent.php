<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/6 0006
 * Time: 下午 2:32
 */
namespace app\index\lib\contentsBuild;
use think\cache\driver\Redis;
use think\Db;
class indexContent implements contentInterface{
    protected $list;
    public function joinData($tree)
    {
        //找出大麦的新闻分类和内容（）
        $damaiList=$tree['item'];//大麦的所有新闻
        // TODO: Implement joinData() method.
        $this->list['topNew']=$this->getTopNew($damaiList);
        $this->list['topNewList']=$this->getTopNewList($damaiList);
        //行业资讯
        $this->list['industry']=$this->industryNew($tree['_'],'行业资讯');
        //行业资讯标签
        $this->list['industryLabel']=$this->showCategoryLabel('191');
        //知识百科
        $this->list['knowledgebase']=$this->industryNew($tree['_'],'知识百科');
        //知识百科标签
        $this->list['knowledgebaseLabel']=$this->showCategoryLabel('190');
        //大麦问答
        $this->list['question']=$this->industryNew($tree['_'],'大麦问答');
        $this->list['questionLabel']=$this->showCategoryLabel('193');
        //首页轮播
        $this->list['showCarousel']=$this->showCarousel();
        return $this;
    }
    public function getData()
    {
        // TODO: Implement getData() method.
        return $this->list;
    }
/*    //获取大分类列表
    protected function getCatagoryByWords($tree,$words)
    {
        foreach ($tree as $key=>$value)
        {
            if($value['title']==$words)
            {
                $damaiTotal=$value;
            }
        }
        return $damaiTotal;
    }*/
    //头条新闻
    protected function getTopNew($params)
    {
        foreach ($params as $key=>$value)
        {
            if($value['position']=='9999')
            {
                return $value;
            }
        }
        return null;
    }
    //头条新闻列表
    protected function getTopNewList($params)
    {
        $addtime=[];
         foreach ($params as $key=>$value)
         {
             $addtime[$key]=$value['create_time'];
         }
         array_multisort($addtime,SORT_DESC,$params);
         return array_slice($params,0,9);
    }
    //行业资讯/知识百科
    protected function industryNew($params,$type)
    {
        $categoryId=getCategoryInfoByWords($params,$type)['id'];
        $Category=new \app\admin\model\Category;
        $cate_ids  = $Category->getChildrenId($categoryId);
        $map["category_id"]=array("in",$cate_ids);
        $res=getLists('Document',$map,12,'id desc',"");
        $list=call_user_func_array(function ($_list){
           $newList=[];
           $picObj= new \app\common\model\Picture();
           $i=0;
            foreach ($_list as $key=>$value)
            {
                   if($i==0 || $i==1)
                    {
                        $value['pic']=$picObj->getPicPath($value['cover_id'])['path'];
                        $value['description']=explode(',',$value['description'])[0];
                    }
                    $value['create_time']=date('Y-m-d',$value['create_time']);
                    $newList[]=$value;
                    $i++;
            }
            return $newList;
        },array($res['list']));
        return $list;
    }
    //标签展示
    protected function showCategoryLabel($parentCategoryId)
    {
        $keyWordsObj = new \app\index\lib\keyWordLabel\keyWordsInterFace();
        return  $keyWordsObj->getCategoryLabel($parentCategoryId);

    }
    //获取广告
    protected function showCarousel()
    {
        $redis=new Redis();
        $list=$redis->handler()->get('getShowCarousel');
        if($list)
        {
            return json_decode($list,true);
        }else
        {
            $sql="select * from bycms_ad where title='首页公告' order by place DESC ";
            $list=Db::query($sql);
            $redis->handler()->setEx('getShowCarousel',100,json_encode($list));
            return $list;
        }
    }
}
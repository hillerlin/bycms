<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/8 0008
 * Time: 下午 3:08
 */
namespace app\index\controller;
use app\index\model\Document;
use think\Controller;
use think\Db;
use app\index\lib\contentsBuild\contentsRender;
use app\index\lib\contentsBuild\detailPageContent;
use think\exception\ErrorException;
use xunsearch;
use app\index\lib\xunsearchLib\xunsearchDecorator;
class Baike extends Home{

    //百科列表
    public function lists()
    {
        $Category=new \app\index\model\Category;
        if($_POST)
        {
            try {
                $keyword = input('keyword');
                $_list = $Category->getCategoryInfoByKeyword($keyword);
                $list['statusCode'] = 0;
                $list['list'] = $_list;
                return json($list);
            }
            catch (ErrorException $e)
            {
                return json(['statusCode'=>'1','message'=>$e->getMessage()]);
            }

        }
        $info= Db::name('Category')->where(['id'=>190])->find();
        $info['seo_keywords']=$info['title'];
        $info['seo_title']=$info['title'];
        $info['seo_description']=$info['description'];
        $this->assign('info',$info);
        $Document=new \app\admin\model\Document;
        $cid=$Category->getChildrenId(190);
        $meta_title='知识百科';
        $this->assign('meta_title', $meta_title);
        $categoryList=$Category->getCategoryInfoByIds($cid);
        $list=call_user_func_array(function ($list){
            foreach ($list as $k=>$v)
            {
                if($v['id']==190)
                {
                    $res['info']=$v;
                }else
                {
                    $res['list'][]=$v;
                }

            }
            return $res;
        },[$categoryList]);
        $list['hotNews']=$Document->getHotNews();
        $list['hotLabel']=getHotLabel();
        $this->assign('list',$list);
        $tpl="model/baike_list";
        return $this->fetch($tpl);
    }
    //百科详情
    public function detail()
    {
        $Document=new \app\admin\model\Document;
        $Category=new \app\index\model\Category;
        $categoryId=input('categoryId');
        //获取文章广告
        $adList=$Document->getDocumentAd('文章内页');
        $this->assign('adList', $adList[0]);

        $info=$Category->getCategoryInfoById($categoryId);
        $info['seo_keywords']=$info['title'];
        $info['seo_title']=$info['title'];
        $info['seo_description']=$info['description'];
        $this->assign('info',$info);
        $meta_title=$info["title"];
        $this->assign('meta_title', $meta_title);
        $pid=$Category->getParentId($info["id"]);
        $pid=array_merge($pid,[$info["id"]]);
        $this->assign("pid",$pid);
        $contentsObj=new contentsRender();
        $params=['category_title'=>$info['title']];
        $list=$contentsObj->render(new detailPageContent(),$params);
        $list['list']=$Document->getListByCategoryId($categoryId);
        $list['info']=$info;
        $list['hotLabel']=getHotLabel();
        $tpl='model/baike_detail';
        $this->assign('list',$list);
        return $this->fetch($tpl);


    }

}
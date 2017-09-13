<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/10 0010
 * Time: 下午 9:28
 */
namespace app\index\controller;
use app\index\lib\contentsBuild\questionContent;
use app\index\model\Document;
use think\Controller;
use think\Db;
use app\index\lib\contentsBuild\contentsRender;
use app\index\lib\contentsBuild\detailPageContent;
use think\exception\ErrorException;
use xunsearch;
use app\index\lib\xunsearchLib\xunsearchDecorator;
class Question extends Home{
    public function lists()
    {
        $Category=new \app\index\model\Category;
        $id=input('id','193');
        $contentsObj=new contentsRender();
        $cid=$Category->getChildrenId($id);
        $map['category_id']=array("in",$cid);
        if($_POST)
        {
            try{
                $page=input('page','0');
                $num=10;
                $pageNum=$page>1?($page-1)*$num:0;
                $res=getLists('document',$map,$num,'id desc',"",$pageNum);
                $res['statusCode'] = 0;
                foreach ($res['list'] as $key=>&$value)
                {
                    $value['category_title']=get_category_title($value['category_id']);
                }
                return json($res);
            }catch (ErrorException $e){
                return json(['statusCode'=>'1','message'=>$e->getMessage()]);
            }

        }
        $info= $Category->getCategoryIdByName('大麦问答','189');
        $id=$info['id'];
        if(!$info){
            $this->error('分类不存在！');
        }
        $params=['keyWord'=>'all'];
        $list=$contentsObj->render(new questionContent(),$params);
        $ids=$Category->getParentId($id);
        $num=$info["list_row"]?$info["list_row"]:10;
        $res=getLists('document',$map,$num,'id desc',"");
        $this->assign('res', $res);


        $Document=new \app\admin\model\Document;
        $list['labelAll']=getCategoryRelaLabel(intval($id));
        $list['hotNews']=$Document->getHotNews();
        $list['hotLabel']=getHotLabel();
        $this->assign("list",$list);
        $ids=array_merge($ids,[$id]);
        $this->assign('cid',$cid);
        $this->assign("ids",$ids);
        //网站标题
        $meta_title=$info["title"];
        $this->assign('meta_title', $meta_title);
        $this->assign("info",$info);
        $tpl="model/qa_list";
        return $this->fetch($tpl);
    }
    //详情
    public function detail()
    {
        $id=input('id');
        if(!($id && is_numeric($id))){
            $this->error('分类ID错误！');
        }else{
            $where["id"]=$id;
        }
        $Document=new \app\admin\model\Document;
        $info=$Document->getInfo($id);
        if(!$info){
            $this->error('文章不存在！');
        }
        //添加标签点击量
        if($info['description'])
        {
            $keyWordsObj=new \app\index\lib\keyWordLabel\keyWordsInterFace();
            $keyWordsObj->addClick($info['description'],$info['view'],$info['category_id']);
        }
        $Document->addClick($id);//更新数据库点击量+1
        //$info["pictures"]=get_pictures($id);

        $Category=new \app\index\model\Category;
        $pid=$Category->getParentId($info["category_id"]);
        //数据合成
        $contentsObj=new contentsRender();
        $list=$contentsObj->render(new questionContent(),$info);
        $list['hotNews']=$Document->getHotNews();
        $list['hotLabel']=getHotLabel();
        $list['labelAll']=getCategoryRelaLabel(intval($info['category_id']));
        $this->assign("list",$list);

        $pid=array_merge($pid,[$info["category_id"]]);
        $this->assign("pid",$pid);
/*        //获取文章广告
        $adList=$Document->getDocumentAd('文章内页');
        $this->assign('adList', $adList[0]);*/
        $meta_title=$info["title"];
        $this->assign('meta_title', $meta_title);
        $this->assign("info",$info);
        $tpl="model/qa_detail";

        return $this->fetch($tpl);

    }

}
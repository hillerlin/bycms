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
use xunsearch;
use app\index\lib\xunsearchLib\xunsearchDecorator;
class Question extends Home{
    public function lists()
    {
        $Category=new \app\index\model\Category;
        $info= $Category->getCategoryIdByName('大麦问答','189');
        $id=$info['id'];
        if(!$info){
            $this->error('分类不存在！');
        }
        $ids=$Category->getParentId($id);
        $cid=$Category->getChildrenId($id);
        $map['category_id']=array("in",$cid);
        $num=$info["list_row"]?$info["list_row"]:10;
        $res=getLists('document',$map,$num,'id desc',"");
        $this->assign('res', $res);
        $contentsObj=new contentsRender();
        $_POST?$params=['keyword'=>$_POST['keyword']]:$params=['keyword'=>'all'];
        $list=$contentsObj->render(new questionContent(),$params);
        if($_POST)
        {
            return json(['list'=>$list,'res'=>$res]);
        }
        $Document=new \app\admin\model\Document;
        $list['labelAll']=getCategoryRelaLabel(intval($id));
        $list['hotNews']=$Document->getHotNews();
        $list['hotLabel']=getHotLabel();
        $this->assign("list",$list);
        $ids=array_merge($ids,[$id]);
        $this->assign("ids",$ids);
        //网站标题
        $meta_title=$info["title"];
        $this->assign('meta_title', $meta_title);
        $this->assign("info",$info);
        $tpl="model/qa_list";
        return $this->fetch($tpl);
    }
}
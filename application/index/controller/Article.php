<?php
namespace app\index\controller;
use app\index\model\Document;
use think\Controller;
use think\Db;
use app\index\lib\contentsBuild\contentsRender;
use app\index\lib\contentsBuild\detailPageContent;
use xunsearch;
use app\index\lib\xunsearchLib\xunsearchDecorator;
class Article  extends Home{
	//文章列表
	public function lists($id=""){     
		$id=input('id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('分类ID错误！');
		}else{
		   $where["id"]=$id;
		}	
		$info= Db::name('Category')->where($where)->find();
		if(!$info){
		    $this->error('分类不存在！');
		}
		$page=input('page','0');
		$Category=new \app\index\model\Category;
        $ids=$Category->getParentId($id);
		$cid=$Category->getChildrenId($id);
		$map['category_id']=array("in",$cid);
		$num=$info["list_row"]?$info["list_row"]:10;
		$pageNum=$page>1?($page-1)*$num:0;
        $res=getLists('document',$map,$num,'id desc',"",$pageNum);
        if($_POST)
        {
            $res['statusCode'] = 0;
            try{
                foreach ($res['list'] as $key=>&$value)
                {
                    $value['pic']=get_cover($value['cover_id']);
                }
                return json($res);

            }catch (Exception $e){
                return json(['statusCode'=>1,'message'=>$e->getMessage()]);
            }

        }
	    $this->assign('res', $res);
        $contentsObj=new contentsRender();
        count($ids)=='1'|| count($ids)=='0'?$params=['category_id'=>$id,'category_title'=>'All']:$params=['category_id'=>$id,'category_title'=>$info['title']];//如果是顶级分类，问答就取知识百科所有的
        $list=$contentsObj->render(new detailPageContent(),$params);
        $Document=new \app\admin\model\Document;
        $list['hotNews']=$Document->getHotNews();
        $list['hotLabel']=getHotLabel();
        $list['labelAll']=getCategoryRelaLabel(intval($id));
        $this->assign("list",$list);
		$ids=array_merge($ids,[$id]);
		$this->assign("ids",$ids);
	   //网站标题
		$meta_title=$info["title"];  
		$this->assign('meta_title', $meta_title);
		$info['seo_keywords']=$info['title'];
		$info['seo_title']=$info['title'];
		$info['seo_description']=$info['description'];
		$this->assign("info",$info);
		//列表页模板
		$name=get_models($info['model_id'],'name');
		$tpl="model/".$name."_list";
		$tpl=$info["template_lists"]?$info["template_lists"]:$tpl;
		
		return $this->fetch($tpl);
	}

		//文章明细
	public function detail($id=""){    
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
		$info["pictures"]=get_pictures($id);

		$Category=new \app\index\model\Category;
        $pid=$Category->getParentId($info["category_id"]);
        //$info['parentId']=$pid[0];
        //数据合成
        $contentsObj=new contentsRender();
        $list=$contentsObj->render(new detailPageContent(),$info);
        $list['hotNews']=$Document->getHotNews();
        $list['hotLabel']=getHotLabel();
        $this->assign("list",$list);

        $pid=array_merge($pid,[$info["category_id"]]);
		$this->assign("pid",$pid);	
		//获取文章广告
        $adList=$Document->getDocumentAd('文章内页');
        $this->assign('adList', $adList[0]);
		$meta_title=$info["title"];  
		$this->assign('meta_title', $meta_title);
		$this->assign("info",$info);
		$tpl="model/document_detail";
		return $this->fetch($tpl);
	}

		//文章搜素
	public function search($keyword=""){     
		$keyword=safe_replace(input('keyword')); 	
        $map['title']  = array('like','%'.$keyword.'%');
        $res=getLists('document',$map,10,'id desc',"");
	    $this->assign('res', $res);
		$meta_title=$keyword;  
		$this->assign('meta_title', $meta_title);
		$id=input('model_id'); 	
        if(!($id && is_numeric($id))){
		   $this->error('ID错误！');
		}
		$name=get_models($id,'name');
		if(!$name){
		   $this->error('ID错误！');
		}
		$tpl="model/".$name."_search";
		return $this->fetch($tpl);
	}

	//标签列表
    public function labellist($keyword="")
    {
        $_keyword=input('keyword',$keyword);
        $page=input('page',0);
        $limit=10;
        $pageNum=$page>1?$limit*$page:0;
        $xunsearchObj = new xunsearchDecorator(xunsearch\SoClass::getInstance());
        $listTotal=$xunsearchObj->query($_keyword,10,$pageNum);
        $idAttr=array_column($listTotal['data'],'pid');
        $ids=implode(',',array_map('change_to_quotes',$idAttr));
        $document=new Document();
        $Document=new \app\admin\model\Document;
        $list=$document->getByIds($ids);
        //$list=$document->getByIds("251,250");
        if($_POST){
            return json($list);
        }else
        {
            $meta_title=$keyword;
            $this->assign('meta_title', $meta_title);
            $tpl='model/mark_list';
            $list['keyword']=$_keyword;
            $list['hotNews']=$Document->getHotNews();
            $list['hotLabel']=getHotLabel();
            $this->assign('list',$list);
            return $this->fetch($tpl);
        }

    }
	
}
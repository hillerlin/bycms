<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use think\cache\driver\Redis;
/**
 * 分类模型
 */
class Document extends Model{
  
     protected $auto = ["create_time","update_time","uid"];
     protected $insert = ["create_time","update_time","uid"];  
     protected $update = ["create_time","update_time","uid"];  
     protected function setCreateTimeAttr(){
		   $create_time  = input('create_time');
		   return $create_time?strtotime($create_time):time();
		
    }
	protected function setUidAttr(){
		return is_login();
    }
    protected function setUpdateTimeAttr(){
		
		   $update_time  = input('update_time');
		   return $update_time?strtotime($update_time):time();
		
    }
    /**
     * 获取详情页数据
     * @param  integer $id 文档ID
     * @return array       详细数据
     */
    public function getInfo($id){
        /* 获取基础数据 */
	
		$map["id"]=$id;
		$sql="select d.*,c.title as category_title from bycms_document as d left join bycms_category as c on c.id=d.category_id where d.id=$id limit 1";
        $info =Db::query($sql)[0];
        if(!(is_array($info) || 1 !== $info['status'])){
            $this->error('文档被禁用或已删除！');
            //return false;
        }	
		
        /* 获取模型数据 */
		$name  =get_models($info["model_id"],'name');
		$merge=Db::name($name)->find($id);
        if($merge){
			$info = array_merge($info, $merge);
		}
        return $info;
    }

    /**
     * 新增或更新一个文档
     */
    public function updatePost($id = null){
  
        /* 添加或新增扩展内容 */
        $class = $this->getClass($_POST['model_id']);
        if ($id) {//新增数据
            $_POST['id'] = $id;
            $id =$class->allowField(true)->save($_POST);
            if (!$id) {
				 $map["id"]=$id;
				 Db::name("Document")->delete($id);
                 $this->error = '新增数据失败！';
                // return false;
            }
        } else { //更新数据
            $status = $class->allowField(true)->save($_POST,['id' =>$_POST['id']]);
            if (false === $status) {
                $this->error = '更新数据失败！';
                return false;
            }
        }
        return true;
		
    }

    /**
     * 获取扩展模型对象
     * @param  integer $model 模型编号
     * @return object         模型对象
     */
    private function getClass($id){
        $name  =get_models($id,'name');
		$class=substr($name,0,1);
		$name=strtoupper($class).substr($name,1);
        $class =  'app\admin\model\\' . $name;
        return new $class;
    }

    public function getError(){
       
        return $this->error;
    }
    //点击+1
    public function addClick($id)
    {
        Db::name('document')->where('id',$id)->setInc('view');
    }
    //获取文章广告
    public function getDocumentAd($words)
    {
        $redis= new Redis();
        //key:documentAd
        $contents=$redis->handler()->get('documentAd');
        if($contents)
        {
            return json_decode($contents,true);
        }
        else
        {
            $sql="select p.path,a.url from bycms_ad as a left join bycms_picture as p on a.cover_id=p.id where a.title='文章内页' limit 1 ";
            $list=Db::query($sql);
            if($list)
            {
                $redis->handler()->setNx('documentAd',json_encode($list));
                return $list;
            }

        }
    }
    //获取热门文章
    public function getHotNews()
    {
        return Db::name( 'Document' )->limit(7)->field('id,title,seo_description')->order("view desc")->select();
    }
    //获取分类id获取文章列表
    public function getListByCategoryId($categoryId)
    {
        return Db::name('Document')->where(['category_id'=>$categoryId])->find();
    }
}

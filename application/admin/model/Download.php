<?php
namespace app\admin\model;
use think\Model;
use think\Db;
/**
 * 文档模型子模型 - 相册模型
 */
class Download extends Model{
   

	  public function updatePost($id = 0) {
        /* 获取数据 */
      
        if ($_POST === false) {
            return false;
        }
        if (empty($_POST['id'])) {//新增数据
            $_POST['id'] = $id;
            $id = Db::name('Download')->insertGetId($_POST);
            if (!$id) {
                $this->error = '新增数据失败！';
                return false;
            }
        } else { //更新数据
			$map["id"]=$id;
            $status = Db::name('Download')->where($map)->update($_POST);
            if (false === $status) {
                $this->error = '更新数据失败！';
                return false;
            }
        }
        return true;
    }

}

<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/5 0005
 * Time: 下午 12:23
 */
namespace app\index\lib\xunsearchLib;
class xunsearchDecorator extends xunsearchInterface{
    public function add($params)
   {
       // TODO: Implement add() method.
       $data = array(
           'pid' =>$params['id'], // 此字段为主键，必须指定
           'message' => $params['description'],
           'chrono' => time()
       );
       $this->_xunsearchObj->add($data);//添加文档
       $this->_xunsearchObj->addLogSearch($params['title']);
   }
   public function updata($params)
   {
       // TODO: Implement updata() method.
       $data = array(
           'pid' =>$params['id'], // 此字段为主键，必须指定
           'message' => $params['description'],
           'chrono' => time()
       );
       $this->_xunsearchObj->add($data,'1');//更新文档
       $this->_xunsearchObj->addLogSearch($params['title']);
   }
}

<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;

/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class File extends Admin {

    /* 文件上传 */
    public function upload(){
		$return  = array('status' => 1, 'info' => '上传成功', 'data' => '');
		/* 调用文件上传组件上传文件 */
		$File = D('File');
		$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
		$info = $File->upload(
			$_FILES,
			C('DOWNLOAD_UPLOAD'),
			C('DOWNLOAD_UPLOAD_DRIVER'),
			C("UPLOAD_{$file_driver}_CONFIG")
		);

        /* 记录附件信息 */
        if($info){
            $return['data'] = think_encrypt(json_encode($info['download']));
            $return['info'] = $info['download']['name'];
        } else {
            $return['status'] = 0;
            $return['info']   = $File->getError();
        }

        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

    /* 下载文件 */
    public function download($id = null){
        if(empty($id) || !is_numeric($id)){
            $this->error('参数错误！');
        }

        $logic = D('Download', 'Logic');
        if(!$logic->download($id)){
            $this->error($logic->getError());
        }

    }
public function upload2(){
    // 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('image');
    // 移动到框架应用根目录/public/uploads/ 目录下
    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
    if($info){
        // 成功上传后 获取上传信息
        // 输出 jpg
        echo $info->getExtension();
        // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
        echo $info->getSaveName();
        // 输出 42a79759f284b767dfcb2a0197904287.jpg
        echo $info->getFilename(); 
    }else{
        // 上传失败获取错误信息
        echo $file->getError();
    }
}
   public function uploadpicture(){
       
        /* 调用文件上传组件上传文件 */
		 $Picture= new \app\admin\model\Picture;
         $driver = config('PICTURE_UPLOAD_DRIVER');
         $info = $Picture->upload(
            $_FILES,
            config('PICTURE_UPLOAD'),
            config('PICTURE_UPLOAD_DRIVER'),
            config("UPLOAD_{$driver}_CONFIG")
        ); //TODO:上传到远程服务器
        //addUserLog(var_export($info,true),1);
        /* 记录图片信息 */
        if($info){
            $return["path"]=$info["path"];
			$return['status'] = 1;
			$return['id'] = $info["id"];
           
        } else {
            $return['status'] = 0;
            $return['info']   = "上传失败";
        }
        /* 返回JSON数据 */
        exit(json_encode($return));
    }
}

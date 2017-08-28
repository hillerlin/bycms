<?php
// +----------------------------------------------------------------------
// | 贝云cms内容管理系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\api\controller;
use think\Controller;
use think\Db;

/**
 * 用户控制器
 * 包括用户中心，用户登录及注册
 */
class User extends Home {

	/* 注册页面 */
	public function register($username, $password){
		
          $User=new \app\api\model\User;
          $uid=$User->register($username, $password);
		  if($uid){
		      $data['id']=$uid;
		      $res["user"]=Db::name('UcenterMember')->where($data)->find();
			  $res["code"]=1;
			  $res["user"]["imageurl"]="http://cms.yershop.com/uploads/Picture/2017-07-29/header.jpg";
		  }else{
		      $res["msg"]=session("error");
		      $res["code"]=0;
		  }
		  addUserLog(var_export($res,true),1);
		 echo json_encode($res);
	}

	/* 登录页面 */
	public function login($username = "", $password = ""){
		
		if($_POST){ //登录验证
           $User=new \app\api\model\User;
           $user=$User->login($username,$password);
		   if($user){
			  $res["user"]=$user;
			  $res["code"]=1;  
			  $res["user"]["imageurl"]="http://cms.yershop.com/uploads/Picture/2017-07-29/header.jpg";
		  }else{
		      $res["msg"]=$User->getErrorMsg();
		      $res["code"]=0;
		  }  addUserLog(var_export($res,true),1);
		echo json_encode($res);
		}
	}

   
 
}

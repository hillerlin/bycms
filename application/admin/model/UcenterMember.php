<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: zhuyajie <xcoolcc@gmail.com>
// +----------------------------------------------------------------------
namespace app\admin\model;
use think\Model;
use think\Db;
class UcenterMember extends Model{
    
  


    public function login($uid){
        /* 检测是否在当前应用注册 */
		$map['id'] = $uid;
        $user =Db::name("ucenterMember")->where($map)->find();
        /* 登录用户 */
        $this->autoLogin($user);
 
     
        return true;
    }

    /**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        session("user_auth", null);
       
        session("user_auth_sign", null);
		cookie('password',null);
		cookie('username',null);

    }

 

    /**
     * 自动登录用户
     * @param  integer $user 用户信息数组
     */
    private function autoLogin($user){
        /* 更新登录信息 */
        $data = array(
            
           
            "last_login_time" => time(),
            "last_login_ip"   =>0,
        );
		 $map['id'] = $user["id"];
         Db::name("ucenterMember")->where($map)->update($data);

        /* 记录登录SESSION和COOKIES */
        $auth = array(
            "uid"             => $user["id"],
            "username"        =>$user["username"],
            "last_login_time" => $data["last_login_time"],
        );
        session("user_auth", $auth);
        session("uid", $auth["uid"]);
        session("user_auth_sign", data_auth_sign($auth));

    }
}

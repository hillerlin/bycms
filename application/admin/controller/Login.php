<?php
// +----------------------------------------------------------------------
// | Yershop 开源网店系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuwei <1010422715@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Login extends Controller {

/* 登录页面 */
	public function index($username = "", $password = "", $verify = "",$type=1){
		  $key=config('database.key');
		if($_POST){ //登录验证
            $username =safe_replace($username);//过滤
			$map = array();
		switch ($type) {
			case 1:
				$map['username'] = $username;
				break;
			case 2:
				$map['email'] = $username;
				break;
			case 3:
				$map['mobile'] = $username;
				break;
			case 4:
				$map['id'] = $username;
				break;
			default:
				return 0; //参数错误
		}
	 
       $map["password"]=ucenter_md5($password, $key);
		/* 获取用户数据 */
		$user =Db::name('UcenterMember')->where($map)->find();
		if($user){
			$uid = $user["id"];
            if(0 < $uid){ //UC登录成功
				/* 登录用户 */
				$Member=new \app\admin\model\UcenterMember;
				if($Member->login($uid)){ //登录用户
					//TODO:跳转到登录前页面            
					 $url= url('index/index');
				     $data['url']=$url;
                     $data['status']=1;
				    return $data;
			       
				
				} else {
					$this->error("密码或账号错误");
				}
			  }

			} else { //登录失败
				$this->error("密码或账号错误");
			}

		} else {  	
		      $meta_title = '会员登录';	
			 
			 //显示登录表单
			  return $this->fetch("index/login");
		}
	}
    /* 退出登录 */
    public function logout(){
        if(is_login()){
           $Member=new \app\admin\model\Member;
		   $Member->logout();
            session('[destroy]');
            $this->success('退出成功！', U('index'));
        } else {
            $this->redirect('login');
        }
    }

    public function verify(){
        $verify = new \Think\Verify();
        $verify->entry(1);
    }

}

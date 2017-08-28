<?php
// +----------------------------------------------------------------------
// | 贝云cms内容管理系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.yershop.com All rights reserved.
// +----------------------------------------------------------------------
namespace app\api\model;
use think\Model;
use think\Db;
/**
 * 文档基础模型
 */
class User extends Model{

  public function register($username = "", $password = "", $repassword = "", $email = "",$mobile="", $verify = ""){
        
		
		$username =safe_replace($username);//过滤
        if(!$username){
             session("error","用户不能为空！");
			  return false;
        }
		if(!$password){
             session("error","密码不能为空！");
			 return false;
        }
		if($verify){
		    if(!check_verify($verify)){
		       session("error","验证码不正确！"); 
		    }
		}
	    //注册用户
		$data['username']=$username;
		$res =Db::name('UcenterMember')->where($data)->select();
		if($res){
			session("error","用户已存在！");
			return false;
		}
		if(!$this->CheckLen($username)){
			 session("error","用户名大小写字母跟数字组成并且长度在3-16字符！");
			 return false;
		}
		$key=config('database.key');
		$data['password']=ucenter_md5($password,$key);
		if($email){
		    if(!$this->CheckEmail($email)){
		       session("error","邮箱格式不正确！"); 
		    }else{
			   $data['email']=safe_replace($email);//过滤
			}
		}
		if($mobile){
		    if(!$this->CheckMobile($mobile)){
		         session("error","手机格式不正确！"); 
		    }else{
			   $data['mobile']=safe_replace($mobile);//过滤
			}
		}
	    $uid=Db::name('UcenterMember')->insertGetId($data);
        if($uid){
		   return $uid;
		}
    }
    public function CheckLen($str){    
		 $RegExp="/^[a-zA-Z0-9_]{3,16}$/"; //由大小写字母跟数字组成并且长度在3-16字符直接 
          return preg_match($RegExp,$str)?true:false; 
		    
	}    
        /**
    * 验证邮箱是否正确
    * @author 
    * @param INT $mobile
    */
    function CheckEmail($email) {
        $pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
        return preg_match($pattern, $email) ? true : false;
    }
	/**
    * 验证手机号是否正确
    * @author 范鸿飞
    * @param INT $mobile
    */
    function CheckMobile($mobile) {
        if (!is_numeric($mobile)) {
            return false;
        }
        return preg_match('#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#', $mobile) ? true : false;
    }
    /**
     * 登录指定用户
     * @param  integer $uid 用户ID
     * @return boolean      ture-登录成功，false-登录失败
     */
   public function login($username,$password){
        $username =safe_replace($username);//过滤
        if(!$username){
             session("error","用户名不能为空！");
			  return false;
        }
		if(!$password){
             session("error","密码不能为空！");
			 return false;
        }
		$key=config('database.key');
		if($this->CheckEmail($username)){
		   $map['email'] = $username;
		}
		else if($this->CheckMobile($username)){
		   $map['mobile'] = $username;
		}
		else{
		   $map['username'] = $username;
		}
        
		/* 获取用户数据 */
		$user =Db::name('UcenterMember')->where($map)->find();
		if(!$user){
		   session("error","用户名不存在！");
		   return false;
		}
		$map["password"]=ucenter_md5($password, $key);
		$user =Db::name('UcenterMember')->where($map)->find();
		if(!$user){
		   session("error","密码错误！");
		   return false;
		}
		return $user;
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
		$map['id'] = $user["uid"];
        Db::name("ucenterMember")->where($map)->update($data);

        /* 记录登录SESSION和COOKIES */
        $auth = array(
            "uid"             => $user["uid"],
            "username"        => get_username($user["uid"]),
            "last_login_time" => $data["last_login_time"],
        );
        session("user_auth", $auth);
        session("uid", $auth["uid"]);
        session("user_auth_sign", data_auth_sign($auth));

    }
    /**
     * 返回模型的错误信息
     * @access public
     * @return string|array
     */
    public function getErrorMsg()
    {
        return session("error");
    }     
}

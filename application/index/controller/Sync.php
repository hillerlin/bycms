<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CANmodelO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Session;
use think\ThinkOauth;
//登录地址
class Sync extends Home{
     /* ajax销售记录-所有记录 */
   public function index(){
        $type=input('type');
        empty($type) && $this->error('参数错误');
        //加载ThinkOauth类并实例化一个对象
        $sns  = \think\ThinkOauth::getInstance($type);
        //跳转到授权页面
        $this->redirect($sns->getRequestCodeURL());
    }

    //登陆后回调地址
    public function callback(){
        $code = input('code');
        $type= input('type');
        $sns  = \ThinkOauth::getInstance($type);

        //腾讯微博需传递的额外参数
        $extend = null;
        if($type == 'tencent'){
            $extend = array('openid' =>input('openid'), 'openkey' =>input('openkey'));
        }

        $token = $sns->getAccessToken($code , $extend);
        $user_info =model('SyncLogin')->$type($token); //获取传递回来的用户信息
        $condition = array(
            'openid' => $token['openid'],
            'type' => $type,
            'status' => 1,
        );
        $sync =model('sync_login')->where($condition)->find(); // 根据openid等参数查找同步登录表中的用户信息
        if($sync) {//曾经绑定过
            $info =model('UcenterMember')->find($sync['uid']); 
			//根据UID查找Ucenter中是否有此用户
            if($info){
                $syncdata ['access_token'] = $token['access_token'];
                $syncdata ['refresh_token'] = $token['refresh_token'];
               model('sync_login')->where( array('uid' =>$info ['id'] ) )->save($syncdata); //更新Token
                $Member=model('Member');                   
                if( $Member->login($info['id']) ){    
                    $this->redirect(url('Index/index'));
					
                }
				else{
                    $this->error($Member->getError());
                }
            }
			else{
                $condition = array(
                    'openid' => $token['openid'],
                    'type' => $type
                );
               model('sync_login')->where($condition)->delete();
            }
        } else { //没绑定过，去注册
            //$this->assign ( 'user', $user_info );
            //$this->assign ( 'token', $token );
           // $this->display(T('Addons://SyncLogin@./default/reg'));
            $User = new UserApi;
			$username=$user_info['name']."_".$user_info['nick'];
			$password=time();
			$email="xxxxx@qq.com";
			$uid = $User->register($username, $password, $email);
           if(0 < $uid){
				//TODO: 发送验证邮件
			  $data['uid'] = $uid;
              $data['openid'] = $token['openid'];
              $data['type'] = $type;
              $data['access_token'] = $token['access_token'];
              M('sync_login')->add($data);
				 /* 登录用户 */
				$Member =model('Member');
				if($Member->login($uid)){ //登录用户
					//TODO:跳转到登录前页面
					$this->success('登录成功！',url('Index/index'));
				}
			} else { //注册失败，显示错误信息
				//$this->error($this->showRegError($uid));
				//echo $uid.$token['access_token'];
			}

        }
    }
}

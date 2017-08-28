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
use think\Request;
class Admin extends Controller{  
    protected function _initialize(){
	    if( !is_login()){// 还没登录 跳转到登录页面
            $this->redirect('login/index');
        } 
	    $this->uid=is_login();
		$this->assign('INSTALL_PATH', INSTALL_PATH);
		 // 检测访问权限
        $access=$this->accessControl();
		$module=Request::instance()->module();
		$controller=Request::instance()->controller();
		$action=Request::instance()->action();
		$url=$controller."/".$action;
		$url=strtolower($controller."/".$action);
	
		//echo $url;
        if ( $access === false ) {
            $this->error('403:禁止访问');
        }else if( $access === null ){
            $dynamic=$this->checkDynamic();//检测分类栏目有关的各项动态权限
            if( $dynamic === null ){
                //检测非动态权限
				 
		          $rule=strtolower($controller."/".$action);
				  $res=$this->checkRule($rule,array('in','1,2'));
                if(!$res){
                    $this->error('未授权访问');
                }
            }elseif( $dynamic === false ){
                $this->error('未授权访问!');
            }
        }
        
		$condition["url"]=$url;
		//$condition['id']=$module_id;
		$info=Db::name('Module')->where($condition)->field("url,id,pid,group_id")->find();
		$id=$info["id"];
		if($info["pid"]){
		    $condition2["id"]=$info["pid"];
		    $info=Db::name('Module')->where($condition2)->field("url,id,group_id")->find();
		}
		
		$group_id=$info["group_id"];
		$ids=getModuleParent($id);
	
		if(count($ids)>1){
			$module_id=$ids[0];
		}else{
			$module_id=$id;//分组id
			
		}
		
        $where['id']=$module_id;
		$now=Db::name('Module')->where($where)->field("id,title,pid,font")->find();
		$this->assign('now', $now); 
		
        $map['pid']=0;
		$group_id=$group_id?$group_id:1;
		
		if(C('ISDES')){
          $map['group_id']=$group_id;
		  $group=Db::name('group')->order('sort asc')->select();
		  $this->assign('group', $group);
		}
        $side=Db::name('Module')->where($map)->order('sort desc')->field("id,title,pid,font")->select();
        foreach( $side as $n=> $val ){
				$map2["pid"]=$val['id'];
			    $side[$n]['sid']=Db::name('Module')->where($map2)->field("id,title,pid,font")->order('sort desc')->select( );
		};
		$this->assign('side',$side); 
		
       // 查找菜单
	}
	    /**
     * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
     *
     * @return boolean|null  返回值必须使用 `===` 进行判断
     *
     *   返回 **false**, 不允许任何人访问(超管除外)
     *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
     *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final protected function accessControl(){
        $IS_ROOT= $this->get_administrator();
		
		if($IS_ROOT){
            return true;//管理员允许访问任何页面
        }
     
        return null;//需要检测节点权限
    }
    protected function checkDynamic(){
        $IS_ROOT= $this->get_administrator();
		if($IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        return null;//不明,需checkRule
    }
	function get_administrator($uid = null){
       $uid =is_login();
	   if($uid==config('USER_ADMINISTRATOR')){
		    return $uid;
	   }
    }
    final protected function checkRule($rule, $type=AuthRule::RULE_URL, $mode='url'){
        $IS_ROOT= $this->get_administrator();
		if($IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        static $Auth    =   null;
        if (!$Auth) {
            $Auth       =   new \think\Auth();
        }
		$uid=is_login();
        if(!$Auth->check($rule,$uid,$type,$mode)){
            return false;
        }
        return true;
    }
}

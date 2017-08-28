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
use think\Config;

class Index extends Admin{ 
  public function index() {    

	       $this->meta_title="首页";
		   $this->assign('meta_title', $this->meta_title);
		   $info["category"]=Db::name('Document')->field("id")->count();      
		   $info["user"]=Db::name('ucenterMember')->field("id")->count();  
		   $info["log"]=Db::name('userLog')->field("id")->count();
		   $map["model"]="visitor";
           $info["visitor"]=Db::name('count')->where($map)->field("id")->count();	
		   $info["ad"]=Db::name('ad')->field("id")->count();
		   $info["group"]=Db::name('group')->field("id")->count();
		   $info["picture"]=Db::name('ad')->field("id")->count();
		   $info["comment"]=Db::name('group')->field("id")->count();
		   $this->assign('info', $info);
		   //访客数
		   $map["create_time"][]=array("gt",strtotime ( "-1 week"));
		   $map["create_time"][]=array("lt",time());
		   $map["model"]="visitor";
		   $list["visitor_list"]=Db::name('count')->where($map)->select();
		   
		   unset($map["model"]);
		   //注册会员数
		   $map["model"]="member";
		   $list["member_list"]=Db::name('count')->where($map)->select();
		   
		    
		   $date[0] = date('Y-m-d', strtotime('-6 days'));
		   $date[1] = date('Y-m-d', strtotime('-5 days'));
		   $date[2] = date('Y-m-d', strtotime('-4 days'));
		   $date[3] = date('Y-m-d', strtotime('-3 days'));
		   $date[4] = date('Y-m-d', strtotime('-2 days'));
		   $date[5] = date('Y-m-d', strtotime('-1 days'));
		   $date[6] = date('Y-m-d', time());
		   $this->assign('date', $date);
		   $this->assign('list', $list);
	       if(C('ISDES')){
            return $this->fetch();
		  }else{
			return $this->fetch("left");	
		  }
		
	}
    public function admin()
    {      
	    return $this->fetch(); 
	}
	  public function login()
    {      
	      
	       return $this->fetch();
	}
}

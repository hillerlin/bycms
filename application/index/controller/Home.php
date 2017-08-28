<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Session;
class Home  extends Controller
{
	
	 protected function _initialize(){
     
       if(!C('WEB_SITE_CLOSE')){
           $this->error('站点已经关闭，请稍后访问~');
       }
	  

		if( is_login( ) ){
			$uid=is_login();
		    $UcenterMember=Db::name("UcenterMember")->find($uid);
            $this->assign( 'UcenterMember',$UcenterMember );
		
		}

		
		/* 底部关于我们 */
       $where['type'] = 1;  
	   $where['pid'] =array("gt",0);  
	   $footer= Db::name( 'category' )->where( $where )->order("sort asc")->select( );
       $this->assign( 'footer', $footer);
    } 
}
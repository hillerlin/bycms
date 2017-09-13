<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"D:\wamp\www\bycms/application/admin\view\config\index.html";i:1501572670;s:59:"D:\wamp\www\bycms/application/admin\view\public\header.html";i:1505294625;s:59:"D:\wamp\www\bycms/application/admin\view\public\footer.html";i:1501271148;}*/ ?>
 <!-- 头部 -->
	<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8" />
	<title><?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?>|yershop后台管理</title>
    <link rel="stylesheet" href="__CSS__/index.css" />
	<link rel="stylesheet" href="__COMMON__/font-awesome/css/font-awesome.min.css">
	<script type="text/javascript" src="__COMMON__/jquery.min.js" ></script>
	<script>
	var dialog_style ="<?php echo C('DIALOG_STYLE'); ?>";
	var index_url="<?php echo url('index/index'); ?>";
	$(".logo").click(function(){
	   location.href=index_url;
	});
	</script>
  <!--引入改进型easydialog弹窗 -->	
<?php if(C('DIALOG_STYLE') == '1'): ?>	
		<link rel="stylesheet" href="__CSS__/global.css">
	<link rel="stylesheet" href="__CSS__/animate.css">
	<link rel="stylesheet" href="__CSS__/dialog.css">
	<style>
		body,html{
			/*display: flex;
			justify-content: center;
			align-items: center;*/
		}

		.div-testDialog{
			width: 500px;
			height: auto;
			margin: 50px auto;
		}

		.div-testDialog button{
			margin:  10px;
		}
		@media screen and ( max-width: 460px){
			.div-testDialog{
				width: 90%;
			}
		}
   </style>
<script src="__JS__/dialog.js"></script>
<?php endif; ?>
<style>
.top{
	width: 100%;
	height: 50px;
	color: #ffffff;
    background-color: <?php echo C('COLOR'); ?>;padding:2px 0;
}
a{color:blue;text-decoration:none;cursor: pointer;}
.nav_tree_list .menue .c_menue_item a{
	text-decoration: none;
	color:#000000;
}
.nav_tree_list .menue .c_menue_item.checked{
	color: <?php echo C('btn'); ?>;
}
.nav_tree_list .menue .c_menue_item:hover a{
	color:#fff;
}

.nav_tree_list .menue .c_menue_item.checked a{
  color: <?php echo C('COLOR'); ?>;
 }
 .nav_tree_list .menue .c_menue_item.checked a:hover{
  color:#fff;
 }
.nav_tree_list .menue .c_menue_item:hover{
	color:#fff;
	background-color: <?php echo C('COLOR'); ?>;
	
}
.p_menue{
		background-color: <?php echo C('COLOR'); ?>;
		color:#fff;
}
.edit_tab .tab_option.on{
		background-color: <?php echo C('COLOR'); ?>;
		color:#fff;
}
.page .active{
	border:1px solid <?php echo C('btn'); ?>;
	background-color:<?php echo C('btn'); ?>;
	color: #ffffff;
}
.list_opr .edit_btn,.list_opr .del_btn{

	color:bule;
}
tr th {
    color: #000;
    background-color:#e8f1f7;height:40px;
}
.article_table .article_table_header{
      color: #000;
    background-color:#e8f1f7;height:40px;
}

.edit_title{
	color:#000;
}
.edit_tab .tab_option.on a{
	
	color: #fff;
}
.upload_btn_group .upload_btn{
	background-color: <?php echo C('COLOR'); ?>;
}
.edit_left .add{
	background-color: <?php echo C('COLOR'); ?>;	
    color: #fff;
}
.edit_left .delete{
		background-color:red;
		color: #fff;
}

.confirm_btn{
	background-color:#03a9f4;
	color:#fff;
}
.confirm_btn:hover{
	background-color:#10926B;
}
.cancel_btn{
	background-color:red;
	color:#000;
	border:2px solid #eee;color:#fff;
}
.cancel_btn:hover{
    background-color: #red;
}
.error{
	background-color: #FF5722;
}
.search_btn{
	background-color: <?php echo C('btn'); ?>;
	color:#fff;
}
</style>
	</head>
	<body>
		<div class="top">
			<div class="logo"></div>
			<ul class="main_links">

						   <?php if(is_array($group) || $group instanceof \think\Collection || $group instanceof \think\Paginator): $i = 0; $__LIST__ = $group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li><a href="<?php echo get_group_url($vo['id']); ?>"><?php echo (isset($vo['title']) && ($vo['title'] !== '')?$vo['title']:""); ?> </a>

							</li>
					<?php endforeach; endif; else: echo "" ;endif; ?>

			  <li><a href="<?php echo site_url(); ?>" target="_blank">前台</a></li>

			</ul>	
			<div class="user_info">
			<span class="user_info_desc"><span class="user_name cur"><?php echo get_username(); ?></span><span>欢迎你</span></span>
			
				<a href="<?php echo url('login/logout'); ?>">退出</a>
			</div>
		</div>
	<div class="main">
			<div class="nav_tree">
				
				<div class="nav_tree_list">
					<?php if(is_array($side) || $side instanceof \think\Collection || $side instanceof \think\Paginator): $i = 0; $__LIST__ = $side;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<div class="menue down">
						<div class="p_menue cur"><i class="fa fa-<?php echo (isset($vo['font']) && ($vo['font'] !== '')?$vo['font']:''); ?>"></i><?php echo $vo['title']; ?></div>
						<div class="c_menue">
						  <?php if(is_array($vo['sid']) || $vo['sid'] instanceof \think\Collection || $vo['sid'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['sid'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($i % 2 );++$i;?>
						  <div class="c_menue_item  <?php if( $vo1['id']===$now['id']) {echo  'cur checked' ;} ?>"><a href="<?php echo get_moude_url($vo1['id']); ?>"><i class="fa fa-<?php echo (isset($vo1['font']) && ($vo1['font'] !== '')?$vo1['font']:''); ?>"></i><?php echo $vo1['title']; ?></a></div>
							 <?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
					</div>
					
					<?php endforeach; endif; else: echo "" ;endif; ?>
					
				</div>
			</div>


<!-- 头部 --> 
			<div class="content ">
				<div class="tips_msg none"><span class="tips">保存成功</span><span class="close_tips"></span></div>
					<div class="edit_title"><i class="fa fa-<?php echo (isset($now['font']) && ($now['font'] !== '')?$now['font']:''); ?>"></i><?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?></div>
					<div class="search">
					<form class="search-form"  action="<?php echo url(); ?>" method="post">
					  <div class="group">
					       名称：<input type="text" name="title" class="search_ipt" value="<?php echo input('title'); ?>"/>
					  
					  </div>
						  <div class="group">
					     英文名称：<input type="text" name="name"  class="search_ipt" value="<?php echo input('name'); ?>"/>
					  </div>
					   <div class="group">
					      分组：<select name="group" class="search_ipt">
				               <option value="-1" >无</option>
							  <?php $_result=get_config_group();if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					           <option value="<?php echo $key; ?>" <?php if($vo == $key): ?>selected<?php endif; ?>><?php echo $vo; ?>配置</option>
			  	              <?php endforeach; endif; else: echo "" ;endif; ?>
			                  </select>
						  </div>
						  <div class="group">类型：
							 <select name="type"  class="search_ipt">
				             <?php $_result=get_config_type();if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					           <option value="<?php echo $key; ?>" <?php if($vo == $key): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
			  	              <?php endforeach; endif; else: echo "" ;endif; ?>
			                 </select>
						  </div>

					<div class="search_btn" onclick="$('.search-form').submit()">搜索</div>
					</form>
					</div>
					<div class="table">
					
					<div class="edit">
						<div class="edit_left ">
						<a href="<?php echo U('add'); ?>" class="add cur">新增</a>
							<a  data-url="<?php echo U('del'); ?>" class="delete cur">删除</a>
						</div>
						
					</div>

		<table class="list_table">
			<tr>
			 <th class="check"> <input class="checkbox check-all" type="checkbox">
											
                        
						</th>	<th>id</th>
							<th>配置名称</th>
												<th>英文名称</th>
												
                                                <th>分组</th>
                                               
                                             
												<th>操作</th>
			</tr>
		 <?php if(is_array($res['list']) || $res['list'] instanceof \think\Collection || $res['list'] instanceof \think\Paginator): $i = 0; $__LIST__ = $res['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>

                                            <tr >
                                               <td> 
											<input class="ids row-selected" type="checkbox" name="id[]" value="<?php echo $vo['id']; ?>">
                                                </td>
												<td><?php echo $vo['id']; ?> </td>
								         <td><?php echo (isset($vo['title']) && ($vo['title'] !== '')?$vo['title']:""); ?> </td>
											   <td><?php echo (isset($vo['name']) && ($vo['name'] !== '')?$vo['name']:""); ?> </td>
                                                <td><?php echo (isset($vo['group']) && ($vo['group'] !== '')?$vo['group']:""); ?></td>
                                             
                                             
			<td class="list_opr">
		
                                                    <span class="opr_box">
										 <a href="<?php echo url('edit?id='.$vo['id']); ?>" class="edit_btn cur">编辑</a>
									 <a data-url="<?php echo url('del?id='.$vo['id']); ?>" class="del_btn cur">删除</a>
								
                                        </span>          
                </td>
                                            </tr>
											
										<?php endforeach; endif; else: echo "" ;endif; ?>
        </table>

					<!--分页-->
				
						 <?php echo $res['page']; ?>
				
				</div>
				
			</div>
		</div>

	   <script src="__JS__/style.js"></script>

	 <!-- 尾部 -->
		

<script src="__JS__/common.js"></script>

	</body>
</html>
<!-- 尾部 --> 

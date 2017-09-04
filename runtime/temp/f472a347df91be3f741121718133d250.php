<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:60:"D:\wamp\www\bycms/application/admin\view\document\index.html";i:1500373368;s:60:"D:\wamp\www\bycms/application/admin\view\public\sidebar.html";i:1501558248;s:59:"D:\wamp\www\bycms/application/admin\view\public\footer.html";i:1501271148;}*/ ?>
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
    color: <?php echo C('btn'); ?>;
}.nav_tree_list .menue .c_menue_item:hover{
	background-color: <?php echo C('btn'); ?>;
	color:#fff;
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
			<ul class="main_links"> 	<li><a href="<?php echo url('index/index'); ?>" >首页 </a></li>
			 <?php if(isset($group)): ?>    
                        <!-- 欢迎语 -->
						   <?php if(is_array($group) || $group instanceof \think\Collection || $group instanceof \think\Paginator): $i = 0; $__LIST__ = $group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li><a href="<?php echo get_group_url($vo['id']); ?>"><?php echo (isset($vo['title']) && ($vo['title'] !== '')?$vo['title']:""); ?> </a></li>
							<?php endforeach; endif; else: echo "" ;endif; ?>  
					  <li><a href="<?php echo site_url(); ?>" target="_blank">前台</a></li>
					  <?php endif; ?>
		

			</ul>	
			<div class="user_info">
			<span class="user_info_desc"><span class="user_name cur"><?php echo get_username(); ?></span><span>欢迎你</span></span>
			
				<a href="<?php echo url('login/logout'); ?>">退出</a>
			</div>
		</div>
			<div class="main">
			<div class="nav_tree">
				
				<div class="nav_tree_list">
				  
				
					<?php if(is_array($cate_list) || $cate_list instanceof \think\Collection || $cate_list instanceof \think\Paginator): $i = 0; $__LIST__ = $cate_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<div class="tree_menue <?php if(in_checked($pid,$vo['id'])) {echo  'down' ;}else{echo  'up' ;} ?>">
						<div class="tree_menue_first cur">
						 <a href="<?php echo url('document/index?pid='.$vo['id']); ?>" class="tit"><?php echo $vo['title']; ?></a></div>
						 <?php if(is_array($vo['child']) || $vo['child'] instanceof \think\Collection || $vo['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($i % 2 );++$i;?><div class="tree_menue_second_group down">
							
							    <div class="tree_menue_second cur <?php if(in_checked($pid,$vo1['id'])) {echo  'checked' ;} ?>">
							    <a href="<?php echo url('document/index?pid='.$vo1['id']); ?>">|—<?php echo $vo1['title']; ?></a>
							    </div>
							    <ul> <?php if(is_array($vo1['child']) || $vo1['child'] instanceof \think\Collection || $vo1['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo1['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?>
								<li class="tree_menue_third cur checked"><a href="<?php echo url('document/index?pid='.$vo2['id']); ?>">|—<?php echo $vo2['title']; ?></a></li> 
								<?php endforeach; endif; else: echo "" ;endif; ?>
								</ul>
						</div> 
						<?php endforeach; endif; else: echo "" ;endif; ?>
					</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
			</div>	

<!-- 头部 --> 
			<div class="content">
				<div class="tips_msg none"><span class="tips">保存成功</span><span class="close_tips"></span></div>
				<div class="edit_title">[<?php echo get_category($pid,'title'); ?>]<?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?></div>
				<div class="search">
					<form class="search-form"  action="<?php echo url(); ?>" method="post">
					  <div class="group">
					       标题：<input type="text" name="title" class="search_ipt" value="<?php echo input('title'); ?>"/>
					  
					  </div>
						  <div class="group">
					     关键字：<input type="text" name="content"  class="search_ipt" value="<?php echo input('content'); ?>"/>
					  </div>
					   <div class="group">
					      状态：<select name="group" class="search_ipt">						  
					           <option value="1" >正常</option>
							   <option value="0" >禁用</option>
			                  </select>
						  </div>
						  <div class="group">分类：<select name="category_id" class="search_ipt">
							 <?php if(is_array($cate_list) || $cate_list instanceof \think\Collection || $cate_list instanceof \think\Paginator): $i = 0; $__LIST__ = $cate_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
							    <option value="<?php echo $vo['id']; ?>"><?php echo $vo['title']; ?></option>
							      <?php if(is_array($vo['child']) || $vo['child'] instanceof \think\Collection || $vo['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($i % 2 );++$i;?> 
							        <option value="<?php echo $vo1['id']; ?>">|——<?php echo $vo1['title']; ?></option>
							            <?php if(is_array($vo1['child']) || $vo1['child'] instanceof \think\Collection || $vo1['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo1['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?>
							               -- <option value="<?php echo $vo2['id']; ?>">|————<?php echo $vo2['title']; ?></option>
							          <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
			                 </select>
						  </div>

					<div class="search_btn" onclick="$('.search-form').submit()">搜索</div>
					</form>
					</div>
				<div class="table">
					<div class="edit">
						<div class="edit_left ">
							<a href="<?php echo url('add?pid='.$pid); ?>" class="add cur">新增</a>
							<a data-url="<?php echo url('del'); ?>" class="delete cur">删除</a>
						</div>
						<div class="search_right">
							<input type="text" />
							<div class="search_btn"></div>
						</div>
					</div>
					<table class="list_table">
					    <tr><th> <input class="checkbox check-all" type="checkbox">
											
                                                </th>
			<th>标题</th>
                    <th>缩略图</th>
                    <th>所属分类</th>
					 <th>状态</th>
                       <th>创建时间</th>
		<th class="">操作</th>
				
                                            </tr>
				       <?php if(is_array($res['list']) || $res['list'] instanceof \think\Collection || $res['list'] instanceof \think\Paginator): $i = 0; $__LIST__ = $res['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>

                                            <tr class="even gradeC">
                                               <td> 
											<input class="ids row-selected" type="checkbox" name="id[]" value="<?php echo $vo['id']; ?>">
                                                </td>
									<td><a href="<?php echo U('auth/edit?id='.$vo['id']); ?>"><?php echo $vo['title']; ?></a> </td>
		
					
					    <td>
                                                    <img src="<?php echo get_cover_path($vo['cover_id']); ?>" class="table-img" alt="">
                                                </td>
					     <td><?php echo get_category($vo['category_id'],'title'); ?></td>
						 <td><?php echo $vo['status']; ?></td>
                           <td><?php echo date("Y-m-d h:i",$vo['create_time']); ?></td>
				
                           
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
					<ul class="pagination">
						  <?php echo $res['page']; ?>
					</ul>
				</div>
				
			</div>
		</div>
	   <script>
			$(function(){
				initPage();
				window.onresize=function(){
					initPage();
				}
				bindEvent();
			});
			
			function initPage(){
				
				
				
				
			
			}
			
			function bindEvent(){
				$(".tree_menue_first .tit").on('click',function(){
					if($(this).parents(".tree_menue").hasClass("down")){
						$(this).parents(".tree_menue").removeClass("down").addClass("up");
						
					}else{
						$(this).parents(".tree_menue").removeClass("up").addClass("down");
						
					}
					
				});
				$(".tree_menue_second").on("hover",function(){
					if(!$(this).hasClass("checked")){
						$(".nav_tree_list .tree_menue_second").parents(".tree_menue_second_group").find(".tree_menue_second").removeClass("checked");
						$(this).addClass("checked");
						
						
						$(this).parent().find("ul").show();
					}else{
						$(this).removeClass("checked");
					}
					
				});
				
				$(".tab_option").click(function(){
					if(!$(this).hasClass("on")){
						var index = $(".tab_option").index($(this));
						$($(".edit_content_tab").get(index)).removeClass("none").siblings(".edit_content_tab").addClass("none");
						$(this).addClass("on").siblings().removeClass("on");
					}
					
				});
				
				
			}
			
			
			
		</script>	
		
	 <!-- 头部 -->
		

<script src="__JS__/common.js"></script>

	</body>
</html>
<!-- 头部 --> 


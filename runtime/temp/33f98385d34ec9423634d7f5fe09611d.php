<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:60:"D:\wamp\www\bycms/application/admin\view\category\index.html";i:1499586040;s:59:"D:\wamp\www\bycms/application/admin\view\public\header.html";i:1505294625;s:59:"D:\wamp\www\bycms/application/admin\view\public\footer.html";i:1501271148;}*/ ?>
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
			<div class="content">
			<div class="edit_title"><?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?></div>
				<div class="articlelist">
					<div class="edit">
						<div class="edit_left ">
								<a href="<?php echo U('add'); ?>" class="add cur">新增</a>
								<a  data-url="<?php echo U('del'); ?>" class="delete cur">删除</a>
						</div>
						<div class="search_right">
							
						</div>
					</div>
					<div class="article_table">
						<div class="article_table_header article_table_tr">
							<!--加class往后面加，不要加在已有class前面-->
							<div class="article_folder article_table_th" w_percent="18">折叠</div>
								<div class="article_id article_table_th" w_percent="18">id</div>
							<div class="article_name article_table_th" w_percent="50">名称</div>
							<div class="article_sort article_table_th" w_percent="10">排序</div>
							<div class="article_deploy article_table_th" w_percent="10">模型</div>
							<div class="list_opr article_table_th" w_percent="22">操作</div>
						</div>
						 <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
						<div class="first_level_group opened">
							<div class="first_level article_table_tr">
								<div class="article_folder">
										<span class="folder_icon"></span>
								</div>
								<div class="article_id">
									<?php echo $vo['id']; ?>
								</div>
								<div class="article_name">
								<span><?php echo $vo['title']; ?></span>
									 <a href="<?php echo url('add?pid='.$vo['id']); ?>" class="add_article"></a>
								</div>
								<div class="article_sort">
									<?php echo $vo['sort']; ?>
								</div>
								<div class="article_deploy"><?php echo get_models($vo['model_id'],'title'); ?></div>
								<div class="list_opr">
									<span class="opr_box">
										 <a href="<?php echo url('edit?id='.$vo['id']); ?>" class="edit_btn cur">编辑</a>
									 <a data-url="<?php echo url('del?id='.$vo['id']); ?>" class="del_btn cur">删除</a>
									</span>
								</div>
							</div> 
							 <?php if(is_array($vo['child']) || $vo['child'] instanceof \think\Collection || $vo['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($i % 2 );++$i;?>
							<div class="second_level_group opened">
								<div class="second_level article_table_tr">
									<div class="article_folder">
										<span class="folder_icon"></span>
									</div>
									<div class="article_id">
									<?php echo $vo1['id']; ?>
								   </div>
									<div class="article_name">
									<span><?php echo $vo1['title']; ?></span>
									 	 <a href="<?php echo url('add?pid='.$vo1['id']); ?>" class="add_article"></a>
								   </div>
								   <div class="article_sort">
									<?php echo $vo1['sort']; ?>
								   </div>
								   <div class="article_deploy"><?php echo get_models($vo1['model_id'],'title'); ?></div>
									<div class="list_opr">
										<span class="opr_box">
										 <a href="<?php echo url('edit?id='.$vo1['id']); ?>" class="edit_btn cur">编辑</a>
									      <a data-url="<?php echo url('del?id='.$vo1['id']); ?>" class="del_btn cur">删除</a>
										</span>
									</div>
								</div>
								<?php if(!(empty($vo1['child']) || (($vo1['child'] instanceof \think\Collection || $vo1['child'] instanceof \think\Paginator ) && $vo1['child']->isEmpty()))): if(is_array($vo1['child']) || $vo1['child'] instanceof \think\Collection || $vo1['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo1['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?>
								<div class="third_level article_table_tr">
									<div class="article_folder">
									    <span class="folder_icon"></span>
									</div>
									<div class="article_id">
									 <?php echo $vo2['id']; ?>
								   </div>
									<div class="article_name">
									  <span><?php echo $vo2['title']; ?></span>
									   	 <a href="<?php echo url('add?pid='.$vo2['id']); ?>" class="add_article"></a>
								    </div>
								    <div class="article_sort">
									    <?php echo $vo2['sort']; ?>
								    </div>
								    <div class="article_deploy"><?php echo get_models($vo2['model_id'],'title'); ?></div>
									<div class="list_opr">
										<span class="opr_box">
										 <a href="<?php echo url('edit?id='.$vo2['id']); ?>" class="edit_btn cur">编辑</a>
									 <a data-url="<?php echo url('del?id='.$vo2['id']); ?>" class="del_btn cur">删除</a>
										</span>
									</div>
								</div>
								
							<?php endforeach; endif; else: echo "" ;endif; endif; ?>
								</div><?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
							<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>	</div>	</div>	</div>	</div>
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
				
				$(".nav_tree").css("min-height",($(window).height() - 86) + 'px');
				$(".content").css("min-height",($(window).height() - 86) + 'px');
				$(".nav_tree").attr("min-height",$(window).height() - 86);
				$(".content").attr("min-height",$(window).height() - 86);
				$(".articlelist").attr("min-height",$(window).height() - 86);
				$(".articlelist").css("min-height",($(window).height() - 86) + 'px');
				
				var currentRightHeight = $(".content").height();
				var currentNavHeight = $(".nav_tree").height();
				if(currentRightHeight < currentNavHeight){
					$(".articlelist").css("min-height",currentNavHeight + 'px');
					$(".articlelist").attr("min-height",currentNavHeight);
				}else{
					$(".nav_tree").css("min-height",currentRightHeight + 'px');
				}
				
				
			}
			
			function bindEvent(){
				$(".p_menue").on('click',function(){
					if($(this).parent(".menue").hasClass("down")){
						$(this).parent(".menue").removeClass("down").addClass("up");
					}else{
						$(this).parent(".menue").removeClass("up").addClass("down");
					}
					calculateHeight();
				});
				$(".c_menue_item").on("click",function(){
					if(!$(this).hasClass("checked")){
						$(".nav_tree_list .c_menue_item").removeClass("checked");
						$(this).addClass("checked");
					}
				})
				$(".close_tips").click(function(){
					$(".tips_msg").hide();
					calculateHeight();
				});
				
				
				/****树形菜单展开**/
				$(".first_level .folder_icon").click(function(){
					var parent= $(this).parents(".first_level_group").first();
					if(parent.hasClass("closed")){
						parent.removeClass("closed").addClass("opened");
					}else if(parent.hasClass("opened")){
						parent.removeClass("opened").addClass("closed");
						parent.find(".second_level_group").removeClass("opened").addClass("closed");
					}
					calculateHeight();
				});
				$(".second_level .folder_icon").click(function(){
					var parent= $(this).parents(".second_level_group").first();
					if(parent.hasClass("closed")){
						parent.removeClass("closed").addClass("opened");
					}else if(parent.hasClass("opened")){
						parent.removeClass("opened").addClass("closed");
					}
					calculateHeight();
				});
			}
			
			function calculateHeight(){
				var realHeight = $(".articlelist .edit").outerHeight() + $(".article_table").outerHeight();
				var realLeftHeight = $(".user_info_detail").outerHeight() + $(".nav_tree_list").outerHeight();
				var currentNavHeight = $(".nav_tree").height();
				if(realHeight > $(".articlelist").attr("min-height")){
					if(realHeight > currentNavHeight){
						$(".nav_tree").css("min-height",realHeight + 'px');
					    $(".articlelist").css("min-height",realHeight + 'px');
					}else{
						if(realLeftHeight > realHeight){
							$(".articlelist").css("min-height",realLeftHeight + 'px');
							$(".nav_tree").css("min-height",realLeftHeight + 'px');
						}else{
							$(".nav_tree").css("min-height",realHeight + 'px');
						    $(".articlelist").css("min-height",realHeight + 'px');
						}
					}
				}else{
					if(currentNavHeight >= $(".articlelist").attr("min-height")){
						if(realLeftHeight >= $(".articlelist").attr("min-height")){
							$(".articlelist").css("min-height",realLeftHeight + 'px');
							$(".nav_tree").css("min-height",realLeftHeight + 'px');
						}else{
							$(".nav_tree").css("min-height",$(".articlelist").attr("min-height") + 'px');
							$(".articlelist").css("min-height",$(".articlelist").attr("min-height")  + 'px');
						}
						
					}else{
						$(".nav_tree").css("min-height",$(".articlelist").attr("min-height") + 'px');
						$(".articlelist").css("min-height",$(".articlelist").attr("min-height")  + 'px');
					}
				}
			}
			
			
	
		</script>
 <!-- 尾部 -->
		

<script src="__JS__/common.js"></script>

	</body>
</html>
    <!-- 尾部 --> 

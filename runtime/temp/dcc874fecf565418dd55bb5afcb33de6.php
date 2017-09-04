<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:60:"D:\wamp\www\bycms/application/admin\view\config\systems.html";i:1501573417;s:59:"D:\wamp\www\bycms/application/admin\view\public\header.html";i:1501572622;s:59:"D:\wamp\www\bycms/application/admin\view\public\footer.html";i:1501271148;}*/ ?>
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
		           	<li><a href="<?php echo url('index/index'); ?>" >首页 </a></li> <?php if(isset($group)): ?>    
                        <!-- 欢迎语 -->
						   <?php if(is_array($group) || $group instanceof \think\Collection || $group instanceof \think\Paginator): $i = 0; $__LIST__ = $group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li><a href="<?php echo get_group_url($vo['id']); ?>"><?php echo (isset($vo['title']) && ($vo['title'] !== '')?$vo['title']:""); ?> </a>
							
							</li>
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
			<script type="text/javascript" src="__COMMON__/uploadify/jquery.uploadify.min.js"></script>	
  <script type="text/javascript" src="__COMMON__/jquery.colorpicker.js"></script>	
			<div class="content">
			<div class="tips_msg none"><span class="tips">保存成功</span><span class="close_tips"></span></div>
					<div class="edit_title"><i class="fa fa-<?php echo (isset($now['font']) && ($now['font'] !== '')?$now['font']:''); ?>"></i><?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?></div>
				<div class="edit_box">
				
					<div class="edit_tab">
				<?php if(is_array($groups) || $groups instanceof \think\Collection || $groups instanceof \think\Paginator): if( count($groups)==0 ) : echo "" ;else: foreach($groups as $key=>$vo): ?>
			      <div class="tab_option <?php if($type == $key): ?>on<?php endif; ?>"><a href="<?php echo U('?group='.$key); ?>"><?php echo $vo; ?>配置</a></div>
		     	<?php endforeach; endif; else: echo "" ;endif; ?>
					</div>
					<div class="edit_content">
							 <form class="group-form"  action="<?php echo url(''); ?>" method="post">
							 <div class="edit_content_tab">
						 	<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$config): $mod = ($i % 2 );++$i;switch($config['type']): case "string": ?>
						    <div class="input_title"><?php echo $config['title']; ?><span>(<?php echo $config['remark']; ?>)</span></div>
							<input type="text" name="config[<?php echo $config['name']; ?>]" class="input_box" value="<?php echo $config['value']; ?>"/>
							<?php break; case "textarea": ?>
						    <div class="input_title"><?php echo $config['title']; ?><span>(<?php echo $config['remark']; ?>)</span></div>
							<textarea name="config[<?php echo $config['name']; ?>]"/><?php echo $config['value']; ?></textarea>
							<?php break; case "radio": ?>
						    <div class="input_title"><?php echo $config['title']; ?><span>(<?php echo $config['remark']; ?>)</span></div>
							<input type="radio" name="config[<?php echo $config['name']; ?>]" value="<?php echo $config['value']; ?>"/>
							<?php break; case "select": ?>
						    <div class="input_title"><?php echo $config['title']; ?><span>(<?php echo $config['remark']; ?>)</span></div>
							<select name="config[<?php echo $config['name']; ?>]">
				              <?php $_result=parse_config_attr($config['extra']);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					           <option value="<?php echo $key; ?>" <?php if($config['value'] == $key): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
				           <?php endforeach; endif; else: echo "" ;endif; ?>
			              </select>
							
							<?php break; case "color": ?>
						    <div class="input_title"><?php echo $config['title']; ?><span>(<?php echo $config['remark']; ?>)</span></div>
							 <input  class="input_box" type="text" name="config[<?php echo $config['name']; ?>]" value="<?php echo $config['value']; ?>" id="<?php echo $config['name']; ?>" style="color:<?php echo $config['value']; ?>"/>
							<script>
							$("#<?php echo $config['name']; ?>").colorpicker({
								fillcolor:true,
								success:function(o,color){
									$(o).css("color",color);
								}
							});</script>
							<?php break; case "picture": ?>
						   <div class="upload_div">
								<div class="input_title"><?php echo $config['title']; ?><span>(<?php echo $config['remark']; ?>)</span></div>
								<div class="upload_btn_group">
									<div class="upload_btn">上传图片</div>
									<input type="file" class="upload_file" id="<?php echo $config['name']; ?>"/>
							 	</div>
								<div class="upload_imgs h50">
									<input type="hidden" name="config[<?php echo $config['name']; ?>]"  value="<?php echo $config['value']; ?>"	>
									  <span class="upload_imgs_wrap upload-pre-img-<?php echo $config['name']; ?> ">
							          <?php if(!(empty($config['value']) || (($config['value'] instanceof \think\Collection || $config['value'] instanceof \think\Paginator ) && $config['value']->isEmpty()))): ?>  
									  <div class="upload-pre-item"> 
									    <img src="<?php echo get_cover_path($config['value']); ?>"/>
						                </div>
									  <?php endif; ?>
									</span>
								</div>
							</div>										
					    <script type="text/javascript">



				    /* 初始化上传插件 */
					$("#<?php echo $config['name']; ?>").uploadify({
				        "height"          : 30,
				        "swf"             : "__COMMON__/uploadify/uploadify.swf",
				        "fileObjName"     : "download",
				        "buttonText"      : "上传图片",
				        "uploader"        : "<?php echo url('File/uploadPicture',array('session_id'=>session_id())); ?>",
				        "width"           : 120,
				        'removeTimeout'	  : 1,
				        'fileTypeExts'	  : '*.jpg; *.png; *.gif;',
				        "onUploadSuccess" : uploadPicture<?php echo $config['name']; ?>,
				        'onFallback' : function() {
				            alert('未检测到兼容版本的Flash.');
				        }
				    });
					function uploadPicture<?php echo $config['name']; ?>(file, data){
				    	var data = $.parseJSON(data);
				    	var src = '';
				        if(data.status){
				        	src = data.url || data.path;
							$("input[name='config[<?php echo $config['name']; ?>]']").val(data.id);
				        	$('.upload-pre-img-<?php echo $config['name']; ?>').html(
				        		' <div class="upload-pre-item"><img src="' +data.src + '"/> </div>'
				        	);
				        } 
				    }
					</script>
                     <?php break; endswitch; endforeach; endif; else: echo "" ;endif; ?>	
						</div>
						<div class="edit_content_tab none">
							
						</div>
						<div class="btn_group">
						    <input type="hidden" name="id" value="<?php echo (isset($info['id']) && ($info['id'] !== '')?$info['id']:""); ?>">
							<div class="confirm_btn">确认</div>
							<div class="cancel_btn">返回</div>
						</div></form> 
					</div>
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
			
				$(".nav_tree").css("min-height",($(window).height() - 86) + 'px');
				
				$(".nav_tree").attr("min-height",$(window).height() - 86);
				

				var currentRightHeight = $(".content").height();
				var currentNavHeight = $(".nav_tree").height();
				if(currentRightHeight < currentNavHeight){
					if($(".tips_msg:hidden").length > 0){
						$(".edit_box").css("height",$(".content").height() + (currentNavHeight - currentRightHeight));
					}else{
						$(".edit_box").css("height",$(".edit_box").height() + (currentNavHeight - currentRightHeight));
					}
				}else{
					$(".nav_tree").css("min-height",$(".nav_tree").height() + (currentRightHeight - currentNavHeight));
				}
			}
			
			function bindEvent(){
				$(".p_menue").on('click',function(){
					if($(this).parent(".menue").hasClass("down")){
						$(this).parent(".menue").removeClass("down").addClass("up");
						$(this).find("span").attr("class","folder_icon_on");
					}else{
						$(this).parent(".menue").removeClass("up").addClass("down");
						$(this).find("span").attr("class","folder_icon");
					}
					
				});
				$(".c_menue_item").on("click",function(){
					if(!$(this).hasClass("checked")){
						$(".nav_tree_list .c_menue_item").removeClass("checked");
						$(this).addClass("checked");
					}
				})
				$(".close_tips").click(function(){
					$(".tips_msg").hide();
					
				});
				
			}
			
			function calculateHeight(){
				var currentRightHeight = $(".content").height();
				var currentNavHeight = $(".nav_tree").height();
				if(currentRightHeight < currentNavHeight){
					if($(".tips_msg:hidden").length > 0){
						$(".edit_box").css("height",$(".content").height() + (currentNavHeight - currentRightHeight));
					}else{
						$(".edit_box").css("height",$(".edit_box").height() + (currentNavHeight - currentRightHeight));
					}
				}else{
					if(currentNavHeight > $(".nav_tree").attr("min-height")){
						$(".edit_box").css("height",$(".edit_box").height() + (currentNavHeight - currentRightHeight));
					}else{
						$(".edit_box").css("height",$(".edit_box").height() + ( $(".nav_tree").attr("min-height") - currentRightHeight));
					}
				}
			}</script>
 <!-- 头部 -->
		

<script src="__JS__/common.js"></script>

	</body>
</html>
<!-- 头部 --> 

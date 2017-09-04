<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"D:\wamp\www\bycms/application/admin\view\document\add.html";i:1504512153;s:60:"D:\wamp\www\bycms/application/admin\view\public\sidebar.html";i:1501558248;s:59:"D:\wamp\www\bycms/application/admin\view\public\footer.html";i:1501271148;}*/ ?>
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

	<script type="text/javascript" src="__COMMON__/uploadify/jquery.uploadify.min.js"></script>
	  <script type="text/javascript" src="__COMMON__/laydate/laydate.js"></script>
			<div class="content">
			<div class="tips_msg none"><span class="tips">保存成功</span><span class="close_tips"></span></div>
				<div class="edit_title"><i class="fa fa-map-marker"></i>当前位置:<?php foreach($ids as $vo): ?>
			<a  class="cru_01" href="<?php echo url('document/index?pid='.$vo); ?>"><?php echo get_category($vo,'title'); ?></a>>
		<?php endforeach; ?><?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?></div>
				<div class="edit_box">

					<div class="edit_tab">
						<div class="tab_option on">基础</div>
						<div class="tab_option">高级</div>
					</div>
					<div class="edit_content">
							 <form class="group-form"  action="<?php echo url(''); ?>" method="post">


						    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $k=>$v): ?>
							 <div class="edit_content_tab <?php if($k == 1): ?>none<?php endif; ?>">
							 <?php if(is_array($v['data']) || $v['data'] instanceof \think\Collection || $v['data'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['data'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;switch($vo['type']): case "num": ?>
                                 <div class="input_title"><?php echo $vo['title']; ?><span>(<?php echo $vo['remark']; ?>)</span></div>
							<input type="text" name="<?php echo $vo['name']; ?>" class="input_box" value="<?php echo (isset($vo['value']) && ($vo['value'] !== '')?$vo['value']:""); ?>"/>
								<?php break; case "string": ?>
                                 <div class="input_title"><?php echo $vo['title']; ?><span>(<?php echo $vo['remark']; ?>)</span></div>
							<input type="text" name="<?php echo $vo['name']; ?>" class="input_box" value="<?php echo (isset($info['title']) && ($info['title'] !== '')?$info['title']:""); ?>"/>
								<?php break; case "textarea": ?>
                                 <div class="input_title"><?php echo $vo['title']; ?><span>(<?php echo $vo['remark']; ?>)</span></div>
						     	<textarea name="<?php echo $vo['name']; ?>"/><?php echo $vo['value']; ?></textarea>
								<?php break; case "editor": ?>
                                <div class="input_title"><?php echo $vo['title']; ?><span>(<?php echo $vo['remark']; ?>)</span></div>
						  <textarea class="am-validate" id="content" name="<?php echo $vo['name']; ?>" required><?php echo (isset($vo['name']) && ($vo['name'] !== '')?$vo['name']:""); ?></textarea>
                                     <link rel="stylesheet" href="__COMMON__/kindeditor/default/default.css" />
			<script charset="utf-8" src="__COMMON__/kindeditor/kindeditor-min.js"></script>
			<script charset="utf-8" src="__COMMON__/kindeditor/zh_CN.js"></script>
			<script type="text/javascript">
				var editor_content;

				KindEditor.ready(function(K) {
					editor_content = K.create('textarea[name="content"]', {
						allowFileManager : false,
						themesPath: K.basePath,
						width: '90%',
						height: '300',
						resizeType:1,
						pasteType : 2,
						urlType : 'absolute',
						fileManagerJson : '<?php echo url('fileManagerJson'); ?>',
						uploadJson : '<?php echo url("Uploads/ke_upimg"); ?>'
					});
				});

				$(function(){
					$('textarea[name="<?php echo $vo['name']; ?>"]').closest('form').submit(function(){
						editor_content.sync();
					});
				})
			</script>
								<?php break; case "picture": ?>
             <div class="upload_div">
							<div class="input_title"><?php echo $vo['title']; ?><span>(<?php echo $vo['remark']; ?>)</span></div>
								<div class="upload_btn_group">
									<div class="upload_btn">上传图片</div>
									<input type="file" class="upload_file" id="<?php echo $vo['name']; ?>"/>
								</div>
								<div class="upload_imgs">
								<input type="hidden" name="<?php echo $vo['name']; ?>"  value="<?php echo (isset($info[$vo['name']]) && ($info[$vo['name']] !== '')?$info[$vo['name']]:''); ?>"	>
									<span class="upload_imgs_wrap upload-pre-img-<?php echo $vo['name']; ?>">


									</span>

								</div>
							</div>

<script type="text/javascript">
				    /* 初始化上传插件 */
					$("#<?php echo $vo['name']; ?>").uploadify({
				        "height"          : 30,
				        "swf"             : "__COMMON__/uploadify/uploadify.swf",
				        "fileObjName"     : "download",
				        "buttonText"      : "上传图片",
				        "uploader"        : "<?php echo url('File/uploadPicture',array('session_id'=>session_id())); ?>",
				        "width"           : 150,
				        'removeTimeout'	  : 10,
				        'fileTypeExts'	  : '*.jpg; *.png; *.gif;',
				        "onUploadSuccess" : uploadPicture<?php echo $vo['name']; ?>,
				        'onFallback' : function() {
				            alert('未检测到兼容版本的Flash.');
				        }
				    });
					function uploadPicture<?php echo $vo['name']; ?>(file, data){
				    	var data = $.parseJSON(data);
				    	var src = '';
				        if(data.status){
				        	$("input[name='<?php echo $vo['name']; ?>']").val(data.id);
				        	$('.upload-pre-img-<?php echo $vo['name']; ?>').html(
				        		' <div class="upload-pre-item"><img src="' +data.path + '"/> </div>'
				        	);
				        }
				    }
					</script>
								<?php break; case "photo": ?>
             <div class="upload_div">
							<div class="input_title"><?php echo $vo['title']; ?><span>(<?php echo $vo['remark']; ?>)</span></div>
								<div class="upload_btn_group">
									<div class="upload_btn">上传图片</div>
									<input type="file" class="upload_file" id="<?php echo $vo['name']; ?>"/>
								</div>
								<div class="upload_imgs">
								<input type="hidden" name="<?php echo $vo['name']; ?>"  value="<?php echo (isset($info[$vo['name']]) && ($info[$vo['name']] !== '')?$info[$vo['name']]:''); ?>"	>


									<span class="upload_imgs_wrap <?php echo $vo['name']; ?>">


									</span>


								</div>
							</div>

<script type="text/javascript">

				    /* 初始化上传插件 */
					$("#<?php echo $vo['name']; ?>").uploadify({
				        "height"          : 30,
				        "swf"             : "__COMMON__/uploadify/uploadify.swf",
				        "fileObjName"     : "download",
				        "buttonText"      : "上传图片",
				        "uploader"        : "<?php echo url('File/uploadpicture',array('session_id'=>session_id())); ?>",
				        "width"           : 150,
				        'removeTimeout'	  : 10,
				        'fileTypeExts'	  : '*.jpg; *.png; *.gif;',
				        "onUploadSuccess" :function (file, data){
				    	var data = $.parseJSON(data);
				    	var src = '';
				        if(data.status){
				        src = data.url || data.path;
							var upload_img = "<div class='upload-pre-item'><img  class='item_<?php echo $vo['name']; ?>' src=" + src +" title='点击显示大图' data-id="+data.id+"> <span class='close' onclick='delPic(this);'></span></div>";
                            picsbox = $(".<?php echo $vo['name']; ?>");
							  picsbox.append(upload_img);
                             setVal();
				        }
				    },
				        'onFallback' : function() {
				            alert('未检测到兼容版本的Flash.');
				        }
				    });


		  function delPic(obj){ //删除
            $(obj).parent("div").remove();
		    setVal();
	     }
	     function setVal(){ //取值
		    var option = $(".item_<?php echo $vo['name']; ?>");
		    var result=new Array();
		    option.each(function(i){
		 	     result.push($(this).attr('data-id'));
		   });
           ids= result.join(',');
           $("input[name='<?php echo $vo['name']; ?>']").val(ids);
	  }
</script>
								<?php break; case "date": ?>
  				<div class="input_title"><?php echo $vo['title']; ?><span>(<?php echo $vo['remark']; ?>)</span></div>
							<input type="text" name="<?php echo $vo['name']; ?>" id="<?php echo $vo['name']; ?>" class="laydate-icon input_box" value="<?php if(!(empty($info['id']) || (($info['id'] instanceof \think\Collection || $info['id'] instanceof \think\Paginator ) && $info['id']->isEmpty()))): ?><?php echo time_format($info[$vo['name']]); endif; ?>"/>

				 	<script>
laydate({
  elem: '#<?php echo $vo['name']; ?>',
  format: 'YYYY-MM-DD hh:mm:ss',
  min: laydate.now(), //设定最小日期为当前日期//目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
  event: 'focus' //响应事件。如果没有传入event，则按照默认的click
});
</script>
								<?php break; endswitch; endforeach; endif; else: echo "" ;endif; ?>
								</div>
								<?php endforeach; endif; else: echo "" ;endif; ?>




								 <div class="input_title">文章标签<span>如有多个标签请用','号分开（例：大麦理财,互联网金融）</span></div>
								 <input type="text" name="description" class="input_box" value=""/>

						<div class="btn_group">
						     <input type="hidden" name="category_id" value="<?php echo (isset($info['category_id']) && ($info['category_id'] !== '')?$info['category_id']:""); ?>">
						    <input type="hidden" name="model_id" value="<?php echo (isset($cate['model_id']) && ($cate['model_id'] !== '')?$cate['model_id']:""); ?>">
							<input type="hidden" name="id" value="<?php echo (isset($info['id']) && ($info['id'] !== '')?$info['id']:""); ?>">
							<div class="confirm_btn">确认</div>
							<div class="cancel_btn">返回</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>



	  <script>
			  $("select[name='position']").val("<?php echo (isset($info['position']) && ($info['position'] !== '')?$info['position']:'0'); ?>");
			$(function(){
				initPage();
				window.onresize=function(){
					initPage();
				}
				bindEvent();
			});

			function initPage(){


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
				$(".tree_menue_first").on('click',function(){
					if($(this).parent(".tree_menue").hasClass("down")){
						$(this).parent(".tree_menue").removeClass("down").addClass("up");
						$(this).find("span").attr("class","folder_icon_on");
					}else{
						$(this).parent(".tree_menue").removeClass("up").addClass("down");
						$(this).find("span").attr("class","folder_icon");
					}

				});
				$(".tree_menue_second").on("hover",function(){
					if(!$(this).hasClass("checked")){
						$(".nav_tree_list .tree_menue_second").removeClass("checked");
						$(this).addClass("checked");
						$(this).parent().removeClass("up").addClass("down");
						if($(this).parents(".tree_menue").find("ul").is(':visible')){
						   $(this).parents(".tree_menue").find("ul").hide();
						}
						$(this).parent().find("ul").show();
					}else{
						//$(this).removeClass("checked");
						//$(this).parent().removeClass("down").addClass("up");
					}

				});
				$(".tree_menue_third").on("click",function(){
					if(!$(this).hasClass("checked")){
						$(".nav_tree_list .tree_menue_third").removeClass("checked");
						$(this).addClass("checked");
					}
				});
				$(".tab_option").click(function(){
					if(!$(this).hasClass("on")){
						var index = $(".tab_option").index($(this));
						$($(".edit_content_tab").get(index)).removeClass("none").siblings(".edit_content_tab").addClass("none");
						$(this).addClass("on").siblings().removeClass("on");
					}

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

				});
				$(".second_level .folder_icon").click(function(){
					var parent= $(this).parents(".second_level_group").first();
					if(parent.hasClass("closed")){
						parent.removeClass("closed").addClass("opened");
					}else if(parent.hasClass("opened")){
						parent.removeClass("opened").addClass("closed");
					}

				});
			}



		</script>
 <!-- 头部 -->
		

<script src="__JS__/common.js"></script>

	</body>
</html>
<!-- 头部 -->

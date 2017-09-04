<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:59:"D:\wamp\www\bycms/application/admin\view\category\edit.html";i:1504499081;s:59:"D:\wamp\www\bycms/application/admin\view\public\header.html";i:1501572622;s:59:"D:\wamp\www\bycms/application/admin\view\public\footer.html";i:1501271148;}*/ ?>
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

<div class="content">
				<div class="tips_msg none"><span class="tips">保存成功</span><span class="close_tips"></span></div>
				<div class="edit_title"><?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?></div>
				<div class="edit_box">
					
					<div class="edit_tab">
						<div class="tab_option on">基础</div>
						<div class="tab_option">高级</div>
					</div>
					<div class="edit_content">
						 <form class="group-form"  action="<?php echo url(''); ?>" method="post">
						<div class="edit_content_tab">
							<div class="input_title">名称<span>(模块名称)</span></div>
							<input type="text" name="title" class="input_box" value="<?php echo (isset($info['title']) && ($info['title'] !== '')?$info['title']:""); ?>"/>
							
							<div class="input_title">上级分类<span>(所属分类)</span></div>
						 <select name="pid" >
      <option value="0">顶级分类</option>   
	  <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
 <option value="<?php echo $vo['id']; ?>"><?php echo (isset($vo['html']) && ($vo['html'] !== '')?$vo['html']:""); ?><?php echo $vo['title']; ?></option>
 <?php endforeach; endif; else: echo "" ;endif; ?>
</select>
		<div class="input_title">绑定模型<span>(关联模型)</span></div>
						 <select name="model_id" >
	  <?php if(is_array($model_list) || $model_list instanceof \think\Collection || $model_list instanceof \think\Paginator): $i = 0; $__LIST__ = $model_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
 <option value="<?php echo $vo['id']; ?>"><?php echo $vo['title']; ?></option>
 <?php endforeach; endif; else: echo "" ;endif; ?>
</select>
 <div class="input_title">状态<span>(0-禁用，1-正常)</span></div>
    <input type="text" name="status" class="input_box" value="<?php echo (isset($info['status']) && ($info['status'] !== '')?$info['status']:"1"); ?>"/>
		<div class="input_title">类型<span>(0-普通分类1-底部分类2-其他)</span></div>
							<input type="text" name="type" class="input_box" value="<?php echo (isset($info['type']) && ($info['type'] !== '')?$info['type']:"0"); ?>"/>
							
						</div>
							 <div class="input_title">关键字<span>(大麦理财：填d)</span></div>
							 <input type="text" name="keywords" class="input_box" value=''/>

					</div>
				       <div class="edit_content_tab none">
						   <div class="input_title">排序<span>(越小越靠前)</span></div>
							<input type="text" name="sort" class="input_box" value="<?php echo (isset($info['sort']) && ($info['sort'] !== '')?$info['sort']:""); ?>"/>
							<div class="input_title">列数<span>(列表页显示的文章数量)</span></div>
							<input type="text" name="list_row" class="input_box" value="<?php echo (isset($info['list_row']) && ($info['list_row'] !== '')?$info['list_row']:""); ?>"/>
							<div class="input_title">模板<span>(列表页显示的模板)</span></div>
							<input type="text" name="template_lists" class="input_box" value="<?php echo (isset($info['template_lists']) && ($info['template_lists'] !== '')?$info['template_lists']:""); ?>"/>
							
						</div>
						<div class="btn_group">
						    <input type="hidden" name="id" value="<?php echo (isset($info['id']) && ($info['id'] !== '')?$info['id']:""); ?>">
							<div class="confirm_btn">确认</div>
							<div class="cancel_btn">返回</div>
						</div>
						</form> 
					</div>
				</div>
			</div>
		</div>

     
    <script type="text/javascript">
    $("select[name='pid']").val("<?php echo (isset($info['pid']) && ($info['pid'] !== '')?$info['pid']:'0'); ?>");
	 $("select[name='model_id']").val("<?php echo (isset($info['model_id']) && ($info['model_id'] !== '')?$info['model_id']:'0'); ?>");
    </script>
 <script src="__JS__/edit.js"></script>
<!-- 尾部 -->
		

<script src="__JS__/common.js"></script>

	</body>
</html>
    <!-- 尾部 --> 

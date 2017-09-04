<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:57:"D:\wamp\www\bycms/application/admin\view\index\index.html";i:1501572774;s:59:"D:\wamp\www\bycms/application/admin\view\public\footer.html";i:1501271148;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title><?php echo (isset($meta_title) && ($meta_title !== '')?$meta_title:""); ?>|yershop后台管理</title>
		<link rel="stylesheet" href="__CSS__/index.css" />
	    <link rel="stylesheet" href="__COMMON__/font-awesome/css/font-awesome.min.css">
		<script type="text/javascript" src="__JS__/jquery.min.js" ></script>
	</head>
	<style>



.top{
	width: 100%;
	height: 50px;
	color: #ffffff;
    background-color: <?php echo C('COLOR'); ?>;padding:2px 0;
}
a{color:<?php echo C('COLOR'); ?>;text-decoration:none;cursor: pointer;}

i{font-style:normal}
</style>
	<body>
		<div class="top"  style="margin:0 auto;">
			<div class="logo"></div>
			<ul class="main_links">
			<li><a href="<?php echo url('index/index'); ?>" target="_blank">首页 </a></li>  <?php if(isset($group)): ?>    
                        <!-- 欢迎语 -->
						   <?php if(is_array($group) || $group instanceof \think\Collection || $group instanceof \think\Paginator): $i = 0; $__LIST__ = $group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li><a href="<?php echo get_group_url($vo['id']); ?>"><?php echo (isset($vo['title']) && ($vo['title'] !== '')?$vo['title']:""); ?> </a></li>
							<?php endforeach; endif; else: echo "" ;endif; endif; ?>
			<li><a href="<?php echo site_url(); ?>" target="_blank">前台 </a></li>

			</ul>	
		<div class="user_info">
			<span class="user_info_desc"><span class="user_name cur"><?php echo get_username(); ?></span><span>欢迎你</span></span>
			
				<a href="<?php echo url('login/logout'); ?>">退出</a>
			</div>
		</div>
	<div class="main"style="width:1088px;background:#F2F2F2;margin:20px auto;">
			
	<div class="content" class="trees" style="margin-left: 0px;background:#F2F2F2; min-height:117px;">
			
				<div class="show_info">
					<div class="calc_goods_cate show_info_div left">
						<div class="left_img">
							<div></div>
						</div>
						<div class="right_text">
							<span class="text_title">总分类数</span>
							<span class="num"><?php echo (isset($info['category']) && ($info['category'] !== '')?$info['category']:"0"); ?></span>
						</div>
					</div>
					
					  <div class="imgs_tnums show_info_div left">
						<div class="left_img">
							<div></div>
						</div>
						<div class="right_text">
							<span class="text_title">总图片数</span>
							<span class="num"><?php echo (isset($info['category']) && ($info['category'] !== '')?$info['category']:"0"); ?></span>
						</div>
					</div>
					
					<div class="ads_nums show_info_div left">
						<div class="left_img">
							<div></div>
						</div>
						<div class="right_text">
							<span class="text_title">广告个数</span>
							<span class="num"><?php echo (isset($info['ad']) && ($info['ad'] !== '')?$info['ad']:"0"); ?></span>
						</div>
					</div>
					<div class="goods_quantity show_info_div left">
						<div class="left_img">
							<div></div>
						</div>
						<div class="right_text">
							<span class="text_title">日志个数</span>
							<span class="num"><?php echo (isset($info['log']) && ($info['log'] !== '')?$info['log']:"0"); ?></span>
						</div>
					</div>
					<div class="user_amount show_info_div left">
						<div class="left_img">
							<div></div>
						</div>
						<div class="right_text">
							<span class="text_title">用户量</span>
							<span class="num"><?php echo (isset($info['user']) && ($info['user'] !== '')?$info['user']:"0"); ?></span>
						</div>
					</div>
				</div>
			  
				 
			</div>
		</div>
		<div class="fast" >
		<h4 >快速入口</h4>
		<a href="<?php echo url('config/systems',array('module_id'=>70,'group_id'=>1)); ?>"><i class="fa fa-wrench"></i>系统设置 </a>
		<a href="<?php echo url('ucenter/index',array('module_id'=>78)); ?> ">
		<i class="fa fa-user"></i>用户管理
		</a>
		<a href="<?php echo url('log/index'); ?> ">
		<i class="fa fa-user-plus"></i>操作日志
		</a>
		<a href="<?php echo url('auth/index'); ?> ">
		<i class="fa fa-pencil"></i>权限管理
		</a>
		</div>
		
			<div class="container" style="width:1088px;background:#03a9f42;margin:10px auto;"> 
	<h4 style="padding-left:10px;background:#03a9f4; line-height:37px;height:37px;color:#fff">系统信息</h4>
	<div class="item">

		
			<div class="tit">系统信息</div>
			
							<table>
					<tbody>
					<tr>
						<th>bycms版本</th>
						<td>v1.0</td>
					</tr>
					<tr>
						<th>thinkphp版本</th>
						<td><?php echo THINK_VERSION; ?>
							
						</td>
				
					</tr><tr>
						<th>服务器操作系统</th>
						<td><?php echo PHP_OS; ?></td>
					</tr>
					
					<tr>
						<th>服务器解译引擎</th>
						<td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
					</tr>
					<tr>
						<th>应用部署目录 </th>
												<td><?php echo getcwd(); ?></td>
					</tr>
					<tr>
						<th>上传限制</th>
						<td><?php echo ini_get('upload_max_filesize'); ?></td>
					</tr>
					
				</tbody></table>
	
</div>
<div class="item">
			<div class="tit">软件信息</div>
				<table>
					<tbody>
					<tr>
						<th>软件名称</th>
						<td>贝云cms内容管理系统</td>
					</tr>
					<tr>
						<th>更新时间</th>
						<td>2017-08-01</td>
					</tr>
					
					<tr>
						<th>官方网址</th>
						<td><a href="http://www.yershop.com" target="_blank">yershop.com</a></td>
					</tr>
					<tr>
						<th>商业授权</th>
						<td><a href="http://www.yershop.com/index/index/price.html" target="_blank">授权</a></td>
					</tr>
					<tr>
						<th>版权所有</th>
						<td>武汉贝云网络科技有限公司</td>
					</tr>
					<tr>
						<th>使用帮助</th>
						<td><a href="http://www.yershop.com/index/Develop/index.html" target="_blank">文档</a></td>
					</tr>
				</tbody></table>
			</div>

	</div>

 <!-- 头部 -->
		

<script src="__JS__/common.js"></script>

	</body>
</html>
<!-- 头部 --> 


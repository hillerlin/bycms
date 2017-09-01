<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:57:"D:\wamp\www\bycms/application/index\view/public/error.tpl";i:1504254102;s:59:"D:\wamp\www\bycms/application/index\view\public\header.html";i:1504254102;s:59:"D:\wamp\www\bycms/application/index\view\public\footer.html";i:1504254102;}*/ ?>

<!DOCTYPE html><html>	<head>		<meta charset="utf-8" />		<title><?php echo $meta_title; ?>_<?php echo C('WEB_SITE_TITLE'); ?></title>		<link rel="stylesheet" href="__CSS__/index.css" />  <script type="text/javascript" src="__COMMON__/jquery.min.js"></script>	<meta name="keywords" content="<?php echo C('KEYWORD'); ?>"/>	<meta name="description" content="<?php echo C('DESCRIPTION'); ?>"/>	</head>	<body><div class="topbar">	<div class="header_in">				<div class="fl left_link">					<a class="fs14"  onclick="setHomePage(this,'<?php echo site_url(); ?>');">设为首页</a>					<a class="fs14" onclick="AddFavorite('<?php echo site_url(); ?>', '<?php echo C('WEB_SITE_TITLE'); ?>')">加入收藏</a>				</div>				<script type="text/javascript">function setHomePage(obj,url){  try{    obj.style.behavior='url(#default#homepage)';    obj.setHomePage(url);  }catch(e){    if(window.netscape){     try{       netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");     }catch(e){       alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");     }    }else{    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");    } }}function AddFavorite( url,title) { try {   window.external.addFavorite(url, title); }catch (e) {   try {    window.sidebar.addPanel(title, url, "");  }   catch (e) {     alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请进入新网站后使用Ctrl+D进行添加");   } }}</script>				<div class="fr login_info">						<?php if(is_login()): ?>												<span class="fs14">	您好 <?php echo $UcenterMember['username']; ?>									，欢迎来到					yercms</span><a href="<?php echo url('User/logout'); ?>" class="tc_a">［退出］</a>					<?php else: ?>					<span class="fl">嗨，欢迎使用yercms</span>					<a class="fs14 register" href="<?php echo url('User/register'); ?>">免费注册</a>					<a class="fs14 login"  href="<?php echo url('User/login'); ?>">登录</a>					<?php endif; ?>				</div>			</div></div>		<div class="header in_width">					<div class="title_in">				<a href="<?php echo url('index/index'); ?>"><img src="<?php echo C('LOGO'); ?>" class="logo_img"/></a>				<div class="search_box">					<form method="post" action="<?php echo url('article/search'); ?>" class="search_frm" name="myform">					<div class="search_hot_words">								<a  onclick= "searchkey(this,1)" class="active" href="javascript:void(0);">新闻</a>						<a  onclick= "searchkey(this,2)" href="javascript:void(0);">相册</a>						<a  onclick= "searchkey(this,3)"  href="javascript:void(0);">下载</a>					</div>					<div class="seach_div">						<input type="text" name="keyword" class="search_input"/>					    <input type="hidden" name="model_id" value="1"/>						<span class="search_btn">搜索</span>					</div>					</form>			<script type="text/javascript">		function searchkey(obj,num){		   $(".search_hot_words a").removeClass("active");           $(obj).addClass("active");		   $("input[name='model_id']").val(num);		}		$(".search_btn").click(function(){    		 $(".search_frm").submit();    		    	});		</script>    				</div>			</div>		</div>		<div class="nav">			<ul class="nav_in">				<?php $__LIST__= parseChannel('sort asc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>			<li><a href="<?php echo get_url($vo['url']); ?>" target="<?php echo $vo['target']; ?>"><?php echo $vo['title']; ?></a></li>				<?php endforeach; endif; else: echo "" ;endif; ?>			</ul>		</div> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>跳转提示</title>
    <style type="text/css">
        *{ padding: 0; margin: 0; }
        body{ background: #fff; font-family: "Microsoft Yahei","Helvetica Neue",Helvetica,Arial,sans-serif; color: #333; font-size: 16px; }
        .system-message{ margin:0 auto;padding: 54px 248px; }
        .system-message h1{ font-size: 100px; font-weight: normal; line-height: 120px; margin-bottom: 12px; }
        .system-message .jump{ padding-top: 10px; }
        .system-message .jump a{ color: #333; }
        .system-message .success,.system-message .error{ line-height: 1.8em; font-size: 36px; }
        .system-message .detail{ font-size: 12px; line-height: 20px; margin-top: 12px; display: none; }
    </style>
</head>
<body>
    <div class="system-message">
        <?php switch ($code) {case 1:?>
            <h1>:)</h1>
            <p class="success"><?php echo(strip_tags($msg));?></p>
            <?php break;case 0:?>
            <h1>:(</h1>
            <p class="error"><?php echo(strip_tags($msg));?></p>
            <?php break;} ?>
        <p class="detail"></p>
        <p class="jump">
            页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b>
        </p>
    </div>
    <script type="text/javascript">
        (function(){
            var wait = document.getElementById('wait'),
                href = document.getElementById('href').href;
            var interval = setInterval(function(){
                var time = --wait.innerHTML;
                if(time <= 0) {
                    location.href = href;
                    clearInterval(interval);
                };
            }, 1000);
        })();
    </script>
<div class="footer">
	 <p><?php if(is_array($footer) || $footer instanceof \think\Collection || $footer instanceof \think\Paginator): $k = 0; $__LIST__ = $footer;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?>
			<a href="<?php echo url('about/cate?id='.$vo['id']); ?>"><?php echo $vo['title']; ?></a>  <?php if($k < 4): ?>| <?php endif; endforeach; endif; else: echo "" ;endif; ?></p>
	<p> Powered by <a href="http://www.yershop.com/" style="color:#f30" target="_blank">byCmsV1.0</a>  @yershop 2014-2017 </p>
	</div> 

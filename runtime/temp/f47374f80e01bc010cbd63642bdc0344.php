<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:67:"D:\wamp\www\bycms/application/index\view\model\download_detail.html";i:1500776896;s:59:"D:\wamp\www\bycms/application/index\view\public\header.html";i:1504601806;s:59:"D:\wamp\www\bycms/application/index\view\public\footer.html";i:1504601806;}*/ ?>
<!DOCTYPE html><html><head><meta charset="utf-8" /><title><?php echo $meta_title; ?>_<?php echo C('WEB_SITE_TITLE'); ?></title><link rel="stylesheet" href="__CSS__/main.css" /><link rel="stylesheet" href="__CSS__/public.css" /><script type="text/javascript" src="__COMMON__/jquery.min.js"></script><script type="text/javascript" src="__COMMON__/jquery.cookie.js"></script><meta name="keywords" content="<?php echo C('KEYWORD'); ?>"/><meta name="description" content="<?php echo C('DESCRIPTION'); ?>"/><!--[if lt IE 8]><script language="javascript" type="text/javascript"> //IE8以下版本跳转到浏览器提示页var url=window.location.href;if(url.indexOf("/landing/browser_upgrade")<0 && url.indexOf("/successreturl")<0){window.location.href='/landing/browser_upgrade';}</script><![endif]--><script>$(function(){   $("#mobileapp").mouseenter(function(){    $(this).children("img").stop().show().animate({opacity:1},300);    $(".gt").addClass("current");  }).mouseleave(function(){    $(this).children("img").stop().animate({opacity:0},300).hide();    $(".gt").removeClass("current");  });  //活动弹窗关闭  //floatBox();  $(".fb-cont i").on("click",function () {        $.cookie("floatBox",'ban',{ expires:1});//1天    $(".floatBox").remove();  });  $(".fb-cont .toBtn").on("click",function () {        $.cookie("floatBox",'ban',{ expires:1});//1天    $(".floatBox").remove();  });    if($.cookie("floatBox") == 'ban'){      $(".floatBox").remove();    };  loadLoginReg();});function loadLoginReg(){  var csrf = $("input[name=_csrf-dmlc]").val();  $.ajax({    type:"post",    cache:false,    async:true,    url: "",    data: {'_csrf-dmlc':csrf},    dataType: "json",    success: function(data){     if(data.statusCode != 0){                 var html = '<a href="/login/index" class="logn bgts">登 录</a>'+                     '<a href="/register/index" class="reg bgts">注 册</a>';       $("#logn_reg").html(html);        var html1 = '<div class="insidebox ftwhite">'+        '<p class="ct ft18 text">历史年化利率</p><p class="yearrate ftbd ct">11%</p>'+        '<p class="ct lh30">注册送 <span class="ft18 ft-f39700">10,000元</span> 体验金</p>'+        '<p class="ct lh30">再送 <span class="ft18 ft-f39700">388元</span> 红包</p>'+        '<a class="login-btn" href="/register/index">立即领取</a>'+        '</div>';      $("#slidebox").prepend(html1);      }else{                  data = data.content;              var img = 'mail_1.png';              if(data.msg_count){                img = 'mail_news.png';              }              var html = '<a href="/home/index" class="usercenter focus">我的账户</a>'              $(".head-right").append('<div class="welcome">欢迎您，<span class="overfonthide">'+data.auser+                '</span><a href="/login/logout" class="quit">[ 退出 ]</a></div>');              $("#logn_reg").html(html);        var html1 = '<div class="insidebox ftwhite">'+          '<div class="logintitle ft18">'+hello()+'！<span>'+data.auser+'</span></div>'+          '<p class="lh30 ft16 ct">帐户总额 ('+formatNumber(data.total,2)+' 元)</p><div class="bk10"></div>'+          '<p class="lh30 ft16 ct">可用余额 ('+formatNumber(data.use_money,2)+' 元)</p><div class="bk15"></div><div class="bk15"></div>'+          '<a class="login-btn" href="/home/index">进入我的账户</a></div>';       $("#slidebox").prepend(html1);       //登录后活动弹窗-是否开通存管      if(!data.accountId){                floatBox();      }     }    },error:function(XMLHttpRequest, textStatus, errorThrown){      var html = '<a href="/login/index" class="logn bgts"><i></i>登录</a>'+          '<a href="/register/index" class="reg bgts">注册</a>';       $("#logn_reg").html(html);      var html1 = '<div class="insidebox ftwhite">'+        '<p class="ct ft18 text">历史年化利率</p><p class="yearrate ftbd ct">11%</p>'+        '<p class="ct lh30">注册送 <span class="ft18 ft-f39700">10,000元</span> 体验金</p>'+        '<p class="ct lh30">再送 <span class="ft18 ft-f39700">388元</span> 红包</p>'+        '<a class="login-btn" href="/register/index">立即领取</a>'+        '</div>';      $("#slidebox").prepend(html1);      }  });}function hello(){  var d=new Date();  var h=d.getHours();  if(h<12){    return "上午好";  }else if(h<18){    return "下午好";  }else if(h<=23){    return "晚上好";  }}function floatBox(){  /*活动不显示底部浮窗*/  if ($(".footbanner").length > 0){    $(".footbanner").remove();    $.cookie("footbanner",'ban',{ expires:1});  }  /*活动弹窗*/    $(".floatBox").fadeIn();  /*var myDate = new Date();  var endTime = new Date(2017,2,8);//月份从0开始，2为3月  if(myDate.getTime() < endTime.getTime()) {    $(".floatBox").fadeIn();  };*/}</script></head><body><div id='header'>  <div class="mcenter clear">    <div class="head-left fl">      <span class="fl"><b>欢迎致电：400-0822-188</b><b>服务时间：8:30 - 18:30</b></span>    </div>    <div class="head-right fr">      <a href="/about/damaiapp" target="_blank" id="mobileapp">            移动端&nbsp;<span class="gt"></span>            <img src="http://cdn1.damailicai.com/pc/img/index/wei_app_300.png" alt="移动端触屏版" width="160" height="160" style="background: #fff;"/></a>          <a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000822188&f=1&ty=1&aty=0&a=&from=6" target="_blank">在线客服</a>          <a href="/help/">帮助中心</a>          <a href="/about/newguide">新手指引</a>          <a href="https://bbs.damailicai.com" target="_blank">社区</a>    </div>  </div></div><div class="headcont clear">  <div class="head_01 clear">     <h1 class="head_logo fl">      <a href="/" title="大麦理财-国资理财平台"><img src="http://cdn1.damailicai.com/pc/img/index/logo.png" width="330" height="48" alt="大麦理财-国资+上市双重背景" /></a>    </h1>    <div id="logn_reg"></div>    <ul class="head_menu_nav">      <li class="home"><a href="/" class="focus" target="_blank">首页</a></li>      <li><a href="/product/" target="_blank">我要理财</a></li>      <li><a href="/about/security/" target="_blank">安全保障</a></li>      <li><a href="/about/" target="_blank">关于我们</a></li>    </ul>  </div></div> 
		<div class="nav_bar in_width">
			<a href="<?php echo url('index/index'); ?>">首页</a>
			<span>&gt;</span>
				<?php foreach($pid as $vo): ?>  
			<a href="<?php echo url('article/lists?id='.$vo); ?>"><?php echo get_category_title($vo); ?></a><span>&gt;</span>
		<?php endforeach; ?>
		
		<a href="<?php echo url('article/lists?id='.$info['category_id']); ?>"><?php echo get_category_title($info['category_id']); ?></a><span>&gt;</span>
			
			
			<span><?php echo $info['title']; ?></span>
		</div>
		<div class="content">
			<div class="content_in in_width">
				<div class="fl main_left">
					<div class="down_content">
						<div class="ac_in_width down_title"><?php echo $info['title']; ?></div>
     <table>
       <tr>
          <th>授权形式：</th>
          <td><?php echo (isset($info['authorize']) && ($info['authorize'] !== '')?$info['authorize']:''); ?></td>
          <td  class="thumb" rowspan="7" align="center" >  
		  <img src="<?php echo get_cover_path($info['cover_id']); ?>">
		  </td>
        </tr>
        <tr>
          <th>更新时间：</th>
          <td><?php echo time_format($info['update_time']); ?></td>
        </tr>
        <tr>
          <th>软件语言：</th>
          <td><?php echo (isset($info['language']) && ($info['language'] !== '')?$info['language']:''); ?></td>
        </tr>
        <tr>
          <th>软件平台：</th>
          <td><?php echo (isset($info['platform']) && ($info['platform'] !== '')?$info['platform']:''); ?></td>
        </tr>
        <tr>
          <th>软件类别：</th>
          <td><?php echo (isset($info['type']) && ($info['type'] !== '')?$info['type']:''); ?> </td>
        </tr>
        <tr>
          <th>文件大小：</th>
          <td> <?php echo (isset($info['suze']) && ($info['suze'] !== '')?$info['suze']:'unknow'); ?></td>
        </tr>
        <tr>
          <th>评论等级：</th>
          <td class="c_orange"> <?php echo (isset($info['level']) && ($info['level'] !== '')?$info['level']:''); ?></td>
        </tr>
<tr>
          <th>浏览次数：</th>
          <td colspan="2"><span id="hits"><?php echo (isset($info['view']) && ($info['view'] !== '')?$info['view']:''); ?></td>
        </tr>
      </table>

						
						<div class="article_p">
							<?php echo $info['content']; ?>

							</div>
							<p></p>
	                       <div class="down_addr">
							 <h3>下载地址</h3>
							 <span>>	<a href="<?php echo (isset($info['url']) && ($info['url'] !== '')?$info['url']:''); ?>">点此下载</a></span>
							</div>

					</div>
					<div class="ac_in_width article_comment">
						<div class="article_comment_title">新闻评论</div>
						<div class="article_comment_div ac_in_width">
							<div class="article_comment_user fl">
								<img src="__IMG__/user_icon.png"/>
								<span class="article_comment_user_name">匿名</span>
							</div>
							<div class="article_comment_box fl">
								<i class="input_arrow"></i>
								<textarea class="article_comment_input" placeholder="您的观点仅代表您本人，请文明发言，严禁散播谣言和诽谤他人"></textarea>
								<div class="article_comment_tips">
								<?php if(is_login() == 0): ?>
								<a href="<?php echo url('user/login'); ?>">登录</a>
								<a href="<?php echo url('user/register'); ?>;">注册</a>
								<?php endif; ?>
								</div>
								<div class="article_comment_btn">
									<span class="article_comment_tip_span">Ctrl+Enter快捷提交</span>
									<span class="article_comment_submit" onclick="submit()">马上发表</span>
								</div>
							</div>
						</div>
					</div>
					<div class="ac_in_width article_comment_list">
						<div class="article_comment_title">最新评论<span class="act_span1">(评论<span class="comment_nums"><?php echo $res["count"]; ?></span>条  <a href="javascript:void(0);">查看全部&gt;&gt;</a>)</span></div>
					<?php if(is_array($res['list']) || $res['list'] instanceof \think\Collection || $res['list'] instanceof \think\Paginator): $i = 0; $__LIST__ = $res['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>  
				  <div class="article_comment_item ac_in_width">
					    	<div class="fl comment_item_user_warpper">
					    		<img src="__IMG__/user_icon.png"/>
					    	</div>
					    	<div class="comment_item_content_div">
					    		<div class="cicd_title">
					    			<span class="cicd_username fl"><?php echo get_username($vo['uid']); ?></span>
					    			<span class="cicd_place fl"></span>
					    			<span class="cicd_time fr"><?php echo date("Y-m-d h:i",$vo['create_time']); ?>发表</span>
					    		</div>
					    		<div class="cicd_content">
								 <?php if($vo['pid'] > 0): ?>
								 @<?php echo get_comment($vo['pid'],"content"); endif; ?><p>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $vo['content']; ?></p>
					    		</div>
					    		<div class="cicd_opr">
					    			<div class="fr">
						    			<a onclick="ding(<?php echo $vo['id']; ?>)" class="cicd_opr_ding">顶<span>(<?php echo $vo['zan']; ?>)</span></a>
						    			<a onclick="reply(this,<?php echo $vo['id']; ?>)" class="reply_btn">回复</a>
						    			
					    			</div>
					    		</div>
					    	</div>
					    	<div class="clear"></div>
					    </div>
						<?php endforeach; endif; else: echo "" ;endif; ?>
						<?php echo $res['page']; ?>
					
					    <div class="ac_in_width reply_div none">
					    	<div class="article_reply_user fl">
								<img src="__IMG__/user_icon.png"/>
								<span class="article_reply_user_name">匿名</span>
							</div>
							<div class="article_reply_box fl">
								<i class="input_arrow"></i>
								<input name="c_id" type="hidden">
								<textarea class="article_reply_input" placeholder="您的观点仅代表您本人，请文明发言，严禁散播谣言和诽谤他人"></textarea>
								<div class="article_comment_tips">
								<?php if(is_login() == 0): ?>
								<a href="<?php echo url('user/login'); ?>">登录</a>
								<a href="<?php echo url('user/register'); ?>;">注册</a>
								<?php endif; ?>
								
								</div>
								<div class="article_comment_btn">
									<span class="article_comment_tip_span">Ctrl+Enter快捷提交</span>
									<span class="article_comment_submit" onclick="comment(this)">马上发表</span>
								</div>
							</div>
					    </div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="fl content_right">
					<div class="cate_div">
						<div class="cate_p">子分类</div>
						<div class="cate_c">国内</div>
					</div>
					<div class="rank_div">
						<div class="rank_title black_color">点击排行
						
						</div>
						<ul class="rank_list">
						  <?php $__LIST__= parseRead(3,'view desc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			      <li><a href="<?php echo url('article/detail?id='.$vo['id']); ?>"><span><?php echo $i; ?>.</span><?php echo substr_cn($vo['title'],"29"); ?>    </a>
				   </li>
				 
		         <?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</div>
					<div class="ad_img1">
					  <?php $__LIST__= parseAd(2); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
             		 <a href="<?php echo get_url($vo['url']); ?>" class="1"> 
					 <img src="<?php echo get_cover_path($vo['cover_id']); ?>"></a>
		             <?php endforeach; endif; else: echo "" ;endif; ?>
					</div>
					<div class="latest_posts">
						<div class="latest_posts_title">最新发布</div>
						<ul class="latest_posts_list">
				      <?php $__LIST__= parseRead(3,'id desc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			      <li><a href="<?php echo url('article/detail?id='.$vo['id']); ?>"><span><?php echo $i; ?>.</span><?php echo substr_cn($vo['title'],"29"); ?>    </a>
				   </li>
				 
		              <?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div id="foot" class="clear">
  <div class="bk20"></div>
  <div class="foottop mcenter clear">
    <div class="foothelp fl clear">
      <dl>
        <dt><a href="/about" target="_blank">关于我们</a></dt>
        <dd><a href="/about" target="_blank">公司介绍</a></dd>
        <dd><a href="/about/notice" target="_blank">平台公告</a></dd>
        <dd><a href="/about/damaihistory" target="_blank">发展历程</a></dd>
        <dd><a href="/about/contactus" target="_blank">联系我们</a></dd></dl>
      <dl>
        <dt><a href="/about" target="_blank">平台优势 </a></dt>
          <dd><a href="/about/factoring" target="_blank">商业保理</a></dd>
          <dd><a href="/about" target="_blank">平台背景</a></dd>
          <dd><a href="/about/security" target="_blank">安全保障</a></dd></dl>
      <dl>
        <dt><a href="/about/security" target="_blank">安全保障 </a></dt>
        <dd><a href="/help/safecenter#help-safe" target="_blank">投资安全</a></dd>
        <dd><a href="/help/safecenter#help-risk" target="_blank">风险控制</a></dd>
        <dd><a href="/help/safecenter#help-infosafe" target="_blank">信息安全</a></dd>
        <dd><a href="/help/safecenter#help-secret" target="_blank">隐私保密</a></dd></dl>
      <dl>
        <dt><a href="/help" target="_blank">帮助中心 </a></dt>
        <dd><a href="/home/recommend" target="_blank">推荐好友</a></dd>
        <dd><a href="/help/welfare#help-red" target="_blank">红包使用</a></dd>
        <dd><a href="/help/welfare#help-coupon" target="_blank">加息券使用</a></dd>
        <dd><a href="/help/recharge#help-withdrawals" target="_blank">如何提现</a></dd>
        <dd><a href="/help/recharge#help-cost" target="_blank">平台费用</a></dd></dl>
    </div>
    <div class="appbox fl">
      <div>
        <i class="iapp"></i>
        <p class="ct">微信理财</p>
      </div>
      <div>
        <i class="iwap"></i>
        <p class="ct">APP下载</p>
      </div>
    </div>
    <div class="footservice fr" style="width:250px;">
    <p class="foottit" style="line-height: 22px;">服务热线：<span class="foottel"></span></p>
    <p class="foottel">400-0822-188</p>
    <!-- <p class="foottime">（工作日 08:30-18:30）</p> -->
    <p class="foottit" style="line-height: 22px;">商务合作邮箱：<a href="mailto:ad@damailicai.com" class="ftwhite">ad@damailicai.com</a></p>
    <p class="foottit" style="line-height: 22px;">媒体合作邮箱：<a href="mailto:pr@damailicai.com" class="ftwhite">pr@damailicai.com</a></p>
    <div class="footicons">
      <a href="http://weibo.com/u/5192580984" target="_blank" title="新浪微博" class="sina"></a>
      <a href="javascript:void(0)" onclick="openWeixin()" title="微信" class="weixin"></a>
      <a href="http://t.qq.com/atrmoney" target="_blank" title="腾讯微博" class="tengxun"></a>
      <a href="https://bbs.damailicai.com" target="_blank" title="社区" class="bbs"></a>
      <a href="mailto:ad@damailicai.com" target="_blank" title="商务邮箱" class="email"></a>
    </div>
    </div>
  </div>
  <div class="footbottom">
      <div class="dcenter">
        <div class="links">
          <span><a href="/home/single/info/friendlink" target="_blank">友情链接：</a></span>
          <a href="">国投资本</a>
          <a href="">国投资本</a>
          <a href="">国投资本</a>
        </div>
          <p>Copyright 2014-2017 www.damailicai.com | 深圳大麦理财互联网金融服务有限公司 | <a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备14047000号</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://m.damailicai.com">切换至手机版</a></p> 
          <p>市场有风险，投资需谨慎，营造合法、诚信的借贷环境</p>
          <div class="footlink clear"> 
            <a class="cp1" href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" title="ICP备案查询" rel="nofollow" target="_blank"></a>
            <a class="cp4" href="http://sz.ebs.org.cn/" title="工商网监" rel="nofollow" target="_blank"></a>
            <a class="cp5" href="http://www.anquan.org/authenticate/cert/?site=www.damailicai.com&at=business" title="安全联盟行业验证" rel="nofollow" target="_blank"></a>
          </div>
      </div>
  </div>
</div>
<?php if(time()<strtotime('2017-2-22')){ ?>
<div class="footbanner">
  <div style="width:100%;height:115px;position:fixed;bottom:0;left:0;"></div>
  <a href="/home/party/lanternFestival.html?soure=party&cid=cpc-outlink-feb1_db" class="fbBtn" title="麦粉专属聚惠，元宵返现嘉年华!" target="_blank"></a>
  <a href="javascript:;" class="closeBanner" title="点击我关闭">×</a>
</div>
<?php } ?>
<!--sidebar-->
<div id="customer">
<?php if(time()<strtotime('2017-10-01')&&time()>strtotime('2017-09-01')){ ?>
  <div class="floatbox"
       style="width:150px;height:180px;background:url(http://cdn1.damailicai.com/pc/img/index/September.png) no-repeat;top:-185px;left:-52px;">
      <span class="close_btn" title="点击我关闭" style="right:-24px;top:-40px;">×</span>
      <a href="https://bbs.damailicai.com/thread-2153-1-1.html" title="9月寿星领红包" target="_blank" style="height:180px;"></a>
  </div>
<?php }else{ ?>
  <div class="floatbox">
      <span class="close_btn" title="点击我关闭">×</span>
      <a href="/activity/raffle" title="玩转麦田每日抽奖" target="_blank"></a>
  </div>
<?php } ?>
  <a href="javascript:void(0)" class="twocode"><span class="dn"></span></a>
  <a href="/about/profitcalc" target="_blank" class="counter"></a>
  <a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000822188&f=1&ty=1&aty=0&a=&from=6" target="_blank" class="cussvconline"></a>
  <a href="javascript:void(0)" class="totop"></a>
</div>
<script type="text/javascript">
function openWeixin(){
  art.dialog({
    padding:0,
    title:"微信扫一扫",
    content:"<img src='http://cdn1.damailicai.com/pc/img/index/weixin-pop.png' />",
    lock:true
  }); 
}
function getOs(){
   if(navigator.userAgent.indexOf("MSIE")>0) {  
        return "MSIE";  
   }  
   if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){  
        return "Firefox";  
   }  
   if(isSafari=navigator.userAgent.indexOf("Safari")>0) {  
        return "Safari";  
   }   
   if(isCamino=navigator.userAgent.indexOf("Camino")>0){  
        return "Camino";  
   }  
   if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0){  
        return "Gecko";  
   }  

}  
$(function(){
    $(".close_btn").on("click",function(){
      $(".floatbox").remove();
      $.cookie("isFloat",'hide',{ expires:1});//1天
      //$.cookie("isFloat",'hide',{ expires:1/8640});//测试10秒
    });
    if($.cookie("isFloat") == 'hide'){
      $(".floatbox").remove();
    }

    $(".closeBanner").on("click",function(){
      $(".footbanner").remove();
      $.cookie("isFootbanner",'ban',{ expires:1});//1天
    });
    if($.cookie("isFootbanner") == 'ban'){
      $(".footbanner").remove();
    }else{
      $(".footbanner").show();
    }

    $("#customer .twocode").hover(function(){
        $(this).children("span").fadeIn(300);
    },function(){
       $(this).children("span").hide();
    });
    $("#customer .totop").on("click",function(){
       $("html,body").animate({scrollTop:0},500);
    });
    $(window).scroll(function(){
       winTop();
    });
    function winTop(){
        if($(window).scrollTop()<100){
          $("#customer .totop").hide();
        }else{
          $("#customer .totop").show();
        }  
    }
    winTop();
    $("#customer a").mouseenter(function(){
      if(getOs()=="MSIE"){
        $(this).stop().animate({"backgroundPositionX":-2+"px"},300);
      }else{
        var y = getY(this);
        $(this).stop().animate({"backgroundPosition":"-2 "+y},300);
      }
    }).mouseleave(function(){
       if(getOs()=="MSIE"){
        $(this).stop().animate({"backgroundPositionX":-50+"px"},300);
      }else{
        var y = getY(this);
        $(this).stop().animate({"backgroundPosition":"-50px "+y},300);
      }
    });

    function getY(ele){
      var y = $(ele).css("backgroundPosition");
      return y.split(" ")[1];
    }
});  

(function($) {
  $.extend($.fx.step,{
      backgroundPosition: function(fx) {
          if (fx.state === 0 && typeof fx.end == 'string') {
              var start = $.curCSS(fx.elem,'backgroundPosition');
              start = toArray(start);
              fx.start = [start[0],start[2]];
              var end = toArray(fx.end);
              fx.end = [end[0],end[2]];
              fx.unit = [end[1],end[3]];
          }
          var nowPosX = [];
          nowPosX[0] = ((fx.end[0] - fx.start[0]) * fx.pos) + fx.start[0] + fx.unit[0];
          nowPosX[1] = ((fx.end[1] - fx.start[1]) * fx.pos) + fx.start[1] + fx.unit[1];
          fx.elem.style.backgroundPosition = nowPosX[0]+' '+nowPosX[1];

         function toArray(strg){
             strg = strg.replace(/left|top/g,'0px');
             strg = strg.replace(/right|bottom/g,'100%');
             strg = strg.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
             var res = strg.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
             return [parseFloat(res[1],10),res[2],parseFloat(res[3],10),res[4]];
         }
      }
  });
})(jQuery);
</script>
<div class="dn">
<script>
/*baidu*/
var _hmt = _hmt || [];
(function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?654181c15ffc897e695711ba20c91113";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();
</script>
<script>
/*腾讯移动分析*/
var _mtac = {"senseQuery":1};
(function() {
var mta = document.createElement("script");   
mta.src = "https://pingjs.qq.com/h5/stats.js?v2.0.4";
mta.setAttribute("name", "MTAH5");   
mta.setAttribute("sid", "500494265");
mta.setAttribute("cid", "500494266");
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(mta, s);
})();
</script>
</div>
		
		<div class="mask none">
			<div class="alert_success alert_div">
				<div class="alert_header">提示</div>
				<div class="alert_content"><i></i><span class="success">评论成功<span></div>
				<div class="alert_btn">确定</div>
				<span class="alert_close"></span>
			</div>
		</div>
		<div class="mask none">
			<div class="alert_error alert_div">
				<div class="alert_header">提示</div>
				<div class="alert_content"><i></i><span class="error">评论失败<span></div>
				<div class="alert_btn">确定</div>
				<span class="alert_close"></span>
			</div>
		</div>
		<script>
		   function comment(obj){
			     
				var c_id=$(obj).parents(".reply_div").find("input").val();
				var content=$(obj).parents(".reply_div").find("textarea").val();
				  var id="<?php echo $info['id']; ?>";
			      var url="<?php echo url('Comment/reply'); ?>"
		         $.post(url,{doc_id:id,content:content,pid:c_id},function(data){
                  if(data.code){
			        opensuccess(data);
		          }else{
		            openerror(data);
		         }
              });
			}
			 function reply(obj,c_id){
			     if($(obj).parents(".article_comment_item").first().find(".reply_div").length != 0){
						$(obj).parents(".article_comment_item").first().find(".reply_div").removeClass("none");
						return false;
					}
					$("input[name='c_id']").val(c_id);
					var clone = $(".article_comment_list .article_comment_title").siblings(".reply_div").clone();
					clone.removeClass("none");
					$(obj).parents(".comment_item_content_div").first().after(clone);
			}
			$(".mask .alert_div .alert_close").click(function(){
			    $(this).parents(".mask").addClass("none");
			});
			$(".mask .alert_div .alert_btn").click(function(){
			    $(this).parents(".mask").addClass("none");
			});
			$(".article_comment_submit").click(function(){
				openerror();
			})
			function opensuccess(data){
				$(".success").text(data.msg);
				$(".alert_success").parents(".mask").removeClass("none");
				 setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }
             },1500);
			}
			function openerror(data){
			    $(".error").text(data.msg);
				$(".alert_error").parents(".mask").removeClass("none");
			}
			function submit(){
			   var content=$(".article_comment_input").val();
			   var id="<?php echo $info['id']; ?>";
			   var url="<?php echo url('Comment/add'); ?>"
		       $.post(url,{doc_id:id,content:content},function(data){
                  if(data.code){
			        opensuccess(data);
		          }else{
		            openerror(data);
		         }
              });
		}
		function ding(id){
			  
			   var url="<?php echo url('Comment/update'); ?>"
		       $.post(url,{id:id},function(data){
                if(data.code){
			        opensuccess(data);
		       }else{
		            openerror(data);
		       }
              });
		}

		</script>
	</body>
</html>

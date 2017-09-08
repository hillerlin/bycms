<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"E:\workspace\bycms/application/index\view\model\document_list.html";i:1504836155;s:60:"E:\workspace\bycms/application/index\view\public\header.html";i:1504516971;s:60:"E:\workspace\bycms/application/index\view\public\footer.html";i:1504516707;}*/ ?>
<!DOCTYPE html><html><head><meta charset="utf-8" /><title><?php echo $meta_title; ?>_<?php echo C('WEB_SITE_TITLE'); ?></title><link rel="stylesheet" href="__CSS__/main.css" /><link rel="stylesheet" href="__CSS__/public.css" /><script type="text/javascript" src="__COMMON__/jquery.min.js"></script><script type="text/javascript" src="__COMMON__/jquery.cookie.js"></script><meta name="keywords" content="<?php echo C('KEYWORD'); ?>"/><meta name="description" content="<?php echo C('DESCRIPTION'); ?>"/><!--[if lt IE 8]><script language="javascript" type="text/javascript"> //IE8以下版本跳转到浏览器提示页var url=window.location.href;if(url.indexOf("/landing/browser_upgrade")<0 && url.indexOf("/successreturl")<0){window.location.href='/landing/browser_upgrade';}</script><![endif]--><script>$(function(){   $("#mobileapp").mouseenter(function(){    $(this).children("img").stop().show().animate({opacity:1},300);    $(".gt").addClass("current");  }).mouseleave(function(){    $(this).children("img").stop().animate({opacity:0},300).hide();    $(".gt").removeClass("current");  });  //活动弹窗关闭  //floatBox();  $(".fb-cont i").on("click",function () {        $.cookie("floatBox",'ban',{ expires:1});//1天    $(".floatBox").remove();  });  $(".fb-cont .toBtn").on("click",function () {        $.cookie("floatBox",'ban',{ expires:1});//1天    $(".floatBox").remove();  });    if($.cookie("floatBox") == 'ban'){      $(".floatBox").remove();    };  loadLoginReg();});function loadLoginReg(){  var csrf = $("input[name=_csrf-dmlc]").val();  $.ajax({    type:"post",    cache:false,    async:true,    url: "",    data: {'_csrf-dmlc':csrf},    dataType: "json",    success: function(data){     if(data.statusCode != 0){                 var html = '<a href="/login/index" class="logn bgts">登 录</a>'+                     '<a href="/register/index" class="reg bgts">注 册</a>';       $("#logn_reg").html(html);        var html1 = '<div class="insidebox ftwhite">'+        '<p class="ct ft18 text">历史年化利率</p><p class="yearrate ftbd ct">11%</p>'+        '<p class="ct lh30">注册送 <span class="ft18 ft-f39700">10,000元</span> 体验金</p>'+        '<p class="ct lh30">再送 <span class="ft18 ft-f39700">388元</span> 红包</p>'+        '<a class="login-btn" href="/register/index">立即领取</a>'+        '</div>';      $("#slidebox").prepend(html1);      }else{                  data = data.content;              var img = 'mail_1.png';              if(data.msg_count){                img = 'mail_news.png';              }              var html = '<a href="/home/index" class="usercenter focus">我的账户</a>'              $(".head-right").append('<div class="welcome">欢迎您，<span class="overfonthide">'+data.auser+                '</span><a href="/login/logout" class="quit">[ 退出 ]</a></div>');              $("#logn_reg").html(html);        var html1 = '<div class="insidebox ftwhite">'+          '<div class="logintitle ft18">'+hello()+'！<span>'+data.auser+'</span></div>'+          '<p class="lh30 ft16 ct">帐户总额 ('+formatNumber(data.total,2)+' 元)</p><div class="bk10"></div>'+          '<p class="lh30 ft16 ct">可用余额 ('+formatNumber(data.use_money,2)+' 元)</p><div class="bk15"></div><div class="bk15"></div>'+          '<a class="login-btn" href="/home/index">进入我的账户</a></div>';       $("#slidebox").prepend(html1);       //登录后活动弹窗-是否开通存管      if(!data.accountId){                floatBox();      }     }    },error:function(XMLHttpRequest, textStatus, errorThrown){      var html = '<a href="/login/index" class="logn bgts"><i></i>登录</a>'+          '<a href="/register/index" class="reg bgts">注册</a>';       $("#logn_reg").html(html);      var html1 = '<div class="insidebox ftwhite">'+        '<p class="ct ft18 text">历史年化利率</p><p class="yearrate ftbd ct">11%</p>'+        '<p class="ct lh30">注册送 <span class="ft18 ft-f39700">10,000元</span> 体验金</p>'+        '<p class="ct lh30">再送 <span class="ft18 ft-f39700">388元</span> 红包</p>'+        '<a class="login-btn" href="/register/index">立即领取</a>'+        '</div>';      $("#slidebox").prepend(html1);      }  });}function hello(){  var d=new Date();  var h=d.getHours();  if(h<12){    return "上午好";  }else if(h<18){    return "下午好";  }else if(h<=23){    return "晚上好";  }}function floatBox(){  /*活动不显示底部浮窗*/  if ($(".footbanner").length > 0){    $(".footbanner").remove();    $.cookie("footbanner",'ban',{ expires:1});  }  /*活动弹窗*/    $(".floatBox").fadeIn();  /*var myDate = new Date();  var endTime = new Date(2017,2,8);//月份从0开始，2为3月  if(myDate.getTime() < endTime.getTime()) {    $(".floatBox").fadeIn();  };*/}</script></head><body><div id='header'>  <div class="mcenter clear">    <div class="head-left fl">      <span class="fl"><b>欢迎致电：400-0822-188</b><b>服务时间：8:30 - 18:30</b></span>    </div>    <div class="head-right fr">      <a href="/about/damaiapp" target="_blank" id="mobileapp">            移动端&nbsp;<span class="gt"></span>            <img src="http://cdn1.damailicai.com/pc/img/index/wei_app_300.png" alt="移动端触屏版" width="160" height="160" style="background: #fff;"/></a>          <a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4000822188&f=1&ty=1&aty=0&a=&from=6" target="_blank">在线客服</a>          <a href="/help/">帮助中心</a>          <a href="/about/newguide">新手指引</a>          <a href="https://bbs.damailicai.com" target="_blank">社区</a>    </div>  </div></div><div class="headcont clear">  <div class="head_01 clear">     <h1 class="head_logo fl">      <a href="/" title="大麦理财-国资理财平台"><img src="http://cdn1.damailicai.com/pc/img/index/logo.png" width="330" height="48" alt="大麦理财-国资+上市双重背景" /></a>    </h1>    <div id="logn_reg"></div>    <ul class="head_menu_nav">      <li class="home"><a href="/" class="focus" target="_blank">首页</a></li>      <li><a href="/product/" target="_blank">我要理财</a></li>      <li><a href="/about/security/" target="_blank">安全保障</a></li>      <li><a href="/about/" target="_blank">关于我们</a></li>    </ul>  </div></div>
<link rel="stylesheet" href="__CSS__/list.css" />
<div class="bk20"></div>
<div class="mcenter clear">
  <div class="list_left fl">
    <div class="nav">当前位置：<a href="">大麦理财</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="">资讯中心</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="">行业资讯</a></div>
    <div class="list_main">
      <div class="list_about">
        <span class="title ft16">行业资讯</span>
        <span class="text ft12">行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯行业资讯</span>
      </div>
      <div class="news_top clear">
        <div class="news_box fl">
          <img src="http://cdn1.damailicai.com/news/04.png" width="360" height="240" alt="">
          <h2>新闻标题新闻标题新闻标题新闻标题新闻标题新闻标题</h2>
          <p>新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要</p>
          <div class="marks">
            <span>2017-09-05</span>
            <a href="" target="_blank">行业新闻</a>
            <label>标签：</label>
            <a href="" target="_blank">大麦理财</a>
          </div>
        </div>
        <div class="news_box fr">
          <img src="http://cdn1.damailicai.com/news/04.png" width="360" height="240" alt="">
          <h2>新闻标题新闻标题新闻标题新闻标题新闻标题新闻标题</h2>
          <p>新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要</p>
          <div class="marks">
            <span>2017-09-05</span>
            <a href="" target="_blank">行业新闻</a>
            <label>标签：</label>
            <a href="" target="_blank">大麦理财</a>
          </div>
        </div>
      </div>
      <ul class="news_list">
        <li>
          <h2>新闻标题</h2>
          <p>新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要</p>
          <div class="marks">
            <span>2017-09-05</span>
            <a href="" target="_blank">行业新闻</a>
            <label>标签：</label>
            <a href="" target="_blank">大麦理财</a>
          </div>
        </li>
        <li>
          <h2>新闻标题</h2>
          <p>新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要</p>
          <div class="marks">
            <span>2017-09-05</span>
            <a href="" target="_blank">行业新闻</a>
            <label>标签：</label>
            <a href="" target="_blank">大麦理财</a>
          </div>
        </li>
        <li>
          <h2>新闻标题</h2>
          <p>新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要</p>
          <div class="marks">
            <span>2017-09-05</span>
            <a href="" target="_blank">行业新闻</a>
            <label>标签：</label>
            <a href="" target="_blank">大麦理财</a>
          </div>
        </li>
      </ul>
    </div>
    <div class="pageBox"></div>
    <div class="related clear">
      <div class="fl">
        <h2>行业资讯相关文章</h2>
        <ul>
          <li><a href="" target="_blank"><span class="fl">新闻标题新闻标题新闻标题新闻标题新闻标题新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
        </ul>
      </div>
      <div class="fr">
        <h2>行业资讯相关问答</h2>
        <ul>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
          <li><a href="" target="_blank"><span class="fl">新闻标题</span><span class="fr">2017-09-05</span></a></li>
        </ul>
      </div>
    </div>
    <div class="related_mark">
      <h2>行业资讯相关标签</h2>
      <ul class="clear">
        <li><a href="" target="_blank">金融</a></li>
        <li><a href="" target="_blank">互联网金融</a></li>
        <li><a href="" target="_blank">理财</a></li>
        <li><a href="" target="_blank">大麦理财</a></li>
        <li><a href="" target="_blank">投资理财</a></li>
        <li><a href="" target="_blank">投资</a></li>
        <li><a href="" target="_blank">互金平台</a></li>
        <li><a href="" target="_blank">理财平台</a></li>
        <li><a href="" target="_blank">投资</a></li>
        <li><a href="" target="_blank">投资理财</a></li>
        <li><a href="" target="_blank">互金平台</a></li>
        <li><a href="" target="_blank">理财平台</a></li>
      </ul>
    </div>
  </div>
  <div class="list_right fr">
    <div class="demo_box">
      <p class="ct ft24 text">历史年化利率</p>
      <p class="yearrate ct">11%</p>
      <p class="ct lh30 ft20">注册送 <span class="ft20 ft-f39700">10,000元</span> 体验金</p>
      <p class="ct lh30 ft20">再送 <span class="ft20 ft-f39700">388元</span> 红包</p>
      <a class="login_btn" href="/register/index">立即领取</a>
    </div>
    <div class="hot_news">
      <h2>热门文章</h2>
      <div class="hot_top">
        <h3>新闻标题</h3>
        <p>新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要新闻摘要</p>
      </div>
      <ul>
        <li><a href="" target="_blank">新闻标题新闻标题新闻标题新闻标题新闻标题</a></li>
        <li><a href="" target="_blank">新闻标题</a></li>
        <li><a href="" target="_blank">新闻标题</a></li>
        <li><a href="" target="_blank">新闻标题</a></li>
        <li><a href="" target="_blank">新闻标题</a></li>
        <li><a href="" target="_blank">新闻标题</a></li>
      </ul>
    </div>
    <div class="hot_mark">
      <h2>热门标签</h2>
      <ul class="clear">
        <li><a href="" target="_blank">金融</a></li>
        <li><a href="" target="_blank">互联网金融</a></li>
        <li><a href="" target="_blank">理财</a></li>
        <li><a href="" target="_blank">大麦理财</a></li>
        <li><a href="" target="_blank">投资理财</a></li>
        <li><a href="" target="_blank">投资</a></li>
        <li><a href="" target="_blank">互金平台</a></li>
        <li><a href="" target="_blank">理财平台</a></li>
      </ul>
    </div>
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
</body>
</html>
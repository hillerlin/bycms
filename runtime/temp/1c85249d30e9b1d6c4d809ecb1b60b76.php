<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:67:"D:\wamp\www\bycms/application/index\view\model\document_detail.html";i:1504254102;s:59:"D:\wamp\www\bycms/application/index\view\public\header.html";i:1504254102;s:59:"D:\wamp\www\bycms/application/index\view\public\footer.html";i:1504254102;}*/ ?>
<!DOCTYPE html><html>	<head>		<meta charset="utf-8" />		<title><?php echo $meta_title; ?>_<?php echo C('WEB_SITE_TITLE'); ?></title>		<link rel="stylesheet" href="__CSS__/index.css" />  <script type="text/javascript" src="__COMMON__/jquery.min.js"></script>	<meta name="keywords" content="<?php echo C('KEYWORD'); ?>"/>	<meta name="description" content="<?php echo C('DESCRIPTION'); ?>"/>	</head>	<body><div class="topbar">	<div class="header_in">				<div class="fl left_link">					<a class="fs14"  onclick="setHomePage(this,'<?php echo site_url(); ?>');">设为首页</a>					<a class="fs14" onclick="AddFavorite('<?php echo site_url(); ?>', '<?php echo C('WEB_SITE_TITLE'); ?>')">加入收藏</a>				</div>				<script type="text/javascript">function setHomePage(obj,url){  try{    obj.style.behavior='url(#default#homepage)';    obj.setHomePage(url);  }catch(e){    if(window.netscape){     try{       netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");     }catch(e){       alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");     }    }else{    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");    } }}function AddFavorite( url,title) { try {   window.external.addFavorite(url, title); }catch (e) {   try {    window.sidebar.addPanel(title, url, "");  }   catch (e) {     alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请进入新网站后使用Ctrl+D进行添加");   } }}</script>				<div class="fr login_info">						<?php if(is_login()): ?>												<span class="fs14">	您好 <?php echo $UcenterMember['username']; ?>									，欢迎来到					yercms</span><a href="<?php echo url('User/logout'); ?>" class="tc_a">［退出］</a>					<?php else: ?>					<span class="fl">嗨，欢迎使用yercms</span>					<a class="fs14 register" href="<?php echo url('User/register'); ?>">免费注册</a>					<a class="fs14 login"  href="<?php echo url('User/login'); ?>">登录</a>					<?php endif; ?>				</div>			</div></div>		<div class="header in_width">					<div class="title_in">				<a href="<?php echo url('index/index'); ?>"><img src="<?php echo C('LOGO'); ?>" class="logo_img"/></a>				<div class="search_box">					<form method="post" action="<?php echo url('article/search'); ?>" class="search_frm" name="myform">					<div class="search_hot_words">								<a  onclick= "searchkey(this,1)" class="active" href="javascript:void(0);">新闻</a>						<a  onclick= "searchkey(this,2)" href="javascript:void(0);">相册</a>						<a  onclick= "searchkey(this,3)"  href="javascript:void(0);">下载</a>					</div>					<div class="seach_div">						<input type="text" name="keyword" class="search_input"/>					    <input type="hidden" name="model_id" value="1"/>						<span class="search_btn">搜索</span>					</div>					</form>			<script type="text/javascript">		function searchkey(obj,num){		   $(".search_hot_words a").removeClass("active");           $(obj).addClass("active");		   $("input[name='model_id']").val(num);		}		$(".search_btn").click(function(){    		 $(".search_frm").submit();    		    	});		</script>    				</div>			</div>		</div>		<div class="nav">			<ul class="nav_in">				<?php $__LIST__= parseChannel('sort asc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>			<li><a href="<?php echo get_url($vo['url']); ?>" target="<?php echo $vo['target']; ?>"><?php echo $vo['title']; ?></a></li>				<?php endforeach; endif; else: echo "" ;endif; ?>			</ul>		</div> 
		<div class="nav_bar in_width"><span>&gt;</span>
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
					<div class="article_content">
						<div class="ac_in_width article_title"><?php echo $info['title']; ?></div>
						<div class="ac_in_width article_desc">
							<span class="article_time"><?php echo date("Y-m-d h:i",$info['create_time']); ?></span>
							<span class="article_source">作者：<?php echo get_username($info['uid']); ?></span>
							<a class="article_activity" href="javascript:void(0)">我有话要说（<?php echo $info['comments']; ?>人参与）</a>
						</div>	
						
						<div class="article_p">
							<?php echo $info['content']; ?>

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
					<?php $__LIST__= parseRead(1,'view desc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
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
						<?php $__LIST__= parseRead(1,'id desc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
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
		<div class="footer">
	 <p><?php if(is_array($footer) || $footer instanceof \think\Collection || $footer instanceof \think\Paginator): $k = 0; $__LIST__ = $footer;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?>
			<a href="<?php echo url('about/cate?id='.$vo['id']); ?>"><?php echo $vo['title']; ?></a>  <?php if($k < 4): ?>| <?php endif; endforeach; endif; else: echo "" ;endif; ?></p>
	<p> Powered by <a href="http://www.yershop.com/" style="color:#f30" target="_blank">byCmsV1.0</a>  @yershop 2014-2017 </p>
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

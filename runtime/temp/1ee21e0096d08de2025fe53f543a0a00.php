<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:61:"E:\workspace\bycms/application/index\view\index\download.html";i:1504492747;s:60:"E:\workspace\bycms/application/index\view\public\header.html";i:1504492747;s:60:"E:\workspace\bycms/application/index\view\public\footer.html";i:1504492747;}*/ ?>
<!DOCTYPE html>

	<div class="nav_bar in_width">
			<a href="javascript:void(0);">首页</a>
			<span>&gt;</span>
			
		<span >下载</span>
		</div>

		<div class="content">
			<div class="content_in in_width">
				<div class="fl main_left">
			
					<div class="brd">
					    <a href="http://www.yershop.com/" > <img src="__IMG__/brd.png" width="850px"></a>
					</div>

					<!--图片新闻-->
					<div class="pic_news fl">
						<div class="pic_news_title">最新下载</div>
						<div class="pic_news_content">
							 <?php $__LIST__= parseRead(3,'id desc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
							<div class="pic_news_img_wrap">
								<a href="<?php echo url('article/detail?id='.$vo['id']); ?>"><img src="<?php echo get_cover_path($vo['cover_id']); ?>" style="height:85px;width:85px;"/></a>
								<a class="pic_news_link" href="<?php echo url('article/detail?id='.$vo['id']); ?>"><?php echo substr_cn($vo['title'],"39"); ?></a>
							</div>
						    <?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
					</div>
					<!--图片新闻end-->
					
					<!--四大模块-->
					<div class="four_module fl">
						
						<?php if(is_array($tree) || $tree instanceof \think\Collection || $tree instanceof \think\Paginator): $i = 0;$__LIST__ = is_array($tree) ? array_slice($tree,0,2, true) : $tree->slice(0,2, true); if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?> 
						<div class="module_wrapper">
							<div class="module_title">
								<span class="module_title_l"><?php echo $vo['title']; ?></span>
							    <a href="<?php echo url('article/lists?id='.$vo['id']); ?>" class="module_title_more">更多<<</a>
							</div>
							
							<ul class="module_news_list">
								  <?php if(is_array($vo['item']) || $vo['item'] instanceof \think\Collection || $vo['item'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['item'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($i % 2 );++$i;?>

								     <li><a  class="active" href="<?php echo url('article/detail?id='.$vo1['id']); ?>"><?php echo substr_cn($vo1['title'],"59"); ?>    </a>
								   <?php endforeach; endif; else: echo "" ;endif; ?>
							</ul> 
							  
		                 
						</div>
						 <?php endforeach; endif; else: echo "" ;endif; ?>
						
						
						
					</div>
					<!--四大模块end-->
					<div class="clear"></div>
				</div>
				<div class="fl content_right">
					
					<div class="rank_div">
						<div class="rank_title">排行
							
						</div>
						<ul class="rank_list">
						  <?php $__LIST__= parseRead(3,'view desc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			              <li><a href="<?php echo url('article/detail?id='.$vo['id']); ?>"><?php echo substr_cn($vo['title'],"49"); ?>    </a>
				         </li>
		                  <?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	
		<div class="footer">
	 <p><?php if(is_array($footer) || $footer instanceof \think\Collection || $footer instanceof \think\Paginator): $k = 0; $__LIST__ = $footer;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?>
			<a href="<?php echo url('about/cate?id='.$vo['id']); ?>"><?php echo $vo['title']; ?></a>  <?php if($k < 4): ?>| <?php endif; endforeach; endif; else: echo "" ;endif; ?></p>
	<p> Powered by <a href="http://www.yershop.com/" style="color:#f30" target="_blank">byCmsV1.0</a>  @yershop 2014-2017 </p>
	</div>
	</body>

	<script>
		$(function(){
			//轮播初始化
			var text = $($(".slider_imgwrap li").get(0)).find("span.img_title").text();
			$(".slider_mask .mask_title").text(text);
			var interval = setInterval(sliderImg,3000);
			//轮播点击页面跳转
			$(".slider_num").click(function(){
		        clearInterval(interval);
				sliderImg(this);
				interval = setInterval(sliderImg,3000);
			})
		});
		function sliderImg(obj){
			var index;
			if(obj != null){
				var $this = $(obj);
				var index = $this.index(".slider_num");
				showPageByIndex(index);
			}else{
				var index = $(".current").index(".slider_num");
				var max = $(".slider_num").length;
				var nextindex = (index +1)%max;
				showPageByIndex(nextindex);
			}
		}
		function showPageByIndex(index){
			$($(".slider_num").get(index)).addClass("current").siblings().removeClass("current");
			var width = $(".slider_imgwrap li img").width();
			var left = index * (-width);
			var text = $($(".slider_imgwrap li").get(index)).find("span.img_title").text();
			$(".slider_mask .mask_title").text(text);
			$(".slider_imgwrap").animate({"left":left + 'px'},1000);
		}

	</script>
</html>
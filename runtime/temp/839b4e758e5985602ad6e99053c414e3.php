<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:56:"E:\workspace\bycms/application/index\view\index\pic.html";i:1504492747;s:60:"E:\workspace\bycms/application/index\view\public\header.html";i:1504492747;s:60:"E:\workspace\bycms/application/index\view\public\footer.html";i:1504492747;}*/ ?>
<!DOCTYPE html>


		<div class="content">
			<div class="content_in in_width">
			<div class="photos">
				<div class="slide">
                 <div class="bgimg">
				<ul class="slider_imgwrap" style="left: -434px;">
				  <?php $__LIST__= parseSlide(0,'sort desc',8); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
				   <li>	
				 	<a href="<?php echo get_url($vo['url']); ?>"><img src="<?php echo get_cover_path($vo['cover_id']); ?>" class="logo_img"/></a>
					<span class="img_title"><?php echo $vo['title']; ?></span>

                   </li>
				   <?php endforeach; endif; else: echo "" ;endif; ?>	
				 </ul>  
				 </div>
      
				<ul class="num">
	              <?php $__LIST__= parseSlide(0,'sort desc',8); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<li class="slider_num <?php if($i == 1): ?>active<?php endif; ?>"><?php echo $i; ?></li>
				  <?php endforeach; endif; else: echo "" ;endif; ?>	
					
				</ul>  
		        </div>
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
				var index = $(".active").index(".slider_num");
				var max = $(".slider_num").length;
				var nextindex = (index +1)%max;
				showPageByIndex(nextindex);
			}
		}
		function showPageByIndex(index){
			$($(".slider_num").get(index)).addClass("active").siblings().removeClass("active");
			var width = $(".slider_imgwrap li img").width();
			var left = index * (-width);
			var text = $($(".slider_imgwrap li").get(index)).find("span.img_title").text();
			$(".slider_mask .mask_title").text(text);
			$(".slider_imgwrap").animate({"left":left + 'px'},1000);
		}

	</script>
	
				<div class="focus">
                <h4>热点关注</h4>
	           <ul> 
			   <?php $__LIST__= parseRead(2,'view desc',8); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
				 <li>	
				 <a href="<?php echo url('article/detail?id='.$vo['id']); ?>"><img src="<?php echo get_cover_path($vo['cover_id']); ?>" class="logo_img"></a><p><?php echo substr_cn($vo['title'],"12"); ?></p></li>
				 
				  <?php endforeach; endif; else: echo "" ;endif; ?>
				
					
				 </ul>  
				</div>
				
				<div class="fl content_right">
					
						
					<div class="rank_div" style="margin-top:0px;border: 1px solid #eee;">
						<div class="rank_title"  style="margin-top:0px;border-bottom: 1px solid #eee;">最新
							
						</div>
						<ul class="rank_list">
						 			           	<?php $__LIST__= parseRead(2,'id desc',10); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			              <li><a href="<?php echo url('article/detail?id='.$vo['id']); ?>"><?php echo substr_cn($vo['title'],"49"); ?>    </a>
				         </li>
		                   <?php endforeach; endif; else: echo "" ;endif; ?>
		                  						</ul>
					</div>
				</div>
				
              </div>

			  
			</div>
	<?php if(is_array($tree) || $tree instanceof \think\Collection || $tree instanceof \think\Paginator): $i = 0; $__LIST__ = $tree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?> 					
		<div class="category">  <h4><span class="tit"><?php echo $vo['title']; ?></span><span class="more"><a href="<?php echo url('article/lists?id='.$vo['id']); ?>">更多 >></a></span></h4>
		
		<ul> 
				<?php if(is_array($vo['item']) || $vo['item'] instanceof \think\Collection || $vo['item'] instanceof \think\Paginator): $k = 0; $__LIST__ = $vo['item'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($k % 2 );++$k;?> <li>	
				  <li><a href="<?php echo url('article/detail?id='.$vo1['id']); ?>" ><img src="<?php echo get_cover_path($vo1['cover_id']); ?>" class="logo_img"></a>	
			      <p><?php echo $vo['title']; ?></p>
				   </li>
				   <?php endforeach; endif; else: echo "" ;endif; ?>
				
					
				 </ul>  
		</div>	
		 <?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
					
	

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
				var index = $(".active").index(".slider_num");
				var max = $(".slider_num").length;
				var nextindex = (index +1)%max;
				showPageByIndex(nextindex);
			}
		}
		function showPageByIndex(index){
			$($(".slider_num").get(index)).addClass("active").siblings().removeClass("active");
			var width = $(".slider_imgwrap li img").width();
			var left = index * (-width);
			var text = $($(".slider_imgwrap li").get(index)).find("span.img_title").text();
			$(".slider_mask .mask_title").text(text);
			$(".slider_imgwrap").animate({"left":left + 'px'},1000);
		}

	</script>

	<div class="footer">
	 <p><?php if(is_array($footer) || $footer instanceof \think\Collection || $footer instanceof \think\Paginator): $k = 0; $__LIST__ = $footer;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?>
			<a href="<?php echo url('about/cate?id='.$vo['id']); ?>"><?php echo $vo['title']; ?></a>  <?php if($k < 4): ?>| <?php endif; endforeach; endif; else: echo "" ;endif; ?></p>
	<p> Powered by <a href="http://www.yershop.com/" style="color:#f30" target="_blank">byCmsV1.0</a>  @yershop 2014-2017 </p>
	</div>
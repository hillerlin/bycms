$(function(){
	initPage();
	window.onresize=function(){
		initPage();
	}
	bindEvent();
});

function initPage(){
	var contentWidth = $(window).width() -261;
	$(".content").width(contentWidth);
	$(".nav_tree").css("min-height",($(window).height() - 86) + 'px');
	$(".content").css("height",($(window).height() - 86) + 'px');
	$(".show_info_div").width(($(window).width()-261-17)/4 - 40);
	$(".right_text").css("width",(($(window).width()-261-17)/4 -90-40) + 'px');
	$(".charts").width($(window).width()-261 - 17 -40);
	$(".charts").height($(window).height() - 196);
	$(".charts_wrap").width($(window).width()-261 - 17 -40);
	if($(".nav_tree").height() > $(".content").height()){
		$(".content").css("min-height",$(".nav_tree").height());
		$(".charts_wrap").height($(".nav_tree").height() - 110);
	}
	$(".show_info").removeClass("none");
	drawCharts();
}

function bindEvent(){
	$(".p_menue").on('click',function(){
		if($(this).parent(".menue").hasClass("down")){
			$(this).parent(".menue").removeClass("down").addClass("up");
		}else{
			$(this).parent(".menue").removeClass("up").addClass("down");
		}
		calculateHeight();
	});
	$(".c_menue_item").on("click",function(){
		if(!$(this).hasClass("checked")){
			$(".nav_tree_list .c_menue_item").removeClass("checked");
			$(this).addClass("checked");
		}
	})
}
function calculateHeight(){
	var currentRightHeight = $(".content").height();
	var currentNavHeight = $(".nav_tree").height();
	if(currentRightHeight < currentNavHeight){
		$(".charts_wrap").height(currentNavHeight - 110);
	}
}

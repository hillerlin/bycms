$(function(){
    //幻灯片演示
    var _index = 0;
    var timer = null;
    var length = $(".slidebar").children("li").length;
    function autoplay(){
        timer=setInterval(function(){
            _index++;
            if(_index<length){
                $(".slidebar li").eq(_index).addClass("current").siblings().removeClass("current");
                $(".slide_box li").eq(_index).fadeIn(1000).siblings().fadeOut(1000);
            }else{_index=-1;}
        },3000);
    };
    autoplay();

    $(".slide_box li").eq(0).show().siblings().hide();
    $(".slidebar li").mouseover(function(){
        clearInterval(timer);
        var _index = $(this).index();
        $(this).addClass("current").siblings().removeClass("current");
        $(".slide_box li").eq(_index).fadeIn(1000).siblings("li").fadeOut(1000);
    }).mouseout(function(){
        autoplay();
    });
})
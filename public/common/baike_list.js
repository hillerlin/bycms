/*切换字母检索*/
$(function(){
  $('.baike_nav').find('a').on('click',function(){
    $('.baike_nav a').removeClass('on');
    $(this).addClass('on');
    var keyword = $(this).html().toLowerCase();
    if(keyword == 'all'){
      window.location.reload();
    }else{
      $.ajax({
        type: "post",
        cache: true, 
        async: false,
        url:'/index/baike/lists',
        data: {keyword:keyword},
        dataType: "json",
        success: function (data){
          if(data.statusCode == 0){
            var html = '';
            var list = data.list;
            if(list.length != 0){
              $.each(list,function(k,v){
                html += '<a href="/index/baike/detail?categoryId='+v.id+'" target="_blank">'+v.title+'</a>';
              });
              $('.baike_list').html(html);
            }else{
              $('.baike_list').html('<div class="lh30 ct">暂无相关数据！</div>');
            }
          }else{
            alert(data.message);
          }
        },error: function (XMLHttpRequest, textStatus, errorThrown) {
          alert('系统繁忙，请稍后再试！');
        }
      });
    }
    
  })
})
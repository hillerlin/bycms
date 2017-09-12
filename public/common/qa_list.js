/*切换翻页*/
$(function(){
  $('.qa_nav').find('a').on('click',function(){
    $('.qa_nav a').removeClass('on');
    $(this).addClass('on');
    var type = $(this).html();
    $('.qa_tips label').html(type);
    var page = 1;
    get_page_list(page,type);
  })
})
function get_page_list(page,type){
  var perpage = $('.totalRows').data('perpage');//每页条数
  var pagecount = Math.ceil(Number($('.totalRows').val())/perpage);
  $.ajax({
    type: "post",
    cache: true, 
    async: false,
    url:'/index/question/lists',
    data: {'page':page,'keyWord':type},
    dataType: "json",
    success: function (data){
      if(data.statusCode == 0){
        $('.qa_tips span').html(data.count);
        var html = '';
        var list = data.list;
        if(list.length != 0){
          $.each(list,function(k,v){
            html += '<li><h2><a href="/index/question/detail?id='+v.id+'">'+v.title+'</a></h2><p>'+v.seo_description+'</p><div class="qa_mark"><a href="javascript:;" target="_blank">'+v.category_title+'</a><label>浏览：'+v.view+'</label><span>'+formatDate_ymd(v.create_time)+'</span></div></li>';
          });
          $('.qa_list').html(html);
          /*分页模块*/
          paging(page,type,pagecount);
        }else{
          $('.qa_list').html('<div class="lh30 ct">暂无相关数据！</div>');
        }
      }else{
        alert(data.message);
      }
    },error: function (XMLHttpRequest, textStatus, errorThrown) {
      alert('系统繁忙，请稍后再试！');
    }
  });
};
//日期格式化
function formatDate_ymd(timestamp) {
  var t = new Date(timestamp * 1000);
  var year = t.getFullYear();
  var month = t.getMonth() + 1 < 10 ? "0" + (t.getMonth() + 1) : t.getMonth() + 1;
  var date = t.getDate() < 10 ? "0" + t.getDate() : t.getDate();
  return year + "-" + month + "-" + date;
}
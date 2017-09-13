/*切换翻页*/
function get_page_list(page,type){
  var title = $('.list_about .title').html();
  var perpage = $('.totalRows').data('perpage');//每页条数
  var pagecount = Math.ceil(Number($('.totalRows').val())/perpage);
  $.ajax({
    type: "post",
    cache: true, 
    async: false,
    url:'/index/article/labellist',
    data: {'page':page,'id':type},
    dataType: "json",
    success: function (data){
      if(data.statusCode == 0){
        var html = '';
        var list = data.list;
        if(list.length != 0){
          $.each(list,function(k,v){
              html += '<li><h2><a href="/index/article/detail?id='+v.id+'">'+v.title+'</a></h2><p>'+v.seo_description+'</p><div class="marks">'+formatDate_ymd(v.create_time)+'<span></span><a href="javascript:;" target="_blank">'+title+'</a><label>标签：</label><a href="javascript:;" target="_blank">'+v.description+'</a></div></li>';
          });
          $('.news_list').html(html);
          /*分页模块*/
          paging(page,type,pagecount);
        }else{
          $('.news_list').html('');
          $('.pageBox').html('<div class="bk20"></div><div class="lh30 ct">暂无相关数据！</div><div class="bk20"></div>');
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
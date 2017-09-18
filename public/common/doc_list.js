/*切换翻页*/
function get_page_list(page,type){
  var title = $('.list_about .title').html();
  var perpage = $('.totalRows').data('perpage');//每页条数
  var pagecount = Math.ceil(Number($('.totalRows').val())/perpage);
  $.ajax({
    type: "post",
    cache: true, 
    async: false,
    url:'/zixun/lists',
    data: {'page':page,'id':type},
    dataType: "json",
    success: function (data){
      if(data.statusCode == 0){
        var html1 = '';
        var html2 = '';
        var list = data.list;
        if(list.length != 0){
          $.each(list,function(k,v){
            if(k == 0||k == 1){
              html1 += '<div class="news_box ';
              if(k == 0) html1 += 'fl';
              else html1 += 'fr';
              html1 += '"><img src="/zixun/'+v.pic+'" width="360" height="240" alt=""><h2><a href="/zixun/detail/'+
                v.id+'">'+v.title+'</a></h2><p>'+v.seo_description+'</p><div class="marks"><span>'+
                formatDate_ymd(v.create_time)+'</span><a href="javascript:;" target="_blank">'+
                title+'</a><label>标签：</label><a href="javascript:;" target="_blank">'+v.description+'</a></div></div>';
            }else{
              html2 += '<li><h2><a href="/zixun/detail/'+v.id+'">'+v.title+'</a></h2><p>'+v.seo_description+'</p><div class="marks">'+formatDate_ymd(v.create_time)+'<span></span><a href="javascript:;" target="_blank">'+title+'</a><label>标签：</label><a href="javascript:;" target="_blank">'+v.description+'</a></div></li>';
            }
          });
          $('.news_top').html(html1);
          $('.news_list').html(html2);
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
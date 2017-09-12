/*分页设置参数：
    分页样式：/css/common/paging.css;
    分页盒子：.pageBox标签；
    数据参数：input配置数据总条数value属性及每页条数data-perpage属性；
    多类型切换tab：.pageType>a；
    数据默认类型：.pageType data-type="0"；
    分页请求方法：get_page_list(page,type);
*/
$(function(){
    /*数据分页初始化*/
    var perpage = $('.totalRows').data('perpage');//每页条数
    var pagecount = Math.ceil(Number($('.totalRows').val())/perpage);//页数=条数/每页条数
    var type = $('.pageType').data('type')?$('.pageType').data('type'):0;//数据分页类型
    if(pagecount > 1){
        var pagehtml ='<div class="LJ-pages"><ul><li class="noprev"><span title="已在首页">&lt;</span></li>';
        if(pagecount < 5){
            for(var pageIndex = 1; pageIndex <= pagecount; pageIndex++) {
                if(pageIndex == 1){
                    pagehtml += '<li class="active"><span>1</span></li>';
                }else{
                    pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + pageIndex + ',' + type + ')">' + pageIndex + '</a></li>';
                }
                if(pageIndex == pagecount){
                    if(pagecount == 2){
                        pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + pageIndex + ',' + type + ')" title="下一页">&gt;</a></li>';
                    }else{
                        pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + (pageIndex-1) + ',' + type + ')" title="下一页">&gt;</a></li>';
                    }
                    pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + pageIndex + ',' + type + ')" title="末页">&gt;&gt;</a></li>';
                }
            }
        }else{
           for(var pageIndex = 1; pageIndex <= 6; pageIndex++) {
                if(pageIndex == 1){
                    pagehtml += '<li class="active"><span>1</span></li>';
                }else if(pageIndex == 6-1){
                    pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(2,0)" title="下一页">&gt;</a></li>';
                }else if(pageIndex == 6){
                    pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + pagecount + ',' + type + ')" title="末页">&gt;&gt;</a></li>';
                }else{
                    pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + pageIndex + ',' + type + ')">' + pageIndex + '</a></li>';
                }
            } 
        }
        pagehtml += '</ul></div>';
        $('.pageBox').html(pagehtml);
    }else{
        $('.pageBox').html('');
    }

    //分页类型切换
    $(".pageType").find("a").each(function(index,element) {
        $(element).on("click",function(){
            $(".pageType").find("a").removeClass("on");
            $(this).addClass("on");
            $(".pageType").data('type',index);
            var page = 1;
            var type = $('.pageType').data('type');
            get_page_list(page,type);
        });
    });
});
/*分页切换*/
function paging(page,type,pagecount){
    if(pagecount > 1){
        var pagehtml ='<div class="LJ-pages"><ul>';
        if(page == 0 || page == 1){
            page == 1;
            pagehtml += '<li class="noprev"><span title="已在首页">&lt;</span></li>';
        }else if(page == 2){
            pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + (page - 1) + ',' + type + ')" title="上一页">&lt;</a></li>';
        }else{
            pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(1, ' + type + ')" title="首页">&lt;&lt;</a></li>'+
                '<li><a href="javascript:;" onclick="javascript:get_page_list(' + (page - 1) + ',' + type + ')" title="上一页">&lt;</a></li>';
        }
        for(var pageIndex = 1; pageIndex <= pagecount; pageIndex++) {
            if(page >= 3 && page - 2 > pageIndex){continue;}
            if(page + 2 >= pageIndex){
                if(page == pageIndex){
                    pagehtml += '<li class="active"><span>' + pageIndex + '</span></li>';
                }else{
                    pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + pageIndex + ',' + type + ')">' + pageIndex + '</a></li>';
                }
            }
        }
        if (page < pagecount) {
            pagehtml += '<li><a href="javascript:;" onclick="javascript:get_page_list(' + (page + 1) + ',' + type + ')" title="下一页">&gt;</a></li>'+
                '<li><a href="javascript:;" onclick="javascript:get_page_list(' + pagecount + ',' + type + ')" title="末页">&gt;&gt;</a></li>';
        }
        if (page == pagecount) {
            pagehtml += '<li class="nonext"><span title="已在末页">&gt;&gt;</span></li>';
        }
        pagehtml += '</ul></div>';
        $('.pageBox').html(pagehtml);
    }else{
        $('.pageBox').html('');
    }
}
/*parfait*
 *                    .::::.
 *                  .::::::::.
 *                 :::::::::::
 *             ..:::::::::::'
 *           '::::::::::::'
 *             .::::::::::
 *        '::::::::::::::..
 *             ..::::::::::::.
 *           ``::::::::::::::::
 *            ::::``:::::::::'        .:::.
 *           ::::'   ':::::'       .::::::::.
 *         .::::'      ::::     .:::::::'::::.
 *        .:::'       :::::  .:::::::::' ':::::.
 *       .::'        :::::.:::::::::'      ':::::.
 *      .::'         ::::::::::::::'         ``::::.
 *  ...:::           ::::::::::::'              ``::.
 * ```` ':.          ':::::::::'                  ::::..
 *                    '.:::::'                    ':'````..
 */

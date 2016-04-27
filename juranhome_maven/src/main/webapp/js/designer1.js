//The mouse follow effect
$(function () {
    var initDiv = function () {
        $(".city_left li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
        });
    };
    initDiv();

    //shuffling animation
    var  num =0;
    var selClass;
    $(".simpleTabs").mouseover(function(){
        var selclass=$(this).attr("id");
        selClass=selclass;
        $("#"+selclass).children(".arrows").addClass("ggg");

        $("#"+selclass+' .control a').mouseover(function(event) {

            $(this).addClass('now').siblings().removeClass('now');
            var index = $(this).index();
            $("#"+selclass+' .design_show ul li').eq(index).stop().fadeIn(0).siblings().stop().fadeOut(200);
            num = index;
        });
    });

    $(".next").click(function(event) {
        num++;
        if(num >3){
            num = 0;
        }
        $("#"+selClass+" .control a").eq(num).addClass("now").siblings().removeClass('now');
        $("#"+selClass+" .design_show ul li").eq(num).stop().fadeIn(0).siblings().stop().fadeOut(200);
    });

    $(".prev").click(function() {

        num--;
        if(num < 0){
            num = 3;
        }
        $("#"+selClass+" .control a").eq(num).addClass("now").siblings().removeClass("now");
        $("#"+selClass+" .design_show ul li").eq(num).stop().fadeIn(0).siblings().stop().fadeOut(200);
    });

    $(".simpleTabs").mouseleave(function(){
        $(this).children(".tabs .arrows").removeClass('ggg');
        $("#"+selClass+" .control a").eq(0).addClass("now").siblings().removeClass("now");
        $("#"+selClass+" .design_show ul li").eq(0).stop().fadeIn(0).siblings().stop().fadeOut(200);
    });

    //Back to top
    $(function(){
        $(window).scroll(function () {
            var scrollHeight = $(document).height();
            var scrollTop = $(window).scrollTop();
            scrollTop > 900 ? $("#scrollUp").fadeIn(200).css("display","block") : $("#scrollUp").fadeOut(200);
        });
        $('#scrollUp').click(function (e) {
            $('html,body').animate({ scrollTop:0});
        });

    });

   $(".tcdPageCode").createPage({
        pageCount:6,
        current:1,
        backFn:function(p){
            console.log(p);
        }
    });
});

$(function(){
	$('.checkon').hide();
		$(document).on('click','.btnsq',function(){
			 if($(this).html() == '查看详情'){
		            $(this).closest('li').find('.control').css('background','#f5f5f5');
		            $(this).html('收起').css({"color":"#1395f2"});
		            $(this).closest('li').find('.checkon').stop().slideDown();
		        }else{
		            $(this).closest('li').find('.control').css('background','#fff');
		            $(this).html('查看详情');
		            $(this).closest('li').find('.checkon').stop().slideUp();
		        }
		});
    /*news-center-notice news-center-public toggle show*/
    $(".news-center-public").hide();
    $(".table-list-refresh").find('li').click(function(){
        var index= $(this).attr("id");
        $(this).addClass('active').siblings().removeClass('active');
        if(index==1){
            $(".news-center-notice").show();
            $(".news-center-public").hide();
        }else{
            $(".news-center-notice").hide();
            $(".news-center-public").show();
        }
    });
//    var isShow=true;
//   // $(".choiceall").click(function(){
//    $(".messagenav .fa-reorder").click(function(){
//    
//    	if(isShow){
//    		 $(this).find("a").html('全选');
//    		 $(":input[type='checkbox']").prop("checked",true);
//    		isShow=false;
//    		
//    	}else{
//    		 $(this).find("a").html('全选');
//    		isShow=true;
//    		$(":input[type='checkbox']").prop("checked",false);
//    		
//    	}
//    	
//    });
});
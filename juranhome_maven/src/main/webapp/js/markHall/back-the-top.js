
$(function(){
	$('.find-designer-container-arrow-top').hide();
    $(window).scroll(function(e) {
    	
        if($(window).scrollTop() > 0){
            $('.find-designer-container-arrow-top').show();
        }else{
            $('.find-designer-container-arrow-top').hide();
        }
    });

    
    $('.find-designer-container-arrow-top').click(function(e) {
        $('html,body').stop().animate({'scrollTop':'0'},500);
    });

})
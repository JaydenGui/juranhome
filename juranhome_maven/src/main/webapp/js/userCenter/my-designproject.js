
$(function(){
	/*project-design normal-design toggle show*/
    $(".normal-design").hide();
    $(".money-record").find('li').click(function(){
        var index= $(this).attr("id");
        $(this).addClass('current').siblings().removeClass('current');
        if(index==1){
            $(".normal-design").hide();
            $(".project-design").show();
        }else{
            $(".normal-design").show();
            $(".project-design").hide();
        }
    });
    
   
 
});
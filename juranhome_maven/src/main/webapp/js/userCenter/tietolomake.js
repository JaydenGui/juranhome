$(".registerform:first").Validform();
$(function(){
    $(".registerform:last,.registerform:first").Validform({
        tiptype:2,
        ajaxPost:true,
        callback:function(data){
            //{"info":"demo info","status":"y"}
            if(data.status=="y"){
                setTimeout(function(){
                    $.Hidemsg(); 
                },2000);
            }
        }
    });
 
});


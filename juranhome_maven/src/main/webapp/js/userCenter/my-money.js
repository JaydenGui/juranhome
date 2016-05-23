
$(function(){
	/*withdrawal-record transaction-record toggle show*/
    $(".withdrawal-record").hide();
    $(".money-record").find('li').click(function(){
        var index= $(this).attr("id");
        $(this).addClass('current').siblings().removeClass('current');
        if(index==1){
            $(".transaction-record").show();
            $(".withdrawal-record").hide();
        }else{
            $(".transaction-record").hide();
            $(".withdrawal-record").show();
        }
    });
    /*Cash check */
    var name=/^[\u4e00-\u9fa5]{2,10}$/;
    var num=/^\d{19}$/;
    ok1=true;
    ok2=true;
    ok3=true;
    ok4=true;
    $("#lastname").focus(function(){
    	$(this).attr('style','border: 1px #ddd solid');
        $(this).next().text('请输入开户人姓名').removeClass('state1 state3 state4').addClass('state2');
    }).blur(function(){
        if(!name.test($(this).val())){
        	ok1=false;
            $(this).next().text('请输入2-10个汉字').removeClass('state1 state4').addClass('state3');
            $(this).attr('style','border: 1px red solid');
        }else{
            ok1=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            $(this).attr('style','border: 1px #ddd solid');
        }

    });
    $('select[name="bank_name"]').focus(function(){
    	$(this).attr('style','border: 1px #ddd solid');
    	 $(this).next().text('');
    }).blur(function(){
        if($(this).val().length>0){
        	 ok4=true;
        	 $(this).attr('style','border: 1px #ddd solid');
        }else{
        	ok4=false;
        	$(this).attr('style','border: 1px red solid');
        }
    });
    var bankname=/^[\u4e00-\u9fa5]{2,32}$/;
    $("#bankname").focus(function(){
    	$(this).attr('style','border: 1px #ddd solid');
        $(this).next().text('请输入支行名称').removeClass('state1 state3 state4').addClass('state2');
    }).blur(function(){
        if(!bankname.test($("#bankname").val())&&$("#bankname").val().length>2){
            $(this).next().text('请输入2-32个字符').removeClass('state1 state4').addClass('state3');
            ok2=false;
            $(this).attr('style','border: 1px red solid');
        }else{
            ok2=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            $(this).attr('style','border: 1px #ddd solid');
        }
    });
    $("#banknum").focus(function(){
    	$(this).attr('style','border: 1px #ddd solid');
        $(this).next().text('请输入银行卡号').removeClass('state1 state3 state4').addClass('state2');
    }).blur(function(){
        if(!num.test($(this).val())){
            $(this).next().text('请输入19位数字').removeClass('state1 state4').addClass('state3');
            ok3=false;
            $(this).attr('style','border: 1px red solid');
        }else{
            ok3=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            $(this).attr('style','border: 1px #ddd solid');
        }

    });
    
    
    //The submit button, all validation through before submission
    $('.button').click(function(){
    	if(ok1 && ok3 && ok2&&ok4){
            if($('#lastname').val().length>0&&$('#banknum').val().length>0&&$('#bankname').val().length>0&&$('#bank').val().length>0){
            	
            }else{
                alert('请将表单填写完整');
            	return false;
            }
        }
    });
});
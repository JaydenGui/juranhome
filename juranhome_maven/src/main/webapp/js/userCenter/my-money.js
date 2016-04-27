
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
    var num=/^\d{16}|\d{19}$/;
    ok1=true;
    ok2=true;
    ok3=true;
    ok4=true;
    $("#lastname").focus(function(){
        $(this).next().text('请输入开户人姓名').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(!name.test($(this).val())){
        	ok1=false;
            $(this).next().text('请输入正确字符').removeClass('state1').addClass('state3');
        }else{
            ok1=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
        }

    });
    $('select[name="bank_name"]').focus(function(){
    }).blur(function(){
        if($(this).val().length>0){
        	 ok4=true;
        	 $(this).attr('style','border: 1px #ddd solid');
        }else{
        	ok4=false;
        	$(this).attr('style','border: 1px red solid');
        }
    });
    $("#bankname").focus(function(){
        $(this).next().text('请输入支行名称').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(!name.test($(this).val())){
            $(this).next().text('请输入正确字符').removeClass('state1').addClass('state3');
            ok2=false;
        }else{
            ok2=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
        }
    });
    $("#banknum").focus(function(){
        $(this).next().text('请输入银行卡号').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(!num.test($(this).val())){
            $(this).next().text('请输入正确字符').removeClass('state1').addClass('state3');
            ok3=false;
        }else{
            ok3=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
        }

    });
    
    
    //The submit button, all validation through before submission
    $('.button').click(function(){
    	if(ok1 && ok3 && ok2&&ok4){
            if($('#lastname').val().length>0&&$('#banknum').val().length>0&&$('#bankname').val().length>0&&$('bank').val().length>0){
            	
            }else{
                alert('请将表单填写完整');
            	return false;
            }
        }else{
            alert('请将表单填写完整');
            return false;
        }
    });
});
//Verify Registration

//Verify the mobile phone number 验证手机号
function checkmail(){
    var phone=document.getElementById("youremail").value;
    var pattern = /^1[34578]\d{9}$/;
    if (!pattern.test(phone)) {
        divmail.innerHTML="<font class='tips_false'>输入的格式错误</font>";
    }
    else {
        divmail.innerHTML="<font class='tips_true'>输入正确</font>";
    }
    //console.log('check mobile phone ' + phone + ' failed.');
    return false;
}

function kmail(){
    var mail=document.getElementById("emailm").value;
    var tern = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.(?:com|cn)$/;
    if (!tern.test(mail)) {
        dmail.innerHTML="<font class='tips_false'>输入的格式错误</font>";
    }
    else {
        dmail.innerHTML="<font class='tips_true'>输入正确</font>";
    }
    //console.log('check mobile phone ' + phone + ' failed.');
    return false;
}

//user name 用户名
//function checkna(){
//    var na=document.getElementById("yourname").value;
//    if( na.length <4 || na.length >12)
//    {
//        divname.innerHTML='<font class="tips_false">长度是4~12个字符</font>';
//
//    }else{
//        divname.innerHTML='<font class="tips_true">输入正确</font>';
//
//    }
//}


//Verify Password 验证密码 
function checkna(){
    var na=document.getElementById("yourpass").value;
    var flagZM=false ;
    var flagSZ=false ;
    var flagQT=false ;
    if(na.length<6 || na.length>12){
        divpassworda.innerHTML='<font class="tips_false">密码不少于6位的字母数字组成</font>';
    }else
    {
        for(i=0;i < na.length;i++)
        {
            if((na.charAt(i) >= 'A' && na.charAt(i)<='Z') || (na.charAt(i)>='a' && na.charAt(i)<='z'))
            {
                flagZM=true;
            }
            else if(na.charAt(i)>='0' && na.charAt(i)<='9')
            {
                flagSZ=true;
            }else
            {
                flagQT=true;
            }
        }
        if(!flagZM||!flagSZ||flagQT){
            divpassworda.innerHTML='<font class="tips_false">密码必须是字母数字的组合</font>';
            passwor.innerHTML='<font class="tips_false">密码必须是字母数字的组合</font>';
        }else{
            divpassworda.innerHTML='<font class="tips_true">输入正确</font>';
            passwor.innerHTML='<font class="tips_true">输入正确</font>';
        }
    }
}

//检查两次输入密码是否一样
function checkpsd1(){
    var yourpass=document.getElementById("yourpass").value;
    var pass=document.getElementById("pass").value;
    if(pass==yourpass&&pass!=""&&pass!=""){
    	divpasswordb.innerHTML="<font class='tips_true'>输入正确</font>";
    	passworb.innerHTML="<font class='tips_true'>输入正确</font>";
        return true   
    }else if(pass==""&&yourpass==""){
    	divpasswordb.innerHTML="<font class='tips_false'>密码不能为空</font>";
    	passworb.innerHTML="<font class='tips_false'>密码不能为空</font>";
        return false;
    }else{
    	divpasswordb.innerHTML="<font class='tips_false'>两次密码输入不一致</font>";
    	passworb.innerHTML="<font class='tips_false'>两次密码输入不一致</font>";
        return false;
    }
}


var count=60;
var  types=1;
//Fast usertching compatibility 用户切换
$(function () {
    var initDiv = function () {
        $(".handover li").click(function () {
        	count=0;
            $(this).addClass("customer").siblings().removeClass("customer");
            //var type=$(this).attr("id");
           // types=type;
            //$("#type").val(type);
            var islogze=$("#loginze").val();
        	$(".contact_zhuce ul li input").val("");
            if(islogze==2){
            	alert();
            	$("#dmail").html("输入的邮箱格式错误");
            	$("#divmail").html("请输入长度为11位的手机号码");
            	$("#divname").html("请输入长度为4~12个字符的用户名");
            	$("#divpassword1").html("至少由字母和数字组成6个字符的密码");
            	$(".hyanzm").html("&nbsp;&nbsp;&nbsp;&nbsp;");
            	$("#getting").val("点击获取验证码");
            }else{
            	$("#divmail").html("请输入手机号");
            	$("#divpassword1").html("请输入密码");
            }
        });
    };
    initDiv();
        
    if(!placeholderSupport()){
        $('[placeholder]').focus(function() {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        }).blur(function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }).blur();
    };
    
   $('#getting').click(function(){
	 count=60;
	 verificationcode();
   });
    
})

function placeholderSupport() {
    return 'placeholder' in document.createElement('input');
}

function verificationcode(){
	index=types;
	var btn = $('#getting');
	var resend = setInterval(function(){
	count--;
    if (count > 0){
        btn.val(count+"s后重新发送验证码");
        //alert();
        $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
    }else{
    	 clearInterval(resend);
    	 btn.val("点击获取验证码").removeAttr('disabled style');
    }
   }, 1000);
  btn.attr('disabled',true).css('cursor','not-allowed');
}


$(window).resize(function(){
    $("#center").css({
        position: "absolute",
        left: ($(window).width() - $("#center").outerWidth())/2,
        top: ($(window).height() - $("#center").outerHeight())/2
    });
});



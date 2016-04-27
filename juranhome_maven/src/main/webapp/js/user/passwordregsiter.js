//Verify Registration

//Verify the mobile phone number 验证手机号
function mobilephone(){
    var phone=document.getElementById("mphone").value;
    var pattern = /^1[34578]\d{9}$/;
    if (!pattern.test(phone)) {
        mmphone.innerHTML="<font class='tips_false'>输入的格式错误</font>";
    }
    else {
        mmphone.innerHTML="<font class='tips_true'>输入正确</font>";
    }
    //console.log('check mobile phone ' + phone + ' failed.');
    return false;
}

//validate e-mail address 验证邮箱
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
function username(){
    var na=document.getElementById("username").value;
    if( na.length <4 || na.length >12)
    {
        uusername.innerHTML='<font class="tips_false">长度是4~12个字符</font>';

    }else{
        uusername.innerHTML='<font class="tips_true">输入正确</font>';

    }
}
//Verify Password 验证密码 
    function verifypassword(){
        var na=document.getElementById("verifypasswor").value;
        var flagZM=false ;
        var flagSZ=false ;
        var flagQT=false ;
        if(na.length<6 || na.length>12){
            passwor.innerHTML='<font class="tips_false">密码不少于6位的字母数字组成</font>';
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
                passwor.innerHTML='<font class="tips_false">密码必须是字母数字的组合</font>';
            }else{
                passwor.innerHTML='<font class="tips_true">输入正确</font>';
            }
        }
    }

    //verifypassword 检查两次输入密码是否一样
    function verifypasswordtow(){
        var yourpass=document.getElementById("verifypasswor").value;
        var pass=document.getElementById("verifypasswordt").value;
        if(pass==yourpass&&pass!=""&&pass!=""){
            verifyp.innerHTML="<font class='tips_true'>输入正确</font>";
            return true
        }else if(pass==""&&yourpass==""){
            verifyp.innerHTML="<font class='tips_false'>密码不能为空</font>";
            return false;
        }else{
            verifyp.innerHTML="<font class='tips_false'>两次密码输入不一致</font>";
            return false;
        }
    }











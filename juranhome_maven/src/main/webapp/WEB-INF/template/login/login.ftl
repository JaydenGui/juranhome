<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html id="ng-app" ng-app="app">
<head lang="en" >
    <meta charset="UTF-8">
    <title>login</title>
	<#--include commonhead-->
    <#include '/common/commonhead.html'/>
    <script src="${baseUrl}/angularjs/login/login-app.js" ></script>
    
    <link rel="stylesheet" href="${baseUrl}/css/regsiter.css">
    <link rel="stylesheet" href="${baseUrl}/css/login.css">
    <script src="${baseUrl}/js/user/regsiter.js" ></script>
</head>
<body  ng-controller="ctrl">
<input type="hidden" id="loginze" value="1"/>

<div class="regsiter_bj">
    <div class="regsiter_top">
        <ul class="reg_logo">
            <a href="${baseUrl}/"><li class="shlo"><img src="${baseUrl}/images/login/logina_03.png"></li></a>
            <a href="${baseUrl}/"><li class="shlo"><img src="${baseUrl}/images/login/logina_05.png"></li></a>
            <a href="${baseUrl}/"><li class="shlo"><img src="${baseUrl}/images/login/logina_07.png"></li></a>
        </ul>
    </div>
    <div class="regsitera">
        <ul class="handover">
                    <p class="handover">欢迎来到设计家</p> 
        </ul>
         <ul class="handover">
            <li class="customer" id="1" ng-click="Login(1)" >消费者</li>
            <li class="constructor" id="2" ng-click="Login(2)">设计师</li>
        </ul>
        <div class="contact_zhuce">
            <form name="form1" method="post"  ng-submit="submit($event)">
                <input type="hidden" id="type" name="type" ng-model="userLoginType">
                <ul>
                    <li>
                        <input type="text" id="youremail" placeholder="邮箱/手机号码/用户名"  ng-model="phone"/>
                        <span class="tips" id="divmail"></span>
                    </li>
                    <li>
                        <input type="password" name="yourpass" placeholder="密码" maxlength="12" onBlur="checkpsd1()" required autocomplete="off" ng-model="password"/>
                        <span class="tips" id="divpassword1"></span>
                    </li>
                    <div ng-class="{hint:isError==1,hintnone:isError==2}"><p>您输入的帐号或密码有误,请重新输入!</p><div>
                    <div class="yuedu">
                    	<input type="checkbox" ng-model="rememberPwd"><span  id="remembe" class="xieyi">记住密码</span>
	                    <input type="checkbox" ng-model="rememberPwd1"><span class="xieyi">十天内免登陆</span>
                    </div>
                </ul>
                <b class="btn"><input type="submit" value="立即登录" ng-disabled="!phone||!password" /></b>
            </form>
            <div class="other">
                <span></span>
                <p class="employ">使用其它方式登录</p>
                <span></span>
       </div>
            <div class="third-party">
                <a href="https://graph.qq.com/oauth2.0/authorize?client_id=100570502&response_type=code&scope=get_user_info&redirect_uri=&state=juran"><img src="${baseUrl}/images/login/logina_13.png"></a>
                <a href="https://open.weixin.qq.com/connect/qrconnect?appid=wx43be110e367dc022&redirect_uri=http://www.juran.cn/member/qqlogin.htm&response_type=code&scope=snsapi_login&state=3d6be0a4035d839573b04816624a415e#wechat_redirect"><img src="${baseUrl}/images/login/logina_15.png"></a>
                <a href="https://api.weibo.com/oauth2/authorize?client_id=2356002792&response_type=code&redirect_uri="><img src="${baseUrl}/images/login/logina_17.png"></a>
                <a href="https://api.weibo.com/oauth2/authorize?client_id=2356002792&response_type=code&redirect_uri="><img src="${baseUrl}/images/login/logina_19.png"></a>
            </div>
            <div class="pass">
            	<a class="emem" href="${baseUrl}/login/register">注册账号</a>
            	<a class="ememb"target="_blank" href="${baseUrl}/login/steone">忘记密码?</a>
            </div>
        </div>
    </div>
    <#include '/common/loginfooter.html'/>
</div>
</body>
</html>
